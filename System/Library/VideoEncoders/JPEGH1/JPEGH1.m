void JPEGH1EncoderRegister()
{
  CFMutableDictionaryRef Mutable;

  if (H1JPEGEncoder_CheckExistence())
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    FigCFDictionarySetValue();
    VTRegisterVideoEncoderWithInfo();
    VTRegisterVideoEncoderWithInfo();
    if (Mutable)
      CFRelease(Mutable);
  }
}

BOOL H1JPEGEncoder_CheckExistence()
{
  _BOOL8 v0;
  const __CFDictionary *v2;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  v0 = 0;
  if (!MEMORY[0x22E2F8D00](0, &existing[1]))
  {
    v2 = IOServiceNameMatching("AppleJPEGDriver");
    if (v2)
    {
      v0 = IOServiceGetMatchingServices(existing[1], v2, existing) == 0;
      if (existing[0])
        IOObjectRelease(existing[0]);
    }
    else
    {
      v0 = 0;
    }
  }
  if (existing[1])
    FigMachPortReleaseSendRight_();
  return v0;
}

uint64_t H1JPEGEncoder_CreateInstance(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  VTVideoEncoderGetClassID();
  v4 = CMDerivedObjectCreate();
  FigSignalErrorAt();
  *a3 = 0;
  return v4;
}

void H1JPEGEncoder_Finalize()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  NSObject *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  const void *v13;
  _QWORD *v14;
  const void *v15;
  io_connect_t v16;
  io_object_t v17;
  const void *v18;
  const void *v19;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = DerivedStorage;
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    v2 = *(NSObject **)(DerivedStorage + 136);
    if (v2)
      dispatch_barrier_sync(v2, &__block_literal_global);
    FigSimpleMutexDestroy();
    v3 = *(const void **)(v1 + 144);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(v1 + 144) = 0;
    }
    FigSemaphoreDestroy();
    v4 = *(const void **)(v1 + 112);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(v1 + 112) = 0;
    }
    v5 = *(const void **)(v1 + 104);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(v1 + 104) = 0;
    }
    v6 = *(NSObject **)(v1 + 136);
    if (v6)
    {
      dispatch_release(v6);
      *(_QWORD *)(v1 + 136) = 0;
    }
    v7 = *(NSObject **)(v1 + 120);
    if (v7)
    {
      dispatch_release(v7);
      *(_QWORD *)(v1 + 120) = 0;
    }
    v8 = *(NSObject **)(v1 + 128);
    if (v8)
    {
      dispatch_release(v8);
      *(_QWORD *)(v1 + 128) = 0;
    }
  }
  *(_QWORD *)v1 = 0;
  if (*(_QWORD *)(v1 + 8))
  {
    FigFormatDescriptionRelease();
    *(_QWORD *)(v1 + 8) = 0;
  }
  v9 = 0;
  v10 = 1;
  do
  {
    v11 = v10;
    v12 = v1 + 16 * v9;
    v15 = *(const void **)(v12 + 48);
    v14 = (_QWORD *)(v12 + 48);
    v13 = v15;
    if (v15)
    {
      CFRelease(v13);
      *v14 = 0;
    }
    v10 = 0;
    v9 = 1;
  }
  while ((v11 & 1) != 0);
  v17 = *(_DWORD *)(v1 + 28);
  v16 = *(_DWORD *)(v1 + 32);
  if (v16)
    IOServiceClose(v16);
  if (v17)
    IOObjectRelease(v17);
  v18 = *(const void **)(v1 + 88);
  if (v18)
    CFRelease(v18);
  v19 = *(const void **)(v1 + 96);
  if (v19)
    CFRelease(v19);
  JPEGRCDestroy(*(void ***)(v1 + 168));
}

__CFString *H1JPEGEncoder_CopyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<H1JPEGEncoder %p>"), a1);
  return Mutable;
}

uint64_t H1JPEGEncoder_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, CFNumberRef *a4)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9338]))
    return FigSignalErrorAt();
  *a4 = CFNumberCreate(0, kCFNumberFloatType, (const void *)(DerivedStorage + 36));
  return 0;
}

