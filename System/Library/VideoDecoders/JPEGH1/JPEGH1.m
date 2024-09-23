void JPEGH1Register()
{
  CFMutableDictionaryRef Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  FigCFDictionarySetValue();
  VTRegisterVideoDecoderWithInfo();
  VTRegisterVideoDecoderWithInfo();
  VTRegisterVideoDecoderWithInfo();
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t H1JPEGVideoDecoder_CreateInstance(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  VTVideoDecoderGetClassID();
  v4 = CMDerivedObjectCreate();
  FigSignalErrorAt();
  *a3 = 0;
  return v4;
}

uint64_t H1JPEGVideoDecoder_Invalidate()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const void *v11;
  _QWORD block[5];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)DerivedStorage)
  {
    v1 = DerivedStorage;
    *(_BYTE *)DerivedStorage = 1;
    if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
    {
      while (*(_DWORD *)(v1 + 184))
        MEMORY[0x2199F46A8](2000);
      v2 = *(NSObject **)(v1 + 176);
      if (v2)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = __H1JPEGVideoDecoder_Invalidate_block_invoke;
        block[3] = &__block_descriptor_tmp;
        block[4] = v1;
        dispatch_sync(v2, block);
        IONotificationPortDestroy(*(IONotificationPortRef *)(v1 + 168));
        *(_QWORD *)(v1 + 168) = 0;
        v3 = *(NSObject **)(v1 + 176);
        if (v3)
        {
          dispatch_release(v3);
          *(_QWORD *)(v1 + 176) = 0;
        }
      }
      v4 = 0;
      v5 = v1 + 192;
      do
      {
        v6 = *(const void **)(v5 + v4);
        if (v6)
        {
          CFRelease(v6);
          *(_QWORD *)(v5 + v4) = 0;
        }
        v4 += 8;
      }
      while (v4 != 24);
      FigSemaphoreDestroy();
      *(_QWORD *)(v1 + 224) = 0;
      v7 = *(const void **)(v1 + 216);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)(v1 + 216) = 0;
      }
    }
    v8 = 0;
    v9 = v1 + 80;
    do
    {
      v10 = (_QWORD *)(v9 + v8);
      v11 = *(const void **)(v9 + v8);
      if (v11)
      {
        CFRelease(v11);
        *v10 = 0;
        v10[1] = 0;
      }
      v8 += 24;
    }
    while (v8 != 72);
    FigSimpleMutexDestroy();
  }
  return 0;
}

void H1JPEGVideoDecoder_Finalize()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  const void *v2;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_QWORD *)(DerivedStorage + 8) = 0;
  *(_QWORD *)(DerivedStorage + 32) = 0;
  *(_QWORD *)(DerivedStorage + 40) = 0;
  FigFormatDescriptionRelease();
  *(_QWORD *)(DerivedStorage + 16) = 0;
  v1 = *(unsigned int *)(DerivedStorage + 160);
  if ((_DWORD)v1)
  {
    JPEGDeviceInterface_closeDriverConnection(v1);
    *(_DWORD *)(DerivedStorage + 160) = 0;
  }
  v2 = *(const void **)(DerivedStorage + 64);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(DerivedStorage + 64) = 0;
  }
  v3 = *(const void **)(DerivedStorage + 232);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(DerivedStorage + 232) = 0;
  }
}

__CFString *H1JPEGVideoDecoder_CopyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<H1JPEGVideoDecoder %p>"), a1);
  return Mutable;
}

uint64_t H1JPEGVideoDecoder_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t DerivedStorage;
  CFNumberRef v7;
  const void *v8;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9438]))
  {
    v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberDoubleType, (const void *)(DerivedStorage + 48));
    *a4 = v7;
    if (!v7)
      return FigSignalErrorAt();
  }
  else
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9448]))
    {
      pthread_once(&sCreateSuggestedQualityOfServiceTiersOnce, jpeg_createSuggestedQualityOfServiceTiers);
      v8 = (const void *)sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers;
      if (!sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers)
        return FigSignalErrorAt();
    }
    else
    {
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF93D8]))
        return FigSignalErrorAt();
      v8 = (const void *)*MEMORY[0x24BDBD268];
    }
    *a4 = CFRetain(v8);
  }
  return 0;
}

uint64_t H1JPEGVideoDecoder_SetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  uint64_t DerivedStorage;
  const void *v6;
  CFTypeID TypeID;
  uint64_t result;
  double valuePtr;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v6 = *(const void **)(DerivedStorage + 232);
  if (v6)
    VTSessionSetProperty(v6, a2, a3);
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9438]))
  {
    CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9448]);
    return FigSignalErrorAt();
  }
  if (!a3)
    return FigSignalErrorAt();
  TypeID = CFNumberGetTypeID();
  if (TypeID != CFGetTypeID(a3))
    return FigSignalErrorAt();
  valuePtr = 1.0;
  CFNumberGetValue((CFNumberRef)a3, kCFNumberDoubleType, &valuePtr);
  if (valuePtr < 0.0 || valuePtr > 1.0)
    return FigSignalErrorAt();
  result = 0;
  if (*(_DWORD *)(DerivedStorage + 24) != 1936355431)
    *(double *)(DerivedStorage + 48) = valuePtr;
  return result;
}

void jpeg_createSuggestedQualityOfServiceTiers()
{
  uint64_t i;
  const void *v1;
  void *values[7];

  values[6] = *(void **)MEMORY[0x24BDAC8D0];
  values[0] = jpeg_createQualityOfServiceTier(1.0);
  values[1] = jpeg_createQualityOfServiceTier(0.75);
  values[2] = jpeg_createQualityOfServiceTier(0.5);
  values[3] = jpeg_createQualityOfServiceTier(0.333333333);
  values[4] = jpeg_createQualityOfServiceTier(0.2);
  values[5] = jpeg_createQualityOfServiceTier(0.1);
  sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)values, 6, MEMORY[0x24BDBD690]);
  if (!sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers)
    FigSignalErrorAt();
  for (i = 0; i != 6; ++i)
  {
    v1 = values[i];
    if (v1)
      CFRelease(v1);
  }
}

CFDictionaryRef jpeg_createQualityOfServiceTier(double a1)
{
  const __CFAllocator *v1;
  CFDictionaryRef v2;
  void *values;
  void *keys;
  double valuePtr;

  valuePtr = a1;
  keys = (void *)*MEMORY[0x24BDF9438];
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberDoubleType, &valuePtr);
  if (!values
    || (v2 = CFDictionaryCreate(v1, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) == 0)
  {
    FigSignalErrorAt();
    v2 = 0;
  }
  if (values)
    CFRelease(values);
  return v2;
}

