void VCH263EncoderRegister()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDF99D0], (const void *)*MEMORY[0x24BDBD268]);
  VTRegisterVideoEncoderWithInfo();
  CFRelease(Mutable);
}

uint64_t VCH263VideoEncoder_CreateInstance(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  VTVideoEncoderGetClassID();
  v4 = CMDerivedObjectCreate();
  FigSignalErrorAt3();
  *a3 = 0;
  return v4;
}

uint64_t VCH263VideoEncoder_Finalize()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  const void *v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = DerivedStorage;
  v2 = (_QWORD *)(DerivedStorage + 24);
  if (*(_QWORD *)(DerivedStorage + 24))
  {
    result = (uint64_t)H263QT_KillSharedGlobals((void **)(DerivedStorage + 24));
    if ((_DWORD)result)
      return result;
    *v2 = 0;
  }
  if (*(_QWORD *)(v1 + 16))
  {
    result = KillInstanceGlobals((uint64_t *)(v1 + 16));
    if ((_DWORD)result)
      return result;
    *(_QWORD *)(v1 + 16) = 0;
  }
  MEM_Dispose(*(void **)(v1 + 144));
  *(_QWORD *)(v1 + 144) = 0;
  v4 = *(const void **)(v1 + 152);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(v1 + 152) = 0;
  }
  *(_QWORD *)v1 = 0;
  result = FigFormatDescriptionRelease();
  *(_QWORD *)(v1 + 8) = 0;
  return result;
}

__CFString *VCH263VideoEncoder_CopyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<VCH263VideoEncoder %p>"), a1);
  return Mutable;
}

uint64_t VCH263VideoEncoder_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, _QWORD *a4)
{
  uint64_t DerivedStorage;
  int v8;
  const __CFAllocator *v9;
  CFNumberType v10;
  void *v11;
  void *v12;
  uint64_t result;
  double v14;
  CFTypeRef *v15;
  int v16;
  double valuePtr;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9210]))
  {
    v8 = *(_DWORD *)(DerivedStorage + 204) / 8;
LABEL_5:
    LODWORD(valuePtr) = v8;
    v9 = a3;
    v10 = kCFNumberSInt32Type;
LABEL_6:
    v11 = CFNumberCreate(v9, v10, &valuePtr);
LABEL_7:
    v12 = v11;
LABEL_8:
    result = 0;
    *a4 = v12;
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9208]))
  {
    v8 = *(_DWORD *)(DerivedStorage + 204);
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9260]))
  {
    v14 = 1000.0 / (double)*(int *)(DerivedStorage + 208);
LABEL_11:
    valuePtr = v14;
    v9 = a3;
    v10 = kCFNumberDoubleType;
    goto LABEL_6;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF92C8]))
  {
    v8 = *(_DWORD *)(DerivedStorage + 212);
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9350]))
  {
    v8 = *(_DWORD *)(DerivedStorage + 216);
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9258]))
  {
    v14 = *(double *)(DerivedStorage + 224);
    goto LABEL_11;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9200]))
  {
    v15 = (CFTypeRef *)MEMORY[0x24BDBD270];
    if (!*(_BYTE *)(DerivedStorage + 232))
      v15 = (CFTypeRef *)MEMORY[0x24BDBD268];
LABEL_21:
    v11 = (void *)CFRetain(*v15);
    goto LABEL_7;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9330]))
  {
    v16 = *(_DWORD *)(DerivedStorage + 236);
    if (v16 == 45)
    {
      v15 = (CFTypeRef *)MEMORY[0x24BDF96A0];
    }
    else
    {
      if (v16 != 10)
      {
        v12 = 0;
        goto LABEL_8;
      }
      v15 = (CFTypeRef *)MEMORY[0x24BDF9698];
    }
    goto LABEL_21;
  }
  return 4294954396;
}

uint64_t VCH263VideoEncoder_SetProperty(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t DerivedStorage;
  CFTypeID TypeID;
  uint64_t result;
  int v8;
  CFTypeID v9;
  CFTypeID v10;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  Boolean v15;
  CFTypeID v16;
  int v17;
  double valuePtr;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9210]))
  {
    if (a3)
    {
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        result = 0;
        v8 = 8 * LODWORD(valuePtr);
LABEL_10:
        *(_DWORD *)(DerivedStorage + 204) = v8;
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9208]))
  {
    if (a3)
    {
      v9 = CFNumberGetTypeID();
      if (v9 == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        result = 0;
        v8 = LODWORD(valuePtr);
        goto LABEL_10;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9260]))
  {
    if (a3)
    {
      v10 = CFNumberGetTypeID();
      if (v10 == CFGetTypeID(a3))
      {
        valuePtr = 0.0;
        CFNumberGetValue(a3, kCFNumberDoubleType, &valuePtr);
        result = 0;
        *(_DWORD *)(DerivedStorage + 208) = (int)(1000.0 / valuePtr);
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF92C8]))
  {
    if (a3)
    {
      v11 = CFNumberGetTypeID();
      if (v11 == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        result = 0;
        *(_DWORD *)(DerivedStorage + 212) = LODWORD(valuePtr);
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9350]))
  {
    if (a3)
    {
      v12 = CFNumberGetTypeID();
      if (v12 == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        result = 0;
        *(_DWORD *)(DerivedStorage + 216) = LODWORD(valuePtr);
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9258]))
  {
    if (a3)
    {
      v13 = CFNumberGetTypeID();
      if (v13 == CFGetTypeID(a3))
      {
        valuePtr = 0.0;
        CFNumberGetValue(a3, kCFNumberDoubleType, &valuePtr);
        result = 0;
        *(double *)(DerivedStorage + 224) = valuePtr;
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9200]))
  {
    if (a3)
    {
      v14 = CFBooleanGetTypeID();
      if (v14 == CFGetTypeID(a3))
      {
        v15 = CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDBD270]);
        result = 0;
        *(_BYTE *)(DerivedStorage + 232) = v15;
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9330]))
    return 4294954396;
  if (!a3)
  {
    result = 0;
    *(_DWORD *)(DerivedStorage + 236) = 0;
    return result;
  }
  v16 = CFStringGetTypeID();
  if (v16 != CFGetTypeID(a3))
    return FigSignalErrorAt3();
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDF96A0]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDF9698]))
    {
      result = 0;
      v17 = 10;
      goto LABEL_47;
    }
    return FigSignalErrorAt3();
  }
  result = 0;
  v17 = 45;
LABEL_47:
  *(_DWORD *)(DerivedStorage + 236) = v17;
  return result;
}

uint64_t VCH263VideoEncoder_StartSession(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t DerivedStorage;
  uint64_t v8;
  int v9;
  char v10;
  int v11;
  _BOOL4 v13;
  BOOL v14;
  int v15;
  char v16;
  int v17;
  const void *v18;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v20;
  CFMutableArrayRef v21;
  __CFArray *v22;
  CFNumberRef v23;
  CFNumberRef v24;
  uint64_t *v25;
  __CFArray *v26;
  int valuePtr;

  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v8 = DerivedStorage;
  valuePtr = 2033463856;
  *(_QWORD *)DerivedStorage = a2;
  v9 = 288;
  v10 = 3;
  v11 = 352;
  if ((int)a3 <= 352 && SHIDWORD(a3) <= 288 && (int)a3 <= 176)
  {
    v13 = (int)a3 > 128 || SHIDWORD(a3) > 96;
    v14 = !v13;
    if (v13)
      v15 = 176;
    else
      v15 = 128;
    if (v14)
      v16 = 1;
    else
      v16 = 2;
    if (v14)
      v17 = 96;
    else
      v17 = 144;
    if (SHIDWORD(a3) <= 144)
      v11 = v15;
    else
      v11 = 352;
    if (SHIDWORD(a3) <= 144)
      v10 = v16;
    else
      v10 = 3;
    if (SHIDWORD(a3) <= 144)
      v9 = v17;
    else
      v9 = 288;
  }
  *(_DWORD *)(DerivedStorage + 40) = v11;
  *(_DWORD *)(DerivedStorage + 44) = v9;
  v18 = *(const void **)(DerivedStorage + 152);
  if (v18)
    CFRelease(v18);
  *(_QWORD *)(v8 + 152) = a4;
  if (a4)
    CFRetain(a4);
  FigFormatDescriptionRelease();
  *(_QWORD *)(v8 + 8) = 0;
  *(_BYTE *)(v8 + 232) = 1;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return 4294954392;
  v20 = Mutable;
  v21 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v21)
  {
    v26 = v20;
LABEL_40:
    CFRelease(v26);
    return 4294954392;
  }
  v22 = v21;
  v23 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v23)
  {
    CFRelease(v20);
    v26 = v22;
    goto LABEL_40;
  }
  v24 = v23;
  CFArrayAppendValue(v22, v23);
  CFRelease(v24);
  CFDictionaryAddValue(v20, (const void *)*MEMORY[0x24BDC56B8], v22);
  CFRelease(v22);
  addNumberToDictionary(v20, (const void *)*MEMORY[0x24BDC5708], v11);
  addNumberToDictionary(v20, (const void *)*MEMORY[0x24BDC5650], v9);
  v25 = (uint64_t *)(v8 + 24);
  VTEncoderSessionSetPixelBufferAttributes();
  if (!H263QT_InitSharedGlobals((void **)(v8 + 24)))
  {
    if (InitSharedTables(*v25, 0))
    {
      KillSharedTables(*v25);
    }
    else if (InitInstanceGlobals((uint64_t *)(v8 + 16), v11, v9, v10, 0, 132, 0, *(_QWORD **)(v8 + 24)))
    {
      KillInstanceGlobals((uint64_t *)(v8 + 16));
    }
    else
    {
      *(_DWORD *)(v8 + 160) = 0;
      *(_QWORD *)(v8 + 144) = MEM_NewClear(0x100000);
    }
  }
  CFRelease(v20);
  return 0;
}

uint64_t VCH263VideoEncoder_EncodeFrame(uint64_t a1, uint64_t a2, __CVBuffer *a3, CMTime *a4, CMTime *a5)
{
  uint64_t DerivedStorage;
  __CFDictionary *v8;
  const __CFAllocator *v9;
  CFDataRef v10;
  CFDataRef v11;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v13;
  uint64_t v14;
  uint64_t VideoFormatDescription;
  int BytesPerRow;
  __int16 Width;
  __int16 Height;
  char *BaseAddress;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  signed int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  CFAllocatorRef *v35;
  const __CFAllocator *v36;
  const __CFArray *SampleAttachmentsArray;
  __CFDictionary *ValueAtIndex;
  CMTime time2;
  CMTime bytes;
  int v43;
  size_t dataLength;
  uint64_t v45;
  uint64_t v46;
  char *dataPointerOut;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTimingArray;
  CMBlockBufferRef blockBufferOut;
  size_t sampleSizeArray[2];

  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v8 = 0;
  blockBufferOut = 0;
  sampleSizeArray[0] = 0;
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  sampleBufferOut = 0;
  v46 = 0;
  dataPointerOut = 0;
  dataLength = 0;
  v45 = 0;
  v43 = 0;
  if (*(_QWORD *)(DerivedStorage + 8))
    goto LABEL_9;
  *(_DWORD *)((char *)&bytes.value + 3) = 655980;
  LODWORD(bytes.value) = 1819308129;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&bytes, 7);
  if (v10)
  {
    v11 = v10;
    Mutable = CFDictionaryCreateMutable(v9, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v13 = Mutable;
      v8 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v8)
      {
        CFDictionaryAddValue(v13, CFSTR("d263"), v11);
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDC0B80], v13);
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDC0B58], CFSTR("H.263"));
        v14 = 0;
      }
      else
      {
        v14 = FigSignalErrorAt3();
      }
      CFRelease(v13);
    }
    else
    {
      v14 = FigSignalErrorAt3();
      v8 = 0;
    }
    CFRelease(v11);
    if (!(_DWORD)v14)
    {
LABEL_8:
      VideoFormatDescription = VTEncoderSessionCreateVideoFormatDescription();
      if ((_DWORD)VideoFormatDescription)
        goto LABEL_35;
LABEL_9:
      CVPixelBufferLockBaseAddress(a3, 0);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      *(_QWORD *)(DerivedStorage + 168) = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      *(_QWORD *)(DerivedStorage + 176) = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      *(_QWORD *)(DerivedStorage + 184) = CVPixelBufferGetBaseAddressOfPlane(a3, 2uLL);
      *(_DWORD *)(DerivedStorage + 192) = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      *(_DWORD *)(DerivedStorage + 196) = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      *(_DWORD *)(DerivedStorage + 200) = CVPixelBufferGetBytesPerRowOfPlane(a3, 2uLL);
      v20 = (uint64_t *)(*(_QWORD *)(DerivedStorage + 16) + 296174);
      v21 = *(_QWORD *)(*(_QWORD *)(DerivedStorage + 16) + 296222);
      *(_OWORD *)(v21 + 24) = 0u;
      v21 += 24;
      *(_QWORD *)(v21 - 16) = v21;
      *(_QWORD *)(v21 - 8) = v21 + 72;
      *(_QWORD *)(v21 + 64) = 0;
      *(_OWORD *)(v21 + 32) = 0u;
      *(_OWORD *)(v21 + 48) = 0u;
      *(_OWORD *)(v21 + 16) = 0u;
      v22 = *v20;
      *(_DWORD *)(v22 + 8) = Width;
      *(_DWORD *)(v22 + 12) = Height;
      LODWORD(v22) = *(_DWORD *)(DerivedStorage + 164);
      *(_DWORD *)(DerivedStorage + 164) = v22 + 1;
      v23 = v20[2];
      *(_DWORD *)(v23 + 4) = v22;
      *(_DWORD *)(v23 + 8) = v22 + 1;
      if ((a5->flags & 0x1D) == 1)
      {
        bytes = *a5;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
        if (CMTimeCompare(&bytes, &time2) >= 1)
        {
          bytes = *a5;
          *(_DWORD *)(DerivedStorage + 208) = (int)(CMTimeGetSeconds(&bytes) * 1000.0);
        }
      }
      v24 = *(_QWORD *)(DerivedStorage + 144);
      *(_QWORD *)(DerivedStorage + 48) = BaseAddress;
      *(_DWORD *)(DerivedStorage + 56) = Width;
      *(_DWORD *)(DerivedStorage + 60) = Height;
      *(_DWORD *)(DerivedStorage + 64) = BytesPerRow;
      *(_QWORD *)(DerivedStorage + 72) = &v46;
      *(_QWORD *)(DerivedStorage + 80) = &v45;
      *(_QWORD *)(DerivedStorage + 88) = 0x1079343230;
      *(_QWORD *)(DerivedStorage + 96) = v24;
      *(_QWORD *)(DerivedStorage + 104) = &dataLength;
      *(_QWORD *)(DerivedStorage + 112) = &v43;
      *(_QWORD *)(DerivedStorage + 120) = 7;
      if (*(_BYTE *)(DerivedStorage + 232))
        v25 = *(_DWORD *)(DerivedStorage + 212);
      else
        v25 = 1;
      v26 = *(_DWORD *)(DerivedStorage + 204);
      if (!v26)
        v26 = 819200;
      v27 = *(_DWORD *)(DerivedStorage + 236);
      if (v27 == 45)
      {
        v28 = 128000;
      }
      else
      {
        if (v27 != 10)
        {
LABEL_23:
          LODWORD(bytes.value) = v45;
          v29 = *(_DWORD *)(DerivedStorage + 208);
          if (!v29)
            v29 = 33;
          if (!v25)
            v25 = 30;
          v30 = H263CMPR_CompressMaster(*(_QWORD *)(DerivedStorage + 16), *(_QWORD *)(DerivedStorage + 24), BaseAddress, Width, Height, BytesPerRow, v46, &bytes, *(double *)(DerivedStorage + 224), 0x79343230u, 16, v24, 0, 1, v26, v29, v25, *(_DWORD *)(DerivedStorage + 216), (_QWORD *)(DerivedStorage + 168),
                  (_DWORD *)(DerivedStorage + 192));
          v31 = *(uint64_t **)(DerivedStorage + 80);
          *v31 = LODWORD(bytes.value);
          v32 = *(_QWORD *)(DerivedStorage + 16) + 296190;
          **(_QWORD **)(DerivedStorage + 104) = (4
                                                             * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(DerivedStorage + 16)
                                                                                     + 296230)
                                                                         + 8));
          if (*(_WORD *)(*(_QWORD *)v32 + 52))
          {
            v33 = *v31;
            v34 = *(_DWORD **)(DerivedStorage + 112);
            v35 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
            if (v33)
              *v34 = 0x800000;
            else
              *v34 = 0;
          }
          else
          {
            **(_DWORD **)(DerivedStorage + 112) = 16711680;
            v35 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
          }
          *(_DWORD *)(DerivedStorage + 128) = v30;
          sampleSizeArray[0] = dataLength;
          v36 = *v35;
          VideoFormatDescription = CMBlockBufferCreateWithMemoryBlock(*v35, 0, dataLength, *(CFAllocatorRef *)(DerivedStorage + 152), 0, 0, dataLength, 1u, &blockBufferOut);
          if ((_DWORD)VideoFormatDescription)
            goto LABEL_35;
          sampleTimingArray.presentationTimeStamp = *a4;
          sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
          *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)&a5->value;
          sampleTimingArray.duration.epoch = a5->epoch;
          VideoFormatDescription = CMSampleBufferCreate(v36, blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(DerivedStorage + 8), 1, 1, &sampleTimingArray, 1, sampleSizeArray, &sampleBufferOut);
          if ((_DWORD)VideoFormatDescription)
            goto LABEL_35;
          VideoFormatDescription = CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut);
          if ((_DWORD)VideoFormatDescription)
            goto LABEL_35;
          bzero(dataPointerOut, dataLength);
          memcpy(dataPointerOut, *(const void **)(DerivedStorage + 144), dataLength);
          CVPixelBufferUnlockBaseAddress(a3, 0);
          if (!v43)
            goto LABEL_46;
          SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sampleBufferOut, 1u);
          if (SampleAttachmentsArray)
          {
            ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
            CFDictionarySetValue(ValueAtIndex, (const void *)*MEMORY[0x24BDC0CC8], (const void *)*MEMORY[0x24BDBD270]);
LABEL_46:
            VTEncoderSessionEmitEncodedFrame();
            v14 = 0;
            goto LABEL_36;
          }
          VideoFormatDescription = FigSignalErrorAt3();
LABEL_35:
          v14 = VideoFormatDescription;
          goto LABEL_36;
        }
        v28 = 64000;
      }
      if (v26 >= v28)
        v26 = v28;
      goto LABEL_23;
    }
  }
  else
  {
    v14 = FigSignalErrorAt3();
    v8 = 0;
    if (!(_DWORD)v14)
      goto LABEL_8;
  }
LABEL_36:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (sampleBufferOut)
    CFRelease(sampleBufferOut);
  if (v8)
    CFRelease(v8);
  return v14;
}

uint64_t VCH263VideoEncoder_CompleteFrames()
{
  return 0;
}

uint64_t VCH263VideoEncoder_CopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  if (sCreateSupportedPropertyDictionaryOnce == -1)
  {
    if (!a2)
      return FigSignalErrorAt3();
  }
  else
  {
    dispatch_once_f(&sCreateSupportedPropertyDictionaryOnce, 0, (dispatch_function_t)sVCH263VideoEncoderCreateSupportDictionary);
    if (!a2)
      return FigSignalErrorAt3();
  }
  if (sVCH263VideoEncoderSupportedPropertyDictionary)
  {
    *a2 = CFRetain((CFTypeRef)sVCH263VideoEncoderSupportedPropertyDictionary);
    return 0;
  }
  return FigSignalErrorAt3();
}

void addNumberToDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void sVCH263VideoEncoderCreateSupportDictionary()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  __CFArray *Mutable;
  void *v11;
  CFDictionaryRef v12;
  CFDictionaryRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFDictionaryRef v18;
  __CFArray *v19;
  void *values;
  CFDictionaryRef v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *keys;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v0 = (void *)*MEMORY[0x24BDF9840];
  v1 = (void *)*MEMORY[0x24BDF9858];
  v2 = *MEMORY[0x24BDF9800];
  keys = (void *)*MEMORY[0x24BDF9840];
  v28 = v2;
  v3 = (const __CFDictionary *)*MEMORY[0x24BDF9810];
  values = v1;
  v21 = v3;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v5)
  {
    FigSignalErrorAt3();
    return;
  }
  v6 = v5;
  v7 = (void *)*MEMORY[0x24BDF9848];
  keys = v0;
  v28 = v2;
  values = v7;
  v21 = v3;
  v8 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v8)
  {
    FigSignalErrorAt3();
    v19 = v6;
LABEL_13:
    CFRelease(v19);
    return;
  }
  v9 = v8;
  Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x24BDBD690]);
  CFArrayAppendValue(Mutable, (const void *)*MEMORY[0x24BDF96A0]);
  CFArrayAppendValue(Mutable, (const void *)*MEMORY[0x24BDF96A8]);
  v11 = (void *)*MEMORY[0x24BDF9850];
  keys = v0;
  v28 = v2;
  values = v11;
  v21 = v3;
  *(_QWORD *)&v29 = *MEMORY[0x24BDF9828];
  *(_QWORD *)&v22 = Mutable;
  v12 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = v12;
  if (!v12)
    goto LABEL_8;
  v14 = *MEMORY[0x24BDF9208];
  keys = (void *)*MEMORY[0x24BDF9210];
  v28 = v14;
  values = v6;
  v21 = v6;
  v15 = *MEMORY[0x24BDF92C8];
  *(_QWORD *)&v29 = *MEMORY[0x24BDF9260];
  *((_QWORD *)&v29 + 1) = v15;
  *(_QWORD *)&v22 = v6;
  *((_QWORD *)&v22 + 1) = v6;
  v16 = *MEMORY[0x24BDF9258];
  *(_QWORD *)&v30 = *MEMORY[0x24BDF9350];
  *((_QWORD *)&v30 + 1) = v16;
  *(_QWORD *)&v23 = v6;
  *((_QWORD *)&v23 + 1) = v6;
  v17 = *MEMORY[0x24BDF9330];
  *(_QWORD *)&v31 = *MEMORY[0x24BDF9200];
  *((_QWORD *)&v31 + 1) = v17;
  *(_QWORD *)&v24 = v9;
  *((_QWORD *)&v24 + 1) = v12;
  v18 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 8, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v18)
    sVCH263VideoEncoderSupportedPropertyDictionary = (uint64_t)v18;
  else
LABEL_8:
    FigSignalErrorAt3();
  CFRelease(v6);
  CFRelease(v9);
  if (v13)
    CFRelease(v13);
  if (Mutable)
  {
    v19 = Mutable;
    goto LABEL_13;
  }
}

uint64_t H263QT_InitSharedGlobals(void **a1)
{
  void *v2;

  if (*a1)
    return 0;
  v2 = MEM_NewClear(68);
  *a1 = v2;
  if (v2)
    return 0;
  H263QT_KillSharedGlobals(a1);
  return 1;
}

void *H263QT_KillSharedGlobals(void **a1)
{
  void *result;

  result = *a1;
  if (result)
  {
    result = (void *)KillSharedTables((uint64_t)result);
    if (!(_DWORD)result)
    {
      MEM_Dispose(*a1);
      result = 0;
      *a1 = 0;
    }
  }
  return result;
}

BOOL H263PICT_Init(_QWORD *a1)
{
  void *v3;

  if (*a1)
    return 0;
  v3 = MEM_NewClear(176);
  *a1 = v3;
  return v3 == 0;
}

uint64_t H263PICT_Kill(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
  {
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t H263PICT_Setup(uint64_t a1, int a2)
{
  if (a1)
  {
    *(_DWORD *)a1 = 1;
    *(_BYTE *)(a1 + 16) = a2;
    *(_DWORD *)(a1 + 44) = a2;
    *(_DWORD *)(a1 + 48) = 1;
    *(_DWORD *)(a1 + 60) = 0;
    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    *(_QWORD *)(a1 + 104) = 0;
    *(_BYTE *)(a1 + 25) = 0;
    *(_DWORD *)(a1 + 132) = 0;
    *(_WORD *)(a1 + 27) = 264;
    *(_QWORD *)(a1 + 17) = 257;
    *(_BYTE *)(a1 + 32) = 0;
  }
  return 0;
}

uint64_t H263PICT_encPictureHeader(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  BOOL v69;
  unsigned int v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  int v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  _BOOL4 v92;
  int v93;

  v3 = result;
  v4 = *(_DWORD *)(a2 + 4);
  if (v4 <= 0x15)
  {
    v12 = *(_DWORD *)(a2 + 120) & 0x20;
    v13 = (*(_DWORD *)a2 << 8) & 0xFF0000 | (((v12 >> (22 - v4)) | *(_DWORD *)a2) << 24) | (*(_DWORD *)a2 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)a2);
    v14 = *(_QWORD *)(a2 + 24);
    v15 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v15 + 1;
    *(_DWORD *)(v14 + 4 * v15) = v13;
    v5 = v4 + 10;
    v6 = v12 << (v4 + 10);
  }
  else
  {
    v5 = v4 - 22;
    v6 = *(_DWORD *)a2 | ((unint64_t)(*(_DWORD *)(a2 + 120) & 0x20) << (v4 - 22));
    if (v4 - 22 <= 7)
    {
      v7 = *(_DWORD *)(a2 + 64) & *(_DWORD *)result;
      v8 = *(_QWORD *)(a2 + 24);
      v9 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v9 + 1;
      *(_DWORD *)(v8 + 4 * v9) = (((v7 >> (30 - v4)) | v6) << 8) & 0xFF0000 | (((v7 >> (30 - v4)) | v6) << 24) | (((v7 >> (30 - v4)) | v6) >> 8) & 0xFF00 | (((v7 >> (30 - v4)) | v6) >> 24);
      v10 = v4 + 2;
      v11 = v7 << (v4 + 2);
      *(_DWORD *)a2 = v11;
      goto LABEL_6;
    }
  }
  v10 = v5 - 8;
  v11 = ((*(_DWORD *)(a2 + 64) & *(_DWORD *)result) << (v5 - 8)) | v6;
  if (v5 - 8 <= 1)
  {
    v22 = *(_DWORD *)(a2 + 40) & 2;
    v23 = (v22 >> (10 - v5)) | v11;
    *(_DWORD *)a2 = v23;
    v24 = (v11 << 8) & 0xFF0000 | (v23 << 24) | (v11 >> 8) & 0xFF00 | HIBYTE(v11);
    v25 = *(_QWORD *)(a2 + 24);
    v26 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v26 + 1;
    *(_DWORD *)(v25 + 4 * v26) = v24;
    v16 = v5 + 22;
    v17 = v22 << (v5 + 22);
    goto LABEL_9;
  }
LABEL_6:
  v16 = v10 - 2;
  v17 = ((*(_DWORD *)(a2 + 40) & 2) << (v10 - 2)) | v11;
  if (v10 - 2 <= 2)
  {
    v18 = bswap32(v17);
    v19 = *(_QWORD *)(a2 + 24);
    v20 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v20 + 1;
    *(_DWORD *)(v19 + 4 * v20) = v18;
    v21 = v10 + 27;
    v17 = 0;
LABEL_10:
    v27 = v21 - 3;
    *(_DWORD *)(a2 + 4) = v21 - 3;
    v28 = *(unsigned __int8 *)(result + 16);
    v29 = ((*(_DWORD *)(a2 + 44) & *(char *)(result + 16)) << v27) | v17;
    goto LABEL_12;
  }
LABEL_9:
  v21 = v16 - 3;
  if (v16 - 3 >= 3)
    goto LABEL_10;
  v28 = *(unsigned __int8 *)(result + 16);
  v30 = *(_DWORD *)(a2 + 44) & *(char *)(result + 16);
  v31 = (((v30 >> (6 - v16)) | v17) << 8) & 0xFF0000 | (((v30 >> (6 - v16)) | v17) << 24) | (((v30 >> (6 - v16)) | v17) >> 8) & 0xFF00 | (((v30 >> (6 - v16)) | v17) >> 24);
  v32 = *(_QWORD *)(a2 + 24);
  v33 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v33 + 1;
  *(_DWORD *)(v32 + 4 * v33) = v31;
  v27 = v16 + 26;
  *(_DWORD *)(a2 + 4) = v16 + 26;
  v29 = v30 << (v16 + 26);
LABEL_12:
  *(_DWORD *)a2 = v29;
  if (v28 == 7)
  {
    *(_DWORD *)(result + 40) = 1;
    result = H263PICT_encPlusHeader(result, (unsigned int *)a2);
    v35 = *(_DWORD *)a2;
    v34 = *(_DWORD *)(a2 + 4);
    v36 = v34 - 5;
    if (v34 < 5)
    {
      v39 = *(_DWORD *)(a2 + 52) & *(char *)(v3 + 27);
      v40 = *(_QWORD *)(a2 + 24);
      v41 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v41 + 1;
      *(_DWORD *)(v40 + 4 * v41) = (((v39 >> (5 - v34)) | v35) << 8) & 0xFF0000 | (((v39 >> (5 - v34)) | v35) << 24) | (((v39 >> (5 - v34)) | v35) >> 8) & 0xFF00 | (((v39 >> (5 - v34)) | v35) >> 24);
      v36 = v34 + 27;
      v37 = v39 << (v34 + 27);
    }
    else
    {
      v37 = ((*(_DWORD *)(a2 + 52) & *(char *)(v3 + 27)) << v36) | v35;
    }
    *(_DWORD *)a2 = v37;
    *(_DWORD *)(a2 + 4) = v36;
    v42 = *(unsigned __int8 *)(v3 + 22);
    goto LABEL_69;
  }
  if (*(_BYTE *)(result + 17) == 1)
  {
    if (!v27)
    {
      v43 = *(_QWORD *)(a2 + 24);
      v44 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v44 + 1;
      *(_DWORD *)(v43 + 4 * v44) = bswap32(v29);
      v38 = 31;
      v29 = 0x80000000;
      if (*(_BYTE *)(result + 18))
      {
LABEL_27:
        v47 = v38 - 1;
        *(_DWORD *)(a2 + 4) = v47;
        v29 |= 1 << v47;
        goto LABEL_34;
      }
      goto LABEL_29;
    }
    v38 = v27 - 1;
    v29 |= 1 << (v27 - 1);
  }
  else if (v27)
  {
    v38 = v27 - 1;
  }
  else
  {
    v45 = *(_QWORD *)(a2 + 24);
    v46 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v46 + 1;
    *(_DWORD *)(v45 + 4 * v46) = bswap32(v29);
    *(_DWORD *)a2 = 0;
    v38 = 31;
    v29 = 0;
  }
  if (*(_BYTE *)(result + 18))
  {
    if (!v38)
    {
      v48 = *(_QWORD *)(a2 + 24);
      v49 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v49 + 1;
      *(_DWORD *)(v48 + 4 * v49) = bswap32(v29);
      v47 = 31;
      v29 = 0x80000000;
      if (*(_BYTE *)(result + 19))
      {
LABEL_36:
        v52 = v47 - 1;
        v29 |= 1 << v52;
        goto LABEL_42;
      }
      goto LABEL_38;
    }
    goto LABEL_27;
  }
  if (!v38)
  {
    v50 = *(_QWORD *)(a2 + 24);
    v51 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v51 + 1;
    *(_DWORD *)(v50 + 4 * v51) = bswap32(v29);
    v47 = 31;
    v29 = 0;
    goto LABEL_33;
  }
LABEL_29:
  v47 = v38 - 1;
LABEL_33:
  *(_DWORD *)(a2 + 4) = v47;
LABEL_34:
  if (*(_BYTE *)(result + 19))
  {
    if (!v47)
    {
      v53 = *(_QWORD *)(a2 + 24);
      v54 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v54 + 1;
      *(_DWORD *)(v53 + 4 * v54) = bswap32(v29);
      v29 = 0x80000000;
      *(_DWORD *)a2 = 0x80000000;
      v52 = 31;
      if (*(_BYTE *)(result + 20))
      {
LABEL_44:
        v57 = v52 - 1;
        v29 |= 1 << (v52 - 1);
        goto LABEL_50;
      }
      goto LABEL_46;
    }
    goto LABEL_36;
  }
  if (v47)
  {
LABEL_38:
    v52 = v47 - 1;
    goto LABEL_42;
  }
  v55 = *(_QWORD *)(a2 + 24);
  v56 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v56 + 1;
  *(_DWORD *)(v55 + 4 * v56) = bswap32(v29);
  v52 = 31;
  v29 = 0;
LABEL_42:
  if (*(_BYTE *)(result + 20))
  {
    if (!v52)
    {
      v58 = *(_QWORD *)(a2 + 24);
      v59 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v59 + 1;
      *(_DWORD *)(v58 + 4 * v59) = bswap32(v29);
      v29 = 0x80000000;
      *(_DWORD *)a2 = 0x80000000;
      v42 = *(unsigned __int8 *)(result + 22);
      v57 = 31;
      if (*(_BYTE *)(result + 22))
      {
LABEL_52:
        v62 = v57 - 1;
        *(_DWORD *)(a2 + 4) = v62;
        v29 |= 1 << v62;
        goto LABEL_58;
      }
      goto LABEL_54;
    }
    goto LABEL_44;
  }
  if (v52)
  {
LABEL_46:
    v57 = v52 - 1;
    goto LABEL_50;
  }
  v60 = *(_QWORD *)(a2 + 24);
  v61 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v61 + 1;
  *(_DWORD *)(v60 + 4 * v61) = bswap32(v29);
  *(_DWORD *)a2 = 0;
  v57 = 31;
  v29 = 0;
LABEL_50:
  v42 = *(unsigned __int8 *)(result + 22);
  if (!*(_BYTE *)(result + 22))
  {
    if (!v57)
    {
      v65 = *(_QWORD *)(a2 + 24);
      v66 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v66 + 1;
      *(_DWORD *)(v65 + 4 * v66) = bswap32(v29);
      v62 = 31;
      v29 = 0;
      goto LABEL_57;
    }
LABEL_54:
    v62 = v57 - 1;
LABEL_57:
    v42 = 0;
    *(_DWORD *)(a2 + 4) = v62;
    goto LABEL_58;
  }
  if (v57)
    goto LABEL_52;
  v63 = *(_QWORD *)(a2 + 24);
  v64 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v64 + 1;
  *(_DWORD *)(v63 + 4 * v64) = bswap32(v29);
  v62 = 31;
  *(_DWORD *)(a2 + 4) = 31;
  v29 = 0x80000000;
LABEL_58:
  v67 = *(char *)(result + 27);
  if (v67 > 31)
  {
    LOBYTE(v67) = 31;
LABEL_62:
    *(_BYTE *)(result + 27) = v67;
    goto LABEL_63;
  }
  if (v67 <= 0)
  {
    LOBYTE(v67) = 1;
    goto LABEL_62;
  }
LABEL_63:
  if (v62 <= 4)
  {
    v74 = (v67 & *(_BYTE *)(a2 + 52));
    v75 = (v29 << 8) & 0xFF0000 | (((v74 >> (5 - v62)) | v29) << 24) | (v29 >> 8) & 0xFF00 | HIBYTE(v29);
    v76 = *(_QWORD *)(a2 + 24);
    v77 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v77 + 1;
    *(_DWORD *)(v76 + 4 * v77) = v75;
    v70 = v62 + 27;
    v37 = v74 << (v62 + 27);
    *(_DWORD *)a2 = v37;
  }
  else
  {
    v68 = (v67 & *(_BYTE *)(a2 + 52));
    v70 = v62 - 5;
    v69 = v62 == 5;
    v37 = (v68 << (v62 - 5)) | v29;
    *(_DWORD *)a2 = v37;
    if (v69)
    {
      v71 = bswap32(v37);
      v72 = *(_QWORD *)(a2 + 24);
      v73 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v73 + 1;
      *(_DWORD *)(v72 + 4 * v73) = v71;
      *(_DWORD *)a2 = 0;
      v36 = 31;
      v37 = 0;
      goto LABEL_69;
    }
  }
  v36 = v70 - 1;
LABEL_69:
  if (!v42)
    goto LABEL_76;
  if (v36 <= 2)
  {
    v84 = *(_DWORD *)(a2 + 44) & *(char *)(v3 + 28);
    v85 = (((v84 >> (3 - v36)) | v37) << 8) & 0xFF0000 | (((v84 >> (3 - v36)) | v37) << 24) | (((v84 >> (3 - v36)) | v37) >> 8) & 0xFF00 | (((v84 >> (3 - v36)) | v37) >> 24);
    v86 = *(_QWORD *)(a2 + 24);
    v87 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v87 + 1;
    *(_DWORD *)(v86 + 4 * v87) = v85;
    v78 = v36 + 29;
    *(_DWORD *)(a2 + 4) = v36 + 29;
    v79 = v84 << (v36 + 29);
    goto LABEL_74;
  }
  v78 = v36 - 3;
  *(_DWORD *)(a2 + 4) = v36 - 3;
  v79 = ((*(_DWORD *)(a2 + 44) & *(char *)(v3 + 28)) << (v36 - 3)) | v37;
  if (v36 - 3 >= 2)
  {
LABEL_74:
    v36 = v78 - 2;
    v37 = ((*(_DWORD *)(a2 + 40) & *(char *)(v3 + 32)) << (v78 - 2)) | v79;
    goto LABEL_75;
  }
  v80 = *(_DWORD *)(a2 + 40) & *(char *)(v3 + 32);
  v81 = (((v80 >> (5 - v36)) | v79) << 8) & 0xFF0000 | (((v80 >> (5 - v36)) | v79) << 24) | (((v80 >> (5 - v36)) | v79) >> 8) & 0xFF00 | (((v80 >> (5 - v36)) | v79) >> 24);
  v82 = *(_QWORD *)(a2 + 24);
  v83 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v83 + 1;
  *(_DWORD *)(v82 + 4 * v83) = v81;
  v36 += 27;
  v37 = v80 << v36;
LABEL_75:
  *(_DWORD *)a2 = v37;
LABEL_76:
  if (v36)
  {
    v88 = v36 - 1;
  }
  else
  {
    v89 = bswap32(v37);
    v90 = *(_QWORD *)(a2 + 24);
    v91 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v91 + 1;
    *(_DWORD *)(v90 + 4 * v91) = v89;
    *(_DWORD *)a2 = 0;
    v88 = 31;
  }
  *(_DWORD *)(a2 + 4) = v88;
  if (*(_BYTE *)(v3 + 20))
    v92 = 1;
  else
    v92 = *(_DWORD *)(v3 + 76) != 0;
  if (*(_BYTE *)(v3 + 18))
    v93 = 1;
  else
    v93 = v92;
  *(_DWORD *)(v3 + 164) = v92;
  *(_DWORD *)(v3 + 168) = v93;
  return result;
}

uint64_t H263PICT_encPlusHeader(uint64_t result, unsigned int *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;

  v2 = a2[1];
  if (*(_DWORD *)(result + 48) != 1)
    goto LABEL_37;
  v3 = *a2;
  v4 = v2 - 3;
  if (v2 < 3)
  {
    v6 = a2[11] & *(_DWORD *)(result + 44);
    v7 = (((v6 >> (3 - v2)) | v3) << 8) & 0xFF0000 | (((v6 >> (3 - v2)) | v3) << 24) | (((v6 >> (3 - v2)) | v3) >> 8) & 0xFF00 | (((v6 >> (3 - v2)) | v3) >> 24);
    v8 = *((_QWORD *)a2 + 3);
    v9 = a2[2];
    a2[2] = v9 + 1;
    *(_DWORD *)(v8 + 4 * v9) = v7;
    v4 = v2 + 29;
    v5 = v6 << (v2 + 29);
  }
  else
  {
    v5 = ((a2[11] & *(_DWORD *)(result + 44)) << v4) | v3;
  }
  *a2 = v5;
  a2[1] = v4;
  if (*(_BYTE *)(result + 18))
  {
    if (!v4)
    {
      v11 = *((_QWORD *)a2 + 3);
      v12 = a2[2];
      a2[2] = v12 + 1;
      *(_DWORD *)(v11 + 4 * v12) = bswap32(v5);
      v5 = 0x80000000;
      *a2 = 0x80000000;
      v10 = 31;
      if (*(_DWORD *)(result + 72))
      {
LABEL_15:
        v15 = v10 - 1;
        v5 |= 1 << v15;
        *a2 = v5;
        goto LABEL_21;
      }
      goto LABEL_17;
    }
    v10 = v4 - 1;
    v5 |= 1 << (v4 - 1);
    *a2 = v5;
  }
  else if (v4)
  {
    v10 = v4 - 1;
  }
  else
  {
    v13 = *((_QWORD *)a2 + 3);
    v14 = a2[2];
    a2[2] = v14 + 1;
    *(_DWORD *)(v13 + 4 * v14) = bswap32(v5);
    *a2 = 0;
    v10 = 31;
    v5 = 0;
  }
  if (!*(_DWORD *)(result + 72))
  {
    if (!v10)
    {
      v18 = *((_QWORD *)a2 + 3);
      v19 = a2[2];
      a2[2] = v19 + 1;
      *(_DWORD *)(v18 + 4 * v19) = bswap32(v5);
      *a2 = 0;
      v15 = 31;
      v5 = 0;
LABEL_21:
      if (*(_DWORD *)(result + 76))
      {
        if (!v15)
        {
          v21 = *((_QWORD *)a2 + 3);
          v22 = a2[2];
          a2[2] = v22 + 1;
          *(_DWORD *)(v21 + 4 * v22) = bswap32(v5);
          *(_QWORD *)a2 = 0x1F80000000;
          v20 = 31;
          if (*(_DWORD *)(result + 96))
          {
            v5 = 0x80000000;
LABEL_32:
            v2 = v20 - 1;
            *a2 = v5 | (1 << v2);
            goto LABEL_37;
          }
          goto LABEL_34;
        }
        goto LABEL_23;
      }
      if (!v15)
      {
        v23 = *((_QWORD *)a2 + 3);
        v24 = a2[2];
        a2[2] = v24 + 1;
        *(_DWORD *)(v23 + 4 * v24) = bswap32(v5);
        *a2 = 0;
        v20 = 31;
        v5 = 0;
        goto LABEL_29;
      }
LABEL_25:
      v20 = v15 - 1;
LABEL_29:
      a2[1] = v20;
      goto LABEL_30;
    }
LABEL_17:
    v15 = v10 - 1;
    goto LABEL_21;
  }
  if (v10)
    goto LABEL_15;
  v16 = *((_QWORD *)a2 + 3);
  v17 = a2[2];
  a2[2] = v17 + 1;
  *(_DWORD *)(v16 + 4 * v17) = bswap32(v5);
  v5 = 0x80000000;
  *a2 = 0x80000000;
  v15 = 31;
  if (!*(_DWORD *)(result + 76))
    goto LABEL_25;
LABEL_23:
  v20 = v15 - 1;
  v5 |= 1 << v20;
  *a2 = v5;
  a2[1] = v20;
LABEL_30:
  if (*(_DWORD *)(result + 96))
  {
    if (!v20)
    {
      v25 = *((_QWORD *)a2 + 3);
      v26 = a2[2];
      a2[2] = v26 + 1;
      *(_DWORD *)(v25 + 4 * v26) = bswap32(v5);
      *a2 = 0x80000000;
      v2 = 31;
      goto LABEL_38;
    }
    goto LABEL_32;
  }
  if (v20)
  {
LABEL_34:
    v2 = v20 - 1;
    goto LABEL_37;
  }
  v27 = *((_QWORD *)a2 + 3);
  v28 = a2[2];
  a2[2] = v28 + 1;
  *(_DWORD *)(v27 + 4 * v28) = bswap32(v5);
  *a2 = 0;
  v2 = 31;
LABEL_37:
  if (v2 < 3)
  {
    v31 = a2[11] & *(char *)(result + 17);
    v32 = (((v31 >> (3 - v2)) | *a2) << 8) & 0xFF0000 | (((v31 >> (3 - v2)) | *a2) << 24) | (((v31 >> (3 - v2)) | *a2) >> 8) & 0xFF00 | (((v31 >> (3 - v2)) | *a2) >> 24);
    v33 = *((_QWORD *)a2 + 3);
    v34 = a2[2];
    a2[2] = v34 + 1;
    *(_DWORD *)(v33 + 4 * v34) = v32;
    v29 = v2 + 29;
    v30 = v31 << (v2 + 29);
    goto LABEL_40;
  }
LABEL_38:
  v29 = v2 - 3;
  v30 = ((a2[11] & *(char *)(result + 17)) << (v2 - 3)) | *a2;
LABEL_40:
  *a2 = v30;
  a2[1] = v29;
  return result;
}

uint64_t InitQuantization(char **a1)
{
  char *v2;
  int v3;
  int v4;
  void *v5;
  uint64_t result;

  v2 = *a1;
  if (!v2)
  {
    v2 = (char *)MEM_NewClear(1442);
    *a1 = v2;
    if (!v2)
      return 1;
  }
  v2[94] = 8;
  *(_QWORD *)(v2 + 20) = 0;
  *(_QWORD *)(v2 + 12) = 0;
  *(_QWORD *)(v2 + 4) = 0;
  *(_OWORD *)(v2 + 28) = xmmword_2285757E0;
  v2[134] = 1;
  *((_WORD *)v2 + 66) = 1;
  v3 = C_Function_SizeofSinglepassRateController();
  *((_QWORD *)*a1 + 12) = MEM_NewClear(v3);
  (*a1)[104] = 0;
  v4 = C_Function_SizeofFrame();
  v5 = MEM_NewClear(v4);
  result = 0;
  *(_QWORD *)(*a1 + 106) = v5;
  return result;
}

uint64_t KillQuantization(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if (v2)
  {
    if (*(_QWORD *)(v2 + 96))
    {
      C_Function_Kill(*(_QWORD *)(v2 + 96));
      v3 = *a1;
      *(_BYTE *)(v3 + 104) = 0;
      MEM_Dispose(*(void **)(v3 + 96));
      v2 = *a1;
    }
    if (*(_QWORD *)(v2 + 106))
    {
      MEM_Dispose(*(void **)(v2 + 106));
      v2 = *a1;
    }
    MEM_Dispose((void *)v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t InitQuantTables(uint64_t *a1, int a2)
{
  float *v5;
  uint64_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int v9;
  uint64_t v10;
  float64x2_t v19;
  float64x2_t v20;
  float *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float64x2_t v26;
  int32x2_t v27;
  float64x2_t v28;
  uint64_t v29;
  float *v30;
  float v31;
  double v32;
  float v33;
  int32x2_t v34;
  float64x2_t v35;
  uint64_t v36;
  float *v37;
  float v38;
  double v39;
  float v40;
  unint64_t v41;
  void *v42;
  int v43;
  unint64_t i;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  if (*a1)
    return 0;
  v5 = (float *)MEM_NewClear(102912);
  *a1 = (uint64_t)v5;
  if (v5)
  {
    v6 = 0;
    v7 = (int32x4_t)xmmword_2285757F0;
    v8.i64[0] = 0x400000004;
    v8.i64[1] = 0x400000004;
    do
    {
      *(float32x4_t *)&v5[v6] = vcvtq_f32_s32(v7);
      v7 = vaddq_s32(v7, v8);
      v6 += 4;
    }
    while (v6 != 256);
    v9 = 1;
    v10 = 256;
    __asm
    {
      FMOV            V1.2D, #2.0
      FMOV            V2.2D, #1.0
      FMOV            V3.2D, #-1.0
      FMOV            V4.2D, #-0.25
    }
    v19 = (float64x2_t)vdupq_n_s64(0x4090000000000000uLL);
    v20 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCDuLL);
    __asm { FMOV            V7.2D, #-0.5 }
    v22 = v5;
    do
    {
      *(double *)&v23 = (float)v9;
      v24 = 4 * v10;
      v25 = 0;
      if ((v9 & 1) != 0)
      {
        v34 = (int32x2_t)0x7F00000080;
        do
        {
          v35 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmulq_n_f64(vmlaq_f64(_Q2, _Q1, vcvtq_f64_f32(vcvt_f32_s32(v34))), *(double *)&v23))), _Q4);
          *(float32x2_t *)&v22[v25 + 512] = vcvt_f32_f64(v35);
          *(int32x2_t *)&v22[v25 + 8960] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v19, v35)));
          *(int32x2_t *)&v22[v25 + 17408] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v20, vmulq_f64(v35, v19))));
          v34 = vadd_s32(v34, (int32x2_t)0x100000001);
          v25 += 2;
        }
        while (v25 != 128);
        *(float *)((char *)v5 + (v24 | 0x200) + 1024) = 0.0;
        v36 = -127;
        v37 = v22;
        do
        {
          v38 = ((float)(v36 + 128) * 2.0 + 1.0) * *(double *)&v23;
          v39 = v38 * 0.25;
          v40 = v39;
          v37[641] = v40;
          *((_DWORD *)v37 + 9089) = (int)(v39 * 1024.0 + 0.5);
          *((_DWORD *)v37++ + 17537) = (int)(v39 * 1024.0 * 0.707106781 + 0.5);
          _CF = __CFADD__(v36++, 1);
        }
        while (!_CF);
      }
      else
      {
        v26 = (float64x2_t)vdupq_lane_s64(v23, 0);
        v27 = (int32x2_t)0x7F00000080;
        do
        {
          v28 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmlaq_f64(_Q3, vmlaq_f64(_Q2, _Q1, vcvtq_f64_f32(vcvt_f32_s32(v27))), v26))), _Q4);
          *(float32x2_t *)&v22[v25 + 512] = vcvt_f32_f64(v28);
          *(int32x2_t *)&v22[v25 + 8960] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v19, v28)));
          *(int32x2_t *)&v22[v25 + 17408] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v20, vmulq_f64(v28, v19))));
          v27 = vadd_s32(v27, (int32x2_t)0x100000001);
          v25 += 2;
        }
        while (v25 != 128);
        *(float *)((char *)v5 + (v24 | 0x200) + 1024) = 0.0;
        v29 = -127;
        v30 = v22;
        do
        {
          v31 = *(double *)&v23 * ((float)(v29 + 128) * 2.0 + 1.0) + -1.0;
          v32 = v31 * 0.25;
          v33 = v32;
          v30[641] = v33;
          *((_DWORD *)v30 + 9089) = (int)(v32 * 1024.0 + 0.5);
          *((_DWORD *)v30++ + 17537) = (int)(v32 * 1024.0 * 0.707106781 + 0.5);
          _CF = __CFADD__(v29++, 1);
        }
        while (!_CF);
      }
      ++v9;
      v10 += 256;
      v22 += 256;
    }
    while (v9 != 32);
    if (a2)
      return 0;
    v41 = 1;
    while (1)
    {
      v42 = *(void **)(*a1 + 8 * v41 + 102400);
      if (v42)
        MEM_Dispose(v42);
      if (v41 >= 8)
        v43 = 0x2000;
      else
        v43 = 0x4000;
      *(_QWORD *)(*a1 + 8 * v41 + 102400) = MEM_NewClear(v43);
      if (!*(_QWORD *)(*a1 + 8 * v41 + 102400))
        return 1;
      for (i = 0; ; ++i)
      {
        if (i == 4096)
        {
          LOWORD(v45) = 0;
        }
        else
        {
          v46 = i < 0x1000 ? -1 : 1;
          v45 = (((((1 - v41) & 1) - (int)v41 + v46 * ((int)i - 4096)) / (2 * (int)v41)) & ~(((((1 - v41) & 1) - (int)v41 + v46 * ((int)i - 4096)) / (2 * (int)v41)) >> 31))
              * v46;
        }
        v47 = *(_QWORD *)(*a1 + 8 * v41 + 102400);
        if (v41 > 7)
          break;
        *(_WORD *)(v47 + 2 * i) = v45;
        if (i == 0x1FFF)
        {
          v48 = *a1;
          v49 = *(_QWORD *)(*a1 + 8 * v41 + 102400) + 0x2000;
          goto LABEL_41;
        }
LABEL_39:
        ;
      }
      *(_BYTE *)(v47 + i) = v45;
      if (i != 0x1FFF)
        goto LABEL_39;
      v48 = *a1;
      v49 = *(_QWORD *)(*a1 + 8 * v41 + 102400) + 4096;
LABEL_41:
      *(_QWORD *)(v48 + 8 * v41++ + 102656) = v49;
      if (v41 == 32)
        return 0;
    }
  }
  return 1;
}

uint64_t KillQuantTables(void **a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*a1)
  {
    v2 = 102408;
    v3 = 31;
    do
    {
      v4 = *(void **)((char *)*a1 + v2);
      if (v4)
      {
        MEM_Dispose(v4);
        *(_QWORD *)((char *)*a1 + v2) = 0;
        *(_QWORD *)((char *)*a1 + v2 + 256) = 0;
      }
      v2 += 8;
      --v3;
    }
    while (v3);
    MEM_Dispose(*a1);
    *a1 = 0;
  }
  return 0;
}

uint64_t Q_Setup(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  if (a9)
  {
    if (a4[2])
    {
      v9 = *(_BYTE *)(a2 + 95);
      *(_BYTE *)(a2 + 94) = v9;
      *(_BYTE *)(a1 + 27) = v9;
    }
    else
    {
      *(_QWORD *)(a2 + 60) = *(_QWORD *)(a2 + 52);
      v10 = *(_BYTE *)(a2 + 95);
      *(_BYTE *)(a2 + 94) = v10;
      *(_BYTE *)(a1 + 27) = v10;
      if (!*(_BYTE *)(a2 + 92))
      {
        *(_QWORD *)(a2 + 20) = 0;
        *(_QWORD *)(a2 + 12) = 0;
        *(_QWORD *)(a2 + 4) = 0;
        *(_OWORD *)(a2 + 28) = xmmword_2285757E0;
      }
    }
    *(_BYTE *)(a2 + 134) = 1;
    *(_WORD *)(a2 + 132) = 1;
  }
  v11 = a4[9];
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = *(_DWORD *)(a6 + 20);
    do
    {
      if (v14)
      {
        v15 = 0;
        do
        {
          *(_BYTE *)(a2 + 136 + v13 + v15) = *(_BYTE *)(a2 + 94);
          v14 = *(_DWORD *)(a6 + 20);
          ++v15;
        }
        while (v15 < v14);
        v13 += v15;
        v11 = a4[9];
      }
      ++v12;
    }
    while (v12 < v11);
  }
  else
  {
    v13 = 0;
  }
  v16 = a4[10];
  if (v11 < v16)
  {
    v17 = *(_DWORD *)(a6 + 20);
    do
    {
      if (v17)
      {
        v18 = 0;
        do
        {
          *(_BYTE *)(a2 + 136 + v13 + v18) = *(_BYTE *)(a2 + 95);
          v17 = *(_DWORD *)(a6 + 20);
          ++v18;
        }
        while (v18 < v17);
        v13 += v18;
        v16 = a4[10];
      }
      ++v11;
    }
    while (v11 < v16);
  }
  v19 = *(_DWORD *)(a6 + 16);
  if (v16 < v19)
  {
    LODWORD(v20) = *(_DWORD *)(a6 + 20);
    do
    {
      if ((_DWORD)v20)
      {
        v21 = 0;
        v22 = a2 + 136 + v13;
        do
        {
          *(_BYTE *)(v22 + v21) = *(_BYTE *)(a2 + 94);
          *(_BYTE *)(v22 + v21++) = *(_BYTE *)(a2 + 94);
          v20 = *(unsigned int *)(a6 + 20);
        }
        while (v21 < v20);
        v19 = *(_DWORD *)(a6 + 16);
      }
      ++v16;
      v13 += v20;
    }
    while (v16 < v19);
  }
  *(_BYTE *)(a1 + 27) = *(_BYTE *)(a2 + 136);
  return 0;
}

uint64_t Q_RateControl(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  if (*(_BYTE *)(a1 + 92))
    return 0;
  v4 = *(double *)(a1 + 44);
  if (v4 < 0.0)
    v4 = -v4;
  v5 = a3 / v4;
  if (v4 <= 0.0)
    v5 = 6144.0;
  v6 = *(double *)(a1 + 36);
  if (v6 - v5 <= 0.0)
  {
    v6 = *(double *)(a1 + 20);
    v7 = (double *)(a1 + 52);
  }
  else
  {
    v7 = (double *)(a1 + 4);
  }
  v8 = v6 + *v7 - v5;
  v9 = *(double *)(a1 + 28);
  v10 = v8 - v9;
  if (!*(_BYTE *)(a2 + 49))
  {
    v20 = v8 / v9 + v10 * (v10 * 0.25) * v10;
    v12 = *(char *)(a1 + 94);
    v21 = ((double)v12 + -31.0) * (((double)v12 + -31.0) * 0.1) / 900.0 + 0.05;
    if (!*(_BYTE *)(a1 + 134)
      || (v5 >= v20 * (v21 + 1.0) * *(double *)(a1 + 60)
        ? (v24 = __OFSUB__(v12, 30), v22 = v12 == 30, v23 = v12 - 30 < 0)
        : (v24 = 0, v22 = 0, v23 = 0),
          !(v23 ^ v24 | v22)))
    {
      if (*(_WORD *)(a1 + 132)
        && v5 < v20 * (v21 * -0.5 + 1.0) * *(double *)(a1 + 60)
        && *(char *)(a1 + 119) + 2 <= v12)
      {
        *(_BYTE *)(a1 + 134) = 1;
        *(_WORD *)(a1 + 132) = 1;
        v12 = (char)(v12 - 2);
        if (v12 <= 1)
          LOBYTE(v12) = 1;
        goto LABEL_37;
      }
      v19 = 0.25;
      goto LABEL_32;
    }
LABEL_34:
    *(_BYTE *)(a1 + 134) = 1;
    *(_WORD *)(a1 + 132) = 0;
    LOBYTE(v12) = v12 + 1;
    goto LABEL_37;
  }
  v11 = v8 * 20.0 / v9 + v10 * (v10 * 5.0) * v10;
  v12 = *(char *)(a1 + 94);
  v13 = ((double)v12 + -1.0) * (((double)v12 + -1.0) * 0.1) / 900.0 + 0.05;
  if (*(_BYTE *)(a1 + 134))
  {
    if (v5 >= v11 * (v13 + 1.0) * *(double *)(a1 + 60))
    {
      v16 = __OFSUB__(v12, 30);
      v14 = v12 == 30;
      v15 = v12 - 30 < 0;
    }
    else
    {
      v16 = 0;
      v14 = 0;
      v15 = 0;
    }
    if (v15 ^ v16 | v14)
      goto LABEL_34;
  }
  if (*(_WORD *)(a1 + 132))
  {
    if (v5 < v11 * (v13 * -0.5 + 1.0) * *(double *)(a1 + 60))
    {
      v18 = __OFSUB__(v12, 2);
      v17 = v12 - 2 < 0;
    }
    else
    {
      v18 = 0;
      v17 = 1;
    }
    if (v17 == v18)
    {
      *(_BYTE *)(a1 + 134) = 1;
      *(_WORD *)(a1 + 132) = 1;
      LOBYTE(v12) = v12 - 1;
LABEL_37:
      *(_BYTE *)(a1 + 94) = v12;
      return 3;
    }
  }
  v19 = 0.1;
LABEL_32:
  if (v8 < v9 * v19)
  {
    v3 = 1;
    *(_BYTE *)(a1 + 93) = 1;
    return v3;
  }
  return 0;
}

uint64_t Q_UpdateHistory(uint64_t result, uint64_t a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;

  if (!*(_BYTE *)(result + 92))
  {
    v2 = *(double *)(result + 44);
    if (v2 < 0.0)
      v2 = -v2;
    if (v2 <= 0.0)
      v3 = 6144.0;
    else
      v3 = *(double *)(result + 68) / v2;
    v4 = *(double *)(result + 4);
    v5 = *(double *)(result + 12);
    if (v4 <= v5)
      v6 = *(double *)(result + 12);
    else
      v6 = *(double *)(result + 4);
    if (v4 <= v5)
      v7 = *(double *)(result + 4);
    else
      v7 = *(double *)(result + 12);
    if (v6 <= 2.0e38)
      v7 = 0.0;
    v8 = v4 - v7;
    v9 = v5 - v7;
    v10 = *(double *)(result + 36);
    if (v10 >= v3)
      v11 = v10 - v3;
    else
      v11 = 0.0;
    *(double *)(result + 36) = v11;
    if (v11 > 0.0)
      v3 = 0.0;
    v12 = v9 + v3;
    *(double *)(result + 12) = v12;
    v13 = *(double *)(result + 52) + v8;
    *(double *)(result + 4) = v13;
    *(double *)(result + 20) = v13 - v12;
    if (*(_WORD *)(a2 + 52))
    {
      v14 = *(_DWORD *)(a2 + 4);
      if (*(_DWORD *)(a2 + 60) == v14 || *(_DWORD *)(a2 + 64) == v14)
      {
        *(_BYTE *)(result + 121) = *(_BYTE *)(result + 94);
        *(_DWORD *)(result + 124) = 0;
        *(_DWORD *)(a2 + 56) = 0;
      }
      else
      {
        v15 = *(char *)(result + 94);
        *(_BYTE *)(result + 122) = v15;
        *(_DWORD *)(result + 124) += v15;
        ++*(_DWORD *)(a2 + 56);
      }
    }
  }
  return result;
}

uint64_t Q_QuantizeS16(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  _BOOL8 v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _WORD *v16;
  _WORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _WORD *v30;
  _WORD *v31;
  uint64_t v32;
  uint64_t i;
  char *v34;
  _WORD *v35;
  _WORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _WORD *v41;
  _WORD *v42;
  uint64_t v43;
  int v44;

  v5 = *(_DWORD *)&a1[4 * a1[154] + 330];
  LODWORD(v6) = a1[153];
  if ((int)v6 >= 8)
  {
    v7 = 0;
    v10 = v5 != 0;
    goto LABEL_34;
  }
  v7 = 0;
  v8 = 0;
  v9 = a1[154];
  v10 = v5 != 0;
  do
  {
    v11 = v6;
    v12 = *(_QWORD *)(a4 + 8 * (char)v6 + 102656);
    if (v8 > 3)
      goto LABEL_40;
    v13 = v11;
    v14 = v8;
LABEL_5:
    v15 = &a1[8 * v14];
    v16 = (_WORD *)*((_QWORD *)v15 + 1);
    v17 = (_WORD *)*((_QWORD *)v15 + 7);
    *v17 = *v16;
    v18 = v10;
    while (1)
    {
      v19 = (__int16)v16[v18];
      v20 = *(__int16 *)(v12 + 2 * v19);
      if (*(_DWORD *)(a5 + 4 * v20) >= 0x80u)
        break;
LABEL_14:
      v17[v18++] = v20;
      if (v18 == 64)
      {
        if (++v14 == 4)
        {
          if (v8 >= 1)
          {
LABEL_40:
            for (i = 0; i != v8; ++i)
            {
              v34 = &a1[8 * i];
              v35 = (_WORD *)*((_QWORD *)v34 + 1);
              v36 = (_WORD *)*((_QWORD *)v34 + 7);
              *v36 = *v35;
              v37 = v10;
              do
              {
                v36[v37] = *(_WORD *)(v12 + 2 * (__int16)v35[v37]);
                ++v37;
              }
              while (v37 != 64);
            }
          }
          v38 = 2 * v10;
          v39 = 4;
LABEL_45:
          v40 = &a1[8 * v39];
          v41 = (_WORD *)*((_QWORD *)v40 + 1);
          v42 = (_WORD *)*((_QWORD *)v40 + 7);
          *v42 = *v41;
          v43 = v38;
          while (1)
          {
            v44 = *(__int16 *)(v12 + 2 * *(__int16 *)((char *)v41 + v43));
            if (v44 > -128)
            {
              if (v44 < 128)
              {
                *(_WORD *)((char *)v42 + v43) = v44;
                goto LABEL_52;
              }
              *(_WORD *)((char *)v42 + v43) = 127;
            }
            else
            {
              *(_WORD *)((char *)v42 + v43) = -127;
            }
            v7 = (v7 + 1);
LABEL_52:
            v43 += 2;
            if (v43 == 128)
            {
              if (++v39 == 6)
                return v7;
              goto LABEL_45;
            }
          }
        }
        goto LABEL_5;
      }
    }
    v21 = a1[155];
    if (v21 > 1 || (int)v13 > 30)
    {
      if ((int)v20 < 0)
        LOWORD(v20) = -127;
      else
        LOWORD(v20) = 127;
      goto LABEL_14;
    }
    v23 = a1[155];
    if (a1[155])
    {
      if (v23 == 255)
      {
        v24 = 255;
        goto LABEL_21;
      }
    }
    else
    {
      v24 = 1;
LABEL_21:
      v9 += v24;
      a1[154] = v9;
    }
    v7 = (v7 + 1);
    v6 = v13 + 1;
    a1[153] = v13 + 1;
    a1[155] = v21 + 1;
    if ((int)v13 > 6)
      break;
    if ((char)v21 <= 0 && *(_DWORD *)(a5 + 4 * *(char *)(*(_QWORD *)(a4 + 8 * v6 + 102656) + v19)) >= 0x80u)
    {
      if (v23 == 255)
      {
        v25 = 1;
LABEL_29:
        v9 += v25;
        a1[154] = v9;
      }
      else if (v23 == 254)
      {
        v25 = 255;
        goto LABEL_29;
      }
      LOBYTE(v6) = v13 + 2;
      a1[153] = v13 + 2;
      a1[155] = v21 + 2;
    }
    v8 = v14;
  }
  while ((char)v6 < 8);
LABEL_34:
  v26 = 0;
  v27 = *(_QWORD *)(a4 + 8 * v6 + 102656);
  v28 = 2 * v10;
  do
  {
    v29 = &a1[8 * v26];
    v30 = (_WORD *)*((_QWORD *)v29 + 1);
    v31 = (_WORD *)*((_QWORD *)v29 + 7);
    *v31 = *v30;
    v32 = v28;
    do
    {
      *(_WORD *)((char *)v31 + v32) = *(char *)(v27 + *(__int16 *)((char *)v30 + v32));
      v32 += 2;
    }
    while (v32 != 128);
    ++v26;
  }
  while (v26 != 6);
  return v7;
}

double QCM::EstimateQScale(QCM *this, double a2, double a3, double a4, int a5)
{
  double v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = *((double *)this + 2);
  if (a3 > 0.01 && *((double *)this + 3) > v5 * 1.5)
    ++*((_DWORD *)this + 14);
  v6 = v5 / a4;
  v7 = a3 > 0.04 && a5 == 0;
  if (v7 && *((int *)this + 12) >= 5)
  {
    v8 = *((_QWORD *)this + 9);
    v9 = *((int *)this + 10);
    if (v8 <= v9)
    {
      v10 = (a3 + -0.04) * *((double *)this + 4);
    }
    else
    {
      if ((double)(int)v9 * a3 / (double)v8 <= 0.04)
        return v6 * a2;
      v10 = (a3 + -0.04) * *((double *)this + 4) * (double)(int)v9 / (double)(v8 - v9);
    }
    v11 = *((double *)this + 3);
    v12 = 1.0;
    if (v11 > v5)
    {
      if (*((double *)this + 8) <= 0.03)
        v12 = (v5 + v11) * 0.5 / v5;
      else
        v12 = v11 / v5;
    }
    v13 = a4 / (a4 - v10);
    if (v12 < v13 && (v14 = 2.0, v12 = v13, v13 > 2.0) || (v14 = v12, v12 > 1.0))
      v6 = v6 * v14;
  }
  return v6 * a2;
}

double QCM::UpdateModel(QCM *this, double result, double a3, double a4, int a5)
{
  int v5;
  int v6;
  double v8;
  double v9;

  v5 = *((_DWORD *)this + 10) + 1;
  *((_DWORD *)this + 10) = v5;
  v6 = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = v6 + 1;
  if (a3 <= 10.0 || a5 == 0)
  {
    if (a3 >= 0.0)
    {
      ++*((_DWORD *)this + 11);
      ++*((_DWORD *)this + 13);
    }
  }
  else
  {
    result = result * a4 / a3;
    v8 = result + *(double *)this;
    *(double *)this = v8;
    *((double *)this + 2) = v8 / (double)(v5 - *((_DWORD *)this + 11));
    if ((v6 & 0x80000000) == 0)
    {
      v9 = result + *((double *)this + 1);
      *((double *)this + 1) = v9;
      result = v9 / (double)(v6 + 1 - *((_DWORD *)this + 13));
      *((double *)this + 3) = result;
    }
  }
  return result;
}

void FrameComplexity::InvalidateFrameComplexity(FrameComplexity *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)this;
  if (v2)
    free(v2);
  v3 = (void *)*((_QWORD *)this + 2);
  if (v3)
    free(v3);
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
    free(v4);
}

uint64_t FrameComplexity::UpdateFrameComplexity(uint64_t this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a5 % *(_DWORD *)(this + 24);
  *(double *)(*(_QWORD *)this + 8 * v5) = (double)a2;
  if (*(_BYTE *)(this + 50))
  {
    v6 = *(_QWORD *)(this + 16);
    *(double *)(*(_QWORD *)(this + 8) + 8 * v5) = fabs(sqrt((double)a3));
    *(double *)(v6 + 8 * v5) = fabs(sqrt((double)a4));
  }
  if (*(_DWORD *)(this + 52) < a5)
    *(_DWORD *)(this + 52) = a5;
  return this;
}

double FrameComplexity::CalBlurredFrameComplexity(FrameComplexity *this, unsigned int a2, int a3, int a4)
{
  int v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  unsigned int v24;
  double v25;
  double *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;

  if (*((_DWORD *)this + 14) == a2)
    return *((double *)this + 4);
  v4 = *((_DWORD *)this + 13);
  v5 = __OFSUB__(v4, a2);
  v6 = v4 - a2;
  if (v6 < 0 != v5)
    return *((double *)this + 4);
  *((_DWORD *)this + 14) = a2;
  if (!*((_DWORD *)this + 15))
  {
    if (v6 >= 6)
      LODWORD(v16) = 6;
    else
      LODWORD(v16) = v6;
    if (a2)
    {
      v17 = 0;
      v18 = a2 - 1;
      v19 = 0.0;
      v20 = 0.0;
      do
      {
        if ((v18 & 0x80000000) == 0)
        {
          v21 = *(double *)&weightFrameComplexity[v17];
          v19 = v19 + v21 * *(double *)(*(_QWORD *)this + 8 * (v18 % *((_DWORD *)this + 6)));
          v20 = v20 + v21;
        }
        --v18;
        ++v17;
      }
      while (v17 != 6);
    }
    else
    {
      v20 = 0.0;
      v19 = 0.0;
    }
    v22 = *(double *)this;
    if (v6 <= 0)
    {
      v24 = *((_DWORD *)this + 6);
      v27 = 0.0;
      v25 = 0.0;
    }
    else
    {
      v23 = a2 + 1;
      v24 = *((_DWORD *)this + 6);
      if ((int)v16 <= 1)
        v16 = 1;
      else
        v16 = v16;
      v25 = 0.0;
      v26 = (double *)weightFrameComplexity;
      v27 = 0.0;
      do
      {
        v28 = *v26++;
        v25 = v25 + v28 * *(double *)(*(_QWORD *)&v22 + 8 * (v23 % v24));
        v27 = v27 + v28;
        ++v23;
        --v16;
      }
      while (v16);
    }
    v29 = v25 / v27;
    v30 = 0.0;
    if (v27 <= 0.0)
      v29 = 0.0;
    v31 = a2 % v24;
    if (v20 > 0.0)
      v30 = v19 / v20;
    v32 = *(double *)(*(_QWORD *)&v22 + 8 * v31);
    if (v20 > 0.0 || (v33 = *(double *)(*(_QWORD *)&v22 + 8 * v31), v27 > 0.0))
      v33 = (v19 + v25 + v32) / (v20 + v27 + 1.0);
    *((_WORD *)this + 24) = 0;
    if (a4
      && *((_BYTE *)this + 50)
      && ((v34 = *(double *)(*((_QWORD *)this + 1) + 8 * v31), v34 > 10.0)
        ? (v35 = *(double *)(*((_QWORD *)this + 2) + 8 * v31) <= v34 * 3.162278)
        : (v35 = 1),
          !v35))
    {
      *((_BYTE *)this + 48) = 1;
    }
    else if (!a3)
    {
      if (v29 <= 0.0)
        goto LABEL_64;
      v36 = v29 - v30;
      if (v29 - v30 < 0.0)
        v36 = -(v29 - v30);
      if (v36 / v33 <= 0.15)
      {
LABEL_64:
        *((double *)this + 4) = v33;
      }
      else
      {
        v37 = v29 - v33;
        if (v29 - v33 < 0.0)
          v37 = -(v29 - v33);
        v38 = v30 - v33;
        if (v30 - v33 < 0.0)
          v38 = -(v30 - v33);
        if (v37 >= v38)
          v39 = v30 + v32;
        else
          v39 = v29 + v32;
        *((double *)this + 4) = v39 * 0.5;
      }
      return *((double *)this + 4);
    }
    *((double *)this + 4) = v29;
    return *((double *)this + 4);
  }
  v7 = a2 % *((_DWORD *)this + 6);
  v8 = *(double *)(*(_QWORD *)this + 8 * v7);
  v9 = fabs(sqrt(v8));
  v10 = v8 == -INFINITY;
  v11 = INFINITY;
  if (!v10)
    v11 = v9;
  *((_WORD *)this + 24) = 0;
  if (a4)
  {
    if (*((_BYTE *)this + 50))
    {
      v12 = *(double *)(*((_QWORD *)this + 1) + 8 * v7);
      if (a3 || (v12 > 10.0 ? (v13 = *(double *)(*((_QWORD *)this + 2) + 8 * v7) <= v12 * 3.162278) : (v13 = 1), !v13))
      {
        *((_BYTE *)this + 48) = 1;
        v11 = v12;
      }
    }
    v14 = fmax(v11, 10.0);
    v15 = *((double *)this + 5);
    if (v15 > 0.0)
    {
      if ((v15 - v14) / v15 > 0.15)
      {
        v14 = (v15 + v14) * 0.5;
        *((double *)this + 4) = v14;
        *((_BYTE *)this + 49) = 1;
LABEL_62:
        *((double *)this + 5) = v14;
        return *((double *)this + 4);
      }
      v14 = (v14 + v15 * 7.0) * 0.125;
    }
    *((double *)this + 4) = v14;
    goto LABEL_62;
  }
  return *((double *)this + 4);
}

uint64_t CPP_Callback_Function_Init(uint64_t a1, uint64_t a2)
{
  SinglepassRatecontroller::Init(a1, a2);
  return a1;
}

void *SinglepassRatecontroller::Init(uint64_t a1, uint64_t a2)
{
  double v3;
  unsigned int v4;
  double v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  unsigned int v9;
  void *result;

  v3 = *(double *)(a2 + 8);
  v4 = *(_DWORD *)a2;
  v5 = (double)*(unsigned int *)a2;
  *(double *)(a1 + 8) = v5;
  *(double *)(a1 + 16) = v3;
  v6 = *(unsigned int *)(a2 + 20);
  *(_BYTE *)(a1 + 87) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 64) = 0;
  if (v4 <= 0x15F90)
    v7 = 30;
  else
    v7 = 25;
  *(_BYTE *)(a1 + 67) = v7;
  *(_BYTE *)(a1 + 65) = v7;
  *(_BYTE *)(a1 + 66) = v7;
  *(double *)(a1 + 72) = (double)v7;
  *(_WORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 264) = 0;
  *(_DWORD *)(a1 + 83) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 40) = 0x3F847AE147AE147BLL;
  v8 = *(_DWORD *)(a2 + 24) < 2;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(double *)(a1 + 144) = v5 / v3;
  *(_OWORD *)(a1 + 152) = xmmword_2285758E0;
  *(_DWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = v6;
  *(_DWORD *)(a1 + 192) = 0;
  v9 = 2 * *(_DWORD *)(a2 + 24) + 5;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 240) = 0;
  *(_WORD *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 260) = v8;
  *(_BYTE *)(a1 + 250) = 0;
  *(_QWORD *)(a1 + 252) = 0xFFFFFFFF00000000;
  *(_DWORD *)(a1 + 224) = v9;
  result = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 200) = result;
  return result;
}

double CPP_Callback_Function_SetFrameDuration(uint64_t a1, double a2)
{
  double v2;
  double result;

  v2 = 1000.0 / a2;
  if (1000.0 / a2 > 5.0 && v2 < 35.0)
    *(double *)(a1 + 16) = v2;
  result = *(double *)(a1 + 264) + a2;
  *(double *)(a1 + 264) = result;
  return result;
}

uint64_t SinglepassRatecontroller::GetQp(SinglepassRatecontroller *this, uint64_t a2)
{
  int v3;
  int v4;
  unsigned int v5;
  double v6;
  int v7;

  v3 = *(_DWORD *)(a2 + 8);
  if (v3 == *((_DWORD *)this + 23))
  {
    if (!v3)
    {
      *((_BYTE *)this + 88) = *(_DWORD *)(a2 + 12);
      *((_BYTE *)this + 86) = 1;
    }
    v4 = (int)(pow(1.125, (double)*((char *)this + 65)) * 0.625 * 0.5 + 0.5);
    if (v4 >= 31)
      v4 = 31;
    if (v4 <= 1)
      LOBYTE(v4) = 1;
  }
  else
  {
    *((_DWORD *)this + 23) = v3;
    v5 = *(char *)(a2 + 12);
    *((_BYTE *)this + 88) = v5;
    SinglepassRatecontroller::CalculateQp_(this, v5);
    v4 = (int)(pow(1.125, (double)*((char *)this + 65)) * 0.625 * 0.5 + 0.5);
    if (v4 >= 31)
      v4 = 31;
    if (v4 <= 1)
      v4 = 1;
    v6 = ((double)v4 + *((double *)this + 9) * (double)*((int *)this + 24))
       / (double)(*((_DWORD *)this + 24) + 1);
    *((double *)this + 9) = v6;
    v7 = (int)v6 - 4;
    if (v6 >= 31.0 || v6 <= 8.0)
      LOBYTE(v7) = 3;
    if (v4 <= (char)v7)
      LOBYTE(v4) = v7;
  }
  return (char)v4;
}

uint64_t CPP_Callback_Function_UpdateFrameComplexity(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  return FrameComplexity::UpdateFrameComplexity(a1 + 200, a2, a3, a4, a5);
}

double SinglepassRatecontroller::UpdateRateControllerAfterEncodingFrame(SinglepassRatecontroller *this, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  int v10;
  FrameComplexity *v11;
  unsigned int v12;
  int v13;
  double v14;
  long double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  BOOL v21;

  v10 = (int)(*((double *)this + 1) / *((double *)this + 2));
  v11 = (SinglepassRatecontroller *)((char *)this + 200);
  v12 = *((unsigned __int8 *)this + 88);
  v13 = v12 < 0xA && ((0x2BDu >> v12) & 1) != 0 || v12 == 8;
  v14 = FrameComplexity::CalBlurredFrameComplexity(v11, a4, *((unsigned __int8 *)this + 86), v13);
  v15 = log(((double)a5 + (double)a5) / 0.625);
  v16 = exp2((v15 / 0.117783036 + -12.0) / 6.0);
  *((_DWORD *)this + 20) += a2 - v10;
  ++*((_DWORD *)this + 24);
  if (*((_BYTE *)this + 64))
  {
    v17 = *((double *)this + 5) * 0.95 + 1.0;
    v18 = *((double *)this + 6) * 0.95 + (double)(a2 - a3);
    *((double *)this + 5) = v17;
    *((double *)this + 6) = v18;
    *((double *)this + 7) = v18 / v17;
  }
  else
  {
    a3 = a2;
  }
  v19 = v16 * 0.85;
  v20 = *((unsigned __int8 *)this + 88);
  if (v20 > 9)
    goto LABEL_11;
  v21 = 1;
  if (((1 << v20) & 0x129) != 0)
  {
    v21 = *((_BYTE *)this + 89) != 0;
    goto LABEL_13;
  }
  if (((1 << v20) & 0x294) != 0)
  {
LABEL_13:
    *((_BYTE *)this + 85) = v21;
    *((_BYTE *)this + 66) = *((_BYTE *)this + 65);
    return QCM::UpdateModel((SinglepassRatecontroller *)((char *)this + 112), v19, v14, (double)a3, 1);
  }
LABEL_11:
  v19 = v19 / 1.3;
  return QCM::UpdateModel((SinglepassRatecontroller *)((char *)this + 112), v19, v14, (double)a3, 1);
}

uint64_t CPP_Callback_Function_SizeofSinglepassRatecontroller()
{
  return 272;
}

uint64_t CPP_Callback_Function_SizeofFrame()
{
  return 20;
}

uint64_t CPP_Callback_Function_SetFlagIsRefPic(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t CPP_Callback_Function_SetDisplayOdrIdx(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t CPP_Callback_Function_GetDisplayOdrIdx(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t CPP_Callback_Function_SetSliceType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2;
  return result;
}

uint64_t CPP_Callback_Function_SetQP(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t CPP_Callback_Function_GetQP(uint64_t a1)
{
  return *(char *)(a1 + 16);
}

void CPP_Callback_Function_Kill(_DWORD *a1)
{
  FrameComplexity::InvalidateFrameComplexity((FrameComplexity *)(a1 + 50));
  *a1 = 0;
}

uint64_t SinglepassRatecontroller::CalculateQp_(SinglepassRatecontroller *this, unsigned int a2)
{
  _BOOL4 v4;
  double v5;
  double v6;
  int v7;
  FrameComplexity *v8;
  int v9;
  unint64_t v10;
  int v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  _BOOL4 v19;
  long double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  uint64_t result;
  int v38;

  if (a2 > 9)
  {
LABEL_4:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
  if (((1 << a2) & 0x129) == 0)
  {
    if (((1 << a2) & 0x294) != 0)
      goto LABEL_6;
    goto LABEL_4;
  }
  v4 = *((_BYTE *)this + 89) != 0;
LABEL_6:
  v5 = *((double *)this + 1);
  v6 = *((double *)this + 2);
  v7 = *((_DWORD *)this + 20);
  *((_BYTE *)this + 86) = v4;
  v8 = (SinglepassRatecontroller *)((char *)this + 200);
  v9 = *((_DWORD *)this + 24);
  v10 = *((char *)this + 88);
  if (v10 > 9)
    v11 = 0;
  else
    v11 = dword_228575940[v10];
  v12 = FrameComplexity::CalBlurredFrameComplexity(v8, *((_DWORD *)this + 23), v4, v11);
  if (*((_BYTE *)this + 86))
    v13 = 1;
  else
    v13 = *((_BYTE *)this + 248) != 0;
  *((_BYTE *)this + 86) = v13;
  if (a2 > 9 || ((1 << a2) & 0x3BD) == 0)
  {
    result = SinglepassRatecontroller::BframeRc_(this);
    goto LABEL_62;
  }
  v14 = v5 / v6 * (double)(*((_DWORD *)this + 24) + 1) / (double)*((int *)this + 24);
  if (*((_BYTE *)this + 64))
    v14 = v14 - *((double *)this + 7);
  v15 = (double)v7 / (v5 / v6 * (double)(v9 + 1));
  if (v13)
  {
    v16 = *((double *)this + 16);
    if (v15 > 0.01 && *((double *)this + 17) > v16 * 1.5)
      ++*((_DWORD *)this + 42);
    v13 = 0;
    *((_QWORD *)this + 15) = 0;
    *((_QWORD *)this + 17) = 0;
    v17 = *((_DWORD *)this + 40);
    v18 = v12 * (v16 / v14) / 1.4;
    if (v17 <= 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  v18 = 0.0;
  if (a2 > 8 || ((1 << a2) & 0x129) == 0)
    goto LABEL_33;
  if (*((_BYTE *)this + 248))
    v19 = 1;
  else
    v19 = *((_BYTE *)this + 249) != 0;
  if (*((_BYTE *)this + 85))
  {
    v20 = exp2((double)(*((char *)this + 66) - 10) / 6.0);
    v13 = 0;
    v18 = v20 * 0.85;
    if (!v19)
      goto LABEL_33;
  }
  else
  {
    v18 = QCM::EstimateQScale((SinglepassRatecontroller *)((char *)this + 112), v12, v15, v14, v19);
    v13 = 1;
    if (!v19)
      goto LABEL_33;
  }
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 17) = 0;
  v17 = *((_DWORD *)this + 40);
  if (v17 >= 1)
LABEL_21:
    *((double *)this + 22) = (double)*((int *)this + 42) / (double)v17;
LABEL_22:
  *((_DWORD *)this + 41) = 0;
  *((_DWORD *)this + 42) = 0;
  *((_DWORD *)this + 40) = -1;
LABEL_33:
  v21 = *((double *)this + 1);
  v22 = *((_DWORD *)this + 24);
  v23 = (double)*((int *)this + 20);
  v24 = v23 / ((v21 + v21) * fmax(sqrt((double)(v22 / 25)), 1.0)) + 1.0;
  v25 = 2.0;
  if (v24 <= 2.0)
    v25 = v24;
  if (v24 >= 0.5)
    v26 = v25;
  else
    v26 = 0.5;
  if (v22 >= 5)
    v27 = v26;
  else
    v27 = 1.0;
  v28 = *((double *)this + 4);
  if (v28 > 0.0)
  {
    v29 = *((double *)this + 33);
    if (v29 > v28 * 1000.0 * 0.7)
    {
      v30 = v23 / v29 / v21 + 1.0;
      if (v30 >= 0.94 && v30 <= 1.04)
        v30 = 1.0;
      v27 = v27 * v30;
    }
  }
  v32 = v18 * v27;
  if (v13)
  {
    v33 = (double)*((char *)this + 66);
    if (*((_BYTE *)this + 85))
      v33 = v33 + 2.912561;
    v34 = exp2((v33 + -12.0) / 6.0) * 0.85;
    v35 = v34 / 1.514528;
    v36 = v34 * 1.514528;
    if (v27 <= 1.05)
    {
      if (v27 < 0.95)
        v35 = v35 / 1.514528;
    }
    else
    {
      v36 = v36 * 1.514528;
    }
    if (v35 <= v32)
    {
      v35 = v32;
      if (v36 < v32)
        v35 = v36;
    }
  }
  else
  {
    v35 = v18 * v27;
  }
  result = (log(v35 / 0.85) * 6.0 / 0.693147181 + 12.0 + 0.5);
LABEL_62:
  v38 = (char)result;
  if ((char)result >= 51)
    v38 = 51;
  *((_BYTE *)this + 65) = v38 & ~(v38 >> 31);
  return result;
}

uint64_t SinglepassRatecontroller::BframeRc_(SinglepassRatecontroller *this)
{
  unsigned int v1;
  unsigned int v3;
  double v5;
  BOOL v6;
  int v7;
  int v9;
  int v11;
  int v12;

  v1 = *((unsigned __int8 *)this + 104);
  if (v1 > 9 || ((1 << v1) & 0x294) == 0)
  {
    v3 = *((unsigned __int8 *)this + 105);
    goto LABEL_11;
  }
  v3 = *((unsigned __int8 *)this + 105);
  if (v3 > 9 || ((1 << v3) & 0x294) == 0)
  {
    if (v1 <= 9 && ((1 << v1) & 0x294) != 0)
    {
LABEL_18:
      v9 = *((char *)this + 100);
      goto LABEL_19;
    }
LABEL_11:
    v6 = v3 > 9;
    v7 = (1 << v3) & 0x294;
    if (v6 || v7 == 0)
    {
      v11 = *((char *)this + 102);
      v12 = *((unsigned __int8 *)this + 103);
      if (v11 >= 1)
      {
        if ((char)v12 >= 1)
        {
          v5 = (double)(*((char *)this + 100) * v12 + *((char *)this + 101) * v11) / (double)(v12 + v11);
          return (int)(v5 + 2.27107 + 0.5);
        }
        goto LABEL_18;
      }
      if ((char)v12 < 1)
      {
        v5 = 0.0;
        return (int)(v5 + 2.27107 + 0.5);
      }
    }
    v9 = *((char *)this + 101);
LABEL_19:
    v5 = (double)v9;
    return (int)(v5 + 2.27107 + 0.5);
  }
  v5 = (double)(*((char *)this + 101) + *((char *)this + 100)) * 0.5 + 2.912561;
  return (int)(v5 + 2.27107 + 0.5);
}

uint64_t RowCol8x8S16(_WORD *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  float *v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  float v20;
  float v21;
  float v22;
  float v23;
  __int16 v24;
  int v25;
  float v26;
  float v27;
  uint64_t v28;
  _WORD *v29;
  _BOOL4 v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  _BOOL4 v52;
  float v53;
  BOOL v54;
  int v55;
  float v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint64_t result;
  int v63;
  _BYTE v64[256];
  uint64_t v65;

  v8 = 0;
  v65 = *MEMORY[0x24BDAC8D0];
  do
  {
    v9 = (float *)&v64[v8];
    v10 = a1[7];
    v11 = a1[1];
    v12 = a1[6];
    v13 = a1[2];
    v14 = a1[5];
    v15 = a1[3];
    v16 = a1[4];
    v17 = v10 + *a1;
    v18 = *a1 - v10;
    v19 = v12 + v11;
    v20 = *(float *)(a5 + 4 * v18);
    v21 = *(float *)(a5 + 4 * (__int16)(v11 - v12));
    v22 = *(float *)(a5 + 4 * (__int16)(v13 - v14));
    v23 = *(float *)(a5 + 4 * (__int16)(v15 - v16));
    v24 = v14 + v13 + v12 + v11;
    v25 = *(_DWORD *)(a7 + 4 * (__int16)(v16 + v15 + v17 - v24));
    v26 = *(float *)(a6 + 4 * (__int16)(v17 - (v16 + v15)));
    v27 = *(float *)(a6 + 4 * (__int16)(v19 - (v14 + v13)));
    *v9 = *(float *)(a7 + 4 * (__int16)(v16 + v15 + v17 + v24));
    v9[1] = (float)((float)(v20 + (float)(v21 * 0.84776)) + (float)(v22 * 0.56645)) + (float)(v23 * 0.19891);
    v9[2] = v26 + (float)(v27 * 0.41421);
    v9[3] = (float)((float)(v20 * 0.84776) - (float)(v22 - (float)(v21 * -0.19891))) + (float)(v23 * -0.56645);
    *((_DWORD *)v9 + 4) = v25;
    v9[5] = (float)((float)(v22 * 0.19891) - (float)(v21 - (float)(v20 * 0.56645))) + (float)(v23 * 0.84776);
    v9[6] = -(float)(v27 - (float)(v26 * 0.41421));
    v9[7] = (float)((float)(v21 * -0.56645) - (float)(v23 - (float)(v20 * 0.19891))) + (float)(v22 * 0.84776);
    v8 += 32;
    a1 += 8;
  }
  while ((_DWORD)v8 != 256);
  v28 = 0;
  v29 = (_WORD *)(a2 + 64);
  do
  {
    v30 = a4 != 0;
    v31 = *(float *)&v64[v28];
    v32 = *(float *)&v64[v28 + 224];
    v33 = *(float *)&v64[v28 + 32];
    v34 = *(float *)&v64[v28 + 192];
    v35 = *(float *)&v64[v28 + 64];
    v36 = *(float *)&v64[v28 + 160];
    v37 = *(float *)&v64[v28 + 96];
    v38 = *(float *)&v64[v28 + 128];
    v39 = v31 + v32;
    v40 = v31 - v32;
    v41 = v33 + v34;
    v42 = v33 - v34;
    v43 = v35 + v36;
    v44 = v35 - v36;
    v45 = v37 + v38;
    v46 = v37 - v38;
    v47 = v39 + v45;
    v48 = v41 + v43;
    v49 = v39 - v45;
    v50 = v47 * 0.35355;
    v51 = v50 + (float)((float)(v41 + v43) * 0.35355);
    v52 = v28 == 0;
    v54 = v30 && v52;
    if (v30 && v52)
    {
      v53 = v51 * 0.125 + 0.5;
      v51 = v53;
    }
    v55 = (int)v51;
    v56 = v41 - v43;
    v57 = (int)(float)(v50 + (float)(v48 * -0.35355));
    v58 = (int)(float)((float)(v49 * 0.46194) + (float)(v56 * 0.19134));
    v59 = (int)(float)((float)(v49 * 0.19134) + (float)(v56 * -0.46194));
    v60 = (int)(float)((float)((float)((float)(v40 * 0.49039) + (float)(v42 * 0.41573)) + (float)(v44 * 0.27779))
                     + (float)(v46 * 0.097545));
    v61 = (int)(float)((float)((float)((float)(v40 * 0.41573) + (float)(v42 * -0.097545)) + (float)(v44 * -0.49039))
                     + (float)(v46 * -0.27779));
    result = (int)(float)((float)((float)((float)(v40 * 0.27779) + (float)(v42 * -0.49039))
                                              + (float)(v44 * 0.097545))
                                      + (float)(v46 * 0.41573));
    v63 = (int)(float)((float)((float)((float)(v40 * 0.097545) + (float)(v42 * -0.27779)) + (float)(v44 * 0.41573))
                     + (float)(v46 * -0.49039));
    if (v54)
    {
      if (v55 <= 1)
        v55 = 1;
      if (v55 >= 254)
        LOWORD(v55) = 254;
      *(v29 - 32) = v55;
      if (a3 < 8)
        goto LABEL_15;
    }
    else
    {
      if (a3 < 8)
      {
        *(v29 - 32) = v55;
LABEL_15:
        *v29 = v57;
        *(v29 - 24) = v60;
        *(v29 - 16) = v58;
        *(v29 - 8) = v61;
        v29[8] = result;
        v29[16] = v59;
        goto LABEL_18;
      }
      *(v29 - 32) = *(char *)(a8 + v55);
    }
    *v29 = *(char *)(a8 + v57);
    *(v29 - 24) = *(char *)(a8 + v60);
    *(v29 - 16) = *(char *)(a8 + v58);
    *(v29 - 8) = *(char *)(a8 + v61);
    v29[8] = *(char *)(a8 + (int)result);
    v29[16] = *(char *)(a8 + v59);
    LOWORD(v63) = *(char *)(a8 + v63);
LABEL_18:
    v29[24] = v63;
    v28 += 4;
    ++v29;
  }
  while ((_DWORD)v28 != 32);
  return result;
}

double RowCol4x4S16(_WORD *a1, _WORD *a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  float *v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  _BOOL4 v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  _BOOL4 v49;
  float v50;
  BOOL v51;
  int v52;
  int v53;
  int v54;
  int v55;
  double result;
  _BYTE v57[256];
  uint64_t v58;

  v8 = 0;
  v58 = *MEMORY[0x24BDAC8D0];
  do
  {
    v9 = (float *)&v57[v8];
    v10 = a1[7];
    v11 = a1[1];
    v12 = a1[6];
    v13 = a1[2];
    v14 = a1[5];
    v15 = a1[3];
    v16 = a1[4];
    v17 = v10 + *a1;
    v18 = *a1 - v10;
    v19 = v12 + v11;
    v20 = v11 - v12;
    v21 = v13 - v14;
    v22 = v14 + v13;
    v23 = *(float *)(a5 + 4 * v18);
    v24 = *(float *)(a5 + 4 * v20);
    v25 = *(float *)(a6 + 4 * (__int16)(v17 - (v16 + v15)))
        + (float)(*(float *)(a6 + 4 * (__int16)(v19 - v22)) * 0.41421);
    v26 = *(float *)(a5 + 4 * v21);
    v27 = v23 + (float)(v24 * 0.84776);
    v28 = (float)(v23 * 0.84776) - (float)(v26 - (float)(v24 * -0.19891));
    v29 = *(float *)(a5 + 4 * (__int16)(v15 - v16));
    *v9 = *(float *)(a7 + 4 * (__int16)(v19 + v17 + v22 + v16 + v15));
    v9[1] = (float)(v27 + (float)(v26 * 0.56645)) + (float)(v29 * 0.19891);
    v9[2] = v25;
    v9[3] = v28 + (float)(v29 * -0.56645);
    v8 += 32;
    a1 += 8;
  }
  while ((_DWORD)v8 != 256);
  v30 = 0;
  do
  {
    v31 = a4 != 0;
    v32 = *(float *)&v57[v30];
    v33 = *(float *)&v57[v30 + 224];
    v34 = *(float *)&v57[v30 + 32];
    v35 = *(float *)&v57[v30 + 192];
    v36 = *(float *)&v57[v30 + 64];
    v37 = *(float *)&v57[v30 + 160];
    v38 = *(float *)&v57[v30 + 96];
    v39 = *(float *)&v57[v30 + 128];
    v40 = v32 + v33;
    v41 = v32 - v33;
    v42 = v34 + v35;
    v43 = v34 - v35;
    v44 = v36 + v37;
    v45 = v36 - v37;
    v46 = v38 + v39;
    v47 = v38 - v39;
    v48 = (float)((float)(v40 + v46) * 0.35355) + (float)((float)(v42 + v44) * 0.35355);
    v49 = v30 == 0;
    v51 = v31 && v49;
    if (v31 && v49)
    {
      v50 = v48 * 0.125 + 0.5;
      v48 = v50;
    }
    v52 = (int)v48;
    v53 = (int)(float)((float)((float)(v40 - v46) * 0.46194) + (float)((float)(v42 - v44) * 0.19134));
    v54 = (int)(float)((float)((float)((float)(v41 * 0.49039) + (float)(v43 * 0.41573)) + (float)(v45 * 0.27779))
                     + (float)(v47 * 0.097545));
    v55 = (int)(float)((float)((float)((float)(v41 * 0.41573) + (float)(v43 * -0.097545)) + (float)(v45 * -0.49039))
                     + (float)(v47 * -0.27779));
    if (v51)
    {
      if (v52 <= 1)
        v52 = 1;
      if (v52 >= 254)
        LOWORD(v52) = 254;
      *a2 = v52;
      if (a3 < 8)
        goto LABEL_15;
    }
    else
    {
      if (a3 < 8)
      {
        *a2 = v52;
LABEL_15:
        a2[8] = v54;
        a2[16] = v53;
        goto LABEL_18;
      }
      *a2 = *(char *)(a8 + v52);
    }
    a2[8] = *(char *)(a8 + v54);
    a2[16] = *(char *)(a8 + v53);
    LOWORD(v55) = *(char *)(a8 + v55);
LABEL_18:
    a2[24] = v55;
    a2[32] = 0;
    a2[40] = 0;
    a2[48] = 0;
    a2[56] = 0;
    ++a2;
    v30 += 4;
  }
  while ((_DWORD)v30 != 16);
  result = 0.0;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 2) = 0;
  *((_QWORD *)a2 + 4) = 0;
  *((_QWORD *)a2 + 6) = 0;
  *((_QWORD *)a2 + 8) = 0;
  *((_QWORD *)a2 + 10) = 0;
  *((_QWORD *)a2 + 12) = 0;
  *((_QWORD *)a2 + 14) = 0;
  return result;
}

int32x4_t iRowCol8x8f1S16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  int32x4_t *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
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
  unint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  int v45;
  int v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  int32x4_t v57;
  int32x4_t v58;
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int64x2_t v67;
  int64x2_t v68;
  int32x4_t v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int64x2_t v74;
  int64x2_t v75;
  int64x2_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int64x2_t v89;
  int64x2_t v90;
  int64x2_t v91;
  int64x2_t v92;
  int32x4_t v93;
  int64x2_t v94;
  int64x2_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int64x2_t v99;
  int64x2_t v100;
  int32x4_t v101;
  int32x4_t v102;
  uint64_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int64x2_t v114;
  int32x4_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int64x2_t v118;
  int64x2_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int64x2_t v122;
  int64x2_t v123;
  int32x4_t v124;
  int32x4_t v125;
  int32x4_t v126;
  int32x4_t v127;
  int32x4_t v128;
  int32x4_t v129;
  int32x4_t v130;
  int32x4_t v131;
  int32x4_t v132;
  int32x4_t v133;
  int32x4_t v134;
  int32x4_t v135;
  int32x4_t v136;
  int32x4_t v137;
  int32x4_t v138;
  int32x4_t v139;
  int32x4_t result;
  int32x4_t v141;
  int32x4_t v142;
  int32x4_t v143;
  int32x4_t v144;
  int32x4_t v145;
  int32x4_t v146;
  int32x4_t v147;
  int32x4_t v148;
  int32x4_t v149;
  int32x4_t v150;
  int32x4_t v151;
  int32x4_t v152;
  int32x4_t v153;
  int32x4_t v154;
  int32x4_t v155;
  int32x4_t v156;
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  if ((a5 & 0x80000000) != 0)
  {
    v10 = 0;
    v11 = &v141;
LABEL_13:
    bzero(v11, 32 * (v10 + 7) + 32);
    goto LABEL_14;
  }
  v10 = ~a5;
  v11 = &v141;
  v12 = -1;
  do
  {
    v13 = *a1;
    if (v12 == -1)
    {
      if (a4)
        v14 = (_DWORD)v13 << 10;
      else
        v14 = *(int *)(a8 + 4 * v13) >> 1;
      v15 = a7;
    }
    else
    {
      v14 = *(_DWORD *)(a7 + 4 * v13);
      v15 = a8;
    }
    v16 = *(_DWORD *)(v15 + 4 * a1[1]);
    v17 = *(_DWORD *)(v15 + 4 * a1[2]);
    v18 = *(_DWORD *)(v15 + 4 * a1[3]);
    v19 = *(_DWORD *)(v15 + 4 * a1[4]);
    v20 = *(_DWORD *)(v15 + 4 * a1[5]);
    v21 = *(_DWORD *)(v15 + 4 * a1[6]);
    v22 = *(_DWORD *)(v15 + 4 * a1[7]);
    v23 = v22 + v18;
    v24 = v20 + v16 - v23;
    v25 = 2 * (v20 - v22);
    v26 = 4 * v22;
    v27 = v23 - (v22 + v20);
    v28 = (unint64_t)(724 * v26) >> 10;
    v29 = 2 * v27 - v28;
    v30 = (unint64_t)(946 * ((int)v28 + 2 * v27)) >> 10;
    v31 = (unint64_t)(0x3FFFFFFFE78 * v29) >> 10;
    v32 = (unint64_t)(724 * v25) >> 10;
    v33 = v24 - v32;
    LODWORD(v32) = v24 + v32;
    v34 = v32 + v30;
    v35 = v33 + v31;
    LODWORD(v30) = v32 - v30;
    v36 = (unint64_t)(1004 * v34) >> 10;
    v37 = (unint64_t)(0x3FFFFFFFCADLL * (v33 - (int)v31)) >> 10;
    v38 = v17 - v21;
    v39 = (unint64_t)(1448 * v21) >> 10;
    v40 = v38 - v39;
    v41 = (unint64_t)(946 * (v38 + (int)v39)) >> 10;
    v42 = (unint64_t)(0x3FFFFFFFE78 * v40) >> 10;
    v43 = (unint64_t)(724 * v19) >> 10;
    v44 = v14 - v43;
    v45 = v14 + v43;
    LODWORD(v43) = v45 + v41;
    v46 = v44 - v42;
    v11[1].i32[2] = v44 - v42 + v37;
    v11[1].i32[3] = v45 + v41 - v36;
    v47 = (unint64_t)(569 * v35) >> 10;
    v48 = (unint64_t)(0x3FFFFFFFF38 * (int)v30) >> 10;
    LODWORD(v42) = v44 + v42;
    v49 = v45 - v41;
    v11[1].i32[0] = v49 + v48;
    v11[1].i32[1] = v42 - v47;
    v11->i32[2] = v42 + v47;
    v11->i32[3] = v49 - v48;
    v11->i32[0] = v43 + v36;
    v11->i32[1] = v46 - v37;
    v11 += 2;
    ++v12;
    a1 += 8;
  }
  while (a5 != v12);
  if (a5 <= 6)
    goto LABEL_13;
LABEL_14:
  v50 = vaddq_s32(v155, v147);
  v51 = vaddq_s32(v156, v148);
  v52 = vsubq_s32(vaddq_s32(v152, v144), v51);
  v53 = vsubq_s32(vaddq_s32(v151, v143), v50);
  v54 = vsubq_s32(v152, v156);
  v55 = vsubq_s32(v151, v155);
  v56 = vaddq_s32(v55, v55);
  v57 = vaddq_s32(v54, v54);
  v58 = vshlq_n_s32(v156, 2uLL);
  v59 = vshlq_n_s32(v155, 2uLL);
  v60 = vsubq_s32(v51, vaddq_s32(v156, v152));
  v61 = vsubq_s32(v50, vaddq_s32(v155, v151));
  v62 = vaddq_s32(v61, v61);
  v63 = vaddq_s32(v60, v60);
  v64 = vdupq_n_s32(0x2D4u);
  v65 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v59.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v59, v64), 0xAuLL);
  v66 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v58.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v58, v64), 0xAuLL);
  v67 = (int64x2_t)vsubq_s32(v63, v66);
  v68 = (int64x2_t)vsubq_s32(v62, v65);
  v69 = vaddq_s32(v63, v66);
  v70 = vaddq_s32(v62, v65);
  v71 = vdupq_n_s32(0x3B2u);
  v72 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v70.i8, *(int32x2_t *)v71.i8), 0xAuLL), vmull_high_s32(v70, v71), 0xAuLL);
  v73 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v69.i8, *(int32x2_t *)v71.i8), 0xAuLL), vmull_high_s32(v69, v71), 0xAuLL);
  v74.i64[0] = v68.i32[0];
  v74.i64[1] = v68.i32[1];
  v75 = v74;
  v74.i64[0] = v68.i32[2];
  v74.i64[1] = v68.i32[3];
  v76 = v74;
  v74.i64[0] = v67.i32[0];
  v74.i64[1] = v67.i32[1];
  v67.i64[0] = 0x3FFFFFFFE78 * v67.i32[2];
  v67.i64[1] = 0x3FFFFFFFE78 * v67.i32[3];
  v68.i64[0] = 0x3FFFFFFFE78 * v74.i64[0];
  v68.i64[1] = 0x3FFFFFFFE78 * v74.i64[1];
  v76.i64[0] *= 0x3FFFFFFFE78;
  v76.i64[1] *= 0x3FFFFFFFE78;
  v75.i64[0] *= 0x3FFFFFFFE78;
  v75.i64[1] *= 0x3FFFFFFFE78;
  v77 = vshrn_high_n_s64(vshrn_n_s64(v75, 0xAuLL), v76, 0xAuLL);
  v78 = vshrn_high_n_s64(vshrn_n_s64(v68, 0xAuLL), v67, 0xAuLL);
  v79 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v57.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v57, v64), 0xAuLL);
  v80 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v56.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v56, v64), 0xAuLL);
  v81 = vsubq_s32(v53, v80);
  v82 = vsubq_s32(v52, v79);
  v83 = vaddq_s32(v53, v80);
  v84 = vaddq_s32(v52, v79);
  v85 = vaddq_s32(v84, v73);
  v86 = vaddq_s32(v83, v72);
  v87 = vaddq_s32(v82, v78);
  v88 = vaddq_s32(v81, v77);
  v89 = (int64x2_t)vsubq_s32(v84, v73);
  v90 = (int64x2_t)vsubq_s32(v83, v72);
  v91 = (int64x2_t)vsubq_s32(v82, v78);
  v92 = (int64x2_t)vsubq_s32(v81, v77);
  v93 = vdupq_n_s32(0x3ECu);
  v94 = vmull_high_s32(v85, v93);
  v95 = vmull_s32(*(int32x2_t *)v85.i8, *(int32x2_t *)v93.i8);
  v96 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v86.i8, *(int32x2_t *)v93.i8), 0xAuLL), vmull_high_s32(v86, v93), 0xAuLL);
  v97 = vshrn_high_n_s64(vshrn_n_s64(v95, 0xAuLL), v94, 0xAuLL);
  v98 = vdupq_n_s32(0x239u);
  v99 = vmull_high_s32(v87, v98);
  v100 = vmull_s32(*(int32x2_t *)v87.i8, *(int32x2_t *)v98.i8);
  v101 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v98.i8), 0xAuLL), vmull_high_s32(v88, v98), 0xAuLL);
  v102 = vshrn_high_n_s64(vshrn_n_s64(v100, 0xAuLL), v99, 0xAuLL);
  v74.i64[1] = v90.i32[1];
  v77.i64[0] = 0x3FFFFFFFF38 * v89.i32[2];
  v77.i64[1] = 0x3FFFFFFFF38 * v89.i32[3];
  v103 = 0x3FFFFFFFF38 * v89.i32[1];
  v89.i64[0] = 0x3FFFFFFFF38 * v89.i32[0];
  v89.i64[1] = v103;
  v87.i64[0] = 0x3FFFFFFFF38 * v90.i32[2];
  v87.i64[1] = 0x3FFFFFFFF38 * v90.i32[3];
  v90.i64[0] = 0x3FFFFFFFF38 * v90.i32[0];
  v90.i64[1] = 0x3FFFFFFFF38 * v74.i64[1];
  v104 = vshrn_high_n_s64(vshrn_n_s64(v90, 0xAuLL), (int64x2_t)v87, 0xAuLL);
  v105 = vshrn_high_n_s64(vshrn_n_s64(v89, 0xAuLL), (int64x2_t)v77, 0xAuLL);
  v74.i64[0] = v92.i32[0];
  v74.i64[1] = v92.i32[1];
  v77.i64[0] = 0x3FFFFFFFCADLL * v91.i32[2];
  v77.i64[1] = 0x3FFFFFFFCADLL * v91.i32[3];
  v87.i64[0] = 0x3FFFFFFFCADLL * v91.i32[0];
  v87.i64[1] = 0x3FFFFFFFCADLL * v91.i32[1];
  v92.i64[0] = 0x3FFFFFFFCADLL * v92.i32[2];
  v92.i64[1] = 0x3FFFFFFFCADLL * v92.i32[3];
  v91.i64[0] = 0x3FFFFFFFCADLL * v74.i64[0];
  v91.i64[1] = 0x3FFFFFFFCADLL * v74.i64[1];
  v106 = vshrn_high_n_s64(vshrn_n_s64(v91, 0xAuLL), v92, 0xAuLL);
  v107 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v87, 0xAuLL), (int64x2_t)v77, 0xAuLL);
  v108 = vsubq_s32(v145, v153);
  v109 = vsubq_s32(v146, v154);
  v110 = vaddq_s32(v154, v154);
  v111 = vaddq_s32(v153, v153);
  v112 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v111.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v111, v64), 0xAuLL);
  v113 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v110.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v110, v64), 0xAuLL);
  v114 = (int64x2_t)vsubq_s32(v109, v113);
  v115 = vsubq_s32(v108, v112);
  v116 = vaddq_s32(v109, v113);
  v117 = vaddq_s32(v108, v112);
  v118 = vmull_high_s32(v116, v71);
  v119 = vmull_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v71.i8);
  v120 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v117.i8, *(int32x2_t *)v71.i8), 0xAuLL), vmull_high_s32(v117, v71), 0xAuLL);
  v121 = vshrn_high_n_s64(vshrn_n_s64(v119, 0xAuLL), v118, 0xAuLL);
  v74.i64[0] = v115.i32[0];
  v74.i64[1] = v115.i32[1];
  v122 = v74;
  v74.i64[0] = v115.i32[2];
  v74.i64[1] = v115.i32[3];
  v123 = v74;
  v74.i64[0] = v114.i32[0];
  v74.i64[1] = v114.i32[1];
  v114.i64[0] = 0x3FFFFFFFE78 * v114.i32[2];
  v114.i64[1] = 0x3FFFFFFFE78 * v114.i32[3];
  v71.i64[0] = 0x3FFFFFFFE78 * v74.i64[0];
  v71.i64[1] = 0x3FFFFFFFE78 * v74.i64[1];
  v123.i64[0] *= 0x3FFFFFFFE78;
  v123.i64[1] *= 0x3FFFFFFFE78;
  v122.i64[0] *= 0x3FFFFFFFE78;
  v122.i64[1] *= 0x3FFFFFFFE78;
  v124 = vshrn_high_n_s64(vshrn_n_s64(v122, 0xAuLL), v123, 0xAuLL);
  v125 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v71, 0xAuLL), v114, 0xAuLL);
  v126 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v150.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v150, v64), 0xAuLL);
  v127 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v149.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v149, v64), 0xAuLL);
  v128 = vsubq_s32(v141, v127);
  v129 = vsubq_s32(v142, v126);
  v130 = vaddq_s32(v141, v127);
  v131 = vaddq_s32(v142, v126);
  v126.i64[0] = 0x20000000200;
  v126.i64[1] = 0x20000000200;
  v132 = vaddq_s32(vaddq_s32(v130, v126), v120);
  v133 = vaddq_s32(vaddq_s32(v131, v126), v121);
  v134 = vaddq_s32(vaddq_s32(v128, v126), v124);
  v135 = vaddq_s32(vaddq_s32(v129, v126), v125);
  v136 = vaddq_s32(vsubq_s32(v130, v120), v126);
  v137 = vaddq_s32(vsubq_s32(v131, v121), v126);
  v138 = vaddq_s32(vsubq_s32(v128, v124), v126);
  v139 = vaddq_s32(vsubq_s32(v129, v125), v126);
  a2[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v138, v106), 0xAuLL), vaddq_s32(v139, v107), 0xAuLL);
  a2[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v132, v96), 0xAuLL), vsubq_s32(v133, v97), 0xAuLL);
  a2[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v136, v104), 0xAuLL), vaddq_s32(v137, v105), 0xAuLL);
  a2[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v134, v101), 0xAuLL), vsubq_s32(v135, v102), 0xAuLL);
  a2[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v134, v101), 0xAuLL), vaddq_s32(v135, v102), 0xAuLL);
  a2[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v136, v104), 0xAuLL), vsubq_s32(v137, v105), 0xAuLL);
  result = vsubq_s32(v139, v107);
  *a2 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v132, v96), 0xAuLL), vaddq_s32(v133, v97), 0xAuLL);
  a2[1] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v138, v106), 0xAuLL), result, 0xAuLL);
  return result;
}

int16x8_t iRowCol4x8f1S16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  int32x4_t *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int64x2_t v52;
  int64x2_t v53;
  int64x2_t v54;
  int64x2_t v55;
  int32x4_t v56;
  int32x4_t v57;
  int32x4_t v58;
  int64x2_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int64x2_t v68;
  int64x2_t v69;
  int32x4_t v70;
  int64x2_t v71;
  int64x2_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int64x2_t v76;
  int64x2_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int16x8_t result;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  if ((a5 & 0x80000000) != 0)
  {
    v10 = 0;
    v11 = &v99;
LABEL_13:
    bzero(v11, 32 * (v10 + 7) + 32);
    goto LABEL_14;
  }
  v10 = ~a5;
  v11 = &v99;
  v12 = -1;
  do
  {
    v13 = *a1;
    if (v12 == -1)
    {
      if (a4)
        v14 = (_DWORD)v13 << 10;
      else
        v14 = *(int *)(a8 + 4 * v13) >> 1;
      v15 = a7;
    }
    else
    {
      v14 = *(_DWORD *)(a7 + 4 * v13);
      v15 = a8;
    }
    v16 = *(_DWORD *)(v15 + 4 * a1[1]);
    v17 = *(_DWORD *)(v15 + 4 * a1[2]);
    v18 = *(_DWORD *)(v15 + 4 * a1[3]);
    v19 = *(_DWORD *)(v15 + 4 * a1[4]);
    v20 = *(_DWORD *)(v15 + 4 * a1[7]);
    v21 = *(_DWORD *)(v15 + 4 * a1[6]);
    v22 = *(_DWORD *)(v15 + 4 * a1[5]);
    v23 = v16 - (v20 + v18) + v22;
    v24 = 2 * (v22 - v20);
    v25 = v18 - v22;
    v26 = (unint64_t)(2896 * v20) >> 10;
    v27 = 2 * v25 - v26;
    v28 = (unint64_t)(946 * ((int)v26 + 2 * v25)) >> 10;
    v29 = (unint64_t)(0x3FFFFFFFE78 * v27) >> 10;
    v30 = (unint64_t)(724 * v24) >> 10;
    v31 = v23 - v30;
    LODWORD(v30) = v23 + v30;
    v32 = v30 + v28;
    v33 = v31 + v29;
    LODWORD(v28) = v30 - v28;
    v34 = (unint64_t)(1004 * v32) >> 10;
    v35 = (unint64_t)(0x3FFFFFFFCADLL * (v31 - (int)v29)) >> 10;
    v36 = v17 - v21;
    v37 = (unint64_t)(1448 * v21) >> 10;
    v38 = v36 - v37;
    v39 = (unint64_t)(946 * (v36 + (int)v37)) >> 10;
    v40 = (unint64_t)(0x3FFFFFFFE78 * v38) >> 10;
    v41 = (unint64_t)(724 * v19) >> 10;
    v42 = v14 - v41;
    v43 = v14 + v41;
    LODWORD(v41) = v43 + v39;
    v44 = v42 - v40;
    v11[1].i32[2] = v42 - v40 + v35;
    v11[1].i32[3] = v43 + v39 - v34;
    v45 = (unint64_t)(569 * v33) >> 10;
    v46 = (unint64_t)(0x3FFFFFFFF38 * (int)v28) >> 10;
    LODWORD(v40) = v42 + v40;
    v47 = v43 - v39;
    v11[1].i32[0] = v47 + v46;
    v11[1].i32[1] = v40 - v45;
    v11->i32[2] = v40 + v45;
    v11->i32[3] = v47 - v46;
    v11->i32[0] = v41 + v34;
    v11->i32[1] = v44 - v35;
    v11 += 2;
    ++v12;
    a1 += 8;
  }
  while (a5 != v12);
  if (a5 <= 6)
    goto LABEL_13;
LABEL_14:
  v48 = vsubq_s32(v101, v105);
  v49 = vsubq_s32(v102, v106);
  v50 = vaddq_s32(v106, v106);
  v51 = vaddq_s32(v105, v105);
  v52.i64[0] = v51.i32[0];
  v52.i64[1] = v51.i32[1];
  v53 = v52;
  v52.i64[0] = v51.i32[2];
  v52.i64[1] = v51.i32[3];
  v54 = v52;
  v52.i64[0] = v50.i32[0];
  v52.i64[1] = v50.i32[1];
  v55 = v52;
  v56 = vdupq_n_s32(0x3B2u);
  v52.i64[0] = v50.i32[2];
  v52.i64[1] = v50.i32[3];
  v57 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v51, v56), 0xAuLL);
  v58 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v50, v56), 0xAuLL);
  v59.i64[0] = 0x3FFFFFFFE78 * v52.i64[0];
  v59.i64[1] = 0x3FFFFFFFE78 * v52.i64[1];
  v55.i64[0] *= 0x3FFFFFFFE78;
  v55.i64[1] *= 0x3FFFFFFFE78;
  v54.i64[0] *= 0x3FFFFFFFE78;
  v54.i64[1] *= 0x3FFFFFFFE78;
  v53.i64[0] *= 0x3FFFFFFFE78;
  v53.i64[1] *= 0x3FFFFFFFE78;
  v60 = vshrn_high_n_s64(vshrn_n_s64(v53, 0xAuLL), v54, 0xAuLL);
  v61 = vshrn_high_n_s64(vshrn_n_s64(v55, 0xAuLL), v59, 0xAuLL);
  v62 = vaddq_s32(v49, v58);
  v63 = vaddq_s32(v48, v57);
  v64 = vaddq_s32(v49, v61);
  v65 = vaddq_s32(v48, v60);
  v66 = vsubq_s32(v49, v58);
  v67 = vsubq_s32(v48, v57);
  v68 = (int64x2_t)vsubq_s32(v49, v61);
  v69 = (int64x2_t)vsubq_s32(v48, v60);
  v70 = vdupq_n_s32(0x3ECu);
  v71 = vmull_high_s32(v62, v70);
  v72 = vmull_s32(*(int32x2_t *)v62.i8, *(int32x2_t *)v70.i8);
  v73 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v63.i8, *(int32x2_t *)v70.i8), 0xAuLL), vmull_high_s32(v63, v70), 0xAuLL);
  v74 = vshrn_high_n_s64(vshrn_n_s64(v72, 0xAuLL), v71, 0xAuLL);
  v75 = vdupq_n_s32(0x239u);
  v76 = vmull_high_s32(v64, v75);
  v77 = vmull_s32(*(int32x2_t *)v64.i8, *(int32x2_t *)v75.i8);
  v78 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v65.i8, *(int32x2_t *)v75.i8), 0xAuLL), vmull_high_s32(v65, v75), 0xAuLL);
  v79 = vshrn_high_n_s64(vshrn_n_s64(v77, 0xAuLL), v76, 0xAuLL);
  v62.i64[0] = 0x3FFFFFFFF38 * v66.i32[2];
  v62.i64[1] = 0x3FFFFFFFF38 * v66.i32[3];
  v61.i64[0] = 0x3FFFFFFFF38 * v66.i32[0];
  v61.i64[1] = 0x3FFFFFFFF38 * v66.i32[1];
  v63.i64[0] = 0x3FFFFFFFF38 * v67.i32[2];
  v63.i64[1] = 0x3FFFFFFFF38 * v67.i32[3];
  v76.i64[0] = 0x3FFFFFFFF38 * v67.i32[0];
  v76.i64[1] = 0x3FFFFFFFF38 * v67.i32[1];
  v80 = vshrn_high_n_s64(vshrn_n_s64(v76, 0xAuLL), (int64x2_t)v63, 0xAuLL);
  v81 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v61, 0xAuLL), (int64x2_t)v62, 0xAuLL);
  v52.i64[0] = v69.i32[0];
  v52.i64[1] = v69.i32[1];
  v64.i64[0] = 0x3FFFFFFFCADLL * v68.i32[2];
  v64.i64[1] = 0x3FFFFFFFCADLL * v68.i32[3];
  v63.i64[0] = 0x3FFFFFFFCADLL * v68.i32[0];
  v63.i64[1] = 0x3FFFFFFFCADLL * v68.i32[1];
  v69.i64[0] = 0x3FFFFFFFCADLL * v69.i32[2];
  v69.i64[1] = 0x3FFFFFFFCADLL * v69.i32[3];
  v68.i64[0] = 0x3FFFFFFFCADLL * v52.i64[0];
  v68.i64[1] = 0x3FFFFFFFCADLL * v52.i64[1];
  v82 = vshrn_high_n_s64(vshrn_n_s64(v68, 0xAuLL), v69, 0xAuLL);
  v83 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v63, 0xAuLL), (int64x2_t)v64, 0xAuLL);
  v84 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v104.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v104, v56), 0xAuLL);
  v85 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v103.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v103, v56), 0xAuLL);
  v56.i64[0] = 0x3FFFFFFFE78 * v103.i32[2];
  v56.i64[1] = 0x3FFFFFFFE78 * v103.i32[3];
  v64.i64[0] = 0x3FFFFFFFE78 * v103.i32[0];
  v64.i64[1] = 0x3FFFFFFFE78 * v103.i32[1];
  v63.i64[0] = 0x3FFFFFFFE78 * v104.i32[2];
  v63.i64[1] = 0x3FFFFFFFE78 * v104.i32[3];
  v62.i64[0] = 0x3FFFFFFFE78 * v104.i32[0];
  v62.i64[1] = 0x3FFFFFFFE78 * v104.i32[1];
  v86 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v62, 0xAuLL), (int64x2_t)v63, 0xAuLL);
  v87 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v64, 0xAuLL), (int64x2_t)v56, 0xAuLL);
  v56.i64[0] = 0x20000000200;
  v56.i64[1] = 0x20000000200;
  v88 = vaddq_s32(v100, v56);
  v89 = vaddq_s32(v99, v56);
  v90 = vaddq_s32(v89, v85);
  v91 = vaddq_s32(v88, v84);
  v92 = vaddq_s32(v89, v87);
  v93 = vaddq_s32(v88, v86);
  v94 = vaddq_s32(vsubq_s32(v99, v85), v56);
  v95 = vaddq_s32(vsubq_s32(v100, v84), v56);
  v96 = vaddq_s32(vsubq_s32(v99, v87), v56);
  v97 = vaddq_s32(vsubq_s32(v100, v86), v56);
  a2[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v96, v82), 0xAuLL), vaddq_s32(v97, v83), 0xAuLL);
  a2[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v90, v73), 0xAuLL), vsubq_s32(v91, v74), 0xAuLL);
  a2[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v94, v80), 0xAuLL), vaddq_s32(v95, v81), 0xAuLL);
  a2[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v92, v78), 0xAuLL), vsubq_s32(v93, v79), 0xAuLL);
  a2[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v92, v78), 0xAuLL), vaddq_s32(v93, v79), 0xAuLL);
  a2[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v94, v80), 0xAuLL), vsubq_s32(v95, v81), 0xAuLL);
  result = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v96, v82), 0xAuLL), vsubq_s32(v97, v83), 0xAuLL);
  *a2 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v90, v73), 0xAuLL), vaddq_s32(v91, v74), 0xAuLL);
  a2[1] = result;
  return result;
}

int16x8_t iRowCol4x4f1S16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  int32x4_t *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int64x2_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int64x2_t v54;
  int64x2_t v55;
  int32x4_t v56;
  int64x2_t v57;
  int64x2_t v58;
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int64x2_t v62;
  int64x2_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int16x8_t result;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  if ((a5 & 0x80000000) != 0)
  {
    v10 = 0;
    v11 = &v85;
LABEL_13:
    bzero(v11, 32 * (v10 + 3) + 32);
    goto LABEL_14;
  }
  v10 = ~a5;
  v11 = &v85;
  v12 = -1;
  do
  {
    v13 = *a1;
    if (v12 == -1)
    {
      if (a4)
        v14 = (_DWORD)v13 << 10;
      else
        v14 = *(int *)(a8 + 4 * v13) >> 1;
      v15 = a7;
    }
    else
    {
      v14 = *(_DWORD *)(a7 + 4 * v13);
      v15 = a8;
    }
    v16 = *(_DWORD *)(v15 + 4 * a1[3]);
    v17 = *(int *)(v15 + 4 * a1[2]);
    v18 = *(_DWORD *)(v15 + 4 * a1[1]) - v16;
    v19 = 2 * v16;
    v20 = (unint64_t)(946 * v19) >> 10;
    v21 = (unint64_t)(0x3FFFFFFFE78 * v19) >> 10;
    v22 = v18 + v20;
    v23 = v18 + v21;
    LODWORD(v20) = v18 - v20;
    v24 = v18 - v21;
    v25 = (unint64_t)(1004 * v22) >> 10;
    v26 = (unint64_t)(569 * v23) >> 10;
    v27 = (unint64_t)(0x3FFFFFFFF38 * (int)v20) >> 10;
    v28 = (unint64_t)(0x3FFFFFFFCADLL * v24) >> 10;
    v29 = (unint64_t)(946 * (int)v17) >> 10;
    v30 = (unint64_t)(0x3FFFFFFFE78 * v17) >> 10;
    v31 = v14 + v29;
    v32 = v14 - v30;
    v11[1].i32[2] = v14 - v30 + v28;
    v11[1].i32[3] = v14 + v29 - v25;
    LODWORD(v30) = v14 + v30;
    v33 = v14 - v29;
    v11[1].i32[0] = v33 + v27;
    v11[1].i32[1] = v30 - v26;
    v11->i32[2] = v30 + v26;
    v11->i32[3] = v33 - v27;
    v11->i32[0] = v31 + v25;
    v11->i32[1] = v32 - v28;
    v11 += 2;
    ++v12;
    a1 += 8;
  }
  while (a5 != v12);
  if (a5 <= 2)
    goto LABEL_13;
LABEL_14:
  v34 = vsubq_s32(v87, v91);
  v35 = vsubq_s32(v88, v92);
  v36 = vaddq_s32(v92, v92);
  v37 = vaddq_s32(v91, v91);
  v38.i64[0] = v37.i32[0];
  v38.i64[1] = v37.i32[1];
  v39 = v38;
  v38.i64[0] = v37.i32[2];
  v38.i64[1] = v37.i32[3];
  v40 = v38;
  v38.i64[0] = v36.i32[0];
  v38.i64[1] = v36.i32[1];
  v41 = v38;
  v42 = vdupq_n_s32(0x3B2u);
  v38.i64[0] = v36.i32[2];
  v38.i64[1] = v36.i32[3];
  v43 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v37.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v37, v42), 0xAuLL);
  v44 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v36.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v36, v42), 0xAuLL);
  v45.i64[0] = 0x3FFFFFFFE78 * v38.i64[0];
  v45.i64[1] = 0x3FFFFFFFE78 * v38.i64[1];
  v41.i64[0] *= 0x3FFFFFFFE78;
  v41.i64[1] *= 0x3FFFFFFFE78;
  v40.i64[0] *= 0x3FFFFFFFE78;
  v40.i64[1] *= 0x3FFFFFFFE78;
  v39.i64[0] *= 0x3FFFFFFFE78;
  v39.i64[1] *= 0x3FFFFFFFE78;
  v46 = vshrn_high_n_s64(vshrn_n_s64(v39, 0xAuLL), v40, 0xAuLL);
  v47 = vshrn_high_n_s64(vshrn_n_s64(v41, 0xAuLL), v45, 0xAuLL);
  v48 = vaddq_s32(v35, v44);
  v49 = vaddq_s32(v34, v43);
  v50 = vaddq_s32(v35, v47);
  v51 = vaddq_s32(v34, v46);
  v52 = vsubq_s32(v35, v44);
  v53 = vsubq_s32(v34, v43);
  v54 = (int64x2_t)vsubq_s32(v35, v47);
  v55 = (int64x2_t)vsubq_s32(v34, v46);
  v56 = vdupq_n_s32(0x3ECu);
  v57 = vmull_high_s32(v48, v56);
  v58 = vmull_s32(*(int32x2_t *)v48.i8, *(int32x2_t *)v56.i8);
  v59 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v49.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v49, v56), 0xAuLL);
  v60 = vshrn_high_n_s64(vshrn_n_s64(v58, 0xAuLL), v57, 0xAuLL);
  v61 = vdupq_n_s32(0x239u);
  v62 = vmull_high_s32(v50, v61);
  v63 = vmull_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v61.i8);
  v64 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v61.i8), 0xAuLL), vmull_high_s32(v51, v61), 0xAuLL);
  v65 = vshrn_high_n_s64(vshrn_n_s64(v63, 0xAuLL), v62, 0xAuLL);
  v48.i64[0] = 0x3FFFFFFFF38 * v52.i32[2];
  v48.i64[1] = 0x3FFFFFFFF38 * v52.i32[3];
  v47.i64[0] = 0x3FFFFFFFF38 * v52.i32[0];
  v47.i64[1] = 0x3FFFFFFFF38 * v52.i32[1];
  v49.i64[0] = 0x3FFFFFFFF38 * v53.i32[2];
  v49.i64[1] = 0x3FFFFFFFF38 * v53.i32[3];
  v62.i64[0] = 0x3FFFFFFFF38 * v53.i32[0];
  v62.i64[1] = 0x3FFFFFFFF38 * v53.i32[1];
  v66 = vshrn_high_n_s64(vshrn_n_s64(v62, 0xAuLL), (int64x2_t)v49, 0xAuLL);
  v67 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v47, 0xAuLL), (int64x2_t)v48, 0xAuLL);
  v38.i64[0] = v55.i32[0];
  v38.i64[1] = v55.i32[1];
  v50.i64[0] = 0x3FFFFFFFCADLL * v54.i32[2];
  v50.i64[1] = 0x3FFFFFFFCADLL * v54.i32[3];
  v49.i64[0] = 0x3FFFFFFFCADLL * v54.i32[0];
  v49.i64[1] = 0x3FFFFFFFCADLL * v54.i32[1];
  v55.i64[0] = 0x3FFFFFFFCADLL * v55.i32[2];
  v55.i64[1] = 0x3FFFFFFFCADLL * v55.i32[3];
  v54.i64[0] = 0x3FFFFFFFCADLL * v38.i64[0];
  v54.i64[1] = 0x3FFFFFFFCADLL * v38.i64[1];
  v68 = vshrn_high_n_s64(vshrn_n_s64(v54, 0xAuLL), v55, 0xAuLL);
  v69 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v49, 0xAuLL), (int64x2_t)v50, 0xAuLL);
  v70 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v90.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v90, v42), 0xAuLL);
  v71 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v89.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v89, v42), 0xAuLL);
  v42.i64[0] = 0x3FFFFFFFE78 * v89.i32[2];
  v42.i64[1] = 0x3FFFFFFFE78 * v89.i32[3];
  v50.i64[0] = 0x3FFFFFFFE78 * v89.i32[0];
  v50.i64[1] = 0x3FFFFFFFE78 * v89.i32[1];
  v49.i64[0] = 0x3FFFFFFFE78 * v90.i32[2];
  v49.i64[1] = 0x3FFFFFFFE78 * v90.i32[3];
  v48.i64[0] = 0x3FFFFFFFE78 * v90.i32[0];
  v48.i64[1] = 0x3FFFFFFFE78 * v90.i32[1];
  v72 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v48, 0xAuLL), (int64x2_t)v49, 0xAuLL);
  v73 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v50, 0xAuLL), (int64x2_t)v42, 0xAuLL);
  v42.i64[0] = 0x20000000200;
  v42.i64[1] = 0x20000000200;
  v74 = vaddq_s32(v86, v42);
  v75 = vaddq_s32(v85, v42);
  v76 = vaddq_s32(v75, v71);
  v77 = vaddq_s32(v74, v70);
  v78 = vaddq_s32(v75, v73);
  v79 = vaddq_s32(v74, v72);
  v80 = vaddq_s32(vsubq_s32(v85, v71), v42);
  v81 = vaddq_s32(vsubq_s32(v86, v70), v42);
  v82 = vaddq_s32(vsubq_s32(v85, v73), v42);
  v83 = vaddq_s32(vsubq_s32(v86, v72), v42);
  a2[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v82, v68), 0xAuLL), vaddq_s32(v83, v69), 0xAuLL);
  a2[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v76, v59), 0xAuLL), vsubq_s32(v77, v60), 0xAuLL);
  a2[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v80, v66), 0xAuLL), vaddq_s32(v81, v67), 0xAuLL);
  a2[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v78, v64), 0xAuLL), vsubq_s32(v79, v65), 0xAuLL);
  a2[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v78, v64), 0xAuLL), vaddq_s32(v79, v65), 0xAuLL);
  a2[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v80, v66), 0xAuLL), vsubq_s32(v81, v67), 0xAuLL);
  result = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v82, v68), 0xAuLL), vsubq_s32(v83, v69), 0xAuLL);
  *a2 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v76, v59), 0xAuLL), vaddq_s32(v77, v60), 0xAuLL);
  a2[1] = result;
  return result;
}

int32x4_t iRowCol1x3fS16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  int32x4_t result;
  int32x4_t v20;
  int16x8_t v21;

  v6 = *a1;
  if (a4)
    v7 = (_DWORD)v6 << 10;
  else
    v7 = *(int *)(a6 + 4 * v6) >> 1;
  v8 = *(int *)(a5 + 4 * a1[2]);
  v9 = *(int *)(a5 + 4 * a1[1]);
  v10 = (unint64_t)(1004 * (int)v9) >> 10;
  v11 = (unint64_t)(569 * (int)v9) >> 10;
  v12 = (unint64_t)(0x3FFFFFFFF38 * v9) >> 10;
  v13 = (unint64_t)(0x3FFFFFFFCADLL * v9) >> 10;
  v14 = (unint64_t)(946 * (int)v8) >> 10;
  v15 = (unint64_t)(0x3FFFFFFFE78 * v8) >> 10;
  v16 = v7 + v14;
  v17 = v7 + v15;
  LODWORD(v14) = v7 - v14;
  v18 = v7 - v15;
  result.i32[0] = v14 + v12;
  result.i32[1] = v17 - v11;
  result.i32[2] = v18 + v13;
  result.i32[3] = v16 - v10;
  v20.i32[0] = v16 + v10;
  v20.i32[1] = v18 - v13;
  v20.i32[2] = v17 + v11;
  v20.i32[3] = v14 - v12;
  v21 = vrshrn_high_n_s32(vrshrn_n_s32(v20, 0xAuLL), result, 0xAuLL);
  a2[6] = v21;
  a2[7] = v21;
  a2[4] = v21;
  a2[5] = v21;
  a2[2] = v21;
  a2[3] = v21;
  *a2 = v21;
  a2[1] = v21;
  return result;
}

unint64_t iColRow8x8f1S16(uint64_t a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v10;
  unsigned int v11;
  _DWORD *v12;
  __int16 *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
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
  unint64_t v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  unsigned int v50;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  unint64_t v61;
  int v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  int v66;
  int v67;
  int v68;
  unint64_t result;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int v73;
  unint64_t v74;
  int v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  int v79;
  int v80;
  int v81;
  int v82;
  _BYTE v83[256];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  if ((a6 & 0x80000000) != 0)
  {
    v10 = 0;
    v12 = v83;
LABEL_13:
    v50 = v10 - 8;
    do
    {
      *v12 = 0;
      v12[16] = 0;
      v12[32] = 0;
      v12[48] = 0;
      v12[56] = 0;
      v12[40] = 0;
      v12[24] = 0;
      v12[8] = 0;
      ++v12;
    }
    while (!__CFADD__(v50++, 1));
    goto LABEL_16;
  }
  v8 = 0;
  v10 = a6 + 1;
  v11 = a6 + 1;
  v12 = v83;
  do
  {
    v13 = (__int16 *)(a1 + 2 * v8);
    v14 = *v13;
    if ((_DWORD)v8)
    {
      v15 = *(_DWORD *)(a7 + 4 * v14);
      v16 = a8;
    }
    else
    {
      if (a4)
        v15 = (_DWORD)v14 << 10;
      else
        v15 = *(int *)(a8 + 4 * v14) >> 1;
      v16 = a7;
    }
    v17 = *(_DWORD *)(v16 + 4 * v13[8]);
    v18 = *(_DWORD *)(v16 + 4 * v13[16]);
    v19 = *(_DWORD *)(v16 + 4 * v13[24]);
    v20 = *(_DWORD *)(v16 + 4 * v13[32]);
    v21 = *(_DWORD *)(v16 + 4 * v13[40]);
    v22 = *(_DWORD *)(v16 + 4 * v13[48]);
    v23 = *(_DWORD *)(v16 + 4 * v13[56]);
    v24 = v23 + v19;
    v25 = v21 + v17 - (v23 + v19);
    v26 = 2 * (v21 - v23);
    v27 = 4 * v23;
    v28 = v24 - (v23 + v21);
    v29 = (unint64_t)(724 * v27) >> 10;
    v30 = 2 * v28 - v29;
    v31 = (unint64_t)(946 * ((int)v29 + 2 * v28)) >> 10;
    v32 = (unint64_t)(0x3FFFFFFFE78 * v30) >> 10;
    v33 = (unint64_t)(724 * v26) >> 10;
    v34 = v25 - v33;
    v35 = v25 + v33;
    LODWORD(v33) = v35 + v31;
    v36 = v34 + v32;
    LODWORD(v31) = v35 - v31;
    LODWORD(v32) = v34 - v32;
    v37 = (unint64_t)(1004 * (int)v33) >> 10;
    v38 = (unint64_t)(569 * v36) >> 10;
    v39 = v18 - v22;
    v40 = (unint64_t)(1448 * v22) >> 10;
    v41 = v39 - v40;
    v42 = (unint64_t)(946 * (v39 + (int)v40)) >> 10;
    v43 = (unint64_t)(0x3FFFFFFFE78 * v41) >> 10;
    v44 = (unint64_t)(724 * v20) >> 10;
    v45 = v15 - v44;
    v46 = v15 + v44;
    LODWORD(v44) = v46 + v42;
    *v12 = v46 + v42 + v37;
    v12[16] = v45 + v43 + v38;
    v47 = (unint64_t)(0x3FFFFFFFF38 * (int)v31) >> 10;
    v48 = (unint64_t)(0x3FFFFFFFCADLL * (int)v32) >> 10;
    v49 = v46 - v42;
    v12[32] = v49 + v47;
    v12[48] = v45 - v43 + v48;
    v12[56] = v44 - v37;
    v12[40] = v45 + v43 - v38;
    v12[24] = v49 - v47;
    v12[8] = v45 - v43 - v48;
    ++v12;
    ++v8;
  }
  while (v11 != (_DWORD)v8);
  if (a6 <= 6)
    goto LABEL_13;
LABEL_16:
  v52 = 0;
  do
  {
    v53 = *(_DWORD *)&v83[v52];
    v54 = *(_DWORD *)&v83[v52 + 20];
    v56 = *(_DWORD *)&v83[v52 + 24];
    v55 = *(_DWORD *)&v83[v52 + 28];
    v57 = v54 + *(_DWORD *)&v83[v52 + 4] - (v55 + *(_DWORD *)&v83[v52 + 12]);
    v58 = 2 * (v54 - v55);
    v59 = 4 * v55;
    v60 = *(_DWORD *)&v83[v52 + 12] - v54;
    v61 = (unint64_t)(724 * v59) >> 10;
    v62 = 2 * v60 - v61;
    v63 = (unint64_t)(946 * ((int)v61 + 2 * v60)) >> 10;
    v64 = (unint64_t)(0x3FFFFFFFE78 * v62) >> 10;
    v65 = (unint64_t)(724 * v58) >> 10;
    v66 = v57 - v65;
    v67 = v57 + v65;
    v68 = v67 - v63;
    result = (unint64_t)(1004 * (v67 + (int)v63)) >> 10;
    v70 = (unint64_t)(569 * (v66 + (int)v64)) >> 10;
    v71 = (unint64_t)(0x3FFFFFFFF38 * v68) >> 10;
    v72 = (unint64_t)(0x3FFFFFFFCADLL * (v66 - (int)v64)) >> 10;
    v73 = *(_DWORD *)&v83[v52 + 8] - v56;
    v74 = (unint64_t)(1448 * v56) >> 10;
    v75 = v73 - v74;
    v76 = (unint64_t)(946 * (v73 + (int)v74)) >> 10;
    v77 = (unint64_t)(0x3FFFFFFFE78 * v75) >> 10;
    v78 = (unint64_t)(724 * *(int *)&v83[v52 + 16]) >> 10;
    v79 = v53 - v78;
    v80 = v53 + v78;
    LODWORD(v78) = v80 + v76 + 512;
    v81 = v79 + v77 + 512;
    v82 = v80 - v76 + 512;
    LODWORD(v76) = v79 - v77 + 512;
    *a2 = (v78 + result) >> 10;
    a2[2] = (v81 + v70) >> 10;
    a2[4] = (v82 + v71) >> 10;
    a2[6] = (v76 + v72) >> 10;
    a2[7] = (v78 - result) >> 10;
    a2[5] = (v81 - v70) >> 10;
    a2[3] = (v82 - v71) >> 10;
    a2[1] = (v76 - v72) >> 10;
    v52 += 32;
    a2 += 8;
  }
  while ((_DWORD)v52 != 256);
  return result;
}

uint64_t iColRow8x4fS16(uint64_t a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v10;
  unsigned int v11;
  _DWORD *v12;
  __int16 *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  unsigned int v46;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  int v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  int v65;
  int v66;
  int v67;
  uint64_t result;
  _BYTE v69[256];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if ((a6 & 0x80000000) != 0)
  {
    v10 = 0;
    v12 = v69;
LABEL_13:
    v46 = v10 - 8;
    do
    {
      *v12 = 0;
      v12[16] = 0;
      v12[32] = 0;
      v12[48] = 0;
      v12[56] = 0;
      v12[40] = 0;
      v12[24] = 0;
      v12[8] = 0;
      ++v12;
    }
    while (!__CFADD__(v46++, 1));
    goto LABEL_16;
  }
  v8 = 0;
  v10 = a6 + 1;
  v11 = a6 + 1;
  v12 = v69;
  do
  {
    v13 = (__int16 *)(a1 + 2 * v8);
    v14 = *v13;
    if ((_DWORD)v8)
    {
      v15 = *(_DWORD *)(a7 + 4 * v14);
      v16 = a8;
    }
    else
    {
      if (a4)
        v15 = (_DWORD)v14 << 10;
      else
        v15 = *(int *)(a8 + 4 * v14) >> 1;
      v16 = a7;
    }
    v17 = v13[40];
    v18 = v13[48];
    v19 = v13[56];
    v20 = *(_DWORD *)(v16 + 4 * v13[8]);
    v21 = *(_DWORD *)(v16 + 4 * v13[16]);
    v22 = *(_DWORD *)(v16 + 4 * v13[24]);
    v23 = *(_DWORD *)(v16 + 4 * v13[32]);
    v24 = *(_DWORD *)(v16 + 4 * v19);
    LODWORD(v18) = *(_DWORD *)(v16 + 4 * v18);
    v25 = *(_DWORD *)(v16 + 4 * v17);
    v26 = v20 - (v24 + v22) + v25;
    LODWORD(v17) = 2 * (v25 - v24);
    v27 = v22 - v25;
    v28 = (unint64_t)(2896 * v24) >> 10;
    v29 = 2 * v27 - v28;
    v30 = (unint64_t)(946 * ((int)v28 + 2 * v27)) >> 10;
    v31 = (unint64_t)(0x3FFFFFFFE78 * v29) >> 10;
    v32 = (unint64_t)(724 * (int)v17) >> 10;
    LODWORD(v17) = v26 - v32;
    v33 = v26 + v32;
    LODWORD(v32) = v33 + v30;
    LODWORD(v19) = v17 + v31;
    LODWORD(v30) = v33 - v30;
    v34 = v17 - v31;
    v35 = (unint64_t)(1004 * (int)v32) >> 10;
    v36 = (unint64_t)(569 * (int)v19) >> 10;
    v37 = v21 - v18;
    v38 = (unint64_t)(1448 * (_DWORD)v18) >> 10;
    LODWORD(v18) = v37 - v38;
    v39 = (unint64_t)(946 * (v37 + (int)v38)) >> 10;
    v40 = (unint64_t)(0x3FFFFFFFE78 * (int)v18) >> 10;
    v41 = (unint64_t)(724 * v23) >> 10;
    LODWORD(v18) = v15 - v41;
    v42 = v15 + v41;
    LODWORD(v41) = v42 + v39;
    *v12 = v42 + v39 + v35;
    v12[16] = v18 + v40 + v36;
    v43 = (unint64_t)(0x3FFFFFFFF38 * (int)v30) >> 10;
    v44 = (unint64_t)(0x3FFFFFFFCADLL * v34) >> 10;
    v45 = v42 - v39;
    v12[32] = v45 + v43;
    v12[48] = v18 - v40 + v44;
    v12[56] = v41 - v35;
    v12[40] = v18 + v40 - v36;
    v12[24] = v45 - v43;
    v12[8] = v18 - v40 - v44;
    ++v12;
    ++v8;
  }
  while (v11 != (_DWORD)v8);
  if (a6 <= 6)
    goto LABEL_13;
LABEL_16:
  v48 = 0;
  do
  {
    v49 = *(_DWORD *)&v69[v48];
    v50 = *(_DWORD *)&v69[v48 + 12];
    v51 = *(int *)&v69[v48 + 8];
    v52 = *(_DWORD *)&v69[v48 + 4] - v50;
    v53 = 2 * v50;
    v54 = (unint64_t)(946 * v53) >> 10;
    v55 = (unint64_t)(0x3FFFFFFFE78 * v53) >> 10;
    v56 = v52 + v54;
    v57 = v52 + v55;
    LODWORD(v54) = v52 - v54;
    v58 = v52 - v55;
    v59 = (unint64_t)(1004 * v56) >> 10;
    v60 = (unint64_t)(569 * v57) >> 10;
    v61 = (unint64_t)(0x3FFFFFFFF38 * (int)v54) >> 10;
    v62 = (unint64_t)(0x3FFFFFFFCADLL * v58) >> 10;
    v63 = (unint64_t)(946 * (int)v51) >> 10;
    v64 = (unint64_t)(0x3FFFFFFFE78 * v51) >> 10;
    v65 = v49 + 512 + v63;
    v66 = v49 + 512 + v64;
    LODWORD(v63) = v49 - v63 + 512;
    v67 = v49 - v64 + 512;
    *a2 = (v65 + v59) >> 10;
    a2[2] = (v66 + v60) >> 10;
    a2[4] = (v63 + v61) >> 10;
    a2[6] = (v67 + v62) >> 10;
    a2[7] = (v65 - v59) >> 10;
    result = (v66 - v60) >> 10;
    a2[5] = result;
    a2[3] = (v63 - v61) >> 10;
    a2[1] = (v67 - v62) >> 10;
    v48 += 32;
    a2 += 8;
  }
  while ((_DWORD)v48 != 256);
  return result;
}

double iDct8x8fS16(uint64_t a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double result;

  if ((int)a5 >= (int)a6)
    *(_QWORD *)&result = iRowCol8x8f1S16((__int16 *)a1, (int16x8_t *)a2, a3, a4, a5, a6, a7, a8).u64[0];
  else
    iColRow8x8f1S16(a1, a2, a3, a4, a5, a6, a7, a8);
  return result;
}

_WORD *ZigZagBlockS16(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[8];
  a2[3] = result[16];
  a2[4] = result[9];
  a2[5] = result[2];
  a2[6] = result[3];
  a2[7] = result[10];
  a2[8] = result[17];
  a2[9] = result[24];
  a2[10] = result[32];
  a2[11] = result[25];
  a2[12] = result[18];
  a2[13] = result[11];
  a2[14] = result[4];
  a2[15] = result[5];
  a2[16] = result[12];
  a2[17] = result[19];
  a2[18] = result[26];
  a2[19] = result[33];
  a2[20] = result[40];
  a2[21] = result[48];
  a2[22] = result[41];
  a2[23] = result[34];
  a2[24] = result[27];
  a2[25] = result[20];
  a2[26] = result[13];
  a2[27] = result[6];
  a2[28] = result[7];
  a2[29] = result[14];
  a2[30] = result[21];
  a2[31] = result[28];
  a2[32] = result[35];
  a2[33] = result[42];
  a2[34] = result[49];
  a2[35] = result[56];
  a2[36] = result[57];
  a2[37] = result[50];
  a2[38] = result[43];
  a2[39] = result[36];
  a2[40] = result[29];
  a2[41] = result[22];
  a2[42] = result[15];
  a2[43] = result[23];
  a2[44] = result[30];
  a2[45] = result[37];
  a2[46] = result[44];
  a2[47] = result[51];
  a2[48] = result[58];
  a2[49] = result[59];
  a2[50] = result[52];
  a2[51] = result[45];
  a2[52] = result[38];
  a2[53] = result[31];
  a2[54] = result[39];
  a2[55] = result[46];
  a2[56] = result[53];
  a2[57] = result[60];
  a2[58] = result[61];
  a2[59] = result[54];
  a2[60] = result[47];
  a2[61] = result[55];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

_WORD *ZigZag4x4BlockS16(_WORD *result, uint64_t a2)
{
  *(_WORD *)a2 = *result;
  *(_WORD *)(a2 + 2) = result[1];
  *(_WORD *)(a2 + 4) = result[8];
  *(_WORD *)(a2 + 6) = result[16];
  *(_WORD *)(a2 + 8) = result[9];
  *(_WORD *)(a2 + 10) = result[2];
  *(_WORD *)(a2 + 12) = result[3];
  *(_WORD *)(a2 + 14) = result[10];
  *(_WORD *)(a2 + 16) = result[17];
  *(_WORD *)(a2 + 18) = result[24];
  *(_WORD *)(a2 + 20) = 0;
  *(_WORD *)(a2 + 22) = result[25];
  *(_WORD *)(a2 + 24) = result[18];
  *(_WORD *)(a2 + 26) = result[11];
  *(_DWORD *)(a2 + 28) = 0;
  *(_WORD *)(a2 + 32) = 0;
  *(_WORD *)(a2 + 34) = result[19];
  *(_WORD *)(a2 + 36) = result[26];
  *(_QWORD *)(a2 + 38) = 0;
  *(_WORD *)(a2 + 46) = 0;
  *(_WORD *)(a2 + 48) = result[27];
  return result;
}

uint64_t H263CMPR_CompressMaster(uint64_t a1, uint64_t a2, char *a3, int a4, int a5, int a6, unsigned __int16 a7, _DWORD *a8, double a9, unsigned int a10, int a11, uint64_t a12, __int16 a13, int a14, unsigned int a15, int a16, int a17, int a18, _QWORD *a19, _DWORD *a20)
{
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  size_t v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  int v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
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
  int v88;
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
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  int v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _WORD *v142;
  _DWORD *v143;
  uint64_t v144;
  _DWORD *v145;
  _WORD *v146;
  uint64_t v147;
  double v148;
  int v149;
  int *v150;
  uint64_t v151;
  uint64_t Qp;
  uint64_t v153;
  int v154;
  uint64_t v155;
  int v156;
  int v157;
  unsigned int v158;
  int *v159;
  int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  int *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  int v172;
  int v173;
  unsigned int v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _DWORD *v184;
  uint64_t v185;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t DisplayOdrIdx;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  char v195;
  unsigned int v196;
  uint64_t v197;
  uint64_t v198;
  unsigned int v199;
  uint64_t v200;
  unsigned int v201;
  uint64_t v202;
  unsigned int v203;
  int *v204;
  uint64_t v206;
  int v207;
  int v208;
  int v209;
  int v210;
  uint64_t v212;
  uint64_t v213;
  int v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v220;
  _BYTE *v221;
  uint64_t v222;
  uint64_t *v224;
  int *v225;
  _QWORD v226[2];
  __int128 v227;
  double v228;
  int v229;
  int v230[3];

  v24 = (uint64_t *)(a1 + 296174);
  v229 = a5;
  v230[0] = a4;
  v25 = *(_QWORD *)(a1 + 296190);
  v217 = *(_QWORD *)(a1 + 296198);
  v26 = *(_QWORD *)(a1 + 296230);
  v220 = *(_QWORD *)(a1 + 296206);
  v221 = *(_BYTE **)(a1 + 296214);
  v27 = *(_QWORD *)(a1 + 296174);
  v28 = *(_QWORD *)(a1 + 296182);
  H263PICT_Setup((uint64_t)v221, *(char *)(v27 + 40));
  v30 = a4;
  *(_WORD *)(v25 + 54) = a13;
  *(_DWORD *)(v25 + 44) = 1;
  *(_DWORD *)(v217 + 41312) = 128;
  v31 = v24[5];
  *(_BYTE *)(v31 + 18) = 0;
  *(_WORD *)(v31 + 20) = 0;
  v222 = *(int *)(v27 + 4);
  v32 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v32 + 28) = v222 + 32;
  v33 = *(_QWORD *)(a1 + 24);
  *(_DWORD *)(v33 + 28) = v222 + 32;
  v34 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(v34 + 28) = v222 + 32;
  v225 = (int *)v27;
  v215 = *(_DWORD *)v27;
  v35 = (*(_DWORD *)v27 + 32);
  *(_DWORD *)(v32 + 24) = v35;
  *(_DWORD *)(v33 + 24) = v35;
  *(_DWORD *)(v34 + 24) = v35;
  v36 = a4 + 15;
  if (a4 < -15)
    v36 = a4 + 30;
  *(_DWORD *)(v25 + 28) = 0;
  *(_DWORD *)(v25 + 32) = v36 >> 4;
  v37 = a5 + 15;
  if (a5 < -15)
    v37 = a5 + 30;
  *(_DWORD *)(v25 + 36) = 0;
  *(_DWORD *)(v25 + 40) = v37 >> 4;
  if (*(_DWORD *)(v25 + 4) != *(_DWORD *)(v25 + 8))
  {
    *(_QWORD *)(a1 + 24) = v32;
    *(_QWORD *)(a1 + 32) = v33;
  }
  v38 = 0xFFFFFFFFLL;
  if (v215 < a4 || (int)v222 < a5)
    goto LABEL_196;
  v39 = 16 * (int)v35;
  v40 = 4 * (int)v35;
  v224 = v24;
  v213 = v35;
  if (a10)
  {
    v41 = a3;
    if (a10 > 2)
    {
      v42 = a5;
      if (a10 == 3)
      {
        v209 = 16 * v35;
        v210 = v222 + 32;
        if (a5 >= 1)
        {
          v52 = a4;
          v53 = v209 + 16;
          do
          {
            memcpy((void *)(**(_QWORD **)(a1 + 40) + v53), v41, v52);
            v41 += a6;
            v53 += (int)v213;
            --v42;
          }
          while (v42);
        }
      }
      else
      {
        if (a10 != 2033463856)
        {
          v24 = v224;
          goto LABEL_196;
        }
        v209 = 16 * v35;
        v210 = v222 + 32;
        if (a5 >= 1)
        {
          v207 = 4 * v35;
          v43 = 0;
          v208 = v30;
          v44 = v30;
          v45 = v209 + 16;
          do
          {
            memcpy((void *)(**(_QWORD **)(a1 + 40) + v45), (const void *)(*a19 + (*a20 * v43++)), v44);
            v45 += (int)v213;
          }
          while (a5 != v43);
          if (a5 >= 2)
          {
            v46 = 0;
            v212 = a5 >> 1;
            if ((int)v213 >= 0)
              v47 = v213;
            else
              v47 = v213 + 1;
            if (v208 >= 0)
              v48 = v208;
            else
              v48 = v208 + 1;
            v49 = (uint64_t)v48 >> 1;
            v50 = (uint64_t)v47 >> 1;
            v51 = v207 + 8;
            do
            {
              memcpy((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v51), (const void *)(a19[1] + (a20[1] * v46)), v49);
              memcpy((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + v51), (const void *)(a19[2] + (a20[2] * v46++)), v49);
              v51 += v50;
            }
            while (v212 != v46);
          }
        }
      }
    }
    else
    {
      v209 = 16 * v35;
      v210 = v222 + 32;
      COLOR_Y422ToY420u(a3, *(_QWORD *)v34 + (int)v39 + 16, *(_QWORD *)(v34 + 8) + (int)v40 + 8, *(_QWORD *)(v34 + 16) + (int)v40 + 8, v230, &v229, v35, v222, a6, a10);
    }
  }
  else if (a11 == 24)
  {
    v209 = 16 * v35;
    v210 = v222 + 32;
    COLOR_R2Y24((uint64_t)a3, *(_QWORD *)v34 + (int)v39 + 16, *(_QWORD *)(v34 + 8) + (int)v40 + 8, *(_QWORD *)(v34 + 16) + (int)v40 + 8, v230, &v229, v35, v222, a6, *(_QWORD *)(*(_QWORD *)(a2 + 48) + 1312), *(_QWORD **)(a2 + 24));
  }
  else
  {
    if (a11 != 32)
      goto LABEL_196;
    v209 = 16 * v35;
    v210 = v222 + 32;
    COLOR_R2Y32((uint64_t)a3, *(_QWORD *)v34 + v39 + 16, *(_QWORD *)(v34 + 8) + v40 + 8, *(_QWORD *)(v34 + 16) + v40 + 8, v230, &v229, v35, v222, a6, *(_QWORD *)(*(_QWORD *)(a2 + 48) + 1312), *(_QWORD **)(a2 + 24));
  }
  *(_WORD *)(v25 + 50) = 0;
  v54 = *(_DWORD *)(v25 + 4);
  v55 = *(_DWORD *)(v25 + 8);
  v24 = v224;
  v56 = v217 + 32832;
  if (v54 != v55 && *(_WORD *)(v25 + 52))
  {
    if (*(_BYTE *)(v25 + 48))
      *(_DWORD *)(v25 + 60) = v54;
    if (*(_BYTE *)(v25 + 49))
      *(_DWORD *)(v25 + 64) = v54;
  }
  v57 = a17;
  if (v55 < 2)
    goto LABEL_41;
  if (a14 && a15)
  {
    if (v55 - *(_DWORD *)(v25 + 60) < a17)
    {
LABEL_64:
      *a8 = 512;
      *(_WORD *)(v25 + 48) = 0;
      *(_BYTE *)(v224[5] + 17) = 1;
      goto LABEL_65;
    }
  }
  else if ((!a14 || a15 || *a8) && ((!a14 || a17) && a14 || *a8))
  {
    goto LABEL_64;
  }
LABEL_41:
  *a8 = 0;
  *(_WORD *)(v25 + 48) = 257;
  *(_BYTE *)(v224[5] + 17) = 0;
  if (*(_DWORD *)(v25 + 44))
  {
    v58 = 0;
    if (a17 <= 0 || a14 == 0)
      v57 = 132;
    *(_DWORD *)(v217 + 39700) = v57;
    v60 = v217 + 39712;
    do
    {
      for (i = 0; i != 88; i += 4)
        *(_DWORD *)(v60 + i) = *(_DWORD *)(v217 + 39700);
      ++v58;
      v60 += 88;
    }
    while (v58 != 18);
  }
LABEL_65:
  if (v221[17] == 1 && v221[18])
  {
    v62 = 0;
    v63 = (int)v213 >> 1;
    v64 = *(_QWORD **)(a1 + 24);
    v65 = 16;
    if (v215 + 15 <= 16)
      v66 = 16;
    else
      v66 = (v215 + 15);
    do
    {
      v67 = v66 - 15;
      v68 = v209 + 16;
      v69 = v65;
      if (v215 >= 1)
      {
        do
        {
          *(_BYTE *)(*v64 + v69++) = *(_BYTE *)(*v64 + v68++);
          --v67;
        }
        while (v67);
      }
      ++v62;
      v65 += (int)v213;
    }
    while (v62 != 16);
    v70 = 0;
    v71 = 8 * v63;
    if (v63 <= 17)
      v72 = 17;
    else
      v72 = (int)v213 >> 1;
    v73 = (v72 - 8) - 8;
    v74 = 8;
    do
    {
      if (v215 >= 2)
      {
        v75 = v73;
        v76 = (int)v71 + 8;
        v77 = v74;
        do
        {
          *(_BYTE *)(v64[1] + v77) = *(_BYTE *)(v64[1] + v76);
          *(_BYTE *)(v64[2] + v77++) = *(_BYTE *)(v64[2] + v76++);
          --v75;
        }
        while (v75);
      }
      ++v70;
      v74 += v63;
    }
    while (v70 != 8);
    v78 = (int)v213 * (v222 + 15);
    v79 = (int)v222 + 16;
    v80 = (int)v213 * v79 + 16;
    v81 = v66 - 15;
    v82 = v79;
    do
    {
      if (v215 >= 1)
      {
        v83 = v81;
        v84 = (int)v78 + 16;
        v85 = v80;
        do
        {
          *(_BYTE *)(*v64 + v85++) = *(_BYTE *)(*v64 + v84++);
          --v83;
        }
        while (v83);
      }
      ++v82;
      v80 += (int)v213;
    }
    while (v82 < v210);
    v86 = (uint64_t)v210 >> 1;
    v87 = v63 * (uint64_t)((int)v86 - 9);
    v88 = v86 - 8;
    v89 = ((int)v86 - 8) * (uint64_t)v63 + 8;
    v90 = v86 - 8;
    do
    {
      v91 = v73;
      v92 = (int)v87 + 8;
      v93 = v89;
      if (v215 >= 2)
      {
        do
        {
          *(_BYTE *)(v64[1] + v93) = *(_BYTE *)(v64[1] + v92);
          *(_BYTE *)(v64[2] + v93++) = *(_BYTE *)(v64[2] + v92++);
          --v91;
        }
        while (v91);
      }
      ++v90;
      v89 += v63;
    }
    while (v90 != v86);
    v94 = 0;
    if ((int)v79 <= 17)
      v95 = 17;
    else
      v95 = v79;
    v96 = v95 - 16;
    do
    {
      v97 = v96;
      v98 = 16 * (int)v213;
      if ((int)v222 >= 1)
      {
        do
        {
          *(_BYTE *)(*v64 + v98 + v94) = *(_BYTE *)(*v64 + v98 + 16);
          v98 += (int)v213;
          --v97;
        }
        while (v97);
      }
      ++v94;
    }
    while (v94 != 16);
    v99 = 0;
    if (v88 <= 9)
      v100 = 9;
    else
      v100 = v88;
    v101 = v100 - 8;
    do
    {
      if ((int)v222 >= 2)
      {
        v102 = v101;
        v103 = 8 * v63;
        do
        {
          *(_BYTE *)(v64[1] + v103 + v99) = *(_BYTE *)(v64[1] + v103 + 8);
          *(_BYTE *)(v64[2] + v103 + v99) = *(_BYTE *)(v64[2] + v103 + 8);
          v103 += v63;
          --v102;
        }
        while (v102);
      }
      ++v99;
    }
    while (v99 != 8);
    v104 = v215 + 16;
    v105 = 16 * (int)v213 + v104;
    do
    {
      if ((int)v222 >= 1)
      {
        v106 = 0;
        v107 = v96;
        do
        {
          *(_BYTE *)(*v64 + v105 + v106) = *(_BYTE *)(*v64 + 17 * (int)v213 - 17 + v106);
          v106 += (int)v213;
          --v107;
        }
        while (v107);
      }
      ++v104;
      ++v105;
    }
    while (v104 < (int)v213);
    v108 = v63 - 8;
    v109 = -8;
    do
    {
      v110 = v101;
      v111 = 9 * v63;
      if ((int)v222 >= 2)
      {
        do
        {
          *(_BYTE *)(v64[1] + v111 + v109) = *(_BYTE *)(v64[1] + v111 - 9);
          *(_BYTE *)(v64[2] + v111 + v109) = *(_BYTE *)(v64[2] + v111 - 9);
          v111 += v63;
          --v110;
        }
        while (v110);
      }
      ++v108;
      ++v109;
    }
    while (v108 != v63);
    v112 = 0;
    v113 = 0;
    v114 = v78 + 16;
    v115 = (int)v213 * (uint64_t)(int)v79 - 17;
    v116 = -32 - v215;
    v117 = v215 + 31;
    v118 = v210 * v213 - 1;
    v119 = v213 * (v222 + 31);
    do
    {
      v120 = 0;
      ++v113;
      v121 = v118;
      v122 = v117;
      do
      {
        *(_BYTE *)(*v64 + v112 + v120) = *(_BYTE *)(*v64 + v209 + 16);
        *(_BYTE *)(*v64 + v122) = *(_BYTE *)(*v64 + 17 * (int)v213 - 17);
        *(_BYTE *)(*v64 + v119 + v120) = *(_BYTE *)(*v64 + v114);
        *(_BYTE *)(*v64 + v121) = *(_BYTE *)(*v64 + v115);
        ++v120;
        --v122;
        --v121;
      }
      while (v120 != 16);
      v117 += v213;
      v118 += v116;
      v119 += v116;
      v112 += (int)v213;
    }
    while (v113 != 16);
    v123 = 0;
    v124 = 0;
    v125 = v71 + 8;
    v126 = 9 * v63 - 9;
    v127 = v87 + 8;
    v128 = v63 * (uint64_t)v88 - 9;
    v129 = v63 - 1;
    v130 = v86 * v63 - 1;
    v131 = ((int)v86 - 1) * (uint64_t)v63;
    v24 = v224;
    v56 = v217 + 32832;
    do
    {
      v132 = 0;
      ++v124;
      v133 = v123;
      v134 = v131;
      do
      {
        *(_BYTE *)(v64[1] + v133) = *(_BYTE *)(v64[1] + v125);
        v135 = v129 + v132;
        *(_BYTE *)(v64[1] + v135) = *(_BYTE *)(v64[1] + v126);
        *(_BYTE *)(v64[1] + v134) = *(_BYTE *)(v64[1] + v127);
        v136 = v130 + v132;
        *(_BYTE *)(v64[1] + v136) = *(_BYTE *)(v64[1] + v128);
        *(_BYTE *)(v64[2] + v133) = *(_BYTE *)(v64[2] + v125);
        *(_BYTE *)(v64[2] + v135) = *(_BYTE *)(v64[2] + v126);
        *(_BYTE *)(v64[2] + v134) = *(_BYTE *)(v64[2] + v127);
        *(_BYTE *)(v64[2] + v136) = *(_BYTE *)(v64[2] + v128);
        --v132;
        ++v134;
        ++v133;
      }
      while (v132 != -8);
      v129 += v63;
      v130 -= v63;
      v131 -= v63;
      v123 += v63;
    }
    while (v124 != 8);
  }
  v137 = v24[5];
  HIDWORD(v206) = *(char *)(v137 + 18);
  LODWORD(v206) = *(char *)(v137 + 20);
  H263ME_Prep(*(unsigned int *)(v25 + 44), *((_DWORD *)v24 + 21), v229, v230[0], v225[1], *v225, 0, 0, v206, *(_DWORD *)(v56 + 8480), v217 + 32848);
  if (*(_DWORD *)(v25 + 44))
    *((_DWORD *)v24 + 21) = (*((_DWORD *)v24 + 21) + 1) % v225[9];
  v138 = v213;
  if (!*(_DWORD *)(a2 + 64))
    H263ME_BlkStat((int *)(v217 + 32900), **(_QWORD **)(a1 + 40) + v209 + 16, v213, *(_DWORD *)(v56 + 8480), *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8), (unsigned int *)v25);
  if (*(_BYTE *)(v24[5] + 17) == 1 && !*(_BYTE *)(v25 + 48))
  {
    *(_DWORD *)(v56 + 8472) = 0;
    *(_QWORD *)(v56 + 8464) = 0;
    if (v221[18])
    {
      H263ME_GetVectorsUMV(v217, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 24), 15, 0, *(_QWORD *)(v24[6] + 16), *(_DWORD *)(*v24 + 40), *(_QWORD *)(a2 + 48));
    }
    else if ((*(_BYTE *)(v56 + 8480) & 0x80) != 0)
    {
      H263ME_GetVectors(0, v217, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 24), 15, 0, *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8));
    }
  }
  else
  {
    v139 = v225[4];
    if ((_DWORD)v139)
    {
      v140 = 0;
      v141 = v225[5];
      v142 = (_WORD *)(v217 + 306);
      v143 = (_DWORD *)(v217 + 32908);
      do
      {
        if ((_DWORD)v141)
        {
          v144 = v141;
          v145 = v143;
          v146 = v142;
          do
          {
            *(v146 - 2) = 3;
            *v146 = *v145;
            *(v146 - 1) = *(v145 - 2);
            v146 += 6;
            v145 += 3;
            --v144;
          }
          while (v144);
        }
        ++v140;
        v142 += 144;
        v143 += 66;
      }
      while (v140 != v139);
    }
  }
  if (*(_BYTE *)(v24[5] + 17) == 1 && *(_BYTE *)(v25 + 48))
    H263ME_Intracize((_DWORD *)v217);
  *(_DWORD *)v220 = 7238243;
  *(_BYTE *)(v220 + 92) = 1;
  v147 = v24[4];
  v148 = (double)a16;
  if (*(_BYTE *)(v147 + 104))
  {
    C_Function_SetFrameDuration(*(_QWORD *)(v147 + 96), v148);
  }
  else
  {
    v149 = a18;
    v227 = 0u;
    *(double *)&v226[1] = 1000.0 / v148;
    v226[0] = a15;
    if (!a18)
      v149 = 0x7FFFFFFF;
    DWORD1(v227) = v149;
    v228 = a9;
    C_Function_Init(*(_QWORD *)(v147 + 96), v226, v138);
    *(_BYTE *)(v24[4] + 104) = 1;
  }
  v150 = v225;
  if (*(_BYTE *)(v24[5] + 17) != 1)
  {
    if (!*(_BYTE *)(v24[5] + 17) && *(_BYTE *)(v25 + 48) == 1)
    {
      v151 = 2;
      goto LABEL_148;
    }
LABEL_199:
    H263CMPR_CompressMaster_cold_1();
  }
  if (*(_BYTE *)(v25 + 48))
    goto LABEL_199;
  v151 = 0;
LABEL_148:
  C_Function_SetSliceType(*(_QWORD *)(v24[4] + 106), v151);
  C_Function_SetDisplayOdrIdx(*(_QWORD *)(v24[4] + 106), (*(_DWORD *)(v25 + 8) - 1));
  C_Function_SetFlagIsRefPic(*(_QWORD *)(v24[4] + 106), 1);
  Qp = C_Function_RC_GetQp(*(_QWORD *)(v24[4] + 96), *(_QWORD *)(v24[4] + 106));
  v153 = v24[5];
  *(_BYTE *)(v153 + 27) = Qp;
  *(_BYTE *)(v28 + 153) = Qp;
  *(_BYTE *)(v24[6] + 3) = Qp;
  *(float *)(v153 + 36) = (float)(int)Qp;
  *(_BYTE *)(v220 + 95) = Qp;
  *(_BYTE *)(v220 + 94) = Qp;
  C_Function_SetQP(*(_QWORD *)(v24[4] + 106), Qp);
  if (*(_DWORD *)(v25 + 4) != *(_DWORD *)(v25 + 8))
    Q_UpdateHistory(v24[4], v25);
  v216 = v217 + 32900;
  Q_Setup(v24[5], v24[4], *(_QWORD *)(v24[8] + 32), (_DWORD *)v25, a7, (uint64_t)v225, v217 + 32900, *(_QWORD *)v56, 1);
  v38 = 0;
  while (2)
  {
    *(_WORD *)(v25 + 52) = 0;
    switch((int)v38)
    {
      case 0:
        goto LABEL_155;
      case 1:
        v154 = *(_DWORD *)(*v24 + 16);
        *(_DWORD *)(v25 + 36) = v154;
        *(_DWORD *)(v25 + 40) = v154;
        *a8 = 512;
        v155 = v24[5];
        *(_BYTE *)(v155 + 17) = 1;
        *(_WORD *)(v25 + 48) = 0;
        goto LABEL_156;
      case 3:
        Q_Setup(v24[5], v24[4], *(_QWORD *)(v24[8] + 32), (_DWORD *)v25, a7, (uint64_t)v150, v216, *(_QWORD *)v56, 0);
        goto LABEL_155;
      case 4:
        H263ME_Intracize((_DWORD *)v217);
        *a8 = 0;
        *(_WORD *)(v25 + 48) = 257;
        *(_BYTE *)(v25 + 50) = 1;
        Q_Setup(v24[5], v24[4], *(_QWORD *)(v24[8] + 32), (_DWORD *)v25, a7, (uint64_t)v150, v216, *(_QWORD *)v56, 1);
LABEL_155:
        v155 = v24[5];
        v156 = *(char *)(v155 + 27);
        *(_BYTE *)(v28 + 153) = *(_BYTE *)(v155 + 27);
        *(_BYTE *)(v24[6] + 3) = v156;
        *(float *)(v155 + 36) = (float)v156;
LABEL_156:
        v157 = *(_DWORD *)(v26 + 12) + *(_DWORD *)(v26 + 8);
        *(_QWORD *)v26 = 0x2000000000;
        *(_DWORD *)(v26 + 8) = 0;
        *(_DWORD *)(v26 + 12) = v157;
        *(_QWORD *)(v26 + 24) = a12;
        *(_DWORD *)v155 = *(unsigned __int8 *)(v25 + 8);
        H263PICT_encPictureHeader(v155, v26);
        *(_DWORD *)(v28 + 158) = 0;
        *(_DWORD *)(v25 + 20) = 0;
        if (!v150[4])
          goto LABEL_173;
        v158 = 0;
        break;
      default:
        goto LABEL_196;
    }
    do
    {
      *(_DWORD *)(v28 + 162) = v158;
      if (*(_BYTE *)(v24[5] + 17) != 1)
        goto LABEL_163;
      if (v158 >= *(_DWORD *)(v25 + 36) && v158 < *(_DWORD *)(v25 + 40))
      {
        if (v221[20])
          H263CMPR_PredGOB_OBMC((int *)a1, (uint64_t)v150, *(_QWORD *)v56, v158);
LABEL_163:
        *(_WORD *)(v25 + 52) |= H263CMPR_GOB(a2, a1, (uint64_t)v150, *(_QWORD *)v56);
        goto LABEL_172;
      }
      v159 = *(int **)v28;
      v161 = *(_DWORD *)a1;
      v160 = *(_DWORD *)(a1 + 4);
      *(_DWORD *)(v25 + 24) = 0;
      if (v150[5])
      {
        v162 = 0;
        v163 = v161 + 32;
        v164 = v160 + 16;
        do
        {
          v165 = (int *)(*(_QWORD *)v28 + 4 * *(unsigned int *)(v25 + 20));
          v166 = *v165;
          v167 = *(_QWORD *)v28 + 4 * v162;
          v168 = *(int *)(v167 + 76);
          v169 = v165[47];
          v170 = *(int *)(v167 + 340);
          v171 = *(_DWORD *)(v26 + 4);
          if (v171)
          {
            v172 = v171 - 1;
            v173 = *(_DWORD *)v26 | (1 << v172);
          }
          else
          {
            v174 = bswap32(*(_DWORD *)v26);
            v175 = *(_QWORD *)(v26 + 24);
            v176 = *(unsigned int *)(v26 + 8);
            *(_DWORD *)(v26 + 8) = v176 + 1;
            *(_DWORD *)(v175 + 4 * v176) = v174;
            v172 = 31;
            v173 = 0x80000000;
          }
          v177 = v168 + v166;
          v178 = v170 + v169;
          *(_DWORD *)v26 = v173;
          *(_DWORD *)(v26 + 4) = v172;
          v179 = v159[42] + v168 + v166;
          Copy8x8(**(_QWORD **)(a1 + 32) + v179, **(_QWORD **)(a1 + 24) + v179, v163);
          v180 = v159[43] + (uint64_t)v177;
          Copy8x8(**(_QWORD **)(a1 + 32) + v180, **(_QWORD **)(a1 + 24) + v180, v163);
          v181 = v159[44] + (uint64_t)v177;
          Copy8x8(**(_QWORD **)(a1 + 32) + v181, **(_QWORD **)(a1 + 24) + v181, v163);
          v182 = v159[45] + (uint64_t)v177;
          Copy8x8(**(_QWORD **)(a1 + 32) + v182, **(_QWORD **)(a1 + 24) + v182, v163);
          Copy8x8(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + v178, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + v178, v164);
          Copy8x8(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + v178, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + v178, v164);
          v56 = v217 + 32832;
          v183 = *(_QWORD *)(v217 + 32832)
               + 12 * (*(_DWORD *)(v28 + 166) + 1)
               + 288 * (*(_DWORD *)(v28 + 162) + 1);
          *(_DWORD *)(v183 + 8) = 0;
          v184 = (_DWORD *)(v183 + 8);
          v185 = 5;
          do
          {
            *((_WORD *)v184 - 4) = 0;
            *((_WORD *)v184 - 1) = 0;
            *v184 = 0;
            v184 += 1368;
            --v185;
          }
          while (v185);
          v162 = *(_DWORD *)(v25 + 24) + 1;
          *(_DWORD *)(v25 + 24) = v162;
          v150 = v225;
        }
        while (v162 < v225[5]);
      }
LABEL_172:
      v158 = *(_DWORD *)(v25 + 20) + 1;
      *(_DWORD *)(v25 + 20) = v158;
      v24 = v224;
    }
    while (v158 < v150[4]);
LABEL_173:
    if (*(_DWORD *)v220 == 7238243)
    {
      v187 = ComputeAvgSAD(*(_QWORD *)v56, v150[2] / 16, v150[3] / 16);
      *(_DWORD *)(v220 + 114) = 32 * *(_DWORD *)(v26 + 8) - *(_DWORD *)(v26 + 4) + 32;
      v188 = v24[4];
      v189 = *(_QWORD *)(v188 + 96);
      DisplayOdrIdx = C_Function_GetDisplayOdrIdx(*(_QWORD *)(v188 + 106));
      C_Function_UpdateFrameComplexity(v189, v187, 0, 0, DisplayOdrIdx);
      v191 = v24[4];
      v192 = *(_QWORD *)(v191 + 96);
      v193 = *(unsigned int *)(v220 + 114);
      v194 = C_Function_GetDisplayOdrIdx(*(_QWORD *)(v191 + 106));
      v195 = C_Function_GetQP(*(_QWORD *)(v24[4] + 106));
      C_Function_UpdateRateControllerAfterEncodingFrame(v192, v193, 0, v194, v195);
      goto LABEL_181;
    }
    if (!*(_WORD *)(v25 + 52))
    {
LABEL_181:
      v38 = 0;
      break;
    }
    v38 = Q_RateControl(v24[4], v25, (double)(32 * *(_DWORD *)(v26 + 8) - *(_DWORD *)(v26 + 4) + 32));
    if (v38 <= 4 && ((1 << v38) & 0x1A) != 0)
    {
      *(_DWORD *)(v26 + 8) = 0;
      continue;
    }
    break;
  }
  v196 = bswap32(*(_DWORD *)v26 & ~*(_DWORD *)(v26 + 4 * *(unsigned int *)(v26 + 4) + 32));
  v197 = *(_QWORD *)(v26 + 24);
  v198 = *(unsigned int *)(v26 + 8);
  *(_DWORD *)(v26 + 8) = v198 + 1;
  *(_DWORD *)(v197 + 4 * v198) = v196;
  *(_DWORD *)v26 = 0;
  if (*(_DWORD *)(v25 + 44))
  {
    if (*(int *)(v217 + 39700) >= 1)
    {
      if (*(_BYTE *)(v25 + 48))
      {
        srand(*(_DWORD *)(v197 + ((2 * *(unsigned int *)(v26 + 8)) & 0x1FFFFFFFCLL)));
        v199 = *(_DWORD *)(v25 + 40);
        v200 = *(int *)(v25 + 36);
        if (v200 < v199)
        {
          v201 = *(_DWORD *)(v25 + 32);
          v202 = v217 + 88 * (int)v200 + 39712;
          do
          {
            v203 = *(_DWORD *)(v25 + 28);
            if (v203 < v201)
            {
              v204 = (int *)(v202 + 4 * (int)v203);
              do
              {
                *v204++ = rand() % *(_DWORD *)(v217 + 39700);
                v201 = *(_DWORD *)(v25 + 32);
                ++v203;
              }
              while (v201 > v203);
              v199 = *(_DWORD *)(v25 + 40);
            }
            ++v200;
            v202 += 88;
          }
          while (v199 > v200);
        }
      }
    }
  }
LABEL_196:
  LODWORD(v29) = *(_DWORD *)(v26 + 8);
  *(double *)(v24[4] + 68) = (double)v29 * 32.0;
  return v38;
}

uint64_t H263CMPR_PredGOB_OBMC(int *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  int v28;
  int v29;
  uint64_t *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  int v39;
  int v40;
  char *v41;
  char *v42;
  uint64_t v43;
  int v44;
  int v45;
  char *v46;
  int v47;
  int v48;
  char *v49;
  int v50;
  char *v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  int *v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  BOOL v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  _QWORD *v119;
  uint64_t v120;
  int v121;
  int v122;
  int v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int v129;
  char *v130;
  int v131;
  int v132;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  unsigned int v142;
  uint64_t v143;

  if (*(_DWORD *)(a2 + 20))
  {
    v4 = a3;
    v5 = *a1 + 32;
    v6 = a4 + 1;
    v7 = (_QWORD *)*((_QWORD *)a1 + 3);
    v121 = 8 * v5;
    v143 = *(_QWORD *)((char *)a1 + 66);
    v122 = v5 * (16 * a4 + 16);
    v132 = v122 + 16;
    v8 = 4 * v5;
    v9 = 1;
    v120 = a3 + 288 * v6;
    v126 = 4 * (int)v5;
    v127 = 4 * (int)v5;
    v140 = v6;
    v119 = v7;
    do
    {
      v10 = v6;
      v129 = v9 - 1;
      v131 = v122 + 16 * (v9 - 1);
      v11 = v131 + 16;
      v12 = v143 + 4 * (v131 + 16);
      v13 = v9;
      v139 = (char *)(v120 + 12 * v9);
      v138 = v139 + 1;
      MC_Copy8x8Y_wcc(v143 + 4 * v11, *v7 + v11, v5, *v139, v139[1], (uint64_t)&wcc, 0, 0);
      v14 = v13;
      if (a4 && *(unsigned __int16 *)(v4 + 288 * a4 + 12 * v13 + 2) - 3 > 1)
      {
        v19 = v4 + 288 * a4 + 12 * v13;
        v17 = (char *)(v19 + 16416);
        v18 = (char *)(v19 + 16417);
        v15 = v10;
      }
      else
      {
        v15 = v10;
        v16 = v4 + 288 * v10 + 12 * v14;
        v17 = (char *)(v16 + 5472);
        v18 = (char *)(v16 + 5473);
      }
      v20 = *(char *)(v4 + 288 * v15 + 12 * v14 + 16416);
      v137 = (char *)(v4 + 288 * v15 + 12 * v14 + 16416);
      v21 = *(char *)(v4 + 288 * v15 + 12 * v14 + 16417);
      v136 = (char *)(v4 + 288 * v15 + 12 * v14 + 16417);
      v142 = v14;
      MC_Copy4x8Y_wtb(v12, *v7 + v11, v5, *v17, *v18, (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v11 + v127), *v7 + v11 + v127, v5, v20, v21, (uint64_t)&unk_228575A4C, 0, 0);
      if (v142 == 1 || *(unsigned __int16 *)(v4 + 288 * v15 + 12 * v129 + 2) - 3 <= 1)
      {
        v22 = v7;
        v23 = v5;
        v24 = v4 + 288 * v15 + 12 * v142;
        v25 = (char *)(v24 + 5472);
        v26 = 5473;
      }
      else
      {
        v22 = v7;
        v23 = v5;
        v24 = v4 + 288 * v15 + 12 * v129;
        v25 = (char *)(v24 + 10944);
        v26 = 10945;
      }
      v27 = (char *)(v4 + 288 * v15 + 12 * v142 + 10944);
      v28 = *v27;
      v29 = v27[1];
      v30 = v22;
      v124 = v131 + 16;
      MC_Copy8x4Y_wlr(v12, *v22 + v11, v23, *v25, *(char *)(v24 + v26), (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v131 + 20), *v30 + v131 + 20, v23, v28, v29, (uint64_t)&unk_228575ADC, 0, 0);
      v31 = v131 + 24;
      v32 = v143 + 4 * (v131 + 24);
      v33 = *v30;
      v34 = v27 + 1;
      v5 = v23;
      MC_Copy8x8Y_wcc(v32, v33 + v131 + 24, v23, *v139, *v138, (uint64_t)&wcc, 0, 0);
      v35 = v27;
      v36 = v27;
      v37 = v27 + 1;
      if (a4)
      {
        v36 = v27;
        v37 = v27 + 1;
        if (*(unsigned __int16 *)(a3 + 288 * a4 + 12 * v142 + 2) - 3 >= 2)
        {
          v38 = a3 + 288 * a4 + 12 * v142;
          v36 = (char *)(v38 + 21888);
          v37 = (char *)(v38 + 21889);
        }
      }
      v39 = *(char *)(a3 + 288 * v140 + 12 * v142 + 21888);
      v135 = (char *)(a3 + 288 * v140 + 12 * v142 + 21888);
      v40 = *(char *)(a3 + 288 * v140 + 12 * v142 + 21889);
      v134 = (char *)(a3 + 288 * v140 + 12 * v142 + 21889);
      v130 = v35;
      MC_Copy4x8Y_wtb(v32, *v119 + v31, v23, *v36, *v37, (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v31 + (uint64_t)(int)v127), *v119 + v31 + (uint64_t)(int)v127, v23, v39, v40, (uint64_t)&unk_228575A4C, 0, 0);
      v41 = v130;
      v42 = v34;
      if (v142 != *(_DWORD *)(a2 + 20))
      {
        v41 = v130;
        v42 = v34;
        if (*(unsigned __int16 *)(a3 + 288 * v140 + 12 * (v142 + 1) + 2) - 3 >= 2)
        {
          v43 = a3 + 288 * v140 + 12 * (v142 + 1);
          v41 = (char *)(v43 + 5472);
          v42 = (char *)(v43 + 5473);
        }
      }
      v125 = v34;
      v44 = *v42;
      v45 = *v41;
      v46 = (char *)(a3 + 288 * v140 + 12 * v142 + 5472);
      MC_Copy8x4Y_wlr(v32, *v119 + v31, v23, *v46, *(char *)(a3 + 288 * v140 + 12 * v142 + 5473), (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v131 + 28), *v119 + v131 + 28, v23, v45, v44, (uint64_t)&unk_228575ADC, 0, 0);
      v47 = v124 + v121;
      MC_Copy8x8Y_wcc(v143 + 4 * v47, *v119 + v47, v23, *v139, *v138, (uint64_t)&wcc, 0, 0);
      v48 = *v137;
      v49 = v136;
      v50 = *v136;
      MC_Copy4x8Y_wtb(v143 + 4 * v47, *v119 + v47, v5, *v46, *(char *)(a3 + 288 * v140 + 12 * v142 + 5473), (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v126 + v124 + v121), *v119 + v126 + v124 + v121, v5, v48, v50, (uint64_t)&unk_228575A4C, 0, 0);
      v51 = v137;
      if (v142 != 1)
      {
        v51 = v137;
        v49 = v136;
        if (*(unsigned __int16 *)(a3 + 288 * v140 + 12 * v129 + 2) - 3 >= 2)
        {
          v52 = a3 + 288 * v140 + 12 * v129;
          v51 = (char *)(v52 + 21888);
          v49 = (char *)(v52 + 21889);
        }
      }
      v53 = *v135;
      v54 = *v134;
      MC_Copy8x4Y_wlr(v143 + 4 * (v124 + v121), *v119 + v47, v5, *v51, *v49, (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v47 | 4), *v119 + (v47 | 4), v5, v53, v54, (uint64_t)&unk_228575ADC, 0, 0);
      v55 = v47 + 8;
      v56 = v143 + 4 * (v47 + 8);
      MC_Copy8x8Y_wcc(v143 + 4 * v55, *v119 + v55, v5, *v139, *v138, (uint64_t)&wcc, 0, 0);
      v57 = *v135;
      v58 = *v134;
      v7 = v119;
      MC_Copy4x8Y_wtb(v143 + 4 * v55, *v119 + v55, v5, *v130, *v125, (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v126 + v55), *v119 + v126 + v55, v5, v57, v58, (uint64_t)&unk_228575A4C, 0, 0);
      if (v142 == *(_DWORD *)(a2 + 20))
      {
        v6 = v140;
      }
      else
      {
        v6 = v140;
        if (*(unsigned __int16 *)(a3 + 288 * v140 + 12 * (v142 + 1) + 2) - 3 >= 2)
        {
          v59 = a3 + 288 * v140 + 12 * (v142 + 1);
          v135 = (char *)(v59 + 16416);
          v134 = (char *)(v59 + 16417);
        }
      }
      v60 = (int *)(v143 + 32 + 4 * v132);
      v61 = *v134;
      v62 = *v135;
      MC_Copy8x4Y_wlr(v56, *v119 + v55, v5, *v137, *v136, (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v124 + v121 + 12), *v119 + v124 + v121 + 12, v5, v62, v61, (uint64_t)&unk_228575ADC, 0, 0);
      v63 = 16;
      do
      {
        v64 = *(v60 - 8);
        v65 = *(v60 - 7);
        v67 = v64 + 4;
        v66 = v64 < -4;
        v68 = v64 + 11;
        if (!v66)
          v68 = v67;
        v69 = v68 >> 3;
        v70 = v65 + 4;
        v66 = v65 < -4;
        v71 = v65 + 11;
        if (!v66)
          v71 = v70;
        *(v60 - 8) = v69;
        *(v60 - 7) = v71 >> 3;
        v72 = *(v60 - 6);
        v73 = *(v60 - 5);
        v74 = v72 + 4;
        v66 = v72 < -4;
        v75 = v72 + 11;
        if (!v66)
          v75 = v74;
        v76 = v75 >> 3;
        v77 = v73 + 4;
        v66 = v73 < -4;
        v78 = v73 + 11;
        if (!v66)
          v78 = v77;
        *(v60 - 6) = v76;
        *(v60 - 5) = v78 >> 3;
        v79 = *(v60 - 4);
        v80 = *(v60 - 3);
        v81 = v79 + 4;
        v66 = v79 < -4;
        v82 = v79 + 11;
        if (!v66)
          v82 = v81;
        v83 = v82 >> 3;
        v84 = v80 + 4;
        v66 = v80 < -4;
        v85 = v80 + 11;
        if (!v66)
          v85 = v84;
        *(v60 - 4) = v83;
        *(v60 - 3) = v85 >> 3;
        v86 = *(v60 - 2);
        v87 = *(v60 - 1);
        v88 = v86 + 4;
        v66 = v86 < -4;
        v89 = v86 + 11;
        if (!v66)
          v89 = v88;
        v90 = v89 >> 3;
        v91 = v87 + 4;
        v66 = v87 < -4;
        v92 = v87 + 11;
        if (!v66)
          v92 = v91;
        *(v60 - 2) = v90;
        *(v60 - 1) = v92 >> 3;
        v93 = v60[1];
        v94 = *v60 + 11;
        if (*v60 >= -4)
          v94 = *v60 + 4;
        v95 = v94 >> 3;
        v96 = v93 + 4;
        v66 = v93 < -4;
        v97 = v93 + 11;
        if (!v66)
          v97 = v96;
        *v60 = v95;
        v60[1] = v97 >> 3;
        v98 = v60[2];
        v99 = v60[3];
        v100 = v98 + 4;
        v66 = v98 < -4;
        v101 = v98 + 11;
        if (!v66)
          v101 = v100;
        v102 = v101 >> 3;
        v103 = v99 + 4;
        v66 = v99 < -4;
        v104 = v99 + 11;
        if (!v66)
          v104 = v103;
        v60[2] = v102;
        v60[3] = v104 >> 3;
        v105 = v60[4];
        v106 = v60[5];
        v107 = v105 + 4;
        v66 = v105 < -4;
        v108 = v105 + 11;
        if (!v66)
          v108 = v107;
        v109 = v108 >> 3;
        v110 = v106 + 4;
        v66 = v106 < -4;
        v111 = v106 + 11;
        if (!v66)
          v111 = v110;
        v60[4] = v109;
        v60[5] = v111 >> 3;
        v112 = v60[6];
        v113 = v60[7];
        v114 = v112 + 4;
        v66 = v112 < -4;
        v115 = v112 + 11;
        if (!v66)
          v115 = v114;
        v116 = v113 + 4;
        v66 = v113 < -4;
        v117 = v113 + 11;
        if (!v66)
          v117 = v116;
        v60[6] = v115 >> 3;
        v60[7] = v117 >> 3;
        v60 = (int *)((char *)v60 + v8);
        --v63;
      }
      while (v63);
      v9 = v142 + 1;
      v132 += 16;
      v4 = a3;
    }
    while (v142 + 1 <= *(_DWORD *)(a2 + 20));
  }
  return 0;
}

uint64_t H263CMPR_GOB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char *v16;
  _DWORD *v17;
  int *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _DWORD *v42;
  uint64_t v43;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;

  v5 = a3;
  v7 = *(_QWORD *)(a2 + 296182);
  v8 = *(unsigned int **)(a2 + 296190);
  v9 = *(_QWORD *)(a2 + 296222);
  v10 = *(_QWORD *)(a2 + 296230);
  v11 = *(_QWORD *)(a2 + 296206);
  v12 = *(_BYTE **)(a2 + 296214);
  v8[6] = 0;
  *(_WORD *)(v9 + 4) = 0;
  v13 = v8[5];
  if ((_DWORD)v13 && *(_BYTE *)(*(_QWORD *)(v9 + 16) + v13))
  {
    if (*(_DWORD *)v11 == 7238243)
    {
      LOBYTE(v11) = *(_BYTE *)(v11 + 95);
      *(_BYTE *)(v7 + 153) = v11;
    }
    else
    {
      LODWORD(v11) = *(unsigned __int8 *)(v11 + (*(_DWORD *)(a3 + 20) * v13) + 136);
      if (v11 >= 0x31)
        LOBYTE(v11) = 49;
    }
    *(_BYTE *)(v9 + 3) = v11;
    a1 = H263CMPR_GOBHeader(v10, v13, (char)v12[25], *(char *)(v9 + 1), *(char *)(v9 + 2), (char)v11);
    *(_DWORD *)(*(_QWORD *)(v9 + 8) + 4 * v8[5]) = a1;
    *(_WORD *)(v9 + 4) = 1;
    *(_BYTE *)(v7 + 153) = *(_BYTE *)(v9 + 3);
  }
  v8[6] = 0;
  if (*(_DWORD *)(v5 + 20))
  {
    v50 = 0;
    v14 = 0;
    v45 = a4 + 8;
    v46 = v12;
    v48 = v5;
    v49 = a4;
    v47 = v10;
    do
    {
      *(_DWORD *)(v7 + 166) = v14;
      *(_BYTE *)(v7 + 156) = 0;
      if (v12[17])
      {
        if (v14 < v8[7] || v14 >= v8[8])
        {
          v18 = *(int **)v7;
          v19 = (int *)(*(_QWORD *)v7 + 4 * v8[5]);
          v20 = *v19;
          v21 = *(_QWORD *)v7 + 4 * v14;
          v22 = *(int *)(v21 + 76);
          v23 = v19[47];
          v24 = *(int *)(v21 + 340);
          v26 = *(_DWORD *)a2;
          v25 = *(_DWORD *)(a2 + 4);
          v27 = *(_DWORD *)(v10 + 4);
          if (v27)
          {
            v28 = v27 - 1;
            v29 = *(_DWORD *)v10 | (1 << v28);
          }
          else
          {
            v30 = bswap32(*(_DWORD *)v10);
            v31 = *(_QWORD *)(v10 + 24);
            v32 = *(unsigned int *)(v10 + 8);
            *(_DWORD *)(v10 + 8) = v32 + 1;
            *(_DWORD *)(v31 + 4 * v32) = v30;
            v28 = 31;
            v29 = 0x80000000;
          }
          v33 = (_DWORD *)v10;
          v34 = v22 + v20;
          v35 = v24 + v23;
          v36 = v26 + 32;
          v37 = v25 + 16;
          *v33 = v29;
          v33[1] = v28;
          Copy8x8(**(_QWORD **)(a2 + 32) + v18[42] + v34, **(_QWORD **)(a2 + 24) + v18[42] + v34, v26 + 32);
          v38 = v18[43] + (uint64_t)(int)v34;
          Copy8x8(**(_QWORD **)(a2 + 32) + v38, **(_QWORD **)(a2 + 24) + v38, v36);
          v39 = v18[44] + (uint64_t)(int)v34;
          Copy8x8(**(_QWORD **)(a2 + 32) + v39, **(_QWORD **)(a2 + 24) + v39, v36);
          v40 = v18[45] + (uint64_t)(int)v34;
          Copy8x8(**(_QWORD **)(a2 + 32) + v40, **(_QWORD **)(a2 + 24) + v40, v36);
          Copy8x8(*(_QWORD *)(*(_QWORD *)(a2 + 32) + 8) + v35, *(_QWORD *)(*(_QWORD *)(a2 + 24) + 8) + v35, v37);
          a1 = Copy8x8(*(_QWORD *)(*(_QWORD *)(a2 + 32) + 16) + v35, *(_QWORD *)(*(_QWORD *)(a2 + 24) + 16) + v35, v37);
          v41 = 12 * (*(_DWORD *)(v7 + 166) + 1) + 288 * (*(_DWORD *)(v7 + 162) + 1);
          a4 = v49;
          *(_DWORD *)(v41 + v49 + 8) = 0;
          v42 = (_DWORD *)(v45 + v41);
          v43 = 5;
          do
          {
            *((_WORD *)v42 - 1) = 0;
            *v42 = 0;
            *((_WORD *)v42 - 4) = 0;
            v42 += 1368;
            --v43;
          }
          while (v43);
          v10 = v47;
          v5 = v48;
          v12 = v46;
        }
        else
        {
          v15 = 0;
          v16 = (char *)(a4 + 12 * (v14 + 1) + 288 * (*(_DWORD *)(v7 + 162) + 1));
          *(_BYTE *)(v7 + 154) = v16[2];
          do
          {
            v17 = (_DWORD *)(v7 + 174 + v15);
            v17[6] = *v16;
            v17[12] = v16[1];
            *v17 = *((_DWORD *)v16 + 2);
            v16 += 5472;
            v15 += 4;
          }
          while (v15 != 24);
          if (v12[20])
            a1 = H263CMPR_MB_OBMCS16(a2, a4);
          else
            a1 = H263CMPR_MbS16(a1, a2, a4);
          v50 |= (_DWORD)a1 != 2;
        }
      }
      else
      {
        *(_BYTE *)(v7 + 154) = 3;
        a1 = H263CMPR_MbS16(a1, a2, a4);
        v50 = 1;
        *(_BYTE *)(v7 + 156) = 1;
      }
      v14 = v8[6] + 1;
      v8[6] = v14;
    }
    while (v14 < *(_DWORD *)(v5 + 20));
  }
  else
  {
    return 0;
  }
  return v50;
}

uint64_t H263CMPR_GOBHeader(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;

  v6 = *(unsigned int *)(a1 + 8);
  v7 = *(_DWORD *)(a1 + 4) & 0xFFFFFFF8;
  if (v7 <= 0x10)
  {
    v10 = *(_DWORD *)(a1 + 100) & 1;
    v11 = bswap32(*(_DWORD *)a1);
    v12 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 8) = v6 + 1;
    *(_DWORD *)(v12 + 4 * v6) = v11;
    v8 = v7 + 15;
    *(_DWORD *)(a1 + 4) = v7 + 15;
    v9 = v10 << (v7 + 15);
  }
  else
  {
    v8 = v7 - 17;
    v9 = *(_DWORD *)a1 | ((unint64_t)(*(_DWORD *)(a1 + 100) & 1) << (v7 - 17));
  }
  v13 = v8 - 5;
  v14 = ((*(_DWORD *)(a1 + 52) & a2) << (v8 - 5)) | v9;
  if (a3)
  {
    if (v13 < 2)
    {
      v15 = *(_DWORD *)(a1 + 40) & a4;
      v16 = (v15 >> (7 - v8)) | v14;
      *(_DWORD *)a1 = v16;
      v17 = (v16 << 8) & 0xFF0000 | (v16 << 24) | (v16 >> 8) & 0xFF00 | HIBYTE(v16);
      v18 = *(_QWORD *)(a1 + 24);
      v19 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v19 + 1;
      *(_DWORD *)(v18 + 4 * v19) = v17;
      v13 = v8 + 25;
      v14 = v15 << (v8 + 25);
    }
    else
    {
      v13 = v8 - 7;
      v14 |= (*(_DWORD *)(a1 + 40) & a4) << (v8 - 7);
    }
  }
  if (v13 <= 1)
  {
    v28 = *(_DWORD *)(a1 + 40) & a5;
    v29 = (((v28 >> (2 - v13)) | v14) << 8) & 0xFF0000 | (((v28 >> (2 - v13)) | v14) << 24) | (((v28 >> (2 - v13)) | v14) >> 8) & 0xFF00 | (((v28 >> (2 - v13)) | v14) >> 24);
    v30 = *(_QWORD *)(a1 + 24);
    v31 = *(unsigned int *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = v31 + 1;
    *(_DWORD *)(v30 + 4 * v31) = v29;
    v20 = v13 + 30;
    v21 = v28 << (v13 + 30);
    goto LABEL_12;
  }
  v20 = v13 - 2;
  v21 = ((*(_DWORD *)(a1 + 40) & a5) << (v13 - 2)) | v14;
  if (v13 - 2 >= 5)
  {
LABEL_12:
    *(_DWORD *)(a1 + 4) = v20 - 5;
    v27 = ((*(_DWORD *)(a1 + 52) & a6) << (v20 - 5)) | v21;
    goto LABEL_13;
  }
  v22 = *(_DWORD *)(a1 + 52) & a6;
  v23 = (((v22 >> (7 - v13)) | v21) << 8) & 0xFF0000 | (((v22 >> (7 - v13)) | v21) << 24) | (((v22 >> (7 - v13)) | v21) >> 8) & 0xFF00 | (((v22 >> (7 - v13)) | v21) >> 24);
  v24 = *(_QWORD *)(a1 + 24);
  v25 = *(unsigned int *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v25 + 1;
  *(_DWORD *)(v24 + 4 * v25) = v23;
  v26 = v13 + 25;
  *(_DWORD *)(a1 + 4) = v26;
  v27 = v22 << v26;
LABEL_13:
  *(_DWORD *)a1 = v27;
  return 4 * (_DWORD)v6 + ((32 - v7) >> 3);
}

uint64_t H263CMPR_MbS16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t *v9;
  int v10;
  int v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  _WORD *v50;
  uint64_t *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v59;
  uint64_t v60;
  int v61;
  __int16 *v62;
  int *v63;
  int v64;
  int v65;
  unsigned int v66;
  _WORD *v67;
  uint64_t v68;
  __int16 v69;
  int v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int i;
  int v78;
  uint64_t v79;
  int v80;
  _WORD *v81;
  _DWORD *v82;
  int v83;
  int v84;
  uint64_t v85;
  int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unsigned __int8 *v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  int v101;
  uint64_t v102;
  int v103;
  unint64_t v104;
  uint64_t v105;
  int v106;
  _BOOL4 v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  int v112;
  int v113;
  int v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unsigned int v121;
  unsigned int v122;
  int v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unsigned __int8 *v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  unsigned int v142;
  uint64_t v143;
  int v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  unsigned int v152;
  _BYTE *v153;
  int v154;
  int v155;
  int v156;
  char v157;
  int v158;
  int v159;
  int v160;
  int v161;
  uint64_t j;
  int v163;
  int v164;
  uint64_t v165;
  int v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unsigned int v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  int v176;
  uint64_t v177;
  uint64_t v178;
  unsigned int v179;
  uint64_t v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  int v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  unsigned int v193;
  unsigned int v194;
  unsigned int v195;
  unsigned int v196;
  unsigned int v197;
  int v198;
  uint64_t v199;
  uint64_t v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  unsigned int v205;
  int v206;
  uint64_t v207;
  uint64_t v208;
  int v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  int16x8_t *v213;
  int *v214;
  int v215;
  unsigned int v216;
  int v217;
  __int16 *v218;
  unsigned int v219;
  int v220;
  unsigned int v221;
  int v222;
  unsigned int v223;
  unsigned int v224;
  int v225;
  int v226;
  int v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;
  uint64_t v231;
  _DWORD *v232;
  int v233;
  unsigned int v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  int v239;
  uint64_t v240;
  __int16 v241;
  unsigned int v242;
  int v243;
  unint64_t v244;
  int v245;
  uint64_t v246;
  unsigned int v247;
  unsigned int v248;
  int v249;
  unsigned int v250;
  int v251;
  int v252;
  uint64_t v253;
  uint64_t v254;
  unsigned int v255;
  unsigned int v256;
  char *v257;
  int v258;
  int v259;
  int v261;
  int v262;
  int v263;
  int v264;
  int v265;
  int v266;
  int v267;
  unsigned int v268;
  uint64_t v269;
  uint64_t v270;
  int v271;
  uint64_t v272;
  uint64_t v273;
  unsigned int v274;
  uint64_t v275;
  uint64_t v276;
  __int16 *v277;
  uint64_t v278;
  int v279;
  unsigned int v280;
  uint64_t v281;
  uint64_t v282;
  char v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  unsigned int v289;
  unsigned int v290;
  int v291;
  uint64_t v292;
  uint64_t v294;
  uint64_t v296;
  uint64_t *v297;
  uint64_t v298;
  uint64_t v299;
  _BOOL4 v300;
  int v301;
  _QWORD *v302;
  uint64_t v303;
  uint64_t v304;
  _BYTE v305[6];

  v3 = (_QWORD *)(a2 + 296174);
  v4 = *(_QWORD **)(a2 + 296238);
  v6 = *(_QWORD *)(a2 + 296182);
  v5 = *(_QWORD *)(a2 + 296190);
  v7 = *(_QWORD *)(a2 + 296206);
  v8 = *(int **)v6;
  v9 = *(uint64_t **)(a2 + 24);
  v10 = *(_DWORD *)a2 + 32;
  v11 = *(_DWORD *)(a2 + 4) + 16;
  v12 = (int *)(*(_QWORD *)v6 + 4 * *(int *)(v5 + 20));
  v13 = *(_QWORD *)v6 + 4 * *(int *)(v5 + 24);
  v294 = *(int *)(v13 + 76) + (uint64_t)*v12;
  v14 = v12[47];
  v15 = *(char *)(v6 + 154);
  v16 = *(_DWORD *)(v6 + 4 * v15 + 330);
  v300 = v16 != 0;
  if (*(_DWORD *)v7 == 7238243)
    v17 = *(char *)(v7 + 95);
  else
    v17 = *(unsigned __int8 *)(v7
                             + (*(_DWORD *)(v6 + 166) + *(_DWORD *)(*v3 + 20) * *(_DWORD *)(v6 + 162))
                             + 136);
  v297 = (uint64_t *)v4[6];
  v302 = (_QWORD *)v4[5];
  v303 = v4[4];
  v299 = *(_QWORD *)(a2 + 296198);
  v18 = *(_QWORD *)(a2 + 296230);
  v298 = *(_QWORD *)(a2 + 296222);
  v19 = *v9;
  v296 = *(int *)(v13 + 340) + v14;
  *(_BYTE *)(v6 + 155) = 0;
  if (v17 <= 48 && (v15 == 3 || !(_BYTE)v15))
  {
    v20 = *(unsigned __int8 *)(v6 + 153);
    LOBYTE(v21) = v17 - v20;
    *(_BYTE *)(v6 + 155) = v17 - v20;
    if (v20 != v17)
    {
      v21 = (char)v21;
      if ((char)v21 <= 2)
      {
        if (v21 > -3)
        {
LABEL_13:
          *(_BYTE *)(v6 + 153) = v21 + v20;
          *(_BYTE *)(v6 + 154) = v15 + 1;
          goto LABEL_14;
        }
        LOBYTE(v21) = -2;
      }
      else
      {
        LOBYTE(v21) = 2;
      }
      *(_BYTE *)(v6 + 155) = v21;
      goto LABEL_13;
    }
  }
LABEL_14:
  v301 = v16;
  v292 = v5;
  v22 = v19 + v294;
  *(_BYTE *)(v6 + 152) = *(_BYTE *)(v6 + 153);
  Grab8x8CharS16(*(_QWORD *)(v6 + 8), **(_QWORD **)(a2 + 40) + v8[42] + (uint64_t)(int)v294, v10);
  Grab8x8CharS16(*(_QWORD *)(v6 + 16), **(_QWORD **)(a2 + 40) + v8[43] + (uint64_t)(int)v294, v10);
  Grab8x8CharS16(*(_QWORD *)(v6 + 24), **(_QWORD **)(a2 + 40) + v8[44] + (uint64_t)(int)v294, v10);
  Grab8x8CharS16(*(_QWORD *)(v6 + 32), **(_QWORD **)(a2 + 40) + v8[45] + (uint64_t)(int)v294, v10);
  Grab8x8CharS16(*(_QWORD *)(v6 + 40), *(_QWORD *)(*(_QWORD *)(a2 + 40) + 8) + v296, v11);
  Grab8x8CharS16(*(_QWORD *)(v6 + 48), *(_QWORD *)(*(_QWORD *)(a2 + 40) + 16) + v296, v11);
  v23 = *(char *)(v6 + 154);
  if (v23 >= 2)
  {
    if (v23 != 2)
      goto LABEL_32;
    v27 = 0;
    while (1)
    {
      v28 = v6 + 4 * v27;
      if (*(_DWORD *)(v28 + 202))
        break;
      ++v27;
      v29 = *(_DWORD *)(v28 + 226);
      if (v27 > 3 || v29)
      {
        if (!v29)
        {
          v26 = *(_QWORD *)(v6 + 8);
          goto LABEL_16;
        }
        break;
      }
    }
    v30 = vaddvq_s32(*(int32x4_t *)(v6 + 226));
    v31 = vaddvq_s32(*(int32x4_t *)(v6 + 202));
    v32 = (v31 >> 31) | 1;
    if (v32 * v31 <= 0)
      v33 = -(-(v32 * v31) & 0xF);
    else
      v33 = (v32 * v31) & 0xF;
    v34 = roundtab16[v33] * v32;
    v35 = v31 + (v31 < 0 ? 0xF : 0);
    v36 = (v30 >> 31) | 1;
    if (v36 * v30 <= 0)
      v37 = -(-(v36 * v30) & 0xF);
    else
      v37 = (v36 * v30) & 0xF;
    v38 = v34 + 2 * (v35 >> 4);
    v291 = roundtab16[v37] * v36 + 2 * (v30 / 16);
    MC_ForYS16(*(_QWORD *)(v6 + 8), v22 + v8[42], v10, *(_DWORD *)(v6 + 202), *(_DWORD *)(v6 + 226));
    MC_ForYS16(*(_QWORD *)(v6 + 16), v22 + v8[43], v10, *(_DWORD *)(v6 + 206), *(_DWORD *)(v6 + 230));
    MC_ForYS16(*(_QWORD *)(v6 + 24), v22 + v8[44], v10, *(_DWORD *)(v6 + 210), *(_DWORD *)(v6 + 234));
    MC_ForYS16(*(_QWORD *)(v6 + 32), v22 + v8[45], v10, *(_DWORD *)(v6 + 214), *(_DWORD *)(v6 + 238));
    MC_ForUVS16(*(_QWORD *)(v6 + 40), v9[1] + v296, v11, v38, v291);
    v39 = *(_QWORD *)(v6 + 48);
    v40 = v9[2] + v296;
    v41 = v11;
    v42 = v38;
    v43 = v291;
LABEL_31:
    MC_ForUVS16(v39, v40, v41, v42, v43);
    goto LABEL_32;
  }
  v24 = *(_DWORD *)(v6 + 198);
  v25 = *(_DWORD *)(v6 + 222);
  v26 = *(_QWORD *)(v6 + 8);
  if (v24 | v25)
  {
    MC_ForYS16(v26, v22 + v8[42], v10, v24, v25);
    MC_ForYS16(*(_QWORD *)(v6 + 16), v22 + v8[43], v10, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    MC_ForYS16(*(_QWORD *)(v6 + 24), v22 + v8[44], v10, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    MC_ForYS16(*(_QWORD *)(v6 + 32), v22 + v8[45], v10, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    MC_ForUVS16(*(_QWORD *)(v6 + 40), v9[1] + v296, v11, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    v39 = *(_QWORD *)(v6 + 48);
    v40 = v9[2] + v296;
    v42 = *(_DWORD *)(v6 + 198);
    v43 = *(_DWORD *)(v6 + 222);
    v41 = v11;
    goto LABEL_31;
  }
LABEL_16:
  ForwardDiffCharS16(v26, *v9 + v8[42] + (uint64_t)(int)v294, v10);
  ForwardDiffCharS16(*(_QWORD *)(v6 + 16), *v9 + v8[43] + (uint64_t)(int)v294, v10);
  ForwardDiffCharS16(*(_QWORD *)(v6 + 24), *v9 + v8[44] + (uint64_t)(int)v294, v10);
  ForwardDiffCharS16(*(_QWORD *)(v6 + 32), *v9 + v8[45] + (uint64_t)(int)v294, v10);
  ForwardDiffCharS16(*(_QWORD *)(v6 + 40), v9[1] + v296, v11);
  ForwardDiffCharS16(*(_QWORD *)(v6 + 48), v9[2] + v296, v11);
LABEL_32:
  v289 = v10;
  v290 = v11;
  v44 = v3;
  v45 = 0;
  v46 = (uint64_t *)(v6 + 56);
  do
  {
    if (v45 >= 4)
      v47 = 152;
    else
      v47 = 153;
    v48 = *(char *)(v6 + v47);
    v49 = *(char *)(v6 + 153);
    v51 = v46 - 6;
    v50 = (_WORD *)*(v46 - 6);
    if (v49 >= 8)
      v51 = v46;
    v52 = *v51;
    v53 = *(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 330);
    v54 = *(uint64_t *)((char *)v297 + 1516);
    v55 = *(uint64_t *)((char *)v297 + 1524);
    v56 = *(uint64_t *)((char *)v297 + 1508);
    v57 = *(_QWORD *)(v303 + 8 * v49 + 102656);
    if (*(char *)(v3[4] + 94) >= 50 && v53 == 0)
    {
      RowCol4x4S16(v50, (_WORD *)v52, v48, 0, v54, v55, v56, v57);
      *(_WORD *)(v52 + 54) = 0;
      *(_DWORD *)(v52 + 50) = 0;
      *(_DWORD *)(v52 + 36) = 0;
      v59 = 3;
      *(_WORD *)(v52 + 22) = 0;
    }
    else
    {
      RowCol8x8S16(v50, v52, v48, v53, v54, v55, v56, v57);
      v59 = 5;
    }
    v305[v45++] = v59;
    ++v46;
  }
  while (v45 != 6);
  if (*(char *)(v6 + 153) <= 7)
    Q_QuantizeS16((char *)v6, v292, v299, v303, v297[1]);
  v60 = 0;
  v61 = v301;
  do
  {
    switch(v305[v60])
    {
      case 0:
        *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
        break;
      case 1:
        if (v61)
        {
          *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
          **(_WORD **)(v6 + 8 * v60 + 8) = **(_WORD **)(v6 + 8 * v60 + 56);
        }
        else
        {
          v79 = v6 + 8 * v60;
          v80 = **(unsigned __int16 **)(v79 + 56);
          v81 = *(_WORD **)(v79 + 8);
          v82 = (_DWORD *)(v6 + 4 * v60 + 254);
          if (v80)
          {
            *v81 = v80;
            *v82 = 1;
          }
          else
          {
            *v81 = 0;
            *v82 = 0;
            v305[v60] = 0;
          }
        }
        break;
      case 2:
        v67 = *(_WORD **)(v6 + 8 * v60 + 56);
        v68 = v301 != 0;
        do
        {
          if (v67[v68])
          {
            v72 = *(_QWORD *)(v6 + 8 * v60 + 8);
            *(_WORD *)v72 = *v67;
            *(_WORD *)(v72 + 2) = v67[1];
            *(_DWORD *)(v72 + 4) = 0;
            *(_WORD *)(v72 + 8) = 0;
            *(_WORD *)(v72 + 10) = v67[2];
            goto LABEL_76;
          }
          ++v68;
        }
        while (v68 != 3);
        *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
        if (v61)
        {
          v69 = *v67;
          goto LABEL_79;
        }
        break;
      case 3:
        v62 = *(__int16 **)(v6 + 8 * v60 + 56);
        v70 = v300;
        do
        {
          if (v62[v70])
          {
            ZigZag4x4BlockS16(v62, *(_QWORD *)(v6 + 8 * v60 + 8));
            goto LABEL_75;
          }
          if ((((_BYTE)v70 + 1) & 3) != 0)
            v71 = v70;
          else
            v71 = v70 + 4;
          v70 = v71 + 1;
        }
        while (v71 < 27);
        goto LABEL_77;
      default:
        v62 = *(__int16 **)(v6 + 8 * v60 + 56);
        v63 = (int *)&v62[v301 != 0];
        if (v61)
        {
          v65 = *(__int16 *)v63;
          v63 = (int *)((char *)v63 + 2);
          v64 = v65;
          v66 = 62;
        }
        else
        {
          v64 = 0;
          v66 = 64;
        }
        do
        {
          v73 = *v63;
          v74 = v63[1];
          v75 = v63[2];
          v76 = v63[3];
          v63 += 4;
          v64 |= v73 | v74 | v75 | v76;
          v66 -= 8;
        }
        while (v66 > 7);
        if (v66)
        {
          for (i = 0; i != v66; ++i)
          {
            v78 = *(__int16 *)v63;
            v63 = (int *)((char *)v63 + 2);
            v64 |= v78;
          }
        }
        if (v64)
        {
          ZigZagBlockS16(v62, *(_WORD **)(v6 + 8 * v60 + 8));
LABEL_75:
          v61 = v301;
LABEL_76:
          *(_DWORD *)(v6 + 4 * v60 + 254) = 1;
        }
        else
        {
LABEL_77:
          *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
          if (v61)
          {
            v69 = *v62;
LABEL_79:
            **(_WORD **)(v6 + 8 * v60 + 8) = v69;
            v305[v60] = 1;
          }
        }
        break;
    }
    ++v60;
  }
  while (v60 != 6);
  v83 = *(_DWORD *)(v6 + 274) | (2 * *(_DWORD *)(v6 + 270));
  v84 = (4 * *(_DWORD *)(v6 + 258)) | (8 * *(_DWORD *)(v6 + 254)) | (2 * *(_DWORD *)(v6 + 262)) | *(_DWORD *)(v6 + 266);
  *(_DWORD *)(v6 + 246) = v83;
  *(_DWORD *)(v6 + 250) = v84;
  if (*(_BYTE *)(v3[5] + 17) != 1)
  {
    v88 = *(_BYTE *)(v6 + 154) & 7;
    *(_BYTE *)(v6 + 154) = v88;
    v89 = (4 * v88 - 12) | v83 & 0xF;
    *(_DWORD *)(v6 + 246) = v89;
    v90 = v302[5];
    v91 = (unsigned __int8 *)(v90 + v89 + 8);
    v92 = *v91;
    v93 = *(_DWORD *)(v18 + 4);
    v94 = v93 - v92;
    v85 = a3;
    if (v93 < v92)
    {
      v95 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v90 + v89 + 8) + 32) & *(unsigned __int8 *)(v90 + v89);
      v96 = v92 - v93;
      v97 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v95 >> (v92 - v93)) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
      v98 = *(_QWORD *)(v18 + 24);
      v99 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v99 + 1;
      *(_DWORD *)(v98 + 4 * v99) = v97;
      v94 = 32 - v96;
      *(_DWORD *)(v18 + 4) = 32 - v96;
      v100 = v95 << -(char)v96;
      goto LABEL_114;
    }
    *(_DWORD *)(v18 + 4) = v94;
    v101 = *(unsigned __int8 *)(v90 + v89);
    v102 = *v91;
    goto LABEL_113;
  }
  v85 = a3;
  if (v61)
  {
    *(_BYTE *)(v6 + 156) = 1;
    v86 = *(_DWORD *)(v18 + 4);
    if (v86)
    {
      v87 = v86 - 1;
    }
    else
    {
      v108 = bswap32(*(_DWORD *)v18);
      v109 = *(_QWORD *)(v18 + 24);
      v110 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v110 + 1;
      *(_DWORD *)(v109 + 4 * v110) = v108;
      *(_DWORD *)v18 = 0;
      v87 = 31;
    }
    *(_DWORD *)(v18 + 4) = v87;
    LOBYTE(v103) = *(_BYTE *)(v6 + 154);
LABEL_110:
    v118 = *(_DWORD *)(v6 + 246) & 0xF;
    LODWORD(v88) = v103 & 7;
    *(_BYTE *)(v6 + 154) = v88;
    v119 = v118 | (4 * v88);
    *(_DWORD *)(v6 + 246) = v119;
    v120 = v302[6];
    v121 = *(unsigned __int8 *)(v120 + v119 + 24);
    v94 = v87 - v121;
    if (v87 < v121)
    {
      v122 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v120 + v119 + 24) + 32) & *(unsigned __int8 *)(v120 + v119);
      v123 = v121 - v87;
      v124 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v122 >> v123) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
      v125 = *(_QWORD *)(v18 + 24);
      v126 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v126 + 1;
      *(_DWORD *)(v125 + 4 * v126) = v124;
      v94 = 32 - v123;
      *(_DWORD *)(v18 + 4) = 32 - v123;
      v100 = v122 << -(char)v123;
      goto LABEL_114;
    }
    *(_DWORD *)(v18 + 4) = v94;
    v101 = *(unsigned __int8 *)(v120 + v119);
    v102 = *(unsigned __int8 *)(v120 + v119 + 24);
LABEL_113:
    v100 = ((*(_DWORD *)(v18 + 4 * v102 + 32) & v101) << v94) | *(_DWORD *)v18;
LABEL_114:
    *(_DWORD *)v18 = v100;
    v127 = v88;
    v128 = *(_DWORD *)(v6 + 4 * v88 + 330);
    v129 = *(_DWORD *)(v6 + 250);
    if (!v128)
    {
      v129 = ~v129 & 0xF;
      *(_DWORD *)(v6 + 250) = v129;
    }
    v130 = v302[7];
    v131 = v129;
    v132 = v130 + v129;
    v135 = *(unsigned __int8 *)(v132 + 16);
    v133 = (unsigned __int8 *)(v132 + 16);
    v134 = v135;
    v136 = v94 - v135;
    if (v94 >= v135)
    {
      *(_DWORD *)(v18 + 4) = v136;
      v142 = ((*(_DWORD *)(v18 + 4 * *v133 + 32) & *(unsigned __int8 *)(v130 + v131)) << v136) | v100;
    }
    else
    {
      v137 = *(_DWORD *)(v18 + 4 * v134 + 32) & *(unsigned __int8 *)(v130 + v131);
      v138 = v134 - v94;
      v139 = (v100 << 8) & 0xFF0000 | (((v137 >> v138) | v100) << 24) | (v100 >> 8) & 0xFF00 | HIBYTE(v100);
      v140 = *(_QWORD *)(v18 + 24);
      v141 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v141 + 1;
      *(_DWORD *)(v140 + 4 * v141) = v139;
      v136 = 32 - v138;
      *(_DWORD *)(v18 + 4) = 32 - v138;
      v142 = v137 << -(char)v138;
    }
    *(_DWORD *)v18 = v142;
    if (*(_DWORD *)(v6 + 4 * v127 + 310))
    {
      v143 = *(char *)(v6 + 155) + 2;
      if (v143 > 4 || ((0x1Bu >> v143) & 1) == 0)
        return 0xFFFFFFFFLL;
      v145 = dword_228575CCC[v143];
      v146 = v136 - 2;
      if (v136 < 2)
      {
        v148 = *(_DWORD *)(v18 + 40) & v145;
        v149 = (v142 << 8) & 0xFF0000 | (((v148 >> (2 - v136)) | v142) << 24) | (v142 >> 8) & 0xFF00 | HIBYTE(v142);
        v150 = *(_QWORD *)(v18 + 24);
        v151 = *(unsigned int *)(v18 + 8);
        *(_DWORD *)(v18 + 8) = v151 + 1;
        *(_DWORD *)(v150 + 4 * v151) = v149;
        v146 = v136 + 30;
        v147 = v148 << (v136 + 30);
      }
      else
      {
        v147 = ((*(_DWORD *)(v18 + 40) & v145) << v146) | v142;
      }
      *(_DWORD *)v18 = v147;
      *(_DWORD *)(v18 + 4) = v146;
    }
    *(_BYTE *)(v292 + 22 * *(unsigned int *)(v292 + 20) + *(unsigned int *)(v292 + 24) + 1656) = *(_BYTE *)(v6 + 153);
    if (!*(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 350))
      goto LABEL_159;
    v152 = *(unsigned __int8 *)(v6 + 154);
    v153 = (_BYTE *)v3[5];
    if (v152 > 1 || v153[20])
    {
      if (v152 >= 2)
      {
        for (j = 0; j != 4; ++j)
        {
          if (*(_BYTE *)(v3[5] + 18))
          {
            v163 = pvx4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
            v164 = pvy4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
            v165 = v6 + 4 * j;
            v166 = *(_DWORD *)(v165 + 202) - v163;
            v167 = *(_DWORD *)(v165 + 226) - v164;
          }
          else
          {
            v168 = v6 + 4 * j;
            v166 = *(_DWORD *)(v168 + 202);
            LOBYTE(v166) = v166
                         - pvx4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
            LODWORD(v168) = *(_DWORD *)(v168 + 226);
            LOBYTE(v167) = v168
                         - pvy4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
          }
          v169 = v166 & 0x3F;
          v170 = v302[8];
          v171 = *(unsigned __int8 *)(v170 + v169 + 64);
          v172 = *(_DWORD *)(v18 + 4);
          v173 = v172 - v171;
          if (v172 >= v171)
          {
            *(_DWORD *)(v18 + 4) = v173;
            v179 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v169 + 64) + 32) & *(unsigned __int8 *)(v170 + v169)) << v173) | *(_DWORD *)v18;
          }
          else
          {
            v174 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v169 + 64) + 32) & *(unsigned __int8 *)(v170 + v169);
            v175 = v171 - v172;
            v176 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v174 >> (v171 - v172)) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
            v177 = *(_QWORD *)(v18 + 24);
            v178 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v178 + 1;
            *(_DWORD *)(v177 + 4 * v178) = v176;
            v173 = 32 - v175;
            *(_DWORD *)(v18 + 4) = 32 - v175;
            v179 = v174 << -(char)v175;
          }
          v180 = v167 & 0x3F;
          *(_DWORD *)v18 = v179;
          v181 = *(unsigned __int8 *)(v170 + v180 + 64);
          v182 = v173 - v181;
          if (v173 >= v181)
          {
            *(_DWORD *)(v18 + 4) = v182;
            v188 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v180 + 64) + 32) & *(unsigned __int8 *)(v170 + v180)) << v182) | v179;
          }
          else
          {
            v183 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v180 + 64) + 32) & *(unsigned __int8 *)(v170 + v180);
            v184 = v181 - v173;
            v185 = (v179 << 8) & 0xFF0000 | (((v183 >> (v181 - v173)) | v179) << 24) | (v179 >> 8) & 0xFF00 | HIBYTE(v179);
            v186 = *(_QWORD *)(v18 + 24);
            v187 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v187 + 1;
            *(_DWORD *)(v186 + 4 * v187) = v185;
            *(_DWORD *)(v18 + 4) = 32 - v184;
            v188 = v183 << -(char)v184;
          }
          *(_DWORD *)v18 = v188;
        }
        goto LABEL_159;
      }
      if (v153[18])
      {
        v158 = pvx4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
        v159 = pvy4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v44 + 40));
        v160 = *(_DWORD *)(v6 + 198) - v158;
        v161 = *(_DWORD *)(v6 + 222) - v159;
      }
      else
      {
        v160 = *(_DWORD *)(v6 + 198);
        LOBYTE(v160) = v160
                     - pvx4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
        v191 = *(_DWORD *)(v6 + 222);
        LOBYTE(v161) = v191
                     - pvy4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
      }
      v189 = v161 & 0x3F;
      v190 = v160 & 0x3F;
    }
    else
    {
      v154 = *(_DWORD *)(v6 + 198);
      if (v153[21])
      {
        v155 = pvx4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
        v156 = *(_DWORD *)(v6 + 222);
        v157 = pvy4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v44 + 40));
      }
      else
      {
        v155 = pvx(v85, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v3 + 40));
        v156 = *(_DWORD *)(v6 + 222);
        v157 = pvy(v85, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v298 + 4), *(_DWORD *)(*v44 + 40));
      }
      v189 = ((_BYTE)v156 - v157) & 0x3F;
      v190 = (v154 - v155) & 0x3FLL;
    }
    v192 = v302[8];
    v193 = *(unsigned __int8 *)(v192 + v190 + 64);
    v194 = *(_DWORD *)(v18 + 4);
    v195 = v194 - v193;
    if (v194 >= v193)
    {
      *(_DWORD *)(v18 + 4) = v195;
      v201 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v190 + 64) + 32) & *(unsigned __int8 *)(v192 + v190)) << v195) | *(_DWORD *)v18;
    }
    else
    {
      v196 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v190 + 64) + 32) & *(unsigned __int8 *)(v192 + v190);
      v197 = v193 - v194;
      v198 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v196 >> (v193 - v194)) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
      v199 = *(_QWORD *)(v18 + 24);
      v200 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v200 + 1;
      *(_DWORD *)(v199 + 4 * v200) = v198;
      v195 = 32 - v197;
      *(_DWORD *)(v18 + 4) = 32 - v197;
      v201 = v196 << -(char)v197;
    }
    *(_DWORD *)v18 = v201;
    v202 = *(unsigned __int8 *)(v192 + v189 + 64);
    v203 = v195 - v202;
    if (v195 >= v202)
    {
      *(_DWORD *)(v18 + 4) = v203;
      v209 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v189 + 64) + 32) & *(unsigned __int8 *)(v192 + v189)) << v203) | v201;
    }
    else
    {
      v204 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v189 + 64) + 32) & *(unsigned __int8 *)(v192 + v189);
      v205 = v202 - v195;
      v206 = (v201 << 8) & 0xFF0000 | (((v204 >> (v202 - v195)) | v201) << 24) | (v201 >> 8) & 0xFF00 | HIBYTE(v201);
      v207 = *(_QWORD *)(v18 + 24);
      v208 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v208 + 1;
      *(_DWORD *)(v207 + 4 * v208) = v206;
      *(_DWORD *)(v18 + 4) = 32 - v205;
      v209 = v204 << -(char)v205;
    }
    *(_DWORD *)v18 = v209;
LABEL_159:
    v210 = 0;
    v211 = v303 + ((uint64_t)*(char *)(v6 + 153) << 10);
    v304 = v211 + 69120;
    v212 = v211 + 35328;
    while (1)
    {
      v213 = *(int16x8_t **)(v6 + 8 * v210 + 8);
      v214 = (int *)(v6 + 4 * *(char *)(v6 + 154) + 330);
      if (*v214)
        break;
      v217 = 0;
      v218 = *(__int16 **)(v6 + 8 * v210 + 8);
LABEL_176:
      v231 = v6 + 4 * v210;
      v233 = *(_DWORD *)(v231 + 254);
      v232 = (_DWORD *)(v231 + 254);
      if (!v233)
      {
        v236 = 0;
        v237 = 0;
        goto LABEL_217;
      }
      v234 = v305[v210] - 1;
      if (v234 > 2)
        v235 = 63;
      else
        v235 = qword_228575CE0[(char)v234];
      v238 = (unint64_t)v213->u64 + 2 * v235 + 2;
      do
      {
        v239 = *(unsigned __int16 *)(v238 - 2);
        v238 -= 2;
      }
      while (!v239);
      if ((unint64_t)v218 > v238)
      {
        v236 = 0;
        v237 = 0;
LABEL_218:
        v277 = *(__int16 **)(v6 + 8 * v210 + 56);
        if (v217 == 1)
        {
          Mr_LaForgeS16(*v277, (uint64_t)v213, *v214, *(char *)(v6 + 153));
        }
        else if ((int)v237 > 0 || (int)v236 >= 3)
        {
          v278 = *(char *)(v6 + 153);
          v279 = *v214;
          if ((int)v237 > 3 || (int)v236 > 3)
          {
            if ((int)v237 > 3)
            {
              if ((int)v236 > 3)
                iDct8x8fS16((uint64_t)v277, v213, v278, v279, v237, v236, v304, v212);
              else
                iColRow8x4fS16((uint64_t)v277, v213, v278, v279, v237, v236, v304, v212);
            }
            else
            {
              iRowCol4x8f1S16(v277, v213, v278, v279, v237, v236, v304, v212);
            }
          }
          else
          {
            iRowCol4x4f1S16(v277, v213, v278, v279, v237, v236, v304, v212);
          }
        }
        else
        {
          iRowCol1x3fS16(v277, v213, *(char *)(v6 + 153), *v214, v304, v212);
        }
        goto LABEL_232;
      }
      LODWORD(v236) = 0;
      LODWORD(v237) = 0;
      v240 = v302[9];
      do
      {
        v241 = *v218;
        if (*v218)
        {
          v242 = 0;
        }
        else
        {
          v242 = 0;
          do
          {
            v243 = (unsigned __int16)v218[1];
            ++v218;
            v241 = v243;
            ++v242;
          }
          while (!v243);
        }
        v244 = v240 + ((unint64_t)((unint64_t)v218 >= v238) << 9) + 8 * v242;
        v245 = *(unsigned __int8 *)(*(_QWORD *)(v244 + 0x10000) + v241);
        v246 = *(unsigned __int8 *)(*(_QWORD *)(v244 + 66560) + v241);
        v247 = *(_DWORD *)v18;
        v248 = *(_DWORD *)(v18 + 4);
        v249 = v248 - v246;
        if (v248 >= v246)
        {
          v255 = ((*(_DWORD *)(v18 + 4 * v246 + 32) & v245) << v249) | v247;
        }
        else
        {
          v250 = *(_DWORD *)(v18 + 4 * v246 + 32) & v245;
          v251 = v246 - v248;
          v252 = (v247 << 8) & 0xFF0000 | (((v250 >> v251) | v247) << 24) | (v247 >> 8) & 0xFF00 | HIBYTE(v247);
          v253 = *(_QWORD *)(v18 + 24);
          v254 = *(unsigned int *)(v18 + 8);
          *(_DWORD *)(v18 + 8) = v254 + 1;
          *(_DWORD *)(v253 + 4 * v254) = v252;
          v249 = 32 - v251;
          v255 = v250 << -(char)v251;
        }
        *(_DWORD *)v18 = v255;
        *(_DWORD *)(v18 + 4) = v249;
        v256 = v242 + v217;
        v257 = (char *)v297 + 4 * (int)v256;
        v258 = *((_DWORD *)v257 + 383);
        if (v258 <= (int)v237)
          v237 = v237;
        else
          v237 = v258;
        v259 = *((_DWORD *)v257 + 447);
        if (v259 <= (int)v236)
          v236 = v236;
        else
          v236 = v259;
        if (v245 == 3 && (_DWORD)v246 == 7)
        {
          if (v249)
          {
            v261 = 1 << (v249 - 1);
            if ((unint64_t)v218 < v238)
              v261 = 0;
            v262 = v255 | v261;
            v263 = *(_DWORD *)(v18 + 56);
            if ((v249 - 1) > 5)
            {
              v264 = v249 - 7;
              v265 = ((v263 & v242) << (v249 - 7)) | v262;
              v266 = *(_DWORD *)(v18 + 64);
              if ((v249 - 7) <= 7)
              {
                v267 = v266 & v241;
                v268 = (((v267 >> (15 - v249)) | v265) << 8) & 0xFF0000 | (((v267 >> (15 - v249)) | v265) << 24) | (((v267 >> (15 - v249)) | v265) >> 8) & 0xFF00 | (((v267 >> (15 - v249)) | v265) >> 24);
                v269 = *(_QWORD *)(v18 + 24);
                v270 = *(unsigned int *)(v18 + 8);
                *(_DWORD *)(v18 + 8) = v270 + 1;
                *(_DWORD *)(v269 + 4 * v270) = v268;
                *(_DWORD *)(v18 + 4) = v249 + 17;
                v271 = v267 << (v249 + 17);
LABEL_214:
                *(_DWORD *)v18 = v271;
                goto LABEL_215;
              }
LABEL_213:
              *(_DWORD *)(v18 + 4) = v264 - 8;
              v271 = ((v266 & v241) << (v264 - 8)) | v265;
              goto LABEL_214;
            }
            v274 = v263 & v242;
            v275 = *(_QWORD *)(v18 + 24);
            v276 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v276 + 1;
            *(_DWORD *)(v275 + 4 * v276) = (((v274 >> (7 - v249)) | v262) << 8) & 0xFF0000 | (((v274 >> (7 - v249)) | v262) << 24) | (((v274 >> (7 - v249)) | v262) >> 8) & 0xFF00 | (((v274 >> (7 - v249)) | v262) >> 24);
            v264 = v249 + 25;
            v265 = v274 << (v249 + 25);
          }
          else
          {
            v272 = *(_QWORD *)(v18 + 24);
            v273 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v273 + 1;
            *(_DWORD *)(v272 + 4 * v273) = bswap32(v255);
            v265 = ((*(_DWORD *)(v18 + 56) & v242) << 25) | (((unint64_t)v218 >= v238) << 31);
            v264 = 25;
          }
          v266 = *(_DWORD *)(v18 + 64);
          goto LABEL_213;
        }
LABEL_215:
        v217 = v256 + 1;
        ++v218;
      }
      while ((unint64_t)v218 <= v238);
      if (*v232)
        goto LABEL_218;
LABEL_217:
      if (*v214)
        goto LABEL_218;
LABEL_232:
      if (++v210 == 6)
      {
        DumpDecoded263MB3S16(a2, *(_QWORD **)(a2 + 32), *(_QWORD **)(a2 + 24), (_DWORD *)(v6 + 254));
        return 0;
      }
    }
    v215 = v213->i16[0];
    if (v215 < 255)
    {
      v216 = *(_DWORD *)(v18 + 4);
      if (v215 > 0)
      {
        if (v215 == 128)
        {
          v219 = v216 - 8;
          if (v216 >= 8)
          {
            *(_DWORD *)(v18 + 4) = v219;
            v220 = *(unsigned __int8 *)(v18 + 64) << v219;
LABEL_172:
            v222 = v220 | *(_DWORD *)v18;
LABEL_175:
            *(_DWORD *)v18 = v222;
            v218 = &v213->i16[1];
            v217 = 1;
            goto LABEL_176;
          }
          v223 = *(unsigned __int8 *)(v18 + 64);
          v224 = *(_DWORD *)v18;
          v225 = (v223 >> (8 - v216)) | *(_DWORD *)v18;
          v226 = *(_DWORD *)v18 << 8;
LABEL_174:
          v227 = v226 & 0xFF0000 | (v225 << 24) | (v224 >> 8) & 0xFF00 | HIBYTE(v224);
          v228 = *(_QWORD *)(v18 + 24);
          v229 = *(unsigned int *)(v18 + 8);
          *(_DWORD *)(v18 + 8) = v229 + 1;
          *(_DWORD *)(v228 + 4 * v229) = v227;
          v230 = v216 + 24;
          *(_DWORD *)(v18 + 4) = v230;
          v222 = v223 << v230;
          goto LABEL_175;
        }
LABEL_170:
        v221 = v216 - 8;
        if (v216 >= 8)
        {
          *(_DWORD *)(v18 + 4) = v221;
          v220 = (*(_DWORD *)(v18 + 64) & (unsigned __int16)v215) << v221;
          goto LABEL_172;
        }
        v223 = *(_DWORD *)(v18 + 64) & (unsigned __int16)v215;
        v224 = *(_DWORD *)v18;
        v225 = (v223 >> (8 - v216)) | *(_DWORD *)v18;
        v226 = v225 << 8;
        goto LABEL_174;
      }
      LOWORD(v215) = 1;
    }
    else
    {
      v216 = *(_DWORD *)(v18 + 4);
      LOWORD(v215) = 254;
    }
    v213->i16[0] = v215;
    goto LABEL_170;
  }
  v103 = *(unsigned __int8 *)(v6 + 154);
  if (v103 == 2)
  {
    v104 = 0;
    while (1)
    {
      v105 = v6 + 4 * v104;
      if (*(_DWORD *)(v105 + 202))
        break;
      ++v104;
      v106 = *(_DWORD *)(v105 + 226);
      v107 = v106 == 0;
      if (v104 > 3 || v106)
        goto LABEL_101;
    }
LABEL_106:
    *(_BYTE *)(v6 + 156) = 1;
    v114 = *(_DWORD *)(v18 + 4);
    if (v114)
    {
      v87 = v114 - 1;
    }
    else
    {
      v115 = bswap32(*(_DWORD *)v18);
      v116 = *(_QWORD *)(v18 + 24);
      v117 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v117 + 1;
      *(_DWORD *)(v116 + 4 * v117) = v115;
      *(_DWORD *)v18 = 0;
      v87 = 31;
    }
    *(_DWORD *)(v18 + 4) = v87;
    goto LABEL_110;
  }
  if (*(_DWORD *)(v6 + 198))
    goto LABEL_106;
  v107 = *(_DWORD *)(v6 + 222) == 0;
LABEL_101:
  if (v83 || v84 || !v107)
    goto LABEL_106;
  v111 = *(_DWORD *)(v18 + 4);
  if (v111)
  {
    v112 = v111 - 1;
    v113 = *(_DWORD *)v18 | (1 << v112);
  }
  else
  {
    v280 = bswap32(*(_DWORD *)v18);
    v281 = *(_QWORD *)(v18 + 24);
    v282 = *(unsigned int *)(v18 + 8);
    *(_DWORD *)(v18 + 8) = v282 + 1;
    *(_DWORD *)(v281 + 4 * v282) = v280;
    v112 = 31;
    v113 = 0x80000000;
  }
  *(_DWORD *)v18 = v113;
  *(_DWORD *)(v18 + 4) = v112;
  v283 = *(_BYTE *)(v6 + 155);
  if (v283)
  {
    *(_BYTE *)(v6 + 154) = v103 - 1;
    *(_BYTE *)(v6 + 153) -= v283;
    *(_BYTE *)(v6 + 155) = 0;
  }
  v284 = a2;
  v285 = v8[42] + (uint64_t)(int)v294;
  Copy8x8(**(_QWORD **)(a2 + 32) + v285, **(_QWORD **)(a2 + 24) + v285, v289);
  v286 = v8[43] + (uint64_t)(int)v294;
  Copy8x8(**(_QWORD **)(v284 + 32) + v286, **(_QWORD **)(v284 + 24) + v286, v289);
  v287 = v8[44] + (uint64_t)(int)v294;
  Copy8x8(**(_QWORD **)(v284 + 32) + v287, **(_QWORD **)(v284 + 24) + v287, v289);
  v288 = v8[45] + (uint64_t)(int)v294;
  Copy8x8(**(_QWORD **)(v284 + 32) + v288, **(_QWORD **)(v284 + 24) + v288, v289);
  Copy8x8(*(_QWORD *)(*(_QWORD *)(v284 + 32) + 8) + v296, *(_QWORD *)(*(_QWORD *)(v284 + 24) + 8) + v296, v290);
  Copy8x8(*(_QWORD *)(*(_QWORD *)(v284 + 32) + 16) + v296, *(_QWORD *)(*(_QWORD *)(v284 + 24) + 16) + v296, v290);
  return 2;
}

uint64_t H263CMPR_MB_OBMCS16(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int *v7;
  int v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  _WORD *v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v44;
  uint64_t i;
  __int16 *v47;
  uint64_t v48;
  _WORD *v49;
  uint64_t v50;
  __int16 v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  _WORD *v57;
  _DWORD *v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned __int8 *v67;
  unsigned int v68;
  int v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  _BOOL4 v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  unsigned int v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unsigned __int8 *v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  uint64_t v112;
  int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  unsigned int v120;
  _BYTE *v121;
  int v122;
  int v123;
  int v124;
  char v125;
  int v126;
  int v127;
  int v128;
  int v129;
  uint64_t v130;
  int v131;
  int v132;
  uint64_t v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  unsigned int v147;
  uint64_t v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  unsigned int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  unsigned int v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  int16x8_t *v180;
  int *v181;
  int v182;
  unsigned int v183;
  int v184;
  __int16 *v185;
  unsigned int v186;
  int v187;
  unsigned int v188;
  int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  int v193;
  int v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int v197;
  uint64_t v198;
  _DWORD *v199;
  int v200;
  unsigned int v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205;
  int v206;
  uint64_t v207;
  __int16 v208;
  unsigned int v209;
  int v210;
  unint64_t v211;
  int v212;
  uint64_t v213;
  unsigned int v214;
  unsigned int v215;
  int v216;
  unsigned int v217;
  int v218;
  int v219;
  uint64_t v220;
  uint64_t v221;
  unsigned int v222;
  unsigned int v223;
  char *v224;
  int v225;
  int v226;
  unsigned int v228;
  int v229;
  unsigned int v230;
  unsigned int v231;
  uint64_t v232;
  uint64_t v233;
  unsigned int v234;
  int v235;
  int v236;
  uint64_t v237;
  uint64_t v238;
  unsigned int v239;
  int v240;
  int v241;
  unsigned int v242;
  uint64_t v243;
  uint64_t v244;
  __int16 *v245;
  uint64_t v246;
  int v247;
  int v248;
  int v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  int v254;
  int v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v259;
  _QWORD *v260;
  uint64_t v261;
  uint64_t v262;
  _QWORD *v263;
  uint64_t v264;
  _BYTE v265[6];

  v4 = *(_QWORD *)(a1 + 296230);
  v3 = *(_QWORD **)(a1 + 296238);
  v5 = (uint64_t *)v3[6];
  v260 = (_QWORD *)v3[5];
  v261 = v3[4];
  v259 = *(_QWORD *)(a1 + 296222);
  v6 = *(_QWORD *)(a1 + 296182);
  v7 = *(int **)v6;
  v250 = *(_QWORD *)(a1 + 296198);
  v251 = *(_QWORD *)(a1 + 24);
  v253 = *(_QWORD *)(a1 + 296190);
  v8 = *(_DWORD *)a1 + 32;
  v255 = *(_DWORD *)(a1 + 4) + 16;
  v9 = (int *)(*(_QWORD *)v6 + 4 * *(int *)(v253 + 20));
  v10 = *(_QWORD *)v6 + 4 * *(int *)(v253 + 24);
  v11 = *(int *)(v10 + 76) + (uint64_t)*v9;
  v12 = *(int *)(v10 + 340) + (uint64_t)v9[47];
  v13 = *(char *)(v6 + 154);
  v254 = *(_DWORD *)(v6 + 4 * v13 + 330);
  v14 = *(_QWORD *)(a1 + 66);
  v263 = (_QWORD *)(a1 + 296174);
  v15 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 296206)
                           + (*(_DWORD *)(v6 + 166)
                                          + *(_DWORD *)(*(_QWORD *)(a1 + 296174) + 20) * *(_DWORD *)(v6 + 162))
                           + 136);
  *(_BYTE *)(v6 + 155) = 0;
  if (v15 <= 0x30 && (v13 == 3 || !(_BYTE)v13))
  {
    v16 = *(unsigned __int8 *)(v6 + 153);
    v17 = v15 - v16;
    *(_BYTE *)(v6 + 155) = v17;
    if (v17)
    {
      v17 = (char)v17;
      if ((char)v17 <= 2)
      {
        if (v17 > -3)
        {
LABEL_10:
          *(_BYTE *)(v6 + 153) = v17 + v16;
          *(_BYTE *)(v6 + 154) = v13 + 1;
          goto LABEL_11;
        }
        LOBYTE(v17) = -2;
      }
      else
      {
        LOBYTE(v17) = 2;
      }
      *(_BYTE *)(v6 + 155) = v17;
      goto LABEL_10;
    }
  }
LABEL_11:
  *(_BYTE *)(v6 + 152) = *(_BYTE *)(v6 + 153);
  Grab8x8CharS16(*(_QWORD *)(v6 + 8), **(_QWORD **)(a1 + 40) + v7[42] + v11, v8);
  Grab8x8CharS16(*(_QWORD *)(v6 + 16), **(_QWORD **)(a1 + 40) + v7[43] + (uint64_t)(int)v11, v8);
  Grab8x8CharS16(*(_QWORD *)(v6 + 24), **(_QWORD **)(a1 + 40) + v7[44] + (uint64_t)(int)v11, v8);
  Grab8x8CharS16(*(_QWORD *)(v6 + 32), **(_QWORD **)(a1 + 40) + v7[45] + (uint64_t)(int)v11, v8);
  Grab8x8CharS16(*(_QWORD *)(v6 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v12, v255);
  Grab8x8CharS16(*(_QWORD *)(v6 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + v12, v255);
  v18 = *(char *)(v6 + 154);
  v257 = a1;
  if (v18 >= 2)
  {
    if (v18 != 2)
      goto LABEL_22;
    v24 = vaddvq_s32(*(int32x4_t *)(v6 + 226));
    v25 = vaddvq_s32(*(int32x4_t *)(v6 + 202));
    v26 = (v25 >> 31) | 1;
    if (v26 * v25 <= 0)
      v27 = -(-(v26 * v25) & 0xF);
    else
      v27 = (v26 * v25) & 0xF;
    v249 = roundtab16[v27] * v26 + 2 * (v25 / 16);
    v28 = (v24 >> 31) | 1;
    if (v28 * v24 <= 0)
      v29 = -(-(v28 * v24) & 0xF);
    else
      v29 = (v28 * v24) & 0xF;
    v248 = roundtab16[v29] * v28 + 2 * (v24 / 16);
    SubtractPredS16(*(_QWORD *)(v6 + 8), (int16x8_t *)(v14 + 4 * (v7[42] + (int)v11)), v8);
    SubtractPredS16(*(_QWORD *)(v6 + 16), (int16x8_t *)(v14 + 4 * (v7[43] + (int)v11)), v8);
    SubtractPredS16(*(_QWORD *)(v6 + 24), (int16x8_t *)(v14 + 4 * (v7[44] + (int)v11)), v8);
    SubtractPredS16(*(_QWORD *)(v6 + 32), (int16x8_t *)(v14 + 4 * (v7[45] + (int)v11)), v8);
    MC_ForUVS16(*(_QWORD *)(v6 + 40), *(_QWORD *)(v251 + 8) + v12, v255, v249, v248);
    v19 = *(_QWORD *)(v6 + 48);
    v20 = *(_QWORD *)(v251 + 16) + v12;
    v23 = v255;
    v21 = v249;
    v22 = v248;
  }
  else
  {
    SubtractPredS16(*(_QWORD *)(v6 + 8), (int16x8_t *)(v14 + 4 * (v7[42] + (int)v11)), v8);
    SubtractPredS16(*(_QWORD *)(v6 + 16), (int16x8_t *)(v14 + 4 * (v7[43] + (int)v11)), v8);
    SubtractPredS16(*(_QWORD *)(v6 + 24), (int16x8_t *)(v14 + 4 * (v7[44] + (int)v11)), v8);
    SubtractPredS16(*(_QWORD *)(v6 + 32), (int16x8_t *)(v14 + 4 * (v7[45] + (int)v11)), v8);
    MC_ForUVS16(*(_QWORD *)(v6 + 40), *(_QWORD *)(v251 + 8) + v12, v255, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    v19 = *(_QWORD *)(v6 + 48);
    v20 = *(_QWORD *)(v251 + 16) + v12;
    v21 = *(_DWORD *)(v6 + 198);
    v22 = *(_DWORD *)(v6 + 222);
    v23 = v255;
  }
  MC_ForUVS16(v19, v20, v23, v21, v22);
LABEL_22:
  v252 = v14;
  v30 = (uint64_t *)(v6 + 56);
  v31 = -6;
  do
  {
    if ((unint64_t)(v31 + 6) >= 4)
      v32 = 152;
    else
      v32 = 153;
    v33 = *(char *)(v6 + v32);
    v34 = *(char *)(v6 + 153);
    v36 = v30 - 6;
    v35 = (_WORD *)*(v30 - 6);
    if (v34 >= 8)
      v36 = v30;
    v37 = *v36;
    v38 = *(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 330);
    v39 = *(uint64_t *)((char *)v5 + 1516);
    v40 = *(uint64_t *)((char *)v5 + 1524);
    v41 = *(uint64_t *)((char *)v5 + 1508);
    v42 = *(_QWORD *)(v261 + 8 * v34 + 102656);
    if (*(char *)(v263[4] + 94) >= 50 && v38 == 0)
    {
      RowCol4x4S16(v35, (_WORD *)v37, v33, 0, v39, v40, v41, v42);
      *(_WORD *)(v37 + 54) = 0;
      *(_DWORD *)(v37 + 50) = 0;
      *(_DWORD *)(v37 + 36) = 0;
      v44 = 3;
      *(_WORD *)(v37 + 22) = 0;
    }
    else
    {
      RowCol8x8S16(v35, v37, v33, v38, v39, v40, v41, v42);
      v44 = 5;
    }
    v265[v31 + 6] = v44;
    ++v30;
  }
  while (!__CFADD__(v31++, 1));
  if (*(char *)(v6 + 153) <= 7)
    Q_QuantizeS16((char *)v6, v253, v250, v261, v5[1]);
  for (i = 0; i != 6; ++i)
  {
    switch(v265[i])
    {
      case 0:
        *(_DWORD *)(v6 + 4 * i + 254) = 0;
        continue;
      case 1:
        if (v254)
        {
          *(_DWORD *)(v6 + 4 * i + 254) = 0;
          **(_WORD **)(v6 + 8 * i + 8) = **(_WORD **)(v6 + 8 * i + 56);
        }
        else
        {
          v55 = v6 + 8 * i;
          v56 = **(unsigned __int16 **)(v55 + 56);
          v57 = *(_WORD **)(v55 + 8);
          v58 = (_DWORD *)(v6 + 4 * i + 254);
          if (v56)
          {
            *v57 = v56;
            *v58 = 1;
          }
          else
          {
            *v57 = 0;
            *v58 = 0;
            v265[i] = 0;
          }
        }
        continue;
      case 2:
        v49 = *(_WORD **)(v6 + 8 * i + 56);
        v50 = v254 != 0;
        do
        {
          if (v49[v50])
          {
            v54 = *(_QWORD *)(v6 + 8 * i + 8);
            *(_WORD *)v54 = *v49;
            *(_WORD *)(v54 + 2) = v49[1];
            *(_DWORD *)(v54 + 4) = 0;
            *(_WORD *)(v54 + 8) = 0;
            *(_WORD *)(v54 + 10) = v49[2];
            goto LABEL_64;
          }
          ++v50;
        }
        while (v50 != 3);
        *(_DWORD *)(v6 + 4 * i + 254) = 0;
        if (v254)
        {
          v51 = *v49;
          goto LABEL_60;
        }
        continue;
      case 3:
        v47 = *(__int16 **)(v6 + 8 * i + 56);
        v52 = v254 != 0;
        do
        {
          if (v47[v52])
          {
            ZigZag4x4BlockS16(v47, *(_QWORD *)(v6 + 8 * i + 8));
            goto LABEL_64;
          }
          if ((((_BYTE)v52 + 1) & 3) != 0)
            v53 = v52;
          else
            v53 = v52 + 4;
          v52 = v53 + 1;
        }
        while (v53 < 27);
        goto LABEL_58;
      default:
        v47 = *(__int16 **)(v6 + 8 * i + 56);
        v48 = v254 != 0;
        break;
    }
    while (!v47[v48])
    {
      if (++v48 == 64)
      {
LABEL_58:
        *(_DWORD *)(v6 + 4 * i + 254) = 0;
        if (v254)
        {
          v51 = *v47;
LABEL_60:
          **(_WORD **)(v6 + 8 * i + 8) = v51;
          v265[i] = 1;
        }
        goto LABEL_65;
      }
    }
    ZigZagBlockS16(v47, *(_WORD **)(v6 + 8 * i + 8));
LABEL_64:
    *(_DWORD *)(v6 + 4 * i + 254) = 1;
LABEL_65:
    ;
  }
  v59 = *(_DWORD *)(v6 + 274) | (2 * *(_DWORD *)(v6 + 270));
  v60 = (4 * *(_DWORD *)(v6 + 258)) | (8 * *(_DWORD *)(v6 + 254)) | (2 * *(_DWORD *)(v6 + 262)) | *(_DWORD *)(v6 + 266);
  *(_DWORD *)(v6 + 246) = v59;
  *(_DWORD *)(v6 + 250) = v60;
  v61 = a1 + 296214;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 296214) + 17) != 1)
  {
    v64 = *(_BYTE *)(v6 + 154) & 7;
    *(_BYTE *)(v6 + 154) = v64;
    v63 = *(_DWORD *)(v4 + 4);
    v65 = (4 * v64 - 12) | v59 & 0xF;
    *(_DWORD *)(v6 + 246) = v65;
    v66 = v260[5];
    v67 = (unsigned __int8 *)(v66 + v65 + 8);
    v68 = *v67;
    goto LABEL_100;
  }
  if (v254)
  {
    *(_BYTE *)(v6 + 156) = 1;
    v62 = *(_DWORD *)(v4 + 4);
    if (v62)
    {
      v63 = v62 - 1;
    }
    else
    {
      v74 = bswap32(*(_DWORD *)v4);
      v75 = *(_QWORD *)(v4 + 24);
      v76 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v76 + 1;
      *(_DWORD *)(v75 + 4 * v76) = v74;
      *(_DWORD *)v4 = 0;
      v59 = *(_DWORD *)(v6 + 246);
      v63 = 31;
    }
    *(_DWORD *)(v4 + 4) = v63;
    LOBYTE(v69) = *(_BYTE *)(v6 + 154);
LABEL_99:
    LODWORD(v64) = v69 & 7;
    *(_BYTE *)(v6 + 154) = v64;
    v65 = v59 & 0xF | (4 * v64);
    *(_DWORD *)(v6 + 246) = v65;
    v66 = v260[6];
    v67 = (unsigned __int8 *)(v66 + v65 + 24);
    v68 = *v67;
LABEL_100:
    v89 = v63 - v68;
    if (v63 >= v68)
    {
      *(_DWORD *)(v4 + 4) = v89;
      v95 = ((*(_DWORD *)(v4 + 4 * *v67 + 32) & *(unsigned __int8 *)(v66 + v65)) << v89) | *(_DWORD *)v4;
    }
    else
    {
      v90 = *(_DWORD *)(v4 + 4 * v68 + 32) & *(unsigned __int8 *)(v66 + v65);
      v91 = v68 - v63;
      v92 = (*(_DWORD *)v4 << 8) & 0xFF0000 | (((v90 >> v91) | *(_DWORD *)v4) << 24) | (*(_DWORD *)v4 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v4);
      v93 = *(_QWORD *)(v4 + 24);
      v94 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v94 + 1;
      *(_DWORD *)(v93 + 4 * v94) = v92;
      v89 = 32 - v91;
      *(_DWORD *)(v4 + 4) = 32 - v91;
      v95 = v90 << -(char)v91;
    }
    *(_DWORD *)v4 = v95;
    v96 = v64;
    v97 = *(_DWORD *)(v6 + 4 * v64 + 330);
    v98 = *(_DWORD *)(v6 + 250);
    if (!v97)
    {
      v98 = ~v98 & 0xF;
      *(_DWORD *)(v6 + 250) = v98;
    }
    v99 = v260[7];
    v100 = v98;
    v101 = v99 + v98;
    v104 = *(unsigned __int8 *)(v101 + 16);
    v102 = (unsigned __int8 *)(v101 + 16);
    v103 = v104;
    v105 = v89 - v104;
    if (v89 >= v104)
    {
      *(_DWORD *)(v4 + 4) = v105;
      v111 = ((*(_DWORD *)(v4 + 4 * *v102 + 32) & *(unsigned __int8 *)(v99 + v100)) << v105) | v95;
    }
    else
    {
      v106 = *(_DWORD *)(v4 + 4 * v103 + 32) & *(unsigned __int8 *)(v99 + v100);
      v107 = v103 - v89;
      v108 = (v95 << 8) & 0xFF0000 | (((v106 >> v107) | v95) << 24) | (v95 >> 8) & 0xFF00 | HIBYTE(v95);
      v109 = *(_QWORD *)(v4 + 24);
      v110 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v110 + 1;
      *(_DWORD *)(v109 + 4 * v110) = v108;
      v105 = 32 - v107;
      *(_DWORD *)(v4 + 4) = 32 - v107;
      v111 = v106 << -(char)v107;
    }
    *(_DWORD *)v4 = v111;
    if (*(_DWORD *)(v6 + 4 * v96 + 310))
    {
      v112 = *(char *)(v6 + 155) + 2;
      if (v112 > 4 || ((0x1Bu >> v112) & 1) == 0)
        return 0xFFFFFFFFLL;
      v113 = dword_228575CCC[v112];
      v114 = v105 - 2;
      if (v105 < 2)
      {
        v116 = *(_DWORD *)(v4 + 40) & v113;
        v117 = (v111 << 8) & 0xFF0000 | (((v116 >> (2 - v105)) | v111) << 24) | (v111 >> 8) & 0xFF00 | HIBYTE(v111);
        v118 = *(_QWORD *)(v4 + 24);
        v119 = *(unsigned int *)(v4 + 8);
        *(_DWORD *)(v4 + 8) = v119 + 1;
        *(_DWORD *)(v118 + 4 * v119) = v117;
        v114 = v105 + 30;
        v115 = v116 << (v105 + 30);
      }
      else
      {
        v115 = ((*(_DWORD *)(v4 + 40) & v113) << v114) | v111;
      }
      *(_DWORD *)v4 = v115;
      *(_DWORD *)(v4 + 4) = v114;
    }
    *(_BYTE *)(v253 + 22 * *(unsigned int *)(v253 + 20) + *(unsigned int *)(v253 + 24) + 1656) = *(_BYTE *)(v6 + 153);
    if (!*(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 350))
      goto LABEL_147;
    v120 = *(unsigned __int8 *)(v6 + 154);
    v121 = *(_BYTE **)v61;
    if (v120 > 1 || v121[20])
    {
      if (v120 >= 2)
      {
        v130 = 0;
        v256 = a1 + 296214;
        do
        {
          if (*(_BYTE *)(*(_QWORD *)v61 + 18))
          {
            v131 = pvx4(a2, (int)v130 + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
            v132 = pvy4(a2, (int)v130 + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
            v133 = v6 + 4 * v130;
            v134 = *(_DWORD *)(v133 + 202) - v131;
            v135 = *(_DWORD *)(v133 + 226) - v132;
          }
          else
          {
            v136 = v6 + 4 * v130;
            v134 = *(_DWORD *)(v136 + 202);
            LOBYTE(v134) = v134
                         - pvx4(a2, (int)v130 + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
            LODWORD(v136) = *(_DWORD *)(v136 + 226);
            v61 = v256;
            LOBYTE(v135) = v136
                         - pvy4(a2, (int)v130 + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
          }
          v137 = v134 & 0x3F;
          v138 = v260[8];
          v139 = *(unsigned __int8 *)(v138 + v137 + 64);
          v140 = *(_DWORD *)(v4 + 4);
          v141 = v140 - v139;
          if (v140 >= v139)
          {
            *(_DWORD *)(v4 + 4) = v141;
            v147 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v137 + 64) + 32) & *(unsigned __int8 *)(v138 + v137)) << v141) | *(_DWORD *)v4;
          }
          else
          {
            v142 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v137 + 64) + 32) & *(unsigned __int8 *)(v138 + v137);
            v143 = v139 - v140;
            v144 = (*(_DWORD *)v4 << 8) & 0xFF0000 | (((v142 >> (v139 - v140)) | *(_DWORD *)v4) << 24) | (*(_DWORD *)v4 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v4);
            v145 = *(_QWORD *)(v4 + 24);
            v146 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v146 + 1;
            *(_DWORD *)(v145 + 4 * v146) = v144;
            v141 = 32 - v143;
            *(_DWORD *)(v4 + 4) = 32 - v143;
            v147 = v142 << -(char)v143;
          }
          v148 = v135 & 0x3F;
          *(_DWORD *)v4 = v147;
          v149 = *(unsigned __int8 *)(v138 + v148 + 64);
          v150 = v141 - v149;
          if (v141 >= v149)
          {
            *(_DWORD *)(v4 + 4) = v150;
            v156 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v148 + 64) + 32) & *(unsigned __int8 *)(v138 + v148)) << v150) | v147;
          }
          else
          {
            v151 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v148 + 64) + 32) & *(unsigned __int8 *)(v138 + v148);
            v152 = v149 - v141;
            v153 = (v147 << 8) & 0xFF0000 | (((v151 >> (v149 - v141)) | v147) << 24) | (v147 >> 8) & 0xFF00 | HIBYTE(v147);
            v154 = *(_QWORD *)(v4 + 24);
            v155 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v155 + 1;
            *(_DWORD *)(v154 + 4 * v155) = v153;
            *(_DWORD *)(v4 + 4) = 32 - v152;
            v156 = v151 << -(char)v152;
          }
          *(_DWORD *)v4 = v156;
          ++v130;
        }
        while (v130 != 4);
        goto LABEL_147;
      }
      if (v121[18])
      {
        v126 = pvx4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
        v127 = pvy4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
        v128 = *(_DWORD *)(v6 + 198) - v126;
        v129 = *(_DWORD *)(v6 + 222) - v127;
      }
      else
      {
        v128 = *(_DWORD *)(v6 + 198);
        LOBYTE(v128) = v128
                     - pvx4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
        v159 = *(_DWORD *)(v6 + 222);
        LOBYTE(v129) = v159
                     - pvy4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
      }
      v157 = v129 & 0x3F;
      v158 = v128 & 0x3F;
    }
    else
    {
      v122 = *(_DWORD *)(v6 + 198);
      if (v121[21])
      {
        v123 = pvx4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
        v124 = *(_DWORD *)(v6 + 222);
        v125 = pvy4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
      }
      else
      {
        v123 = pvx(a2, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
        v124 = *(_DWORD *)(v6 + 222);
        v125 = pvy(a2, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v259 + 4), *(_DWORD *)(*v263 + 40));
      }
      v157 = ((_BYTE)v124 - v125) & 0x3F;
      v158 = (v122 - v123) & 0x3FLL;
    }
    v160 = v260[8];
    v161 = *(unsigned __int8 *)(v160 + v158 + 64);
    v162 = *(_DWORD *)(v4 + 4);
    v163 = v162 - v161;
    if (v162 >= v161)
    {
      *(_DWORD *)(v4 + 4) = v163;
      v169 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v158 + 64) + 32) & *(unsigned __int8 *)(v160 + v158)) << v163) | *(_DWORD *)v4;
    }
    else
    {
      v164 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v158 + 64) + 32) & *(unsigned __int8 *)(v160 + v158);
      v165 = v161 - v162;
      v166 = (*(_DWORD *)v4 << 8) & 0xFF0000 | (((v164 >> (v161 - v162)) | *(_DWORD *)v4) << 24) | (*(_DWORD *)v4 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v4);
      v167 = *(_QWORD *)(v4 + 24);
      v168 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v168 + 1;
      *(_DWORD *)(v167 + 4 * v168) = v166;
      v163 = 32 - v165;
      *(_DWORD *)(v4 + 4) = 32 - v165;
      v169 = v164 << -(char)v165;
    }
    *(_DWORD *)v4 = v169;
    v170 = *(unsigned __int8 *)(v160 + v157 + 64);
    v171 = v163 - v170;
    if (v163 >= v170)
    {
      *(_DWORD *)(v4 + 4) = v171;
      v177 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v157 + 64) + 32) & *(unsigned __int8 *)(v160 + v157)) << v171) | v169;
    }
    else
    {
      v172 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v157 + 64) + 32) & *(unsigned __int8 *)(v160 + v157);
      v173 = v170 - v163;
      v174 = (v169 << 8) & 0xFF0000 | (((v172 >> (v170 - v163)) | v169) << 24) | (v169 >> 8) & 0xFF00 | HIBYTE(v169);
      v175 = *(_QWORD *)(v4 + 24);
      v176 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v176 + 1;
      *(_DWORD *)(v175 + 4 * v176) = v174;
      *(_DWORD *)(v4 + 4) = 32 - v173;
      v177 = v172 << -(char)v173;
    }
    *(_DWORD *)v4 = v177;
LABEL_147:
    v178 = 0;
    v179 = v261 + ((uint64_t)*(char *)(v6 + 153) << 10);
    v262 = v179 + 35328;
    v264 = v179 + 69120;
    while (1)
    {
      v180 = *(int16x8_t **)(v6 + 8 * v178 + 8);
      v181 = (int *)(v6 + 4 * *(char *)(v6 + 154) + 330);
      if (*v181)
        break;
      v184 = 0;
      v185 = *(__int16 **)(v6 + 8 * v178 + 8);
LABEL_164:
      v198 = v6 + 4 * v178;
      v200 = *(_DWORD *)(v198 + 254);
      v199 = (_DWORD *)(v198 + 254);
      if (!v200)
      {
        v203 = 0;
        v204 = 0;
        goto LABEL_204;
      }
      v201 = v265[v178] - 1;
      if (v201 > 2)
        v202 = 63;
      else
        v202 = qword_228575CE0[(char)v201];
      v205 = (unint64_t)v180->u64 + 2 * v202 + 2;
      do
      {
        v206 = *(unsigned __int16 *)(v205 - 2);
        v205 -= 2;
      }
      while (!v206);
      if ((unint64_t)v185 > v205)
      {
        v203 = 0;
        v204 = 0;
LABEL_205:
        v245 = *(__int16 **)(v6 + 8 * v178 + 56);
        if (v184 == 1)
        {
          Mr_LaForgeS16(*v245, (uint64_t)v180, *v181, *(char *)(v6 + 153));
        }
        else if ((int)v204 > 0 || (int)v203 >= 3)
        {
          v246 = *(char *)(v6 + 153);
          v247 = *v181;
          if ((int)v204 > 3 || (int)v203 > 3)
          {
            if ((int)v204 > 3)
            {
              if ((int)v203 > 3)
                iDct8x8fS16((uint64_t)v245, v180, v246, v247, v204, v203, v264, v262);
              else
                iColRow8x4fS16((uint64_t)v245, v180, v246, v247, v204, v203, v264, v262);
            }
            else
            {
              iRowCol4x8f1S16(v245, v180, v246, v247, v204, v203, v264, v262);
            }
          }
          else
          {
            iRowCol4x4f1S16(v245, v180, v246, v247, v204, v203, v264, v262);
          }
        }
        else
        {
          iRowCol1x3fS16(v245, v180, *(char *)(v6 + 153), *v181, v264, v262);
        }
        goto LABEL_219;
      }
      LODWORD(v203) = 0;
      LODWORD(v204) = 0;
      v207 = v260[9];
      do
      {
        v208 = *v185;
        if (*v185)
        {
          v209 = 0;
        }
        else
        {
          v209 = 0;
          do
          {
            v210 = (unsigned __int16)v185[1];
            ++v185;
            v208 = v210;
            ++v209;
          }
          while (!v210);
        }
        v211 = v207 + ((unint64_t)((unint64_t)v185 >= v205) << 9) + 8 * v209;
        v212 = *(unsigned __int8 *)(*(_QWORD *)(v211 + 0x10000) + v208);
        v213 = *(unsigned __int8 *)(*(_QWORD *)(v211 + 66560) + v208);
        v215 = *(_DWORD *)v4;
        v214 = *(_DWORD *)(v4 + 4);
        v216 = v214 - v213;
        if (v214 >= v213)
        {
          v222 = ((*(_DWORD *)(v4 + 4 * v213 + 32) & v212) << v216) | v215;
        }
        else
        {
          v217 = *(_DWORD *)(v4 + 4 * v213 + 32) & v212;
          v218 = v213 - v214;
          v219 = (v215 << 8) & 0xFF0000 | (((v217 >> v218) | v215) << 24) | (v215 >> 8) & 0xFF00 | HIBYTE(v215);
          v220 = *(_QWORD *)(v4 + 24);
          v221 = *(unsigned int *)(v4 + 8);
          *(_DWORD *)(v4 + 8) = v221 + 1;
          *(_DWORD *)(v220 + 4 * v221) = v219;
          v216 = 32 - v218;
          v222 = v217 << -(char)v218;
        }
        *(_DWORD *)v4 = v222;
        *(_DWORD *)(v4 + 4) = v216;
        v223 = v209 + v184;
        v224 = (char *)v5 + 4 * (int)v223;
        v225 = *((_DWORD *)v224 + 383);
        if (v225 <= (int)v204)
          v204 = v204;
        else
          v204 = v225;
        v226 = *((_DWORD *)v224 + 447);
        if (v226 <= (int)v203)
          v203 = v203;
        else
          v203 = v226;
        if (v212 == 3 && (_DWORD)v213 == 7)
        {
          if (v216)
          {
            v228 = v216 - 1;
            if ((unint64_t)v185 >= v205)
            {
              v222 |= 1 << v228;
              *(_DWORD *)v4 = v222;
            }
            v229 = *(_DWORD *)(v4 + 56);
            if (v228 <= 5)
            {
              v230 = v229 & v209;
              v231 = (((v230 >> (7 - v216)) | v222) << 8) & 0xFF0000 | (((v230 >> (7 - v216)) | v222) << 24) | (((v230 >> (7 - v216)) | v222) >> 8) & 0xFF00 | (((v230 >> (7 - v216)) | v222) >> 24);
              v232 = *(_QWORD *)(v4 + 24);
              v233 = *(unsigned int *)(v4 + 8);
              *(_DWORD *)(v4 + 8) = v233 + 1;
              *(_DWORD *)(v232 + 4 * v233) = v231;
              v234 = v216 + 25;
              v235 = v230 << v234;
              v236 = *(_DWORD *)(v4 + 64);
              goto LABEL_199;
            }
          }
          else
          {
            v237 = *(_QWORD *)(v4 + 24);
            v238 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v238 + 1;
            *(_DWORD *)(v237 + 4 * v238) = bswap32(v222);
            v222 = ((unint64_t)v185 >= v205) << 31;
            v229 = *(_DWORD *)(v4 + 56);
            v228 = 31;
          }
          v234 = v228 - 6;
          v235 = ((v229 & v209) << (v228 - 6)) | v222;
          v236 = *(_DWORD *)(v4 + 64);
          if (v228 - 6 < 8)
          {
            v241 = v236 & v208;
            v242 = (((v241 >> (14 - v228)) | v235) << 8) & 0xFF0000 | (((v241 >> (14 - v228)) | v235) << 24) | (((v241 >> (14 - v228)) | v235) >> 8) & 0xFF00 | (((v241 >> (14 - v228)) | v235) >> 24);
            v243 = *(_QWORD *)(v4 + 24);
            v244 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v244 + 1;
            *(_DWORD *)(v243 + 4 * v244) = v242;
            *(_DWORD *)(v4 + 4) = v228 + 18;
            v240 = v241 << (v228 + 18);
          }
          else
          {
LABEL_199:
            v239 = v234 - 8;
            *(_DWORD *)(v4 + 4) = v239;
            v240 = ((v236 & v208) << v239) | v235;
          }
          *(_DWORD *)v4 = v240;
        }
        v184 = v223 + 1;
        ++v185;
      }
      while ((unint64_t)v185 <= v205);
      if (*v199)
        goto LABEL_205;
LABEL_204:
      if (*v181)
        goto LABEL_205;
LABEL_219:
      if (++v178 == 6)
      {
        DumpDecoded263MB4S16(v257, *(_QWORD **)(v257 + 32), *(_QWORD *)(v257 + 24), v252, (_DWORD *)(v6 + 254));
        return 0;
      }
    }
    v182 = v180->i16[0];
    if (v182 < 255)
    {
      v183 = *(_DWORD *)(v4 + 4);
      if (v182 > 0)
      {
        if (v182 == 128)
        {
          v186 = v183 - 8;
          if (v183 >= 8)
          {
            *(_DWORD *)(v4 + 4) = v186;
            v187 = *(unsigned __int8 *)(v4 + 64) << v186;
LABEL_160:
            v189 = v187 | *(_DWORD *)v4;
LABEL_163:
            *(_DWORD *)v4 = v189;
            v185 = &v180->i16[1];
            v184 = 1;
            goto LABEL_164;
          }
          v190 = *(unsigned __int8 *)(v4 + 64);
          v191 = *(_DWORD *)v4;
          v192 = (v190 >> (8 - v183)) | *(_DWORD *)v4;
          v193 = *(_DWORD *)v4 << 8;
LABEL_162:
          v194 = v193 & 0xFF0000 | (v192 << 24) | (v191 >> 8) & 0xFF00 | HIBYTE(v191);
          v195 = *(_QWORD *)(v4 + 24);
          v196 = *(unsigned int *)(v4 + 8);
          *(_DWORD *)(v4 + 8) = v196 + 1;
          *(_DWORD *)(v195 + 4 * v196) = v194;
          v197 = v183 + 24;
          *(_DWORD *)(v4 + 4) = v197;
          v189 = v190 << v197;
          goto LABEL_163;
        }
LABEL_158:
        v188 = v183 - 8;
        if (v183 >= 8)
        {
          *(_DWORD *)(v4 + 4) = v188;
          v187 = (*(_DWORD *)(v4 + 64) & (unsigned __int16)v182) << v188;
          goto LABEL_160;
        }
        v190 = *(_DWORD *)(v4 + 64) & (unsigned __int16)v182;
        v191 = *(_DWORD *)v4;
        v192 = (v190 >> (8 - v183)) | *(_DWORD *)v4;
        v193 = v192 << 8;
        goto LABEL_162;
      }
      LOWORD(v182) = 1;
    }
    else
    {
      v183 = *(_DWORD *)(v4 + 4);
      LOWORD(v182) = 254;
    }
    v180->i16[0] = v182;
    goto LABEL_158;
  }
  v69 = *(unsigned __int8 *)(v6 + 154);
  if (v69 == 2)
  {
    v70 = 0;
    while (1)
    {
      v71 = v6 + 4 * v70;
      if (*(_DWORD *)(v71 + 202))
        break;
      ++v70;
      v72 = *(_DWORD *)(v71 + 226);
      v73 = v72 == 0;
      if (v70 > 3 || v72)
        goto LABEL_85;
    }
LABEL_84:
    v73 = 0;
LABEL_85:
    if (v59)
      goto LABEL_91;
    goto LABEL_86;
  }
  if (*(_DWORD *)(v6 + 198))
    goto LABEL_84;
  v73 = *(_DWORD *)(v6 + 222) == 0;
  if (v59)
    goto LABEL_91;
LABEL_86:
  if (v60 || !v73)
  {
LABEL_91:
    *(_BYTE *)(v6 + 156) = 1;
    v80 = *(_DWORD *)(v4 + 4);
    if (v80)
    {
      v63 = v80 - 1;
    }
    else
    {
      v86 = bswap32(*(_DWORD *)v4);
      v87 = *(_QWORD *)(v4 + 24);
      v88 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v88 + 1;
      *(_DWORD *)(v87 + 4 * v88) = v86;
      *(_DWORD *)v4 = 0;
      v59 = *(_DWORD *)(v6 + 246);
      v63 = 31;
    }
    *(_DWORD *)(v4 + 4) = v63;
    goto LABEL_99;
  }
  v77 = *(_DWORD *)(v4 + 4);
  if (v77)
  {
    v78 = v77 - 1;
    v79 = *(_DWORD *)v4 | (1 << v78);
  }
  else
  {
    v81 = bswap32(*(_DWORD *)v4);
    v82 = *(_QWORD *)(v4 + 24);
    v83 = *(unsigned int *)(v4 + 8);
    *(_DWORD *)(v4 + 8) = v83 + 1;
    *(_DWORD *)(v82 + 4 * v83) = v81;
    v78 = 31;
    v79 = 0x80000000;
  }
  *(_DWORD *)v4 = v79;
  *(_DWORD *)(v4 + 4) = v78;
  v84 = *(_BYTE *)(v6 + 155);
  if (v84)
  {
    *(_BYTE *)(v6 + 154) = v69 - 1;
    *(_BYTE *)(v6 + 153) -= v84;
    *(_BYTE *)(v6 + 155) = 0;
  }
  return 2;
}

void H263CMPR_CompressMaster_cold_1()
{
  __assert_rtn("H263CMPR_CompressMaster", "cmpr.c", 1441, "0");
}

BOOL COLOR_Init(void ***a1, int a2)
{
  _BOOL8 result;
  void **v5;
  void **v6;
  void *v7;
  uint64_t v8;
  _WORD *v9;
  _WORD *v10;
  _WORD *v11;
  _WORD *v12;
  double v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  double v24;
  float v25;
  void *v26;
  uint64_t v27;
  float v28;
  void *v29;
  uint64_t v30;
  _WORD *v31;
  _WORD *v32;
  _WORD *v33;
  _WORD *v34;
  _WORD *v35;
  float v36;

  if (*a1)
    return 0;
  v5 = (void **)MEM_NewClear(144);
  *a1 = v5;
  if (!v5)
    return 1;
  v6 = v5;
  if (a2 == 1)
  {
    if (*v5)
      return 0;
    **a1 = MEM_New(2048);
    v7 = **a1;
    result = v7 == 0;
    if (!v7)
      return 1;
    v8 = 0;
    (*a1)[1] = v7;
    (*a1)[2] = (char *)**a1 + 512;
    (*a1)[3] = (char *)**a1 + 1024;
    (*a1)[4] = (char *)**a1 + 1536;
    v6 = *a1;
    v9 = (*a1)[1];
    v10 = (*a1)[2];
    v11 = (*a1)[3];
    v12 = (*a1)[4];
    do
    {
      v13 = (float)(int)v8 + -128.0;
      v14 = v13 * 1.40199995;
      if (v14 < 0.0)
        v15 = -0.5;
      else
        v15 = 0.5;
      v16 = v15 + v14;
      v9[v8] = (int)v16;
      v17 = v13 * 0.344000012;
      if (v17 < 0.0)
        v18 = -0.5;
      else
        v18 = 0.5;
      v19 = v18 + v17;
      v10[v8] = (int)v19;
      v20 = v13 * 0.713999987;
      if (v20 < 0.0)
        v21 = -0.5;
      else
        v21 = 0.5;
      v22 = v21 + v20;
      v11[v8] = (int)v22;
      v23 = v13 * 1.77199996;
      if (v23 < 0.0)
        v24 = -0.5;
      else
        v24 = 0.5;
      v25 = v24 + v23;
      v12[v8++] = (int)v25;
    }
    while (v8 != 256);
  }
  else
  {
    result = 0;
  }
  if (a2)
    return result;
  if (!v6[5])
  {
    (*a1)[5] = MEM_New(768);
    v26 = (*a1)[5];
    result = v26 == 0;
    if (!v26)
      return 1;
    v27 = 0;
    (*a1)[6] = v26;
    (*a1)[7] = (char *)(*a1)[5] + 256;
    (*a1)[8] = (char *)(*a1)[5] + 512;
    do
    {
      v28 = (float)(unsigned __int16)v27;
      *((_BYTE *)(*a1)[6] + v27) = (int)(float)(v28 * 0.299);
      *((_BYTE *)(*a1)[7] + v27) = (int)(float)(v28 * 0.587);
      *((_BYTE *)(*a1)[8] + v27++) = (int)(float)(v28 * 0.114);
    }
    while (v27 != 256);
    v6 = *a1;
  }
  if (v6[9])
    return result;
  (*a1)[9] = MEM_New(10240);
  v29 = (*a1)[9];
  result = v29 == 0;
  if (!v29)
    return 1;
  v30 = 0;
  (*a1)[10] = v29;
  (*a1)[11] = (char *)(*a1)[9] + 2048;
  (*a1)[12] = (char *)(*a1)[9] + 4096;
  (*a1)[13] = (char *)(*a1)[9] + 6144;
  (*a1)[14] = (char *)(*a1)[9] + 0x2000;
  v31 = (*a1)[10];
  v32 = (*a1)[11];
  v33 = (*a1)[12];
  v34 = (*a1)[13];
  v35 = (*a1)[14];
  do
  {
    v36 = (float)(unsigned __int16)v30;
    v31[v30] = (int)(float)(v36 * 0.1687);
    v32[v30] = (int)(float)(v36 * 0.3313);
    v33[v30] = (int)(float)(v36 * 0.5);
    v34[v30] = (int)(float)(v36 * 0.4187);
    v35[v30++] = (int)(float)(v36 * 0.0813);
  }
  while (v30 != 1024);
  return result;
}

uint64_t COLOR_Kill(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (v2)
  {
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      v2 = *a1;
    }
    if (v2[5])
    {
      MEM_Dispose(v2[5]);
      (*a1)[5] = 0;
      v2 = *a1;
    }
    if (v2[9])
    {
      MEM_Dispose(v2[9]);
      (*a1)[9] = 0;
      v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t COLOR_R2Y32(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, int *a6, int a7, int a8, int a9, uint64_t a10, _QWORD *a11)
{
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  _BYTE *v28;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  unsigned __int8 *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  _BYTE *v61;
  _BYTE *v62;
  int v63;
  int v64;
  int *v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v72 = result;
  v11 = 2 * a7;
  if (*a5 >= a7)
    v12 = a7;
  else
    v12 = *a5;
  if (*a6 >= a8)
    v13 = a8;
  else
    v13 = *a6;
  v14 = -v12 & 0xE;
  v74 = v13;
  v71 = v13 - 1;
  if (v13 >= 1)
  {
    v65 = a5;
    v66 = a6;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v19 = a11[6];
    v18 = a11[7];
    v20 = a11[8];
    v21 = a11[10];
    v22 = a11[11];
    v24 = a11[13];
    v23 = a11[14];
    v78 = v22;
    v63 = 2 * a7;
    v64 = a7;
    v73 = v11;
    v67 = a7;
    v68 = a2;
    result = 128;
    v25 = a2;
    v26 = a2 + a7;
    v69 = a3;
    v70 = a4;
    while (1)
    {
      v27 = (_BYTE *)(a3 + ((int)v15 >> 2));
      v28 = (_BYTE *)(a4 + ((int)v15 >> 2));
      if (v12 >= 1)
        break;
      v51 = v68 + v15;
      v50 = v68 + v15 + v67;
      if (v14)
        goto LABEL_20;
LABEL_22:
      v17 += 2;
      v15 += v73;
      v16 += 2 * a9;
      v26 += v73;
      v25 += v73;
      if (v17 >= v74)
      {
        v53 = (int)v15;
        a5 = v65;
        a6 = v66;
        v11 = v63;
        a7 = v64;
        a2 = v68;
        goto LABEL_25;
      }
    }
    v76 = v16;
    v77 = v15;
    v29 = 0;
    v30 = (unsigned __int8 *)(v72 + v16);
    v75 = v17;
    v31 = a9;
    if (v17 == v71)
      v31 = 0;
    v32 = &v30[v31];
    v79 = v25;
    do
    {
      v33 = v25 + v29;
      v34 = v30[1];
      v35 = v30[2];
      v36 = v30[3];
      v37 = v32[1];
      v38 = v32[2];
      v39 = v32[3];
      *(_BYTE *)(v25 + v29) = *(_BYTE *)(v18 + v35) + *(_BYTE *)(v19 + v30[1]) + *(_BYTE *)(v20 + v30[3]);
      *(_BYTE *)(v26 + v29) = *(_BYTE *)(v18 + v38) + *(_BYTE *)(v19 + v37) + *(_BYTE *)(v20 + v39);
      if (v12 - 1 == (_DWORD)v29)
      {
        *(_BYTE *)(v33 + 1) = *(_BYTE *)(v25 + v29);
        v40 = *(_BYTE *)(v26 + v29);
        v41 = v35;
        v42 = v38;
        v43 = v34;
        v44 = v37;
        v45 = v36;
        v46 = v39;
      }
      else
      {
        v43 = v30[5];
        v41 = v30[6];
        v45 = v30[7];
        v30 += 8;
        v44 = v32[5];
        v42 = v32[6];
        v46 = v32[7];
        v32 += 8;
        *(_BYTE *)(v33 + 1) = *(_BYTE *)(v18 + v41) + *(_BYTE *)(v19 + v43) + *(_BYTE *)(v20 + v45);
        v40 = *(_BYTE *)(v18 + v42) + *(_BYTE *)(v19 + v44) + *(_BYTE *)(v20 + v46);
        v22 = v78;
      }
      *(_BYTE *)(v26 + v29 + 1) = v40;
      v47 = v37 + v34 + v43 + v44;
      v48 = v38 + v35 + v41 + v42;
      v49 = v39 + v36 + v45 + v46;
      *v27++ = ((v49 >> 1) - (*(unsigned __int16 *)(v21 + 2 * v47) + *(unsigned __int16 *)(v22 + 2 * v48)) + 513) >> 2;
      *v28++ = ((v47 >> 1) - (*(unsigned __int16 *)(v24 + 2 * v48) + *(unsigned __int16 *)(v23 + 2 * v49)) + 513) >> 2;
      v29 += 2;
      v25 = v79;
    }
    while ((int)v29 < v12);
    v50 = v26 + v29;
    v51 = v79 + v29;
    a3 = v69;
    a4 = v70;
    v14 = -v12 & 0xE;
    v16 = v76;
    v15 = v77;
    v17 = v75;
    result = 128;
    if (!v14)
      goto LABEL_22;
LABEL_20:
    v52 = 0;
    do
    {
      *(_WORD *)(v51 + v52) = -32640;
      *(_WORD *)(v50 + v52) = -32640;
      *v27++ = 0x80;
      *v28++ = 0x80;
      v52 += 2;
    }
    while (v52 < v14);
    goto LABEL_22;
  }
  v53 = 0;
LABEL_25:
  v54 = -v74 & 0xE;
  if (v54)
  {
    v55 = 0;
    v56 = v14 + v12;
    v57 = v53 + a2 + 1;
    v58 = v57 + a7;
    do
    {
      if ((v56 & 0x80000000) == 0)
      {
        v59 = 0;
        v60 = (_BYTE *)(a4 + ((int)v53 >> 2));
        result = a3 + ((int)v53 >> 2);
        do
        {
          v61 = (_BYTE *)(v57 + v59);
          v62 = (_BYTE *)(v58 + v59);
          *(v62 - 1) = 0x80;
          *(v61 - 1) = 0x80;
          *v62 = 0x80;
          *v61 = 0x80;
          v59 += 2;
          *(_BYTE *)result++ = 0x80;
          *v60++ = 0x80;
        }
        while ((int)v59 <= v56);
      }
      v55 += 2;
      LODWORD(v53) = v53 + v11;
      v57 += v11;
      v58 += v11;
    }
    while (v55 < v54);
  }
  *a5 += -*a5 & 0xF;
  *a6 += -*a6 & 0xF;
  return result;
}

uint64_t COLOR_R2Y24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, int *a6, int a7, int a8, int a9, uint64_t a10, _QWORD *a11)
{
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  _BYTE *v28;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  unsigned __int8 *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  _BYTE *v61;
  _BYTE *v62;
  int v63;
  int v64;
  int *v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v72 = result;
  v11 = 2 * a7;
  if (*a5 >= a7)
    v12 = a7;
  else
    v12 = *a5;
  if (*a6 >= a8)
    v13 = a8;
  else
    v13 = *a6;
  v14 = -v12 & 0xE;
  v74 = v13;
  v71 = v13 - 1;
  if (v13 >= 1)
  {
    v65 = a5;
    v66 = a6;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v19 = a11[6];
    v18 = a11[7];
    v20 = a11[8];
    v21 = a11[10];
    v22 = a11[11];
    v24 = a11[13];
    v23 = a11[14];
    v78 = v22;
    v63 = 2 * a7;
    v64 = a7;
    v73 = v11;
    v67 = a7;
    v68 = a2;
    result = 128;
    v25 = a2;
    v26 = a2 + a7;
    v69 = a3;
    v70 = a4;
    while (1)
    {
      v27 = (_BYTE *)(a3 + ((int)v15 >> 2));
      v28 = (_BYTE *)(a4 + ((int)v15 >> 2));
      if (v12 >= 1)
        break;
      v51 = v68 + v15;
      v50 = v68 + v15 + v67;
      if (v14)
        goto LABEL_20;
LABEL_22:
      v17 += 2;
      v15 += v73;
      v16 += 2 * a9;
      v26 += v73;
      v25 += v73;
      if (v17 >= v74)
      {
        v53 = (int)v15;
        a5 = v65;
        a6 = v66;
        v11 = v63;
        a7 = v64;
        a2 = v68;
        goto LABEL_25;
      }
    }
    v76 = v16;
    v77 = v15;
    v29 = 0;
    v30 = (unsigned __int8 *)(v72 + v16);
    v75 = v17;
    v31 = a9;
    if (v17 == v71)
      v31 = 0;
    v32 = &v30[v31];
    v79 = v25;
    do
    {
      v33 = v25 + v29;
      v34 = *v30;
      v35 = v30[1];
      v36 = v30[2];
      v37 = *v32;
      v38 = v32[1];
      v39 = v32[2];
      *(_BYTE *)(v25 + v29) = *(_BYTE *)(v18 + v35) + *(_BYTE *)(v19 + *v30) + *(_BYTE *)(v20 + v30[2]);
      *(_BYTE *)(v26 + v29) = *(_BYTE *)(v18 + v38) + *(_BYTE *)(v19 + v37) + *(_BYTE *)(v20 + v39);
      if (v12 - 1 == (_DWORD)v29)
      {
        *(_BYTE *)(v33 + 1) = *(_BYTE *)(v25 + v29);
        v40 = *(_BYTE *)(v26 + v29);
        v41 = v35;
        v42 = v38;
        v43 = v34;
        v44 = v37;
        v45 = v36;
        v46 = v39;
      }
      else
      {
        v43 = v30[3];
        v41 = v30[4];
        v45 = v30[5];
        v30 += 6;
        v44 = v32[3];
        v42 = v32[4];
        v46 = v32[5];
        v32 += 6;
        *(_BYTE *)(v33 + 1) = *(_BYTE *)(v18 + v41) + *(_BYTE *)(v19 + v43) + *(_BYTE *)(v20 + v45);
        v40 = *(_BYTE *)(v18 + v42) + *(_BYTE *)(v19 + v44) + *(_BYTE *)(v20 + v46);
        v22 = v78;
      }
      *(_BYTE *)(v26 + v29 + 1) = v40;
      v47 = v37 + v34 + v43 + v44;
      v48 = v38 + v35 + v41 + v42;
      v49 = v39 + v36 + v45 + v46;
      *v27++ = ((v49 >> 1) - (*(unsigned __int16 *)(v21 + 2 * v47) + *(unsigned __int16 *)(v22 + 2 * v48)) + 513) >> 2;
      *v28++ = ((v47 >> 1) - (*(unsigned __int16 *)(v24 + 2 * v48) + *(unsigned __int16 *)(v23 + 2 * v49)) + 513) >> 2;
      v29 += 2;
      v25 = v79;
    }
    while ((int)v29 < v12);
    v50 = v26 + v29;
    v51 = v79 + v29;
    a3 = v69;
    a4 = v70;
    v14 = -v12 & 0xE;
    v16 = v76;
    v15 = v77;
    v17 = v75;
    result = 128;
    if (!v14)
      goto LABEL_22;
LABEL_20:
    v52 = 0;
    do
    {
      *(_WORD *)(v51 + v52) = -32640;
      *(_WORD *)(v50 + v52) = -32640;
      *v27++ = 0x80;
      *v28++ = 0x80;
      v52 += 2;
    }
    while (v52 < v14);
    goto LABEL_22;
  }
  v53 = 0;
LABEL_25:
  v54 = -v74 & 0xE;
  if (v54)
  {
    v55 = 0;
    v56 = v14 + v12;
    v57 = v53 + a2 + 1;
    v58 = v57 + a7;
    do
    {
      if ((v56 & 0x80000000) == 0)
      {
        v59 = 0;
        v60 = (_BYTE *)(a4 + ((int)v53 >> 2));
        result = a3 + ((int)v53 >> 2);
        do
        {
          v61 = (_BYTE *)(v57 + v59);
          v62 = (_BYTE *)(v58 + v59);
          *(v62 - 1) = 0x80;
          *(v61 - 1) = 0x80;
          *v62 = 0x80;
          *v61 = 0x80;
          v59 += 2;
          *(_BYTE *)result++ = 0x80;
          *v60++ = 0x80;
        }
        while ((int)v59 <= v56);
      }
      v55 += 2;
      LODWORD(v53) = v53 + v11;
      v57 += v11;
      v58 += v11;
    }
    while (v55 < v54);
  }
  *a5 += -*a5 & 0xF;
  *a6 += -*a6 & 0xF;
  return result;
}

_BYTE *COLOR_Y422ToY420u(_BYTE *result, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, int *a6, int a7, int a8, int a9, int a10)
{
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  _BYTE *v25;
  _BYTE *v26;
  _BYTE *v27;
  _BYTE *v28;
  int v29;
  _BYTE *v30;
  int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  uint64_t v34;
  _BYTE *v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  _BYTE *v51;
  int v52;
  int v53;
  int *v54;
  int *v55;
  _BYTE *v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  int v61;

  v10 = 2 * a7;
  if (*a5 >= a7)
    v11 = a7;
  else
    v11 = *a5;
  if (*a6 < a8)
    a8 = *a6;
  v12 = -v11 & 0xE;
  v61 = a8 - 1;
  if (a8 < 1)
  {
    v42 = 0;
  }
  else
  {
    v54 = a5;
    v55 = a6;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    if (a10 == 2)
      v16 = -128;
    else
      v16 = 0;
    if (v11 >> 1 <= 2)
      v17 = 2;
    else
      v17 = v11 >> 1;
    v60 = 2 * a9;
    v52 = 2 * a7;
    v53 = a7;
    v18 = v10;
    v59 = a7;
    v19 = a2 + a7;
    v20 = 2 * v17 - 2;
    v21 = result + 4;
    v22 = a2;
    v23 = result;
    v57 = a8;
    v58 = v11;
    v56 = result;
    do
    {
      v24 = (_BYTE *)(a2 + v13);
      v25 = (_BYTE *)(a2 + v13 + v59);
      v26 = (_BYTE *)(a3 + ((int)v13 >> 2));
      v27 = (_BYTE *)(a4 + ((int)v13 >> 2));
      v28 = &v23[v14];
      v29 = a9;
      if (v15 == v61)
        v29 = 0;
      v30 = &v28[v29];
      *v24 = *v28;
      v24[1] = v28[2];
      LOBYTE(v31) = v28[1] ^ v16;
      result = (_BYTE *)(v28[3] ^ v16);
      *v25 = *v30;
      v25[1] = v30[2];
      v32 = v30[1] ^ v16;
      v33 = v30[3] ^ v16;
      if (v11 < 4)
      {
        v40 = (uint64_t)(v25 + 2);
        v39 = (uint64_t)(v24 + 2);
        v31 = v31;
        LODWORD(v25) = (v30[1] ^ v16);
        LODWORD(v24) = result;
        v38 = (v30[3] ^ v16);
      }
      else
      {
        v34 = 0;
        v35 = v21;
        do
        {
          v24 = (_BYTE *)(v22 + v34);
          v25 = (_BYTE *)(v19 + v34);
          v24[2] = *v35;
          v24[3] = v35[2];
          v36 = v35[1] ^ v16;
          LOBYTE(v24) = v35[3] ^ v16;
          v25[2] = v35[v29];
          v25[3] = v35[v29 + 2];
          LOBYTE(v25) = v35[v29 + 1] ^ v16;
          v37 = v35[v29 + 3] ^ v16;
          *v26++ = (3 * (v32 + v31) + v36 + v25 + 4) >> 3;
          *v27++ = (3 * (v33 + result) + v24 + v37 + 4) >> 3;
          v34 += 2;
          v35 += 4;
          v33 = v37;
          LOBYTE(result) = (_BYTE)v24;
          v32 = v25;
          LOBYTE(v31) = v36;
        }
        while (v20 != (_DWORD)v34);
        v31 = v36;
        LODWORD(v25) = v25;
        LODWORD(v24) = v24;
        v38 = v37;
        v39 = v22 + v34 + 2;
        result = (_BYTE *)(v19 + v34);
        v40 = v19 + v34 + 2;
        a8 = v57;
        v11 = v58;
        v23 = v56;
      }
      *v26 = (v31 + (_DWORD)v25 + 1) >> 1;
      *v27 = ((_DWORD)v24 + v38 + 1) >> 1;
      if (v12)
      {
        v41 = 0;
        do
        {
          *(_WORD *)(v39 + v41) = -32640;
          *(_WORD *)(v40 + v41) = -32640;
          *v26++ = 0x80;
          *v27++ = 0x80;
          v41 += 2;
        }
        while (v41 < v12);
      }
      v15 += 2;
      v13 += v18;
      v14 += v60;
      v22 += v18;
      v19 += v18;
      v21 += v60;
    }
    while (v15 < a8);
    v42 = (int)v13;
    a5 = v54;
    a6 = v55;
    v10 = v52;
    a7 = v53;
  }
  if ((-a8 & 0xE) != 0)
  {
    v43 = 0;
    v44 = v12 + v11;
    v45 = v10;
    v46 = v42 + a2 + 1;
    v47 = v46 + a7;
    do
    {
      if ((v44 & 0x80000000) == 0)
      {
        v48 = 0;
        v49 = (_BYTE *)(a4 + ((int)v42 >> 2));
        result = (_BYTE *)(a3 + ((int)v42 >> 2));
        do
        {
          v50 = (_BYTE *)(v46 + v48);
          v51 = (_BYTE *)(v47 + v48);
          *(v51 - 1) = 0x80;
          *(v50 - 1) = 0x80;
          *v51 = 0x80;
          *v50 = 0x80;
          v48 += 2;
          *result++ = 0x80;
          *v49++ = 0x80;
        }
        while ((int)v48 <= v44);
      }
      v43 += 2;
      LODWORD(v42) = v42 + v45;
      v46 += v45;
      v47 += v45;
    }
    while (v43 < (-a8 & 0xEu));
  }
  *a5 += -*a5 & 0xF;
  *a6 += -*a6 & 0xF;
  return result;
}

uint64_t InitHuffmanTables(uint64_t a1, int a2)
{
  char **v5;

  if (*(_QWORD *)a1)
    return 0;
  v5 = (char **)MEM_NewClear(80);
  *(_QWORD *)a1 = v5;
  if (!v5)
    return 1;
  if (a2)
  {
    if (a2 != 1)
      return 0;
    if (!InitDecodeTCTables(v5)
      && !InitDecodeMCBPCINTERTables((_QWORD *)(*(_QWORD *)a1 + 16))
      && !InitDecodeCBPYTables((_QWORD *)(*(_QWORD *)a1 + 24))
      && !InitDecodeMCBPCINTRATables((_QWORD *)(*(_QWORD *)a1 + 8)))
    {
      return InitDecodeMVDTables((_QWORD *)(*(_QWORD *)a1 + 32));
    }
    return 1;
  }
  if (InitEncMCBPCINTRATables((uint64_t)(v5 + 5))
    || InitEncMCBPCINTERTables(*(_QWORD *)a1 + 48)
    || InitEncCBPYTables(*(_QWORD *)a1 + 56)
    || InitEncMVDTables((_QWORD *)(*(_QWORD *)a1 + 64)))
  {
    return 1;
  }
  return InitEncTCTables((_QWORD *)(*(_QWORD *)a1 + 72));
}

uint64_t InitDecodeTCTables(char **a1)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t i;
  __int16 *v6;
  __int16 *v7;
  __int16 *v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  __int16 v13;
  __int16 v14;
  BOOL v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t j;
  __int16 *v20;
  __int16 *v21;
  __int16 *v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  __int16 v27;
  __int16 v28;

  v2 = (char *)MEM_NewClear(4608);
  *a1 = v2;
  if (!v2)
    return 1;
  v3 = v2;
  v4 = v2 + 2048;
  memset_pattern16(v2, &unk_2285766D0, 0x800uLL);
  for (i = 0; i != 1024; i += 16)
    *(_OWORD *)&v4[i] = 0uLL;
  v6 = &word_228575FB6;
  v7 = (__int16 *)&unk_228575FB8;
  v8 = &word_228575FBA;
  v9 = 360;
  LOWORD(v10) = 1023;
  do
  {
    v12 = v7[3];
    v7 += 3;
    v11 = v12;
    if (v12 < (__int16)v10)
    {
      v10 = (__int16)v10;
      v13 = *v6;
      v14 = *v8;
      do
      {
        *(_WORD *)&v3[2 * v10] = v13;
        v3[v10-- + 2048] = v14;
      }
      while (v10 > v11);
    }
    v6 += 3;
    v8 += 3;
    LOWORD(v10) = v11;
    v15 = v9 >= 3;
    v9 -= 3;
  }
  while (v9 != 0 && v15);
  v16 = *a1;
  v17 = *a1 + 3072;
  v18 = v16 + 4096;
  memset_pattern16(v17, &unk_2285766D0, 0x400uLL);
  for (j = 0; j != 512; j += 16)
    *(_OWORD *)&v18[j] = 0uLL;
  v20 = &word_22857628E;
  v21 = (__int16 *)&unk_228576290;
  v22 = &word_228576292;
  v23 = 255;
  LOWORD(v24) = 271;
  do
  {
    v26 = v21[3];
    v21 += 3;
    v25 = v26;
    if (v26 < (__int16)v24)
    {
      v24 = (__int16)v24;
      v27 = *v20;
      v28 = *v22;
      do
      {
        *((_WORD *)v17 + v24) = v27;
        *((_BYTE *)v17 + v24-- + 1024) = v28;
      }
      while (v24 > v25);
    }
    v20 += 3;
    v22 += 3;
    LOWORD(v24) = v25;
    v15 = v23 >= 3;
    v23 -= 3;
  }
  while (v23 != 0 && v15);
  return 0;
}

uint64_t InitDecodeMCBPCINTERTables(_QWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  __int16 *v4;
  __int16 *v5;
  __int16 *v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v11;
  __int16 v12;
  _BYTE *v13;
  BOOL v14;

  v2 = MEM_NewClear(512);
  *a1 = v2;
  if (!v2)
    return 1;
  *(_QWORD *)&v3 = 0x9D9D9D9D9D9D9D9DLL;
  *((_QWORD *)&v3 + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v2[14] = v3;
  v2[15] = v3;
  v2[12] = v3;
  v2[13] = v3;
  v2[10] = v3;
  v2[11] = v3;
  v2[8] = v3;
  v2[9] = v3;
  v2[6] = v3;
  v2[7] = v3;
  v2[4] = v3;
  v2[5] = v3;
  v2[2] = v3;
  v2[3] = v3;
  *v2 = v3;
  v2[1] = v3;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[18] = 0u;
  v2[19] = 0u;
  v2[20] = 0u;
  v2[21] = 0u;
  v2[22] = 0u;
  v2[23] = 0u;
  v2[24] = 0u;
  v2[25] = 0u;
  v2[26] = 0u;
  v2[27] = 0u;
  v2[28] = 0u;
  v2[29] = 0u;
  v4 = &word_2285764CC;
  v5 = (__int16 *)&unk_2285764CE;
  v6 = &word_2285764D0;
  v7 = 48;
  LOWORD(v8) = 255;
  v2[30] = 0u;
  v2[31] = 0u;
  do
  {
    v10 = v5[3];
    v5 += 3;
    v9 = v10;
    if (v10 < (__int16)v8)
    {
      v8 = (__int16)v8;
      v11 = *v4;
      v12 = *v6;
      do
      {
        v13 = (char *)v2 + v8;
        *v13 = v11;
        v13[256] = v12;
        --v8;
      }
      while (v8 > v9);
    }
    v4 += 3;
    v6 += 3;
    LOWORD(v8) = v9;
    v14 = v7 >= 3;
    v7 -= 3;
  }
  while (v7 != 0 && v14);
  return 0;
}

uint64_t InitDecodeCBPYTables(_QWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  __int16 *v4;
  __int16 *v5;
  __int16 *v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v11;
  __int16 v12;
  _BYTE *v13;
  BOOL v14;

  v2 = MEM_NewClear(128);
  *a1 = v2;
  if (!v2)
    return 1;
  *(_QWORD *)&v3 = 0x9D9D9D9D9D9D9D9DLL;
  *((_QWORD *)&v3 + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v2[2] = v3;
  v2[3] = v3;
  *v2 = v3;
  v2[1] = v3;
  v2[4] = 0u;
  v2[5] = 0u;
  v4 = &word_228576534;
  v5 = (__int16 *)&unk_228576536;
  v6 = &word_228576538;
  v7 = 48;
  LOWORD(v8) = 63;
  v2[6] = 0u;
  v2[7] = 0u;
  do
  {
    v10 = v5[3];
    v5 += 3;
    v9 = v10;
    if (v10 < (__int16)v8)
    {
      v8 = (__int16)v8;
      v11 = *v4;
      v12 = *v6;
      do
      {
        v13 = (char *)v2 + v8;
        *v13 = v11;
        v13[64] = v12;
        --v8;
      }
      while (v8 > v9);
    }
    v4 += 3;
    v6 += 3;
    LOWORD(v8) = v9;
    v14 = v7 >= 3;
    v7 -= 3;
  }
  while (v7 != 0 && v14);
  return 0;
}

uint64_t InitDecodeMCBPCINTRATables(_QWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  __int16 *v4;
  __int16 *v5;
  __int16 *v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v11;
  __int16 v12;
  _BYTE *v13;
  BOOL v14;

  v2 = MEM_NewClear(128);
  *a1 = v2;
  if (!v2)
    return 1;
  *(_QWORD *)&v3 = 0x9D9D9D9D9D9D9D9DLL;
  *((_QWORD *)&v3 + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v2[2] = v3;
  v2[3] = v3;
  *v2 = v3;
  v2[1] = v3;
  v2[4] = 0u;
  v2[5] = 0u;
  v4 = &word_228576494;
  v5 = (__int16 *)&unk_228576496;
  v6 = &word_228576498;
  v7 = 24;
  LOWORD(v8) = 63;
  v2[6] = 0u;
  v2[7] = 0u;
  do
  {
    v10 = v5[3];
    v5 += 3;
    v9 = v10;
    if (v10 < (__int16)v8)
    {
      v8 = (__int16)v8;
      v11 = *v4;
      v12 = *v6;
      do
      {
        v13 = (char *)v2 + v8;
        *v13 = v11;
        v13[64] = v12;
        --v8;
      }
      while (v8 > v9);
    }
    v4 += 3;
    v6 += 3;
    LOWORD(v8) = v9;
    v14 = v7 >= 3;
    v7 -= 3;
  }
  while (v7 != 0 && v14);
  return 0;
}

uint64_t InitDecodeMVDTables(_QWORD *a1)
{
  char *v2;
  char *v3;
  void *v4;
  __int16 *v5;
  __int16 *v6;
  __int16 *v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  __int16 v12;
  __int16 v13;
  char *v14;
  BOOL v15;

  v2 = (char *)MEM_NewClear(4096);
  *a1 = v2;
  if (!v2)
    return 1;
  v3 = v2;
  v4 = v2 + 2048;
  memset(v2, 157, 0x800uLL);
  bzero(v4, 0x800uLL);
  v5 = &word_22857659C;
  v6 = (__int16 *)&unk_22857659E;
  v7 = &word_2285765A0;
  v8 = 147;
  LOWORD(v9) = 2047;
  do
  {
    v11 = v6[3];
    v6 += 3;
    v10 = v11;
    if (v11 < (__int16)v9)
    {
      v9 = (__int16)v9;
      v12 = *v5;
      v13 = *v7;
      do
      {
        v14 = &v3[v9];
        *v14 = v12;
        v14[2048] = v13;
        --v9;
      }
      while (v9 > v10);
    }
    v5 += 3;
    v7 += 3;
    LOWORD(v9) = v10;
    v15 = v8 >= 3;
    v8 -= 3;
  }
  while (v8 != 0 && v15);
  return 0;
}

BOOL InitEncMCBPCINTRATables(uint64_t a1)
{
  _BYTE *v2;

  v2 = MEM_NewClear(16);
  *(_QWORD *)a1 = v2;
  if (v2)
  {
    v2[4] = 1;
    **(_BYTE **)a1 = 1;
    *(_BYTE *)(*(_QWORD *)a1 + 5) = 1;
    *(_BYTE *)(*(_QWORD *)a1 + 1) = 1;
    *(_BYTE *)(*(_QWORD *)a1 + 6) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 2) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 7) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 3) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 8) = 1;
    *(_BYTE *)(*(_QWORD *)a1 + 11) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 10) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 9) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 12) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 15) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 14) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 13) = 6;
  }
  return v2 == 0;
}

BOOL InitEncMCBPCINTERTables(uint64_t a1)
{
  _BYTE *v2;

  v2 = MEM_NewClear(48);
  *(_QWORD *)a1 = v2;
  if (v2)
  {
    v2[20] = 1;
    **(_BYTE **)a1 = 1;
    *(_BYTE *)(*(_QWORD *)a1 + 18) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 15) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 14) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 12) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 4) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 1) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 19) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 8) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 2) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 11) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 9) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 7) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 3) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 5) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 6) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 17) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 16) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 13) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 10) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)a1 + 25) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 26) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 27) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 28) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 29) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 30) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 31) = 9;
    *(_BYTE *)(*(_QWORD *)a1 + 32) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 33) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 34) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 35) = 8;
    *(_BYTE *)(*(_QWORD *)a1 + 36) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 37) = 8;
    *(_BYTE *)(*(_QWORD *)a1 + 38) = 8;
    *(_BYTE *)(*(_QWORD *)a1 + 39) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 40) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 41) = 9;
    *(_BYTE *)(*(_QWORD *)a1 + 42) = 9;
    *(_BYTE *)(*(_QWORD *)a1 + 43) = 9;
    *(_BYTE *)(*(_QWORD *)a1 + 44) = 9;
  }
  return v2 == 0;
}

BOOL InitEncCBPYTables(uint64_t a1)
{
  _BYTE *v2;

  v2 = MEM_NewClear(32);
  *(_QWORD *)a1 = v2;
  if (v2)
  {
    *v2 = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 1) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 2) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 3) = 9;
    *(_BYTE *)(*(_QWORD *)a1 + 4) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 5) = 7;
    *(_BYTE *)(*(_QWORD *)a1 + 6) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 7) = 11;
    *(_BYTE *)(*(_QWORD *)a1 + 8) = 2;
    *(_BYTE *)(*(_QWORD *)a1 + 9) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 10) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 11) = 10;
    *(_BYTE *)(*(_QWORD *)a1 + 12) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 13) = 8;
    *(_BYTE *)(*(_QWORD *)a1 + 14) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 15) = 3;
    *(_BYTE *)(*(_QWORD *)a1 + 16) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 17) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 18) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 19) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 20) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 21) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 22) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 23) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 24) = 5;
    *(_BYTE *)(*(_QWORD *)a1 + 25) = 6;
    *(_BYTE *)(*(_QWORD *)a1 + 26) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 27) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 28) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 29) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 30) = 4;
    *(_BYTE *)(*(_QWORD *)a1 + 31) = 2;
  }
  return v2 == 0;
}

BOOL InitEncMVDTables(_QWORD *a1)
{
  void *v2;
  uint64_t i;

  v2 = MEM_NewClear(128);
  *a1 = v2;
  if (v2)
  {
    for (i = 0; i != 64; ++i)
    {
      *(_BYTE *)(*a1 + i) = byte_228575D35[i];
      *(_BYTE *)(*a1 + i + 64) = byte_228575D75[i];
    }
  }
  return v2 == 0;
}

BOOL InitEncTCTables(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  uint64_t j;
  unint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  BOOL v12;

  v2 = MEM_NewClear(67584);
  *a1 = v2;
  if (v2)
  {
    v3 = 0;
    for (i = 0; i != 64; ++i)
    {
      for (j = 0; j != 256; ++j)
      {
        *(_BYTE *)(*a1 + v3 + j) = 3;
        *(_BYTE *)(*a1 + v3 + j + 0x8000) = 7;
        *(_BYTE *)(*a1 + v3 + j + 0x4000) = 3;
        *(_BYTE *)(*a1 + v3 + j + 49152) = 7;
      }
      *(_QWORD *)(*a1 + 8 * i + 0x10000) = *a1 + (i << 8) + 128;
      *(_QWORD *)(*a1 + 8 * i + 66048) = *a1 + (i << 8) + 16512;
      *(_QWORD *)(*a1 + 8 * i + 66560) = *a1 + (i << 8) + 32896;
      *(_QWORD *)(*a1 + 8 * i + 67072) = *a1 + (i << 8) + 49280;
      v3 += 256;
    }
    v6 = 0;
    do
    {
      v7 = byte_228575DB5[v6 + 4];
      v8 = byte_228575DB5[v6];
      v9 = byte_228575DB5[v6 + 1];
      v10 = byte_228575DB5[v6 + 2];
      *(_BYTE *)(*(_QWORD *)(*a1 + (v8 << 9) + 8 * v9 + 0x10000) + v10) = 2 * v7;
      *(_BYTE *)(*(_QWORD *)(*a1 + (v8 << 9) + 8 * v9 + 0x10000) - v10) = (2 * v7) | 1;
      v11 = byte_228575DB5[v6 + 3];
      *(_BYTE *)(*(_QWORD *)(*a1 + (v8 << 9) + 8 * v9 + 66560) + v10) = v11;
      *(_BYTE *)(*(_QWORD *)(*a1 + (v8 << 9) + 8 * v9 + 66560) - v10) = v11;
      v12 = v6 >= 0x1F9;
      v6 += 5;
    }
    while (!v12);
  }
  return v2 == 0;
}

uint64_t KillHuffmanTables(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = *a1;
  if (*a1)
  {
    if (*(_QWORD *)v1)
    {
      MEM_Dispose(*(void **)v1);
      *(_QWORD *)v1 = 0;
      v1 = *a1;
    }
    v3 = *(void **)(v1 + 8);
    if (v3)
    {
      MEM_Dispose(v3);
      *(_QWORD *)(v1 + 8) = 0;
      v1 = *a1;
    }
    v4 = *(void **)(v1 + 16);
    if (v4)
    {
      MEM_Dispose(v4);
      *(_QWORD *)(v1 + 16) = 0;
      v1 = *a1;
    }
    v5 = *(void **)(v1 + 24);
    if (v5)
    {
      MEM_Dispose(v5);
      *(_QWORD *)(v1 + 24) = 0;
      v1 = *a1;
    }
    v6 = *(void **)(v1 + 32);
    if (v6)
    {
      MEM_Dispose(v6);
      *(_QWORD *)(v1 + 32) = 0;
      v1 = *a1;
    }
    v7 = *(void **)(v1 + 72);
    if (v7)
    {
      MEM_Dispose(v7);
      *(_QWORD *)(v1 + 72) = 0;
      v1 = *a1;
    }
    v8 = *(void **)(v1 + 40);
    if (v8)
    {
      MEM_Dispose(v8);
      *(_QWORD *)(v1 + 40) = 0;
      v1 = *a1;
    }
    v9 = *(void **)(v1 + 48);
    if (v9)
    {
      MEM_Dispose(v9);
      *(_QWORD *)(v1 + 48) = 0;
      v1 = *a1;
    }
    v10 = *(void **)(v1 + 56);
    if (v10)
    {
      MEM_Dispose(v10);
      *(_QWORD *)(v1 + 56) = 0;
      v1 = *a1;
    }
    v11 = *(void **)(v1 + 64);
    if (v11)
    {
      MEM_Dispose(v11);
      *(_QWORD *)(v1 + 64) = 0;
      v1 = *a1;
    }
    MEM_Dispose((void *)v1);
    *a1 = 0;
  }
  return 0;
}

uint64_t Mr_LaForgeS16(uint64_t result, uint64_t a2, int a3, int a4)
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  int16x8_t v7;

  if ((_DWORD)result && !a3)
  {
    if ((int)result >= 0)
      LOWORD(v4) = result;
    else
      v4 = -(int)result;
    v5 = (((2 * (__int16)v4) | 1) * a4 - ((1 - (_BYTE)a4) & 1u) + 4) >> 3;
    if ((int)result >= 0)
      result = v5;
    else
      result = -v5;
  }
  v6 = 0;
  v7 = vdupq_n_s16(result);
  do
  {
    *(int16x8_t *)(a2 + v6) = v7;
    v6 += 16;
  }
  while ((_DWORD)v6 != 128);
  return result;
}

uint64_t InitMacroBlockTables(int32x2_t **a1, int a2)
{
  uint64_t v4;
  int32x2_t *v5;
  uint64_t v6;
  int32x2_t v7;
  int64x2_t v8;
  int v9;
  uint64x2_t v10;
  int64x2_t v11;
  int32x2_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  int32x2_t v16;
  int64x2_t v17;
  int v18;
  uint64x2_t v19;
  int64x2_t v20;
  int32x2_t v21;
  uint64_t v22;
  _DWORD *v23;

  if (a2 != 128 && a2 != 352 && a2 != 176)
    return 1;
  if (*a1)
    return 0;
  v5 = (int32x2_t *)MEM_NewClear(432);
  *a1 = v5;
  if (!v5)
    return 1;
  v6 = 0;
  v7 = (int32x2_t)0x1000000000;
  v8 = (int64x2_t)xmmword_228576700;
  v9 = a2 + 32;
  v10 = (uint64x2_t)vdupq_n_s64(0x13uLL);
  v11 = vdupq_n_s64(2uLL);
  do
  {
    v12 = vadd_s32(v7, (int32x2_t)0x1000000010);
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v10, (uint64x2_t)v8)).u8[0] & 1) != 0)
      v5[v6].i32[0] = v12.i32[0] * v9 + 16;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x13uLL), *(uint64x2_t *)&v8)).i32[1] & 1) != 0)
      v5[v6].i32[1] = v12.i32[1] * v9 + 16;
    v8 = vaddq_s64(v8, v11);
    v7 = vadd_s32(v7, (int32x2_t)0x2000000020);
    ++v6;
  }
  while (v6 != 10);
  v13 = 0;
  v14 = (_DWORD *)&v5[9] + 1;
  do
  {
    *v14++ = v13;
    v13 += 16;
  }
  while (v13 != 368);
  v15 = 0;
  v16 = (int32x2_t)0x800000000;
  v17 = (int64x2_t)xmmword_228576700;
  v18 = ((unsigned __int16)a2 >> 1) + 16;
  v19 = (uint64x2_t)vdupq_n_s64(0x13uLL);
  v20 = vdupq_n_s64(2uLL);
  do
  {
    v21 = vadd_s32(v16, (int32x2_t)0x800000008);
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v19, (uint64x2_t)v17)).u8[0] & 1) != 0)
      v5[v15 + 23].i32[1] = v21.i32[0] * v18 + 8;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x13uLL), *(uint64x2_t *)&v17)).i32[1] & 1) != 0)
      v5[v15 + 24].i32[0] = v21.i32[1] * v18 + 8;
    v17 = vaddq_s64(v17, v20);
    v16 = vadd_s32(v16, (int32x2_t)0x1000000010);
    ++v15;
  }
  while (v15 != 10);
  v22 = 0;
  v23 = (_DWORD *)&v5[42] + 1;
  do
  {
    *v23++ = v22;
    v22 += 8;
  }
  while (v22 != 184);
  v4 = 0;
  v5[21] = (int32x2_t)0x800000000;
  v5[22] = vadd_s32(vdup_n_s32(8 * a2), (int32x2_t)0x10800000100);
  return v4;
}

uint64_t InitMacroBlock(uint64_t *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*a1)
    return 0;
  v3 = MEM_NewClear(374);
  *a1 = (uint64_t)v3;
  if (v3)
  {
    v4 = 56;
    while (1)
    {
      *(_QWORD *)(*a1 + v4 - 48) = MEM_NewClear(128);
      if (!*(_QWORD *)(*a1 + v4 - 48))
        break;
      *(_QWORD *)(*a1 + v4) = MEM_NewClear(128);
      if (!*(_QWORD *)(*a1 + v4))
        break;
      *(_QWORD *)(*a1 + v4 + 48) = MEM_NewClear(128);
      v5 = *a1;
      if (!*(_QWORD *)(*a1 + v4 + 48))
        break;
      v4 += 8;
      if (v4 == 104)
      {
        result = 0;
        *(_BYTE *)(v5 + 153) = 31;
        *(_QWORD *)(v5 + 246) = 0;
        *(_OWORD *)(v5 + 310) = xmmword_228576710;
        *(_OWORD *)(v5 + 326) = xmmword_228576720;
        *(_QWORD *)&v6 = 0x100000001;
        *((_QWORD *)&v6 + 1) = 0x100000001;
        *(_OWORD *)(v5 + 342) = v6;
        *(_QWORD *)(v5 + 358) = 1;
        *(_DWORD *)(v5 + 366) = 0;
        return result;
      }
    }
  }
  return 1;
}

uint64_t KillMacroBlock(void **a1)
{
  uint64_t i;
  char *v3;
  void *v4;
  void *v5;
  void *v6;

  if (*a1)
  {
    for (i = 56; i != 104; i += 8)
    {
      v3 = (char *)*a1;
      v4 = *(void **)((char *)*a1 + i - 48);
      if (v4)
      {
        MEM_Dispose(v4);
        *(_QWORD *)((char *)*a1 + i - 48) = 0;
        v3 = (char *)*a1;
      }
      v5 = *(void **)&v3[i];
      if (v5)
      {
        MEM_Dispose(v5);
        *(_QWORD *)((char *)*a1 + i) = 0;
        v3 = (char *)*a1;
      }
      v6 = *(void **)&v3[i + 48];
      if (v6)
      {
        MEM_Dispose(v6);
        *(_QWORD *)((char *)*a1 + i + 48) = 0;
      }
    }
    MEM_Dispose(*a1);
    *a1 = 0;
  }
  return 0;
}

uint64_t ForwardDiffCharS16(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  _WORD *v5;

  v3 = 0;
  v4 = (unsigned __int8 *)(a2 + 3);
  do
  {
    v5 = (_WORD *)(result + v3);
    *v5 = *(_WORD *)(result + v3) - *(v4 - 3);
    v5[1] = *(_WORD *)(result + v3 + 2) - *(v4 - 2);
    v5[2] = *(_WORD *)(result + v3 + 4) - *(v4 - 1);
    v5[3] = *(_WORD *)(result + v3 + 6) - *v4;
    v5[4] = *(_WORD *)(result + v3 + 8) - v4[1];
    v5[5] = *(_WORD *)(result + v3 + 10) - v4[2];
    v5[6] = *(_WORD *)(result + v3 + 12) - v4[3];
    v5[7] = *(_WORD *)(result + v3 + 14) - v4[4];
    v3 += 16;
    v4 += a3;
  }
  while ((_DWORD)v3 != 128);
  return result;
}

uint64_t MC_ForYS16(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _WORD *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  _WORD *v24;

  v5 = (a5 >> 1) * a3 + (a4 >> 1);
  if (((a5 | a4) & 1) != 0)
  {
    if ((a4 & 1) == 0 || (a5 & 1) != 0)
    {
      v12 = a3;
      v13 = a3 + 1;
      v14 = a3 + 2;
      v15 = a3 + 5;
      v16 = a3 + 6;
      v17 = a3 + 7;
      if ((a4 & 1) != 0 || (a5 & 1) == 0)
      {
        v21 = 0;
        v22 = a3 + 3;
        v23 = (unsigned __int8 *)(v5 + a2 + 4);
        do
        {
          v24 = (_WORD *)(result + v21);
          *v24 = *(_WORD *)(result + v21)
               - ((*(v23 - 4) + *(v23 - 3) + v23[v12 - 4] + v23[v13 - 4] + 2) >> 2);
          v24[1] = *(_WORD *)(result + v21 + 2)
                 - ((*(v23 - 3) + *(v23 - 2) + v23[v13 - 4] + v23[v14 - 4] + 2) >> 2);
          v24[2] = *(_WORD *)(result + v21 + 4)
                 - ((*(v23 - 2) + *(v23 - 1) + v23[v14 - 4] + v23[v22 - 4] + 2) >> 2);
          v24[3] = *(_WORD *)(result + v21 + 6) - ((*(v23 - 1) + *v23 + v23[v22 - 4] + v23[v12] + 2) >> 2);
          v24[4] = *(_WORD *)(result + v21 + 8) - ((*v23 + v23[1] + v23[v12] + v23[v15 - 4] + 2) >> 2);
          v24[5] = *(_WORD *)(result + v21 + 10)
                 - ((v23[1] + v23[2] + v23[v15 - 4] + v23[v16 - 4] + 2) >> 2);
          v24[6] = *(_WORD *)(result + v21 + 12)
                 - ((v23[2] + v23[3] + v23[v16 - 4] + v23[v17 - 4] + 2) >> 2);
          v24[7] = *(_WORD *)(result + v21 + 14)
                 - ((v23[3] + v23[4] + v23[v17 - 4] + v23[v12 + 4] + 2) >> 2);
          v21 += 16;
          v23 += v12;
        }
        while ((_DWORD)v21 != 128);
      }
      else
      {
        v18 = 0;
        v19 = (unsigned __int8 *)(v5 + a2 + 3);
        do
        {
          v20 = (_WORD *)(result + v18);
          *v20 = *(_WORD *)(result + v18) - ((*(v19 - 3) + v19[a3 - 3] + 1) >> 1);
          v20[1] = *(_WORD *)(result + v18 + 2) - ((*(v19 - 2) + v19[v13 - 3] + 1) >> 1);
          v20[2] = *(_WORD *)(result + v18 + 4) - ((*(v19 - 1) + v19[v14 - 3] + 1) >> 1);
          v20[3] = *(_WORD *)(result + v18 + 6) - ((*v19 + v19[a3] + 1) >> 1);
          v20[4] = *(_WORD *)(result + v18 + 8) - ((v19[1] + v19[a3 + 1] + 1) >> 1);
          v20[5] = *(_WORD *)(result + v18 + 10) - ((v19[2] + v19[v15 - 3] + 1) >> 1);
          v20[6] = *(_WORD *)(result + v18 + 12) - ((v19[3] + v19[v16 - 3] + 1) >> 1);
          v20[7] = *(_WORD *)(result + v18 + 14) - ((v19[4] + v19[v17 - 3] + 1) >> 1);
          v18 += 16;
          v19 += a3;
        }
        while ((_DWORD)v18 != 128);
      }
    }
    else
    {
      v9 = 0;
      v10 = (unsigned __int8 *)(v5 + a2 + 4);
      do
      {
        v11 = (_WORD *)(result + v9);
        *v11 = *(_WORD *)(result + v9) - ((*(v10 - 4) + *(v10 - 3) + 1) >> 1);
        v11[1] = *(_WORD *)(result + v9 + 2) - ((*(v10 - 3) + *(v10 - 2) + 1) >> 1);
        v11[2] = *(_WORD *)(result + v9 + 4) - ((*(v10 - 2) + *(v10 - 1) + 1) >> 1);
        v11[3] = *(_WORD *)(result + v9 + 6) - ((*(v10 - 1) + *v10 + 1) >> 1);
        v11[4] = *(_WORD *)(result + v9 + 8) - ((*v10 + v10[1] + 1) >> 1);
        v11[5] = *(_WORD *)(result + v9 + 10) - ((v10[1] + v10[2] + 1) >> 1);
        v11[6] = *(_WORD *)(result + v9 + 12) - ((v10[2] + v10[3] + 1) >> 1);
        v11[7] = *(_WORD *)(result + v9 + 14) - ((v10[3] + v10[4] + 1) >> 1);
        v9 += 16;
        v10 += a3;
      }
      while ((_DWORD)v9 != 128);
    }
  }
  else
  {
    v6 = 0;
    v7 = (unsigned __int8 *)(v5 + a2 + 3);
    do
    {
      v8 = (_WORD *)(result + v6);
      *v8 = *(_WORD *)(result + v6) - *(v7 - 3);
      v8[1] = *(_WORD *)(result + v6 + 2) - *(v7 - 2);
      v8[2] = *(_WORD *)(result + v6 + 4) - *(v7 - 1);
      v8[3] = *(_WORD *)(result + v6 + 6) - *v7;
      v8[4] = *(_WORD *)(result + v6 + 8) - v7[1];
      v8[5] = *(_WORD *)(result + v6 + 10) - v7[2];
      v8[6] = *(_WORD *)(result + v6 + 12) - v7[3];
      v8[7] = *(_WORD *)(result + v6 + 14) - v7[4];
      v6 += 16;
      v7 += a3;
    }
    while ((_DWORD)v6 != 128);
  }
  return result;
}

uint64_t MC_ForUVS16(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _WORD *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  _WORD *v24;

  v5 = (a5 >> 2) * a3 + (a4 >> 2);
  if (((a5 | a4) & 3) != 0)
  {
    if ((a4 & 3) == 0 || (a5 & 3) != 0)
    {
      v12 = a3;
      v13 = a3 + 1;
      v14 = a3 + 2;
      v15 = a3 + 5;
      v16 = a3 + 6;
      v17 = a3 + 7;
      if ((a4 & 3) != 0 || (a5 & 3) == 0)
      {
        v21 = 0;
        v22 = a3 + 3;
        v23 = (unsigned __int8 *)(v5 + a2 + 4);
        do
        {
          v24 = (_WORD *)(result + v21);
          *v24 = *(_WORD *)(result + v21)
               - ((*(v23 - 4) + *(v23 - 3) + v23[v12 - 4] + v23[v13 - 4] + 2) >> 2);
          v24[1] = *(_WORD *)(result + v21 + 2)
                 - ((*(v23 - 3) + *(v23 - 2) + v23[v13 - 4] + v23[v14 - 4] + 2) >> 2);
          v24[2] = *(_WORD *)(result + v21 + 4)
                 - ((*(v23 - 2) + *(v23 - 1) + v23[v14 - 4] + v23[v22 - 4] + 2) >> 2);
          v24[3] = *(_WORD *)(result + v21 + 6) - ((*(v23 - 1) + *v23 + v23[v22 - 4] + v23[v12] + 2) >> 2);
          v24[4] = *(_WORD *)(result + v21 + 8) - ((*v23 + v23[1] + v23[v12] + v23[v15 - 4] + 2) >> 2);
          v24[5] = *(_WORD *)(result + v21 + 10)
                 - ((v23[1] + v23[2] + v23[v15 - 4] + v23[v16 - 4] + 2) >> 2);
          v24[6] = *(_WORD *)(result + v21 + 12)
                 - ((v23[2] + v23[3] + v23[v16 - 4] + v23[v17 - 4] + 2) >> 2);
          v24[7] = *(_WORD *)(result + v21 + 14)
                 - ((v23[3] + v23[4] + v23[v17 - 4] + v23[v12 + 4] + 2) >> 2);
          v21 += 16;
          v23 += v12;
        }
        while ((_DWORD)v21 != 128);
      }
      else
      {
        v18 = 0;
        v19 = (unsigned __int8 *)(v5 + a2 + 3);
        do
        {
          v20 = (_WORD *)(result + v18);
          *v20 = *(_WORD *)(result + v18) - ((*(v19 - 3) + v19[a3 - 3] + 1) >> 1);
          v20[1] = *(_WORD *)(result + v18 + 2) - ((*(v19 - 2) + v19[v13 - 3] + 1) >> 1);
          v20[2] = *(_WORD *)(result + v18 + 4) - ((*(v19 - 1) + v19[v14 - 3] + 1) >> 1);
          v20[3] = *(_WORD *)(result + v18 + 6) - ((*v19 + v19[a3] + 1) >> 1);
          v20[4] = *(_WORD *)(result + v18 + 8) - ((v19[1] + v19[a3 + 1] + 1) >> 1);
          v20[5] = *(_WORD *)(result + v18 + 10) - ((v19[2] + v19[v15 - 3] + 1) >> 1);
          v20[6] = *(_WORD *)(result + v18 + 12) - ((v19[3] + v19[v16 - 3] + 1) >> 1);
          v20[7] = *(_WORD *)(result + v18 + 14) - ((v19[4] + v19[v17 - 3] + 1) >> 1);
          v18 += 16;
          v19 += a3;
        }
        while ((_DWORD)v18 != 128);
      }
    }
    else
    {
      v6 = 0;
      v7 = (unsigned __int8 *)(v5 + a2 + 4);
      do
      {
        v8 = (_WORD *)(result + v6);
        *v8 = *(_WORD *)(result + v6) - ((*(v7 - 4) + *(v7 - 3) + 1) >> 1);
        v8[1] = *(_WORD *)(result + v6 + 2) - ((*(v7 - 3) + *(v7 - 2) + 1) >> 1);
        v8[2] = *(_WORD *)(result + v6 + 4) - ((*(v7 - 2) + *(v7 - 1) + 1) >> 1);
        v8[3] = *(_WORD *)(result + v6 + 6) - ((*(v7 - 1) + *v7 + 1) >> 1);
        v8[4] = *(_WORD *)(result + v6 + 8) - ((*v7 + v7[1] + 1) >> 1);
        v8[5] = *(_WORD *)(result + v6 + 10) - ((v7[1] + v7[2] + 1) >> 1);
        v8[6] = *(_WORD *)(result + v6 + 12) - ((v7[2] + v7[3] + 1) >> 1);
        v8[7] = *(_WORD *)(result + v6 + 14) - ((v7[3] + v7[4] + 1) >> 1);
        v6 += 16;
        v7 += a3;
      }
      while ((_DWORD)v6 != 128);
    }
  }
  else
  {
    v9 = 0;
    v10 = (unsigned __int8 *)(v5 + a2 + 3);
    do
    {
      v11 = (_WORD *)(result + v9);
      *v11 = *(_WORD *)(result + v9) - *(v10 - 3);
      v11[1] = *(_WORD *)(result + v9 + 2) - *(v10 - 2);
      v11[2] = *(_WORD *)(result + v9 + 4) - *(v10 - 1);
      v11[3] = *(_WORD *)(result + v9 + 6) - *v10;
      v11[4] = *(_WORD *)(result + v9 + 8) - v10[1];
      v11[5] = *(_WORD *)(result + v9 + 10) - v10[2];
      v11[6] = *(_WORD *)(result + v9 + 12) - v10[3];
      v11[7] = *(_WORD *)(result + v9 + 14) - v10[4];
      v9 += 16;
      v10 += a3;
    }
    while ((_DWORD)v9 != 128);
  }
  return result;
}

uint64_t MC_InvYS16(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 *v10;
  unsigned __int8 *v11;
  int v12;
  _BYTE *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 *v24;
  __int16 *v25;
  _BYTE *v26;
  signed int v27;
  signed int v28;
  signed int v29;
  signed int v30;
  signed int v31;
  signed int v32;
  signed int v33;
  signed int v34;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int16 *v62;
  _BYTE *v63;
  unsigned __int8 *v64;
  signed int v65;
  signed int v66;
  signed int v67;
  signed int v68;
  signed int v69;
  signed int v70;
  signed int v71;
  signed int v72;
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
  __int16 *v93;
  _BYTE *v94;
  unsigned __int8 *v95;
  signed int v96;
  signed int v97;
  signed int v98;
  signed int v99;
  signed int v100;
  signed int v101;
  signed int v102;
  signed int v103;

  v6 = (a6 >> 1) * a4 + (a5 >> 1);
  v7 = a2 + v6;
  if (((a6 | a5) & 1) != 0)
  {
    v21 = a6 & 1;
    if ((a5 & 1) == 0 || (a6 & 1) != 0)
    {
      v35 = v6;
      v36 = a4;
      v37 = a4 + 1;
      v38 = a4 + 2;
      v39 = a4 + 3;
      v40 = a4 + 4;
      v41 = a4 + 5;
      v42 = a4 + 6;
      v43 = a4 + 7;
      if ((a5 & 1) != 0 || !v21)
      {
        v73 = 0;
        v74 = 0;
        v75 = v35 + v37;
        v76 = v35 + v38;
        v77 = v35 + v39;
        v78 = v35 + v40;
        v79 = v35 + v41;
        v80 = v35 + a4 + 8;
        v81 = v35 + v43;
        v82 = v35 + v42;
        v83 = a2 + v36 + v35;
        v84 = a2 + v75;
        v85 = a2 + v76;
        v86 = a3 + 3;
        v87 = a2 + v77;
        v88 = a2 + v78;
        v89 = a2 + v79;
        v90 = a2 + v80;
        v91 = a2 + v81;
        v92 = a2 + v82;
        do
        {
          v93 = (__int16 *)(result + v74);
          v94 = (_BYTE *)(v86 + v73);
          v95 = (unsigned __int8 *)(v7 + v73);
          v96 = *(__int16 *)(result + v74)
              + ((*(unsigned __int8 *)(v7 + v73)
                + *(unsigned __int8 *)(v83 + v73)
                + *(unsigned __int8 *)(v7 + v73 + 1)
                + *(unsigned __int8 *)(v84 + v73)
                + 2) >> 2);
          if (v96 >= 255)
            v96 = 255;
          *(v94 - 3) = v96 & ~(v96 >> 31);
          v97 = v93[1]
              + ((v95[1] + *(unsigned __int8 *)(v84 + v73) + v95[2] + *(unsigned __int8 *)(v85 + v73) + 2) >> 2);
          if (v97 >= 255)
            v97 = 255;
          *(v94 - 2) = v97 & ~(v97 >> 31);
          v98 = v93[2]
              + ((v95[2] + *(unsigned __int8 *)(v85 + v73) + v95[3] + *(unsigned __int8 *)(v87 + v73) + 2) >> 2);
          if (v98 >= 255)
            v98 = 255;
          *(v94 - 1) = v98 & ~(v98 >> 31);
          v99 = v93[3]
              + ((v95[3] + *(unsigned __int8 *)(v87 + v73) + v95[4] + *(unsigned __int8 *)(v88 + v73) + 2) >> 2);
          if (v99 >= 255)
            v99 = 255;
          *v94 = v99 & ~(v99 >> 31);
          v100 = v93[4]
               + ((v95[4] + *(unsigned __int8 *)(v88 + v73) + v95[5] + *(unsigned __int8 *)(v89 + v73) + 2) >> 2);
          if (v100 >= 255)
            v100 = 255;
          v94[1] = v100 & ~(v100 >> 31);
          v101 = v93[5]
               + ((v95[5] + *(unsigned __int8 *)(v89 + v73) + v95[6] + *(unsigned __int8 *)(v92 + v73) + 2) >> 2);
          if (v101 >= 255)
            v101 = 255;
          v94[2] = v101 & ~(v101 >> 31);
          v102 = v93[6]
               + ((v95[6] + *(unsigned __int8 *)(v92 + v73) + v95[7] + *(unsigned __int8 *)(v91 + v73) + 2) >> 2);
          if (v102 >= 255)
            v102 = 255;
          v94[3] = v102 & ~(v102 >> 31);
          v103 = v93[7]
               + ((v95[7] + *(unsigned __int8 *)(v91 + v73) + v95[8] + *(unsigned __int8 *)(v90 + v73) + 2) >> 2);
          if (v103 >= 255)
            v103 = 255;
          v94[4] = v103 & ~(v103 >> 31);
          v74 += 16;
          v73 += v36;
        }
        while ((_DWORD)v74 != 128);
      }
      else
      {
        v44 = 0;
        v45 = 0;
        v46 = v35 + v37;
        v47 = v35 + v38;
        v48 = v35 + v39;
        v49 = v35 + v40;
        v50 = v35 + v41;
        v51 = v35 + v43;
        v52 = v35 + v42;
        v53 = a2 + v36 + v35;
        v54 = a2 + v46;
        v55 = a2 + v47;
        v56 = a3 + 3;
        v57 = a2 + v48;
        v58 = a2 + v49;
        v59 = a2 + v50;
        v60 = a2 + v51;
        v61 = a2 + v52;
        do
        {
          v62 = (__int16 *)(result + v45);
          v63 = (_BYTE *)(v56 + v44);
          v64 = (unsigned __int8 *)(v7 + v44);
          v65 = *(__int16 *)(result + v45)
              + ((*(unsigned __int8 *)(v7 + v44) + *(unsigned __int8 *)(v53 + v44) + 1) >> 1);
          if (v65 >= 255)
            v65 = 255;
          *(v63 - 3) = v65 & ~(v65 >> 31);
          v66 = v62[1] + ((v64[1] + *(unsigned __int8 *)(v54 + v44) + 1) >> 1);
          if (v66 >= 255)
            v66 = 255;
          *(v63 - 2) = v66 & ~(v66 >> 31);
          v67 = v62[2] + ((v64[2] + *(unsigned __int8 *)(v55 + v44) + 1) >> 1);
          if (v67 >= 255)
            v67 = 255;
          *(v63 - 1) = v67 & ~(v67 >> 31);
          v68 = v62[3] + ((v64[3] + *(unsigned __int8 *)(v57 + v44) + 1) >> 1);
          if (v68 >= 255)
            v68 = 255;
          *v63 = v68 & ~(v68 >> 31);
          v69 = v62[4] + ((v64[4] + *(unsigned __int8 *)(v58 + v44) + 1) >> 1);
          if (v69 >= 255)
            v69 = 255;
          v63[1] = v69 & ~(v69 >> 31);
          v70 = v62[5] + ((v64[5] + *(unsigned __int8 *)(v59 + v44) + 1) >> 1);
          if (v70 >= 255)
            v70 = 255;
          v63[2] = v70 & ~(v70 >> 31);
          v71 = v62[6] + ((v64[6] + *(unsigned __int8 *)(v61 + v44) + 1) >> 1);
          if (v71 >= 255)
            v71 = 255;
          v63[3] = v71 & ~(v71 >> 31);
          v72 = v62[7] + ((v64[7] + *(unsigned __int8 *)(v60 + v44) + 1) >> 1);
          if (v72 >= 255)
            v72 = 255;
          v63[4] = v72 & ~(v72 >> 31);
          v45 += 16;
          v44 += v36;
        }
        while ((_DWORD)v45 != 128);
      }
    }
    else
    {
      v22 = 0;
      v23 = 0;
      do
      {
        v24 = (unsigned __int8 *)(v7 + v22);
        v25 = (__int16 *)(result + v23);
        v26 = (_BYTE *)(a3 + 4 + v22);
        v27 = *(__int16 *)(result + v23)
            + ((*(unsigned __int8 *)(v7 + v22) + *(unsigned __int8 *)(v7 + v22 + 1) + 1) >> 1);
        if (v27 >= 255)
          v27 = 255;
        *(_BYTE *)(a3 + v22) = v27 & ~(v27 >> 31);
        v28 = v25[1] + ((v24[1] + v24[2] + 1) >> 1);
        if (v28 >= 255)
          v28 = 255;
        *(v26 - 3) = v28 & ~(v28 >> 31);
        v29 = v25[2] + ((v24[2] + v24[3] + 1) >> 1);
        if (v29 >= 255)
          v29 = 255;
        *(v26 - 2) = v29 & ~(v29 >> 31);
        v30 = v25[3] + ((v24[3] + v24[4] + 1) >> 1);
        if (v30 >= 255)
          v30 = 255;
        *(v26 - 1) = v30 & ~(v30 >> 31);
        v31 = v25[4] + ((v24[4] + v24[5] + 1) >> 1);
        if (v31 >= 255)
          v31 = 255;
        *v26 = v31 & ~(v31 >> 31);
        v32 = v25[5] + ((v24[5] + v24[6] + 1) >> 1);
        if (v32 >= 255)
          v32 = 255;
        v26[1] = v32 & ~(v32 >> 31);
        v33 = v25[6] + ((v24[6] + v24[7] + 1) >> 1);
        if (v33 >= 255)
          v33 = 255;
        v26[2] = v33 & ~(v33 >> 31);
        v34 = v25[7] + ((v24[7] + v24[8] + 1) >> 1);
        if (v34 >= 255)
          v34 = 255;
        v26[3] = v34 & ~(v34 >> 31);
        v23 += 16;
        v22 += a4;
      }
      while ((_DWORD)v23 != 128);
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (__int16 *)(result + v9);
      v11 = (unsigned __int8 *)(v7 + v8);
      v12 = *(unsigned __int8 *)(v7 + v8) + *(__int16 *)(result + v9);
      if (v12 >= 255)
        v12 = 255;
      v13 = (_BYTE *)(a3 + 3 + v8);
      *(_BYTE *)(a3 + v8) = v12 & ~(v12 >> 31);
      v14 = v11[1] + v10[1];
      if (v14 >= 255)
        v14 = 255;
      *(v13 - 2) = v14 & ~(v14 >> 31);
      v15 = v11[2] + v10[2];
      if (v15 >= 255)
        v15 = 255;
      *(v13 - 1) = v15 & ~(v15 >> 31);
      v16 = v11[3] + v10[3];
      if (v16 >= 255)
        v16 = 255;
      *v13 = v16 & ~(v16 >> 31);
      v17 = v11[4] + v10[4];
      if (v17 >= 255)
        v17 = 255;
      v13[1] = v17 & ~(v17 >> 31);
      v18 = v11[5] + v10[5];
      if (v18 >= 255)
        v18 = 255;
      v13[2] = v18 & ~(v18 >> 31);
      v19 = v11[6] + v10[6];
      if (v19 >= 255)
        v19 = 255;
      v13[3] = v19 & ~(v19 >> 31);
      v20 = v11[7] + v10[7];
      if (v20 >= 255)
        v20 = 255;
      v13[4] = v20 & ~(v20 >> 31);
      v9 += 16;
      v8 += a4;
    }
    while ((_DWORD)v9 != 128);
  }
  return result;
}

uint64_t MC_InvUVS16(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  __int16 *v13;
  _BYTE *v14;
  signed int v15;
  signed int v16;
  signed int v17;
  signed int v18;
  signed int v19;
  signed int v20;
  signed int v21;
  signed int v22;
  uint64_t v23;
  uint64_t v24;
  __int16 *v25;
  unsigned __int8 *v26;
  int v27;
  _BYTE *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  __int16 *v63;
  _BYTE *v64;
  unsigned __int8 *v65;
  signed int v66;
  signed int v67;
  signed int v68;
  signed int v69;
  signed int v70;
  signed int v71;
  signed int v72;
  signed int v73;
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
  uint64_t v93;
  __int16 *v94;
  _BYTE *v95;
  unsigned __int8 *v96;
  signed int v97;
  signed int v98;
  signed int v99;
  signed int v100;
  signed int v101;
  signed int v102;
  signed int v103;
  signed int v104;

  v6 = (a6 >> 2) * a4 + (a5 >> 2);
  v7 = a2 + v6;
  if (((a6 | a5) & 3) != 0)
  {
    v8 = a6 & 3;
    v9 = a5 & 3;
    if ((a5 & 3) == 0 || (a6 & 3) != 0)
    {
      v36 = v6;
      v37 = a4;
      v38 = a4 + 1;
      v39 = a4 + 2;
      v40 = a4 + 3;
      v41 = a4 + 4;
      v42 = a4 + 5;
      v43 = a4 + 6;
      v44 = a4 + 7;
      if (v9 || !v8)
      {
        v74 = 0;
        v75 = 0;
        v76 = v36 + v38;
        v77 = v36 + v39;
        v78 = v36 + v40;
        v79 = v36 + v41;
        v80 = v36 + v42;
        v81 = v36 + a4 + 8;
        v82 = v36 + v44;
        v83 = v36 + v43;
        v84 = a2 + v37 + v36;
        v85 = a2 + v76;
        v86 = a2 + v77;
        v87 = a3 + 3;
        v88 = a2 + v78;
        v89 = a2 + v79;
        v90 = a2 + v80;
        v91 = a2 + v81;
        v92 = a2 + v82;
        v93 = a2 + v83;
        do
        {
          v94 = (__int16 *)(result + v75);
          v95 = (_BYTE *)(v87 + v74);
          v96 = (unsigned __int8 *)(v7 + v74);
          v97 = *(__int16 *)(result + v75)
              + ((*(unsigned __int8 *)(v7 + v74)
                + *(unsigned __int8 *)(v84 + v74)
                + *(unsigned __int8 *)(v7 + v74 + 1)
                + *(unsigned __int8 *)(v85 + v74)
                + 2) >> 2);
          if (v97 >= 255)
            v97 = 255;
          *(v95 - 3) = v97 & ~(v97 >> 31);
          v98 = v94[1]
              + ((v96[1] + *(unsigned __int8 *)(v85 + v74) + v96[2] + *(unsigned __int8 *)(v86 + v74) + 2) >> 2);
          if (v98 >= 255)
            v98 = 255;
          *(v95 - 2) = v98 & ~(v98 >> 31);
          v99 = v94[2]
              + ((v96[2] + *(unsigned __int8 *)(v86 + v74) + v96[3] + *(unsigned __int8 *)(v88 + v74) + 2) >> 2);
          if (v99 >= 255)
            v99 = 255;
          *(v95 - 1) = v99 & ~(v99 >> 31);
          v100 = v94[3]
               + ((v96[3] + *(unsigned __int8 *)(v88 + v74) + v96[4] + *(unsigned __int8 *)(v89 + v74) + 2) >> 2);
          if (v100 >= 255)
            v100 = 255;
          *v95 = v100 & ~(v100 >> 31);
          v101 = v94[4]
               + ((v96[4] + *(unsigned __int8 *)(v89 + v74) + v96[5] + *(unsigned __int8 *)(v90 + v74) + 2) >> 2);
          if (v101 >= 255)
            v101 = 255;
          v95[1] = v101 & ~(v101 >> 31);
          v102 = v94[5]
               + ((v96[5] + *(unsigned __int8 *)(v90 + v74) + v96[6] + *(unsigned __int8 *)(v93 + v74) + 2) >> 2);
          if (v102 >= 255)
            v102 = 255;
          v95[2] = v102 & ~(v102 >> 31);
          v103 = v94[6]
               + ((v96[6] + *(unsigned __int8 *)(v93 + v74) + v96[7] + *(unsigned __int8 *)(v92 + v74) + 2) >> 2);
          if (v103 >= 255)
            v103 = 255;
          v95[3] = v103 & ~(v103 >> 31);
          v104 = v94[7]
               + ((v96[7] + *(unsigned __int8 *)(v92 + v74) + v96[8] + *(unsigned __int8 *)(v91 + v74) + 2) >> 2);
          if (v104 >= 255)
            v104 = 255;
          v95[4] = v104 & ~(v104 >> 31);
          v75 += 16;
          v74 += v37;
        }
        while ((_DWORD)v75 != 128);
      }
      else
      {
        v45 = 0;
        v46 = 0;
        v47 = v36 + v38;
        v48 = v36 + v39;
        v49 = v36 + v40;
        v50 = v36 + v41;
        v51 = v36 + v42;
        v52 = v36 + v44;
        v53 = v36 + v43;
        v54 = a2 + v37 + v36;
        v55 = a2 + v47;
        v56 = a2 + v48;
        v57 = a3 + 3;
        v58 = a2 + v49;
        v59 = a2 + v50;
        v60 = a2 + v51;
        v61 = a2 + v52;
        v62 = a2 + v53;
        do
        {
          v63 = (__int16 *)(result + v46);
          v64 = (_BYTE *)(v57 + v45);
          v65 = (unsigned __int8 *)(v7 + v45);
          v66 = *(__int16 *)(result + v46)
              + ((*(unsigned __int8 *)(v7 + v45) + *(unsigned __int8 *)(v54 + v45) + 1) >> 1);
          if (v66 >= 255)
            v66 = 255;
          *(v64 - 3) = v66 & ~(v66 >> 31);
          v67 = v63[1] + ((v65[1] + *(unsigned __int8 *)(v55 + v45) + 1) >> 1);
          if (v67 >= 255)
            v67 = 255;
          *(v64 - 2) = v67 & ~(v67 >> 31);
          v68 = v63[2] + ((v65[2] + *(unsigned __int8 *)(v56 + v45) + 1) >> 1);
          if (v68 >= 255)
            v68 = 255;
          *(v64 - 1) = v68 & ~(v68 >> 31);
          v69 = v63[3] + ((v65[3] + *(unsigned __int8 *)(v58 + v45) + 1) >> 1);
          if (v69 >= 255)
            v69 = 255;
          *v64 = v69 & ~(v69 >> 31);
          v70 = v63[4] + ((v65[4] + *(unsigned __int8 *)(v59 + v45) + 1) >> 1);
          if (v70 >= 255)
            v70 = 255;
          v64[1] = v70 & ~(v70 >> 31);
          v71 = v63[5] + ((v65[5] + *(unsigned __int8 *)(v60 + v45) + 1) >> 1);
          if (v71 >= 255)
            v71 = 255;
          v64[2] = v71 & ~(v71 >> 31);
          v72 = v63[6] + ((v65[6] + *(unsigned __int8 *)(v62 + v45) + 1) >> 1);
          if (v72 >= 255)
            v72 = 255;
          v64[3] = v72 & ~(v72 >> 31);
          v73 = v63[7] + ((v65[7] + *(unsigned __int8 *)(v61 + v45) + 1) >> 1);
          if (v73 >= 255)
            v73 = 255;
          v64[4] = v73 & ~(v73 >> 31);
          v46 += 16;
          v45 += v37;
        }
        while ((_DWORD)v46 != 128);
      }
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = (unsigned __int8 *)(v7 + v10);
        v13 = (__int16 *)(result + v11);
        v14 = (_BYTE *)(a3 + 4 + v10);
        v15 = *(__int16 *)(result + v11)
            + ((*(unsigned __int8 *)(v7 + v10) + *(unsigned __int8 *)(v7 + v10 + 1) + 1) >> 1);
        if (v15 >= 255)
          v15 = 255;
        *(_BYTE *)(a3 + v10) = v15 & ~(v15 >> 31);
        v16 = v13[1] + ((v12[1] + v12[2] + 1) >> 1);
        if (v16 >= 255)
          v16 = 255;
        *(v14 - 3) = v16 & ~(v16 >> 31);
        v17 = v13[2] + ((v12[2] + v12[3] + 1) >> 1);
        if (v17 >= 255)
          v17 = 255;
        *(v14 - 2) = v17 & ~(v17 >> 31);
        v18 = v13[3] + ((v12[3] + v12[4] + 1) >> 1);
        if (v18 >= 255)
          v18 = 255;
        *(v14 - 1) = v18 & ~(v18 >> 31);
        v19 = v13[4] + ((v12[4] + v12[5] + 1) >> 1);
        if (v19 >= 255)
          v19 = 255;
        *v14 = v19 & ~(v19 >> 31);
        v20 = v13[5] + ((v12[5] + v12[6] + 1) >> 1);
        if (v20 >= 255)
          v20 = 255;
        v14[1] = v20 & ~(v20 >> 31);
        v21 = v13[6] + ((v12[6] + v12[7] + 1) >> 1);
        if (v21 >= 255)
          v21 = 255;
        v14[2] = v21 & ~(v21 >> 31);
        v22 = v13[7] + ((v12[7] + v12[8] + 1) >> 1);
        if (v22 >= 255)
          v22 = 255;
        v14[3] = v22 & ~(v22 >> 31);
        v11 += 16;
        v10 += a4;
      }
      while ((_DWORD)v11 != 128);
    }
  }
  else
  {
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = (__int16 *)(result + v24);
      v26 = (unsigned __int8 *)(v7 + v23);
      v27 = *(unsigned __int8 *)(v7 + v23) + *(__int16 *)(result + v24);
      if (v27 >= 255)
        v27 = 255;
      v28 = (_BYTE *)(a3 + 3 + v23);
      *(_BYTE *)(a3 + v23) = v27 & ~(v27 >> 31);
      v29 = v26[1] + v25[1];
      if (v29 >= 255)
        v29 = 255;
      *(v28 - 2) = v29 & ~(v29 >> 31);
      v30 = v26[2] + v25[2];
      if (v30 >= 255)
        v30 = 255;
      *(v28 - 1) = v30 & ~(v30 >> 31);
      v31 = v26[3] + v25[3];
      if (v31 >= 255)
        v31 = 255;
      *v28 = v31 & ~(v31 >> 31);
      v32 = v26[4] + v25[4];
      if (v32 >= 255)
        v32 = 255;
      v28[1] = v32 & ~(v32 >> 31);
      v33 = v26[5] + v25[5];
      if (v33 >= 255)
        v33 = 255;
      v28[2] = v33 & ~(v33 >> 31);
      v34 = v26[6] + v25[6];
      if (v34 >= 255)
        v34 = 255;
      v28[3] = v34 & ~(v34 >> 31);
      v35 = v26[7] + v25[7];
      if (v35 >= 255)
        v35 = 255;
      v28[4] = v35 & ~(v35 >> 31);
      v24 += 16;
      v23 += a4;
    }
    while ((_DWORD)v24 != 128);
  }
  return result;
}

uint64_t MC_InvUV4S16(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 *v10;
  unsigned __int8 *v11;
  int v12;
  _BYTE *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
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
  uint64_t v38;
  uint64_t v39;
  __int16 *v40;
  _BYTE *v41;
  unsigned __int8 *v42;
  signed int v43;
  signed int v44;
  signed int v45;
  signed int v46;
  signed int v47;
  signed int v48;
  signed int v49;
  signed int v50;
  uint64_t v51;
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
  uint64_t v70;
  __int16 *v71;
  _BYTE *v72;
  unsigned __int8 *v73;
  signed int v74;
  signed int v75;
  signed int v76;
  signed int v77;
  signed int v78;
  signed int v79;
  signed int v80;
  signed int v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 *v84;
  __int16 *v85;
  _BYTE *v86;
  signed int v87;
  signed int v88;
  signed int v89;
  signed int v90;
  signed int v91;
  signed int v92;
  signed int v93;
  signed int v94;

  v6 = (a6 >> 4) * a4 + (a5 >> 4);
  v7 = a2 + v6;
  if ((a5 & 0xF) == 0
    || (((_BYTE)a5 - 1) & 0xF) == 0
    || (((_BYTE)a5 + 14) & 0xF) == 0
    || (((_BYTE)a5 + 1) & 0xF) == 0
    || (((_BYTE)a5 + 2) & 0xF) == 0)
  {
    if ((a6 & 0xF) == 0
      || (((_BYTE)a6 - 1) & 0xF) == 0
      || (((_BYTE)a6 + 14) & 0xF) == 0
      || (((_BYTE)a6 + 1) & 0xF) == 0
      || (((_BYTE)a6 + 2) & 0xF) == 0)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = (__int16 *)(result + v9);
        v11 = (unsigned __int8 *)(v7 + v8);
        v12 = *(unsigned __int8 *)(v7 + v8) + *(__int16 *)(result + v9);
        if (v12 >= 255)
          v12 = 255;
        v13 = (_BYTE *)(a3 + 3 + v8);
        *(_BYTE *)(a3 + v8) = v12 & ~(v12 >> 31);
        v14 = v11[1] + v10[1];
        if (v14 >= 255)
          v14 = 255;
        *(v13 - 2) = v14 & ~(v14 >> 31);
        v15 = v11[2] + v10[2];
        if (v15 >= 255)
          v15 = 255;
        *(v13 - 1) = v15 & ~(v15 >> 31);
        v16 = v11[3] + v10[3];
        if (v16 >= 255)
          v16 = 255;
        *v13 = v16 & ~(v16 >> 31);
        v17 = v11[4] + v10[4];
        if (v17 >= 255)
          v17 = 255;
        v13[1] = v17 & ~(v17 >> 31);
        v18 = v11[5] + v10[5];
        if (v18 >= 255)
          v18 = 255;
        v13[2] = v18 & ~(v18 >> 31);
        v19 = v11[6] + v10[6];
        if (v19 >= 255)
          v19 = 255;
        v13[3] = v19 & ~(v19 >> 31);
        v20 = v11[7] + v10[7];
        if (v20 >= 255)
          v20 = 255;
        v13[4] = v20 & ~(v20 >> 31);
        v9 += 16;
        v8 += a4;
      }
      while ((_DWORD)v9 != 128);
      return result;
    }
    if ((a5 & 0xF) == 0 || (((_BYTE)a5 - 1) & 0xF) == 0)
      goto LABEL_44;
  }
  if ((((_BYTE)a5 + 14) & 0xF) == 0 || (((_BYTE)a5 + 1) & 0xF) == 0)
    goto LABEL_44;
  if ((((_BYTE)a5 + 2) & 0xF) != 0
    && ((a6 & 0xF) == 0
     || (((_BYTE)a6 - 1) & 0xF) == 0
     || (((_BYTE)a6 + 14) & 0xF) == 0
     || (((_BYTE)a6 + 1) & 0xF) == 0
     || (((_BYTE)a6 + 2) & 0xF) == 0))
  {
    v82 = 0;
    v83 = 0;
    do
    {
      v84 = (unsigned __int8 *)(v7 + v82);
      v85 = (__int16 *)(result + v83);
      v86 = (_BYTE *)(a3 + 4 + v82);
      v87 = *(__int16 *)(result + v83)
          + ((*(unsigned __int8 *)(v7 + v82) + *(unsigned __int8 *)(v7 + v82 + 1) + 1) >> 1);
      if (v87 >= 255)
        v87 = 255;
      *(_BYTE *)(a3 + v82) = v87 & ~(v87 >> 31);
      v88 = v85[1] + ((v84[1] + v84[2] + 1) >> 1);
      if (v88 >= 255)
        v88 = 255;
      *(v86 - 3) = v88 & ~(v88 >> 31);
      v89 = v85[2] + ((v84[2] + v84[3] + 1) >> 1);
      if (v89 >= 255)
        v89 = 255;
      *(v86 - 2) = v89 & ~(v89 >> 31);
      v90 = v85[3] + ((v84[3] + v84[4] + 1) >> 1);
      if (v90 >= 255)
        v90 = 255;
      *(v86 - 1) = v90 & ~(v90 >> 31);
      v91 = v85[4] + ((v84[4] + v84[5] + 1) >> 1);
      if (v91 >= 255)
        v91 = 255;
      *v86 = v91 & ~(v91 >> 31);
      v92 = v85[5] + ((v84[5] + v84[6] + 1) >> 1);
      if (v92 >= 255)
        v92 = 255;
      v86[1] = v92 & ~(v92 >> 31);
      v93 = v85[6] + ((v84[6] + v84[7] + 1) >> 1);
      if (v93 >= 255)
        v93 = 255;
      v86[2] = v93 & ~(v93 >> 31);
      v94 = v85[7] + ((v84[7] + v84[8] + 1) >> 1);
      if (v94 >= 255)
        v94 = 255;
      v86[3] = v94 & ~(v94 >> 31);
      v83 += 16;
      v82 += a4;
    }
    while ((_DWORD)v83 != 128);
    return result;
  }
  if ((((_BYTE)a5 + 1) & 0xF) != 0)
  {
    if ((((_BYTE)a5 + 2) & 0xF) != 0 || (a6 & 0xF) == 0)
    {
LABEL_68:
      v51 = 0;
      v52 = 0;
      v53 = v6 + a4 + 1;
      v54 = v6 + a4 + 2;
      v55 = v6 + a4 + 3;
      v56 = v6 + a4 + 4;
      v57 = v6 + a4 + 5;
      v58 = v6 + a4 + 8;
      v59 = v6 + a4 + 7;
      v60 = v6 + a4 + 6;
      v61 = a2 + v6 + a4;
      v62 = a2 + v53;
      v63 = a2 + v54;
      v64 = a3 + 3;
      v65 = a2 + v55;
      v66 = a2 + v56;
      v67 = a2 + v57;
      v68 = a2 + v58;
      v69 = a2 + v59;
      v70 = a2 + v60;
      do
      {
        v71 = (__int16 *)(result + v52);
        v72 = (_BYTE *)(v64 + v51);
        v73 = (unsigned __int8 *)(v7 + v51);
        v74 = *(__int16 *)(result + v52)
            + ((*(unsigned __int8 *)(v7 + v51)
              + *(unsigned __int8 *)(v61 + v51)
              + *(unsigned __int8 *)(v7 + v51 + 1)
              + *(unsigned __int8 *)(v62 + v51)
              + 2) >> 2);
        if (v74 >= 255)
          v74 = 255;
        *(v72 - 3) = v74 & ~(v74 >> 31);
        v75 = v71[1]
            + ((v73[1] + *(unsigned __int8 *)(v62 + v51) + v73[2] + *(unsigned __int8 *)(v63 + v51) + 2) >> 2);
        if (v75 >= 255)
          v75 = 255;
        *(v72 - 2) = v75 & ~(v75 >> 31);
        v76 = v71[2]
            + ((v73[2] + *(unsigned __int8 *)(v63 + v51) + v73[3] + *(unsigned __int8 *)(v65 + v51) + 2) >> 2);
        if (v76 >= 255)
          v76 = 255;
        *(v72 - 1) = v76 & ~(v76 >> 31);
        v77 = v71[3]
            + ((v73[3] + *(unsigned __int8 *)(v65 + v51) + v73[4] + *(unsigned __int8 *)(v66 + v51) + 2) >> 2);
        if (v77 >= 255)
          v77 = 255;
        *v72 = v77 & ~(v77 >> 31);
        v78 = v71[4]
            + ((v73[4] + *(unsigned __int8 *)(v66 + v51) + v73[5] + *(unsigned __int8 *)(v67 + v51) + 2) >> 2);
        if (v78 >= 255)
          v78 = 255;
        v72[1] = v78 & ~(v78 >> 31);
        v79 = v71[5]
            + ((v73[5] + *(unsigned __int8 *)(v67 + v51) + v73[6] + *(unsigned __int8 *)(v70 + v51) + 2) >> 2);
        if (v79 >= 255)
          v79 = 255;
        v72[2] = v79 & ~(v79 >> 31);
        v80 = v71[6]
            + ((v73[6] + *(unsigned __int8 *)(v70 + v51) + v73[7] + *(unsigned __int8 *)(v69 + v51) + 2) >> 2);
        if (v80 >= 255)
          v80 = 255;
        v72[3] = v80 & ~(v80 >> 31);
        v81 = v71[7]
            + ((v73[7] + *(unsigned __int8 *)(v69 + v51) + v73[8] + *(unsigned __int8 *)(v68 + v51) + 2) >> 2);
        if (v81 >= 255)
          v81 = 255;
        v72[4] = v81 & ~(v81 >> 31);
        v52 += 16;
        v51 += a4;
      }
      while ((_DWORD)v52 != 128);
      return result;
    }
  }
  else
  {
LABEL_44:
    if ((a6 & 0xF) == 0)
      goto LABEL_68;
  }
  if ((((_BYTE)a6 - 1) & 0xF) == 0
    || (((_BYTE)a6 + 14) & 0xF) == 0
    || (((_BYTE)a6 + 1) & 0xF) == 0
    || (((_BYTE)a6 + 2) & 0xF) == 0)
  {
    goto LABEL_68;
  }
  v21 = 0;
  v22 = 0;
  v23 = v6 + a4 + 1;
  v24 = v6 + a4 + 2;
  v25 = v6 + a4 + 3;
  v26 = v6 + a4 + 4;
  v27 = v6 + a4 + 5;
  v28 = v6 + a4 + 7;
  v29 = v6 + a4 + 6;
  v30 = a2 + v6 + a4;
  v31 = a2 + v23;
  v32 = a2 + v24;
  v33 = a3 + 3;
  v34 = a2 + v25;
  v35 = a2 + v26;
  v36 = a4;
  v37 = a2 + v27;
  v38 = a2 + v28;
  v39 = a2 + v29;
  do
  {
    v40 = (__int16 *)(result + v22);
    v41 = (_BYTE *)(v33 + v21);
    v42 = (unsigned __int8 *)(v7 + v21);
    v43 = *(__int16 *)(result + v22)
        + ((*(unsigned __int8 *)(v7 + v21) + *(unsigned __int8 *)(v30 + v21) + 1) >> 1);
    if (v43 >= 255)
      v43 = 255;
    *(v41 - 3) = v43 & ~(v43 >> 31);
    v44 = v40[1] + ((v42[1] + *(unsigned __int8 *)(v31 + v21) + 1) >> 1);
    if (v44 >= 255)
      v44 = 255;
    *(v41 - 2) = v44 & ~(v44 >> 31);
    v45 = v40[2] + ((v42[2] + *(unsigned __int8 *)(v32 + v21) + 1) >> 1);
    if (v45 >= 255)
      v45 = 255;
    *(v41 - 1) = v45 & ~(v45 >> 31);
    v46 = v40[3] + ((v42[3] + *(unsigned __int8 *)(v34 + v21) + 1) >> 1);
    if (v46 >= 255)
      v46 = 255;
    *v41 = v46 & ~(v46 >> 31);
    v47 = v40[4] + ((v42[4] + *(unsigned __int8 *)(v35 + v21) + 1) >> 1);
    if (v47 >= 255)
      v47 = 255;
    v41[1] = v47 & ~(v47 >> 31);
    v48 = v40[5] + ((v42[5] + *(unsigned __int8 *)(v37 + v21) + 1) >> 1);
    if (v48 >= 255)
      v48 = 255;
    v41[2] = v48 & ~(v48 >> 31);
    v49 = v40[6] + ((v42[6] + *(unsigned __int8 *)(v39 + v21) + 1) >> 1);
    if (v49 >= 255)
      v49 = 255;
    v41[3] = v49 & ~(v49 >> 31);
    v50 = v40[7] + ((v42[7] + *(unsigned __int8 *)(v38 + v21) + 1) >> 1);
    if (v50 >= 255)
      v50 = 255;
    v41[4] = v50 & ~(v50 >> 31);
    v22 += 16;
    v21 += v36;
  }
  while ((_DWORD)v22 != 128);
  return result;
}

uint64_t Grab8x8CharS16(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  _WORD *v5;

  v3 = 0;
  v4 = (unsigned __int8 *)(a2 + 3);
  do
  {
    v5 = (_WORD *)(result + v3);
    *v5 = *(v4 - 3);
    v5[1] = *(v4 - 2);
    v5[2] = *(v4 - 1);
    v5[3] = *v4;
    v5[4] = v4[1];
    v5[5] = v4[2];
    v5[6] = v4[3];
    v5[7] = v4[4];
    v3 += 16;
    v4 += a3;
  }
  while ((_DWORD)v3 != 128);
  return result;
}

uint64_t Dump8x8CharS16(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE *v4;
  __int16 *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v3 = 0;
  v4 = (_BYTE *)(result + 3);
  do
  {
    v5 = (__int16 *)(a3 + v3);
    v6 = *(__int16 *)(a3 + v3);
    if (v6 >= 255)
      v6 = 255;
    *(v4 - 3) = v6 & ~(v6 >> 31);
    v7 = v5[1];
    if (v7 >= 255)
      v7 = 255;
    *(v4 - 2) = v7 & ~(v7 >> 31);
    v8 = v5[2];
    if (v8 >= 255)
      v8 = 255;
    *(v4 - 1) = v8 & ~(v8 >> 31);
    v9 = v5[3];
    if (v9 >= 255)
      v9 = 255;
    *v4 = v9 & ~(v9 >> 31);
    v10 = v5[4];
    if (v10 >= 255)
      v10 = 255;
    v4[1] = v10 & ~(v10 >> 31);
    v11 = v5[5];
    if (v11 >= 255)
      v11 = 255;
    v4[2] = v11 & ~(v11 >> 31);
    v12 = v5[6];
    if (v12 >= 255)
      v12 = 255;
    v4[3] = v12 & ~(v12 >> 31);
    v13 = v5[7];
    if (v13 >= 255)
      v13 = 255;
    v4[4] = v13 & ~(v13 >> 31);
    v3 += 16;
    v4 += a2;
  }
  while ((_DWORD)v3 != 128);
  return result;
}

uint64_t MC_Copy8x8Y(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _BYTE *v17;
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
  _BYTE *v38;
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
  int v50;
  _BYTE *v51;

  v5 = (uint64_t)a4 >> 1;
  v6 = a5 >> 1;
  v7 = a3;
  v8 = (a5 >> 1) * (uint64_t)a3;
  if (((a5 | a4) & 1) != 0)
  {
    v13 = a5 & 1;
    if ((a4 & 1) == 0 || (a5 & 1) != 0)
    {
      v18 = (uint64_t)a5 >> 1;
      v19 = a3 + 1;
      v20 = a3 + 2;
      v21 = a3 + 3;
      v22 = a2 + v5 + v6 * (uint64_t)a3;
      v23 = a3 + 4;
      v24 = a3 + 5;
      v25 = a3 + 6;
      v26 = a3 + 7;
      if ((a4 & 1) != 0 || !v13)
      {
        v39 = 0;
        v40 = v8 + v5;
        v41 = a2 + v5 + a3 + a3 * (uint64_t)(int)v18;
        v42 = a2 + v40 + a3 + 8;
        v43 = a2 + v26 + v40;
        v44 = a2 + v25 + v40;
        v45 = a2 + v24 + v40;
        v46 = a2 + v23 + v40;
        v47 = a2 + v21 + v40;
        v48 = a2 + v19 + v40;
        v49 = a2 + v20 + v40;
        v50 = 8;
        do
        {
          v51 = (_BYTE *)(result + v39);
          *v51 = (*(unsigned __int8 *)(v22 + v39)
                + *(unsigned __int8 *)(v41 + v39)
                + *(unsigned __int8 *)(v22 + v39 + 1)
                + *(unsigned __int8 *)(v48 + v39)
                + 2) >> 2;
          v51[1] = (*(unsigned __int8 *)(v22 + v39 + 1)
                  + *(unsigned __int8 *)(v48 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 2)
                  + *(unsigned __int8 *)(v49 + v39)
                  + 2) >> 2;
          v51[2] = (*(unsigned __int8 *)(v22 + v39 + 2)
                  + *(unsigned __int8 *)(v49 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 3)
                  + *(unsigned __int8 *)(v47 + v39)
                  + 2) >> 2;
          v51[3] = (*(unsigned __int8 *)(v22 + v39 + 3)
                  + *(unsigned __int8 *)(v47 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 4)
                  + *(unsigned __int8 *)(v46 + v39)
                  + 2) >> 2;
          v51[4] = (*(unsigned __int8 *)(v22 + v39 + 4)
                  + *(unsigned __int8 *)(v46 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 5)
                  + *(unsigned __int8 *)(v45 + v39)
                  + 2) >> 2;
          v51[5] = (*(unsigned __int8 *)(v22 + v39 + 5)
                  + *(unsigned __int8 *)(v45 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 6)
                  + *(unsigned __int8 *)(v44 + v39)
                  + 2) >> 2;
          v51[6] = (*(unsigned __int8 *)(v22 + v39 + 6)
                  + *(unsigned __int8 *)(v44 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 7)
                  + *(unsigned __int8 *)(v43 + v39)
                  + 2) >> 2;
          v51[7] = (*(unsigned __int8 *)(v22 + v39 + 7)
                  + *(unsigned __int8 *)(v43 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 8)
                  + *(unsigned __int8 *)(v42 + v39)
                  + 2) >> 2;
          v39 += v7;
          --v50;
        }
        while (v50);
      }
      else
      {
        v27 = 0;
        v28 = v8 + v5;
        v29 = a2 + v5 + v7 + (int)v7 * (uint64_t)(int)v18;
        v30 = a2 + v26 + v28;
        v31 = a2 + v25 + v28;
        v32 = a2 + v24 + v28;
        v33 = a2 + v23 + v28;
        v34 = a2 + v21 + v28;
        v35 = a2 + v20 + v28;
        v36 = a2 + v19 + v28;
        v37 = 8;
        do
        {
          v38 = (_BYTE *)(result + v27);
          *v38 = (*(unsigned __int8 *)(v22 + v27) + *(unsigned __int8 *)(v29 + v27) + 1) >> 1;
          v38[1] = (*(unsigned __int8 *)(v22 + v27 + 1) + *(unsigned __int8 *)(v36 + v27) + 1) >> 1;
          v38[2] = (*(unsigned __int8 *)(v22 + v27 + 2) + *(unsigned __int8 *)(v35 + v27) + 1) >> 1;
          v38[3] = (*(unsigned __int8 *)(v22 + v27 + 3) + *(unsigned __int8 *)(v34 + v27) + 1) >> 1;
          v38[4] = (*(unsigned __int8 *)(v22 + v27 + 4) + *(unsigned __int8 *)(v33 + v27) + 1) >> 1;
          v38[5] = (*(unsigned __int8 *)(v22 + v27 + 5) + *(unsigned __int8 *)(v32 + v27) + 1) >> 1;
          v38[6] = (*(unsigned __int8 *)(v22 + v27 + 6) + *(unsigned __int8 *)(v31 + v27) + 1) >> 1;
          v38[7] = (*(unsigned __int8 *)(v22 + v27 + 7) + *(unsigned __int8 *)(v30 + v27) + 1) >> 1;
          v27 += v7;
          --v37;
        }
        while (v37);
      }
    }
    else
    {
      v14 = 0;
      v15 = v8 + v5 + a2 + 4;
      v16 = 8;
      do
      {
        v17 = (_BYTE *)(result + 7 + v14);
        *(v17 - 7) = (*(unsigned __int8 *)(v8 + v5 + a2 + v14)
                    + *(unsigned __int8 *)(v8 + v5 + a2 + 4 + v14 - 3)
                    + 1) >> 1;
        *(v17 - 6) = (*(unsigned __int8 *)(v15 + v14 - 3) + *(unsigned __int8 *)(v15 + v14 - 2) + 1) >> 1;
        *(v17 - 5) = (*(unsigned __int8 *)(v15 + v14 - 2) + *(unsigned __int8 *)(v15 + v14 - 1) + 1) >> 1;
        *(v17 - 4) = (*(unsigned __int8 *)(v15 + v14 - 1) + *(unsigned __int8 *)(v15 + v14) + 1) >> 1;
        *(v17 - 3) = (*(unsigned __int8 *)(v15 + v14) + *(unsigned __int8 *)(v15 + v14 + 1) + 1) >> 1;
        *(v17 - 2) = (*(unsigned __int8 *)(v15 + v14 + 1) + *(unsigned __int8 *)(v15 + v14 + 2) + 1) >> 1;
        *(v17 - 1) = (*(unsigned __int8 *)(v15 + v14 + 2) + *(unsigned __int8 *)(v15 + v14 + 3) + 1) >> 1;
        *v17 = (*(unsigned __int8 *)(v15 + v14 + 3) + *(unsigned __int8 *)(v15 + v14 + 4) + 1) >> 1;
        v14 += a3;
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    v9 = 0;
    v10 = v8 + v5 + a2 + 3;
    v11 = 8;
    do
    {
      v12 = (_BYTE *)(result + 7 + v9);
      *(v12 - 7) = *(_BYTE *)(v8 + v5 + a2 + v9);
      *(v12 - 6) = *(_BYTE *)(v10 + v9 - 2);
      *(v12 - 5) = *(_BYTE *)(v10 + v9 - 1);
      *(v12 - 4) = *(_BYTE *)(v10 + v9);
      *(v12 - 3) = *(_BYTE *)(v10 + v9 + 1);
      *(v12 - 2) = *(_BYTE *)(v10 + v9 + 2);
      *(v12 - 1) = *(_BYTE *)(v10 + v9 + 3);
      *v12 = *(_BYTE *)(v10 + v9 + 4);
      v9 += a3;
      --v11;
    }
    while (v11);
  }
  return result;
}

uint64_t MC_Copy8x8UV(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _BYTE *v18;
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
  uint64_t v37;
  int v38;
  _BYTE *v39;
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
  int v51;
  _BYTE *v52;

  v5 = (uint64_t)a4 >> 2;
  v6 = a5 >> 2;
  v7 = a3;
  v8 = (a5 >> 2) * (uint64_t)a3;
  if (((a5 | a4) & 3) != 0)
  {
    v9 = a5 & 3;
    v10 = a4 & 3;
    if ((a4 & 3) == 0 || (a5 & 3) != 0)
    {
      v19 = (uint64_t)a5 >> 2;
      v20 = a3 + 1;
      v21 = a3 + 2;
      v22 = a3 + 3;
      v23 = a2 + v5 + v6 * (uint64_t)a3;
      v24 = a3 + 4;
      v25 = a3 + 5;
      v26 = a3 + 6;
      v27 = a3 + 7;
      if (v10 || !v9)
      {
        v40 = 0;
        v41 = v8 + v5;
        v42 = a2 + v5 + a3 + a3 * (uint64_t)(int)v19;
        v43 = a2 + v41 + a3 + 8;
        v44 = a2 + v27 + v41;
        v45 = a2 + v26 + v41;
        v46 = a2 + v25 + v41;
        v47 = a2 + v24 + v41;
        v48 = a2 + v22 + v41;
        v49 = a2 + v20 + v41;
        v50 = a2 + v21 + v41;
        v51 = 8;
        do
        {
          v52 = (_BYTE *)(result + v40);
          *v52 = (*(unsigned __int8 *)(v23 + v40)
                + *(unsigned __int8 *)(v42 + v40)
                + *(unsigned __int8 *)(v23 + v40 + 1)
                + *(unsigned __int8 *)(v49 + v40)
                + 2) >> 2;
          v52[1] = (*(unsigned __int8 *)(v23 + v40 + 1)
                  + *(unsigned __int8 *)(v49 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 2)
                  + *(unsigned __int8 *)(v50 + v40)
                  + 2) >> 2;
          v52[2] = (*(unsigned __int8 *)(v23 + v40 + 2)
                  + *(unsigned __int8 *)(v50 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 3)
                  + *(unsigned __int8 *)(v48 + v40)
                  + 2) >> 2;
          v52[3] = (*(unsigned __int8 *)(v23 + v40 + 3)
                  + *(unsigned __int8 *)(v48 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 4)
                  + *(unsigned __int8 *)(v47 + v40)
                  + 2) >> 2;
          v52[4] = (*(unsigned __int8 *)(v23 + v40 + 4)
                  + *(unsigned __int8 *)(v47 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 5)
                  + *(unsigned __int8 *)(v46 + v40)
                  + 2) >> 2;
          v52[5] = (*(unsigned __int8 *)(v23 + v40 + 5)
                  + *(unsigned __int8 *)(v46 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 6)
                  + *(unsigned __int8 *)(v45 + v40)
                  + 2) >> 2;
          v52[6] = (*(unsigned __int8 *)(v23 + v40 + 6)
                  + *(unsigned __int8 *)(v45 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 7)
                  + *(unsigned __int8 *)(v44 + v40)
                  + 2) >> 2;
          v52[7] = (*(unsigned __int8 *)(v23 + v40 + 7)
                  + *(unsigned __int8 *)(v44 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 8)
                  + *(unsigned __int8 *)(v43 + v40)
                  + 2) >> 2;
          v40 += v7;
          --v51;
        }
        while (v51);
      }
      else
      {
        v28 = 0;
        v29 = v8 + v5;
        v30 = a2 + v5 + v7 + (int)v7 * (uint64_t)(int)v19;
        v31 = a2 + v27 + v29;
        v32 = a2 + v26 + v29;
        v33 = a2 + v25 + v29;
        v34 = a2 + v24 + v29;
        v35 = a2 + v22 + v29;
        v36 = a2 + v21 + v29;
        v37 = a2 + v20 + v29;
        v38 = 8;
        do
        {
          v39 = (_BYTE *)(result + v28);
          *v39 = (*(unsigned __int8 *)(v23 + v28) + *(unsigned __int8 *)(v30 + v28) + 1) >> 1;
          v39[1] = (*(unsigned __int8 *)(v23 + v28 + 1) + *(unsigned __int8 *)(v37 + v28) + 1) >> 1;
          v39[2] = (*(unsigned __int8 *)(v23 + v28 + 2) + *(unsigned __int8 *)(v36 + v28) + 1) >> 1;
          v39[3] = (*(unsigned __int8 *)(v23 + v28 + 3) + *(unsigned __int8 *)(v35 + v28) + 1) >> 1;
          v39[4] = (*(unsigned __int8 *)(v23 + v28 + 4) + *(unsigned __int8 *)(v34 + v28) + 1) >> 1;
          v39[5] = (*(unsigned __int8 *)(v23 + v28 + 5) + *(unsigned __int8 *)(v33 + v28) + 1) >> 1;
          v39[6] = (*(unsigned __int8 *)(v23 + v28 + 6) + *(unsigned __int8 *)(v32 + v28) + 1) >> 1;
          v39[7] = (*(unsigned __int8 *)(v23 + v28 + 7) + *(unsigned __int8 *)(v31 + v28) + 1) >> 1;
          v28 += v7;
          --v38;
        }
        while (v38);
      }
    }
    else
    {
      v11 = 0;
      v12 = v8 + v5 + a2 + 4;
      v13 = 8;
      do
      {
        v14 = (_BYTE *)(result + 7 + v11);
        *(v14 - 7) = (*(unsigned __int8 *)(v8 + v5 + a2 + v11)
                    + *(unsigned __int8 *)(v8 + v5 + a2 + 4 + v11 - 3)
                    + 1) >> 1;
        *(v14 - 6) = (*(unsigned __int8 *)(v12 + v11 - 3) + *(unsigned __int8 *)(v12 + v11 - 2) + 1) >> 1;
        *(v14 - 5) = (*(unsigned __int8 *)(v12 + v11 - 2) + *(unsigned __int8 *)(v12 + v11 - 1) + 1) >> 1;
        *(v14 - 4) = (*(unsigned __int8 *)(v12 + v11 - 1) + *(unsigned __int8 *)(v12 + v11) + 1) >> 1;
        *(v14 - 3) = (*(unsigned __int8 *)(v12 + v11) + *(unsigned __int8 *)(v12 + v11 + 1) + 1) >> 1;
        *(v14 - 2) = (*(unsigned __int8 *)(v12 + v11 + 1) + *(unsigned __int8 *)(v12 + v11 + 2) + 1) >> 1;
        *(v14 - 1) = (*(unsigned __int8 *)(v12 + v11 + 2) + *(unsigned __int8 *)(v12 + v11 + 3) + 1) >> 1;
        *v14 = (*(unsigned __int8 *)(v12 + v11 + 3) + *(unsigned __int8 *)(v12 + v11 + 4) + 1) >> 1;
        v11 += a3;
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    v15 = 0;
    v16 = v8 + v5 + a2 + 3;
    v17 = 8;
    do
    {
      v18 = (_BYTE *)(result + 7 + v15);
      *(v18 - 7) = *(_BYTE *)(v8 + v5 + a2 + v15);
      *(v18 - 6) = *(_BYTE *)(v16 + v15 - 2);
      *(v18 - 5) = *(_BYTE *)(v16 + v15 - 1);
      *(v18 - 4) = *(_BYTE *)(v16 + v15);
      *(v18 - 3) = *(_BYTE *)(v16 + v15 + 1);
      *(v18 - 2) = *(_BYTE *)(v16 + v15 + 2);
      *(v18 - 1) = *(_BYTE *)(v16 + v15 + 3);
      *v18 = *(_BYTE *)(v16 + v15 + 4);
      v15 += a3;
      --v17;
    }
    while (v17);
  }
  return result;
}

uint64_t MC_Copy8x8UV4(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _BYTE *v13;
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
  int v25;
  _BYTE *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _BYTE *v45;

  v5 = (uint64_t)a4 >> 4;
  v6 = (uint64_t)a5 >> 4;
  v7 = a3;
  v8 = (a5 >> 4) * (uint64_t)a3;
  v9 = a2 + v5 + v8;
  if ((a4 & 0xF) == 0
    || (((_BYTE)a4 - 1) & 0xF) == 0
    || (((_BYTE)a4 + 14) & 0xF) == 0
    || (((_BYTE)a4 + 1) & 0xF) == 0
    || (((_BYTE)a4 + 2) & 0xF) == 0)
  {
    if ((a5 & 0xF) == 0
      || (((_BYTE)a5 - 1) & 0xF) == 0
      || (((_BYTE)a5 + 14) & 0xF) == 0
      || (((_BYTE)a5 + 1) & 0xF) == 0
      || (((_BYTE)a5 + 2) & 0xF) == 0)
    {
      v10 = 0;
      v11 = v8 + v5 + a2 + 3;
      v12 = 8;
      do
      {
        v13 = (_BYTE *)(result + 7 + v10);
        *(v13 - 7) = *(_BYTE *)(v11 + v10 - 3);
        *(v13 - 6) = *(_BYTE *)(v11 + v10 - 2);
        *(v13 - 5) = *(_BYTE *)(v11 + v10 - 1);
        *(v13 - 4) = *(_BYTE *)(v11 + v10);
        *(v13 - 3) = *(_BYTE *)(v11 + v10 + 1);
        *(v13 - 2) = *(_BYTE *)(v11 + v10 + 2);
        *(v13 - 1) = *(_BYTE *)(v11 + v10 + 3);
        *v13 = *(_BYTE *)(v11 + v10 + 4);
        v10 += a3;
        --v12;
      }
      while (v12);
      return result;
    }
    if ((a4 & 0xF) == 0 || (((_BYTE)a4 - 1) & 0xF) == 0)
      goto LABEL_28;
  }
  if ((((_BYTE)a4 + 14) & 0xF) == 0 || (((_BYTE)a4 + 1) & 0xF) == 0)
    goto LABEL_28;
  if ((((_BYTE)a4 + 2) & 0xF) == 0
    || (a5 & 0xF) != 0
    && (((_BYTE)a5 - 1) & 0xF) != 0
    && (((_BYTE)a5 + 14) & 0xF) != 0
    && (((_BYTE)a5 + 1) & 0xF) != 0
    && (((_BYTE)a5 + 2) & 0xF) != 0)
  {
    if ((((_BYTE)a4 + 1) & 0xF) != 0)
    {
      if ((((_BYTE)a4 + 2) & 0xF) != 0 || (a5 & 0xF) == 0)
        goto LABEL_36;
LABEL_29:
      if ((((_BYTE)a5 - 1) & 0xF) != 0
        && (((_BYTE)a5 + 14) & 0xF) != 0
        && (((_BYTE)a5 + 1) & 0xF) != 0
        && (((_BYTE)a5 + 2) & 0xF) != 0)
      {
        v14 = 0;
        v15 = v8 + v5;
        v16 = v8 + v5 + a3 + 7;
        v17 = a2 + v5 + a3 + a3 * (uint64_t)(int)v6;
        v18 = a2 + v16;
        v19 = a2 + v15 + a3 + 6;
        v20 = a2 + v15 + a3 + 5;
        v21 = a2 + v15 + a3 + 4;
        v22 = a2 + v15 + a3 + 3;
        v23 = a2 + v15 + a3 + 2;
        v24 = a2 + v15 + a3 + 1;
        v25 = 8;
        do
        {
          v26 = (_BYTE *)(result + v14);
          *v26 = (*(unsigned __int8 *)(v9 + v14) + *(unsigned __int8 *)(v17 + v14) + 1) >> 1;
          v26[1] = (*(unsigned __int8 *)(v9 + v14 + 1) + *(unsigned __int8 *)(v24 + v14) + 1) >> 1;
          v26[2] = (*(unsigned __int8 *)(v9 + v14 + 2) + *(unsigned __int8 *)(v23 + v14) + 1) >> 1;
          v26[3] = (*(unsigned __int8 *)(v9 + v14 + 3) + *(unsigned __int8 *)(v22 + v14) + 1) >> 1;
          v26[4] = (*(unsigned __int8 *)(v9 + v14 + 4) + *(unsigned __int8 *)(v21 + v14) + 1) >> 1;
          v26[5] = (*(unsigned __int8 *)(v9 + v14 + 5) + *(unsigned __int8 *)(v20 + v14) + 1) >> 1;
          v26[6] = (*(unsigned __int8 *)(v9 + v14 + 6) + *(unsigned __int8 *)(v19 + v14) + 1) >> 1;
          v26[7] = (*(unsigned __int8 *)(v9 + v14 + 7) + *(unsigned __int8 *)(v18 + v14) + 1) >> 1;
          v14 += v7;
          --v25;
        }
        while (v25);
        return result;
      }
LABEL_36:
      v27 = 0;
      v28 = a3 + 2;
      v29 = v8 + v5;
      v30 = v8 + v5 + a3 + 8;
      v31 = a2 + v5 + a3 + a3 * (uint64_t)(int)v6;
      v32 = a2 + v30;
      v33 = a2 + v29 + a3 + 7;
      v34 = a2 + v29 + a3 + 6;
      v35 = a2 + v29 + a3 + 5;
      v36 = a2 + v29 + a3 + 4;
      v37 = a2 + v29 + a3 + 3;
      v38 = a2 + v29 + a3 + 1;
      v39 = a2 + v29 + v28;
      v40 = 8;
      do
      {
        v41 = (_BYTE *)(result + v27);
        *v41 = (*(unsigned __int8 *)(v9 + v27)
              + *(unsigned __int8 *)(v31 + v27)
              + *(unsigned __int8 *)(v9 + v27 + 1)
              + *(unsigned __int8 *)(v38 + v27)
              + 2) >> 2;
        v41[1] = (*(unsigned __int8 *)(v9 + v27 + 1)
                + *(unsigned __int8 *)(v38 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 2)
                + *(unsigned __int8 *)(v39 + v27)
                + 2) >> 2;
        v41[2] = (*(unsigned __int8 *)(v9 + v27 + 2)
                + *(unsigned __int8 *)(v39 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 3)
                + *(unsigned __int8 *)(v37 + v27)
                + 2) >> 2;
        v41[3] = (*(unsigned __int8 *)(v9 + v27 + 3)
                + *(unsigned __int8 *)(v37 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 4)
                + *(unsigned __int8 *)(v36 + v27)
                + 2) >> 2;
        v41[4] = (*(unsigned __int8 *)(v9 + v27 + 4)
                + *(unsigned __int8 *)(v36 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 5)
                + *(unsigned __int8 *)(v35 + v27)
                + 2) >> 2;
        v41[5] = (*(unsigned __int8 *)(v9 + v27 + 5)
                + *(unsigned __int8 *)(v35 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 6)
                + *(unsigned __int8 *)(v34 + v27)
                + 2) >> 2;
        v41[6] = (*(unsigned __int8 *)(v9 + v27 + 6)
                + *(unsigned __int8 *)(v34 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 7)
                + *(unsigned __int8 *)(v33 + v27)
                + 2) >> 2;
        v41[7] = (*(unsigned __int8 *)(v9 + v27 + 7)
                + *(unsigned __int8 *)(v33 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 8)
                + *(unsigned __int8 *)(v32 + v27)
                + 2) >> 2;
        v27 += v7;
        --v40;
      }
      while (v40);
      return result;
    }
LABEL_28:
    if ((a5 & 0xF) == 0)
      goto LABEL_36;
    goto LABEL_29;
  }
  v42 = 0;
  v43 = v8 + v5 + a2 + 4;
  v44 = 8;
  do
  {
    v45 = (_BYTE *)(result + 7 + v42);
    *(v45 - 7) = (*(unsigned __int8 *)(v43 + v42 - 4) + *(unsigned __int8 *)(v43 + v42 - 3) + 1) >> 1;
    *(v45 - 6) = (*(unsigned __int8 *)(v43 + v42 - 3) + *(unsigned __int8 *)(v43 + v42 - 2) + 1) >> 1;
    *(v45 - 5) = (*(unsigned __int8 *)(v43 + v42 - 2) + *(unsigned __int8 *)(v43 + v42 - 1) + 1) >> 1;
    *(v45 - 4) = (*(unsigned __int8 *)(v43 + v42 - 1) + *(unsigned __int8 *)(v43 + v42) + 1) >> 1;
    *(v45 - 3) = (*(unsigned __int8 *)(v43 + v42) + *(unsigned __int8 *)(v43 + v42 + 1) + 1) >> 1;
    *(v45 - 2) = (*(unsigned __int8 *)(v43 + v42 + 1) + *(unsigned __int8 *)(v43 + v42 + 2) + 1) >> 1;
    *(v45 - 1) = (*(unsigned __int8 *)(v43 + v42 + 2) + *(unsigned __int8 *)(v43 + v42 + 3) + 1) >> 1;
    *v45 = (*(unsigned __int8 *)(v43 + v42 + 3) + *(unsigned __int8 *)(v43 + v42 + 4) + 1) >> 1;
    v42 += a3;
    --v44;
  }
  while (v44);
  return result;
}

uint64_t Copy8x8(uint64_t result, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = 8;
  v4 = 3;
  do
  {
    v5 = (_BYTE *)(result + v4);
    *(v5 - 3) = *(_BYTE *)(a2 + v4 - 3);
    *(v5 - 2) = *(_BYTE *)(a2 + v4 - 2);
    *(v5 - 1) = *(_BYTE *)(a2 + v4 - 1);
    *v5 = *(_BYTE *)(a2 + v4);
    v5[1] = *(_BYTE *)(a2 + v4 + 1);
    v5[2] = *(_BYTE *)(a2 + v4 + 2);
    v5[3] = *(_BYTE *)(a2 + v4 + 3);
    v5[4] = *(_BYTE *)(a2 + v4 + 4);
    v4 += a3;
    --v3;
  }
  while (v3);
  return result;
}

uint64_t DumpDecoded263MB3S16(uint64_t result, _QWORD *a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  __int16 *v20;
  int v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  __int16 *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  __int16 *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  __int16 *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  __int16 *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  __int16 *v68;
  int v69;
  int v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  _BYTE v77[4];
  int v78;
  int v79;
  int v80;
  int v81;
  _BYTE v82[4];
  int v83;
  int v84;
  int v85;
  int v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(result + 296182);
  v7 = *(_QWORD *)(result + 296190);
  v9 = *(int **)v8;
  v10 = *(unsigned int *)(v7 + 20);
  v11 = *(unsigned int *)(v7 + 24);
  v12 = (int *)(*(_QWORD *)v8 + 4 * v10);
  v13 = *(_QWORD *)v8 + 4 * v11;
  v14 = *(int *)(v13 + 76) + (uint64_t)*v12;
  v15 = *(int *)(v13 + 340) + (uint64_t)v12[47];
  v16 = *(_DWORD *)result + 32;
  v76 = *(_DWORD *)(result + 4) + 16;
  v17 = *(char *)(v8 + 154);
  if (v17 >= 2)
  {
    if (v17 - 3 < 2)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(result + 296238) + 48);
      v19 = *a2 + v9[42] + v14;
      v20 = *(__int16 **)(v8 + 8);
      if (*a4)
      {
        Dump8x8CharS16(v19, v16, (uint64_t)v20);
      }
      else
      {
        v39 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v20);
        v40 = (v39 << 16) | (v39 << 24) | (v39 << 8) | v39;
        v41 = 1;
        v42 = -8;
        do
        {
          *(_DWORD *)(v19 + 4 * (v41 - 1)) = v40;
          *(_DWORD *)(v19 + 4 * v41) = v40;
          v41 += v16 >> 2;
          v22 = __CFADD__(v42++, 1);
        }
        while (!v22);
      }
      v43 = *a2 + v9[43] + (uint64_t)(int)v14;
      v44 = *(__int16 **)(v8 + 16);
      if (a4[1])
      {
        Dump8x8CharS16(v43, v16, (uint64_t)v44);
      }
      else
      {
        v45 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v44);
        v46 = (v45 << 16) | (v45 << 24) | (v45 << 8) | v45;
        v47 = 1;
        v48 = -8;
        do
        {
          *(_DWORD *)(v43 + 4 * (v47 - 1)) = v46;
          *(_DWORD *)(v43 + 4 * v47) = v46;
          v47 += v16 >> 2;
          v22 = __CFADD__(v48++, 1);
        }
        while (!v22);
      }
      v49 = *a2 + v9[44] + (uint64_t)(int)v14;
      v50 = *(__int16 **)(v8 + 24);
      if (a4[2])
      {
        Dump8x8CharS16(v49, v16, (uint64_t)v50);
      }
      else
      {
        v51 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v50);
        v52 = (v51 << 16) | (v51 << 24) | (v51 << 8) | v51;
        v53 = 1;
        v54 = -8;
        do
        {
          *(_DWORD *)(v49 + 4 * (v53 - 1)) = v52;
          *(_DWORD *)(v49 + 4 * v53) = v52;
          v53 += v16 >> 2;
          v22 = __CFADD__(v54++, 1);
        }
        while (!v22);
      }
      v55 = *a2 + v9[45] + (uint64_t)(int)v14;
      v56 = *(__int16 **)(v8 + 32);
      if (a4[3])
      {
        Dump8x8CharS16(v55, v16, (uint64_t)v56);
        v57 = v76;
      }
      else
      {
        v58 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v56);
        v59 = (v58 << 16) | (v58 << 24) | (v58 << 8) | v58;
        v60 = 1;
        v61 = -8;
        v57 = v76;
        do
        {
          *(_DWORD *)(v55 + 4 * (v60 - 1)) = v59;
          *(_DWORD *)(v55 + 4 * v60) = v59;
          v60 += v16 >> 2;
          v22 = __CFADD__(v61++, 1);
        }
        while (!v22);
      }
      v62 = a2[1] + v15;
      v63 = *(__int16 **)(v8 + 40);
      if (a4[4])
      {
        Dump8x8CharS16(v62, v57, (uint64_t)v63);
      }
      else
      {
        v64 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v63);
        v65 = (v64 << 16) | (v64 << 24) | (v64 << 8) | v64;
        v66 = 1;
        v67 = -8;
        do
        {
          *(_DWORD *)(v62 + 4 * (v66 - 1)) = v65;
          *(_DWORD *)(v62 + 4 * v66) = v65;
          v66 += v57 >> 2;
          v22 = __CFADD__(v67++, 1);
        }
        while (!v22);
      }
      result = a2[2] + v15;
      v68 = *(__int16 **)(v8 + 48);
      if (a4[5])
        return Dump8x8CharS16(result, v57, (uint64_t)v68);
      v69 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v68);
      v70 = (v69 << 16) | (v69 << 24) | (v69 << 8) | v69;
      v71 = 1;
      v72 = -8;
      do
      {
        *(_DWORD *)(result + 4 * (v71 - 1)) = v70;
        *(_DWORD *)(result + 4 * v71) = v70;
        v71 += v57 >> 2;
        v22 = __CFADD__(v72++, 1);
      }
      while (!v22);
      return result;
    }
    if (v17 != 2)
      return result;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = result + 296174;
    v28 = v8 + 226;
    while (1)
    {
      v29 = *(_DWORD *)(v28 + v24 - 24);
      *(_DWORD *)&v82[v24 + 4] = v29;
      if (!(_DWORD)v11)
        break;
      if (v11 >= *(_DWORD *)(*(_QWORD *)v27 + 20) - 1 && v29 >= 33)
      {
        v29 = 32;
LABEL_20:
        *(_DWORD *)&v82[v24 + 4] = v29;
      }
LABEL_21:
      v30 = *(_DWORD *)(v28 + v24);
      *(_DWORD *)&v77[v24 + 4] = v30;
      if ((_DWORD)v10)
      {
        if (v10 < *(_DWORD *)(*(_QWORD *)v27 + 16) - 1 || v30 < 33)
          goto LABEL_28;
        v30 = 32;
        goto LABEL_27;
      }
      if (v30 <= -33)
      {
        v30 = -32;
LABEL_27:
        *(_DWORD *)&v77[v24 + 4] = v30;
      }
LABEL_28:
      v26 += v29;
      v25 += v30;
      v24 += 4;
      if (v24 == 16)
      {
        v31 = v9[42] + (uint64_t)(int)v14;
        if (*a4)
          MC_InvYS16(*(_QWORD *)(v8 + 8), *a3 + v31, *a2 + v31, v16, v83, v78);
        else
          MC_Copy8x8Y(*a2 + v31, *a3 + v31, v16, v83, v78);
        v73 = v9[43] + (uint64_t)(int)v14;
        if (a4[1])
          MC_InvYS16(*(_QWORD *)(v8 + 16), *a3 + v73, *a2 + v73, v16, v84, v79);
        else
          MC_Copy8x8Y(*a2 + v73, *a3 + v73, v16, v84, v79);
        v74 = v9[44] + (uint64_t)(int)v14;
        if (a4[2])
          MC_InvYS16(*(_QWORD *)(v8 + 24), *a3 + v74, *a2 + v74, v16, v85, v80);
        else
          MC_Copy8x8Y(*a2 + v74, *a3 + v74, v16, v85, v80);
        v75 = v9[45] + (uint64_t)(int)v14;
        if (a4[3])
          MC_InvYS16(*(_QWORD *)(v8 + 32), *a3 + v75, *a2 + v75, v16, v86, v81);
        else
          MC_Copy8x8Y(*a2 + v75, *a3 + v75, v16, v86, v81);
        if (a4[4])
          MC_InvUV4S16(*(_QWORD *)(v8 + 40), a3[1] + (int)v15, a2[1] + (int)v15, v76, v26, v25);
        else
          MC_Copy8x8UV4(a2[1] + (int)v15, a3[1] + (int)v15, v76, v26, v25);
        if (a4[5])
          return MC_InvUV4S16(*(_QWORD *)(v8 + 48), a3[2] + (int)v15, a2[2] + (int)v15, v76, v26, v25);
        else
          return MC_Copy8x8UV4(a2[2] + (int)v15, a3[2] + (int)v15, v76, v26, v25);
      }
    }
    if (v29 > -33)
      goto LABEL_21;
    v29 = -32;
    goto LABEL_20;
  }
  v21 = *(_DWORD *)(v8 + 198);
  if ((_DWORD)v11)
  {
    v22 = v21 >= 33 && v11 >= *(_DWORD *)(*(_QWORD *)(result + 296174) + 20) - 1;
    if (v22)
      v23 = 32;
    else
      v23 = *(_DWORD *)(v8 + 198);
  }
  else if (v21 <= -32)
  {
    v23 = -32;
  }
  else
  {
    v23 = *(_DWORD *)(v8 + 198);
  }
  v32 = *(_DWORD *)(v8 + 222);
  if ((_DWORD)v10)
  {
    if (v32 >= 33 && v10 >= *(_DWORD *)(*(_QWORD *)(result + 296174) + 16) - 1)
      v34 = 32;
    else
      v34 = *(_DWORD *)(v8 + 222);
  }
  else if (v32 <= -32)
  {
    v34 = -32;
  }
  else
  {
    v34 = *(_DWORD *)(v8 + 222);
  }
  v35 = v9[42] + (uint64_t)(int)v14;
  if (*a4)
    MC_InvYS16(*(_QWORD *)(v8 + 8), *a3 + v35, *a2 + v35, v16, v23, v34);
  else
    MC_Copy8x8Y(*a2 + v35, *a3 + v35, v16, v23, v34);
  v36 = v9[43] + (uint64_t)(int)v14;
  if (a4[1])
    MC_InvYS16(*(_QWORD *)(v8 + 16), *a3 + v36, *a2 + v36, v16, v23, v34);
  else
    MC_Copy8x8Y(*a2 + v36, *a3 + v36, v16, v23, v34);
  v37 = v9[44] + (uint64_t)(int)v14;
  if (a4[2])
    MC_InvYS16(*(_QWORD *)(v8 + 24), *a3 + v37, *a2 + v37, v16, v23, v34);
  else
    MC_Copy8x8Y(*a2 + v37, *a3 + v37, v16, v23, v34);
  v38 = v9[45] + (uint64_t)(int)v14;
  if (a4[3])
    MC_InvYS16(*(_QWORD *)(v8 + 32), *a3 + v38, *a2 + v38, v16, v23, v34);
  else
    MC_Copy8x8Y(*a2 + v38, *a3 + v38, v16, v23, v34);
  if (a4[4])
    MC_InvUVS16(*(_QWORD *)(v8 + 40), a3[1] + (int)v15, a2[1] + (int)v15, v76, v23, v34);
  else
    MC_Copy8x8UV(a2[1] + (int)v15, a3[1] + (int)v15, v76, v23, v34);
  if (a4[5])
    return MC_InvUVS16(*(_QWORD *)(v8 + 48), a3[2] + (int)v15, a2[2] + (int)v15, v76, v23, v34);
  else
    return MC_Copy8x8UV(a2[2] + (int)v15, a3[2] + (int)v15, v76, v23, v34);
}

uint64_t DumpDecoded263MB4S16(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  __int16 *v34;
  int v35;
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
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  __int16 *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  __int16 *v62;
  int v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  __int16 *v68;
  int v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  __int16 *v76;
  int v77;
  int v78;
  int v79;
  int v80;
  __int16 *v81;
  int v82;
  int v83;
  int v84;
  int v85;
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
  int v96;
  int v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  int v101;
  int v103;
  uint64_t v106;
  int v107;

  v8 = result;
  v9 = (_QWORD *)(result + 296174);
  v11 = *(_QWORD *)(result + 296182);
  v10 = *(_QWORD *)(result + 296190);
  v12 = *(int **)v11;
  v13 = *(unsigned int *)(v10 + 20);
  v14 = *(unsigned int *)(v10 + 24);
  v15 = (int *)(*(_QWORD *)v11 + 4 * v13);
  v16 = *v15;
  v17 = *(_QWORD *)v11 + 4 * v14;
  v18 = *(int *)(v17 + 76);
  v19 = v15[47];
  v20 = *(int *)(v17 + 340);
  v21 = *(_DWORD *)result;
  v22 = *(_DWORD *)(result + 4);
  v23 = *(_DWORD *)(v11 + 198);
  if ((_DWORD)v14)
  {
    result = (*(_DWORD *)(*v9 + 20) - 1);
    v24 = v23 >= 33 && v14 >= result;
    if (v24)
      v25 = 32;
    else
      v25 = *(_DWORD *)(v11 + 198);
  }
  else if (v23 <= -32)
  {
    v25 = -32;
  }
  else
  {
    v25 = *(_DWORD *)(v11 + 198);
  }
  v26 = v18 + v16;
  v106 = v20 + v19;
  v27 = v21 + 32;
  v107 = v22 + 16;
  v28 = *(_DWORD *)(v11 + 222);
  if ((_DWORD)v13)
  {
    if (v28 >= 33 && v13 >= *(_DWORD *)(*v9 + 16) - 1)
      v30 = 32;
    else
      v30 = *(_DWORD *)(v11 + 222);
  }
  else if (v28 <= -32)
  {
    v30 = -32;
  }
  else
  {
    v30 = *(_DWORD *)(v11 + 222);
  }
  v31 = *(char *)(v11 + 154);
  if (v31 < 2)
  {
    v35 = v25;
    v36 = v12[42] + (uint64_t)(int)v26;
    v37 = *a2 + v36;
    v38 = a4 + 4 * v36;
    if (*a5)
      Copy8x8obmcRes(v37, v38, *(_QWORD *)(v11 + 8), v21 + 32);
    else
      Copy8x8obmc(v37, v38, v21 + 32);
    v42 = v12[43] + (uint64_t)(int)v26;
    v43 = *a2 + v42;
    v44 = a4 + 4 * v42;
    if (a5[1])
      Copy8x8obmcRes(v43, v44, *(_QWORD *)(v11 + 16), v27);
    else
      Copy8x8obmc(v43, v44, v27);
    v45 = v12[44] + (uint64_t)(int)v26;
    v46 = *a2 + v45;
    v47 = a4 + 4 * v45;
    if (a5[2])
      Copy8x8obmcRes(v46, v47, *(_QWORD *)(v11 + 24), v27);
    else
      Copy8x8obmc(v46, v47, v27);
    v48 = v12[45] + (uint64_t)(int)v26;
    v49 = *a2 + v48;
    v50 = a4 + 4 * v48;
    if (a5[3])
      Copy8x8obmcRes(v49, v50, *(_QWORD *)(v11 + 32), v27);
    else
      Copy8x8obmc(v49, v50, v27);
    if (a5[4])
      MC_InvUVS16(*(_QWORD *)(v11 + 40), *(_QWORD *)(a3 + 8) + (int)v106, a2[1] + (int)v106, v107, v35, v30);
    else
      MC_Copy8x8UV4(a2[1] + (int)v106, *(_QWORD *)(a3 + 8) + (int)v106, v107, v35, v30);
    if (a5[5])
      return MC_InvUVS16(*(_QWORD *)(v11 + 48), *(_QWORD *)(a3 + 16) + (int)v106, a2[2] + (int)v106, v107, v35, v30);
    else
      return MC_Copy8x8UV4(a2[2] + (int)v106, *(_QWORD *)(a3 + 16) + (int)v106, v107, v35, v30);
  }
  else if (v31 - 3 >= 2)
  {
    if (v31 == 2)
    {
      v39 = v12[42] + (uint64_t)(int)v26;
      v40 = *a2 + v39;
      v41 = a4 + 4 * v39;
      if (*a5)
        Copy8x8obmcRes(v40, v41, *(_QWORD *)(v11 + 8), v21 + 32);
      else
        Copy8x8obmc(v40, v41, v21 + 32);
      v86 = v12[43] + (uint64_t)(int)v26;
      v87 = *a2 + v86;
      v88 = a4 + 4 * v86;
      if (a5[1])
        Copy8x8obmcRes(v87, v88, *(_QWORD *)(v11 + 16), v27);
      else
        Copy8x8obmc(v87, v88, v27);
      v89 = v12[44] + (uint64_t)(int)v26;
      v90 = *a2 + v89;
      v91 = a4 + 4 * v89;
      if (a5[2])
        Copy8x8obmcRes(v90, v91, *(_QWORD *)(v11 + 24), v27);
      else
        Copy8x8obmc(v90, v91, v27);
      v92 = v12[45] + (uint64_t)(int)v26;
      v93 = *a2 + v92;
      v94 = a4 + 4 * v92;
      if (a5[3])
        Copy8x8obmcRes(v93, v94, *(_QWORD *)(v11 + 32), v27);
      else
        Copy8x8obmc(v93, v94, v27);
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v99 = *(_DWORD *)(v10 + 20);
      v98 = *(_DWORD *)(v10 + 24);
      v100 = v8 + 296174;
      do
      {
        v101 = *(_DWORD *)(v11 + v95 + 202);
        if (v98)
        {
          if (v101 >= 33 && v98 >= *(_DWORD *)(*(_QWORD *)v100 + 20) - 1)
            v101 = 32;
        }
        else if (v101 <= -32)
        {
          v101 = -32;
        }
        v103 = *(_DWORD *)(v11 + v95 + 226);
        if (v99)
        {
          if (v103 >= 33 && v99 >= *(_DWORD *)(*(_QWORD *)v100 + 16) - 1)
            v103 = 32;
        }
        else if (v103 <= -32)
        {
          v103 = -32;
        }
        v95 += 4;
        v97 += v101;
        v96 += v103;
      }
      while (v95 != 16);
      if (a5[4])
        MC_InvUV4S16(*(_QWORD *)(v11 + 40), *(_QWORD *)(a3 + 8) + (int)v106, a2[1] + (int)v106, v107, v97, v96);
      else
        MC_Copy8x8UV4(a2[1] + (int)v106, *(_QWORD *)(a3 + 8) + (int)v106, v107, v97, v96);
      if (a5[5])
        return MC_InvUV4S16(*(_QWORD *)(v11 + 48), *(_QWORD *)(a3 + 16) + (int)v106, a2[2] + (int)v106, v107, v97, v96);
      else
        return MC_Copy8x8UV4(a2[2] + (int)v106, *(_QWORD *)(a3 + 16) + (int)v106, v107, v97, v96);
    }
  }
  else
  {
    v32 = *(_QWORD *)(v9[8] + 48);
    v33 = *a2 + v12[42] + v26;
    v34 = *(__int16 **)(v11 + 8);
    if (*a5)
    {
      Dump8x8CharS16(v33, v21 + 32, (uint64_t)v34);
    }
    else
    {
      v51 = *(unsigned __int8 *)(*(_QWORD *)(v32 + 1312) + *v34);
      v52 = (v51 << 16) | (v51 << 24) | (v51 << 8) | v51;
      v53 = 1;
      v54 = -8;
      do
      {
        *(_DWORD *)(v33 + 4 * (v53 - 1)) = v52;
        *(_DWORD *)(v33 + 4 * v53) = v52;
        v53 += v27 >> 2;
        v24 = __CFADD__(v54++, 1);
      }
      while (!v24);
    }
    v55 = *a2 + v12[43] + (uint64_t)(int)v26;
    v56 = *(__int16 **)(v11 + 16);
    if (a5[1])
    {
      Dump8x8CharS16(v55, v27, (uint64_t)v56);
    }
    else
    {
      v57 = *(unsigned __int8 *)(*(_QWORD *)(v32 + 1312) + *v56);
      v58 = (v57 << 16) | (v57 << 24) | (v57 << 8) | v57;
      v59 = 1;
      v60 = -8;
      do
      {
        *(_DWORD *)(v55 + 4 * (v59 - 1)) = v58;
        *(_DWORD *)(v55 + 4 * v59) = v58;
        v59 += v27 >> 2;
        v24 = __CFADD__(v60++, 1);
      }
      while (!v24);
    }
    v61 = *a2 + v12[44] + (uint64_t)(int)v26;
    v62 = *(__int16 **)(v11 + 24);
    if (a5[2])
    {
      Dump8x8CharS16(v61, v27, (uint64_t)v62);
    }
    else
    {
      v63 = *(unsigned __int8 *)(*(_QWORD *)(v32 + 1312) + *v62);
      v64 = (v63 << 16) | (v63 << 24) | (v63 << 8) | v63;
      v65 = 1;
      v66 = -8;
      do
      {
        *(_DWORD *)(v61 + 4 * (v65 - 1)) = v64;
        *(_DWORD *)(v61 + 4 * v65) = v64;
        v65 += v27 >> 2;
        v24 = __CFADD__(v66++, 1);
      }
      while (!v24);
    }
    v67 = *a2 + v12[45] + (uint64_t)(int)v26;
    v68 = *(__int16 **)(v11 + 32);
    if (a5[3])
    {
      Dump8x8CharS16(v67, v27, (uint64_t)v68);
      v69 = v107;
      v70 = v106;
    }
    else
    {
      v71 = *(unsigned __int8 *)(*(_QWORD *)(v32 + 1312) + *v68);
      v72 = (v71 << 16) | (v71 << 24) | (v71 << 8) | v71;
      v73 = 1;
      v74 = -8;
      v69 = v107;
      v70 = v106;
      do
      {
        *(_DWORD *)(v67 + 4 * (v73 - 1)) = v72;
        *(_DWORD *)(v67 + 4 * v73) = v72;
        v73 += v27 >> 2;
        v24 = __CFADD__(v74++, 1);
      }
      while (!v24);
    }
    v75 = a2[1] + v70;
    v76 = *(__int16 **)(v11 + 40);
    if (a5[4])
    {
      Dump8x8CharS16(v75, v69, (uint64_t)v76);
    }
    else
    {
      v77 = *(unsigned __int8 *)(*(_QWORD *)(v32 + 1312) + *v76);
      v78 = (v77 << 16) | (v77 << 24) | (v77 << 8) | v77;
      v79 = 1;
      v80 = -8;
      do
      {
        *(_DWORD *)(v75 + 4 * (v79 - 1)) = v78;
        *(_DWORD *)(v75 + 4 * v79) = v78;
        v79 += v69 >> 2;
        v24 = __CFADD__(v80++, 1);
      }
      while (!v24);
    }
    result = a2[2] + v70;
    v81 = *(__int16 **)(v11 + 48);
    if (a5[5])
    {
      return Dump8x8CharS16(result, v69, (uint64_t)v81);
    }
    else
    {
      v82 = *(unsigned __int8 *)(*(_QWORD *)(v32 + 1312) + *v81);
      v83 = (v82 << 16) | (v82 << 24) | (v82 << 8) | v82;
      v84 = 1;
      v85 = -8;
      do
      {
        *(_DWORD *)(result + 4 * (v84 - 1)) = v83;
        *(_DWORD *)(result + 4 * v84) = v83;
        v84 += v69 >> 2;
        v24 = __CFADD__(v85++, 1);
      }
      while (!v24);
    }
  }
  return result;
}

uint64_t Copy8x8obmcRes(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  __int16 *v5;
  _BYTE *v6;
  __int16 *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v4 = 0;
  v5 = (__int16 *)(a2 + 16);
  v6 = (_BYTE *)(result + 3);
  do
  {
    v7 = (__int16 *)(a3 + v4);
    v8 = *(v5 - 8) + *(__int16 *)(a3 + v4);
    if (v8 >= 255)
      v8 = 255;
    *(v6 - 3) = v8 & ~(v8 >> 31);
    v9 = *(v5 - 6) + v7[1];
    if (v9 >= 255)
      v9 = 255;
    *(v6 - 2) = v9 & ~(v9 >> 31);
    v10 = *(v5 - 4) + v7[2];
    if (v10 >= 255)
      v10 = 255;
    *(v6 - 1) = v10 & ~(v10 >> 31);
    v11 = *(v5 - 2) + v7[3];
    if (v11 >= 255)
      v11 = 255;
    *v6 = v11 & ~(v11 >> 31);
    v12 = *v5 + v7[4];
    if (v12 >= 255)
      v12 = 255;
    v6[1] = v12 & ~(v12 >> 31);
    v13 = v5[2] + v7[5];
    if (v13 >= 255)
      v13 = 255;
    v6[2] = v13 & ~(v13 >> 31);
    v14 = v5[4] + v7[6];
    if (v14 >= 255)
      v14 = 255;
    v6[3] = v14 & ~(v14 >> 31);
    v15 = v5[6] + v7[7];
    if (v15 >= 255)
      v15 = 255;
    v6[4] = v15 & ~(v15 >> 31);
    v4 += 16;
    v5 += 2 * a4;
    v6 += a4;
  }
  while ((_DWORD)v4 != 128);
  return result;
}

uint64_t Copy8x8obmc(uint64_t result, uint64_t a2, int a3)
{
  _DWORD *v3;
  _BYTE *v4;
  int v5;

  v3 = (_DWORD *)(a2 + 16);
  v4 = (_BYTE *)(result + 3);
  v5 = 8;
  do
  {
    *(v4 - 3) = *(v3 - 4);
    *(v4 - 2) = *(v3 - 3);
    *(v4 - 1) = *(v3 - 2);
    *v4 = *(v3 - 1);
    v4[1] = *v3;
    v4[2] = v3[1];
    v4[3] = v3[2];
    v4[4] = v3[3];
    v3 += a3;
    v4 += a3;
    --v5;
  }
  while (v5);
  return result;
}

uint64_t MC_Copy8x8Y_wcc(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  int v8;
  unint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _DWORD *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  _DWORD *v30;

  v8 = (a5 >> 1) * a3 + (a4 >> 1);
  if (a7 && a8)
  {
    v9 = a2 + v8;
    if (v9 < a7)
      return 7;
    v10 = a5 & 1;
    if (v9 + (a4 & 1) + (v10 + 7) * a3 + 7 >= a8)
      return 7;
  }
  else
  {
    v10 = a5 & 1;
  }
  v12 = v8;
  if (((a5 | a4) & 1) != 0)
  {
    if ((a4 & 1) == 0 || v10)
    {
      v19 = a3 + 1;
      v20 = a3 + 2;
      v21 = a3 + 5;
      v22 = a3 + 6;
      v23 = a3 + 7;
      if ((a4 & 1) != 0 || !v10)
      {
        v27 = 0;
        v28 = a3 + 3;
        v29 = (unsigned __int8 *)(v8 + a2 + 4);
        v30 = (_DWORD *)(a1 + 16);
        do
        {
          *(v30 - 4) = ((*(v29 - 4) + *(v29 - 3) + v29[a3 - 4] + v29[v19 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27);
          *(v30 - 3) = ((*(v29 - 3) + *(v29 - 2) + v29[v19 - 4] + v29[v20 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27 + 4);
          *(v30 - 2) = ((*(v29 - 2) + *(v29 - 1) + v29[v20 - 4] + v29[v28 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27 + 8);
          *(v30 - 1) = ((*(v29 - 1) + *v29 + v29[v28 - 4] + v29[a3] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27 + 12);
          *v30 = ((*v29 + v29[1] + v29[a3] + v29[v21 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 16);
          v30[1] = ((v29[1] + v29[2] + v29[v21 - 4] + v29[v22 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 20);
          v30[2] = ((v29[2] + v29[3] + v29[v22 - 4] + v29[v23 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 24);
          v30[3] = ((v29[3] + v29[4] + v29[v23 - 4] + v29[a3 + 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 28);
          v27 += 32;
          v30 += a3;
          v29 += a3;
        }
        while ((_DWORD)v27 != 256);
      }
      else
      {
        v24 = 0;
        v25 = (unsigned __int8 *)(v8 + a2 + 3);
        v26 = (_DWORD *)(a1 + 16);
        do
        {
          *(v26 - 4) = ((*(v25 - 3) + v25[a3 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24);
          *(v26 - 3) = ((*(v25 - 2) + v25[v19 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 4);
          *(v26 - 2) = ((*(v25 - 1) + v25[v20 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 8);
          *(v26 - 1) = ((*v25 + v25[a3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 12);
          *v26 = ((v25[1] + v25[a3 + 1] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 16);
          v26[1] = ((v25[2] + v25[v21 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 20);
          v26[2] = ((v25[3] + v25[v22 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 24);
          v26[3] = ((v25[4] + v25[v23 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 28);
          v24 += 32;
          v26 += a3;
          v25 += a3;
        }
        while ((_DWORD)v24 != 256);
      }
    }
    else
    {
      v16 = 0;
      v17 = (unsigned __int8 *)(v12 + a2 + 4);
      v18 = (_DWORD *)(a1 + 16);
      do
      {
        *(v18 - 4) = ((*(v17 - 4) + *(v17 - 3) + 1) >> 1) * *(_DWORD *)(a6 + v16);
        *(v18 - 3) = ((*(v17 - 3) + *(v17 - 2) + 1) >> 1) * *(_DWORD *)(a6 + v16 + 4);
        *(v18 - 2) = ((*(v17 - 2) + *(v17 - 1) + 1) >> 1) * *(_DWORD *)(a6 + v16 + 8);
        *(v18 - 1) = ((*(v17 - 1) + *v17 + 1) >> 1) * *(_DWORD *)(a6 + v16 + 12);
        *v18 = ((*v17 + v17[1] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 16);
        v18[1] = ((v17[1] + v17[2] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 20);
        v18[2] = ((v17[2] + v17[3] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 24);
        v18[3] = ((v17[3] + v17[4] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 28);
        v16 += 32;
        v17 += a3;
        v18 += a3;
      }
      while ((_DWORD)v16 != 256);
    }
  }
  else
  {
    v13 = 0;
    v14 = (unsigned __int8 *)(v12 + a2 + 3);
    v15 = (_DWORD *)(a1 + 16);
    do
    {
      *(v15 - 4) = *(_DWORD *)(a6 + v13) * *(v14 - 3);
      *(v15 - 3) = *(_DWORD *)(a6 + v13 + 4) * *(v14 - 2);
      *(v15 - 2) = *(_DWORD *)(a6 + v13 + 8) * *(v14 - 1);
      *(v15 - 1) = *(_DWORD *)(a6 + v13 + 12) * *v14;
      *v15 = *(_DWORD *)(a6 + v13 + 16) * v14[1];
      v15[1] = *(_DWORD *)(a6 + v13 + 20) * v14[2];
      v15[2] = *(_DWORD *)(a6 + v13 + 24) * v14[3];
      v15[3] = *(_DWORD *)(a6 + v13 + 28) * v14[4];
      v13 += 32;
      v14 += a3;
      v15 += a3;
    }
    while ((_DWORD)v13 != 256);
  }
  return 0;
}

uint64_t MC_Copy4x8Y_wtb(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  int v8;
  unint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _DWORD *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  _DWORD *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  _DWORD *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  _DWORD *v42;
  int v43;
  int v44;
  int v45;
  int v46;

  v8 = (a5 >> 1) * a3 + (a4 >> 1);
  if (a7 && a8)
  {
    v9 = a2 + v8;
    if (v9 < a7)
      return 7;
    v10 = a5 & 1;
    if (v9 + (a4 & 1) + (v10 + 7) * a3 + 7 >= a8)
      return 7;
  }
  else
  {
    v10 = a5 & 1;
  }
  v12 = v8;
  if (((a5 | a4) & 1) != 0)
  {
    if ((a4 & 1) == 0 || v10)
    {
      v27 = a3 + 1;
      v28 = a3 + 2;
      v29 = a3 + 5;
      v30 = a3 + 6;
      v31 = a3 + 7;
      if ((a4 & 1) != 0 || !v10)
      {
        v39 = 0;
        v40 = a3 + 3;
        v41 = (unsigned __int8 *)(v8 + a2 + 4);
        v42 = (_DWORD *)(a1 + 16);
        do
        {
          v43 = *(v42 - 3);
          *(v42 - 4) += ((*(v41 - 4) + *(v41 - 3) + v41[a3 - 4] + v41[v27 - 4] + 2) >> 2)
                      * *(_DWORD *)(a6 + v39);
          *(v42 - 3) = v43
                     + ((*(v41 - 3) + *(v41 - 2) + v41[v27 - 4] + v41[v28 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v39 + 4);
          v44 = *(v42 - 1);
          *(v42 - 2) += ((*(v41 - 2) + *(v41 - 1) + v41[v28 - 4] + v41[v40 - 4] + 2) >> 2)
                      * *(_DWORD *)(a6 + v39 + 8);
          *(v42 - 1) = v44
                     + ((*(v41 - 1) + *v41 + v41[v40 - 4] + v41[a3] + 2) >> 2)
                     * *(_DWORD *)(a6 + v39 + 12);
          v45 = v42[1];
          *v42 += ((*v41 + v41[1] + v41[a3] + v41[v29 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v39 + 16);
          v42[1] = v45
                 + ((v41[1] + v41[2] + v41[v29 - 4] + v41[v30 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v39 + 20);
          v46 = v42[3];
          v42[2] += ((v41[2] + v41[3] + v41[v30 - 4] + v41[v31 - 4] + 2) >> 2)
                  * *(_DWORD *)(a6 + v39 + 24);
          v42[3] = v46
                 + ((v41[3] + v41[4] + v41[v31 - 4] + v41[a3 + 4] + 2) >> 2) * *(_DWORD *)(a6 + v39 + 28);
          v39 += 32;
          v42 += a3;
          v41 += a3;
        }
        while ((_DWORD)v39 != 128);
      }
      else
      {
        v32 = 0;
        v33 = (unsigned __int8 *)(v8 + a2 + 3);
        v34 = (_DWORD *)(a1 + 16);
        do
        {
          v35 = *(v34 - 3);
          *(v34 - 4) += ((*(v33 - 3) + v33[a3 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32);
          *(v34 - 3) = v35 + ((*(v33 - 2) + v33[v27 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 4);
          v36 = *(v34 - 1);
          *(v34 - 2) += ((*(v33 - 1) + v33[v28 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 8);
          *(v34 - 1) = v36 + ((*v33 + v33[a3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 12);
          v37 = v34[1];
          *v34 += ((v33[1] + v33[a3 + 1] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 16);
          v34[1] = v37 + ((v33[2] + v33[v29 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 20);
          v38 = v34[3];
          v34[2] += ((v33[3] + v33[v30 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 24);
          v34[3] = v38 + ((v33[4] + v33[v31 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 28);
          v32 += 32;
          v34 += a3;
          v33 += a3;
        }
        while ((_DWORD)v32 != 128);
      }
    }
    else
    {
      v20 = 0;
      v21 = (unsigned __int8 *)(v12 + a2 + 4);
      v22 = (_DWORD *)(a1 + 16);
      do
      {
        v23 = *(v22 - 3);
        *(v22 - 4) += ((*(v21 - 4) + *(v21 - 3) + 1) >> 1) * *(_DWORD *)(a6 + v20);
        *(v22 - 3) = v23 + ((*(v21 - 3) + *(v21 - 2) + 1) >> 1) * *(_DWORD *)(a6 + v20 + 4);
        v24 = *(v22 - 1);
        *(v22 - 2) += ((*(v21 - 2) + *(v21 - 1) + 1) >> 1) * *(_DWORD *)(a6 + v20 + 8);
        *(v22 - 1) = v24 + ((*(v21 - 1) + *v21 + 1) >> 1) * *(_DWORD *)(a6 + v20 + 12);
        v25 = v22[1];
        *v22 += ((*v21 + v21[1] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 16);
        v22[1] = v25 + ((v21[1] + v21[2] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 20);
        v26 = v22[3];
        v22[2] += ((v21[2] + v21[3] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 24);
        v22[3] = v26 + ((v21[3] + v21[4] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 28);
        v20 += 32;
        v21 += a3;
        v22 += a3;
      }
      while ((_DWORD)v20 != 128);
    }
  }
  else
  {
    v13 = 0;
    v14 = (unsigned __int8 *)(v12 + a2 + 3);
    v15 = (_DWORD *)(a1 + 16);
    do
    {
      v16 = *(v15 - 3);
      *(v15 - 4) += *(_DWORD *)(a6 + v13) * *(v14 - 3);
      *(v15 - 3) = v16 + *(_DWORD *)(a6 + v13 + 4) * *(v14 - 2);
      v17 = *(v15 - 1);
      *(v15 - 2) += *(_DWORD *)(a6 + v13 + 8) * *(v14 - 1);
      *(v15 - 1) = v17 + *(_DWORD *)(a6 + v13 + 12) * *v14;
      v18 = v15[1];
      *v15 += *(_DWORD *)(a6 + v13 + 16) * v14[1];
      v15[1] = v18 + *(_DWORD *)(a6 + v13 + 20) * v14[2];
      v19 = v15[3];
      v15[2] += *(_DWORD *)(a6 + v13 + 24) * v14[3];
      v15[3] = v19 + *(_DWORD *)(a6 + v13 + 28) * v14[4];
      v13 += 32;
      v14 += a3;
      v15 += a3;
    }
    while ((_DWORD)v13 != 128);
  }
  return 0;
}

uint64_t MC_Copy8x4Y_wlr(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  int v8;
  unint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _DWORD *v15;
  int v16;
  int v17;
  uint64_t v18;
  unsigned __int8 *v19;
  _DWORD *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  _DWORD *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  _DWORD *v33;
  int v34;
  int v35;

  v8 = (a5 >> 1) * a3 + (a4 >> 1);
  if (a7 && a8)
  {
    v9 = a2 + v8;
    if (v9 < a7)
      return 7;
    v10 = a5 & 1;
    if (v9 + (a4 & 1) + (v10 + 7) * a3 + 7 >= a8)
      return 7;
  }
  else
  {
    v10 = a5 & 1;
  }
  v12 = v8;
  if (((a5 | a4) & 1) != 0)
  {
    if ((a4 & 1) == 0 || v10)
    {
      v23 = a3;
      v24 = a3 + 3;
      if ((a4 & 1) != 0 || !v10)
      {
        v30 = 0;
        v31 = a3 + 1;
        v32 = (unsigned __int8 *)(v12 + a2 + 2);
        v33 = (_DWORD *)(a1 + 8);
        do
        {
          v34 = *(v33 - 1);
          *(v33 - 2) += ((*(v32 - 2) + *(v32 - 1) + v32[a3 - 2] + v32[v31 - 2] + 2) >> 2)
                      * *(_DWORD *)(a6 + v30);
          *(v33 - 1) = v34
                     + ((*(v32 - 1) + *v32 + v32[v31 - 2] + v32[a3] + 2) >> 2) * *(_DWORD *)(a6 + v30 + 4);
          v35 = v33[1];
          *v33 += ((*v32 + v32[1] + v32[a3] + v32[v24 - 2] + 2) >> 2) * *(_DWORD *)(a6 + v30 + 8);
          v33[1] = v35
                 + ((v32[1] + v32[2] + v32[v24 - 2] + v32[a3 + 2] + 2) >> 2) * *(_DWORD *)(a6 + v30 + 12);
          v30 += 32;
          v33 += a3;
          v32 += a3;
        }
        while ((_DWORD)v30 != 256);
      }
      else
      {
        v25 = 0;
        v26 = (unsigned __int8 *)(v12 + a2 + 1);
        v27 = (_DWORD *)(a1 + 8);
        do
        {
          v28 = *(v27 - 1);
          *(v27 - 2) += ((*(v26 - 1) + v26[v23 - 1] + 1) >> 1) * *(_DWORD *)(a6 + v25);
          *(v27 - 1) = v28 + ((*v26 + v26[v23] + 1) >> 1) * *(_DWORD *)(a6 + v25 + 4);
          v29 = v27[1];
          *v27 += ((v26[1] + v26[v23 + 1] + 1) >> 1) * *(_DWORD *)(a6 + v25 + 8);
          v27[1] = v29 + ((v26[2] + v26[v24 - 1] + 1) >> 1) * *(_DWORD *)(a6 + v25 + 12);
          v25 += 32;
          v27 += v23;
          v26 += v23;
        }
        while ((_DWORD)v25 != 256);
      }
    }
    else
    {
      v18 = 0;
      v19 = (unsigned __int8 *)(v12 + a2 + 2);
      v20 = (_DWORD *)(a1 + 8);
      do
      {
        v21 = *(v20 - 1);
        *(v20 - 2) += ((*(v19 - 2) + *(v19 - 1) + 1) >> 1) * *(_DWORD *)(a6 + v18);
        *(v20 - 1) = v21 + ((*(v19 - 1) + *v19 + 1) >> 1) * *(_DWORD *)(a6 + v18 + 4);
        v22 = v20[1];
        *v20 += ((*v19 + v19[1] + 1) >> 1) * *(_DWORD *)(a6 + v18 + 8);
        v20[1] = v22 + ((v19[1] + v19[2] + 1) >> 1) * *(_DWORD *)(a6 + v18 + 12);
        v18 += 32;
        v19 += a3;
        v20 += a3;
      }
      while ((_DWORD)v18 != 256);
    }
  }
  else
  {
    v13 = 0;
    v14 = (unsigned __int8 *)(v12 + a2 + 1);
    v15 = (_DWORD *)(a1 + 8);
    do
    {
      v16 = *(v15 - 1);
      *(v15 - 2) += *(_DWORD *)(a6 + v13) * *(v14 - 1);
      *(v15 - 1) = v16 + *(_DWORD *)(a6 + v13 + 4) * *v14;
      v17 = v15[1];
      *v15 += *(_DWORD *)(a6 + v13 + 8) * v14[1];
      v15[1] = v17 + *(_DWORD *)(a6 + v13 + 12) * v14[2];
      v13 += 32;
      v14 += a3;
      v15 += a3;
    }
    while ((_DWORD)v13 != 256);
  }
  return 0;
}

int16x8_t SubtractPredS16(uint64_t a1, int16x8_t *a2, int a3)
{
  uint64_t v3;
  int16x8_t result;

  v3 = 0;
  do
  {
    result = vsubq_s16(*(int16x8_t *)(a1 + v3), vuzp1q_s16(*a2, a2[1]));
    *(int16x8_t *)(a1 + v3) = result;
    v3 += 16;
    a2 = (int16x8_t *)((char *)a2 + 4 * a3);
  }
  while ((_DWORD)v3 != 128);
  return result;
}

uint64_t H263ME_Init(uint64_t *a1, int a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  if (*a1)
    return 0;
  v4 = MEM_NewClear(41320);
  *a1 = (uint64_t)v4;
  if (v4)
  {
    v5 = 0;
    v4[4104] = v4;
    v6 = *a1;
    *(_DWORD *)(v6 + 39700) = a2;
    v7 = v6 + 39712;
    do
    {
      for (i = 0; i != 88; i += 4)
        *(_DWORD *)(v7 + i) = a2;
      ++v5;
      v7 += 88;
    }
    while (v5 != 18);
    return 0;
  }
  return 1;
}

uint64_t pvx(uint64_t a1, int a2, int a3, int a4, int a5)
{
  int v5;
  signed int v6;
  int v7;
  int v8;
  unsigned int v9;

  if ((a5 - 1) <= 2)
  {
    v5 = dword_22857677C[a5 - 1];
    if (a3)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if (!a2)
      goto LABEL_10;
    goto LABEL_7;
  }
  v5 = 0;
  if (!a3)
    goto LABEL_6;
LABEL_3:
  v6 = *(char *)(a1 + 288 * a2 + 12 * a3 + 288);
  if (!a2)
    goto LABEL_10;
LABEL_7:
  if (!a4)
  {
    v7 = *(char *)(a1 + 288 * a2 + 12 * a3 + 12);
    if (v5 == a3)
      v8 = 0;
    else
      v8 = *(char *)(a1 + 288 * a2 + 12 * a3 + 24);
    goto LABEL_15;
  }
LABEL_10:
  if (v5 == a3)
    v8 = 0;
  else
    v8 = v6;
  v7 = v6;
LABEL_15:
  if (v6 >= v7)
    v9 = v7;
  else
    v9 = v6;
  if (v6 <= v7)
    v6 = v7;
  if (v8 < v6)
    v6 = v8;
  if (v8 >= (int)v9)
    return v6;
  else
    return v9;
}

uint64_t pvy(uint64_t a1, int a2, int a3, int a4, int a5)
{
  int v5;
  signed int v6;
  signed int v7;
  int v8;
  unsigned int v9;

  if ((a5 - 1) <= 2)
  {
    v5 = dword_22857677C[a5 - 1];
    if (a3)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if (!a2)
      goto LABEL_10;
    goto LABEL_7;
  }
  v5 = 0;
  if (!a3)
    goto LABEL_6;
LABEL_3:
  v6 = *(char *)(a1 + 288 * a2 + 12 * a3 + 289);
  if (!a2)
    goto LABEL_10;
LABEL_7:
  if (!a4)
  {
    v7 = *(char *)(a1 + 288 * a2 + 12 * a3 + 13);
    if (v5 == a3)
      v8 = 0;
    else
      v8 = *(char *)(a1 + 288 * a2 + 12 * a3 + 25);
    goto LABEL_15;
  }
LABEL_10:
  if (v5 == a3)
    v8 = 0;
  else
    v8 = v6;
  v7 = v6;
LABEL_15:
  if (v6 >= v7)
    v9 = v7;
  else
    v9 = v6;
  if (v6 <= v7)
    v6 = v7;
  if (v8 < v6)
    v6 = v8;
  if (v8 >= (int)v9)
    return v6;
  else
    return v9;
}

uint64_t pvx4(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  signed int v15;
  uint64_t v16;
  unsigned int v18;

  if ((a6 - 1) > 2)
    v6 = 0;
  else
    v6 = dword_22857677C[a6 - 1];
  switch(a2)
  {
    case 0:
    case 1:
      if (a4)
      {
        v7 = *(char *)(a1 + 288 * a3 + 12 * a4 + 11232);
        if (!a3)
          goto LABEL_20;
      }
      else
      {
        v7 = 0;
        if (!a3)
          goto LABEL_20;
      }
      if (a5)
        goto LABEL_20;
      v10 = *(_BYTE *)(a1 + 288 * a3 + 12 * a4 + 16428);
      if (v6 == a4)
        goto LABEL_19;
      v8 = a4;
      v11 = a1 + 288 * a3;
      goto LABEL_25;
    case 2:
      v8 = a4;
      v9 = a4 + 1;
      v7 = *(char *)(a1 + 288 * a3 + 12 * v9 + 5760);
      if (!a3 || a5)
      {
LABEL_20:
        if (v6 == a4)
          v14 = 0;
        else
          v14 = v7;
        v15 = v7;
LABEL_35:
        if (v14 >= v15)
          v18 = v15;
        else
          v18 = v14;
        if (v14 >= (int)v7)
          return v18;
        else
          return v7;
      }
      v10 = *(_BYTE *)(a1 + 288 * a3 + 12 * v9 + 21888);
      if (v6 == a4)
      {
LABEL_19:
        v14 = 0;
      }
      else
      {
        v11 = a1 + 288 * a3;
LABEL_25:
        v12 = (_BYTE *)(v11 + 12 * v8);
        v13 = 16440;
LABEL_28:
        v14 = (char)v12[v13];
      }
      v15 = v7;
      v7 = v10;
      if (v15 >= v10)
        goto LABEL_35;
      if (v14 < v10)
        v7 = v14;
      if (v14 >= v15)
        return v7;
      else
        return v15;
    case 3:
      v16 = a3 + 1;
      if (a4)
        v7 = *(char *)(a1 + 288 * v16 + 12 * a4 + 21888);
      else
        v7 = 0;
      v12 = (_BYTE *)(a1 + 288 * v16 + 12 * a4);
      v10 = v12[5484];
      v13 = 10956;
      goto LABEL_28;
    case 4:
      v12 = (_BYTE *)(a1 + 288 * a3 + 12 * a4);
      v7 = (char)v12[16716];
      v10 = v12[5772];
      v13 = 11244;
      goto LABEL_28;
    default:
      v14 = 0;
      v7 = 0;
      v15 = 0;
      goto LABEL_35;
  }
}

uint64_t pvy4(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  signed int v15;
  uint64_t v16;
  unsigned int v18;

  if ((a6 - 1) > 2)
    v6 = 0;
  else
    v6 = dword_22857677C[a6 - 1];
  switch(a2)
  {
    case 0:
    case 1:
      if (a4)
      {
        v7 = *(char *)(a1 + 288 * a3 + 12 * a4 + 11233);
        if (!a3)
          goto LABEL_20;
      }
      else
      {
        v7 = 0;
        if (!a3)
          goto LABEL_20;
      }
      if (a5)
        goto LABEL_20;
      v10 = *(_BYTE *)(a1 + 288 * a3 + 12 * a4 + 16429);
      if (v6 == a4)
        goto LABEL_19;
      v8 = a4;
      v11 = a1 + 288 * a3;
      goto LABEL_25;
    case 2:
      v8 = a4;
      v9 = a4 + 1;
      v7 = *(char *)(a1 + 288 * a3 + 12 * v9 + 5761);
      if (!a3 || a5)
      {
LABEL_20:
        if (v6 == a4)
          v14 = 0;
        else
          v14 = v7;
        v15 = v7;
LABEL_35:
        if (v14 >= v15)
          v18 = v15;
        else
          v18 = v14;
        if (v14 >= (int)v7)
          return v18;
        else
          return v7;
      }
      v10 = *(_BYTE *)(a1 + 288 * a3 + 12 * v9 + 21889);
      if (v6 == a4)
      {
LABEL_19:
        v14 = 0;
      }
      else
      {
        v11 = a1 + 288 * a3;
LABEL_25:
        v12 = (_BYTE *)(v11 + 12 * v8);
        v13 = 16441;
LABEL_28:
        v14 = (char)v12[v13];
      }
      v15 = v7;
      v7 = v10;
      if (v15 >= v10)
        goto LABEL_35;
      if (v14 < v10)
        v7 = v14;
      if (v14 >= v15)
        return v7;
      else
        return v15;
    case 3:
      v16 = a3 + 1;
      if (a4)
        v7 = *(char *)(a1 + 288 * v16 + 12 * a4 + 21889);
      else
        v7 = 0;
      v12 = (_BYTE *)(a1 + 288 * v16 + 12 * a4);
      v10 = v12[5485];
      v13 = 10957;
      goto LABEL_28;
    case 4:
      v12 = (_BYTE *)(a1 + 288 * a3 + 12 * a4);
      v7 = (char)v12[16717];
      v10 = v12[5773];
      v13 = 11245;
      goto LABEL_28;
    default:
      v14 = 0;
      v7 = 0;
      v15 = 0;
      goto LABEL_35;
  }
}

uint64_t H263ME_Prep(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11)
{
  *(_DWORD *)a11 = result;
  *(_DWORD *)(a11 + 4) = a2;
  *(_DWORD *)(a11 + 8) = a8 + a4;
  *(_DWORD *)(a11 + 12) = a7 + a3;
  *(_DWORD *)(a11 + 16) = a6;
  *(_DWORD *)(a11 + 20) = a5;
  *(_DWORD *)(a11 + 24) = a6 + 32;
  *(_DWORD *)(a11 + 28) = a5 + 32;
  *(_QWORD *)(a11 + 40) = a9;
  *(_DWORD *)(a11 + 32) = a8;
  *(_DWORD *)(a11 + 36) = a7;
  *(_DWORD *)(a11 + 48) = a10;
  return result;
}

_DWORD *H263ME_Intracize(_DWORD *result)
{
  _QWORD *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  int *v19;
  uint64_t v20;
  int v21;
  int v22;

  v1 = result + 8208;
  v2 = result[8221];
  v3 = v2 / 16;
  v4 = result[8215] - v2;
  v5 = v4 + 15;
  v6 = v4 + 30;
  if (v5 >= 0)
    v6 = v5;
  if (v3 < v6 >> 4)
  {
    v7 = v6 >> 4;
    v8 = result[8220];
    v9 = v8 / 16;
    v10 = result[8214] - v8;
    v11 = v10 + 15;
    v12 = v10 + 30;
    if (v11 < 0)
      v11 = v12;
    v13 = v11 >> 4;
    v14 = (_DWORD *)v3;
    v15 = (uint64_t)v11 >> 4;
    v16 = (uint64_t)&result[3 * v9 + 8227];
    v17 = v15 - v9;
    do
    {
      if (v9 >= v13)
      {
        result = (_DWORD *)((char *)v14 + 1);
      }
      else
      {
        result = (_DWORD *)((char *)v14 + 1);
        v18 = (_DWORD *)(*v1 + 12 * v9 + 308 + 288 * (_QWORD)v14);
        v19 = (int *)(v16 + 264 * (_QWORD)v14);
        v20 = v17;
        do
        {
          *((_WORD *)v18 - 3) = 3;
          v21 = *(v19 - 2);
          *v18 = *(v19 - 1);
          v22 = *v19;
          v19 += 3;
          *((_WORD *)v18 - 1) = v22;
          *((_WORD *)v18 - 2) = v21;
          v18 += 3;
          --v20;
        }
        while (v20);
      }
      v14 = result;
    }
    while (result != (_DWORD *)v7);
  }
  return result;
}

uint64_t ME_CBAll(uint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  _DWORD *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v25;
  _DWORD *v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _DWORD *v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v50;
  _DWORD *v51;
  unint64_t v52;

  v8 = a3 + 8208;
  v9 = a3[8221];
  v10 = v9 / 16;
  v11 = a3[8215];
  v12 = v11 - v9 + 30;
  if (v11 - v9 + 15 >= 0)
    v12 = v11 - v9 + 15;
  if (v10 < v12 >> 4)
  {
    v13 = 0;
    v47 = *(_QWORD *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    v46 = *(_QWORD *)a5 + (16 * *(_DWORD *)(a5 + 24)) + 16;
    v45 = (uint64_t)(a3 + 9413);
    v14 = v10;
    v15 = a3[8220];
    v16 = a3[8214];
    v43 = result + 301;
    v17 = a3 + 8212;
    do
    {
      v18 = v15 / 16;
      v19 = v16 - v15 + 30;
      if (v16 - v15 + 15 >= 0)
        v19 = v16 - v15 + 15;
      if (v18 >= v19 >> 4)
      {
        v21 = v14 + 1;
      }
      else
      {
        v20 = (16 * v14);
        v21 = v14 + 1;
        v22 = v18;
        v44 = v43 + 288 * v14;
        v50 = v14 + 1;
        do
        {
          ++v8[2118];
          v23 = 16 * v22;
          if ((int)v20 < v8[7] && v23 < v16)
          {
            v27 = a3;
            v28 = v14;
            v29 = result;
            v30 = result + 288 * v21 + 12 * v22;
            v51 = &a3[66 * v14 + 8225 + 3 * v22];
            v31 = a3[66 * v14 + 8227 + 3 * v22];
            v32 = v20;
            Motion_MB2(v20, v23, 16, v14, a5, v47, v46, a6, v30 + 12, v17, v45, a8, 0, 0);
            v35 = *(_DWORD *)(v30 + 20);
            v34 = (_DWORD *)(v30 + 20);
            v33 = v35;
            if (*v17 && v8[5] == v13)
            {
              v36 = 3;
              a3 = v27;
              result = v29;
              v37 = v52;
              v14 = v28;
            }
            else
            {
              a3 = v27;
              v14 = v28;
              if (v33 - 64 >= v27[66 * v28 + 8226 + 3 * v22])
                v36 = 3;
              else
                v36 = 0;
              result = v29;
              v37 = v52;
            }
            v21 = v50;
            v20 = v32;
            v25 = v22 + 1;
            v52 = v37 & 0xFFFFFFFF00000000 | v31;
            *(_WORD *)(*(_QWORD *)v8 + 288 * v50 + 12 * (v22 + 1) + 2) = v36;
            if (*(_WORD *)(result + 288 * v50 + 12 * (v22 + 1) + 2) == 3)
            {
              ++v8[2117];
              v38 = v44 + 12 * v22;
              v39 = 5;
              do
              {
                *(_WORD *)(v38 - 1) = 0;
                v38 += 5472;
                --v39;
              }
              while (v39);
              v40 = a3[66 * v14 + 8226 + 3 * v22];
              *(_WORD *)(result + 288 * v50 + 12 * v25 + 6) = a3[66 * v14 + 8227 + 3 * v22];
              *v34 = v40;
              *((_WORD *)v34 - 2) = *v51;
            }
          }
          else
          {
            v25 = v22 + 1;
            v26 = (_DWORD *)(result + 288 * v21 + 12 * (v22 + 1));
            v26[2] = 0;
            *v26 = 0;
          }
          ++v13;
          v16 = v8[6];
          v15 = v8[12];
          v41 = v16 - v15 + 30;
          if (v16 - v15 + 15 >= 0)
            v41 = v16 - v15 + 15;
          v22 = v25;
        }
        while (v25 < v41 >> 4);
        v11 = v8[7];
        v9 = v8[13];
      }
      v42 = v11 - v9 + 30;
      if (v11 - v9 + 15 >= 0)
        v42 = v11 - v9 + 15;
      v14 = v21;
    }
    while (v21 < v42 >> 4);
  }
  return result;
}

uint64_t Motion_MB2(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint8x8_t *v19;
  int v20;
  char v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  _DWORD *v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  signed int v32;
  BOOL v33;
  BOOL v35;
  int v36;
  int v37;
  signed int v38;
  uint8x8_t *v39;
  int v40;
  int v41;
  int v42;
  uint8x8_t *v43;
  int v44;
  int v45;
  int v46;
  char *v47;
  int v48;
  uint8x8_t *v49;
  uint8x8_t *v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  char *v55;
  uint8x8_t *v56;
  int v57;
  uint8x8_t *v58;
  int v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  uint64_t v72;
  double v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  unsigned __int8 *v86;
  uint64_t v87;
  int v88;
  char v89;
  uint64_t v90;
  int v91;
  char v92;
  int v93;
  int v94;
  uint64_t v95;
  _BOOL4 v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  unsigned __int8 *v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  uint64_t v113;
  int v114;
  int v115;
  uint64_t v116;
  char v117;
  char v118;
  unsigned __int8 *v119;
  int v120;
  char v121;
  char v122;
  int v123;
  int v124;
  unsigned int v125;
  uint64_t result;
  uint8x8_t *v127;
  char *v128;
  uint64_t v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  uint8x8_t *v135;
  int v136;
  uint64_t v137;
  int v138;
  int v139;
  int v140;
  uint64_t v141;
  int v142;
  int v143;
  int v145;
  uint64_t v146;
  int v147;
  int v148;
  uint8x8_t *v149;

  v16 = a10[6];
  v17 = (a1 + (a14 >> 1));
  v145 = v16;
  v18 = (uint64_t)a13 >> 1;
  v19 = (uint8x8_t *)(a7 + v16 * (uint64_t)(int)v17 + a2 + (a13 >> 1));
  v149 = (uint8x8_t *)(a6 + v16 * a1 + a2);
  v20 = PredErr3(a3, v149, v19, 0x7FFFFFFF, a12, (uint64_t)a10) - 96;
  v21 = v18 + a2;
  v141 = v18 + a2;
  v138 = v20;
  v143 = v17;
  if (a8 >= 1)
  {
    LODWORD(v22) = a8 + 1;
    v23 = a10[5] + 16;
    v147 = v20;
    v24 = v18 + a2;
    v25 = a3;
    v26 = a10;
    while (1)
    {
      v27 = v22;
      while (1)
      {
        v22 = v27 >> 1;
        v28 = v25 + (v27 >> 1);
        v29 = v28 + v17;
        if ((int)(v28 + v17) <= v23)
        {
          v30 = v17 - v22;
          v31 = v24 - v22;
          v32 = v28 + v24;
          v33 = (int)(v28 + v24) > v26[4] + 16 || v31 < -16;
          if (!v33 && v30 > -17)
            break;
        }
        v35 = v27 >= 4;
        v27 >>= 1;
        if (!v35)
          goto LABEL_87;
      }
      v36 = v22 * v145;
      v37 = v26[11];
      v139 = v37;
      if (!v37)
      {
        v38 = v26[2];
        if (v32 >= v38)
          break;
      }
      v39 = (uint8x8_t *)((char *)v19 + v22);
      v135 = v39;
      v40 = v147;
      v130 = v22 * v145;
      v41 = PredErr3(v25, v149, v39, v147, a12, (uint64_t)v26);
      v37 = v139;
      if (v41 >= v147)
        v42 = 0;
      else
        v42 = v27 >> 1;
      if (v41 < v147)
        v40 = v41;
      v147 = v40;
      v43 = (uint8x8_t *)((char *)v135 - v130);
      v129 = v130;
      if (!v139)
      {
        v26 = a10;
        v25 = a3;
        v38 = a10[2];
LABEL_26:
        v136 = 0;
        if (v32 >= v38 || v30 < 0)
          goto LABEL_37;
        goto LABEL_28;
      }
      v26 = a10;
      v25 = a3;
LABEL_28:
      v127 = v43;
      v131 = v42;
      v44 = v147;
      v45 = PredErr3(v25, v149, v43, v147, a12, (uint64_t)v26);
      v43 = v127;
      v37 = v139;
      v26 = a10;
      v25 = a3;
      if (v45 < v147)
        v46 = -(int)v22;
      else
        v46 = 0;
      v136 = v46;
      if (v45 < v147)
        v42 = v27 >> 1;
      else
        v42 = v131;
      if (v45 < v147)
        v44 = v45;
      v147 = v44;
LABEL_37:
      v47 = (char *)v43 - v22;
      if (v37 || (v30 & 0x80000000) == 0)
      {
        v132 = v42;
        v48 = PredErr3(v25, v149, (uint8x8_t *)((char *)v43 - v22), v147, a12, (uint64_t)v26);
        v37 = v139;
        v42 = v132;
        if (v48 < v147)
        {
          v42 = 0;
          v136 = -(int)v22;
          v147 = v48;
        }
      }
      v49 = (uint8x8_t *)&v47[-v22];
      if (v37 || (v30 | v31) >= 0)
      {
        v51 = v147;
        v133 = v42;
        v52 = PredErr3(a3, v149, v49, v147, a12, (uint64_t)a10);
        v50 = v149;
        v37 = v139;
        v53 = v136;
        if (v52 < v147)
          v53 = -(int)v22;
        v136 = v53;
        if (v52 < v147)
          v42 = -(int)v22;
        else
          v42 = v133;
        if (v52 < v147)
          v51 = v52;
        v147 = v51;
      }
      else
      {
        v50 = v149;
      }
      v54 = v129;
      v55 = (char *)v49 + v129;
      if (v37 || (v31 & 0x80000000) == 0)
      {
        v128 = (char *)v49 + v129;
        v134 = v42;
        v61 = PredErr3(a3, v50, (uint8x8_t *)((char *)v49 + v129), v147, a12, (uint64_t)a10);
        v62 = a12;
        v55 = (char *)v49 + v129;
        v26 = a10;
        v63 = v147;
        v64 = v136;
        if (v61 >= v147)
        {
          v42 = v134;
        }
        else
        {
          v64 = 0;
          v42 = -(int)v22;
        }
        if (v61 < v147)
          v63 = v61;
        if (v139 || (v136 = v64, v29 < a10[3]) && (v62 = a12, (v31 & 0x80000000) == 0))
        {
          v65 = v42;
          v66 = PredErr3(a3, v149, (uint8x8_t *)&v128[v129], v63, v62, (uint64_t)a10);
          v26 = a10;
          if (v66 < v63)
            v64 = v27 >> 1;
          v136 = v64;
          if (v66 >= v63)
            v42 = v65;
          else
            v42 = -(int)v22;
          if (v66 < v63)
            v63 = v66;
          v147 = v63;
          v56 = (uint8x8_t *)&v128[v129 + v22];
          v25 = a3;
          v50 = v149;
          if (v139)
            goto LABEL_74;
          goto LABEL_56;
        }
        v147 = v63;
        v25 = a3;
        v50 = v149;
        v54 = v129;
      }
      else
      {
        v26 = a10;
        v25 = a3;
      }
      v56 = (uint8x8_t *)&v55[v54 + v22];
LABEL_56:
      v57 = v26[3];
      if (v29 >= v57)
      {
        v58 = (uint8x8_t *)((char *)v56 + v22);
        v59 = v147;
        v60 = v136;
        goto LABEL_79;
      }
LABEL_74:
      v59 = v147;
      v67 = v42;
      v68 = PredErr3(v25, v50, v56, v147, a12, (uint64_t)v26);
      v42 = v67;
      v60 = v136;
      if (v68 < v147)
      {
        v60 = v27 >> 1;
        v42 = 0;
        v59 = v68;
      }
      v58 = (uint8x8_t *)((char *)v56 + v22);
      if (v139)
      {
        v26 = a10;
        v25 = a3;
        v50 = v149;
LABEL_81:
        v69 = v42;
        v70 = PredErr3(v25, v50, v58, v59, a12, (uint64_t)v26);
        v42 = v69;
        v26 = a10;
        v25 = a3;
        if (v70 < v59)
        {
          v60 = v27 >> 1;
          v42 = v27 >> 1;
          v59 = v70;
        }
        goto LABEL_83;
      }
      v26 = a10;
      v25 = a3;
      v57 = a10[3];
      v50 = v149;
LABEL_79:
      if (v29 < v57 && v32 < v26[2])
        goto LABEL_81;
LABEL_83:
      v147 = v59;
      v17 = v60 + v17;
      v24 += v42;
      v19 = (uint8x8_t *)(a7 + (int)v17 * v145 + v24);
      v21 = v141;
      if (v27 <= 3)
        goto LABEL_87;
    }
    v42 = 0;
    v129 = v36;
    v43 = (uint8x8_t *)((char *)v19 + v22 - v36);
    goto LABEL_26;
  }
  v24 = v18 + a2;
  v147 = v20;
  v25 = a3;
  v26 = a10;
LABEL_87:
  *(_BYTE *)a9 = 2 * (v24 - v21);
  *(_BYTE *)(a9 + 1) = 2 * (v17 - v143);
  v71 = v147;
  *(_DWORD *)(a9 + 8) = v147;
  v72 = (2 * v25) | 1;
  LHPIntp4(v17, v24, v25, a11, a7, (uint64_t)v26);
  v81 = (uint64_t)a10;
  v82 = a3;
  v83 = (int)v72;
  v140 = a3 + 1 + v24;
  v84 = a11 + (int)v72 + 2;
  v146 = (int)v72;
  v142 = a10[11];
  v137 = v72;
  if (!v142)
  {
    v85 = a10[2];
    if (v140 >= v85)
    {
      v89 = 0;
      v90 = v84 - (int)v72;
      v86 = (unsigned __int8 *)v149;
      v87 = a12;
      v91 = 0;
      goto LABEL_95;
    }
  }
  v86 = (unsigned __int8 *)v149;
  v87 = a12;
  v88 = HP_PredErr4(a3, (unsigned __int8 *)v149, v84, v147, a12, (uint64_t)a10);
  v89 = v88 < v147;
  if (v88 < v147)
    v71 = v88;
  v90 = v84 - v83;
  v91 = v142;
  if (!v142)
  {
    v85 = a10[2];
    v82 = a3;
    v81 = (uint64_t)a10;
LABEL_95:
    v92 = 0;
    if (v140 >= v85 || (int)v17 < 1)
      goto LABEL_102;
    goto LABEL_97;
  }
  v82 = a3;
  v81 = (uint64_t)a10;
LABEL_97:
  v93 = HP_PredErr4(v82, v86, v90, v71, v87, v81);
  v81 = (uint64_t)a10;
  v82 = a3;
  if (v93 < v71)
    v92 = -1;
  else
    v92 = 0;
  if (v93 < v71)
  {
    v89 = 1;
    v71 = v93;
  }
LABEL_102:
  if (v91 || (int)v17 >= 1)
  {
    v94 = HP_PredErr4(v82, v86, v90 - 1, v71, v87, v81);
    if (v94 < v71)
    {
      v92 = -1;
      v89 = 0;
      v71 = v94;
    }
  }
  v95 = v90 - 2;
  v97 = (int)v17 > 0 && v24 > 0;
  if (v91 || v97)
  {
    v98 = HP_PredErr4(a3, v86, v95, v71, v87, (uint64_t)a10);
    if (v98 < v71)
    {
      v92 = -1;
      v89 = -1;
      v71 = v98;
    }
  }
  v148 = a3 + 1 + v17;
  v99 = v146;
  v100 = v95 + v146;
  if (v91 || v24 > 0)
  {
    v105 = a3;
    v106 = v87;
    v107 = (unsigned __int8 *)v149;
    v108 = HP_PredErr4(a3, (unsigned __int8 *)v149, v100, v71, v106, (uint64_t)a10);
    v102 = (uint64_t)a10;
    if (v108 < v71)
    {
      v92 = 0;
      v89 = -1;
      v71 = v108;
    }
    v101 = v100 + v146;
    if (!v91)
    {
      if (v148 >= a10[3])
      {
        v103 = a3;
        v87 = a12;
      }
      else
      {
        v105 = a3;
        v107 = (unsigned __int8 *)v149;
        v106 = a12;
        if (v24 >= 1)
          goto LABEL_125;
        v103 = a3;
        v87 = a12;
      }
      v99 = v146;
      v91 = v142;
      goto LABEL_119;
    }
LABEL_125:
    v109 = HP_PredErr4(v105, v107, v100 + v146, v71, v106, (uint64_t)a10);
    v102 = (uint64_t)a10;
    if (v109 < v71)
    {
      v92 = 1;
      v89 = -1;
      v71 = v109;
    }
    v104 = v101 + 1;
    v103 = v105;
    v87 = v106;
    v91 = v142;
    if (v142)
      goto LABEL_129;
    goto LABEL_128;
  }
  v101 = v100 + v146;
  v102 = (uint64_t)a10;
  v103 = a3;
LABEL_119:
  v104 = v100 + v99 + 1;
LABEL_128:
  v110 = *(_DWORD *)(v102 + 12);
  if (v148 >= v110)
  {
    v116 = v101 + 2;
    v117 = a14;
    v118 = a13;
    goto LABEL_136;
  }
LABEL_129:
  v111 = v71;
  v112 = v71;
  v113 = v102;
  v114 = HP_PredErr4(v103, (unsigned __int8 *)v149, v104, v111, v87, v102);
  if (v114 >= v112)
  {
    v115 = v112;
  }
  else
  {
    v92 = 1;
    v89 = 0;
    v115 = v114;
  }
  v116 = v101 + 2;
  if (v91)
  {
    v117 = a14;
    v118 = a13;
    v103 = a3;
    v119 = (unsigned __int8 *)v149;
    v102 = v113;
    v71 = v115;
    goto LABEL_138;
  }
  v110 = *(_DWORD *)(v113 + 12);
  v117 = a14;
  v118 = a13;
  v103 = a3;
  v102 = v113;
  v71 = v115;
LABEL_136:
  if (v148 >= v110)
  {
    v119 = (unsigned __int8 *)v149;
    goto LABEL_141;
  }
  v119 = (unsigned __int8 *)v149;
  if (v140 >= *(_DWORD *)(v102 + 8))
    goto LABEL_141;
LABEL_138:
  v120 = HP_PredErr4(v103, v119, v116, v71, v87, v102);
  v103 = a3;
  if (v120 < v71)
  {
    v92 = 1;
    v89 = 1;
    v71 = v120;
  }
LABEL_141:
  v121 = *(_BYTE *)a9 + v89;
  *(_BYTE *)a9 = v121;
  v122 = *(_BYTE *)(a9 + 1) + v92;
  *(_BYTE *)(a9 + 1) = v122;
  *(_WORD *)(a9 + 4) = 0;
  v123 = v71 + 96;
  if (v138 != v71)
    v123 = v71;
  *(_DWORD *)(a9 + 8) = v123;
  v124 = v123 + 128;
  v33 = v123 < -128;
  v125 = v123 + 383;
  if (!v33)
    v125 = v124;
  *(_WORD *)(a9 + 6) = v125 >> 8;
  result = H263ME_ResidualMean((uint64_t)v119, a7 + v143 * v137 + v141, v122, v121, v146, v103, v73, v74, v75, v76, v77, v78, v79, v80);
  *(_WORD *)(a9 + 4) = result;
  *(_BYTE *)a9 = v121 + (v118 & 0xFE);
  *(_BYTE *)(a9 + 1) = v122 + (v117 & 0xFE);
  return result;
}

uint64_t H263ME_GetVectors(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _BOOL4 a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;

  v13 = a2 + 32832;
  v14 = *(_QWORD *)(a2 + 32832);
  if (a1)
    return ME_CBAll(v14, a2, (_DWORD *)a2, a3, a4, a5, a7, a7);
  ME_CBPrimary(v14, a2, (_DWORD *)a2, a3, a4, a5, a6, a7);
  v18 = *(_QWORD *)v13;
  v19 = !a6;
  if ((*(_BYTE *)(v13 + 64) & 0x80) != 0)
    return ME_CBIntpol(v18, (_DWORD *)a2, a3, a4, v17, v19, a7);
  else
    return ME_CBSecond(v18, (_DWORD *)a2, a3, a4, a5, v19, a7);
}

uint64_t ME_CBPrimary(uint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, int a6, _BOOL4 a7, uint64_t a8)
{
  _DWORD *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  _DWORD *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _DWORD *v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v50;
  int v51;
  _DWORD *v52;
  unint64_t v53;

  v8 = a3 + 8208;
  v9 = a3[8221];
  v10 = v9 / 16;
  v11 = a3[8215];
  v12 = v11 - v9 + 30;
  if (v11 - v9 + 15 >= 0)
    v12 = v11 - v9 + 15;
  if (v10 < v12 >> 4)
  {
    v13 = 0;
    v47 = *(_QWORD *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    v46 = *(_QWORD *)a5 + (16 * *(_DWORD *)(a5 + 24)) + 16;
    v45 = (uint64_t)(a3 + 9413);
    v14 = v10;
    v15 = a3[8220];
    v16 = a3[8214];
    v43 = result + 301;
    v17 = a3 + 8212;
    do
    {
      v18 = v15 + 15;
      if (v15 >= 0)
        v18 = v15;
      v19 = v16 - v15 + 30;
      if (v16 - v15 + 15 >= 0)
        v19 = v16 - v15 + 15;
      if (a7 + (v18 >> 4) >= v19 >> 4)
      {
        v22 = v14 + 1;
      }
      else
      {
        v20 = v18 >> 4;
        v21 = 16 * v14;
        v22 = v14 + 1;
        v44 = a7;
        v23 = a7 + (uint64_t)v20;
        v24 = v43 + 12 * v23 + 288 * v14;
        v51 = 16 * v14;
        v50 = v14 + 1;
        do
        {
          ++v8[2118];
          v25 = 16 * v23;
          if (v21 < v8[7] && v25 < v16)
          {
            v28 = a3;
            v29 = v14;
            v30 = result;
            v31 = result + 288 * v22 + 12 * v23;
            v52 = &a3[66 * v14 + 8225 + 3 * v23];
            v32 = a3[66 * v14 + 8227 + 3 * v23];
            Motion_MB2(v21, v25, 16, 264, v14, v47, v46, a6, v31 + 12, v17, v45, a8, 0, 0);
            v35 = *(_DWORD *)(v31 + 20);
            v34 = (_DWORD *)(v31 + 20);
            v33 = v35;
            if (*v17 && v8[5] == v13 + v44)
            {
              v36 = 3;
              a3 = v28;
              result = v30;
              v37 = v53;
              v14 = v29;
            }
            else
            {
              a3 = v28;
              v14 = v29;
              if (v33 - 64 >= v28[66 * v29 + 8226 + 3 * v23])
                v36 = 3;
              else
                v36 = 0;
              result = v30;
              v37 = v53;
            }
            v22 = v50;
            v53 = v37 & 0xFFFFFFFF00000000 | v32;
            *(_WORD *)(*(_QWORD *)v8 + 288 * v50 + 12 * (v23 + 1) + 2) = v36;
            if (*(_WORD *)(result + 288 * v50 + 12 * (v23 + 1) + 2) == 3)
            {
              ++v8[2117];
              v38 = 5;
              v39 = v24;
              do
              {
                *(_WORD *)(v39 - 1) = 0;
                v39 += 5472;
                --v38;
              }
              while (v38);
              v40 = a3[66 * v14 + 8226 + 3 * v23];
              *(_WORD *)(result + 288 * v50 + 12 * (v23 + 1) + 6) = a3[66 * v14 + 8227 + 3 * v23];
              *v34 = v40;
              *((_WORD *)v34 - 2) = *v52;
            }
            v21 = v51;
          }
          else
          {
            v27 = result + 288 * v22 + 12 * v23;
            *(_DWORD *)(v27 + 20) = 0;
            *(_DWORD *)(v27 + 12) = 0;
          }
          v23 += 2;
          ++v13;
          v16 = v8[6];
          v15 = v8[12];
          v41 = v16 - v15 + 30;
          if (v16 - v15 + 15 >= 0)
            v41 = v16 - v15 + 15;
          v24 += 24;
        }
        while (v23 < v41 >> 4);
        v11 = v8[7];
        v9 = v8[13];
        a7 = v44;
      }
      a7 = !a7;
      v42 = v11 - v9 + 30;
      if (v11 - v9 + 15 >= 0)
        v42 = v11 - v9 + 15;
      v14 = v22;
    }
    while (v22 < v42 >> 4);
  }
  return result;
}

uint64_t ME_CBIntpol(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BOOL4 a6, uint64_t a7)
{
  _DWORD *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  char *v34;
  char *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  char v40;
  char v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  char *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  char v51;
  char v52;
  int v53;
  uint64_t v54;
  int v55;
  char *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  char v61;
  char v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  _BYTE *v69;
  int v70;
  int v71;
  int v72;
  int v73;
  char v74;
  char v75;
  int v76;
  int v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  int v82;
  unsigned int v83;
  _WORD *v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  uint64_t v90;
  char v91;
  unsigned int v92;
  unsigned int v93;
  uint8x8_t *v94;
  _BOOL4 v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  _WORD *v99;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int *v115;
  int *v116;
  int *v117;
  int *v118;
  int *v119;
  int *v120;
  int *v121;
  int *v122;
  int v123;
  char v124;
  int v125;
  uint8x8_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v130;
  uint64_t v131;
  int v132;

  v7 = a2 + 8212;
  v8 = a2[8221] / 16;
  v9 = a2[8215];
  v10 = v9 + 8;
  if (v9 < -8)
    v10 = v9 + 23;
  if (v8 < v10 >> 4)
  {
    v11 = result;
    v12 = 0;
    v96 = *(_QWORD *)a3 + (16 * *(_DWORD *)(a3 + 24)) + 16;
    v127 = *(_QWORD *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    v94 = (uint8x8_t *)(a2 + 9413);
    v13 = v8;
    v14 = a2[8214];
    v90 = result + 301;
    v128 = result;
    while (1)
    {
      v15 = v14 + 8;
      if (v14 < -8)
        v15 = v14 + 23;
      if (a6 + v7[8] / 16 < v15 >> 4)
        break;
      v17 = v13 + 1;
LABEL_114:
      a6 = !a6;
      v89 = v9 + 8;
      if (v9 < -8)
        v89 = v9 + 23;
      v13 = v17;
      if (v17 >= v89 >> 4)
        return result;
    }
    v16 = 16 * v13;
    v17 = v13 + 1;
    v92 = v13 + 2;
    v93 = v13;
    v95 = a6;
    v18 = a6 + (uint64_t)(v7[8] / 16);
    v19 = 12 * v18 + 288 * v13;
    v20 = v11 + v19;
    v21 = v90 + v19;
    v130 = v13 + 1;
    v131 = v13;
    v132 = 16 * v13;
    while (1)
    {
      ++v7[2114];
      v22 = 16 * (int)v18;
      v23 = v7[3];
      if (v16 < v23 && (int)v22 < v14)
        break;
      v25 = 5;
      v26 = v20;
      do
      {
        *(_DWORD *)(v26 + 308) = 0;
        *(_DWORD *)(v26 + 300) = 0;
        *(_WORD *)(v26 + 306) = 0;
        v26 += 5472;
        --v25;
      }
      while (v25);
LABEL_109:
      v18 += 2;
      v12 += 2;
      v14 = v7[2];
      v88 = v14 + 8;
      if (v14 < -8)
        v88 = v14 + 23;
      v20 += 24;
      v21 += 24;
      if (v18 >= v88 >> 4)
      {
        v9 = v7[3];
        a6 = v95;
        goto LABEL_114;
      }
    }
    v27 = v7[6];
    v98 = (int)v22;
    v126 = (uint8x8_t *)(v96 + v27 * v16 + (int)v22);
    result = PredErr3(16, v126, (uint8x8_t *)(v127 + v27 * v16 + (int)v22), 0x7FFFFFFF, a7, (uint64_t)v7);
    v17 = v130;
    v28 = v131;
    v11 = v128;
    v29 = result - 96;
    v30 = result - 96;
    v31 = v18 + 1;
    v32 = v128 + 288 * v130 + 12 * (v18 + 1);
    *(_DWORD *)(v32 + 8) = result - 96;
    v33 = (int *)(v32 + 8);
    v99 = (_WORD *)(v128 + 288 * v130 + 12 * (v18 + 1));
    *v99 = 0;
    v34 = (char *)v99 + 1;
    if (v131 < 1)
      goto LABEL_56;
    v123 = result - 96;
    if (v131 < v23 / 16 - 1)
    {
      v35 = (char *)(v128 + 288 * v93 + 12 * v31);
      v36 = *v35;
      v37 = v36 & 1;
      v38 = v35[1];
      v39 = v38 & 1;
      if (v37 | v39)
      {
        result = (v132 + (v38 >> 1));
        v44 = v22 + (v36 >> 1);
        if (v7[11]
          || (((_DWORD)result + v39) & 0x80000000) == 0
          && (int)result + v39 + 16 < v7[5]
          && ((v44 + v37) & 0x80000000) == 0
          && v44 + v37 + 16 < v7[4])
        {
          v116 = v33;
          v102 = v29;
          v45 = v29;
          DHPIntp(result, v44, v39, v37, 16, (uint64_t)v94, v127, (uint64_t)v7);
          result = DHPErr(16, v126, v94, v45, a7, (uint64_t)v7);
          v29 = v102;
          v31 = v18 + 1;
          v33 = v116;
          v17 = v130;
          v28 = v131;
          v11 = v128;
          if ((int)result < v102)
          {
            *v116 = result;
            *(_BYTE *)v99 = *v35;
            v41 = v35[1];
            goto LABEL_26;
          }
        }
      }
      else
      {
        v40 = *v35;
        v41 = v38;
        if (v38 | v36)
        {
          v42 = v132 + ((char)v38 >> 1);
          v43 = v22 + (v40 >> 1);
          if (v7[11]
            || (v42 & 0x80000000) == 0
            && v42 + 16 < v7[5]
            && (v43 & 0x80000000) == 0
            && (v30 = result - 96, (int)v43 + 16 < v7[4]))
          {
            v115 = v33;
            v101 = result - 96;
            result = PredErr3(16, v126, (uint8x8_t *)(v127 + v42 * v27 + v43), v30, a7, (uint64_t)v7);
            v29 = v101;
            v31 = v18 + 1;
            v33 = v115;
            v17 = v130;
            v28 = v131;
            v11 = v128;
            if ((int)result < v101)
            {
              *v115 = result;
              *(_BYTE *)v99 = v40;
LABEL_26:
              v123 = result;
              *v34 = v41;
            }
          }
        }
      }
    }
    if (v28 >= v7[3] / 16 - 1)
      goto LABEL_55;
    v46 = (char *)(v11 + 288 * v92 + 12 * v31);
    v47 = *v46;
    v48 = v47 & 1;
    v49 = v46[1];
    v50 = v49 & 1;
    if (!(v48 | v50))
    {
      v51 = *v46;
      v52 = v46[1];
      if (!(v49 | v47))
        goto LABEL_55;
      v53 = v132 + ((char)v49 >> 1);
      v54 = (int)v22 + (uint64_t)(v51 >> 1);
      if (!v7[11] && (v53 < 0 || v53 + 16 >= v7[5] || (v54 & 0x80000000) != 0 || (int)v54 + 16 >= v7[4]))
        goto LABEL_55;
      v91 = v51;
      v117 = v33;
      v109 = v31;
      v103 = v29;
      result = PredErr3(16, v126, (uint8x8_t *)(v127 + (int)v7[6] * (uint64_t)v53 + v54), v123, a7, (uint64_t)v7);
      v30 = v123;
      v29 = v103;
      v31 = v109;
      v33 = v117;
      v17 = v130;
      v28 = v131;
      v11 = v128;
      if ((int)result >= v123)
        goto LABEL_56;
      *v117 = result;
      *(_BYTE *)v99 = v91;
LABEL_45:
      v30 = result;
      *v34 = v52;
      goto LABEL_56;
    }
    result = (v132 + (v49 >> 1));
    v55 = v22 + (v47 >> 1);
    if (v7[11])
    {
LABEL_43:
      v110 = v31;
      v118 = v33;
      v104 = v29;
      DHPIntp(result, v55, v50, v48, 16, (uint64_t)v94, v127, (uint64_t)v7);
      result = DHPErr(16, v126, v94, v123, a7, (uint64_t)v7);
      v30 = v123;
      v29 = v104;
      v31 = v110;
      v33 = v118;
      v17 = v130;
      v28 = v131;
      v11 = v128;
      if ((int)result >= v123)
        goto LABEL_56;
      *v118 = result;
      *(_BYTE *)v99 = *v46;
      v52 = v46[1];
      goto LABEL_45;
    }
    if ((_DWORD)result + v50 < 0)
    {
LABEL_55:
      v30 = v123;
      goto LABEL_56;
    }
    v30 = v123;
    if ((int)result + v50 + 16 < v7[5] && ((v55 + v48) & 0x80000000) == 0)
    {
      if (v55 + v48 + 16 < v7[4])
        goto LABEL_43;
      goto LABEL_55;
    }
LABEL_56:
    if (v18 < 1)
      goto LABEL_82;
    if (v18 < v7[2] / 16 - 1)
    {
      v56 = (char *)(v11 + 288 * v17 + 12 * v18);
      v57 = *v56;
      v58 = v57 & 1;
      v59 = v56[1];
      v60 = v59 & 1;
      if (v58 | v60)
      {
        result = (v132 + (v59 >> 1));
        v66 = v22 + (v57 >> 1);
        if (!v7[11]
          && ((_DWORD)result + v60 < 0 || (int)result + v60 + 16 >= v7[5] || v66 + v58 < 0 || v66 + v58 + 16 >= v7[4]))
        {
          goto LABEL_76;
        }
        v112 = v31;
        v120 = v33;
        v106 = v29;
        v125 = v30;
        DHPIntp(result, v66, v60, v58, 16, (uint64_t)v94, v127, (uint64_t)v7);
        result = DHPErr(16, v126, v94, v125, a7, (uint64_t)v7);
        v30 = v125;
        v29 = v106;
        v31 = v112;
        v33 = v120;
        v17 = v130;
        v28 = v131;
        v11 = v128;
        if ((int)result >= v125)
          goto LABEL_76;
        *v120 = result;
        *(_BYTE *)v99 = *v56;
        v62 = v56[1];
      }
      else
      {
        v61 = *v56;
        v62 = v56[1];
        if (!(v59 | v57))
          goto LABEL_76;
        v63 = v30;
        v64 = v132 + ((char)v59 >> 1);
        v65 = (int)v22 + (uint64_t)(v61 >> 1);
        if (!v7[11] && (v64 < 0 || v64 + 16 >= v7[5] || (v65 & 0x80000000) != 0 || (int)v65 + 16 >= v7[4]))
          goto LABEL_76;
        v124 = v61;
        v119 = v33;
        v111 = v31;
        v105 = v29;
        result = PredErr3(16, v126, (uint8x8_t *)(v127 + (int)v7[6] * (uint64_t)v64 + v65), v30, a7, (uint64_t)v7);
        v30 = v63;
        v29 = v105;
        v31 = v111;
        v33 = v119;
        v17 = v130;
        v28 = v131;
        v11 = v128;
        if ((int)result >= v63)
          goto LABEL_76;
        *v119 = result;
        *(_BYTE *)v99 = v124;
      }
      v30 = result;
      *v34 = v62;
    }
LABEL_76:
    if (v18 >= v7[2] / 16 - 1)
    {
      v16 = v132;
      goto LABEL_97;
    }
    v67 = v11 + 288 * v17 + 12 * v18;
    v70 = *(char *)(v67 + 24);
    v69 = (_BYTE *)(v67 + 24);
    v68 = v70;
    v71 = v70 & 1;
    v72 = (char)v69[1];
    v73 = v72 & 1;
    if (v71 | v73)
    {
      v16 = v132;
      result = (v132 + (v72 >> 1));
      v79 = v22 + (v68 >> 1);
      if (!v7[11]
        && ((_DWORD)result + v73 < 0 || (int)result + v73 + 16 >= v7[5] || v79 + v71 < 0 || v79 + v71 + 16 >= v7[4]))
      {
        goto LABEL_97;
      }
      v97 = (char *)v99 + 1;
      v114 = v31;
      v122 = v33;
      v108 = v29;
      v80 = v30;
      DHPIntp(result, v79, v73, v71, 16, (uint64_t)v94, v127, (uint64_t)v7);
      result = DHPErr(16, v126, v94, v80, a7, (uint64_t)v7);
      v30 = v80;
      v29 = v108;
      v31 = v114;
      v33 = v122;
      v16 = v132;
      v17 = v130;
      v28 = v131;
      v11 = v128;
      if ((int)result >= v80)
        goto LABEL_97;
      *(_BYTE *)v99 = *v69;
      v75 = v69[1];
LABEL_87:
      v30 = result;
      *v97 = v75;
      goto LABEL_97;
    }
    v74 = v68;
    v75 = v72;
    if (v72 | v68)
    {
      v76 = v30;
      v16 = v132;
      v77 = v132 + ((char)v72 >> 1);
      v78 = v98 + (v74 >> 1);
      if (!v7[11] && (v77 < 0 || v77 + 16 >= v7[5] || (v78 & 0x80000000) != 0 || (int)v78 + 16 >= v7[4]))
        goto LABEL_97;
      v97 = (char *)v99 + 1;
      v121 = v33;
      v113 = v31;
      v107 = v29;
      result = PredErr3(16, v126, (uint8x8_t *)(v127 + (int)v7[6] * (uint64_t)v77 + v78), v30, a7, (uint64_t)v7);
      v30 = v76;
      v29 = v107;
      v31 = v113;
      v33 = v121;
      v16 = v132;
      v17 = v130;
      v28 = v131;
      v11 = v128;
      if ((int)result >= v76)
        goto LABEL_97;
      *(_BYTE *)v99 = v74;
      goto LABEL_87;
    }
LABEL_82:
    v16 = v132;
LABEL_97:
    v81 = v11 + 288 * v17 + 12 * v31;
    if (v29 == v30)
      v82 = v30 + 96;
    else
      v82 = v30;
    v83 = v82 + 128;
    if (v82 < -128)
      v83 = v82 + 383;
    *(_WORD *)(v81 + 6) = v83 >> 8;
    v84 = (_WORD *)(v81 + 6);
    *(v84 - 1) = 0;
    *v33 = v82;
    if (*v7 && v7[1] == v12 + v95 || v82 - 64 >= a2[66 * v28 + 8226 + 3 * v18])
    {
      *(_WORD *)(v11 + 288 * v17 + 12 * v31 + 2) = 3;
      ++v7[2113];
      v85 = 5;
      v86 = v21;
      do
      {
        *(_WORD *)(v86 - 1) = 0;
        v86 += 5472;
        --v85;
      }
      while (v85);
      *v84 = a2[66 * v28 + 8227 + 3 * v18];
      v87 = a2[66 * v28 + 8225 + 3 * v18];
      *v33 = a2[66 * v28 + 8226 + 3 * v18];
      *(v84 - 1) = v87;
    }
    else
    {
      *(_WORD *)(v11 + 288 * v17 + 12 * v31 + 2) = 0;
    }
    goto LABEL_109;
  }
  return result;
}

uint64_t ME_CBSecond(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, _BOOL4 a6, uint64_t a7)
{
  _DWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _DWORD *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned __int8 v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  int v38;
  unsigned __int8 v39;
  unsigned int v40;
  int v41;
  int v42;
  unsigned __int8 v43;
  unsigned int v44;
  int v45;
  char *v46;
  int v47;
  unsigned __int8 v48;
  unsigned int v49;
  int v50;
  int v51;
  unsigned __int8 v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  int v56;
  unsigned __int8 v57;
  unsigned int v58;
  int v59;
  int v60;
  unsigned __int8 v61;
  unsigned int v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  _DWORD *v69;
  int v70;
  __int16 v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  _DWORD *v81;
  int v82;
  _WORD *v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  _BOOL4 v89;
  uint64_t v90;
  uint64_t v92;
  uint64_t v93;
  _DWORD *v94;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _DWORD *v99;
  unint64_t v101;

  v7 = a2 + 8208;
  v8 = a2[8221];
  v9 = v8 / 16;
  v10 = a2[8215];
  v11 = v10 - v8 + 30;
  if (v10 - v8 + 15 >= 0)
    v11 = v10 - v8 + 15;
  if (v9 < v11 >> 4)
  {
    v12 = a2;
    v13 = result;
    v14 = 0;
    v94 = a2 + 8212;
    v93 = *(_QWORD *)a3 + (16 * *(_DWORD *)(a3 + 24)) + 16;
    v92 = *(_QWORD *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    v90 = (uint64_t)(a2 + 9413);
    v15 = v9;
    v16 = a2[8220];
    v17 = a2[8214];
    v86 = result + 301;
    while (1)
    {
      v18 = v16 + 15;
      if (v16 >= 0)
        v18 = v16;
      v19 = v17 - v16 + 30;
      if (v17 - v16 + 15 >= 0)
        v19 = v17 - v16 + 15;
      if (a6 + (v18 >> 4) < v19 >> 4)
        break;
      v20 = v15 + 1;
LABEL_84:
      a6 = !a6;
      v85 = v10 - v8 + 30;
      if (v10 - v8 + 15 >= 0)
        v85 = v10 - v8 + 15;
      v15 = v20;
      if (v20 >= v85 >> 4)
        return result;
    }
    result = 16 * (int)v15;
    v20 = v15 + 1;
    v87 = v15 + 2;
    v88 = v15;
    v89 = a6;
    v21 = a6 + (uint64_t)(v18 >> 4);
    v22 = 12 * v21 + 288 * v15;
    v23 = v13 + v22;
    v24 = v86 + v22;
    v97 = v15;
    v98 = v15 + 1;
    v96 = result;
    while (1)
    {
      ++v7[2118];
      v25 = 16 * v21;
      if ((int)result >= v7[7] || v25 >= v17)
      {
        v27 = 5;
        v28 = v23;
        do
        {
          *(_DWORD *)(v28 + 308) = 0;
          *(_DWORD *)(v28 + 300) = 0;
          *(_WORD *)(v28 + 306) = 0;
          v28 += 5472;
          --v27;
        }
        while (v27);
        goto LABEL_79;
      }
      v29 = a5;
      if ((v7[16] & 0x80) == 0)
        goto LABEL_59;
      if (v15 < 1)
      {
        v36 = 0;
      }
      else
      {
        v30 = v13 + 288 * v88 + 12 * v21;
        v31 = *(char *)(v30 + 12);
        if (v31 < 0)
          v31 = -v31;
        v32 = (v31 + 1) >> 1;
        v33 = *(char *)(v30 + 13);
        if (v33 < 0)
          v33 = -v33;
        v34 = v33 + 1;
        v35 = v34 & 0xFE;
        v36 = v34 >> 1;
        if (v32 > v35 >> 1)
          v36 = v32;
      }
      if (v15 < v7[7] / 16 - 1)
      {
        v37 = v13 + 288 * v87 + 12 * v21;
        v38 = *(char *)(v37 + 12);
        if (v38 < 0)
          v38 = -v38;
        v39 = v38 + 1;
        v40 = v39 & 0xFE;
        v41 = v39 >> 1;
        v42 = *(char *)(v37 + 13);
        if (v42 < 0)
          v42 = -v42;
        v43 = v42 + 1;
        v44 = v43 & 0xFE;
        v45 = v43 >> 1;
        if (v36 <= (int)(v40 >> 1))
          v36 = v41;
        if (v36 <= v44 >> 1)
          v36 = v45;
      }
      if (v21 >= 1)
      {
        v46 = (char *)(v13 + 288 * v20 + 12 * v21);
        v47 = *v46;
        if (v47 < 0)
          v47 = -v47;
        v48 = v47 + 1;
        v49 = v48 & 0xFE;
        v50 = v48 >> 1;
        v51 = v46[1];
        if (v51 < 0)
          v51 = -v51;
        v52 = v51 + 1;
        v53 = v52 & 0xFE;
        v54 = v52 >> 1;
        if (v36 <= (int)(v49 >> 1))
          v36 = v50;
        if (v36 <= v53 >> 1)
          v36 = v54;
      }
      if (v21 < v17 / 16 - 1)
      {
        v55 = v13 + 288 * v20 + 12 * v21;
        v56 = *(char *)(v55 + 24);
        if (v56 < 0)
          v56 = -v56;
        v57 = v56 + 1;
        v58 = v57 & 0xFE;
        v59 = v57 >> 1;
        v60 = *(char *)(v55 + 25);
        if (v60 < 0)
          v60 = -v60;
        v61 = v60 + 1;
        v62 = v61 & 0xFE;
        v63 = v61 >> 1;
        if (v36 <= (int)(v58 >> 1))
          v36 = v59;
        if (v36 <= v62 >> 1)
          v36 = v63;
      }
      v64 = a5;
      if (v36)
      {
        do
        {
          v29 = v64;
          if (v64 < 1)
            break;
          v64 = v64 >> 1;
        }
        while (v36 > v29 || v36 <= v64);
LABEL_59:
        v65 = v13;
        v66 = v13 + 288 * v20 + 12 * v21;
        v99 = &v12[66 * v15 + 8225 + 3 * v21];
        v67 = v12[66 * v15 + 8227 + 3 * v21];
        Motion_MB2(result, v25, 16, 264, v15, v93, v92, v29, v66 + 12, v94, v90, a7, 0, 0);
        v70 = *(_DWORD *)(v66 + 20);
        v69 = (_DWORD *)(v66 + 20);
        v68 = v70;
        if (*v94 && v7[5] == v14 + v89)
        {
          v71 = 3;
          v12 = a2;
          v72 = v101;
          v15 = v97;
        }
        else
        {
          v12 = a2;
          v15 = v97;
          if (v68 - 64 >= a2[66 * v97 + 8226 + 3 * v21])
            v71 = 3;
          else
            v71 = 0;
          v72 = v101;
        }
        v20 = v98;
        result = v96;
        v101 = v72 & 0xFFFFFFFF00000000 | v67;
        *(_WORD *)(*(_QWORD *)v7 + 288 * v98 + 12 * (v21 + 1) + 2) = v71;
        v13 = v65;
        if (*(_WORD *)(v65 + 288 * v98 + 12 * (v21 + 1) + 2) == 3)
        {
          ++v7[2117];
          v73 = 5;
          v74 = v24;
          do
          {
            *(_WORD *)(v74 - 1) = 0;
            v74 += 5472;
            --v73;
          }
          while (v73);
          v75 = v12[66 * v15 + 8226 + 3 * v21];
          *(_WORD *)(v65 + 288 * v98 + 12 * (v21 + 1) + 6) = v12[66 * v15 + 8227 + 3 * v21];
          *v69 = v75;
          *((_WORD *)v69 - 2) = *v99;
        }
        goto LABEL_79;
      }
      v76 = v21 + 1;
      v77 = 5;
      v78 = v24;
      do
      {
        *(_WORD *)(v78 - 1) = 0;
        v78 += 5472;
        --v77;
      }
      while (v77);
      v79 = PredErr3(16, (uint8x8_t *)(v93 + (int)v7[10] * result + v25), (uint8x8_t *)(v92 + (int)v7[10] * result + v25), 0x7FFFFFFF, a7, (uint64_t)v94);
      v20 = v98;
      v80 = v13 + 288 * v98 + 12 * v76;
      *(_DWORD *)(v80 + 8) = v79;
      v81 = (_DWORD *)(v80 + 8);
      if (v7[4])
      {
        if (v7[5] == v14 + v89)
          break;
      }
      v12 = a2;
      v15 = v97;
      v82 = a2[66 * v97 + 8226 + 3 * v21];
      if (v79 - 64 >= v82)
        goto LABEL_77;
      *(_WORD *)(v13 + 288 * v98 + 12 * v76 + 2) = 0;
LABEL_78:
      result = v96;
LABEL_79:
      v21 += 2;
      v14 += 2;
      v17 = v7[6];
      v16 = v7[12];
      v84 = v17 - v16 + 30;
      if (v17 - v16 + 15 >= 0)
        v84 = v17 - v16 + 15;
      v23 += 24;
      v24 += 24;
      if (v21 >= v84 >> 4)
      {
        v10 = v7[7];
        v8 = v7[13];
        a6 = v89;
        goto LABEL_84;
      }
    }
    v12 = a2;
    v15 = v97;
    v82 = a2[66 * v97 + 8226 + 3 * v21];
LABEL_77:
    v83 = (_WORD *)(v13 + 288 * v98 + 12 * v76);
    v83[1] = 3;
    v83[3] = v12[66 * v15 + 8227 + 3 * v21];
    *v81 = v82;
    v83[2] = v12[66 * v15 + 8225 + 3 * v21];
    goto LABEL_78;
  }
  return result;
}

uint64_t H263ME_GetVectorsUMV(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  _DWORD *v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  unsigned int v52;
  uint64_t v53;
  _DWORD *v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  unint64_t v68;
  _DWORD *v69;
  uint64_t v70;
  uint64_t v71;
  int v73;
  _DWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  int v86;
  uint64_t v87;

  v8 = (_DWORD *)(result + 32832);
  v9 = *(_DWORD *)(result + 32884) / 16;
  v10 = *(_DWORD *)(result + 32860);
  v12 = v10 + 15;
  v11 = v10 < -15;
  v13 = v10 + 30;
  if (!v11)
    v13 = v12;
  LODWORD(v14) = (__int16)(v13 >> 4);
  if ((int)v14 > (__int16)v9)
  {
    v15 = result;
    v16 = 0;
    v71 = result + 32848;
    v76 = *(_QWORD *)a2 + (16 * *(_DWORD *)(a2 + 24)) + 16;
    v75 = *(_QWORD *)a3 + (16 * *(_DWORD *)(a3 + 24)) + 16;
    v17 = *(_DWORD *)(result + 32856);
    v18 = v17 + 15;
    v11 = v17 < -15;
    v19 = v17 + 30;
    if (!v11)
      v19 = v18;
    v21 = (__int16)(v19 >> 4);
    v70 = result + 37652;
    v20 = (__int16)(*(_DWORD *)(result + 32880) / 16);
    v64 = v21 - v20;
    v87 = (__int16)v9;
    v14 = (int)v14;
    v78 = v21;
    v65 = (__int16)(*(_DWORD *)(result + 32880) / 16);
    v63 = (int)v14;
    v66 = v20;
    v69 = (_DWORD *)result;
    v74 = (_DWORD *)(result + 32832);
    do
    {
      if (v20 >= (int)v78)
      {
        v38 = v87 + 1;
      }
      else
      {
        if ((int)v87 >= 0)
          v22 = v87 & 1;
        else
          v22 = -(v87 & 1);
        v23 = *(_QWORD *)v8;
        v24 = 12 * v65 + 301 + 288 * v87;
        v25 = v65;
        v67 = v16;
        LODWORD(result) = v16;
        v86 = v20;
        v79 = v87 + 1;
        v73 = 16 * v87;
        do
        {
          v84 = result;
          v82 = v24;
          v85 = v25 + 1;
          v26 = v22 + 1;
          ++v8[2118];
          v27 = v8;
          v28 = *(char *)(a6 + v87);
          v29 = pvx(v23, v87, v25, v28, a7);
          v30 = pvy(v23, v87, v25, v28, a7);
          if (v29 <= -32)
            v33 = -32;
          else
            v33 = v29;
          if (v33 >= 32)
            v34 = 32;
          else
            v34 = v33;
          if (v30 <= -32)
            v35 = -32;
          else
            v35 = v30;
          if (v35 >= 32)
            v36 = 32;
          else
            v36 = v35;
          v37 = v27[16];
          v83 = v26;
          if ((v37 & 1) != 0 || (v26 & 1) != 0)
          {
            v39 = v25 + 1;
            if ((v37 & 0x80) != 0)
            {
              v68 = v68 & 0xFFFFFFFF00000000 | *(unsigned int *)(v15 + 264 * v87 + 12 * v25 + 32908);
              v44 = (_DWORD *)v71;
              v41 = v75;
              v42 = v76;
              Motion_MB3(v73, 16 * v86, 16, v31, v32, v76, v75, a4, v23 + 288 * v79 + 12 * v85, v71, v62, *(_QWORD *)(a8 + 8), v34, v36);
              v47 = 16 * v86;
              v45 = 16 * (int)v87;
              v43 = v87 + 1;
              v48 = (_BYTE *)(v23 + 288 * v79 + 12 * v85);
              v46 = a8;
            }
            else
            {
              v40 = (_DWORD *)v15;
              v41 = v75;
              v42 = v76;
              Motion_MB4step(v73, 16 * v86, 16, v76, v75, a4, v23 + 288 * v79 + 12 * v85, v40, v34, v36, a8);
              if (*(int *)(v23 + 288 * v79 + 12 * v85 + 8) < 601)
              {
                v43 = v87 + 1;
                v44 = (_DWORD *)v71;
                v45 = 16 * (int)v87;
                v48 = (_BYTE *)(v23 + 288 * v79 + 12 * v85);
                v46 = a8;
                v47 = 16 * v86;
              }
              else
              {
                Motion_MBFS(v73, 16 * v86, 16, v76, v75, a4, v23 + 288 * v79 + 12 * v85, (uint64_t)v40, v34, v36, a8);
                v39 = v25 + 1;
                v43 = v87 + 1;
                v44 = (_DWORD *)v71;
                v45 = 16 * (int)v87;
                v46 = a8;
                v47 = 16 * v86;
                v48 = (_BYTE *)(v23 + 288 * v79 + 12 * v85);
              }
            }
            v49 = v23 + 288 * v43 + 12 * v39;
            v8 = v74;
            v50 = v41;
            v38 = v43;
            v51 = Motion_DoHalfPel(v48, 16, (v45 + (*(char *)(v49 + 1) >> 1)), v47 + ((char)*v48 >> 1), *(unsigned int *)(v49 + 8), v50, (unsigned __int8 *)(v42 + (int)v74[10] * v45 + v47), v70, v44, *(_QWORD *)(v46 + 8));
            *(_DWORD *)(v49 + 8) = v51;
            v52 = v51 + 128;
            if (v51 < -128)
              v52 = v51 + 383;
            *(_WORD *)(v49 + 6) = v52 >> 8;
            v15 = (uint64_t)v69;
          }
          else
          {
            Motion_MB_UMVInterp(v87, v25, 16, v76, v75, v23, *(_QWORD *)(a8 + 8), v34, v36, v15, a7);
            v8 = v74;
            v38 = v87 + 1;
            v39 = v25 + 1;
          }
          v23 = *(_QWORD *)v8;
          v53 = *(_QWORD *)v8 + 288 * v38 + 12 * v39;
          v56 = *(_DWORD *)(v53 + 8);
          v54 = (_DWORD *)(v53 + 8);
          v55 = v56;
          v57 = v39;
          if (v8[4] && v8[5] == v84 || v55 - 64 >= *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32904))
          {
            *(_WORD *)(v23 + 288 * v38 + 12 * v39 + 2) = 3;
            ++v8[2117];
            v58 = v82;
            v59 = v23 + v82;
            v60 = 5;
            do
            {
              *(_WORD *)(v59 - 1) = 0;
              v59 += 5472;
              --v60;
            }
            while (v60);
            v61 = *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32900);
            *v54 = *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32904);
            *(_WORD *)(v23 + 288 * v38 + 12 * v39 + 6) = *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32908);
            *((_WORD *)v54 - 2) = v61;
            v22 = v83;
          }
          else
          {
            *(_WORD *)(v23 + 288 * v38 + 12 * v39 + 2) = 0;
            v22 = v83;
            v58 = v82;
          }
          ++v86;
          result = (v84 + 1);
          v24 = v58 + 12;
          v25 = v57;
        }
        while (v57 != v78);
        v20 = v66;
        v16 = v64 + v67;
        v14 = v63;
      }
      v87 = v38;
    }
    while (v38 != v14);
  }
  return result;
}

uint64_t Motion_MB3(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  double v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  _DWORD *v40;
  unsigned int v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  BOOL v47;
  BOOL v49;
  int v50;
  uint8x8_t *v51;
  int v52;
  int v53;
  signed int v54;
  unsigned int v55;
  uint8x8_t *v56;
  int v57;
  signed int v58;
  unsigned int v59;
  char *v60;
  uint64_t v61;
  char *v62;
  int v63;
  signed int v64;
  signed int v65;
  uint64_t v66;
  uint8x8_t *v67;
  uint8x8_t *v68;
  int v69;
  uint8x8_t *v70;
  signed int v71;
  uint64_t v72;
  uint8x8_t *v73;
  signed int v74;
  signed int v75;
  signed int v76;
  signed int v77;
  uint64_t v78;
  _DWORD *v79;
  int v80;
  uint64_t v81;
  unsigned int v82;
  unsigned int v83;
  char v84;
  char v85;
  int v86;
  unsigned int v87;
  uint64_t result;
  int v89;
  char *v90;
  uint8x8_t *v91;
  int v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint8x8_t *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  char *v100;
  uint8x8_t *v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  int v112;
  uint8x8_t *v113;
  signed int v114;
  signed int v115;
  int v116;
  char *v117;
  signed int v118;
  uint8x8_t *v119;
  int v120;
  uint8x8_t *v121;

  v18 = a9;
  v19 = *(_DWORD *)(a10 + 24);
  v121 = (uint8x8_t *)(a6 + v19 * a1 + a2);
  v20 = a1 + (a14 >> 1);
  v120 = v19;
  v21 = a7 + v19 * v20;
  v22 = (uint64_t)a13 >> 1;
  v113 = (uint8x8_t *)(v21 + a2 + (a13 >> 1));
  v23 = PredErr3(a3, v121, v113, 0x7FFFFFFF, a12, a10);
  v32 = v23 - 96;
  v33 = v22 + a2;
  v108 = v21;
  if (a8 >= 1)
  {
    v97 = a7;
    LODWORD(v34) = a8 + 1;
    v35 = *(_DWORD *)(a10 + 20) + 16;
    v36 = (v23 - 96);
    v37 = v33;
    v38 = v20;
    v39 = v20;
    v40 = (_DWORD *)a10;
    while (1)
    {
      v41 = v34;
      while (1)
      {
        v34 = v41 >> 1;
        v42 = a3 + (v41 >> 1);
        v43 = v42 + v38;
        if ((int)(v42 + v38) <= v35)
        {
          v44 = v38 - v34;
          v45 = v37 - v34;
          v46 = v42 + v37;
          v47 = (int)(v42 + v37) > v40[4] + 16 || v45 < -16;
          if (!v47 && v44 > -17)
            break;
        }
        v49 = v41 >= 4;
        v41 >>= 1;
        if (!v49)
        {
          v82 = a14;
          v18 = a9;
          v83 = a13;
          goto LABEL_89;
        }
      }
      v50 = v34 * v120;
      v51 = (uint8x8_t *)((char *)v113 + v34);
      v52 = v40[11];
      v99 = v52;
      v94 = v39;
      v93 = v33;
      v98 = (uint64_t)v40;
      v92 = v32;
      if (!v52)
      {
        v53 = v40[2];
        if (v46 >= v53)
          break;
      }
      v100 = (char *)v113 + v34;
      v114 = v36;
      v89 = v34 * v120;
      v54 = PredErr3(a3, v121, v51, v36, a12, (uint64_t)v40);
      v52 = v99;
      if (v54 >= v114)
        v55 = 0;
      else
        v55 = v41 >> 1;
      v109 = v55;
      if (v54 >= v114)
        v36 = v114;
      else
        v36 = v54;
      v56 = (uint8x8_t *)&v100[-v89];
      v95 = v89;
      if (!v99)
      {
        v40 = (_DWORD *)v98;
        v53 = *(_DWORD *)(v98 + 8);
LABEL_26:
        v57 = 0;
        if (v46 >= v53 || v44 < 0)
          goto LABEL_36;
      }
      v101 = v56;
      v115 = v36;
      v58 = PredErr3(a3, v121, v56, v36, a12, v98);
      v56 = v101;
      v52 = v99;
      v40 = (_DWORD *)v98;
      if (v58 < v115)
        v57 = -(int)v34;
      else
        v57 = 0;
      v59 = v109;
      if (v58 < v115)
        v59 = v41 >> 1;
      v109 = v59;
      if (v58 < v115)
        v36 = v58;
      else
        v36 = v115;
LABEL_36:
      v60 = (char *)v56 - v34;
      if (v52 || (v44 & 0x80000000) == 0)
      {
        v90 = (char *)v56 - v34;
        v116 = v36;
        v102 = v57;
        v61 = PredErr3(a3, v121, (uint8x8_t *)((char *)v56 - v34), v36, a12, (uint64_t)v40);
        v60 = v90;
        v52 = v99;
        v57 = v102;
        v36 = v116;
        if ((int)v61 < v116)
        {
          v109 = 0;
          v57 = -(int)v34;
          v36 = v61;
        }
      }
      v62 = &v60[-v34];
      if (v52 || (v44 | v45) >= 0)
      {
        v117 = &v60[-v34];
        v64 = v36;
        v103 = v57;
        v65 = PredErr3(a3, v121, (uint8x8_t *)&v60[-v34], v36, a12, v98);
        v62 = v117;
        v52 = v99;
        v57 = v103;
        if (v65 >= v64)
        {
          v63 = v109;
        }
        else
        {
          v57 = -(int)v34;
          v63 = -(int)v34;
        }
        if (v65 < v64)
          v36 = v65;
        else
          v36 = v64;
      }
      else
      {
        v63 = v109;
      }
      v66 = v95;
      v67 = (uint8x8_t *)&v62[v95];
      if (v52 || (v45 & 0x80000000) == 0)
      {
        v91 = v67;
        v118 = v36;
        v110 = v63;
        v104 = v57;
        v71 = PredErr3(a3, v121, v67, v36, a12, v98);
        v67 = v91;
        v72 = a12;
        v73 = v121;
        v57 = v104;
        v40 = (_DWORD *)v98;
        if (v71 >= v118)
        {
          v63 = v110;
        }
        else
        {
          v57 = 0;
          v63 = -(int)v34;
        }
        if (v71 >= v118)
          v36 = v118;
        else
          v36 = v71;
        if (v99 || v43 < *(_DWORD *)(v98 + 12) && (v73 = v121, v72 = a12, (v45 & 0x80000000) == 0))
        {
          v96 = (uint8x8_t *)((char *)v91 + v95);
          v74 = v36;
          v111 = v63;
          v105 = v57;
          v75 = PredErr3(a3, v73, v96, v36, v72, v98);
          v57 = v105;
          v40 = (_DWORD *)v98;
          if (v75 >= v74)
          {
            v63 = v111;
          }
          else
          {
            v57 = v41 >> 1;
            v63 = -(int)v34;
          }
          if (v75 >= v74)
            v36 = v74;
          else
            v36 = v75;
          v68 = (uint8x8_t *)((char *)v96 + v34);
          v18 = a9;
          if (v99)
            goto LABEL_71;
          goto LABEL_53;
        }
        v18 = a9;
        v66 = v95;
      }
      else
      {
        v40 = (_DWORD *)v98;
        v18 = a9;
      }
      v68 = (uint8x8_t *)((char *)v67 + v66 + v34);
LABEL_53:
      v69 = v40[3];
      if (v43 >= v69)
      {
        v70 = (uint8x8_t *)((char *)v68 + v34);
        goto LABEL_80;
      }
LABEL_71:
      v106 = v57;
      v112 = v63;
      v119 = v68;
      v76 = v36;
      v77 = PredErr3(a3, v121, v68, v36, a12, (uint64_t)v40);
      v57 = v106;
      if (v77 >= v76)
      {
        v63 = v112;
      }
      else
      {
        v57 = v41 >> 1;
        v63 = 0;
      }
      if (v77 >= v76)
        v36 = v76;
      else
        v36 = v77;
      v70 = (uint8x8_t *)((char *)v119 + v34);
      if (v99)
      {
        v40 = (_DWORD *)v98;
LABEL_82:
        v107 = v57;
        v78 = v36;
        v79 = v40;
        v80 = v63;
        v81 = PredErr3(a3, v121, v70, v36, a12, (uint64_t)v40);
        v63 = v80;
        v83 = a13;
        v57 = v107;
        v36 = v78;
        v40 = v79;
        v82 = a14;
        if ((int)v81 < (int)v78)
        {
          v57 = v41 >> 1;
          v63 = v41 >> 1;
          v36 = v81;
        }
        goto LABEL_85;
      }
      v40 = (_DWORD *)v98;
      v69 = *(_DWORD *)(v98 + 12);
LABEL_80:
      v83 = a13;
      if (v43 >= v69)
      {
        v82 = a14;
      }
      else
      {
        v82 = a14;
        if (v46 < v40[2])
          goto LABEL_82;
      }
LABEL_85:
      v38 += v57;
      v37 += v63;
      v113 = (uint8x8_t *)(v97 + v38 * v120 + v37);
      v39 = v94;
      v33 = v93;
      v32 = v92;
      if (v41 <= 3)
        goto LABEL_89;
    }
    v109 = 0;
    v95 = v50;
    v56 = (uint8x8_t *)((char *)v51 - v50);
    goto LABEL_26;
  }
  LOBYTE(v38) = v20;
  LOBYTE(v37) = v22 + a2;
  LODWORD(v36) = v23 - 96;
  LOBYTE(v39) = v20;
  v83 = a13;
  v82 = a14;
LABEL_89:
  v84 = v37 - v33;
  *(_BYTE *)v18 = 2 * (v37 - v33);
  v85 = v38 - v39;
  *(_BYTE *)(v18 + 1) = 2 * (v38 - v39);
  v86 = v36 + 96;
  if (v32 != (_DWORD)v36)
    v86 = v36;
  v87 = v86 + 128;
  if (v86 < -128)
    v87 = v86 + 383;
  *(_WORD *)(v18 + 4) = 0;
  *(_DWORD *)(v18 + 8) = v86;
  *(_WORD *)(v18 + 6) = v87 >> 8;
  result = H263ME_ResidualMean((uint64_t)v121, v108 + v33, (char)(2 * v85), (char)(2 * v84), v120, a3, v24, v25, v26, v27, v28, v29, v30, v31);
  *(_WORD *)(v18 + 4) = result;
  *(_BYTE *)v18 = 2 * (v84 + (v83 >> 1));
  *(_BYTE *)(v18 + 1) = 2 * (v85 + (v82 >> 1));
  return result;
}

uint64_t Motion_MB4step(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _DWORD *a8, int a9, int a10, uint64_t a11)
{
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
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
  double v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  BOOL v48;
  uint64_t v49;
  int v50;
  unint64_t v51;
  uint8x8_t *v52;
  uint64_t v53;
  int v54;
  char v55;
  BOOL v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  int v62;
  int v63;
  int64_t v64;
  int64_t v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  int64_t v80;
  int64_t v81;
  BOOL v82;
  int v83;
  BOOL v84;
  int v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t result;
  uint8x8_t *v91;
  char v92;
  char v93;
  int v95;
  int v96;
  uint64_t v98;
  _BOOL4 v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  int v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  unint64_t v111;
  int v112;
  int v113;
  BOOL v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint8x8_t *v118;
  uint64_t v120;
  int v121;
  uint64_t v122;
  int64_t v123;
  int v124;
  int64_t v125;
  int64_t v126;
  int64_t v127;

  v117 = (uint64_t)(a8 + 8212);
  v98 = (int)a8[8218];
  v118 = (uint8x8_t *)(a4 + (int)v98 * (uint64_t)a1 + a2);
  v11 = a1 + (a10 >> 1);
  v12 = ((uint64_t)a9 >> 1) + a2;
  v13 = a6 + a3 + v12;
  v14 = v12 - a6;
  v15 = a6 + a3 + v11;
  v16 = v11 - a6;
  v17 = a8[8216];
  if (a8[8223])
  {
    v18 = v17 + 16;
    v19 = v17 + 15;
    if (v13 >= v18)
      v20 = v19;
    else
      v20 = a6 + a3 + v12;
    if (v14 <= -15)
      v21 = -15;
    else
      v21 = v12 - a6;
    v22 = a8[8217];
    v23 = v22 + 16;
    v24 = v22 + 15;
    if (v15 >= v23)
      v25 = v24;
    else
      v25 = a6 + a3 + v11;
    if (v16 <= -15)
      v26 = -15;
    else
      v26 = v11 - a6;
  }
  else
  {
    if (v13 >= v17)
      v20 = a8[8216];
    else
      v20 = a6 + a3 + v12;
    v21 = v14 & ~(v14 >> 31);
    if (v15 >= a8[8217])
      v25 = a8[8217];
    else
      v25 = a6 + a3 + v11;
    v26 = v16 & ~(v16 >> 31);
  }
  v91 = (uint8x8_t *)(a5 + (int)v98 * v11 + v12);
  v116 = *(_QWORD *)(a11 + 8);
  v27 = PredErr3(a3, v118, v91, 0x7FFFFFFF, v116, v117);
  v36 = v27;
  v99 = 0;
  v113 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v124 = 0;
  v126 = v21;
  v127 = v20;
  v125 = v26;
  v123 = v25;
  v40 = 2;
  v93 = v11;
  v92 = v12;
  v41 = v12;
  do
  {
    v42 = v41;
    v43 = v11;
    v102 = v11;
    v103 = v41;
    if (v124 && v39)
    {
      v100 = v40;
      if (v39 < 0)
      {
        v99 = 1;
      }
      else
      {
        v44 = 0;
        v45 = -v39;
        v46 = v40 + v41;
        v48 = (int)(v40 + v41) > (int)v127 || v46 < (int)v126;
        v49 = v40;
        v50 = v11 - v40 * v39;
        v51 = v11 - v39 * (unint64_t)v40;
        v52 = (uint8x8_t *)(a5 + v98 * v51 + v46);
        v53 = v98 * v40;
        v54 = (2 * v39) | 1;
        v120 = v40;
        v114 = v48;
        v109 = v53;
        v111 = v51;
        do
        {
          v55 = (uint64_t)(v51 + v44) > v125 || v48;
          if ((v55 & 1) == 0 && (uint64_t)(v51 + v44) >= v123)
          {
            v27 = PredErr3(a3, v118, v52, v36, v116, v117);
            v53 = v109;
            v51 = v111;
            v49 = v120;
            v48 = v114;
          }
          v56 = v27 < v36;
          if (v27 < v36)
          {
            v36 = v27;
            v41 = v46;
            v11 = v50 + v44;
          }
          v57 = v124;
          if (v56)
            v57 = 1;
          v124 = v57;
          if (v56)
            v39 = v45;
          ++v45;
          v44 += v49;
          v52 = (uint8x8_t *)((char *)v52 + v53);
          --v54;
        }
        while (v54);
        v99 = v39 != 1;
        if (v39 == 1)
        {
          v37 = -1;
          v39 = 1;
          v72 = v57;
          v61 = v57;
LABEL_73:
          v113 = v72;
          v40 = v100;
          goto LABEL_114;
        }
        v43 = v102;
        v42 = v103;
      }
      v60 = 0;
      v61 = v124;
      if (v124 >= 0)
        v62 = v124;
      else
        v62 = -v124;
      v63 = v62 + 1;
      v105 = -v124 * (unint64_t)v100 + v42;
      v107 = v43;
      v115 = a5 + (int)v98 * (uint64_t)v43;
      do
      {
        if ((v124 & 0x80000000) == 0)
        {
          v64 = v105;
          v65 = v107 + v60 * v100;
          v66 = -v124;
          do
          {
            if (v66 | v60 && v64 <= v127 && v64 >= v126 && v65 <= v125 && v65 >= v123)
            {
              v67 = v36;
              v121 = v41;
              v68 = v11;
              v69 = v36;
              v70 = v39;
              v71 = v60;
              v27 = PredErr3(a3, v118, (uint8x8_t *)(v115 + v64), v67, v116, v117);
              v60 = v71;
              v39 = v70;
              v36 = v69;
              v11 = v68;
              v41 = v121;
            }
            if (v27 < v36)
            {
              v36 = v27;
              v41 = v64;
              v11 = v65;
              v61 = v66;
              v39 = v60;
            }
            v64 += v100;
            ++v66;
          }
          while (v63 != v66);
        }
        ++v60;
        v115 += v98 * v100;
      }
      while (v60 != 2);
      v37 = 0;
      v72 = v124;
      goto LABEL_73;
    }
    if (v124 | v39)
    {
      if (!v124 || v39)
      {
        if (v39)
          v59 = -1;
        else
          v59 = v38;
        v73 = v37;
        if (v39)
          v37 = v39;
        v74 = v113;
        if (v39)
          v75 = 1;
        else
          v75 = v113;
        v58 = v99;
        if (v39)
          v76 = v39;
        else
          v76 = v99;
        if (v124)
          v59 = v38;
        else
          v73 = v37;
        v37 = v73;
        if (!v124)
          v74 = v75;
        v113 = v74;
        if (!v124)
          v58 = v76;
      }
      else
      {
        v58 = 1;
        v37 = -1;
        v59 = v124;
        v113 = v124;
      }
    }
    else
    {
      v113 = 1;
      v59 = -1;
      v37 = -1;
      v58 = 1;
    }
    v99 = v58;
    if (v58 >= -v37)
    {
      v77 = -v59;
      v101 = v40;
      v78 = v40;
      v79 = -v37;
      v110 = v58 + 1;
      v95 = v59;
      v96 = v37;
      v104 = v11;
      v106 = v41 - v59 * (unint64_t)v40;
      v122 = a5 + v98 * (v11 - v37 * (unint64_t)v40);
      v108 = v98 * v40;
      v112 = -v59;
      do
      {
        if (v113 >= v77)
        {
          v80 = v106;
          v81 = v104 + v79 * v78;
          do
          {
            if (v77 | v79 && v80 <= v127 && v80 >= v126 && v81 <= v125 && v81 >= v123)
              v27 = PredErr3(a3, v118, (uint8x8_t *)(v122 + v80), v36, v116, v117);
            v82 = v27 < v36;
            if (v27 < v36)
            {
              v36 = v27;
              v41 = v80;
              v11 = v104 + v79 * v78;
            }
            v83 = v124;
            if (v82)
              v83 = v77;
            v124 = v83;
            if (v82)
              v39 = v79;
            v80 += v78;
            ++v77;
          }
          while (v113 + 1 != v77);
        }
        ++v79;
        v122 += v108;
        v77 = v112;
      }
      while (v110 != (_DWORD)v79);
      v61 = v124;
      v124 = v95;
      v40 = v101;
      v37 = v96;
    }
    else
    {
      v61 = v124;
      v124 = v59;
    }
LABEL_114:
    v84 = v102 == v11 && v103 == v41;
    if (v84 || v40 == 1)
      v86 = 1;
    else
      v86 = 2;
    v38 = v124;
    v124 = v61;
    v84 = v40 == 1;
    v40 = v86;
  }
  while (!v84);
  v87 = v41 - v92;
  *(_BYTE *)a7 = 2 * (v41 - v92);
  v88 = 2 * (v11 - v93);
  v89 = v36 + 128;
  if (v36 < -128)
    v89 = v36 + 383;
  *(_BYTE *)(a7 + 1) = v88;
  *(_DWORD *)(a7 + 8) = v36;
  *(_WORD *)(a7 + 6) = v89 >> 8;
  result = H263ME_ResidualMean((uint64_t)v118, (uint64_t)v91, v88, (char)(2 * v87), v98, a3, v28, v29, v30, v31, v32, v33, v34, v35);
  *(_WORD *)(a7 + 4) = result;
  *(_BYTE *)a7 = (a9 & 0xFE) + 2 * v87;
  *(_BYTE *)(a7 + 1) = (a10 & 0xFE) + 2 * (v11 - v93);
  return result;
}

uint64_t Motion_MBFS(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  int *v14;
  int v15;
  uint64_t v16;
  int v17;
  uint8x8_t *v18;
  int v19;
  double v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t result;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  char v62;
  char v63;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint8x8_t *v68;

  v14 = (int *)(a8 + 32864);
  v15 = a1 + (a10 >> 1);
  v16 = ((uint64_t)a9 >> 1) + a2;
  v17 = *(_DWORD *)(a8 + 32872);
  v61 = v17;
  v18 = (uint8x8_t *)(a5 + v17 * v15 + v16);
  v68 = (uint8x8_t *)(a4 + v17 * a1 + a2);
  v66 = *(_QWORD *)(a11 + 8);
  v67 = a8 + 32848;
  v19 = H263ME_PredErr(a3, v68, v18, 0x7FFFFFFF, 0, v66, a8 + 32848);
  v28 = a3;
  v29 = v19;
  v30 = a6 + a3 + v16;
  v58 = v16;
  v31 = v16 - a6;
  v32 = a6 + a3 + v15;
  v33 = v15 - a6;
  v34 = *v14;
  if (v14[7])
  {
    v35 = v34 + 16;
    v36 = v34 + 15;
    if (v30 >= v35)
      v30 = v36;
    if (v31 <= -15)
      v31 = -15;
    v60 = v31;
    v37 = v14[1];
    v38 = v37 + 16;
    v39 = v37 + 15;
    if (v32 >= v38)
      v32 = v39;
    if (v33 <= -15)
      v33 = -15;
  }
  else
  {
    if (v30 >= v34)
      v30 = *v14;
    v60 = v31 & ~(v31 >> 31);
    if (v32 >= v14[1])
      v32 = v14[1];
    v33 &= ~(v33 >> 31);
  }
  v40 = v32 - a3;
  v57 = a7;
  v56 = (uint64_t)v18;
  v55 = v15;
  if (v33 >= v40)
  {
    v62 = v16;
    v63 = v15;
    v65 = v19;
  }
  else
  {
    v41 = a5 + v33 * (int)v61 + v60;
    v42 = v15;
    v43 = v30 - (int)a3;
    v44 = v33;
    v45 = v42;
    v59 = v40;
    v63 = v42;
    v65 = v19;
    v62 = v16;
    do
    {
      if (v60 < (int)v43)
      {
        v46 = 0;
        v47 = (a9 >> 1) + (uint64_t)a2 - v60;
        do
        {
          if (v45 != v44 || v47)
          {
            v48 = *(_DWORD *)(*(_QWORD *)(a11 + 24) + 4 * v47) + *(_DWORD *)(*(_QWORD *)(a11 + 24) + 4 * (v45 - v44));
            v49 = v28;
            v50 = H263ME_PredErr(v28, v68, (uint8x8_t *)(v41 + v46), v29, v48, v66, v67);
            v28 = v49;
            if (v50 + v48 < v29)
            {
              v62 = v60 + v46;
              v63 = v44;
              v65 = v50;
              v29 = v50 + v48;
            }
          }
          --v47;
          ++v46;
        }
        while (v60 + v46 < v43);
      }
      v41 += v61;
      ++v44;
    }
    while (v44 < v59);
  }
  v51 = v62 - v58;
  *(_BYTE *)v57 = 2 * (v62 - v58);
  v52 = 2 * (v63 - v55);
  v53 = v65 + 128;
  if (v65 < -128)
    v53 = v65 + 383;
  *(_BYTE *)(v57 + 1) = v52;
  *(_DWORD *)(v57 + 8) = v65;
  *(_WORD *)(v57 + 6) = v53 >> 8;
  result = H263ME_ResidualMean((uint64_t)v68, v56, v52, (char)(2 * v51), v61, v28, v20, v21, v22, v23, v24, v25, v26, v27);
  *(_WORD *)(v57 + 4) = result;
  *(_BYTE *)v57 = 2 * (v51 + (a9 >> 1));
  *(_BYTE *)(v57 + 1) = 2 * (v63 - v55 + (a10 >> 1));
  return result;
}

uint64_t Motion_DoHalfPel(_BYTE *a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, uint64_t a10)
{
  int v14;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char v29;
  int v30;
  BOOL v31;
  int v32;
  BOOL v33;
  uint64_t v34;
  BOOL v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned __int8 *v47;
  int v48;
  BOOL v49;
  int v50;
  BOOL v51;
  int v52;
  BOOL v53;
  _BYTE *v54;
  uint64_t v55;
  int v57;
  int v58;
  int v60;
  uint64_t v61;
  unsigned __int8 *v62;

  v14 = a3;
  v16 = (2 * a2) | 1;
  LHPIntp4(a3, a4, a2, a8, a6, (uint64_t)a9);
  v17 = v16;
  v18 = a8 + v16;
  v19 = a4;
  v20 = a2 + 1 + a4;
  v21 = v18 + 2;
  v22 = a9[11];
  v61 = v17;
  v62 = a7;
  v58 = v20;
  if (!v22)
  {
    v23 = a9[4];
    if (v20 >= v23)
    {
      v25 = 0;
      v26 = v21 - v17;
      goto LABEL_10;
    }
  }
  v24 = HP_PredErr4(a2, a7, v21, a5, a10, (uint64_t)a9);
  v25 = v24 < (int)a5;
  if (v24 >= (int)a5)
    a5 = a5;
  else
    a5 = v24;
  v26 = v21 - v17;
  if (!v22)
  {
    v23 = a9[4];
    v20 = v58;
LABEL_10:
    v27 = a10;
    v28 = v19;
    v29 = 0;
    if (v14 < 1 || v20 >= v23)
      goto LABEL_21;
    goto LABEL_12;
  }
  v27 = a10;
  v28 = v19;
LABEL_12:
  v30 = HP_PredErr4(a2, v62, v26, a5, v27, (uint64_t)a9);
  v31 = v30 < (int)a5;
  if (v30 < (int)a5)
    a5 = v30;
  else
    a5 = a5;
  if (v31)
    v29 = -1;
  else
    v29 = 0;
  if (v31)
    v25 = 1;
LABEL_21:
  if (v14 > 0 || v22)
  {
    v32 = HP_PredErr4(a2, v62, v26 - 1, a5, v27, (uint64_t)a9);
    v33 = v32 < (int)a5;
    if (v32 < (int)a5)
      a5 = v32;
    else
      a5 = a5;
    if (v33)
      v29 = -1;
    if (v33)
      v25 = 0;
  }
  v34 = v26 - 2;
  v35 = v28 <= 0 || v14 <= 0;
  if (!v35 || v22)
  {
    v36 = HP_PredErr4(a2, v62, v34, a5, v27, (uint64_t)a9);
    v37 = v36 < (int)a5;
    if (v36 < (int)a5)
      a5 = v36;
    else
      a5 = a5;
    if (v37)
      v29 = -1;
    if (v37)
      v25 = -1;
  }
  v38 = v61;
  v39 = a2 + 1 + v14;
  v40 = v34 + v61;
  if (v28 > 0 || v22)
  {
    v57 = v28;
    v60 = v39;
    v45 = v22;
    v46 = v27;
    v47 = v62;
    v48 = HP_PredErr4(a2, v62, v40, a5, v46, (uint64_t)a9);
    v38 = v61;
    v49 = v48 < (int)a5;
    if (v48 >= (int)a5)
      a5 = a5;
    else
      a5 = v48;
    if (v49)
    {
      v29 = 0;
      v25 = -1;
    }
    v41 = v40 + v61;
    if (v45 || v57 >= 1 && (v47 = v62, v60 < a9[5]))
    {
      v50 = HP_PredErr4(a2, v47, v40 + v61, a5, v46, (uint64_t)a9);
      v51 = v50 < (int)a5;
      if (v50 >= (int)a5)
        a5 = a5;
      else
        a5 = v50;
      if (v51)
        v29 = 1;
      if (v51)
        v25 = -1;
      v42 = v41 + 1;
      v27 = v46;
      v22 = v45;
      v39 = v60;
      if (v22)
        goto LABEL_71;
      goto LABEL_51;
    }
    v27 = v46;
    v22 = 0;
    v39 = v60;
  }
  else
  {
    v41 = v40 + v61;
  }
  v42 = v40 + v38 + 1;
LABEL_51:
  v43 = a9[5];
  if (v39 >= v43)
  {
    v44 = v41 + 2;
LABEL_82:
    v54 = a1;
    if (v39 >= v43 || v58 >= a9[4])
      goto LABEL_86;
    goto LABEL_84;
  }
LABEL_71:
  v52 = HP_PredErr4(a2, v62, v42, a5, v27, (uint64_t)a9);
  v53 = v52 < (int)a5;
  if (v52 >= (int)a5)
    a5 = a5;
  else
    a5 = v52;
  if (v53)
    v29 = 1;
  if (v53)
    v25 = 0;
  v44 = v41 + 2;
  if (!v22)
  {
    v43 = a9[5];
    goto LABEL_82;
  }
  v54 = a1;
LABEL_84:
  v55 = HP_PredErr4(a2, v62, v44, a5, v27, (uint64_t)a9);
  if ((int)v55 < (int)a5)
  {
    v29 = 1;
    a5 = v55;
    v25 = 1;
  }
LABEL_86:
  *v54 += v25;
  v54[1] += v29;
  return a5;
}

uint64_t Motion_MB_UMVInterp(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, int a9, uint64_t a10, int a11)
{
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint8x8_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v23;
  int v25;
  uint8x8_t *v26;
  uint64_t result;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  _QWORD *v35;
  int v36;
  int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  _QWORD *v52;

  v13 = a1;
  v14 = a2;
  v15 = *(_DWORD *)(a10 + 32872);
  v16 = v15 * (uint64_t)a1;
  v17 = (uint8x8_t *)(a4 + 16 * v16 + 16 * a2);
  v18 = a5 + 16 * v16 + 16 * v14;
  v19 = a11 - 1;
  v52 = (_QWORD *)(a10 + 32832);
  if ((a11 - 1) > 2)
  {
    v20 = 0;
    v21 = 0;
  }
  else
  {
    v20 = dword_22857677C[v19];
    v21 = dword_228576788[v19];
  }
  v50 = v20;
  if (v20 != a2 || a8 <= 32)
    v23 = a8;
  else
    v23 = 32;
  v49 = v21;
  if (v21 != a1 || a9 <= 32)
    v25 = a9;
  else
    v25 = 32;
  v26 = v17;
  result = PredErr3(a3, v17, (uint8x8_t *)(v18 + v15 * (uint64_t)(v25 >> 1) + (v23 >> 1)), 0x7FFFFFFF, a7, a10 + 32848);
  v29 = result;
  v30 = result - 96;
  v31 = v13 + 1;
  v32 = v14 + 1;
  v33 = (_BYTE *)(a6 + 288 * (v13 + 1) + 12 * (v14 + 1));
  v33[1] = v25;
  *v33 = v23;
  if (a1 >= 1 && a2 >= 1)
  {
    v47 = 9 * v31;
    v46 = 3 * v32;
    v48 = result - 96;
    Motion_CheckSurroundingVectors((char *)(*v52 + 288 * v31 + 12 * a2), *v52 + 288 * v31 + 12 * v32, v50, v49, a8, a9, a10, a5, v26, a1, a2, v30, a7);
    v34 = a7;
    Motion_CheckSurroundingVectors((char *)(*v52 + 288 * a1 + 12 * a2), *v52 + 32 * v47 + 4 * v46, v50, v49, a8, a9, a10, a5, v26, a1, a2, v48, a7);
    v35 = (_QWORD *)(a10 + 32832);
    v36 = v49;
    v37 = v50;
    v38 = a1;
    v39 = a10;
    v40 = a5;
    v41 = a9;
    v30 = v48;
    v32 = v14 + 1;
    v31 = v13 + 1;
LABEL_21:
    v42 = v32;
    v45 = v34;
    v43 = v31;
    result = (uint64_t)Motion_CheckSurroundingVectors((char *)(*v35 + 288 * v38 + 12 * v32), *v35 + 288 * v31 + 12 * v32, v37, v36, a8, v41, v39, v40, v26, a1, a2, v30, v45);
    v32 = v42;
    v31 = v43;
    goto LABEL_22;
  }
  if (a1 >= 1)
  {
    v38 = a1;
    v40 = a5;
    v35 = (_QWORD *)(a10 + 32832);
    v39 = a10;
    v37 = v50;
    v41 = a9;
    v34 = a7;
    v36 = v49;
    goto LABEL_21;
  }
LABEL_22:
  v44 = a6 + 288 * v31 + 12 * v32;
  *(_WORD *)(v44 + 4) = 0;
  *(_DWORD *)(v44 + 8) = v29;
  *(_WORD *)(v44 + 6) = v29 / 256;
  return result;
}

uint64_t PredErr3(int a1, uint8x8_t *a2, uint8x8_t *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint64_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint64_t v16;

  if ((*(_BYTE *)(a6 + 48) & 0x80) == 0)
  {
    if (a1 == 8)
    {
      LODWORD(v6) = 0;
      v7 = 8;
      do
      {
        v6 = (*(_DWORD *)(a5 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
                          + v6
                          + *(_DWORD *)(a5 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7])));
        if ((int)v6 >= a4)
          break;
        v8 = *(int *)(a6 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v8);
        a2 = (uint8x8_t *)((char *)a2 + v8);
        --v7;
      }
      while (v7);
      return v6;
    }
    if (a1 >= 1)
    {
      LODWORD(v6) = 0;
      do
      {
        v11 = vsubl_u8(*a3, *a2);
        v12 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
        v6 = (*(_DWORD *)(a5 + 4 * v11.i16[0])
                          + v6
                          + *(_DWORD *)(a5 + 4 * v11.i16[1])
                          + *(_DWORD *)(a5 + 4 * v11.i16[2])
                          + *(_DWORD *)(a5 + 4 * v11.i16[3])
                          + *(_DWORD *)(a5 + 4 * v11.i16[4])
                          + *(_DWORD *)(a5 + 4 * v11.i16[5])
                          + *(_DWORD *)(a5 + 4 * v11.i16[6])
                          + *(_DWORD *)(a5 + 4 * v11.i16[7])
                          + *(_DWORD *)(a5 + 4 * v12.i16[0])
                          + *(_DWORD *)(a5 + 4 * v12.i16[1])
                          + *(_DWORD *)(a5 + 4 * v12.i16[2])
                          + *(_DWORD *)(a5 + 4 * v12.i16[3])
                          + *(_DWORD *)(a5 + 4 * v12.i16[4])
                          + *(_DWORD *)(a5 + 4 * v12.i16[5])
                          + *(_DWORD *)(a5 + 4 * v12.i16[6])
                          + *(_DWORD *)(a5 + 4 * v12.i16[7]));
        if ((int)v6 >= a4)
          break;
        v13 = *(int *)(a6 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v13);
        a2 = (uint8x8_t *)((char *)a2 + v13);
        --a1;
      }
      while (a1);
      return v6;
    }
    return 0;
  }
  if (a1 == 8)
  {
    LODWORD(v6) = 0;
    v9 = 8;
    do
    {
      v6 = (*(_DWORD *)(a5 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
                        + v6
                        + *(_DWORD *)(a5 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7])));
      if ((int)v6 >= a4)
        break;
      v10 = *(int *)(a6 + 24);
      a3 = (uint8x8_t *)((char *)a3 + v10);
      a2 = (uint8x8_t *)((char *)a2 + v10);
      --v9;
    }
    while (v9);
  }
  else
  {
    if (a1 < 1)
      return 0;
    LODWORD(v6) = 0;
    do
    {
      v14 = vsubl_u8(*a3, *a2);
      v15 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
      v6 = (*(_DWORD *)(a5 + 4 * v14.i16[0])
                        + v6
                        + *(_DWORD *)(a5 + 4 * v14.i16[1])
                        + *(_DWORD *)(a5 + 4 * v14.i16[2])
                        + *(_DWORD *)(a5 + 4 * v14.i16[3])
                        + *(_DWORD *)(a5 + 4 * v14.i16[4])
                        + *(_DWORD *)(a5 + 4 * v14.i16[5])
                        + *(_DWORD *)(a5 + 4 * v14.i16[6])
                        + *(_DWORD *)(a5 + 4 * v14.i16[7])
                        + *(_DWORD *)(a5 + 4 * v15.i16[0])
                        + *(_DWORD *)(a5 + 4 * v15.i16[1])
                        + *(_DWORD *)(a5 + 4 * v15.i16[2])
                        + *(_DWORD *)(a5 + 4 * v15.i16[3])
                        + *(_DWORD *)(a5 + 4 * v15.i16[4])
                        + *(_DWORD *)(a5 + 4 * v15.i16[5])
                        + *(_DWORD *)(a5 + 4 * v15.i16[6])
                        + *(_DWORD *)(a5 + 4 * v15.i16[7]));
      if ((int)v6 >= a4)
        break;
      v16 = *(int *)(a6 + 24);
      a3 = (uint8x8_t *)((char *)a3 + v16);
      a2 = (uint8x8_t *)((char *)a2 + v16);
      --a1;
    }
    while (a1);
  }
  return v6;
}

uint64_t DHPIntp(uint64_t result, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  BOOL v11;
  int v12;
  int mm;
  uint64_t nn;
  int i;
  uint64_t j;
  int i1;
  uint64_t v18;
  int v19;
  int v20;
  int k;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t i6;
  int v28;
  uint64_t v29;
  uint64_t kk;
  int i4;
  uint64_t i5;
  int ii;
  uint64_t jj;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t i3;
  int v58;
  uint64_t v59;
  uint64_t n;
  int i2;
  uint64_t v62;
  int v63;
  int v64;
  int m;
  uint64_t v66;
  int v67;
  int v68;

  v8 = *(int *)(a8 + 24);
  v9 = (int)v8 * (uint64_t)(int)result;
  v10 = (unsigned __int8 *)(a7 + v9 + a2);
  if (a3)
    v11 = 0;
  else
    v11 = a4 == 1;
  v12 = v11;
  if ((*(_BYTE *)(a8 + 48) & 0x80) != 0)
  {
    if (v12)
    {
      if (a5 >= 1)
      {
        for (i = 0; i != a5; ++i)
        {
          for (j = 0; j != a5; ++j)
            *(_BYTE *)(a6 + j) = (v10[j] + v10[j + 1] + 1) >> 1;
          v10 += v8;
          a6 += a5;
        }
      }
    }
    else if (a3 == -1 && a4 == 1)
    {
      if (a5 >= 1)
      {
        for (k = 0; k != a5; ++k)
        {
          v22 = 0;
          v23 = v10[-v8] + *v10;
          do
          {
            v24 = v10[v22 - v8 + 1] + v10[v22 + 1];
            *(_BYTE *)(a6 + v22++) = (v23 + v24 + 2) >> 2;
            v23 = v24;
          }
          while (a5 != v22);
          v10 += v8;
          a6 += a5;
        }
      }
    }
    else if (a3 != -1 || a4)
    {
      if ((a4 & a3) == 0xFFFFFFFF)
      {
        if (a5 >= 1)
        {
          v40 = 0;
          v41 = a7 + a2 + v9 - v8;
          do
          {
            v42 = 0;
            v43 = v10[~(_DWORD)v8] + *(v10 - 1);
            do
            {
              v44 = *(unsigned __int8 *)(v41 + v42) + v10[v42];
              *(_BYTE *)(a6 + v42++) = (v43 + v44 + 2) >> 2;
              v43 = v44;
            }
            while (a5 != v42);
            v10 += v8;
            a6 += a5;
            ++v40;
            v41 += v8;
          }
          while (v40 != a5);
        }
      }
      else if (a3 || a4 != -1)
      {
        if (a3 == 1 && a4 == -1)
        {
          if (a5 >= 1)
          {
            v50 = 0;
            v51 = a7 + v8 + a2 + v9;
            do
            {
              v52 = 0;
              v53 = v10[v8 - 1] + *(v10 - 1);
              do
              {
                v54 = *(unsigned __int8 *)(v51 + v52) + v10[v52];
                *(_BYTE *)(a6 + v52++) = (v53 + v54 + 2) >> 2;
                v53 = v54;
              }
              while (a5 != v52);
              v10 += v8;
              a6 += a5;
              ++v50;
              v51 += v8;
            }
            while (v50 != a5);
          }
        }
        else if (a3 != 1 || a4)
        {
          if (a4 == 1 && a5 >= 1 && a3 == 1)
          {
            for (m = 0; m != a5; ++m)
            {
              v66 = 0;
              v67 = v10[v8] + *v10;
              do
              {
                v68 = v10[v8 + 1 + v66] + v10[v66 + 1];
                *(_BYTE *)(a6 + v66++) = (v67 + v68 + 2) >> 2;
                v67 = v68;
              }
              while (a5 != v66);
              a6 += a5;
              v10 += v8;
            }
          }
        }
        else if (a5 >= 1)
        {
          v58 = 0;
          v59 = a7 + v8 + a2 + v9;
          do
          {
            for (n = 0; n != a5; ++n)
              *(_BYTE *)(a6 + n) = (v10[n] + *(unsigned __int8 *)(v59 + n) + 1) >> 1;
            v10 += v8;
            a6 += a5;
            ++v58;
            v59 += v8;
          }
          while (v58 != a5);
        }
      }
      else if (a5 >= 1)
      {
        for (ii = 0; ii != a5; ++ii)
        {
          for (jj = 0; jj != a5; ++jj)
            *(_BYTE *)(a6 + jj) = (v10[jj] + v10[jj - 1] + 1) >> 1;
          v10 += v8;
          a6 += a5;
        }
      }
    }
    else if (a5 >= 1)
    {
      v28 = 0;
      v29 = a7 + a2 + v9 - v8;
      do
      {
        for (kk = 0; kk != a5; ++kk)
          *(_BYTE *)(a6 + kk) = (v10[kk] + *(unsigned __int8 *)(v29 + kk) + 1) >> 1;
        v10 += v8;
        a6 += a5;
        ++v28;
        v29 += v8;
      }
      while (v28 != a5);
    }
  }
  else if (v12)
  {
    if (a5 >= 1)
    {
      for (mm = 0; mm != a5; ++mm)
      {
        for (nn = 0; nn != a5; ++nn)
          *(_BYTE *)(a6 + nn) = (v10[nn] + v10[nn + 1] + 1) >> 1;
        v10 += v8;
        a6 += a5;
      }
    }
  }
  else if (a3 == -1 && a4 == 1)
  {
    if (a5 >= 1)
    {
      for (i1 = 0; i1 != a5; ++i1)
      {
        v18 = 0;
        v19 = v10[-v8] + *v10;
        do
        {
          v20 = v10[v18 - v8 + 1] + v10[v18 + 1];
          *(_BYTE *)(a6 + v18++) = (v19 + v20 + 2) >> 2;
          v19 = v20;
        }
        while (a5 != v18);
        v10 += v8;
        a6 += a5;
      }
    }
  }
  else if (a3 != -1 || a4)
  {
    if ((a4 & a3) == 0xFFFFFFFF)
    {
      if (a5 >= 1)
      {
        v35 = 0;
        v36 = a7 + a2 + v9 - v8;
        do
        {
          v37 = 0;
          v38 = v10[~(_DWORD)v8] + *(v10 - 1);
          do
          {
            v39 = *(unsigned __int8 *)(v36 + v37) + v10[v37];
            *(_BYTE *)(a6 + v37++) = (v38 + v39 + 2) >> 2;
            v38 = v39;
          }
          while (a5 != v37);
          v10 += v8;
          a6 += a5;
          ++v35;
          v36 += v8;
        }
        while (v35 != a5);
      }
    }
    else if (a3 || a4 != -1)
    {
      if (a3 == 1 && a4 == -1)
      {
        if (a5 >= 1)
        {
          v45 = 0;
          v46 = a7 + v8 + a2 + v9;
          do
          {
            v47 = 0;
            v48 = v10[v8 - 1] + *(v10 - 1);
            do
            {
              v49 = *(unsigned __int8 *)(v46 + v47) + v10[v47];
              *(_BYTE *)(a6 + v47++) = (v48 + v49 + 2) >> 2;
              v48 = v49;
            }
            while (a5 != v47);
            v10 += v8;
            a6 += a5;
            ++v45;
            v46 += v8;
          }
          while (v45 != a5);
        }
      }
      else if (a3 != 1 || a4)
      {
        if (a4 == 1 && a5 >= 1 && a3 == 1)
        {
          for (i2 = 0; i2 != a5; ++i2)
          {
            v62 = 0;
            v63 = v10[v8] + *v10;
            do
            {
              v64 = v10[v8 + 1 + v62] + v10[v62 + 1];
              *(_BYTE *)(a6 + v62++) = (v63 + v64 + 2) >> 2;
              v63 = v64;
            }
            while (a5 != v62);
            a6 += a5;
            v10 += v8;
          }
        }
      }
      else if (a5 >= 1)
      {
        v55 = 0;
        v56 = a7 + v8 + a2 + v9;
        do
        {
          for (i3 = 0; i3 != a5; ++i3)
            *(_BYTE *)(a6 + i3) = (v10[i3] + *(unsigned __int8 *)(v56 + i3) + 1) >> 1;
          v10 += v8;
          a6 += a5;
          ++v55;
          v56 += v8;
        }
        while (v55 != a5);
      }
    }
    else if (a5 >= 1)
    {
      for (i4 = 0; i4 != a5; ++i4)
      {
        for (i5 = 0; i5 != a5; ++i5)
          *(_BYTE *)(a6 + i5) = (v10[i5] + v10[i5 - 1] + 1) >> 1;
        v10 += v8;
        a6 += a5;
      }
    }
  }
  else if (a5 >= 1)
  {
    v25 = 0;
    v26 = a7 + a2 + v9 - v8;
    do
    {
      for (i6 = 0; i6 != a5; ++i6)
        *(_BYTE *)(a6 + i6) = (v10[i6] + *(unsigned __int8 *)(v26 + i6) + 1) >> 1;
      v10 += v8;
      a6 += a5;
      ++v25;
      v26 += v8;
    }
    while (v25 != a5);
  }
  return result;
}

uint64_t DHPErr(int a1, uint8x8_t *a2, uint8x8_t *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint64_t v12;
  uint16x8_t v13;
  uint16x8_t v14;

  if ((*(_BYTE *)(a6 + 48) & 0x80) == 0)
  {
    if (a1 == 8)
    {
      v6 = 0;
      LODWORD(v7) = 0;
      do
      {
        v7 = (*(_DWORD *)(a5 + 4 * (a3[v6].u8[0] - (unint64_t)a2->u8[0]))
                          + v7
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[1] - (unint64_t)a2->u8[1]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[2] - (unint64_t)a2->u8[2]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[3] - (unint64_t)a2->u8[3]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[4] - (unint64_t)a2->u8[4]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[5] - (unint64_t)a2->u8[5]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[6] - (unint64_t)a2->u8[6]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[7] - (unint64_t)a2->u8[7])));
        if ((int)v7 >= a4)
          break;
        a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
        ++v6;
      }
      while ((_DWORD)(v6 * 8) != 64);
      return v7;
    }
    if (a1 >= 1)
    {
      LODWORD(v7) = 0;
      v9 = a1;
      do
      {
        v10 = vsubl_u8(*a3, *a2);
        v11 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
        v7 = (*(_DWORD *)(a5 + 4 * v10.i16[0])
                          + v7
                          + *(_DWORD *)(a5 + 4 * v10.i16[1])
                          + *(_DWORD *)(a5 + 4 * v10.i16[2])
                          + *(_DWORD *)(a5 + 4 * v10.i16[3])
                          + *(_DWORD *)(a5 + 4 * v10.i16[4])
                          + *(_DWORD *)(a5 + 4 * v10.i16[5])
                          + *(_DWORD *)(a5 + 4 * v10.i16[6])
                          + *(_DWORD *)(a5 + 4 * v10.i16[7])
                          + *(_DWORD *)(a5 + 4 * v11.i16[0])
                          + *(_DWORD *)(a5 + 4 * v11.i16[1])
                          + *(_DWORD *)(a5 + 4 * v11.i16[2])
                          + *(_DWORD *)(a5 + 4 * v11.i16[3])
                          + *(_DWORD *)(a5 + 4 * v11.i16[4])
                          + *(_DWORD *)(a5 + 4 * v11.i16[5])
                          + *(_DWORD *)(a5 + 4 * v11.i16[6])
                          + *(_DWORD *)(a5 + 4 * v11.i16[7]));
        if ((int)v7 >= a4)
          break;
        a3 = (uint8x8_t *)((char *)a3 + v9);
        a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
        --a1;
      }
      while (a1);
      return v7;
    }
    return 0;
  }
  if (a1 == 8)
  {
    v8 = 0;
    LODWORD(v7) = 0;
    do
    {
      v7 = (*(_DWORD *)(a5 + 4 * (a3[v8].u8[0] - (unint64_t)a2->u8[0]))
                        + v7
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[1] - (unint64_t)a2->u8[1]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[2] - (unint64_t)a2->u8[2]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[3] - (unint64_t)a2->u8[3]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[4] - (unint64_t)a2->u8[4]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[5] - (unint64_t)a2->u8[5]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[6] - (unint64_t)a2->u8[6]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[7] - (unint64_t)a2->u8[7])));
      if ((int)v7 >= a4)
        break;
      a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
      ++v8;
    }
    while ((_DWORD)(v8 * 8) != 64);
  }
  else
  {
    if (a1 < 1)
      return 0;
    LODWORD(v7) = 0;
    v12 = a1;
    do
    {
      v13 = vsubl_u8(*a3, *a2);
      v14 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
      v7 = (*(_DWORD *)(a5 + 4 * v13.i16[0])
                        + v7
                        + *(_DWORD *)(a5 + 4 * v13.i16[1])
                        + *(_DWORD *)(a5 + 4 * v13.i16[2])
                        + *(_DWORD *)(a5 + 4 * v13.i16[3])
                        + *(_DWORD *)(a5 + 4 * v13.i16[4])
                        + *(_DWORD *)(a5 + 4 * v13.i16[5])
                        + *(_DWORD *)(a5 + 4 * v13.i16[6])
                        + *(_DWORD *)(a5 + 4 * v13.i16[7])
                        + *(_DWORD *)(a5 + 4 * v14.i16[0])
                        + *(_DWORD *)(a5 + 4 * v14.i16[1])
                        + *(_DWORD *)(a5 + 4 * v14.i16[2])
                        + *(_DWORD *)(a5 + 4 * v14.i16[3])
                        + *(_DWORD *)(a5 + 4 * v14.i16[4])
                        + *(_DWORD *)(a5 + 4 * v14.i16[5])
                        + *(_DWORD *)(a5 + 4 * v14.i16[6])
                        + *(_DWORD *)(a5 + 4 * v14.i16[7]));
      if ((int)v7 >= a4)
        break;
      a3 = (uint8x8_t *)((char *)a3 + v12);
      a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
      --a1;
    }
    while (a1);
  }
  return v7;
}

uint64_t H263ME_PredErr(int a1, uint8x8_t *a2, uint8x8_t *a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint64_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t v17;

  if ((*(_BYTE *)(a7 + 48) & 0x80) != 0)
  {
    if (a1 == 8)
    {
      v10 = 8;
      v8 = a5;
      do
      {
        v8 += *(_DWORD *)(a6 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7]));
        if (v8 >= a4)
          break;
        v11 = *(int *)(a7 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v11);
        a2 = (uint8x8_t *)((char *)a2 + v11);
        --v10;
      }
      while (v10);
    }
    else
    {
      v8 = a5;
      if (a1 >= 1)
      {
        v8 = a5;
        do
        {
          v15 = vsubl_u8(*a3, *a2);
          v16 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
          v8 += *(_DWORD *)(a6 + 4 * v15.i16[0])
              + *(_DWORD *)(a6 + 4 * v15.i16[1])
              + *(_DWORD *)(a6 + 4 * v15.i16[2])
              + *(_DWORD *)(a6 + 4 * v15.i16[3])
              + *(_DWORD *)(a6 + 4 * v15.i16[4])
              + *(_DWORD *)(a6 + 4 * v15.i16[5])
              + *(_DWORD *)(a6 + 4 * v15.i16[6])
              + *(_DWORD *)(a6 + 4 * v15.i16[7])
              + *(_DWORD *)(a6 + 4 * v16.i16[0])
              + *(_DWORD *)(a6 + 4 * v16.i16[1])
              + *(_DWORD *)(a6 + 4 * v16.i16[2])
              + *(_DWORD *)(a6 + 4 * v16.i16[3])
              + *(_DWORD *)(a6 + 4 * v16.i16[4])
              + *(_DWORD *)(a6 + 4 * v16.i16[5])
              + *(_DWORD *)(a6 + 4 * v16.i16[6])
              + *(_DWORD *)(a6 + 4 * v16.i16[7]);
          if (v8 >= a4)
            break;
          v17 = *(int *)(a7 + 24);
          a3 = (uint8x8_t *)((char *)a3 + v17);
          a2 = (uint8x8_t *)((char *)a2 + v17);
          --a1;
        }
        while (a1);
      }
    }
  }
  else if (a1 == 8)
  {
    v7 = 8;
    v8 = a5;
    do
    {
      v8 += *(_DWORD *)(a6 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7]));
      if (v8 >= a4)
        break;
      v9 = *(int *)(a7 + 24);
      a3 = (uint8x8_t *)((char *)a3 + v9);
      a2 = (uint8x8_t *)((char *)a2 + v9);
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = a5;
    if (a1 >= 1)
    {
      v8 = a5;
      do
      {
        v12 = vsubl_u8(*a3, *a2);
        v13 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
        v8 += *(_DWORD *)(a6 + 4 * v12.i16[0])
            + *(_DWORD *)(a6 + 4 * v12.i16[1])
            + *(_DWORD *)(a6 + 4 * v12.i16[2])
            + *(_DWORD *)(a6 + 4 * v12.i16[3])
            + *(_DWORD *)(a6 + 4 * v12.i16[4])
            + *(_DWORD *)(a6 + 4 * v12.i16[5])
            + *(_DWORD *)(a6 + 4 * v12.i16[6])
            + *(_DWORD *)(a6 + 4 * v12.i16[7])
            + *(_DWORD *)(a6 + 4 * v13.i16[0])
            + *(_DWORD *)(a6 + 4 * v13.i16[1])
            + *(_DWORD *)(a6 + 4 * v13.i16[2])
            + *(_DWORD *)(a6 + 4 * v13.i16[3])
            + *(_DWORD *)(a6 + 4 * v13.i16[4])
            + *(_DWORD *)(a6 + 4 * v13.i16[5])
            + *(_DWORD *)(a6 + 4 * v13.i16[6])
            + *(_DWORD *)(a6 + 4 * v13.i16[7]);
        if (v8 >= a4)
          break;
        v14 = *(int *)(a7 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v14);
        a2 = (uint8x8_t *)((char *)a2 + v14);
        --a1;
      }
      while (a1);
    }
  }
  return (v8 - a5);
}

uint64_t HP_PredErr4(int a1, unsigned __int8 *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  unsigned __int8 *v11;

  v6 = 2 * a1;
  if ((*(_BYTE *)(a6 + 48) & 0x80) == 0)
  {
    if (a1 >= 1)
    {
      LODWORD(v7) = 0;
      v8 = 0;
      v9 = (unsigned __int8 *)(a3 + 16);
      do
      {
        v7 = (*(_DWORD *)(a5 + 4 * (*(v9 - 16) - (unint64_t)*a2))
                          + v7
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 14) - (unint64_t)a2[1]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 12) - (unint64_t)a2[2]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 10) - (unint64_t)a2[3]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 8) - (unint64_t)a2[4]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 6) - (unint64_t)a2[5]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 4) - (unint64_t)a2[6]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 2) - (unint64_t)a2[7])));
        if (a1 == 16)
          v7 = (*(_DWORD *)(a5 + 4 * (*v9 - (unint64_t)a2[8]))
                            + *(_DWORD *)(a5 + 4 * (v9[2] - (unint64_t)a2[9]))
                            + *(_DWORD *)(a5 + 4 * (v9[4] - (unint64_t)a2[10]))
                            + *(_DWORD *)(a5 + 4 * (v9[6] - (unint64_t)a2[11]))
                            + *(_DWORD *)(a5 + 4 * (v9[8] - (unint64_t)a2[12]))
                            + v7
                            + *(_DWORD *)(a5 + 4 * (v9[10] - (unint64_t)a2[13]))
                            + *(_DWORD *)(a5 + 4 * (v9[12] - (unint64_t)a2[14]))
                            + *(_DWORD *)(a5 + 4 * (v9[14] - (unint64_t)a2[15])));
        if ((int)v7 >= a4)
          break;
        a2 += *(int *)(a6 + 24);
        v8 += 2;
        v9 += (4 * a1) | 2;
      }
      while (v8 < v6);
      return v7;
    }
    return 0;
  }
  if (a1 < 1)
    return 0;
  LODWORD(v7) = 0;
  v10 = 0;
  v11 = (unsigned __int8 *)(a3 + 16);
  do
  {
    v7 = (*(_DWORD *)(a5 + 4 * (*(v11 - 16) - (unint64_t)*a2))
                      + v7
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 14) - (unint64_t)a2[1]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 12) - (unint64_t)a2[2]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 10) - (unint64_t)a2[3]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 8) - (unint64_t)a2[4]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 6) - (unint64_t)a2[5]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 4) - (unint64_t)a2[6]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 2) - (unint64_t)a2[7])));
    if (a1 == 16)
      v7 = (*(_DWORD *)(a5 + 4 * (*v11 - (unint64_t)a2[8]))
                        + *(_DWORD *)(a5 + 4 * (v11[2] - (unint64_t)a2[9]))
                        + *(_DWORD *)(a5 + 4 * (v11[4] - (unint64_t)a2[10]))
                        + *(_DWORD *)(a5 + 4 * (v11[6] - (unint64_t)a2[11]))
                        + *(_DWORD *)(a5 + 4 * (v11[8] - (unint64_t)a2[12]))
                        + v7
                        + *(_DWORD *)(a5 + 4 * (v11[10] - (unint64_t)a2[13]))
                        + *(_DWORD *)(a5 + 4 * (v11[12] - (unint64_t)a2[14]))
                        + *(_DWORD *)(a5 + 4 * (v11[14] - (unint64_t)a2[15])));
    if ((int)v7 >= a4)
      break;
    a2 += *(int *)(a6 + 24);
    v10 += 2;
    v11 += (4 * a1) | 2;
  }
  while (v10 < v6);
  return v7;
}

uint64_t H263ME_ResidualMean(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, double a7, int32x4_t a8, int32x4_t a9, int32x4_t a10, int32x4_t a11, int32x4_t a12, int32x4_t a13, int32x4_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int32x4_t v18;
  int v19;
  uint64_t v20;
  unsigned __int32 *v21;
  int32x4_t v22;
  uint64_t v23;
  uint64_t v24;
  int8x16_t v25;
  int v26;
  uint64_t v27;
  __int32 *v28;
  int8x16_t v29;
  int32x4_t v30;
  uint16x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int8x16_t v34;
  int32x4_t v35;
  int8x16_t v36;
  uint64_t v37;
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
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int8x16_t v59;
  int v60;
  unsigned __int32 *v61;
  uint64_t v62;
  uint32x4_t v63;
  int32x4_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
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
  int8x16_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int32x4_t v87;
  int v88;
  uint64_t v89;
  unsigned __int32 *v90;
  int32x4_t v91;
  int8x16_t v92;
  int32x4_t v93;
  uint16x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  uint16x4_t v99;
  int8x16_t v100;
  int32x4_t v101;
  int32x4_t v102;
  uint32x4_t v103;
  uint16x4_t v104;
  int32x4_t v105;
  int v106;
  BOOL v107;
  int v108;
  int v109;
  int v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;

  v14 = (a3 >> 1) * a5 + (a4 >> 1);
  v15 = a2 + v14;
  if (((a4 | a3) & 1) == 0)
  {
    if (a6 >= 1)
    {
      v16 = 0;
      v17 = a1 + 8;
      v18 = 0uLL;
      v19 = a6;
      do
      {
        v20 = v15 + v16;
        v21 = (unsigned __int32 *)(v17 + v16);
        a8.i32[0] = *(_DWORD *)(a1 + v16);
        a9.i32[0] = *(_DWORD *)(v17 + v16 - 4);
        a8.i64[0] = vmovl_u8(*(uint8x8_t *)a8.i8).u64[0];
        a10.i32[0] = *(_DWORD *)(v15 + v16);
        a11.i32[0] = *(_DWORD *)(v15 + v16 + 4);
        a10.i64[0] = vmovl_u8(*(uint8x8_t *)a10.i8).u64[0];
        a11.i64[0] = vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
        a9 = (int32x4_t)vsubl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a9.i8), *(uint16x4_t *)a11.i8);
        v18 = vaddq_s32((int32x4_t)vsubw_u16(vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a8.i8), *(uint16x4_t *)a10.i8), a9);
        if (a6 == 16)
        {
          a8.i32[0] = *v21;
          a9.i32[0] = v21[1];
          a10.i32[0] = *(_DWORD *)(v20 + 8);
          a11.i32[0] = *(_DWORD *)(v20 + 12);
          a10.i64[0] = vmovl_u8(*(uint8x8_t *)a10.i8).u64[0];
          a9.i64[0] = vmovl_u8(*(uint8x8_t *)a9.i8).u64[0];
          a11.i64[0] = vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
          v22 = (int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a8.i8)), *(uint16x4_t *)a9.i8);
          a8 = (int32x4_t)vaddl_u16(*(uint16x4_t *)a10.i8, *(uint16x4_t *)a11.i8);
          v18 = vsubq_s32(v22, a8);
        }
        v16 += a5;
        --v19;
      }
      while (v19);
      goto LABEL_29;
    }
LABEL_33:
    v106 = 0;
    goto LABEL_34;
  }
  if ((a3 & 1) != 0 || (a4 & 1) == 0)
  {
    v37 = v14;
    if ((a3 & 1) == 0 || (a4 & 1) != 0)
    {
      if (a6 < 1)
        goto LABEL_33;
      v65 = 0;
      v66 = v37 + a5 + 6;
      v67 = v37 + a5 + 7;
      v68 = v37 + a5 + 8;
      v69 = v37 + a5 + 9;
      v70 = v37 + a5 + 10;
      v71 = v37 + a5 + 11;
      v119 = a2 + v37 + a5 + 15;
      v121 = a2 + v37 + a5 + 16;
      v73 = a1 + 12;
      v74 = a2 + v37 + a5;
      v75 = a2 + v37 + a5 + 1;
      v115 = a2 + v37 + a5 + 13;
      v117 = a2 + v37 + a5 + 14;
      v76 = a2 + v37 + a5 + 2;
      v77 = a2 + v37 + a5 + 3;
      v78 = a2 + v37 + a5 + 4;
      v114 = a2 + v37 + a5 + 12;
      v79 = a2 + v37 + a5 + 5;
      v80 = a2 + v66;
      v81 = a2 + v67;
      v82 = a2 + v68;
      v113 = a2 + v69;
      v18 = 0uLL;
      v83.i64[0] = 0xFF000000FFLL;
      v83.i64[1] = 0xFF000000FFLL;
      v84 = a5;
      v85 = a2 + v70;
      v86 = a2 + v71;
      v87.i64[0] = 0x200000002;
      v87.i64[1] = 0x200000002;
      v88 = a6;
      do
      {
        v89 = v15 + v65;
        v90 = (unsigned __int32 *)(v73 + v65);
        a11.i8[0] = *(_BYTE *)(v15 + v65 + 3);
        a11.i8[4] = *(_BYTE *)(v15 + v65 + 4);
        a12.i8[0] = *(_BYTE *)(v15 + v65);
        a12.i8[2] = *(_BYTE *)(v75 + v65);
        a12.i8[4] = *(_BYTE *)(v76 + v65);
        a12.i8[6] = *(_BYTE *)(v77 + v65);
        v91 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a12.i8), v83);
        a13.i8[0] = *(_BYTE *)(v74 + v65);
        a13.i8[2] = *(_BYTE *)(v15 + v65 + 2);
        a13.i16[2] = a11.i16[0];
        a13.i16[3] = a11.i16[2];
        v92 = (int8x16_t)vmovl_u16(*(uint16x4_t *)a13.i8);
        v93 = (int32x4_t)vandq_s8(v92, v83);
        v92.i32[0] = *(_DWORD *)(v73 + v65 - 12);
        a14.i32[0] = *(_DWORD *)(v73 + v65 - 8);
        v94 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v92.i8).u64[0];
        *(int32x2_t *)v92.i8 = vadd_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v93, (int8x16_t)v93, 4uLL), (int32x2_t)0x200000002);
        v95.i32[0] = *(unsigned __int8 *)(v15 + v65 + 1) + 2;
        v95.i64[1] = v92.i64[0];
        v95.i32[1] = v95.i32[0];
        v92.i8[0] = *(_BYTE *)(v78 + v65);
        v92.i8[2] = *(_BYTE *)(v79 + v65);
        v92.i8[4] = *(_BYTE *)(v80 + v65);
        v92.i8[6] = *(_BYTE *)(v81 + v65);
        v96 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v92.i8), v83);
        v97 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v95, vaddq_s32(vaddq_s32(v91, v93), (int32x4_t)vextq_s8((int8x16_t)v91, (int8x16_t)v96, 4uLL))), 2uLL);
        v92.i64[0] = vmovl_u8(*(uint8x8_t *)a14.i8).u64[0];
        a14 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v92.i8);
        v92.i32[0] = *(_DWORD *)(v15 + v65 + 5);
        v91.i64[0] = vmovl_u8(*(uint8x8_t *)v92.i8).u64[0];
        a11 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v91.i8);
        v98 = (int32x4_t)vaddw_u16((uint32x4_t)vaddq_s32((int32x4_t)vextq_s8((int8x16_t)v93, (int8x16_t)a11, 0xCuLL), v96), *(uint16x4_t *)v91.i8);
        a12 = (int32x4_t)vextq_s8((int8x16_t)v96, (int8x16_t)v18, 4uLL);
        a12.i32[3] = *(unsigned __int8 *)(v82 + v65);
        a13 = vsubq_s32(a14, (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vaddq_s32(v98, v87), a12), 2uLL));
        v18 = vaddq_s32(vsubq_s32((int32x4_t)vaddw_u16((uint32x4_t)v18, v94), v97), a13);
        if (a6 == 16)
        {
          a13.i32[0] = *(v90 - 1);
          a13.i64[0] = vmovl_u8(*(uint8x8_t *)a13.i8).u64[0];
          a14.i32[0] = *(_DWORD *)(v89 + 9);
          v99 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)a14.i8).u64[0];
          v100 = (int8x16_t)vmovl_u16(v99);
          v97.i8[0] = *(_BYTE *)(v113 + v65);
          v97.i8[2] = *(_BYTE *)(v85 + v65);
          v97.i8[4] = *(_BYTE *)(v86 + v65);
          v97.i8[6] = *(_BYTE *)(v114 + v65);
          v101 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v97.i8), v83);
          v102 = (int32x4_t)vaddw_u16((uint32x4_t)vaddq_s32((int32x4_t)vextq_s8((int8x16_t)a11, v100, 0xCuLL), (int32x4_t)vextq_s8((int8x16_t)a12, (int8x16_t)v101, 0xCuLL)), v99);
          a12 = vaddq_s32(v101, v87);
          v103 = vshrq_n_u32((uint32x4_t)vaddq_s32(v102, a12), 2uLL);
          a12.i32[0] = *v90;
          a12.i64[0] = vmovl_u8(*(uint8x8_t *)a12.i8).u64[0];
          v99.i32[0] = *(_DWORD *)(v89 + 13);
          v104 = (uint16x4_t)vmovl_u8((uint8x8_t)v99).u64[0];
          v96.i8[0] = *(_BYTE *)(v115 + v65);
          v96.i8[2] = *(_BYTE *)(v117 + v65);
          v96.i8[4] = *(_BYTE *)(v119 + v65);
          v96.i8[6] = *(_BYTE *)(v121 + v65);
          v105 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v96.i8), v83);
          a14 = vaddq_s32((int32x4_t)vaddw_u16((uint32x4_t)vaddq_s32((int32x4_t)vextq_s8(v100, (int8x16_t)vmovl_u16(v104), 0xCuLL), (int32x4_t)vextq_s8((int8x16_t)v101, (int8x16_t)v105, 0xCuLL)), v104), vaddq_s32(v105, v87));
          a11 = (int32x4_t)vsraq_n_u32(v103, (uint32x4_t)a14, 2uLL);
          v18 = vsubq_s32((int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a13.i8), *(uint16x4_t *)a12.i8), a11);
        }
        v65 += v84;
        --v88;
      }
      while (v88);
    }
    else
    {
      if (a6 < 1)
        goto LABEL_33;
      v38 = 0;
      v39 = v37 + a5 + 6;
      v40 = v37 + a5 + 7;
      v41 = v37 + a5 + 8;
      v42 = v37 + a5 + 9;
      v43 = v37 + a5 + 10;
      v120 = a2 + v37 + a5 + 15;
      v118 = a2 + v37 + a5 + 14;
      v116 = a2 + v37 + a5 + 13;
      v45 = a1 + 12;
      v46 = a2 + v37 + a5 + 12;
      v47 = a2 + v37 + a5;
      v48 = a2 + v37 + a5 + 1;
      v49 = a2 + v37 + a5 + 2;
      v50 = a2 + v37 + a5 + 3;
      v51 = a2 + v37 + a5 + 11;
      v52 = a2 + v37 + a5 + 4;
      v53 = a2 + v37 + a5 + 5;
      v54 = a2 + v39;
      v55 = a2 + v40;
      v56 = a2 + v41;
      v57 = a2 + v42;
      v18 = 0uLL;
      v58 = a2 + v43;
      v59.i64[0] = 0xFF000000FFLL;
      v59.i64[1] = 0xFF000000FFLL;
      v60 = a6;
      do
      {
        v61 = (unsigned __int32 *)(v45 + v38);
        v62 = v15 + v38;
        a9.i32[0] = *(_DWORD *)(v45 + v38 - 12);
        a10.i32[0] = *(_DWORD *)(v45 + v38 - 8);
        a9.i64[0] = vmovl_u8(*(uint8x8_t *)a9.i8).u64[0];
        a11.i32[0] = *(_DWORD *)(v15 + v38);
        a12.i32[0] = *(_DWORD *)(v15 + v38 + 4);
        a13.i8[0] = *(_BYTE *)(v47 + v38);
        a13.i8[2] = *(_BYTE *)(v48 + v38);
        a13.i8[4] = *(_BYTE *)(v49 + v38);
        a13.i8[6] = *(_BYTE *)(v50 + v38);
        v63 = (uint32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a13.i8), v59);
        a11 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a11.i8)), v63);
        v63.i8[0] = *(_BYTE *)(v52 + v38);
        v63.i8[2] = *(_BYTE *)(v53 + v38);
        v63.i8[4] = *(_BYTE *)(v54 + v38);
        v63.i8[6] = *(_BYTE *)(v55 + v38);
        a13 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v63.i8), v59);
        a12 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a12.i8)), (uint32x4_t)a13);
        a10 = vsubq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a10.i8)), a12);
        v18 = vaddq_s32(vsubq_s32((int32x4_t)vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a9.i8), a11), a10);
        if (a6 == 16)
        {
          a9.i32[0] = *(v61 - 1);
          a10.i32[0] = *(_DWORD *)(v62 + 8);
          a11.i32[0] = *(_DWORD *)(v62 + 12);
          a12.i8[0] = *(_BYTE *)(v56 + v38);
          a12.i8[2] = *(_BYTE *)(v57 + v38);
          a12.i8[4] = *(_BYTE *)(v58 + v38);
          a12.i8[6] = *(_BYTE *)(v51 + v38);
          a12 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a12.i8), v59);
          a10 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a10.i8)), (uint32x4_t)a12);
          a12.i32[0] = *v61;
          a12.i64[0] = vmovl_u8(*(uint8x8_t *)a12.i8).u64[0];
          a13.i8[0] = *(_BYTE *)(v46 + v38);
          a13.i8[2] = *(_BYTE *)(v116 + v38);
          a13.i8[4] = *(_BYTE *)(v118 + v38);
          a13.i8[6] = *(_BYTE *)(v120 + v38);
          a13 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a13.i8), v59);
          a11 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a11.i8)), (uint32x4_t)a13);
          v64 = (int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a9.i8)), *(uint16x4_t *)a12.i8);
          a9 = vaddq_s32(a10, a11);
          v18 = vsubq_s32(v64, a9);
        }
        v38 += a5;
        --v60;
      }
      while (v60);
    }
  }
  else
  {
    if (a6 < 1)
      goto LABEL_33;
    v23 = 0;
    v24 = a1 + 12;
    v18 = 0uLL;
    v25.i64[0] = 0xFF000000FFLL;
    v25.i64[1] = 0xFF000000FFLL;
    v26 = a6;
    do
    {
      v27 = v15 + v23;
      v28 = (__int32 *)(v24 + v23);
      a10.i8[0] = *(_BYTE *)(v15 + v23 + 3);
      a10.i8[4] = *(_BYTE *)(v15 + v23 + 4);
      a11.i8[0] = *(_BYTE *)(v15 + v23);
      a11.i8[2] = *(_BYTE *)(v15 + v23 + 2);
      a11.i16[2] = a10.i16[0];
      a11.i16[3] = a10.i16[2];
      v29 = (int8x16_t)vmovl_u16(*(uint16x4_t *)a11.i8);
      v30 = (int32x4_t)vandq_s8(v29, v25);
      v29.i32[0] = *(_DWORD *)(a1 + v23);
      a12.i32[0] = *(_DWORD *)(v24 + v23 - 8);
      v31 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v29.i8).u64[0];
      v32.i32[0] = *(unsigned __int8 *)(v15 + v23 + 1) + 1;
      v32.u64[1] = (unint64_t)vadd_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v30, (int8x16_t)v30, 4uLL), (int32x2_t)0x100000001);
      v32.i32[1] = v32.i32[0];
      v33 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v32, v30), 1uLL);
      v29.i64[0] = vmovl_u8(*(uint8x8_t *)a12.i8).u64[0];
      a12 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v29.i8);
      v29.i32[0] = *(_DWORD *)(v15 + v23 + 5);
      a10 = (int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v29.i8));
      a11 = vsubq_s32(a12, (int32x4_t)vrhaddq_u32((uint32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)a10, 0xCuLL), (uint32x4_t)a10));
      v18 = vaddq_s32(vsubq_s32((int32x4_t)vaddw_u16((uint32x4_t)v18, v31), v33), a11);
      if (a6 == 16)
      {
        a11.i32[0] = *(v28 - 1);
        v31.i32[0] = *v28;
        a11.i64[0] = vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
        a12.i32[0] = *(_DWORD *)(v27 + 9);
        v34 = (int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a12.i8));
        v35 = (int32x4_t)vrhaddq_u32((uint32x4_t)vextq_s8((int8x16_t)a10, v34, 0xCuLL), (uint32x4_t)v34);
        v33.i32[0] = *(_DWORD *)(v27 + 13);
        v36 = (int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v33.i8));
        a12 = (int32x4_t)vrhaddq_u32((uint32x4_t)vextq_s8(v34, v36, 0xCuLL), (uint32x4_t)v36);
        a10 = vaddq_s32(v35, a12);
        v18 = vsubq_s32((int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a11.i8), (uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v31)), a10);
      }
      v23 += a5;
      --v26;
    }
    while (v26);
  }
LABEL_29:
  v106 = vaddvq_s32(v18);
  if (a6 == 16)
  {
    v108 = v106 + 128;
    v107 = v106 < -128;
    v109 = v106 + 383;
    if (!v107)
      v109 = v108;
    return (v109 >> 8);
  }
LABEL_34:
  v111 = v106 + 32;
  v107 = v106 < -32;
  v112 = v106 + 95;
  if (!v107)
    v112 = v111;
  return (v112 >> 6);
}

uint64_t LHPIntp4(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  _BYTE *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unsigned __int8 *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  _BYTE *v38;
  int v39;

  v6 = *(int *)(a6 + 24);
  v7 = (int)v6 * (uint64_t)(int)result;
  v8 = a5 + v7 + a2;
  v9 = 2 * a3;
  if ((*(_BYTE *)(a6 + 48) & 0x80) != 0)
  {
    if (a3 >= 1)
    {
      v25 = 0;
      v26 = (a3 - 1);
      v27 = (2 * v9) | 2;
      v28 = a2 + v7;
      v29 = (unsigned __int8 *)(a5 + v6 + v28);
      v30 = a5 + ~v6 + v28;
      v31 = (_BYTE *)(a4 + 1);
      do
      {
        v32 = 0;
        v33 = v29;
        v34 = v31;
        do
        {
          *(v34 - 1) = (*(unsigned __int8 *)(v8 + v32)
                      + *(unsigned __int8 *)(v30 + v32 + 1)
                      + *(unsigned __int8 *)(v8 + v32 - 1)
                      + *(unsigned __int8 *)(v30 + v32)
                      + 2) >> 2;
          *v34 = (*(unsigned __int8 *)(v8 + v32) + *(unsigned __int8 *)(v30 + v32 + 1) + 1) >> 1;
          v34[v9] = (*(unsigned __int8 *)(v8 + v32) + *(unsigned __int8 *)(v8 + v32 - 1) + 1) >> 1;
          ++v32;
          v34 += 2;
        }
        while (a3 != v32);
        *(_BYTE *)(a4 + v9) = (*(unsigned __int8 *)(v8 + v26)
                             + *(unsigned __int8 *)(v8 + a3)
                             + *(unsigned __int8 *)(v8 + a3 - 1 - v6)
                             + *(unsigned __int8 *)(v8 + a3 - v6)
                             + 2) >> 2;
        *(_BYTE *)(a4 + v27 - 1) = (*(unsigned __int8 *)(v8 + v26)
                                  + *(unsigned __int8 *)(v8 + a3)
                                  + 1) >> 1;
        v8 += v6;
        a4 += (int)v27;
        ++v25;
        v29 = &v33[v6];
        v30 += v6;
        v31 += (int)v27;
      }
      while (v25 != a3);
      v35 = 0;
      v36 = ~v6;
      do
      {
        v37 = &v33[v36];
        result = v33[v36 + 1];
        v38 = (_BYTE *)(a4 + v35);
        *v38 = (*v33 + *(v33 - 1) + (_DWORD)result + v33[v36] + 2) >> 2;
        v39 = *v33++;
        v38[1] = (v39 + v37[1] + 1) >> 1;
        v35 += 2;
      }
      while (2 * a3 != v35);
    }
  }
  else if (a3 >= 1)
  {
    v10 = 0;
    v11 = (a3 - 1);
    v12 = (2 * v9) | 2;
    v13 = a2 + v7;
    v14 = (unsigned __int8 *)(a5 + v6 + v13);
    v15 = a5 + ~v6 + v13;
    v16 = (_BYTE *)(a4 + 1);
    do
    {
      v17 = 0;
      v18 = v14;
      v19 = v16;
      do
      {
        *(v19 - 1) = (*(unsigned __int8 *)(v8 + v17)
                    + *(unsigned __int8 *)(v15 + v17 + 1)
                    + *(unsigned __int8 *)(v8 + v17 - 1)
                    + *(unsigned __int8 *)(v15 + v17)
                    + 2) >> 2;
        *v19 = (*(unsigned __int8 *)(v8 + v17) + *(unsigned __int8 *)(v15 + v17 + 1) + 1) >> 1;
        v19[v9] = (*(unsigned __int8 *)(v8 + v17) + *(unsigned __int8 *)(v8 + v17 - 1) + 1) >> 1;
        ++v17;
        v19 += 2;
      }
      while (a3 != v17);
      *(_BYTE *)(a4 + v9) = (*(unsigned __int8 *)(v8 + v11)
                           + *(unsigned __int8 *)(v8 + a3)
                           + *(unsigned __int8 *)(v8 + a3 - 1 - v6)
                           + *(unsigned __int8 *)(v8 + a3 - v6)
                           + 2) >> 2;
      *(_BYTE *)(a4 + v12 - 1) = (*(unsigned __int8 *)(v8 + v11)
                                + *(unsigned __int8 *)(v8 + a3)
                                + 1) >> 1;
      v8 += v6;
      a4 += (int)v12;
      ++v10;
      v14 = &v18[v6];
      v15 += v6;
      v16 += (int)v12;
    }
    while (v10 != a3);
    v20 = 0;
    v21 = ~v6;
    do
    {
      v22 = &v18[v21];
      result = v18[v21 + 1];
      v23 = (_BYTE *)(a4 + v20);
      *v23 = (*v18 + *(v18 - 1) + (_DWORD)result + v18[v21] + 2) >> 2;
      v24 = *v18++;
      v23[1] = (v24 + v22[1] + 1) >> 1;
      v20 += 2;
    }
    while (2 * a3 != v20);
  }
  *(_BYTE *)(a4 + v9) = (*(unsigned __int8 *)(v8 + a3 - 1)
                       + *(unsigned __int8 *)(v8 + a3)
                       + *(unsigned __int8 *)(v8 + a3 - 1 - (int)v6)
                       + *(unsigned __int8 *)(v8 + a3 - v6)
                       + 2) >> 2;
  return result;
}

char *Motion_CheckSurroundingVectors(char *result, uint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint8x8_t *a9, int a10, int a11, int a12, uint64_t a13)
{
  int v14;
  int v15;
  int v16;
  _DWORD *v17;
  int v18;
  int v19;
  int v21;
  int v23;
  int v24;
  uint8x8_t *v26;
  int v27;

  if (a5 < 33)
  {
    v14 = *result;
    if (a5 > -32)
    {
      if ((v14 - a5 - 32) >= 0xFFFFFFC0)
        goto LABEL_3;
    }
    else if (v14 <= 0)
    {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = *result;
    if ((v14 & 0x80000000) == 0)
    {
LABEL_3:
      v15 = 0;
      goto LABEL_7;
    }
  }
  v14 = 0;
  v15 = 1;
LABEL_7:
  if (a6 >= 33)
  {
    v16 = result[1];
    if ((v16 & 0x80000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v16 = result[1];
  if (a6 <= -32)
  {
    if (v16 <= 0)
      goto LABEL_10;
LABEL_9:
    v16 = 0;
    v15 = 1;
    goto LABEL_10;
  }
  if ((v16 - a6 - 32) < 0xFFFFFFC0)
    goto LABEL_9;
LABEL_10:
  v17 = (_DWORD *)(a7 + 32848);
  v18 = 16 * a10;
  v19 = 16 * a11;
  if (v14 > 32 && a11 == a3)
    v21 = 32;
  else
    v21 = v14;
  if (v16 > 32 && a10 == a4)
    v23 = 32;
  else
    v23 = v16;
  if (v21 & 1 | v23 & 1)
  {
    v26 = (uint8x8_t *)(a7 + 37652);
    DHPIntp((v18 + (v23 >> 1)), v19 + (v21 >> 1), v23 & 1, v21 & 1, 16, a7 + 37652, a8, (uint64_t)v17);
    result = (char *)DHPErr(16, a9, v26, a12, a13, (uint64_t)v17);
    if ((int)result < a12)
    {
      *(_DWORD *)(a2 + 8) = (_DWORD)result;
      *(_BYTE *)a2 = v21;
      *(_BYTE *)(a2 + 1) = v23;
    }
  }
  else if (v21 | v23)
  {
    v24 = v19 + (v21 >> 1);
    v27 = v18 + (v23 >> 1);
    result = (char *)PredErr3(16, a9, (uint8x8_t *)(a8 + *(int *)(a7 + 32872) * (uint64_t)v27 + v24), a12, a13, (uint64_t)v17);
    if ((int)result < a12)
    {
      *(_DWORD *)(a2 + 8) = (_DWORD)result;
      *(_BYTE *)a2 = v21;
      *(_BYTE *)(a2 + 1) = v23;
      if (!v15)
      {
        result = (char *)Motion_DoHalfPel((_BYTE *)a2, 16, v27, v24, (uint64_t)result, a8, (unsigned __int8 *)a9, a7 + 37652, v17, a13);
        *(_DWORD *)(a2 + 8) = (_DWORD)result;
      }
    }
  }
  return result;
}

int *H263ME_computeBlkStat_old(int *result, uint64_t a2, int a3, int a4, char a5, uint64_t a6)
{
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  unsigned int v12;
  int v13;
  uint64_t j;
  int v15;
  uint64_t v16;
  uint64_t k;
  int v18;
  uint64_t m;

  v6 = a3 * a3;
  v7 = 0;
  if ((a5 & 0x80) == 0)
  {
    if (a3 > 0)
    {
      v8 = 0;
      v9 = a2;
      do
      {
        for (i = 0; i != a3; v8 += *(unsigned __int8 *)(v9 + i++))
          ;
        ++v7;
        v9 += a4;
      }
      while (v7 != a3);
      v11 = 0;
      v7 = 0;
      v12 = v6 >> 1;
      v13 = (int)(v8 + (v6 >> 1)) / (int)v6;
      do
      {
        for (j = 0; j != a3; v7 += *(_DWORD *)(a6 + 4 * (*(unsigned __int8 *)(a2 + j++) - v13)))
          ;
        ++v11;
        a2 += a4;
      }
      while (v11 != a3);
      goto LABEL_23;
    }
LABEL_22:
    v12 = v6 >> 1;
    v13 = (v6 >> 1) / v6;
    goto LABEL_23;
  }
  if (a3 <= 0)
    goto LABEL_22;
  v15 = 0;
  v16 = a2;
  do
  {
    for (k = 0; k != a3; v15 += *(unsigned __int8 *)(v16 + k++))
      ;
    ++v7;
    v16 += a4;
  }
  while (v7 != a3);
  v18 = 0;
  v7 = 0;
  v12 = v6 >> 1;
  v13 = (int)(v15 + (v6 >> 1)) / (int)v6;
  do
  {
    for (m = 0; m != a3; v7 += *(_DWORD *)(a6 + 4 * (*(unsigned __int8 *)(a2 + m++) - v13)))
      ;
    ++v18;
    a2 += a4;
  }
  while (v18 != a3);
LABEL_23:
  result[1] = v7;
  result[2] = (int)(v7 + v12) / (int)v6;
  *result = v13;
  return result;
}

int *H263ME_BlkStat(int *result, uint64_t a2, int a3, char a4, uint64_t a5, unsigned int *a6)
{
  unsigned int v6;
  unint64_t v7;
  int v12;
  unint64_t v13;
  int *v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  int *v18;
  int v20;

  v7 = a6[9];
  v6 = a6[10];
  if (v7 < v6)
  {
    v12 = 16 * v7;
    LODWORD(v13) = a6[8];
    v14 = &result[66 * v7];
    do
    {
      v15 = a6[7];
      if (v15 < v13)
      {
        v16 = 16 * v15;
        v20 = v12;
        v17 = a2 + (v12 * a3);
        v18 = &v14[3 * v15];
        do
        {
          result = H263ME_computeBlkStat_old(v18, v17 + v16, 16, a3, a4, a5);
          v16 += 16;
          ++v15;
          v13 = a6[8];
          v18 += 3;
        }
        while (v15 < v13);
        v6 = a6[10];
        v12 = v20;
      }
      v12 += 16;
      ++v7;
      v14 += 66;
    }
    while (v7 < v6);
  }
  return result;
}

uint64_t ComputeAvgSAD(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  unsigned int v4;
  int *v5;
  uint64_t v6;
  int *v7;
  int v8;

  if (a3)
  {
    v3 = 0;
    v4 = 0;
    v5 = (int *)(a1 + 8);
    do
    {
      if (a2)
      {
        v6 = a2;
        v7 = v5;
        do
        {
          v8 = *v7;
          v7 += 3;
          v4 += v8;
          --v6;
        }
        while (v6);
      }
      ++v3;
      v5 += 72;
    }
    while (v3 != a3);
  }
  else
  {
    v4 = 0;
  }
  return v4 / (a3 * a2);
}

void *MEM_New(int a1)
{
  return malloc_type_malloc(a1, 0x8852F662uLL);
}

void *MEM_NewClear(int a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x602BC464uLL);
}

uint64_t InitSharedTables(uint64_t result, int a2)
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = COLOR_Init((void ***)(result + 24), a2);
    if (!(_DWORD)result)
    {
      result = InitMacroBlockTables((int32x2_t **)v3, 128);
      if (!(_DWORD)result)
      {
        result = InitMacroBlockTables((int32x2_t **)(v3 + 8), 176);
        if (!(_DWORD)result)
        {
          result = InitMacroBlockTables((int32x2_t **)(v3 + 16), 352);
          if (!(_DWORD)result)
          {
            result = InitQuantTables((uint64_t *)(v3 + 32), a2);
            if (!(_DWORD)result)
            {
              result = InitSundryTables((void ***)(v3 + 48), a2);
              if (!(_DWORD)result)
                return InitHuffmanTables(v3 + 40, a2);
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL InitSundryTables(void ***a1, int a2)
{
  _BOOL8 result;
  void **v5;
  void **v6;
  _OWORD *v7;
  void **v8;
  char *v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t v15;
  int32x4_t v16;
  float32x4_t v17;
  int32x4_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  int32x4_t v22;
  int32x4_t v23;
  float32x4_t v24;
  int32x4_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int32x4_t v29;
  int32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  void **v33;
  void **v34;
  char *v35;
  uint64_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  uint64_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  uint64_t v44;
  int8x16_t v45;
  _OWORD *v46;
  _OWORD *v47;
  int8x16_t v48;
  __int128 v49;
  _OWORD *v50;
  void **v51;
  uint64_t v52;

  if (*a1)
    return 0;
  v5 = (void **)MEM_NewClear(2044);
  *a1 = v5;
  if (!v5)
    return 1;
  v6 = v5;
  if (a2)
  {
    result = 0;
    if (a2 == 1)
    {
      v7 = (_OWORD *)((char *)v6 + 1356);
      *v7 = xmmword_2285767A0;
      v7[1] = xmmword_2285767B0;
      v7[2] = xmmword_2285767C0;
      v7[3] = xmmword_2285767D0;
    }
  }
  else
  {
    if (v5[2])
    {
      result = 0;
    }
    else
    {
      (*a1)[2] = MEM_New(4100);
      v8 = *a1;
      v9 = (char *)(*a1)[2];
      result = v9 == 0;
      if (!v9)
        return 1;
      v10 = 512;
      v11 = (*a1)[2];
      do
      {
        *v11++ = v10 * v10;
        --v10;
      }
      while (v10 != -513);
      v8[3] = v9 + 2048;
      v6 = *a1;
    }
    if (!*(void **)((char *)v6 + 1484))
    {
      *(void **)((char *)*a1 + 1484) = MEM_New(0x4000);
      v12 = (uint64_t *)((char *)*a1 + 1484);
      v13 = *v12;
      result = *v12 == 0;
      if (!*v12)
        return 1;
      v14 = 0;
      v15 = (int32x4_t)xmmword_2285757F0;
      v16.i64[0] = 0x700000007;
      v16.i64[1] = 0x700000007;
      v17 = (float32x4_t)vdupq_n_s32(0x3EB504F3u);
      v18.i64[0] = 0x400000004;
      v18.i64[1] = 0x400000004;
      do
      {
        *(float32x4_t *)(v13 + v14) = vmulq_f32(vcvtq_f32_s32(vaddq_s32(v15, v16)), v17);
        v15 = vaddq_s32(v15, v18);
        v14 += 16;
      }
      while (v14 != 0x4000);
      v12[3] = v13 + 0x2000;
      v6 = *a1;
    }
    if (!*(void **)((char *)v6 + 1492))
    {
      *(void **)((char *)*a1 + 1492) = MEM_New(4096);
      v19 = (uint64_t *)((char *)*a1 + 1492);
      v20 = *v19;
      result = *v19 == 0;
      if (!*v19)
        return 1;
      v21 = 0;
      v22 = (int32x4_t)xmmword_2285757F0;
      v23.i64[0] = 0x100000001;
      v23.i64[1] = 0x100000001;
      v24 = (float32x4_t)vdupq_n_s32(0x3EFB14BEu);
      v25.i64[0] = 0x400000004;
      v25.i64[1] = 0x400000004;
      do
      {
        *(float32x4_t *)(v20 + v21) = vmulq_f32(vcvtq_f32_s32(vaddq_s32(v22, v23)), v24);
        v22 = vaddq_s32(v22, v25);
        v21 += 16;
      }
      while (v21 != 4096);
      v19[3] = v20 + 2048;
      v6 = *a1;
    }
    if (!*(void **)((char *)v6 + 1500))
    {
      *(void **)((char *)*a1 + 1500) = MEM_New(0x2000);
      v26 = (uint64_t *)((char *)*a1 + 1500);
      v27 = *v26;
      result = *v26 == 0;
      if (!*v26)
        return 1;
      v28 = 0;
      v29 = (int32x4_t)xmmword_2285757F0;
      v30.i64[0] = 0x300000003;
      v30.i64[1] = 0x300000003;
      v31 = (float32x4_t)vdupq_n_s32(0x3EEC835Eu);
      v32.i64[0] = 0x400000004;
      v32.i64[1] = 0x400000004;
      do
      {
        *(float32x4_t *)(v27 + v28) = vmulq_f32(vcvtq_f32_s32(vaddq_s32(v29, v30)), v31);
        v29 = vaddq_s32(v29, v32);
        v28 += 16;
      }
      while (v28 != 0x2000);
      v26[3] = v27 + 4096;
    }
  }
  v33 = *a1;
  if (!**a1)
  {
    **a1 = MEM_New(0x10000);
    v34 = *a1;
    v35 = (char *)**a1;
    result = v35 == 0;
    if (v35)
    {
      v36 = 0;
      v37 = (int32x4_t)xmmword_2285757F0;
      v38.i64[0] = 0x200000002000;
      v38.i64[1] = 0x200000002000;
      v39.i64[0] = 0x400000004;
      v39.i64[1] = 0x400000004;
      do
      {
        *(int32x4_t *)&v35[v36] = vsubq_s32(v38, v37);
        v37 = vaddq_s32(v37, v39);
        v36 += 16;
      }
      while (v36 != 0x8000);
      v40 = 0;
      v41 = (int32x4_t)xmmword_2285767E0;
      v42.i64[0] = 0x1F0000001FLL;
      v42.i64[1] = 0x1F0000001FLL;
      v43.i64[0] = 0x400000004;
      v43.i64[1] = 0x400000004;
      do
      {
        *(int32x4_t *)&v35[v40 + 0x8000] = vaddq_s32(v41, v42);
        v41 = vaddq_s32(v41, v43);
        v40 += 16;
      }
      while (v40 != 0x8000);
      v34[1] = v35 + 0x8000;
      v33 = *a1;
      goto LABEL_36;
    }
    return 1;
  }
LABEL_36:
  v44 = 0;
  *((_OWORD *)v33 + 32) = 0u;
  *((_OWORD *)v33 + 33) = 0u;
  *((_OWORD *)v33 + 30) = 0u;
  *((_OWORD *)v33 + 31) = 0u;
  *((_OWORD *)v33 + 28) = 0u;
  *((_OWORD *)v33 + 29) = 0u;
  *((_OWORD *)v33 + 26) = 0u;
  *((_OWORD *)v33 + 27) = 0u;
  *((_OWORD *)v33 + 24) = 0u;
  *((_OWORD *)v33 + 25) = 0u;
  *((_OWORD *)v33 + 22) = 0u;
  *((_OWORD *)v33 + 23) = 0u;
  *((_OWORD *)v33 + 20) = 0u;
  *((_OWORD *)v33 + 21) = 0u;
  *((_OWORD *)v33 + 18) = 0u;
  *((_OWORD *)v33 + 19) = 0u;
  *((_OWORD *)v33 + 16) = 0u;
  *((_OWORD *)v33 + 17) = 0u;
  *((_OWORD *)v33 + 14) = 0u;
  *((_OWORD *)v33 + 15) = 0u;
  *((_OWORD *)v33 + 12) = 0u;
  *((_OWORD *)v33 + 13) = 0u;
  *((_OWORD *)v33 + 10) = 0u;
  *((_OWORD *)v33 + 11) = 0u;
  *((_OWORD *)v33 + 8) = 0u;
  *((_OWORD *)v33 + 9) = 0u;
  *((_OWORD *)v33 + 6) = 0u;
  *((_OWORD *)v33 + 7) = 0u;
  *((_OWORD *)v33 + 4) = 0u;
  *((_OWORD *)v33 + 5) = 0u;
  v45 = (int8x16_t)xmmword_2285767F0;
  v46 = v33 + 68;
  *((_OWORD *)v33 + 2) = 0u;
  *((_OWORD *)v33 + 3) = 0u;
  v47 = v33 + 100;
  v48.i64[0] = 0x1010101010101010;
  v48.i64[1] = 0x1010101010101010;
  do
  {
    v46[v44++] = v45;
    v45 = vaddq_s8(v45, v48);
  }
  while (v44 != 16);
  *(_QWORD *)&v49 = -1;
  *((_QWORD *)&v49 + 1) = -1;
  v47[30] = v49;
  v47[31] = v49;
  v47[28] = v49;
  v47[29] = v49;
  v47[26] = v49;
  v47[27] = v49;
  v47[24] = v49;
  v47[25] = v49;
  v47[22] = v49;
  v47[23] = v49;
  v47[20] = v49;
  v47[21] = v49;
  v47[18] = v49;
  v47[19] = v49;
  v47[16] = v49;
  v47[17] = v49;
  v47[14] = v49;
  v47[15] = v49;
  v47[12] = v49;
  v47[13] = v49;
  v47[10] = v49;
  v47[11] = v49;
  v47[8] = v49;
  v47[9] = v49;
  v47[6] = v49;
  v47[7] = v49;
  v47[4] = v49;
  v47[5] = v49;
  v47[2] = v49;
  v47[3] = v49;
  *v47 = v49;
  v47[1] = v49;
  (*a1)[164] = *a1 + 68;
  v50 = (_OWORD *)((char *)*a1 + 1532);
  *v50 = xmmword_228576800;
  v50[1] = xmmword_228576810;
  v50[2] = xmmword_228576820;
  v50[3] = xmmword_228576830;
  v50[4] = xmmword_228576840;
  v50[5] = xmmword_228576850;
  v50[6] = xmmword_228576860;
  v50[7] = xmmword_2285757F0;
  v50[8] = xmmword_228576870;
  v50[9] = xmmword_228576880;
  v50[10] = xmmword_228576890;
  v50[11] = xmmword_2285768A0;
  v50[12] = xmmword_2285768B0;
  v50[13] = xmmword_2285768C0;
  v50[14] = xmmword_2285768D0;
  v50[15] = xmmword_2285768E0;
  v50[16] = xmmword_228576710;
  v50[17] = xmmword_2285768F0;
  v50[18] = xmmword_228576810;
  v50[19] = xmmword_228576900;
  v50[20] = xmmword_228576910;
  v50[21] = xmmword_228576800;
  v50[22] = xmmword_2285768A0;
  v50[23] = xmmword_228576880;
  v50[24] = xmmword_228576860;
  v50[25] = xmmword_228576840;
  v50[26] = xmmword_2285768E0;
  v50[27] = xmmword_228576920;
  v50[28] = xmmword_228576900;
  v50[29] = xmmword_2285768D0;
  v50[30] = xmmword_228576930;
  v50[31] = xmmword_228576940;
  v51 = *a1;
  v52 = (uint64_t)*a1 + 1324;
  *(_OWORD *)v52 = xmmword_228576950;
  *(_QWORD *)(v52 + 16) = 0xA0A090909080808;
  *((_DWORD *)v51 + 337) = 185273098;
  *((_WORD *)v51 + 676) = 3084;
  *((_BYTE *)v51 + 1354) = 12;
  return result;
}

uint64_t KillSharedTables(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = COLOR_Kill((void ***)(result + 24));
    if (!(_DWORD)result)
    {
      KillSundryTables((void ***)(v1 + 48));
      result = H263PICT_Kill((void **)v1);
      if (!(_DWORD)result)
      {
        result = H263PICT_Kill((void **)(v1 + 8));
        if (!(_DWORD)result)
        {
          result = H263PICT_Kill((void **)(v1 + 16));
          if (!(_DWORD)result)
          {
            result = KillQuantTables((void **)(v1 + 32));
            if (!(_DWORD)result)
              return KillHuffmanTables((uint64_t *)(v1 + 40));
          }
        }
      }
    }
  }
  return result;
}

uint64_t KillSundryTables(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (v2)
  {
    if (v2[2])
    {
      MEM_Dispose(v2[2]);
      (*a1)[2] = 0;
      v2 = *a1;
    }
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      v2 = *a1;
    }
    if (*(void **)((char *)v2 + 1484))
    {
      MEM_Dispose(*(void **)((char *)v2 + 1484));
      *(void **)((char *)*a1 + 1484) = 0;
      *(void **)((char *)*a1 + 1508) = 0;
      v2 = *a1;
    }
    if (*(void **)((char *)v2 + 1492))
    {
      MEM_Dispose(*(void **)((char *)v2 + 1492));
      *(void **)((char *)*a1 + 1492) = 0;
      *(void **)((char *)*a1 + 1516) = 0;
      v2 = *a1;
    }
    if (*(void **)((char *)v2 + 1500))
    {
      MEM_Dispose(*(void **)((char *)v2 + 1500));
      *(void **)((char *)*a1 + 1500) = 0;
      *(void **)((char *)*a1 + 1524) = 0;
      v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t InitSourceInfo(_QWORD *a1, int a2, int a3, int a4)
{
  _DWORD *v8;
  char v9;
  _DWORD *v10;
  uint64_t result;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v8 = MEM_NewClear(44);
  *a1 = v8;
  if (!v8)
    return 1;
  v9 = a4 - 1;
  if ((a4 - 1) > 2)
    return 1;
  v10 = v8;
  result = 0;
  v12 = dword_22857697C[v9];
  v13 = dword_228576988[v9];
  v14 = dword_228576994[v9];
  v15 = dword_2285769A0[v9];
  v16 = dword_2285769AC[v9];
  v10[4] = dword_228576970[v9];
  v10[5] = v12;
  *v10 = v14;
  v10[1] = v15;
  v10[9] = v13;
  v10[10] = (a4 - 1) + 1;
  v10[6] = v16;
  v10[7] = a3;
  v10[8] = a2;
  return result;
}

uint64_t InitGOBGlobals(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t result;
  uint64_t i;

  if (!*a1)
  {
    v2 = MEM_NewClear(114);
    *a1 = v2;
    result = 1;
    if (!v2)
      return result;
    v2[3] = 8;
    for (i = 97; i != 114; ++i)
      *(_BYTE *)(*a1 + i) = 1;
  }
  return 0;
}

BOOL InitFrameStore(uint64_t a1, int a2, int a3)
{
  _BOOL8 result;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (*(_QWORD *)a1)
    return 0;
  v7 = MEM_NewClear(36);
  *(_QWORD *)a1 = v7;
  if (!v7)
    return 1;
  v8 = a2 + 32;
  v9 = a3 + 32;
  **(_QWORD **)a1 = MEM_NewClear(v9 * v8);
  if (!**(_QWORD **)a1)
    return 1;
  v10 = v8 >= 0 ? v8 : v8 + 1;
  v11 = (v10 >> 1) * v9;
  v12 = v11 >= 0 ? (v10 >> 1) * v9 : v11 + 1;
  v13 = (v12 >> 1);
  *(_QWORD *)(*(_QWORD *)a1 + 8) = MEM_New(v12 >> 1);
  if (!*(_QWORD *)(*(_QWORD *)a1 + 8))
    return 1;
  if (v11 >= 2)
  {
    v14 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + v14++) = 0x80;
    while (v13 != v14);
  }
  *(_QWORD *)(*(_QWORD *)a1 + 16) = MEM_New(v13);
  v15 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  result = v15 == 0;
  if (v15)
    v16 = v11 < 2;
  else
    v16 = 1;
  if (!v16)
  {
    v17 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)a1 + 16) + v17++) = 0x80;
    while (v13 != v17);
    return 0;
  }
  return result;
}

uint64_t KillFrameStore(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (v2)
  {
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      v2 = *a1;
    }
    if (v2[1])
    {
      MEM_Dispose(v2[1]);
      (*a1)[1] = 0;
      v2 = *a1;
    }
    if (v2[2])
    {
      MEM_Dispose(v2[2]);
      (*a1)[2] = 0;
      v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t InitInstanceGlobals(uint64_t *a1, int a2, int a3, int a4, int a5, int a6, uint64_t a7, _QWORD *a8)
{
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v15 = *a1;
  v23 = v15;
  if (v15)
  {
    if (*(unsigned __int8 *)(v15 + 296254) == a4
      && *(_DWORD *)(v15 + 296246) == a2
      && *(_DWORD *)(v15 + 296250) == a3)
    {
      goto LABEL_6;
    }
    KillInstanceGlobals(&v23);
    v15 = v23;
    if (v23)
      goto LABEL_6;
  }
  v17 = (char *)MEM_NewClear(296262);
  if (!v17)
    return 1;
  v15 = (uint64_t)v17;
  v18 = (uint64_t *)(v17 + 296182);
  *(_QWORD *)(v17 + 296238) = a8;
  v17[296254] = a4;
  *(_DWORD *)(v17 + 296246) = a2;
  *(_DWORD *)(v17 + 296250) = a3;
  if (InitSourceInfo(v17 + 296174, a3, a2, a4))
    return 1;
  result = InitMacroBlock(v18);
  if (!(_DWORD)result)
  {
    result = InitQuantization((char **)(v15 + 296206));
    if (!(_DWORD)result)
    {
      if (!v18[1])
      {
        v19 = MEM_NewClear(2052);
        v18[1] = (uint64_t)v19;
        if (!v19)
          return 1;
      }
      result = H263PICT_Init((_QWORD *)(v15 + 296214));
      if (!(_DWORD)result)
      {
        if (InitGOBGlobals((_QWORD *)(v15 + 296222)))
          return 1;
        result = H263ME_Init((uint64_t *)(v15 + 296198), a6);
        if (!(_DWORD)result)
        {
          if (!InitStream((_QWORD *)(v15 + 296230))
            && !InitFrameStore(v15 + 24, a2, a3)
            && !InitFrameStore(v15 + 32, a2, a3)
            && (a5 || !InitFrameStore(v15 + 40, a2, a3)))
          {
            v20 = *(void **)(v15 + 66);
            if (v20)
            {
              MEM_Dispose(v20);
              *(_QWORD *)(v15 + 66) = 0;
            }
            v21 = *(void **)(v15 + 58);
            if (v21)
            {
              MEM_Dispose(v21);
              *(_QWORD *)(v15 + 58) = 0;
            }
            v22 = *(void **)(v15 + 74);
            if (v22)
            {
              MEM_Dispose(v22);
              *(_QWORD *)(v15 + 74) = 0;
            }
            *(_DWORD *)v15 = a2;
            *(_DWORD *)(v15 + 4) = a2 >> 1;
            *(_DWORD *)(v15 + 8) = a2 >> 1;
            *(_DWORD *)(v15 + 12) = a3;
            *(_DWORD *)(v15 + 16) = a3 >> 1;
            *(_DWORD *)(v15 + 20) = a3 >> 1;
            *(_DWORD *)(v18[1] + 8) = 0;
            switch(a4)
            {
              case 1:
                goto LABEL_35;
              case 3:
                a8 += 2;
                goto LABEL_35;
              case 2:
                ++a8;
LABEL_35:
                *(_QWORD *)*v18 = *a8;
LABEL_6:
                result = 0;
                *(_DWORD *)(v15 + 296258) = 0;
                *a1 = v15;
                return result;
            }
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t KillInstanceGlobals(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;

  v1 = *a1;
  if (!*a1)
    return 0;
  v3 = (_QWORD *)(v1 + 296174);
  v4 = *(void **)(v1 + 296174);
  if (v4)
  {
    MEM_Dispose(v4);
    *v3 = 0;
    v1 = *a1;
  }
  result = KillMacroBlock((void **)(v1 + 296182));
  if (!(_DWORD)result)
  {
    result = KillQuantization((uint64_t *)(*a1 + 296206));
    if (!(_DWORD)result)
    {
      v6 = *a1;
      v7 = (void **)(*a1 + 296190);
      if (*v7)
      {
        MEM_Dispose(*v7);
        *v7 = 0;
        v6 = *a1;
      }
      result = H263PICT_Kill((void **)(v6 + 296214));
      if (!(_DWORD)result)
      {
        v8 = *a1;
        v9 = (void **)(*a1 + 296222);
        if (*v9)
        {
          MEM_Dispose(*v9);
          *v9 = 0;
          v8 = *a1;
        }
        result = H263PICT_Kill((void **)(v8 + 296198));
        if (!(_DWORD)result)
        {
          v10 = *a1;
          v11 = (void **)(*a1 + 296230);
          if (*v11)
          {
            MEM_Dispose(*v11);
            *v11 = 0;
            v10 = *a1;
          }
          KillFrameStore((void ***)(v10 + 24));
          KillFrameStore((void ***)(*a1 + 32));
          KillFrameStore((void ***)(*a1 + 40));
          v12 = *a1;
          if (*(_QWORD *)(*a1 + 66))
          {
            MEM_Dispose(*(void **)(*a1 + 66));
            *(_QWORD *)(*a1 + 66) = 0;
            v12 = *a1;
          }
          if (*(_QWORD *)(v12 + 58))
          {
            MEM_Dispose(*(void **)(v12 + 58));
            *(_QWORD *)(*a1 + 58) = 0;
            v12 = *a1;
          }
          if (*(_QWORD *)(v12 + 74))
          {
            MEM_Dispose(*(void **)(v12 + 74));
            *(_QWORD *)(*a1 + 74) = 0;
            v12 = *a1;
          }
          MEM_Dispose((void *)v12);
          result = 0;
          *a1 = 0;
        }
      }
    }
  }
  return result;
}

uint64_t InitStream(_QWORD *a1)
{
  _DWORD *v2;
  uint64_t v3;
  int64x2_t v4;
  uint64x2_t v5;
  int64x2_t v6;

  v2 = (_DWORD *)*a1;
  if (!v2)
  {
    v2 = MEM_NewClear(172);
    *a1 = v2;
    if (!v2)
      return 1;
  }
  v3 = 0;
  v4 = (int64x2_t)xmmword_228576700;
  v5 = (uint64x2_t)vdupq_n_s64(0x21uLL);
  v6 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v5, (uint64x2_t)v4)).u8[0] & 1) != 0)
      v2[v3 + 8] = ~(-1 << v3);
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x21uLL), *(uint64x2_t *)&v4)).i32[1] & 1) != 0)
      v2[v3 + 9] = ~(-1 << (v3 + 1));
    v3 += 2;
    v4 = vaddq_s64(v4, v6);
  }
  while (v3 != 34);
  return 0;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0330](sbuf, createIfNecessary);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x24BDC09E8]();
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x24BDF90A8]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x24BDF90B0]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x24BDF90C0]();
}

uint64_t VTRegisterVideoEncoderWithInfo()
{
  return MEMORY[0x24BDF9190]();
}

uint64_t VTVideoEncoderGetCMBaseObject()
{
  return MEMORY[0x24BDF91E8]();
}

uint64_t VTVideoEncoderGetClassID()
{
  return MEMORY[0x24BDF91F0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