uint64_t H1JPEGEncoder_SetProperty(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage;
  CFTypeID TypeID;
  uint64_t result;
  float valuePtr;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9338]))
    return FigSignalErrorAt();
  if (!a3)
    return FigSignalErrorAt();
  TypeID = CFNumberGetTypeID();
  if (TypeID != CFGetTypeID(a3))
    return FigSignalErrorAt();
  valuePtr = 0.0;
  CFNumberGetValue((CFNumberRef)a3, kCFNumberFloatType, &valuePtr);
  if (valuePtr < 0.0 || valuePtr > 1.0)
    return FigSignalErrorAt();
  result = 0;
  *(float *)(DerivedStorage + 36) = valuePtr;
  *(_BYTE *)(DerivedStorage + 40) = 1;
  return result;
}

uint64_t H1JPEGEncoder_StartSession(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3;
  unint64_t v5;
  uint64_t DerivedStorage;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  const __CFAllocator *v11;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v13;
  __CFArray *v14;
  const __CFAllocator *v15;
  int v16;
  uint64_t v17;
  uint64_t *p_valuePtr;
  CFNumberRef v19;
  CFNumberRef v20;
  int v21;
  int v22;
  CFNumberRef v23;
  CFNumberRef v24;
  const void **v25;
  uint64_t PixelBufferAttributesWithIOSurfaceSupport;
  CFTypeRef v27;
  OpaqueCMMemoryPool *v28;
  CFAllocatorRef Allocator;
  uint64_t v30;
  const CFDictionaryKeyCallBacks *v31;
  const CFDictionaryValueCallBacks *v32;
  __CFDictionary *v33;
  const void *PixelBufferCacheModeArray;
  const void *IOSurfacePropertiesDictionary;
  const __CFDictionary *v36;
  uint64_t v37;
  int v39;
  CFTypeRef v40;
  int v41;
  CFTypeRef cf;
  uint64_t valuePtr;
  int v44;
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v5 = HIDWORD(a3);
  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = DerivedStorage;
  v44 = 0;
  valuePtr = 0;
  v8 = *(unsigned __int8 *)(DerivedStorage + 80);
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    if (!*(_BYTE *)(DerivedStorage + 80))
    {
      LODWORD(valuePtr) = 875836518;
      v9 = 1;
      goto LABEL_8;
    }
  }
  else if (!*(_BYTE *)(DerivedStorage + 80))
  {
    LODWORD(valuePtr) = 875704422;
    v10 = 1;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  *(_DWORD *)((unint64_t)&valuePtr | (4 * v10)) = 2037741158;
  v9 = v10 + 1;
LABEL_8:
  *(_QWORD *)DerivedStorage = a2;
  *(_DWORD *)(DerivedStorage + 16) = v3;
  *(_DWORD *)(DerivedStorage + 20) = v5;
  cf = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return 4294954392;
  v13 = Mutable;
  v41 = 0;
  v14 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (v14)
  {
    v39 = v3;
    v15 = v11;
    v16 = v5;
    v17 = v9;
    p_valuePtr = &valuePtr;
    do
    {
      v19 = CFNumberCreate(0, kCFNumberSInt32Type, p_valuePtr);
      if (!v19)
      {
        v27 = 0;
        PixelBufferAttributesWithIOSurfaceSupport = 4294954392;
        v11 = v15;
        goto LABEL_27;
      }
      v20 = v19;
      CFArrayAppendValue(v14, v19);
      CFRelease(v20);
      p_valuePtr = (uint64_t *)((char *)p_valuePtr + 4);
      --v17;
    }
    while (v17);
    CFDictionaryAddValue(v13, (const void *)*MEMORY[0x24BDC56B8], v14);
    CFRelease(v14);
    addNumberToDictionary(v13, (const void *)*MEMORY[0x24BDC5708], v39);
    addNumberToDictionary(v13, (const void *)*MEMORY[0x24BDC5650], v16);
    if (!v8)
    {
      addNumberToDictionary(v13, (const void *)*MEMORY[0x24BDC56C8], 16);
      v25 = (const void **)MEMORY[0x24BDC55D0];
      v11 = v15;
LABEL_25:
      addNumberToDictionary(v13, *v25, 32);
      PixelBufferAttributesWithIOSurfaceSupport = FigCreatePixelBufferAttributesWithIOSurfaceSupport();
      if ((_DWORD)PixelBufferAttributesWithIOSurfaceSupport)
      {
        v27 = 0;
        v14 = 0;
      }
      else
      {
        v14 = 0;
        v27 = cf;
        cf = 0;
      }
      goto LABEL_27;
    }
    v21 = -v16 & 7;
    v22 = -v39 & 0xF;
    v11 = v15;
    if (v22)
      addNumberToDictionary(v13, (const void *)*MEMORY[0x24BDC5628], v22);
    if (v21)
      addNumberToDictionary(v13, (const void *)*MEMORY[0x24BDC5610], v21);
    v14 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (v14)
    {
      v41 = v22 + v39;
      v23 = CFNumberCreate(0, kCFNumberSInt32Type, &v41);
      if (v23)
      {
        v24 = v23;
        CFArrayAppendValue(v14, v23);
        CFArrayAppendValue(v14, v24);
        CFRelease(v24);
        CFDictionaryAddValue(v13, (const void *)*MEMORY[0x24BDC5600], v14);
        CFRelease(v14);
        v25 = (const void **)MEMORY[0x24BDC56C8];
        goto LABEL_25;
      }
    }
  }
  v27 = 0;
  PixelBufferAttributesWithIOSurfaceSupport = 4294954392;
LABEL_27:
  CFRelease(v13);
  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);
  if ((_DWORD)PixelBufferAttributesWithIOSurfaceSupport)
    goto LABEL_56;
  VTEncoderSessionSetPixelBufferAttributes();
  *(_DWORD *)(v7 + 36) = 1062836634;
  v28 = CMMemoryPoolCreate(0);
  *(_QWORD *)(v7 + 88) = v28;
  if (!v28)
    goto LABEL_59;
  Allocator = CMMemoryPoolGetAllocator(v28);
  *(_QWORD *)(v7 + 96) = Allocator;
  if (!Allocator)
    goto LABEL_59;
  CFRetain(Allocator);
  if (*(_DWORD *)(v7 + 24) != 1936355431)
  {
LABEL_55:
    PixelBufferAttributesWithIOSurfaceSupport = 0;
    goto LABEL_56;
  }
  v30 = FigDispatchQueueCreateWithPriority();
  *(_QWORD *)(v7 + 136) = v30;
  if (v30)
  {
    v40 = v27;
    *(_QWORD *)(v7 + 120) = dispatch_semaphore_create(2);
    *(_QWORD *)(v7 + 128) = dispatch_semaphore_create(1);
    cf = 0;
    v31 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v32 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    v33 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray();
    CFDictionaryAddValue(v33, (const void *)*MEMORY[0x24BDC55F0], PixelBufferCacheModeArray);
    IOSurfacePropertiesDictionary = (const void *)FigCreateIOSurfacePropertiesDictionary();
    CFDictionaryAddValue(v33, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
    v36 = CFDictionaryCreateMutable(0, 0, v31, v32);
    FigCFDictionarySetInt32();
    PixelBufferAttributesWithIOSurfaceSupport = CVPixelBufferPoolCreate(v11, v36, v33, (CVPixelBufferPoolRef *)&cf);
    if (!(_DWORD)PixelBufferAttributesWithIOSurfaceSupport)
    {
      *(_QWORD *)(v7 + 104) = cf;
      cf = 0;
    }
    if (PixelBufferCacheModeArray)
      CFRelease(PixelBufferCacheModeArray);
    v27 = v40;
    if (IOSurfacePropertiesDictionary)
      CFRelease(IOSurfacePropertiesDictionary);
    if (cf)
      CFRelease(cf);
    if (v33)
      CFRelease(v33);
    if (v36)
      CFRelease(v36);
    if ((_DWORD)PixelBufferAttributesWithIOSurfaceSupport)
      goto LABEL_56;
    v37 = CMSimpleQueueCreate(v11, 2, (CMSimpleQueueRef *)(v7 + 112));
    if (!(_DWORD)v37)
    {
      *(_QWORD *)(v7 + 48) = createJPEGOutputSurface();
      *(_DWORD *)(v7 + 56) = 7;
      CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v7 + 112), (const void *)(v7 + 48));
      *(_QWORD *)(v7 + 64) = createJPEGOutputSurface();
      *(_DWORD *)(v7 + 72) = 7;
      CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v7 + 112), (const void *)(v7 + 64));
      v37 = CMSimpleQueueCreate(v11, 10, (CMSimpleQueueRef *)(v7 + 144));
      if (!(_DWORD)v37)
      {
        *(_QWORD *)(v7 + 152) = FigSimpleMutexCreate();
        *(_QWORD *)(v7 + 160) = FigSemaphoreCreate();
        if (H1JPEGEncoder_StartSession_sCheckRateControllerOnce != -1)
          dispatch_once(&H1JPEGEncoder_StartSession_sCheckRateControllerOnce, &__block_literal_global_5);
        if (H1JPEGEncoder_StartSession_sRateControllerEnabled)
        {
          PixelBufferAttributesWithIOSurfaceSupport = 0;
          *(_QWORD *)(v7 + 168) = JPEGRCMake(1000000 * H1JPEGEncoder_StartSession_sRateControllerMBitCap, H1JPEGEncoder_StartSession_sRateControllerWindowSizeFrames);
          goto LABEL_56;
        }
        goto LABEL_55;
      }
    }
    PixelBufferAttributesWithIOSurfaceSupport = v37;
  }
  else
  {
LABEL_59:
    PixelBufferAttributesWithIOSurfaceSupport = 4294954392;
  }