uint64_t H1JPEGVideoDecoder_StartSession(uint64_t a1, uint64_t a2, const opaqueCMFormatDescription *a3)
{
  uint64_t DerivedStorage;
  const opaqueCMFormatDescription *v6;
  unint64_t Dimensions;
  CMVideoDimensions v8;
  unint64_t v9;
  int v10;
  const __CFAllocator *v11;
  __CFDictionary *Mutable;
  __CFArray *v13;
  CFNumberRef v14;
  CFNumberRef v15;
  int v16;
  int v17;
  CFNumberRef v18;
  CFNumberRef v19;
  int v20;
  const void **v21;
  uint64_t v22;
  uint64_t PixelBufferAttributesWithIOSurfaceSupport;
  const __CFDictionary *Extension;
  const __CFDictionary *v25;
  CFTypeID TypeID;
  const void *Value;
  const void *v28;
  __CFDictionary *v29;
  const opaqueCMFormatDescription *v30;
  CFTypeID v31;
  BOOL v32;
  const __CFData *v33;
  const __CFData *v34;
  CFTypeID v35;
  int v36;
  uint64_t v37;
  IONotificationPort *v38;
  uint64_t v39;
  uint64_t MachPort;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFAllocator *v44;
  __CFDictionary *v45;
  const __CFDictionary *v46;
  IOSurfaceRef v47;
  const __CFDictionary *DestinationPixelBufferAttributes;
  const __CFDictionary *MutableCopy;
  uint64_t v51;
  __CFDictionary *v52;
  uint64_t v53;
  const void *v54;
  const void *v55;
  CMSimpleQueueRef *v56;
  int valuePtr;
  int v58;
  CFDictionaryRef v59;

  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  valuePtr = 875704422;
  *(_QWORD *)(DerivedStorage + 8) = a2;
  FigFormatDescriptionRelease();
  v6 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain();
  *(_QWORD *)(DerivedStorage + 16) = v6;
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v6);
  v8 = (CMVideoDimensions)Dimensions;
  if ((int)Dimensions <= 32)
    return FigSignalErrorAt();
  v9 = HIDWORD(Dimensions);
  if (SHIDWORD(Dimensions) <= 16)
    return FigSignalErrorAt();
  v10 = *(unsigned __int8 *)(DerivedStorage + 72);
  if (*(_DWORD *)(DerivedStorage + 24) != 1936355431)
    goto LABEL_6;
  if (*(_BYTE *)(DerivedStorage + 72))
    return FigSignalErrorAt();
  valuePtr = 875836518;
LABEL_6:
  v53 = DerivedStorage;
  v59 = 0;
  v58 = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v13 = 0;
    v22 = 4294954392;
    goto LABEL_24;
  }
  v13 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (v13)
  {
    v14 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    if (v14)
    {
      v15 = v14;
      CFArrayAppendValue(v13, v14);
      CFRelease(v15);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v13);
      CFRelease(v13);
      setNumberInDictionary(Mutable, (const void *)*MEMORY[0x24BDC5708], v8.width);
      setNumberInDictionary(Mutable, (const void *)*MEMORY[0x24BDC5650], v8.height);
      if (!v10)
      {
        v20 = 16;
        setNumberInDictionary(Mutable, (const void *)*MEMORY[0x24BDC56C8], 16);
        v21 = (const void **)MEMORY[0x24BDC55D0];
        goto LABEL_21;
      }
      v16 = -(int)v9 & 0xF;
      v17 = -v8.width & 0xF;
      if (v17)
        setNumberInDictionary(Mutable, (const void *)*MEMORY[0x24BDC5628], v17);
      if (v16)
        setNumberInDictionary(Mutable, (const void *)*MEMORY[0x24BDC5610], v16);
      v13 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      if (v13)
      {
        v58 = v17 + v8.width;
        v18 = CFNumberCreate(0, kCFNumberSInt32Type, &v58);
        if (v18)
        {
          v19 = v18;
          CFArrayAppendValue(v13, v18);
          CFArrayAppendValue(v13, v19);
          CFRelease(v19);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5600], v13);
          CFRelease(v13);
          setNumberInDictionary(Mutable, CFSTR("ExactHeight"), v16 + v9);
          v20 = 32;
          v21 = (const void **)MEMORY[0x24BDC56C8];
LABEL_21:
          setNumberInDictionary(Mutable, *v21, v20);
          PixelBufferAttributesWithIOSurfaceSupport = FigCreatePixelBufferAttributesWithIOSurfaceSupport();
          if (!(_DWORD)PixelBufferAttributesWithIOSurfaceSupport)
          {
            CFRelease(Mutable);
            Mutable = CFDictionaryCreateMutableCopy(v11, 0, v59);
            if (Mutable)
            {
              v13 = 0;
              v22 = 0;
            }
            else
            {
              v22 = FigSignalErrorAt();
              v13 = 0;
            }
            goto LABEL_24;
          }
          v22 = PixelBufferAttributesWithIOSurfaceSupport;
          v13 = 0;
          goto LABEL_18;
        }
      }
    }
  }
  v22 = 4294954392;
LABEL_18:
  CFRelease(Mutable);
  Mutable = 0;
LABEL_24:
  if (v59)
    CFRelease(v59);
  if (v13)
    CFRelease(v13);
  if (!(_DWORD)v22)
  {
    VTDecoderSessionSetPixelBufferAttributes();
    if (*(_BYTE *)(v53 + 72) && ((v8.width & 0xFu) - 1 < 8 || (v9 & 0xF) - 1 <= 7))
    {
      *(_QWORD *)(v53 + 64) = Mutable;
      CFRetain(Mutable);
    }
    Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x24BDC0B80]);
    if (Extension)
    {
      v25 = Extension;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v25))
      {
        Value = CFDictionaryGetValue(v25, CFSTR("mjqt"));
        if (Value)
        {
          v28 = Value;
          v29 = Mutable;
          v30 = a3;
          v31 = CFDataGetTypeID();
          v32 = v31 == CFGetTypeID(v28);
          a3 = v30;
          Mutable = v29;
          if (v32)
          {
            if (CFDataGetLength((CFDataRef)v28))
              *(_QWORD *)(v53 + 32) = v28;
          }
        }
        v33 = (const __CFData *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x24BDC1258]);
        if (v33)
        {
          v34 = v33;
          v35 = CFDataGetTypeID();
          if (v35 == CFGetTypeID(v34))
          {
            if (CFDataGetLength(v34))
              *(_QWORD *)(v53 + 40) = v34;
          }
        }
      }
    }
    v36 = JPEGDeviceInterface_openDriverConnection();
    *(_DWORD *)(v53 + 160) = v36;
    if (v36)
    {
      v52 = Mutable;
      *(_QWORD *)(v53 + 152) = FigSimpleMutexCreate();
      if (*(_DWORD *)(v53 + 24) != 1936355431)
        goto LABEL_53;
      VTVideoDecoderGetCMBaseObject();
      v37 = CMBaseObjectGetDerivedStorage();
      *(_QWORD *)(v37 + 176) = FigDispatchQueueCreateWithPriority();
      v38 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
      *(_QWORD *)(v37 + 168) = v38;
      IONotificationPortSetDispatchQueue(v38, *(dispatch_queue_t *)(v37 + 176));
      v39 = *(unsigned int *)(v37 + 160);
      MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(v37 + 168));
      MEMORY[0x2199F46C0](v39, 0, MachPort, 0);
      CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v37 + 16));
      v56 = (CMSimpleQueueRef *)(v37 + 216);
      v41 = CMSimpleQueueCreate(v11, 3, (CMSimpleQueueRef *)(v37 + 216));
      if ((_DWORD)v41)
        goto LABEL_67;
      v42 = 0;
      *(_QWORD *)(v37 + 224) = FigSemaphoreCreate();
      v55 = (const void *)*MEMORY[0x24BDD8EC8];
      v54 = (const void *)*MEMORY[0x24BDBD270];
      v51 = v37;
      v43 = v37 + 192;
      v44 = v11;
      while (1)
      {
        v45 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (!v45)
          break;
        v46 = v45;
        CFDictionarySetValue(v45, v55, v54);
        if ((runningOnCortexA9_checked & 1) == 0)
          runningOnCortexA9_checked = 1;
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        v47 = IOSurfaceCreate(v46);
        CFRelease(v46);
        *(_QWORD *)(v43 + v42) = v47;
        if (!v47)
          goto LABEL_66;
        CMSimpleQueueEnqueue(*v56, v47);
        v42 += 8;
        v11 = v44;
        if (v42 == 24)
          goto LABEL_53;
      }
      *(_QWORD *)(v51 + v42 + 192) = 0;