LABEL_56:
  if (v27)
    CFRelease(v27);
  return PixelBufferAttributesWithIOSurfaceSupport;
}

uint64_t H1JPEGEncoder_EncodeFrame(uint64_t a1, uint64_t a2, __CVBuffer *a3, __int128 *a4, __int128 *a5, const void *a6, _DWORD *a7)
{
  uint64_t DerivedStorage;
  __IOSurface *IOSurface;
  uint64_t v16;
  NSObject *v17;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  CMTime block;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __CVBuffer *v27;
  const void *v28;
  _DWORD *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
    return 4294954394;
  IOSurfaceGetPixelFormat(IOSurface);
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    v21 = *a4;
    v22 = *((_QWORD *)a4 + 2);
    v19 = *a5;
    v20 = *((_QWORD *)a5 + 2);
    VTVideoEncoderGetCMBaseObject();
    v16 = CMBaseObjectGetDerivedStorage();
    *a7 |= 1u;
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v16 + 120), 0xFFFFFFFFFFFFFFFFLL);
    CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v16 + 144), a3);
    if (a3)
      CFRetain(a3);
    if (a6)
      CFRetain(a6);
    v17 = *(NSObject **)(v16 + 136);
    block.value = MEMORY[0x24BDAC760];
    *(_QWORD *)&block.timescale = 0x40000000;
    block.epoch = (CMTimeEpoch)__jpeg_encodeFrameAsync_block_invoke;
    v24 = &__block_descriptor_tmp_14;
    v25 = a1;
    v26 = a2;
    v31 = v21;
    v32 = v22;
    v33 = v19;
    v34 = v20;
    v27 = a3;
    v28 = a6;
    v29 = a7;
    v30 = v16;
    dispatch_async(v17, &block);
    return 0;
  }
  else
  {
    block = *(CMTime *)a4;
    v21 = *a5;
    v22 = *((_QWORD *)a5 + 2);
    return jpeg_encodeFrameSync(a1, a2, a3, &block, (uint64_t)&v21, 0, DerivedStorage + 48);
  }
}

uint64_t H1JPEGEncoder_CompleteFrames()
{
  uint64_t DerivedStorage;
  NSObject *v1;

  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    v1 = *(NSObject **)(DerivedStorage + 136);
    if (v1)
      dispatch_barrier_sync(v1, &__block_literal_global_16);
  }
  return 0;
}

uint64_t H1JPEGEncoder_CopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  MEMORY[0x22E2F8CDC](&sCreateSupportedPropertyDictionaryOnce, jpegEncoder_createSupportedPropertyDictionary);
  if (!a2 || !sJPEGVideoEncoderSupportedPropertyDictionary)
    return FigSignalErrorAt();
  *a2 = CFRetain((CFTypeRef)sJPEGVideoEncoderSupportedPropertyDictionary);
  return 0;
}

__CFDictionary *createJPEGOutputSurface()
{
  __CFDictionary *result;
  const __CFDictionary *v1;
  IOSurfaceRef v2;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (result)
  {
    v1 = result;
    CFDictionarySetValue(result, (const void *)*MEMORY[0x24BDD8EC8], (const void *)*MEMORY[0x24BDBD270]);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    v2 = IOSurfaceCreate(v1);
    CFRelease(v1);
    return v2;
  }
  return result;
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

uint64_t jpeg_encodeFrameSync(uint64_t a1, uint64_t a2, __CVBuffer *a3, CMTime *a4, uint64_t a5, const void *a6, uint64_t a7)
{
  uint64_t DerivedStorage;
  __IOSurface *IOSurface;
  __IOSurface *v15;
  float v16;
  float v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  _DWORD *v23;
  __CFDictionary *JPEGOutputSurface;
  int v25;
  mach_port_t v26;
  kern_return_t v27;
  size_t v28;
  const __CFAllocator *v29;
  void *BaseAddress;
  uint64_t v31;
  unsigned int *v32;
  const void *v34;
  uint64_t v35;
  unsigned int Height;
  unsigned int Width;
  CMTime outputStructCnt;
  __int128 extraRowsOnBottom;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  __int128 outputStruct;
  size_t dataLength[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 inputStruct;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  CMBlockBufferRef blockBufferOut;
  CMSampleBufferRef v55;

  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  blockBufferOut = 0;
  v55 = 0;
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  inputStruct = 0u;
  v47 = 0;
  v45 = 0u;
  v46 = 0u;
  *(_OWORD *)dataLength = 0u;
  v44 = 0u;
  outputStruct = 0u;
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  sampleSizeArray = 0;
  extraRowsOnBottom = 0uLL;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
    return 4294954394;
  v15 = IOSurface;
  Width = IOSurfaceGetWidth(IOSurface);
  v35 = a2;
  Height = IOSurfaceGetHeight(v15);
  if (!*(_BYTE *)(DerivedStorage + 40))
    goto LABEL_16;
  v16 = *(float *)(DerivedStorage + 36);
  v17 = 1.0;
  if (v16 <= 1.0)
  {
    v17 = *(float *)(DerivedStorage + 36);
    if (v16 < 0.0)
      v17 = 0.0;
  }
  v18 = (int)(float)((float)((float)((float)(200.0 / (float)((float)((float)(v17 * (float)(v17 * 32.0)) * v17) + 1.0))
                                   * 72.0)
                           / 100.0)
                   + 0.5);
  if (v18 == 144)
  {
    v19 = 0;
    goto LABEL_17;
  }
  if (v18 > 90)
  {
    v19 = 1;
    goto LABEL_17;
  }
  if (v18 > 72)
  {
    v19 = 2;
    goto LABEL_17;
  }
  if (v18 > 18)
  {
    v19 = 3;
    goto LABEL_17;
  }
  if (v18 <= 7)
  {
    if (v18 >= 5)
      v19 = 5;
    else
      v19 = 6;
  }
  else
  {
LABEL_16:
    v19 = 4;
  }
LABEL_17:
  v21 = 1936355431;
  v22 = *(_DWORD *)(DerivedStorage + 24);
  if (v22 == 1936355431)
  {
    v23 = *(_DWORD **)(DerivedStorage + 168);
    if (!v23)
    {
      v19 = 7;
      goto LABEL_27;
    }
    v19 = JPEGRCGetEncodingQuality(v23);
    v22 = *(_DWORD *)(DerivedStorage + 24);
    v21 = 1936355431;
    if (v22 == 1936355431)
      goto LABEL_27;
  }
  if (*(_DWORD *)(a7 + 8) <= 5u && v19 == 6)
  {
    if (*(_QWORD *)a7)
    {
      CFRelease(*(CFTypeRef *)a7);
      *(_QWORD *)a7 = 0;
    }
    v19 = 6;
    goto LABEL_28;
  }
  v21 = v22;
LABEL_27:
  if (*(_QWORD *)a7)
    goto LABEL_30;
LABEL_28:
  JPEGOutputSurface = createJPEGOutputSurface();
  *(_QWORD *)a7 = JPEGOutputSurface;
  if (JPEGOutputSurface)
  {
    *(_DWORD *)(a7 + 8) = v19;
    v21 = *(_DWORD *)(DerivedStorage + 24);
LABEL_30:
    v34 = a6;
    if (v21 != 1936355431)
    {
      CVPixelBufferGetExtendedPixels(a3, 0, 0, (size_t *)&extraRowsOnBottom + 1, (size_t *)&extraRowsOnBottom);
      if (extraRowsOnBottom != 0)
        CVPixelBufferFillExtendedPixels(a3);
    }
    while (1)
    {
      v25 = v19;
      LODWORD(inputStruct) = IOSurfaceGetID(v15);
      DWORD2(inputStruct) = IOSurfaceGetID(*(IOSurfaceRef *)a7);
      *(_QWORD *)((char *)&v49 + 4) = __PAIR64__(Height, Width);
      HIDWORD(v49) = v19;
      DWORD1(inputStruct) = IOSurfaceGetAllocSize(v15);
      HIDWORD(inputStruct) = IOSurfaceGetAllocSize(*(IOSurfaceRef *)a7);
      LODWORD(v50) = 1;
      if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
        HIDWORD(v50) = 1;
      v26 = *(_DWORD *)(DerivedStorage + 32);
      outputStructCnt.value = 88;
      if (!v26)
        goto LABEL_53;
      v27 = IOConnectCallStructMethod(v26, 3u, &inputStruct, 0x58uLL, &outputStruct, (size_t *)&outputStructCnt);
      if (v27 != -536870168)
        break;
      v28 = LODWORD(dataLength[0]);
      if (IOSurfaceGetAllocSize(*(IOSurfaceRef *)a7) >= v28)
      {
        v19 = v25 - 1;
        if (v25)
          continue;
      }
      goto LABEL_53;
    }
    if (v27)
    {
LABEL_53:
      v20 = FigSignalErrorAt();
      a6 = v34;
      goto LABEL_54;
    }
    *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a5;
    sampleTimingArray.duration.epoch = *(_QWORD *)(a5 + 16);
    sampleTimingArray.presentationTimeStamp = *a4;
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    if (!*(_QWORD *)(DerivedStorage + 8))
      VTEncoderSessionCreateVideoFormatDescription();
    v29 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, LODWORD(dataLength[0]), *(CFAllocatorRef *)(DerivedStorage + 96), 0, 0, LODWORD(dataLength[0]), 1u, &blockBufferOut);
    IOSurfaceLock(*(IOSurfaceRef *)a7, 1u, 0);
    BaseAddress = IOSurfaceGetBaseAddress(*(IOSurfaceRef *)a7);
    v20 = CMBlockBufferReplaceDataBytes(BaseAddress, blockBufferOut, 0, LODWORD(dataLength[0]));
    IOSurfaceUnlock(*(IOSurfaceRef *)a7, 1u, 0);
    v31 = v35;
    if (!(_DWORD)v20)
    {
      sampleSizeArray = LODWORD(dataLength[0]);
      v32 = *(unsigned int **)(DerivedStorage + 168);
      if (v32)
      {
        outputStructCnt = sampleTimingArray.presentationTimeStamp;
        JPEGRCUpdate(v32, dataLength[0], &outputStructCnt.value);
      }
      v20 = CMSampleBufferCreate(v29, blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(DerivedStorage + 8), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v55);
    }
    a6 = v34;
    goto LABEL_48;
  }
  v20 = 4294954392;
LABEL_54:
  v31 = v35;
LABEL_48:
  jpeg_emitEncodedFrame(DerivedStorage, v31, a6);
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (v55)
    CFRelease(v55);
  return v20;
}

intptr_t __jpeg_encodeFrameAsync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __CVBuffer *v4;
  uint64_t DerivedStorage;
  __IOSurface *IOSurface;
  __IOSurface *v7;
  size_t Width;
  size_t Height;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  __int128 v15;
  uint64_t v16;
  CMTime v17;
  CVPixelBufferRef pixelBufferOut;
  int v19;
  __int128 v20;
  uint64_t v21;
  CMTime v22;
  int8x16_t *v23[2];
  uint64_t v24[4];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(__CVBuffer **)(a1 + 48);
  *(_OWORD *)&v17.value = *(_OWORD *)(a1 + 80);
  v17.epoch = *(_QWORD *)(a1 + 96);
  v15 = *(_OWORD *)(a1 + 104);
  v16 = *(_QWORD *)(a1 + 120);
  v19 = **(_DWORD **)(a1 + 64);
  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CVPixelBufferPoolRef *)(DerivedStorage + 104), &pixelBufferOut))
  {
    goto LABEL_15;
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(DerivedStorage + 128), 0xFFFFFFFFFFFFFFFFLL);
  IOSurface = CVPixelBufferGetIOSurface(v4);
  v7 = CVPixelBufferGetIOSurface(pixelBufferOut);
  Width = IOSurfaceGetWidth(IOSurface);
  Height = IOSurfaceGetHeight(IOSurface);
  v23[1] = 0;
  v22.value = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 0);
  *(_QWORD *)&v22.timescale = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 1uLL);
  *(_QWORD *)&v20 = IOSurfaceGetBaseAddressOfPlane(IOSurface, 0);
  *((_QWORD *)&v20 + 1) = IOSurfaceGetBaseAddressOfPlane(IOSurface, 1uLL);
  v24[0] = IOSurfaceGetBytesPerRow(v7);
  v23[0] = (int8x16_t *)IOSurfaceGetBaseAddress(v7);
  IOSurfaceLock(IOSurface, 1u, 0);
  IOSurfaceLock(v7, 0, 0);
  Copy_444_yuvz_arm(Width, Height, &v22.value, (uint64_t **)&v20, v24, v23);
  IOSurfaceUnlock(IOSurface, 1u, 0);
  IOSurfaceUnlock(v7, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(DerivedStorage + 128));
  v10 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 112));
  if (v10)
  {
    v11 = v10;
    v22 = v17;
    v20 = v15;
    v21 = v16;
    jpeg_encodeFrameSync(v3, v2, pixelBufferOut, &v22, (uint64_t)&v20, v4, (uint64_t)v10);
    goto LABEL_4;
  }
  if (FigSignalErrorAt())