LABEL_66:
      v41 = FigSignalErrorAt();
      v11 = v44;
      if ((_DWORD)v41)
      {
LABEL_67:
        v22 = v41;
        Mutable = v52;
      }
      else
      {
LABEL_53:
        v22 = (uint64_t)CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionarySetValue((CFMutableDictionaryRef)v22, (const void *)*MEMORY[0x24BDF9978], (const void *)*MEMORY[0x24BDBD268]);
        DestinationPixelBufferAttributes = (const __CFDictionary *)VTDecoderSessionGetDestinationPixelBufferAttributes();
        if (DestinationPixelBufferAttributes)
          MutableCopy = CFDictionaryCreateMutableCopy(v11, 0, DestinationPixelBufferAttributes);
        else
          MutableCopy = 0;
        Mutable = v52;
        if (VTDecompressionSessionCreate(v11, a3, (CFDictionaryRef)v22, MutableCopy, 0, (VTDecompressionSessionRef *)(v53 + 232)))
        {
          *(_QWORD *)(v53 + 232) = 0;
        }
        if (MutableCopy)
          CFRelease(MutableCopy);
        if (v22)
        {
          CFRelease((CFTypeRef)v22);
          v22 = 0;
        }
      }
    }
    else
    {
      v22 = FigSignalErrorAt();
    }
  }
  if (Mutable)
    CFRelease(Mutable);
  return v22;
}

uint64_t H1JPEGVideoDecoder_DecodeFrame(uint64_t a1, __IOSurface *a2, opaqueCMSampleBuffer *a3, char a4, _DWORD *a5)
{
  uint64_t DerivedStorage;
  uint64_t v10;
  int v11;
  OpaqueCMBlockBuffer *DataBuffer;
  CMVideoDimensions Dimensions;
  uint64_t PixelBuffer;
  __IOSurface *v16;
  __IOSurface *IOSurface;
  OpaqueCMBlockBuffer *v18;
  CVPixelBufferRef v19;
  OpaqueVTDecompressionSession *v20;
  uint64_t v21;
  __IOSurface *v22;
  const __CFAllocator *v23;
  __CVPixelBufferPool *PixelBufferPool;
  uint64_t SurfaceFromBBuf;
  __IOSurface **v26;
  CVPixelBufferRef v27;
  _BOOL4 v30;
  int v31;
  CMVideoDimensions v32;
  uint64_t v33;
  const __CFAllocator *v34;
  __CVPixelBufferPool *v35;
  uint64_t v36;
  uint64_t v37;
  __IOSurface *v38;
  BOOL v39;
  int v40;
  int v41;
  uint64_t v42;
  __IOSurface *outputHandler[6];
  VTDecodeInfoFlags infoFlagsOut;
  __int128 outputStruct;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 inputStruct;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  CVPixelBufferRef v57;
  CVPixelBufferRef pixelBufferOut[3];

  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)DerivedStorage)
  {
    v10 = DerivedStorage;
    v11 = *(_DWORD *)(DerivedStorage + 24);
    if ((a4 & 1) == 0 && v11 == 1936355431)
      return FigSignalErrorAt();
    if ((a4 & 1) != 0 && v11 == 1936355431)
    {
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      outputHandler[0] = 0;
      pixelBufferOut[0] = 0;
      v56 = 0;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      inputStruct = 0u;
      v50 = 0;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      outputStruct = 0u;
      if (!jpeg_ShouldDeliverThisFrame(v10, a3))
      {
        v22 = 0;
        v21 = 0;
        v16 = 0;
        *a5 |= 2u;
        goto LABEL_36;
      }
      Dimensions = CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v10 + 16));
      PixelBuffer = jpeg_checkAndMaybeUpdateOutputPixelBufferAttributes(v10, DataBuffer, *(_QWORD *)&Dimensions);
      if (!(_DWORD)PixelBuffer)
      {
        if (*(_DWORD *)(v10 + 24) == 1936355431)
        {
          v16 = (__IOSurface *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v10 + 216));
          if (v16)
            goto LABEL_24;
          do
          {
            FigSemaphoreWaitRelative();
            IOSurface = (__IOSurface *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v10 + 216));
          }
          while (!IOSurface);
LABEL_23:
          v16 = IOSurface;
LABEL_24:
          VTDecoderSessionTrace();
          SurfaceFromBBuf = jpeg_createSurfaceFromBBuf(v10, DataBuffer, *(_QWORD *)&Dimensions, outputHandler);
          if ((_DWORD)SurfaceFromBBuf)
          {
            v21 = SurfaceFromBBuf;
            v22 = outputHandler[0];
          }
          else
          {
            v26 = (__IOSurface **)malloc_type_calloc(1uLL, 0x30uLL, 0x10200402DB58FAAuLL);
            *v26 = a2;
            v22 = outputHandler[0];
            v27 = pixelBufferOut[0];
            v26[1] = outputHandler[0];
            v26[2] = v27;
            v26[3] = v16;
            *((_DWORD *)v26 + 8) = *a5 | 1;
            v26[5] = (__IOSurface *)MEMORY[0x2199F4624]();
            LODWORD(inputStruct) = IOSurfaceGetID(v22);
            DWORD2(inputStruct) = IOSurfaceGetID(v16);
            DWORD1(v52) = IOSurfaceGetWidth(v16);
            DWORD2(v52) = IOSurfaceGetHeight(v16);
            DWORD1(inputStruct) = IOSurfaceGetAllocSize(v22);
            HIDWORD(inputStruct) = IOSurfaceGetAllocSize(v16);
            HIDWORD(v52) = 0;
            v30 = (a4 & 4) == 0 || *(_DWORD *)(v10 + 24) == 1936355431 || Dimensions.height * Dimensions.width > 345600;
            v31 = *(_DWORD *)(v10 + 76);
            LODWORD(v53) = v30;
            HIDWORD(v53) = v31;
            HIDWORD(v55) = IOSurfaceGetWidth(v16);
            LODWORD(v56) = IOSurfaceGetHeight(v16);
            *(_QWORD *)&v54 = jpeg_asyncDecodeComplete;
            *((_QWORD *)&v54 + 1) = v10;
            *(_QWORD *)&v55 = v26;
            v21 = JPEGDeviceInterface_decodeJPEG(*(_DWORD *)(v10 + 160), &inputStruct, &outputStruct);
            if (!(_DWORD)v21)
            {
              VTDecoderSessionTrace();
              *a5 |= 1u;
              FigAtomicAdd32();
              v22 = 0;
              v16 = 0;
              outputHandler[0] = 0;
              pixelBufferOut[0] = 0;
              if ((*(_BYTE *)a5 & 2) == 0)
                goto LABEL_37;
            }
          }