LABEL_15:
    jpeg_emitEncodedFrame(DerivedStorage, v2, v4);
  v11 = 0;
LABEL_4:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (v11)
    CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 112), v11);
  v12 = *(const void **)(a1 + 48);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(a1 + 56);
  if (v13)
    CFRelease(v13);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 72) + 120));
}

uint64_t jpeg_emitEncodedFrame(uint64_t a1, uint64_t a2, const void *a3)
{
  if (*(_DWORD *)(a1 + 24) != 1936355431)
    return VTEncoderSessionEmitEncodedFrame();
  while (1)
  {
    MEMORY[0x22E2F8CC4](*(_QWORD *)(a1 + 152));
    if (CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(a1 + 144)) == a3)
      break;
    MEMORY[0x22E2F8CD0](*(_QWORD *)(a1 + 152));
    FigSemaphoreWaitRelative();
  }
  CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 144));
  VTEncoderSessionEmitEncodedFrame();
  MEMORY[0x22E2F8CD0](*(_QWORD *)(a1 + 152));
  return FigSemaphoreSignal();
}

void jpegEncoder_createSupportedPropertyDictionary()
{
  void *v0;
  const __CFString *v1;
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *values;
  CFDictionaryRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *keys;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v0 = (void *)*MEMORY[0x24BDF9858];
  v1 = (const __CFString *)*MEMORY[0x24BDF9800];
  keys = (void *)*MEMORY[0x24BDF9840];
  v12 = v1;
  v2 = (const __CFDictionary *)*MEMORY[0x24BDF9810];
  values = v0;
  v7 = v2;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v4)
  {
    v5 = v4;
    keys = (void *)*MEMORY[0x24BDF9338];
    v12 = CFSTR("AllowVideoRange");
    values = v4;
    v7 = v4;
    sJPEGVideoEncoderSupportedPropertyDictionary = (uint64_t)CFDictionaryCreate(v3, (const void **)&keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!sJPEGVideoEncoderSupportedPropertyDictionary)
      FigSignalErrorAt();
    CFRelease(v5);
  }
  else
  {
    FigSignalErrorAt();
  }
}