LABEL_36:
          VTDecoderSessionEmitDecodedFrame();
LABEL_37:
          releaseJPEGInputSurface(v10 + 80, v22);
          if (pixelBufferOut[0])
            CFRelease(pixelBufferOut[0]);
          if (v16)
          {
            if (*(_DWORD *)(v10 + 24) == 1936355431)
            {
              CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v10 + 216), v16);
              FigSemaphoreSignal();
            }
          }
          return v21;
        }
        v23 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
        PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(v23, PixelBufferPool, pixelBufferOut);
        if (!(_DWORD)PixelBuffer)
        {
          IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut[0]);
          goto LABEL_23;
        }
      }
      v21 = PixelBuffer;
      v22 = 0;
      v16 = 0;
      goto LABEL_36;
    }
    v18 = CMSampleBufferGetDataBuffer(a3);
    v57 = 0;
    pixelBufferOut[0] = 0;
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    inputStruct = 0u;
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    outputStruct = 0u;
    if (!jpeg_ShouldDeliverThisFrame(v10, a3))
    {
      v19 = 0;
      v21 = 0;
      *a5 |= 2u;
LABEL_47:
      VTDecoderSessionEmitDecodedFrame();
LABEL_48:
      releaseJPEGInputSurface(v10 + 80, v19);
      if (v57)
        CFRelease(v57);
      return v21;
    }
    if (*(_BYTE *)(v10 + 240))
    {
      v19 = 0;
      goto LABEL_16;
    }
    v32 = CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v10 + 16));
    v33 = jpeg_checkAndMaybeUpdateOutputPixelBufferAttributes(v10, v18, *(_QWORD *)&v32);
    if ((_DWORD)v33)
    {
      v21 = v33;
    }
    else
    {
      v34 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v35 = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
      v36 = CVPixelBufferPoolCreatePixelBuffer(v34, v35, &v57);
      if (!(_DWORD)v36)
      {
        VTDecoderSessionTrace();
        v37 = jpeg_createSurfaceFromBBuf(v10, v18, *(_QWORD *)&v32, pixelBufferOut);
        if ((_DWORD)v37)
        {
          v21 = v37;
          v19 = pixelBufferOut[0];
          goto LABEL_46;
        }
        v38 = CVPixelBufferGetIOSurface(v57);
        v19 = pixelBufferOut[0];
        LODWORD(inputStruct) = IOSurfaceGetID(pixelBufferOut[0]);
        DWORD2(inputStruct) = IOSurfaceGetID(v38);
        DWORD1(v52) = IOSurfaceGetWidth(v38);
        DWORD2(v52) = IOSurfaceGetHeight(v38);
        DWORD1(inputStruct) = IOSurfaceGetAllocSize(v19);
        HIDWORD(inputStruct) = IOSurfaceGetAllocSize(v38);
        v39 = (a4 & 4) != 0 && v32.height * v32.width <= 345600;
        v40 = *(_DWORD *)(v10 + 76);
        v41 = !v39;
        HIDWORD(v52) = 0;
        LODWORD(v53) = v41;
        HIDWORD(v53) = v40;
        HIDWORD(v55) = IOSurfaceGetWidth(v38);
        LODWORD(v56) = IOSurfaceGetHeight(v38);
        v42 = JPEGDeviceInterface_decodeJPEG(*(_DWORD *)(v10 + 160), &inputStruct, &outputStruct);
        if ((_DWORD)v42)
        {
          v21 = v42;
          infoFlagsOut = 0;
          v20 = *(OpaqueVTDecompressionSession **)(v10 + 232);
          if (v20)
          {
LABEL_17:
            outputHandler[0] = (__IOSurface *)MEMORY[0x24BDAC760];
            outputHandler[1] = (__IOSurface *)0x40000000;
            outputHandler[2] = (__IOSurface *)__jpeg_DecodeFrameSynchronously_block_invoke;
            outputHandler[3] = (__IOSurface *)&__block_descriptor_tmp_8;
            outputHandler[4] = (__IOSurface *)v10;
            outputHandler[5] = a2;
            v21 = VTDecompressionSessionDecodeFrameWithOutputHandler(v20, a3, 0, &infoFlagsOut, outputHandler);
            if (!(_DWORD)v21)
            {
              VTDecoderSessionTrace();
              goto LABEL_48;
            }
          }
LABEL_46:
          FigSignalErrorAt();
          goto LABEL_47;
        }
        if (!*(_BYTE *)(v10 + 240))
        {
          VTDecoderSessionTrace();
          v21 = 0;
          goto LABEL_47;
        }
LABEL_16:
        infoFlagsOut = 0;
        v20 = *(OpaqueVTDecompressionSession **)(v10 + 232);
        if (v20)
          goto LABEL_17;
        v21 = 3758097084;
        goto LABEL_46;
      }
      v21 = v36;
      FigSignalErrorAt();
    }
    v19 = 0;
    goto LABEL_46;
  }
  return 4294954511;
}

uint64_t H1JPEGVideoDecoder_CopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  pthread_once(&sCreateSupportedPropertyDictionaryOnce, jpeg_createSupportedPropertyDictionary);
  if (!a2 || !sH1JPEGVideoDecoderSupportedPropertyDictionary)
    return FigSignalErrorAt();
  *a2 = CFRetain((CFTypeRef)sH1JPEGVideoDecoderSupportedPropertyDictionary);
  return 0;
}

void setNumberInDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t jpeg_ShouldDeliverThisFrame(uint64_t a1, CMSampleBufferRef sbuf)
{
  const __CFArray *SampleAttachmentsArray;
  const __CFDictionary *ValueAtIndex;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID TypeID;
  double v8;
  double v10;

  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sbuf, 0);
  if (SampleAttachmentsArray)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
    if (ValueAtIndex)
    {
      Value = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x24BDC0C90]);
      if (Value)
      {
        v6 = Value;
        TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6))
        {
          if (CFBooleanGetValue(v6))
            return 0;
        }
      }
    }
  }
  v8 = *(double *)(a1 + 48) + *(double *)(a1 + 56);
  *(double *)(a1 + 56) = v8;
  if (v8 < 1.0)
    return 0;
  v10 = v8 + -1.0;
  if (v10 >= 1.0)
    v10 = 1.0;
  *(double *)(a1 + 56) = v10;
  return 1;
}