_DWORD *JPEGRCMake(int a1, unsigned int a2)
{
  _DWORD *v4;

  v4 = malloc_type_calloc(1uLL, 0x28uLL, 0x102004038A5B824uLL);
  *v4 = a2;
  v4[1] = a1;
  v4[2] = 60;
  *((_QWORD *)v4 + 2) = 0x900000000;
  *((_QWORD *)v4 + 4) = malloc_type_calloc(1uLL, 24 * a2, 0x1000040504FFAC1uLL);
  return v4;
}

void JPEGRCDestroy(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1);
  }
}

uint64_t JPEGRCGetEncodingQuality(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  signed int v4;
  signed int v5;

  v1 = (a1[1] + (a1[2] >> 1)) / a1[2];
  a1[3] = v1;
  v2 = a1[4];
  v3 = a1[6];
  if (v2 > v1)
  {
    v4 = (10 * (v2 - v1) + (v1 >> 1)) / v1;
    if (v4 >= 2)
      v4 = 2;
    v3 -= v4;
  }
  if (v2 < v1)
  {
    v5 = (10 * (v1 - v2) + (v1 >> 1)) / v1;
    if (v5 >= 1)
      v5 = 1;
    v3 += v5;
  }
  if (v3 >= 21)
    v3 = 21;
  if (v3 <= 1)
    v3 = 1;
  a1[5] = v3;
  a1[6] = v3;
  return (v3 << 16) | 7u;
}