uint64_t jpeg_checkAndMaybeUpdateOutputPixelBufferAttributes(uint64_t a1, CMBlockBufferRef theBuffer, unint64_t a3)
{
  uint64_t result;
  size_t DataLength;
  size_t v8;
  BOOL v9;
  size_t v10;
  size_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  size_t v16;
  char *v17;
  int v18;
  size_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  const void *v28;
  int v29;
  __CFDictionary *v30;
  const void *v31;
  __CFArray *Mutable;
  CFNumberRef v33;
  unint64_t v34;
  int v35;
  _BYTE destination[4];
  char *dataPointerOut;
  size_t lengthAtOffsetOut;
  _DWORD valuePtr[3];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if ((!*(_QWORD *)(a1 + 64) || !*(_BYTE *)(a1 + 72)) && *(_DWORD *)(a1 + 76) != -1)
    return 0;
  DataLength = CMBlockBufferGetDataLength(theBuffer);
  if (!DataLength)
    return 4294954386;
  v8 = DataLength;
  v9 = 0;
  v10 = 0;
  v34 = HIDWORD(a3);
  v35 = a3;
LABEL_7:
  dataPointerOut = 0;
  lengthAtOffsetOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, v10, &lengthAtOffsetOut, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    v11 = 0;
    v12 = 0;
    v13 = v10 - 1;
    v14 = lengthAtOffsetOut;
    v15 = lengthAtOffsetOut;
    v16 = lengthAtOffsetOut;
    while (1)
    {
      while (1)
      {
        if (v12 >= v16)
        {
          v10 += v16;
          if (v10 < v8)
            goto LABEL_7;
          return 4294954386;
        }
        v17 = dataPointerOut;
        if (!v9)
        {
          v18 = dataPointerOut[v11];
          v15 = v14;
          goto LABEL_20;
        }
        v18 = dataPointerOut[v12];
        if ((v18 & 0xF0) == 0xE0)
          break;
LABEL_17:
        if (v18 == 192)
        {
          if (v12 + 12 > v16)
          {
            v17 = (char *)valuePtr;
            CMBlockBufferCopyDataBytes(theBuffer, v12 + v13, 0xCuLL, valuePtr);
            dataPointerOut = (char *)valuePtr;
          }
          if (v17[v12 + 8] == 1)
          {
            v20 = 1;
            v21 = 4;
            goto LABEL_28;
          }
          v25 = v17[v12 + 10];
          result = 4294954386;
          if (v25 > 0x21)
          {
            if (v25 == 34)
            {
              v21 = 0;
              v20 = 0;
              v23 = 0;
              v22 = 16;
              v24 = 16;
            }
            else
            {
              if (v25 != 65)
                return result;
              v20 = 1;
              v21 = 3;
              v24 = 8;
              v22 = 32;
LABEL_36:
              v23 = 1;
            }
          }
          else
          {
            if (v25 != 17)
            {
              if (v25 != 33)
                return result;
              v20 = 0;
              v21 = 1;
              v24 = 8;
              v22 = 16;
              goto LABEL_36;
            }
            v20 = 1;
            v21 = 2;
LABEL_28:
            v22 = 8;
            v23 = 1;
            v24 = 8;
          }
          *(_DWORD *)(a1 + 76) = v21;
          result = *(_QWORD *)(a1 + 64);
          if (!result)
            return result;
          if (*(_BYTE *)(a1 + 72))
          {
            if ((v20 | v23) != 1)
              goto LABEL_49;
            v26 = v22 - ((v22 - 1) & v35);
            v27 = (v24 - ((v24 - 1) & v34)) & (v24 - 1);
            v28 = (const void *)*MEMORY[0x24BDC5628];
            v29 = v26 & (v22 - 1);
            if (v29)
              setNumberInDictionary((__CFDictionary *)result, v28, v26 & (v22 - 1));
            else
              CFDictionaryRemoveValue((CFMutableDictionaryRef)result, v28);
            v30 = *(__CFDictionary **)(a1 + 64);
            v31 = (const void *)*MEMORY[0x24BDC5610];
            if (v27)
              setNumberInDictionary(v30, v31, v27);
            else
              CFDictionaryRemoveValue(v30, v31);
            Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
            valuePtr[0] = v29 + v35;
            v33 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
            CFArrayAppendValue(Mutable, v33);
            CFArrayAppendValue(Mutable, v33);
            CFRelease(v33);
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x24BDC5600], Mutable);
            CFRelease(Mutable);
            setNumberInDictionary(*(__CFDictionary **)(a1 + 64), CFSTR("ExactHeight"), v27 + v34);
            VTDecoderSessionSetPixelBufferAttributes();
            result = *(_QWORD *)(a1 + 64);
            if (result)
            {
LABEL_49:
              CFRelease((CFTypeRef)result);
              result = 0;
              *(_QWORD *)(a1 + 64) = 0;
            }
            return result;
          }
          return 0;
        }
        v14 = v15;
        v11 = v12;
LABEL_20:
        v9 = v18 == 255;
        ++v11;
        v16 = v14;
        v12 = v11;
      }
      if (v12 + 4 <= v16)
      {
        v19 = v12 - 1;
      }
      else
      {
        v17 = destination;
        CMBlockBufferCopyDataBytes(theBuffer, v12 + v13, 4uLL, destination);
        v19 = 0;
        v15 = lengthAtOffsetOut;
        v16 = lengthAtOffsetOut;
      }
      v12 += __rev16(*(unsigned __int16 *)&v17[v19 + 2]) + 1;
      if (v12 < v16)
      {
        v17 = dataPointerOut;
        v18 = dataPointerOut[v12];
        goto LABEL_17;
      }
    }
  }
  return result;
}

uint64_t jpeg_createSurfaceFromBBuf(uint64_t a1, CMBlockBufferRef theBuffer, uint64_t a3, __IOSurface **a4)
{
  size_t DataLength;
  int v9;
  unint64_t v10;
  const __CFData *v11;
  const __CFData *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __IOSurface *v17;
  uint64_t v18;
  const void *v19;
  _QWORD *v20;
  const void *v21;
  uint64_t v22;
  const void *v23;
  __CFDictionary *Mutable;
  const __CFDictionary *v25;
  __IOSurface *v26;
  char *BaseAddress;
  size_t v28;
  size_t v29;
  BOOL v30;
  size_t v31;
  uint64_t DataPointer;
  char *v33;
  size_t v34;
  size_t v35;
  int v36;
  int v37;
  uint64_t v38;
  char *v39;
  const UInt8 *BytePtr;
  size_t Length;
  char *v42;
  const UInt8 *v43;
  size_t v44;
  size_t v45;
  OpaqueCMBlockBuffer *v46;
  size_t v47;
  __IOSurface **v49;
  char *dataPointerOut;
  size_t lengthAtOffsetOut;

  DataLength = CMBlockBufferGetDataLength(theBuffer);
  v9 = *(_DWORD *)(a1 + 24);
  v10 = DataLength;
  if (v9 == 1684890161)
  {
    v11 = *(const __CFData **)(a1 + 32);
    v10 = DataLength;
    if (v11)
      v10 = DataLength + CFDataGetLength(v11) + 2;
    v12 = *(const __CFData **)(a1 + 40);
    if (v12)
      v10 += CFDataGetLength(v12) + 2;
    v9 = *(_DWORD *)(a1 + 24);
  }
  if (v9 == 1936355431)
  {
    v13 = 2 * (int)a3 * HIDWORD(a3) / 3;
    if (v10 <= v13)
      v10 = v13;
  }
  v14 = a1 + 80;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 152));
  v15 = 0;
  while (1)
  {
    v16 = a1 + v15;
    if (!*(_BYTE *)(a1 + v15 + 96))
      break;
    v15 += 24;
    if (v15 == 72)
    {
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 152));
      goto LABEL_14;
    }
  }
  v21 = *(const void **)(v16 + 80);
  v20 = (_QWORD *)(v16 + 80);
  v19 = v21;
  if (v21 && *(_QWORD *)(a1 + v15 + 88) < v10)
  {
    CFRelease(v19);
    *v20 = 0;
    v20[1] = 0;
  }
  v22 = a1 + v15;
  *(_BYTE *)(a1 + v15 + 96) = 1;
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 152));
  v23 = *(const void **)(a1 + v15 + 80);
  if (!v23)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
    {
LABEL_14:
      v17 = 0;
LABEL_15:
      v18 = 4294954392;
      goto LABEL_46;
    }
    v25 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8EC8], (const void *)*MEMORY[0x24BDBD270]);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    *(_QWORD *)(v22 + 80) = IOSurfaceCreate(v25);
    *(_QWORD *)(a1 + v15 + 88) = (unint64_t)(float)((float)v10 * 1.1);
    CFRelease(v25);
    v23 = *(const void **)(v22 + 80);
  }
  v26 = (__IOSurface *)CFRetain(v23);
  v17 = v26;
  if (!v26)
    goto LABEL_15;
  IOSurfaceLock(v26, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(v17);
  if (*(_DWORD *)(a1 + 24) != 1684890161)
  {
    v46 = theBuffer;
    v47 = 0;
    v45 = DataLength;
    goto LABEL_41;
  }
  v28 = CMBlockBufferGetDataLength(theBuffer);
  if (v28)
  {
    v29 = v28;
    v49 = a4;
    v30 = 0;
    v31 = 0;
    while (1)
    {
      dataPointerOut = 0;
      lengthAtOffsetOut = 0;
      DataPointer = CMBlockBufferGetDataPointer(theBuffer, v31, &lengthAtOffsetOut, 0, &dataPointerOut);
      if ((_DWORD)DataPointer)
      {
        v18 = DataPointer;
        a4 = v49;
        goto LABEL_44;
      }
      if (lengthAtOffsetOut)
        break;
LABEL_32:
      v31 += lengthAtOffsetOut;
      if (v31 >= v29)
      {
        v34 = 0;
        goto LABEL_34;
      }
    }
    v33 = dataPointerOut;
    v34 = v31 - 1;
    v35 = lengthAtOffsetOut;
    while (1)
    {
      v37 = *v33++;
      v36 = v37;
      if (v30 && v36 == 218)
        break;
      v30 = v36 == 255;
      ++v34;
      if (!--v35)
        goto LABEL_32;
    }
LABEL_34:
    v38 = CMBlockBufferCopyDataBytes(theBuffer, 0, v34, BaseAddress);
    a4 = v49;
    v14 = a1 + 80;
    if (!(_DWORD)v38)
    {
      BaseAddress += v34;
      if (*(_QWORD *)(a1 + 32))
      {
        *(_WORD *)BaseAddress = -9217;
        v39 = BaseAddress + 2;
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
        Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
        memcpy(v39, BytePtr, Length);
        BaseAddress = &v39[CFDataGetLength(*(CFDataRef *)(a1 + 32))];
      }
      if (*(_QWORD *)(a1 + 40))
      {
        *(_WORD *)BaseAddress = -15105;
        v42 = BaseAddress + 2;
        v43 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
        v44 = CFDataGetLength(*(CFDataRef *)(a1 + 40));
        memcpy(v42, v43, v44);
        BaseAddress = &v42[CFDataGetLength(*(CFDataRef *)(a1 + 40))];
      }
      v45 = DataLength - v34;
      v46 = theBuffer;
      v47 = v34;
LABEL_41:
      v18 = CMBlockBufferCopyDataBytes(v46, v47, v45, BaseAddress);
      IOSurfaceUnlock(v17, 0, 0);
      if (!(_DWORD)v18)
        goto LABEL_47;
      goto LABEL_46;
    }
    v18 = v38;
  }
  else
  {
    v18 = 4294954394;
LABEL_44:
    v14 = a1 + 80;
  }
  IOSurfaceUnlock(v17, 0, 0);
LABEL_46:
  releaseJPEGInputSurface(v14, v17);
LABEL_47:
  *a4 = v17;
  return v18;
}

void jpeg_asyncDecodeComplete(uint64_t a1, int a2, uint64_t a3)
{
  __CVBuffer *v6;
  const __CFAllocator *v7;
  __CVPixelBufferPool *PixelBufferPool;
  __IOSurface *IOSurface;
  size_t Width;
  size_t Height;
  const void *v12;
  CVPixelBufferRef pixelBuffer;
  int8x16_t *v14[2];
  uint64_t v15[2];
  int8x16_t *v16[2];
  uint64_t v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x2199F4624]();
  v6 = *(__CVBuffer **)(a3 + 16);
  pixelBuffer = v6;
  if (a2)
  {
    FigSignalErrorAt();
  }
  else if ((*(_BYTE *)(a3 + 32) & 2) == 0 && *(_DWORD *)(a1 + 24) == 1936355431 && !v6)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
    if (!CVPixelBufferPoolCreatePixelBuffer(v7, PixelBufferPool, &pixelBuffer))
    {
      v17[1] = 0;
      v16[1] = 0;
      IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
      Width = IOSurfaceGetWidth(IOSurface);
      Height = IOSurfaceGetHeight(IOSurface);
      v17[0] = IOSurfaceGetBytesPerRow(*(IOSurfaceRef *)(a3 + 24));
      v16[0] = (int8x16_t *)IOSurfaceGetBaseAddress(*(IOSurfaceRef *)(a3 + 24));
      v15[0] = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 0);
      v15[1] = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 1uLL);
      v14[0] = (int8x16_t *)IOSurfaceGetBaseAddressOfPlane(IOSurface, 0);
      v14[1] = (int8x16_t *)IOSurfaceGetBaseAddressOfPlane(IOSurface, 1uLL);
      IOSurfaceLock(*(IOSurfaceRef *)(a3 + 24), 1u, 0);
      IOSurfaceLock(IOSurface, 0, 0);
      Copy_yuvz_444_arm(Width, Height, v17, v16, v15, v14);
      IOSurfaceUnlock(*(IOSurfaceRef *)(a3 + 24), 1u, 0);
      IOSurfaceUnlock(IOSurface, 0, 0);
    }
  }
  FigAtomicAdd32();
  VTDecoderSessionEmitDecodedFrame();
  releaseJPEGInputSurface(a1 + 80, *(const void **)(a3 + 8));
  if (pixelBuffer)
    CFRelease(pixelBuffer);
  v12 = *(const void **)(a3 + 24);
  if (v12 && *(_DWORD *)(a1 + 24) == 1936355431)
  {
    CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(a1 + 216), v12);
    FigSemaphoreSignal();
  }
  free((void *)a3);
}