void *JPEGRCUpdate(unsigned int *a1, int a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  BOOL v9;
  void *result;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;

  v4 = *((_QWORD *)a1 + 4);
  v5 = *a3;
  v6 = *((_DWORD *)a3 + 2);
  v13 = *(uint64_t *)((char *)a3 + 12);
  v14 = *((_DWORD *)a3 + 5);
  a1[4] = 8 * a2;
  a1[2] = 60;
  v7 = *(_DWORD *)(v4 + 8);
  if (v7)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8 && v6 == v7;
  if (v9 && v5 != *(_QWORD *)v4)
  {
    v12 = (unint64_t)*a1 * v6 / (v5 - *(_QWORD *)v4);
    if (v12 <= 1)
      LODWORD(v12) = 1;
    a1[2] = v12;
  }
  result = memmove((void *)v4, (const void *)(v4 + 24), 24 * (*a1 - 1));
  v11 = v4 + 24 * (*a1 - 1);
  *(_QWORD *)v11 = v5;
  *(_DWORD *)(v11 + 8) = v6;
  *(_DWORD *)(v11 + 20) = v14;
  *(_QWORD *)(v11 + 12) = v13;
  return result;
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

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
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

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x24BDC00F8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CMMemoryPoolRef CMMemoryPoolCreate(CFDictionaryRef options)
{
  return (CMMemoryPoolRef)MEMORY[0x24BDC01E8](options);
}

CFAllocatorRef CMMemoryPoolGetAllocator(CMMemoryPoolRef pool)
{
  return (CFAllocatorRef)MEMORY[0x24BDC01F0](pool);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
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

const void *__cdecl CMSimpleQueueGetHead(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x24BDC03D8](queue);
}

CVReturn CVPixelBufferFillExtendedPixels(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5268](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x24BDC52A8](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x24BDC0738]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x24BDC0748]();
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return MEMORY[0x24BDF8FB0]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x24BDF8FB8]();
}

uint64_t FigCreatePixelBufferCacheModeArray()
{
  return MEMORY[0x24BDF8FC0]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x24BDC0820]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x24BDC08C0]();
}

uint64_t FigMachPortReleaseSendRight_()
{
  return MEMORY[0x24BDC0950]();
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

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x24BDD8908](*(_QWORD *)&entry, propertyName, buffer, size);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
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

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