uint64_t releaseJPEGInputSurface(uint64_t result, const void *a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    v3 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 72));
    v4 = 0;
    while (!*(_BYTE *)(v3 + v4 + 16) || *(const void **)(v3 + v4) != a2)
    {
      v4 += 24;
      if (v4 == 72)
        return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 72));
    }
    CFRelease(a2);
    *(_BYTE *)(v3 + v4 + 16) = 0;
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 72));
  }
  return result;
}

void jpeg_createSupportedPropertyDictionary()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFAllocator *v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  void *v11;
  const __CFDictionary *v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  uint64_t v15;
  CFNumberRef v16;
  int v17;
  int valuePtr;
  void *values;
  CFDictionaryRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  uint64_t v23;
  void *keys;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v23 = 0;
  valuePtr = 0;
  v17 = 1;
  v0 = (void *)*MEMORY[0x24BDF9840];
  v1 = (void *)*MEMORY[0x24BDF9858];
  v2 = *MEMORY[0x24BDF9800];
  keys = (void *)*MEMORY[0x24BDF9840];
  v25 = v2;
  v3 = (const __CFDictionary *)*MEMORY[0x24BDF9810];
  values = v1;
  v20 = v3;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    FigSignalErrorAt();
    return;
  }
  v6 = v5;
  v26 = *MEMORY[0x24BDF9838];
  v21 = v5;
  v7 = CFNumberCreate(v4, kCFNumberIntType, &v17);
  if (!v7)
  {
    FigSignalErrorAt();
    v16 = v6;
LABEL_19:
    CFRelease(v16);
    return;
  }
  v8 = v7;
  v27 = *MEMORY[0x24BDF9830];
  v22 = v7;
  v9 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v9)
  {
    v14 = 0;
    v10 = 0;
LABEL_12:
    FigSignalErrorAt();
    goto LABEL_13;
  }
  v10 = CFDictionaryCreate(v4, 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v10)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v11 = (void *)*MEMORY[0x24BDF9848];
  keys = v0;
  v25 = v2;
  v12 = (const __CFDictionary *)*MEMORY[0x24BDF9808];
  values = v11;
  v20 = v12;
  v13 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v14 = v13;
  if (!v13)
    goto LABEL_12;
  v15 = *MEMORY[0x24BDF9448];
  keys = (void *)*MEMORY[0x24BDF9438];
  v25 = v15;
  values = v9;
  v20 = v10;
  v26 = *MEMORY[0x24BDF93D8];
  v21 = v13;
  sH1JPEGVideoDecoderSupportedPropertyDictionary = (uint64_t)CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!sH1JPEGVideoDecoderSupportedPropertyDictionary)
    goto LABEL_12;
LABEL_13:
  CFRelease(v6);
  CFRelease(v8);
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  if (v14)
  {
    v16 = v14;
    goto LABEL_19;
  }
}

uint64_t _initalizeService()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t result;
  BOOL v3;
  int sig;
  int v5;
  pthread_mutexattr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceMatching("AppleJPEGDriver");
  result = IOServiceGetMatchingService(v0, v1);
  _jpegService = result;
  if ((_DWORD)result)
  {
    v5 = 4;
    LODWORD(v6.__sig) = 0;
    if (MEMORY[0x2199F46FC](result, "AppleJPEGNumCores", &v6, &v5))
      v3 = 0;
    else
      v3 = v5 == 4;
    if (v3)
    {
      sig = v6.__sig;
      _numberOfJPEGCores = v6.__sig;
    }
    else
    {
      sig = _numberOfJPEGCores;
    }
    if (sig < 2)
    {
      v6.__sig = 0;
      *(_QWORD *)v6.__opaque = 0;
      pthread_mutexattr_init(&v6);
      pthread_mutexattr_settype(&v6, 2);
      pthread_mutex_init(&_jpegLock, &v6);
      return pthread_mutexattr_destroy(&v6);
    }
    else
    {
      result = FigSemaphoreCreate();
      _jpegSema = result;
    }
  }
  return result;
}

uint64_t _openDriverConnection()
{
  uint64_t result;
  io_connect_t connect;

  connect = 0;
  LODWORD(result) = _jpegService;
  if (_jpegService
    || (pthread_once(&jpegService_once, (void (*)(void))_initalizeService),
        result = _jpegService,
        _jpegService))
  {
    if (IOServiceOpen(result, *MEMORY[0x24BDAEC58], 0, &connect))
      return 0;
    else
      return connect;
  }
  return result;
}

uint64_t JPEGDeviceInterface_closeDriverConnection(uint64_t connect)
{
  if ((_DWORD)connect)
    return IOServiceClose(connect);
  return connect;
}

uint64_t JPEGDeviceInterface_decodeJPEG(mach_port_t a1, void *inputStruct, void *outputStruct)
{
  uint64_t v5;
  mach_port_t v6;
  io_connect_t v7;
  size_t outputStructCnt;

  outputStructCnt = 88;
  if (a1)
    return IOConnectCallStructMethod(a1, 1u, inputStruct, 0x58uLL, outputStruct, &outputStructCnt);
  v6 = _openService();
  if (!v6)
    return 3758097101;
  v7 = v6;
  v5 = IOConnectCallStructMethod(v6, 1u, inputStruct, 0x58uLL, outputStruct, &outputStructCnt);
  _closeService(v7);
  return v5;
}

uint64_t _openService()
{
  uint64_t v0;

  if (_jpegSema)
    FigSemaphoreWaitRelative();
  else
    pthread_mutex_lock(&_jpegLock);
  v0 = _openDriverConnection();
  if (!(_DWORD)v0)
  {
    if (_jpegSema)
      FigSemaphoreSignal();
    else
      pthread_mutex_unlock(&_jpegLock);
  }
  return v0;
}

uint64_t _closeService(io_connect_t a1)
{
  if (a1)
    IOServiceClose(a1);
  if (_jpegSema)
    return FigSemaphoreSignal();
  else
    return pthread_mutex_unlock(&_jpegLock);
}

uint64_t Copy_444_yuvz_arm(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t **a4, uint64_t *a5, int8x16_t **a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v12;
  int8x16_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  int8x16_t *v16;
  unint64_t v17;
  int8x16_t v18;
  uint64_t v19;
  int8x16_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int8 v24;
  __int8 v25;
  int8x16_t v26;
  uint64_t v27;
  uint64_t v28;
  __int8 v29;

  v6 = *a3;
  v7 = a3[1];
  v9 = *a4;
  v10 = a4[1];
  v12 = *a5;
  v13 = *a6;
  do
  {
    v14 = v9;
    v15 = v10;
    v16 = v13;
    v17 = result & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v18.i64[0] = *v14;
      v19 = v14[1];
      v20.i64[0] = *v15;
      v21 = v15[1];
      v14 += 2;
      v15 += 2;
      v18.i64[1] = v19;
      v20.i64[1] = v21;
      *v16 = vzip1q_s8(v18, v20);
      v16[1] = vzip2q_s8(v18, v20);
      v16 += 2;
      v17 -= 16;
    }
    while (v17);
    v22 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        v24 = *(_BYTE *)v14;
        v14 = (uint64_t *)((char *)v14 + 1);
        v25 = *(_BYTE *)v15;
        v15 = (uint64_t *)((char *)v15 + 1);
        v16->i8[0] = v24;
        v16->i8[1] = v25;
        v16 = (int8x16_t *)((char *)v16 + 2);
        --v22;
      }
      while (v22);
      v23 = result & 0xFFFFFFFFFFFFFFF0;
    }
    else
    {
      v23 = result & 0xFFFFFFFFFFFFFFF0;
    }
    do
    {
      v26.i64[0] = *v15;
      v27 = v15[1];
      v15 += 2;
      v26.i64[1] = v27;
      *v16 = vzip1q_s8((int8x16_t)0, v26);
      v16[1] = vzip2q_s8((int8x16_t)0, v26);
      v16 += 2;
      v23 -= 16;
    }
    while (v23);
    v28 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        v29 = *(_BYTE *)v15;
        v15 = (uint64_t *)((char *)v15 + 1);
        v16->i8[0] = 0;
        v16->i8[1] = v29;
        v16 = (int8x16_t *)((char *)v16 + 2);
        --v28;
      }
      while (v28);
    }
    v9 = (uint64_t *)((char *)v9 + v6);
    v10 = (uint64_t *)((char *)v10 + v7);
    v13 = (int8x16_t *)((char *)v13 + v12);
    --a2;
  }
  while (a2);
  return result;
}

uint64_t Copy_yuvz_444_arm(uint64_t result, uint64_t a2, uint64_t *a3, int8x16_t **a4, uint64_t *a5, int8x16_t **a6)
{
  uint64_t v6;
  int8x16_t *v7;
  uint64_t v8;
  uint64_t v9;
  int8x16_t *v11;
  int8x16_t *v12;
  int8x16_t *v14;
  int8x16_t *v15;
  int8x16_t *v16;
  unint64_t v17;
  int8x16_t v18;
  int8x16_t v19;
  uint64_t v20;
  unint64_t v21;
  __int8 v22;
  __int8 v23;
  int8x16_t v24;
  int8x16_t v25;
  uint64_t v26;
  __int8 v27;

  v6 = *a3;
  v7 = *a4;
  v8 = *a5;
  v9 = a5[1];
  v11 = *a6;
  v12 = a6[1];
  do
  {
    v14 = v7;
    v15 = v11;
    v16 = v12;
    v17 = result & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v18 = *v14;
      v19 = v14[1];
      v14 += 2;
      *v15 = vuzp1q_s8(v18, v19);
      *v16 = vuzp2q_s8(v18, v19);
      ++v15;
      ++v16;
      v17 -= 16;
    }
    while (v17);
    v20 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        v22 = v14->i8[0];
        v23 = v14->i8[1];
        v14 = (int8x16_t *)((char *)v14 + 2);
        v15->i8[0] = v22;
        v15 = (int8x16_t *)((char *)v15 + 1);
        v16->i8[0] = v23;
        v16 = (int8x16_t *)((char *)v16 + 1);
        --v20;
      }
      while (v20);
      v21 = result & 0xFFFFFFFFFFFFFFF0;
    }
    else
    {
      v21 = result & 0xFFFFFFFFFFFFFFF0;
    }
    do
    {
      v24 = *v14;
      v25 = v14[1];
      v14 += 2;
      *v16++ = vuzp2q_s8(v24, v25);
      v21 -= 16;
    }
    while (v21);
    v26 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        v27 = v14->i8[1];
        v14 = (int8x16_t *)((char *)v14 + 2);
        v16->i8[0] = v27;
        v16 = (int8x16_t *)((char *)v16 + 1);
        --v26;
      }
      while (v26);
    }
    v7 = (int8x16_t *)((char *)v7 + v6);
    v11 = (int8x16_t *)((char *)v11 + v8);
    v12 = (int8x16_t *)((char *)v12 + v9);
    --a2;
  }
  while (a2);
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
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

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x24BDC00B0](theSourceBuffer, offsetToData, dataLength, destination);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x24BDC01A8](desc, extensionKey);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0330](sbuf, createIfNecessary);
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x24BDC03A0](allocator, *(_QWORD *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x24BDC03B0](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x24BDC03B8](queue, element);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

uint64_t FigAtomicAdd32()
{
  return MEMORY[0x24BDC0690]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x24BDC0738]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x24BDC0748]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x24BDF8FB8]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x24BDC0820]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x24BDC08A8]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x24BDC08C8]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x24BDC09C0]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x24BDC09C8]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x24BDC09D0]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x24BDC09D8]();
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

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x24BDC0A80]();
}

uint64_t FigUSleep()
{
  return MEMORY[0x24BDC0A98]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x24BDD8908](*(_QWORD *)&entry, propertyName, buffer, size);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDD8BA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x24BDF9028]();
}

uint64_t VTDecoderSessionGetDestinationPixelBufferAttributes()
{
  return MEMORY[0x24BDF9038]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x24BDF9040]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x24BDF9048]();
}

uint64_t VTDecoderSessionTrace()
{
  return MEMORY[0x24BDF9050]();
}

OSStatus VTDecompressionSessionCreate(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFDictionaryRef videoDecoderSpecification, CFDictionaryRef destinationImageBufferAttributes, const VTDecompressionOutputCallbackRecord *outputCallback, VTDecompressionSessionRef *decompressionSessionOut)
{
  return MEMORY[0x24BDF9060](allocator, videoFormatDescription, videoDecoderSpecification, destinationImageBufferAttributes, outputCallback, decompressionSessionOut);
}

OSStatus VTDecompressionSessionDecodeFrameWithOutputHandler(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, VTDecodeInfoFlags *infoFlagsOut, VTDecompressionOutputHandler outputHandler)
{
  return MEMORY[0x24BDF9078](session, sampleBuffer, *(_QWORD *)&decodeFlags, infoFlagsOut, outputHandler);
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x24BDF9188]();
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDF91A8](session, propertyKey, propertyValue);
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x24BDF91D8]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x24BDF91E0]();
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

