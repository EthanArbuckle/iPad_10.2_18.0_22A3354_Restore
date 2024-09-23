void VCH263Register()
{
  const __CFAllocator *v0;
  __CFDictionary *Mutable;
  CFNumberRef v2;
  int valuePtr;

  valuePtr = -10;
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v2 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDF9970], v2);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDF9988], (const void *)*MEMORY[0x24BDBD268]);
  VTRegisterVideoDecoderWithInfo();
  CFRelease(v2);
  CFRelease(Mutable);
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

uint64_t COLOR_Y420uToUYVY_scalar(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8, int a9)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a8 >= 2)
  {
    v9 = 0;
    v10 = a4 + 4 * (a9 >> 2);
    v11 = 2 * a5;
    if (a5 >= 0)
      v12 = a5;
    else
      v12 = a5 + 1;
    v13 = (uint64_t)v12 >> 1;
    v14 = 4 * (a9 >> 1);
    v15 = result + a5 + 1;
    do
    {
      if (a7 >= 2)
      {
        v16 = 0;
        v17 = 0;
        do
        {
          *(_DWORD *)(a4 + 4 * v16) = (*(unsigned __int8 *)(a2 + v16) << 24) | (*(unsigned __int8 *)(result + v17) << 16) | (*(unsigned __int8 *)(a3 + v16) << 8) | *(unsigned __int8 *)(result + v17 + 1);
          *(_DWORD *)(v10 + 4 * v16) = (*(unsigned __int8 *)(a2 + v16) << 24) | (*(unsigned __int8 *)(v15 + v17 - 1) << 16) | (*(unsigned __int8 *)(a3 + v16) << 8) | *(unsigned __int8 *)(v15 + v17);
          v17 += 2;
          ++v16;
        }
        while (v17 < a7 - 1);
      }
      result += v11;
      a2 += v13;
      a3 += v13;
      v9 += 2;
      v10 += v14;
      a4 += v14;
      v15 += v11;
    }
    while (v9 < a8 - 1);
  }
  return result;
}

uint64_t VCH263VideoDecoder_CreateInstance(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  VTVideoDecoderGetClassID();
  v4 = CMDerivedObjectCreate();
  FigSignalErrorAt3();
  *a3 = 0;
  return v4;
}

uint64_t VCH263VideoDecoder_Finalize()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;

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
  MEM_Dispose(*(void **)(v1 + 32));
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)v1 = 0;
  result = FigFormatDescriptionRelease();
  *(_QWORD *)(v1 + 8) = 0;
  return result;
}

uint64_t VCH263VideoDecoder_StartSession(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  const opaqueCMFormatDescription *v4;
  CMVideoDimensions Dimensions;
  uint64_t *v6;
  uint64_t result;
  int v8;
  int v9;
  char v10;
  _BOOL4 v12;
  BOOL v13;
  char v14;
  int v15;
  int v16;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v18;
  CFMutableArrayRef v19;
  __CFArray *v20;
  CFNumberRef v21;
  CFNumberRef v22;
  int v23;
  int v24;
  __CFArray *v25;
  int valuePtr;

  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  valuePtr = 2033463856;
  *(_QWORD *)DerivedStorage = a2;
  FigFormatDescriptionRelease();
  v4 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain();
  *(_QWORD *)(DerivedStorage + 8) = v4;
  Dimensions = CMVideoFormatDescriptionGetDimensions(v4);
  *(CMVideoDimensions *)(DerivedStorage + 40) = Dimensions;
  v6 = (uint64_t *)(DerivedStorage + 24);
  result = H263QT_InitSharedGlobals((void **)(DerivedStorage + 24));
  if (!(_DWORD)result)
  {
    result = (uint64_t)MEM_NewClear(96);
    *(_QWORD *)(DerivedStorage + 32) = result;
    if (result)
    {
      v8 = 288;
      v9 = 352;
      v10 = 3;
      if (Dimensions.width <= 176)
      {
        v12 = Dimensions.width > 128 || Dimensions.height > 96;
        v13 = !v12;
        if (v12)
          v14 = 2;
        else
          v14 = 1;
        if (v13)
          v15 = 128;
        else
          v15 = 176;
        if (v13)
          v16 = 96;
        else
          v16 = 144;
        if (Dimensions.height <= 144)
          v10 = v14;
        else
          v10 = 3;
        if (Dimensions.height <= 144)
          v9 = v15;
        else
          v9 = 352;
        if (Dimensions.height <= 144)
          v8 = v16;
        else
          v8 = 288;
      }
      if (InitSharedTables(*v6, 1))
      {
        KillSharedTables(*v6);
      }
      else
      {
        if (!InitInstanceGlobals((uint64_t *)(DerivedStorage + 16), v9, v8, v10, 1, 132, 0, *(_QWORD **)(DerivedStorage + 24)))
        {
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (Mutable)
          {
            v18 = Mutable;
            v19 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
            if (v19)
            {
              v20 = v19;
              v21 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
              if (v21)
              {
                v22 = v21;
                CFArrayAppendValue(v20, v21);
                CFRelease(v22);
                CFDictionaryAddValue(v18, (const void *)*MEMORY[0x24BDC56B8], v20);
                CFRelease(v20);
                addNumberToDictionary(v18, (const void *)*MEMORY[0x24BDC5708], Dimensions.width);
                addNumberToDictionary(v18, (const void *)*MEMORY[0x24BDC5650], Dimensions.height);
                v23 = -Dimensions.width;
                v24 = -Dimensions.height & 0xF;
                if ((v23 & 0xF) != 0)
                  addNumberToDictionary(v18, (const void *)*MEMORY[0x24BDC5628], v23 & 0xF);
                if (v24)
                  addNumberToDictionary(v18, (const void *)*MEMORY[0x24BDC5610], v24);
                VTDecoderSessionSetPixelBufferAttributes();
                CFRelease(v18);
                return 0;
              }
              CFRelease(v18);
              v25 = v20;
            }
            else
            {
              v25 = v18;
            }
            CFRelease(v25);
          }
          return 4294954392;
        }
        KillInstanceGlobals((uint64_t *)(DerivedStorage + 16));
      }
      return 0;
    }
  }
  return result;
}

uint64_t VCH263VideoDecoder_DecodeFrame(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  uint64_t DerivedStorage;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  uint64_t v7;
  int *v8;
  int v9;
  int v10;
  uint64_t v11;
  __CVPixelBufferPool *PixelBufferPool;
  uint64_t v13;
  uint64_t v14;
  int v16;
  _DWORD *v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int **v33;
  int *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  __CVBuffer *v45;
  char *BaseAddressOfPlane;
  char *v47;
  char *v48;
  size_t BytesPerRowOfPlane;
  size_t v50;
  size_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  size_t v59;
  int v60;
  size_t v61;
  uint64_t v62;
  int v63;
  int v64;
  char *dataPointerOut;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _OWORD v79[9];
  CVPixelBufferRef pixelBufferOut;
  char *v81;
  CMBlockBufferRef blockBufferOut;

  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  DataLength = CMBlockBufferGetDataLength(DataBuffer);
  v81 = 0;
  blockBufferOut = 0;
  pixelBufferOut = 0;
  v7 = *(_QWORD *)(DerivedStorage + 16);
  v62 = *(_QWORD *)(DerivedStorage + 24);
  v8 = *(int **)(v7 + 296174);
  v10 = *v8;
  v9 = v8[1];
  memset(v79, 0, 140);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v74 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  *((_QWORD *)v8 + 1) = *(_QWORD *)(DerivedStorage + 40);
  v11 = *(_QWORD *)(DerivedStorage + 32);
  dataPointerOut = 0;
  CMBlockBufferCreateWithMemoryBlock(0, 0, ((DataLength + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4, 0, 0, 0, DataLength, 1u, &blockBufferOut);
  CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut);
  CMBlockBufferCopyDataBytes(DataBuffer, 0, DataLength, dataPointerOut);
  CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &v81);
  PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
  v13 = CVPixelBufferPoolCreatePixelBuffer(0, PixelBufferPool, &pixelBufferOut);
  if ((_DWORD)v13)
  {
    v14 = v13;
LABEL_3:
    FigSignalErrorAt3();
    goto LABEL_4;
  }
  v60 = v9 + 32;
  v16 = v10 + 32;
  ++*(_DWORD *)(DerivedStorage + 48);
  v14 = CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  *(_QWORD *)v11 = v81;
  *(_DWORD *)(v11 + 88) = DataLength;
  *(_OWORD *)(v11 + 8) = xmmword_228254690;
  *(_DWORD *)(v11 + 24) = 2033463856;
  *(_QWORD *)(v11 + 28) = *(_QWORD *)(DerivedStorage + 40);
  *(_DWORD *)(v11 + 36) = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  *(_QWORD *)(v11 + 40) = CVPixelBufferGetBaseAddress(pixelBufferOut);
  *(_QWORD *)(v11 + 72) = *(_QWORD *)(DerivedStorage + 16);
  *(_QWORD *)(v11 + 80) = v62;
  *(_DWORD *)(v11 + 48) = 0;
  *(_DWORD *)(v11 + 52) = *(_DWORD *)(DerivedStorage + 48);
  *(_DWORD *)(v11 + 56) = 65538;
  v17 = *(_DWORD **)(v7 + 66);
  v18 = v7;
  if (v17)
  {
    v19 = *(_DWORD **)(v7 + 58);
    if (v19)
    {
      v20 = (v16 * v60);
      if ((int)v20 >= 1)
      {
        do
        {
          *v19++ = 0;
          *v17++ = 0;
          --v20;
        }
        while (v20);
      }
      goto LABEL_33;
    }
  }
  v21 = 0;
  v22 = *(_DWORD *)(v11 + 88);
  if (v22)
    v23 = (8 * v22 + 24) & 0xFFFFFFE0;
  else
    v23 = 0x7FFFFFFF;
  DWORD1(v78) = v23;
  *(_QWORD *)&v77 = 0;
  LODWORD(v78) = 0;
  DWORD2(v77) = 0;
  v24 = (uint64x2_t)vdupq_n_s64(0x21uLL);
  v25 = (int64x2_t)xmmword_2282546A0;
  v26 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v24, (uint64x2_t)v25)).u8[0] & 1) != 0)
      *((_DWORD *)v79 + v21) = ~(-1 << v21);
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x21uLL), *(uint64x2_t *)&v25)).i32[1] & 1) != 0)
      *((_DWORD *)v79 + v21 + 1) = ~(-1 << (v21 + 1));
    v21 += 2;
    v25 = vaddq_s64(v25, v26);
  }
  while (v21 != 34);
  *((_QWORD *)&v78 + 1) = *(_QWORD *)v11;
  H263PICT_Setup((uint64_t)&v66, *((char *)v8 + 40));
  if (!(unsigned __int16)H263PICT_decPictureLayer((uint64_t)&v66, (uint64_t)&v77))
  {
    if (!BYTE4(v67))
      goto LABEL_33;
    v27 = *(void **)(v7 + 66);
    v28 = v16 * v60;
    if (v27)
    {
      if (v28 >= 1)
        bzero(v27, 4 * (v16 * v60));
    }
    else
    {
      v29 = MEM_NewClear(4 * v28);
      *(_QWORD *)(v18 + 66) = v29;
      if (!v29)
        goto LABEL_22;
    }
    v30 = *(void **)(v18 + 58);
    if (v30)
    {
      if (v28 >= 1)
        bzero(v30, 4 * (v16 * v60));
      goto LABEL_33;
    }
    v31 = MEM_NewClear(4 * v28);
    *(_QWORD *)(v18 + 58) = v31;
    if (v31)
    {
LABEL_33:
      if ((_DWORD)v14)
        goto LABEL_3;
      H263DMPR_Decompress(v11);
      v32 = *(_QWORD *)(v11 + 72);
      v33 = (int **)(v32 + 296174);
      if (!*(_WORD *)(*(_QWORD *)(v32 + 296190) + 68))
      {
        v34 = *v33;
        v36 = **v33;
        v35 = (*v33)[1];
        v37 = *(_DWORD *)(v11 + 28);
        v38 = *(_DWORD *)(v11 + 32);
        if (v36 >= v37 && v35 >= v38)
        {
          v40 = v36 + 32;
          v41 = v36 + 32;
          v42 = 16 * v41;
          v43 = 4 * v41;
          v44 = *(_DWORD *)(v11 + 24);
          if (v44 == 2033463856)
          {
            v45 = pixelBufferOut;
            v63 = v43;
            v64 = v42;
            BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
            v47 = (char *)CVPixelBufferGetBaseAddressOfPlane(v45, 1uLL);
            v48 = (char *)CVPixelBufferGetBaseAddressOfPlane(v45, 2uLL);
            BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v45, 0);
            v50 = CVPixelBufferGetBytesPerRowOfPlane(v45, 1uLL);
            v51 = CVPixelBufferGetBytesPerRowOfPlane(v45, 2uLL);
            if (v34[3] >= 1)
            {
              v59 = v51;
              v61 = v50;
              v52 = 0;
              v53 = v64 + 16;
              do
              {
                memcpy(BaseAddressOfPlane, (const void *)(**(_QWORD **)(v32 + 32) + v53), v34[2]);
                ++v52;
                v54 = v34[3];
                v53 += v40;
                BaseAddressOfPlane += BytesPerRowOfPlane;
              }
              while (v52 < v54);
              if ((int)v54 >= 2)
              {
                v55 = 0;
                if ((int)v40 >= 0)
                  v56 = v40;
                else
                  v56 = v40 + 1;
                v57 = (uint64_t)v56 >> 1;
                v58 = v63 + 8;
                do
                {
                  memcpy(v47, (const void *)(*(_QWORD *)(*(_QWORD *)(v32 + 32) + 8) + v58), (uint64_t)(v34[2] + (v34[2] < 0)) >> 1);
                  memcpy(v48, (const void *)(*(_QWORD *)(*(_QWORD *)(v32 + 32) + 16) + v58), (uint64_t)(v34[2] + (v34[2] < 0)) >> 1);
                  ++v55;
                  v48 += v59;
                  v58 += v57;
                  v47 += v61;
                }
                while (v55 < v34[3] / 2);
              }
            }
          }
          else if (v44 == 846624121 && !*(_DWORD *)(*(_QWORD *)(v11 + 80) + 64))
          {
            COLOR_Y420uToUYVY_scalar(**(_QWORD **)(v32 + 32) + v42 + 16, *(_QWORD *)(*(_QWORD *)(v32 + 32) + 8) + v43 + 8, *(_QWORD *)(*(_QWORD *)(v32 + 32) + 16) + v43 + 8, *(_QWORD *)(v11 + 40), v40, (v35 + 32), v37, v38, *(_DWORD *)(v11 + 36));
          }
        }
      }
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      goto LABEL_53;
    }
  }
LABEL_22:
  if (!(_DWORD)v14)
LABEL_53:
    v14 = 0;
LABEL_4:
  VTDecoderSessionEmitDecodedFrame();
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  CVPixelBufferRelease(pixelBufferOut);
  return v14;
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

uint64_t H263PICT_decPictureLayer(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v4;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  unsigned int v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  int v108;
  int v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  unsigned int v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  _BOOL4 v117;
  int v118;
  uint64_t v119;
  uint64_t v120;

  v2 = *(_DWORD *)(a2 + 20);
  if (v2 > 0x7FFFFFFE)
    goto LABEL_46;
  v4 = *(_DWORD *)(a2 + 16);
  if (v4 >= v2)
    goto LABEL_46;
  v6 = *(_DWORD *)(a2 + 4);
  v7 = v4 + 50;
  do
  {
    *(_DWORD *)(a2 + 16) = v7 - 28;
    v8 = v6 - 22;
    if (v6 < 0x16)
    {
      v10 = 22 - v6;
      v8 = v6 + 10;
      *(_DWORD *)(a2 + 4) = v6 + 10;
      v9 = (*(_DWORD *)a2 << (22 - v6)) & *(_DWORD *)(a2 + 120);
      if (v7 - 28 <= v2)
      {
        v11 = *(_QWORD *)(a2 + 24);
        v12 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v12 + 1;
        LODWORD(v11) = bswap32(*(_DWORD *)(v11 + 4 * v12));
        *(_DWORD *)a2 = v11;
        v9 |= *(_DWORD *)(a2 + 4 * v10 + 32) & (v11 >> v8);
      }
      else
      {
        ++*(_DWORD *)(a2 + 8);
        *(_DWORD *)a2 = 0;
      }
    }
    else
    {
      v9 = (*(_DWORD *)a2 >> v8) & *(_DWORD *)(a2 + 120);
    }
    v6 = v8 + 21;
    *(_DWORD *)(a2 + 4) = v8 + 21;
    v13 = v7 - 49;
    *(_DWORD *)(a2 + 16) = v7 - 49;
    if (v8 >= 0xC)
    {
      v6 = v8 - 11;
      v14 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a2 + 4) = v6;
      *(_DWORD *)(a2 + 8) = v14 - 1;
      if (v2 >= 32 * (v14 - 1))
        *(_DWORD *)a2 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 24) + 4 * (v14 - 2)));
    }
    ++v7;
  }
  while (v13 < v2 && v9 != 32);
  if (v9 != 32)
    goto LABEL_46;
  v15 = v7 - 29;
  v16 = *(_DWORD *)(a2 + 4);
  v17 = v16 + 1;
  *(_DWORD *)(a2 + 16) = v7 - 51;
  if ((v16 + 1) >= 0x21)
  {
    v17 = v16 - 31;
    v18 = *(_DWORD *)(a2 + 8);
    *(_DWORD *)(a2 + 4) = v17;
    *(_DWORD *)(a2 + 8) = v18 - 1;
    if (v2 >= 32 * (v18 - 1))
      *(_DWORD *)a2 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 24) + 4 * (v18 - 2)));
  }
  *(_DWORD *)(a2 + 16) = v15;
  v19 = v17 - 22;
  if (v17 < 0x16)
  {
    v22 = 22 - v17;
    v19 = v17 + 10;
    *(_DWORD *)(a2 + 4) = v17 + 10;
    v21 = (*(_DWORD *)a2 << (22 - v17)) & *(_DWORD *)(a2 + 120);
    if (v15 <= v2)
    {
      v23 = *(_QWORD *)(a2 + 24);
      v24 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v24 + 1;
      v20 = bswap32(*(_DWORD *)(v23 + 4 * v24));
      *(_DWORD *)a2 = v20;
      v21 |= *(_DWORD *)(a2 + 4 * v22 + 32) & (v20 >> v19);
    }
    else
    {
      v20 = 0;
      ++*(_DWORD *)(a2 + 8);
      *(_DWORD *)a2 = 0;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 4) = v19;
    v20 = *(_DWORD *)a2;
    v21 = (*(_DWORD *)a2 >> v19) & *(_DWORD *)(a2 + 120);
  }
  if (v21 != 32)
    goto LABEL_46;
  v25 = *(_DWORD *)a1;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 16) = v7 - 21;
  v26 = v19 - 8;
  if (v19 < 8)
  {
    v28 = 8 - v19;
    v26 = v19 + 24;
    *(_DWORD *)(a2 + 4) = v19 + 24;
    v27 = (v20 << (8 - v19)) & *(_DWORD *)(a2 + 64);
    *(_DWORD *)a1 = v27;
    if (v7 - 21 > v2)
    {
      v20 = 0;
      ++*(_DWORD *)(a2 + 8);
      *(_DWORD *)a2 = 0;
      goto LABEL_30;
    }
    v29 = *(_QWORD *)(a2 + 24);
    v30 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v30 + 1;
    v20 = bswap32(*(_DWORD *)(v29 + 4 * v30));
    *(_DWORD *)a2 = v20;
    v27 |= *(_DWORD *)(a2 + 4 * v28 + 32) & (v20 >> v26);
  }
  else
  {
    v27 = (v20 >> v26) & *(_DWORD *)(a2 + 64);
  }
  *(_DWORD *)a1 = v27;
LABEL_30:
  v31 = v27 - v25;
  v32 = v31 >= 0 || v27 <= 0;
  v33 = v31 + 256;
  if (v32)
    v33 = v31;
  *(_DWORD *)(a1 + 8) = v33;
  *(_DWORD *)(a2 + 16) = v7 - 19;
  v34 = v26 - 2;
  if (v26 < 2)
  {
    v37 = 2 - v26;
    v34 = v26 + 30;
    *(_DWORD *)(a2 + 4) = v26 + 30;
    v35 = *(_DWORD *)(a2 + 40);
    v36 = (v20 << (2 - v26)) & v35;
    if (v7 - 19 <= v2)
    {
      v38 = *(_QWORD *)(a2 + 24);
      v39 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v39 + 1;
      v20 = bswap32(*(_DWORD *)(v38 + 4 * v39));
      *(_DWORD *)a2 = v20;
      v36 |= *(_DWORD *)(a2 + 4 * v37 + 32) & (v20 >> v34);
    }
    else
    {
      v20 = 0;
      ++*(_DWORD *)(a2 + 8);
      *(_DWORD *)a2 = 0;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 4) = v34;
    v35 = *(_DWORD *)(a2 + 40);
    v36 = (v20 >> v34) & v35;
  }
  if (v36 != 2)
  {
LABEL_46:
    v46 = 1;
    goto LABEL_47;
  }
  *(_DWORD *)(a2 + 16) = v7 - 16;
  if (v34 <= 2)
  {
    v40 = v34 + 29;
    *(_DWORD *)(a2 + 4) = v34 + 29;
    if (v7 - 16 <= v2)
    {
      v48 = *(_QWORD *)(a2 + 24);
      v49 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v49 + 1;
      v20 = bswap32(*(_DWORD *)(v48 + 4 * v49));
    }
    else
    {
      v20 = 0;
      ++*(_DWORD *)(a2 + 8);
    }
    *(_DWORD *)a2 = v20;
    *(_DWORD *)(a2 + 16) = v7 - 13;
    goto LABEL_54;
  }
  v40 = v34 - 3;
  *(_DWORD *)(a2 + 16) = v7 - 13;
  if (v34 - 3 >= 3)
  {
LABEL_54:
    v42 = v40 - 3;
    *(_DWORD *)(a2 + 4) = v40 - 3;
    v50 = (v20 >> (v40 - 3)) & *(_DWORD *)(a2 + 44);
    goto LABEL_55;
  }
  v41 = 6 - v34;
  v42 = v34 + 26;
  *(_DWORD *)(a2 + 4) = v42;
  v43 = v20 << v41;
  v44 = v43 & *(_DWORD *)(a2 + 44);
  *(_BYTE *)(a1 + 16) = v43 & *(_BYTE *)(a2 + 44);
  if (v7 - 13 > v2)
  {
    v20 = 0;
    v45 = v44;
    ++*(_DWORD *)(a2 + 8);
    *(_DWORD *)a2 = 0;
    goto LABEL_56;
  }
  v55 = *(_QWORD *)(a2 + 24);
  v56 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v56 + 1;
  v20 = bswap32(*(_DWORD *)(v55 + 4 * v56));
  *(_DWORD *)a2 = v20;
  v50 = *(_DWORD *)(a2 + 4 * v41 + 32) & (v20 >> v42) | v44;
LABEL_55:
  v45 = v50;
  *(_BYTE *)(a1 + 16) = v50;
LABEL_56:
  if (v45 != 7)
  {
    *(_DWORD *)(a2 + 16) = v7 - 12;
    if (v42)
    {
      *(_DWORD *)(a2 + 16) = v7 - 11;
      v54 = v42 - 1;
      *(_BYTE *)(a1 + 17) = (v20 >> v54) & 1;
      if (!v54)
      {
        *(_DWORD *)(a2 + 4) = 31;
        if (v7 - 11 <= v2)
        {
          v67 = *(_QWORD *)(a2 + 24);
          v68 = *(unsigned int *)(a2 + 8);
          *(_DWORD *)(a2 + 8) = v68 + 1;
          v20 = bswap32(*(_DWORD *)(v67 + 4 * v68));
          *(_DWORD *)a2 = v20;
          *(_BYTE *)(a1 + 18) = (v20 & 0x80000000) != 0;
        }
        else
        {
          v20 = 0;
          *(_BYTE *)(a1 + 18) = 0;
          *(_DWORD *)a2 = 0;
          ++*(_DWORD *)(a2 + 8);
        }
        v63 = 31;
        goto LABEL_79;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 4) = 31;
      if (v7 - 12 <= v2)
      {
        v61 = *(_QWORD *)(a2 + 24);
        v62 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v62 + 1;
        v20 = bswap32(*(_DWORD *)(v61 + 4 * v62));
        *(_DWORD *)a2 = v20;
        *(_BYTE *)(a1 + 17) = (v20 & 0x80000000) != 0;
      }
      else
      {
        v20 = 0;
        *(_BYTE *)(a1 + 17) = 0;
        *(_DWORD *)a2 = 0;
        ++*(_DWORD *)(a2 + 8);
      }
      v54 = 31;
    }
    *(_DWORD *)(a2 + 16) = v7 - 10;
    v63 = v54 - 1;
    *(_BYTE *)(a1 + 18) = (v20 >> v63) & 1;
    if (!v63)
    {
      *(_DWORD *)(a2 + 4) = 31;
      if (v7 - 10 <= v2)
      {
        v64 = *(_QWORD *)(a2 + 24);
        v65 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v65 + 1;
        v20 = bswap32(*(_DWORD *)(v64 + 4 * v65));
        *(_DWORD *)a2 = v20;
        *(_BYTE *)(a1 + 19) = (v20 & 0x80000000) != 0;
      }
      else
      {
        v20 = 0;
        *(_BYTE *)(a1 + 19) = 0;
        *(_DWORD *)a2 = 0;
        ++*(_DWORD *)(a2 + 8);
      }
      v66 = 31;
      goto LABEL_80;
    }
LABEL_79:
    *(_DWORD *)(a2 + 16) = v7 - 9;
    v66 = v63 - 1;
    *(_BYTE *)(a1 + 19) = (v20 >> v66) & 1;
    if (!v66)
    {
      *(_DWORD *)(a2 + 4) = 31;
      if (v7 - 9 <= v2)
      {
        v73 = *(_QWORD *)(a2 + 24);
        v74 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v74 + 1;
        v20 = bswap32(*(_DWORD *)(v73 + 4 * v74));
        *(_DWORD *)a2 = v20;
        *(_BYTE *)(a1 + 20) = (v20 & 0x80000000) != 0;
      }
      else
      {
        v20 = 0;
        *(_BYTE *)(a1 + 20) = 0;
        *(_DWORD *)a2 = 0;
        ++*(_DWORD *)(a2 + 8);
      }
      v69 = 31;
      goto LABEL_89;
    }
LABEL_80:
    *(_DWORD *)(a2 + 16) = v7 - 8;
    v69 = v66 - 1;
    *(_BYTE *)(a1 + 20) = (v20 >> (v66 - 1)) & 1;
    if (v66 == 1)
    {
      *(_DWORD *)(a2 + 4) = 31;
      if (v7 - 8 <= v2)
      {
        v70 = *(_QWORD *)(a2 + 24);
        v71 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v71 + 1;
        v20 = bswap32(*(_DWORD *)(v70 + 4 * v71));
        *(_DWORD *)a2 = v20;
        *(_BYTE *)(a1 + 22) = (v20 & 0x80000000) != 0;
      }
      else
      {
        v20 = 0;
        *(_BYTE *)(a1 + 22) = 0;
        *(_DWORD *)a2 = 0;
        ++*(_DWORD *)(a2 + 8);
      }
      v72 = 31;
      goto LABEL_90;
    }
LABEL_89:
    v72 = v69 - 1;
    *(_BYTE *)(a1 + 22) = (v20 >> (v69 - 1)) & 1;
    *(_DWORD *)(a2 + 16) = v7 - 3;
    if ((v69 - 1) <= 4)
    {
      v78 = 6 - v69;
      v77 = v69 + 26;
      *(_DWORD *)(a2 + 4) = v77;
      v79 = v20 << v78;
      v80 = v79 & *(_DWORD *)(a2 + 52);
      *(_BYTE *)(a1 + 27) = v79 & *(_BYTE *)(a2 + 52);
      if (v7 - 3 <= v2)
      {
        v81 = *(_QWORD *)(a2 + 24);
        v82 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v82 + 1;
        v20 = bswap32(*(_DWORD *)(v81 + 4 * v82));
        *(_DWORD *)a2 = v20;
        *(_BYTE *)(a1 + 27) = *(_BYTE *)(a2 + 4 * v78 + 32) & (v20 >> v77) | v80;
      }
      else
      {
        v20 = 0;
        ++*(_DWORD *)(a2 + 8);
        *(_DWORD *)a2 = 0;
      }
      v76 = v7 - 2;
      goto LABEL_97;
    }
LABEL_90:
    v75 = *(_DWORD *)(a2 + 52);
    v76 = v7 - 2;
    *(_DWORD *)(a2 + 16) = v7 - 2;
    v77 = v72 - 5;
    *(_BYTE *)(a1 + 27) = (v20 >> (v72 - 5)) & v75;
    if (v72 == 5)
    {
      *(_DWORD *)(a2 + 4) = 31;
      if (v76 > v2)
      {
        v20 = 0;
        *(_BYTE *)(a1 + 25) = 0;
        *(_DWORD *)a2 = 0;
        ++*(_DWORD *)(a2 + 8);
LABEL_102:
        v52 = 31;
        goto LABEL_103;
      }
      v85 = *(_QWORD *)(a2 + 24);
      v86 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v86 + 1;
      v20 = bswap32(*(_DWORD *)(v85 + 4 * v86));
      *(_DWORD *)a2 = v20;
      *(_BYTE *)(a1 + 25) = (v20 & 0x80000000) != 0;
      if ((v20 & 0x80000000) == 0)
        goto LABEL_102;
      *(_DWORD *)(a2 + 16) = v7;
      v52 = 31;
      goto LABEL_106;
    }
LABEL_97:
    v52 = v77 - 1;
    v83 = v20 >> (v77 - 1);
    *(_BYTE *)(a1 + 25) = v83 & 1;
    if ((v83 & 1) == 0)
    {
LABEL_103:
      v7 = v76;
      goto LABEL_108;
    }
    *(_DWORD *)(a2 + 16) = v7;
    if (v52 < 2)
    {
      v52 = v77 + 29;
      *(_DWORD *)(a2 + 4) = v77 + 29;
      v84 = (v20 << (3 - v77)) & v35;
      *(_BYTE *)(a1 + 26) = v84;
      if (v7 > v2)
        goto LABEL_100;
      v87 = *(_QWORD *)(a2 + 24);
      v88 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v88 + 1;
      v20 = bswap32(*(_DWORD *)(v87 + 4 * v88));
      *(_DWORD *)a2 = v20;
      v89 = *(_DWORD *)(a2 + 4 * (3 - v77) + 32) & (v20 >> v52) | v84;
LABEL_107:
      *(_BYTE *)(a1 + 26) = v89;
      goto LABEL_108;
    }
LABEL_106:
    v52 -= 2;
    *(_DWORD *)(a2 + 4) = v52;
    v89 = (v20 >> v52) & v35;
    goto LABEL_107;
  }
  *(_DWORD *)(a1 + 40) = 1;
  v46 = H263PICT_decPlusHeader(a1, a2);
  if (v46)
    goto LABEL_47;
  v7 = *(_DWORD *)(a2 + 16) + 5;
  *(_DWORD *)(a2 + 16) = v7;
  v51 = *(unsigned int *)(a2 + 4);
  if (v51 < 5)
  {
    v57 = 5 - v51;
    v52 = v51 + 27;
    *(_DWORD *)(a2 + 4) = v51 + 27;
    v58 = (*(_DWORD *)a2 << (5 - v51)) & *(_DWORD *)(a2 + 52);
    *(_BYTE *)(a1 + 27) = (*(_BYTE *)a2 << (5 - v51)) & *(_BYTE *)(a2 + 52);
    if (v7 <= *(_DWORD *)(a2 + 20))
    {
      v59 = *(_QWORD *)(a2 + 24);
      v60 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v60 + 1;
      v20 = bswap32(*(_DWORD *)(v59 + 4 * v60));
      *(_DWORD *)a2 = v20;
      v53 = *(_DWORD *)(a2 + 4 * v57 + 32) & (v20 >> v52) | v58;
      goto LABEL_69;
    }
LABEL_100:
    v20 = 0;
    ++*(_DWORD *)(a2 + 8);
    *(_DWORD *)a2 = 0;
    goto LABEL_108;
  }
  v52 = v51 - 5;
  v20 = *(_DWORD *)a2;
  v53 = (*(_DWORD *)a2 >> v52) & *(_DWORD *)(a2 + 52);
LABEL_69:
  *(_BYTE *)(a1 + 27) = v53;
LABEL_108:
  v90 = *(_DWORD *)(a1 + 40);
  if (v90 && *(_DWORD *)(a1 + 48) == 1 && *(_DWORD *)(a1 + 60))
  {
    v91 = *(_DWORD *)(a1 + 4);
    v92 = *(_DWORD *)a1 | (*(_DWORD *)(a1 + 64) << 8);
    *(_DWORD *)a1 = v92;
    v93 = v92 - v91;
    *(_DWORD *)(a1 + 8) = v92 - v91;
    if (v92 >= 1 && v93 < 0)
    {
      v94 = v93 + 1024;
LABEL_117:
      *(_DWORD *)(a1 + 8) = v94;
    }
  }
  else
  {
    v95 = *(_DWORD *)a1;
    v96 = *(_DWORD *)a1 - *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 8) = v96;
    if (v95 >= 1 && v96 < 0)
    {
      v94 = v96 + 256;
      goto LABEL_117;
    }
  }
  if (!*(_BYTE *)(a1 + 22) && !*(_DWORD *)(a1 + 68))
    goto LABEL_132;
  *(_DWORD *)(a2 + 16) = v7 + 3;
  v97 = v52 - 3;
  if (v52 < 3)
  {
    v99 = 3 - v52;
    v97 = v52 + 29;
    *(_DWORD *)(a2 + 4) = v52 + 29;
    v98 = (v20 << (3 - v52)) & *(_DWORD *)(a2 + 44);
    *(_BYTE *)(a1 + 28) = v98;
    if (v7 + 3 > *(_DWORD *)(a2 + 20))
    {
      v20 = 0;
      ++*(_DWORD *)(a2 + 8);
      *(_DWORD *)a2 = 0;
      goto LABEL_126;
    }
    v100 = *(_QWORD *)(a2 + 24);
    v101 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v101 + 1;
    v20 = bswap32(*(_DWORD *)(v100 + 4 * v101));
    *(_DWORD *)a2 = v20;
    v98 |= *(_DWORD *)(a2 + 4 * v99 + 32) & (v20 >> v97);
  }
  else
  {
    v98 = (v20 >> v97) & *(_DWORD *)(a2 + 44);
  }
  *(_BYTE *)(a1 + 28) = v98;
LABEL_126:
  if (v90 && *(_DWORD *)(a1 + 48) == 1 && *(_DWORD *)(a1 + 60))
    *(_BYTE *)(a1 + 28) = v98 | (8 * *(_BYTE *)(a1 + 64));
  *(_DWORD *)(a2 + 16) = v7 + 5;
  v52 = v97 - 2;
  if (v97 < 2)
  {
    v103 = 2 - v97;
    v52 = v97 + 30;
    *(_DWORD *)(a2 + 4) = v97 + 30;
    v104 = (v20 << (2 - v97)) & *(_DWORD *)(a2 + 40);
    *(_BYTE *)(a1 + 32) = v104;
    if (v7 + 5 <= *(_DWORD *)(a2 + 20))
    {
      v105 = *(_QWORD *)(a2 + 24);
      v106 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v106 + 1;
      v20 = bswap32(*(_DWORD *)(v105 + 4 * v106));
      *(_DWORD *)a2 = v20;
      *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 4 * v103 + 32) & (v20 >> v52) | v104;
    }
    else
    {
      v20 = 0;
      ++*(_DWORD *)(a2 + 8);
      *(_DWORD *)a2 = 0;
    }
    v102 = v7 + 6;
    *(_DWORD *)(a2 + 16) = v102;
    goto LABEL_139;
  }
  *(_BYTE *)(a1 + 32) = (v20 >> v52) & *(_DWORD *)(a2 + 40);
  v7 += 5;
LABEL_132:
  v102 = v7 + 1;
  *(_DWORD *)(a2 + 16) = v102;
  if (v52)
  {
LABEL_139:
    v107 = v52 - 1;
    *(_DWORD *)(a2 + 4) = v107;
    v108 = (v20 >> v107) & 1;
    goto LABEL_140;
  }
  *(_DWORD *)(a2 + 4) = 31;
  if (v102 > *(_DWORD *)(a2 + 20))
  {
    *(_DWORD *)a2 = 0;
    ++*(_DWORD *)(a2 + 8);
    *(_BYTE *)(a1 + 23) = 0;
    goto LABEL_152;
  }
  v119 = *(_QWORD *)(a2 + 24);
  v120 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v120 + 1;
  v20 = bswap32(*(_DWORD *)(v119 + 4 * v120));
  *(_DWORD *)a2 = v20;
  v108 = v20 >> 31;
  v107 = 31;
LABEL_140:
  *(_BYTE *)(a1 + 23) = 0;
  if (!v108)
    goto LABEL_152;
  while (1)
  {
    while (1)
    {
      *(_DWORD *)(a2 + 16) = v102 + 8;
      if (v107 <= 7)
      {
        v113 = 8 - v107;
        v110 = v107 + 24;
        *(_DWORD *)(a2 + 4) = v110;
        v114 = (v20 << v113) & *(_DWORD *)(a2 + 64);
        *(_BYTE *)(a1 + 24) = ((_BYTE)v20 << v113) & *(_BYTE *)(a2 + 64);
        if (v102 + 8 <= *(_DWORD *)(a2 + 20))
        {
          v115 = *(_QWORD *)(a2 + 24);
          v116 = *(unsigned int *)(a2 + 8);
          *(_DWORD *)(a2 + 8) = v116 + 1;
          v20 = bswap32(*(_DWORD *)(v115 + 4 * v116));
          *(_DWORD *)a2 = v20;
          *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 4 * v113 + 32) & (v20 >> v110) | v114;
        }
        else
        {
          v20 = 0;
          ++*(_DWORD *)(a2 + 8);
          *(_DWORD *)a2 = 0;
        }
        v102 += 9;
        *(_DWORD *)(a2 + 16) = v102;
        goto LABEL_150;
      }
      v109 = *(_DWORD *)(a2 + 64);
      v102 += 9;
      *(_DWORD *)(a2 + 16) = v102;
      v110 = v107 - 8;
      *(_BYTE *)(a1 + 24) = (v20 >> v110) & v109;
      if (!v110)
        break;
LABEL_150:
      v107 = v110 - 1;
      *(_DWORD *)(a2 + 4) = v107;
      if (((v20 >> v107) & 1) == 0)
        goto LABEL_151;
    }
    *(_DWORD *)(a2 + 4) = 31;
    if (v102 > *(_DWORD *)(a2 + 20))
      break;
    v111 = *(_QWORD *)(a2 + 24);
    v112 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v112 + 1;
    v20 = bswap32(*(_DWORD *)(v111 + 4 * v112));
    *(_DWORD *)a2 = v20;
    v107 = 31;
    if ((v20 & 0x80000000) == 0)
      goto LABEL_151;
  }
  *(_DWORD *)a2 = 0;
  ++*(_DWORD *)(a2 + 8);
LABEL_151:
  *(_BYTE *)(a1 + 23) = 1;
LABEL_152:
  if (*(_BYTE *)(a1 + 20))
    v117 = 1;
  else
    v117 = *(_DWORD *)(a1 + 76) != 0;
  v46 = 0;
  if (*(_BYTE *)(a1 + 18))
    v118 = 1;
  else
    v118 = v117;
  *(_DWORD *)(a1 + 164) = v117;
  *(_DWORD *)(a1 + 168) = v118;
LABEL_47:
  if (v46)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t H263PICT_decPlusHeader(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;

  v2 = *(_DWORD *)(a2 + 16);
  if (*(_DWORD *)(a1 + 48) != 1)
  {
    v7 = *(_DWORD *)(a2 + 4);
    goto LABEL_30;
  }
  *(_DWORD *)(a2 + 16) = v2 + 3;
  v3 = *(unsigned int *)(a2 + 4);
  if (v3 < 3)
  {
    v8 = 3 - v3;
    v4 = v3 + 29;
    *(_DWORD *)(a2 + 4) = v4;
    v6 = (*(_DWORD *)a2 << v8) & *(_DWORD *)(a2 + 44);
    *(_DWORD *)(a1 + 44) = v6;
    if ((v2 + 3) > *(_DWORD *)(a2 + 20))
    {
      v5 = 0;
      ++*(_DWORD *)(a2 + 8);
      *(_DWORD *)a2 = 0;
      goto LABEL_9;
    }
    v9 = *(_QWORD *)(a2 + 24);
    v10 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v10 + 1;
    v5 = bswap32(*(_DWORD *)(v9 + 4 * v10));
    *(_DWORD *)a2 = v5;
    v6 |= *(_DWORD *)(a2 + 4 * v8 + 32) & (v5 >> v4);
  }
  else
  {
    v4 = v3 - 3;
    *(_DWORD *)(a2 + 4) = v4;
    v5 = *(_DWORD *)a2;
    v6 = (*(_DWORD *)a2 >> v4) & *(_DWORD *)(a2 + 44);
  }
  *(_DWORD *)(a1 + 44) = v6;
LABEL_9:
  if (v6 <= 3)
  {
    *(_DWORD *)(a2 + 16) = v2 + 4;
    if (v4)
    {
      *(_DWORD *)(a2 + 16) = v2 + 5;
      v11 = v4 - 1;
      *(_BYTE *)(a1 + 18) = (v5 >> v11) & 1;
      if (!v11)
      {
        *(_DWORD *)(a2 + 4) = 31;
        if ((v2 + 5) <= *(_DWORD *)(a2 + 20))
        {
          v17 = *(_QWORD *)(a2 + 24);
          v18 = *(unsigned int *)(a2 + 8);
          *(_DWORD *)(a2 + 8) = v18 + 1;
          v5 = bswap32(*(_DWORD *)(v17 + 4 * v18));
          v12 = v5 >> 31;
        }
        else
        {
          v12 = 0;
          v5 = 0;
          ++*(_DWORD *)(a2 + 8);
        }
        *(_DWORD *)(a1 + 72) = v12;
        *(_DWORD *)a2 = v5;
        v16 = *(_DWORD *)(a2 + 4);
LABEL_22:
        *(_DWORD *)(a2 + 16) = v2 + 6;
        if (v16)
        {
          v19 = v16 - 1;
          *(_DWORD *)(a1 + 76) = (v5 >> v19) & 1;
        }
        else
        {
          *(_DWORD *)(a2 + 4) = 31;
          if ((v2 + 6) <= *(_DWORD *)(a2 + 20))
          {
            v21 = *(_QWORD *)(a2 + 24);
            v22 = *(unsigned int *)(a2 + 8);
            *(_DWORD *)(a2 + 8) = v22 + 1;
            v5 = bswap32(*(_DWORD *)(v21 + 4 * v22));
            v20 = v5 >> 31;
          }
          else
          {
            v20 = 0;
            v5 = 0;
            ++*(_DWORD *)(a2 + 8);
          }
          *(_DWORD *)(a1 + 76) = v20;
          *(_DWORD *)a2 = v5;
          v19 = *(_DWORD *)(a2 + 4);
        }
        *(_DWORD *)(a2 + 16) = v2 + 7;
        if (!v19)
        {
          *(_DWORD *)(a2 + 4) = 31;
          if ((v2 + 7) <= *(_DWORD *)(a2 + 20))
          {
            v30 = *(_QWORD *)(a2 + 24);
            v31 = *(unsigned int *)(a2 + 8);
            *(_DWORD *)(a2 + 8) = v31 + 1;
            LODWORD(v30) = bswap32(*(_DWORD *)(v30 + 4 * v31));
            *(_DWORD *)a2 = v30;
            *(_DWORD *)(a1 + 96) = v30 >> 31;
          }
          else
          {
            *(_DWORD *)(a1 + 96) = 0;
            *(_DWORD *)a2 = 0;
            ++*(_DWORD *)(a2 + 8);
          }
          *(_DWORD *)(a2 + 16) = v2 + 10;
          v7 = 31;
          goto LABEL_38;
        }
        v7 = v19 - 1;
        *(_DWORD *)(a1 + 96) = (v5 >> v7) & 1;
        v2 += 7;
LABEL_30:
        v23 = v2 + 3;
        *(_DWORD *)(a2 + 16) = v23;
        if (v7 < 3)
        {
          v24 = 3 - v7;
          v25 = v7 + 29;
          *(_DWORD *)(a2 + 4) = v7 + 29;
          v26 = (*(_DWORD *)a2 << (3 - v7)) & *(_DWORD *)(a2 + 44);
          *(_BYTE *)(a1 + 17) = v26;
          if (v23 > *(_DWORD *)(a2 + 20))
          {
            v13 = 0;
            ++*(_DWORD *)(a2 + 8);
            *(_DWORD *)a2 = 0;
            return v13;
          }
          v13 = 0;
          v27 = *(_QWORD *)(a2 + 24);
          v28 = *(unsigned int *)(a2 + 8);
          *(_DWORD *)(a2 + 8) = v28 + 1;
          LODWORD(v27) = bswap32(*(_DWORD *)(v27 + 4 * v28));
          *(_DWORD *)a2 = v27;
          v29 = *(_DWORD *)(a2 + 4 * v24 + 32) & (v27 >> v25) | v26;
LABEL_39:
          *(_BYTE *)(a1 + 17) = v29;
          return v13;
        }
LABEL_38:
        v13 = 0;
        *(_DWORD *)(a2 + 4) = v7 - 3;
        v29 = (*(_DWORD *)a2 >> (v7 - 3)) & *(_DWORD *)(a2 + 44);
        goto LABEL_39;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 4) = 31;
      if ((v2 + 4) <= *(_DWORD *)(a2 + 20))
      {
        v14 = *(_QWORD *)(a2 + 24);
        v15 = *(unsigned int *)(a2 + 8);
        *(_DWORD *)(a2 + 8) = v15 + 1;
        v5 = bswap32(*(_DWORD *)(v14 + 4 * v15));
        *(_DWORD *)a2 = v5;
        *(_BYTE *)(a1 + 18) = (v5 & 0x80000000) != 0;
      }
      else
      {
        v5 = 0;
        *(_BYTE *)(a1 + 18) = 0;
        *(_DWORD *)a2 = 0;
        ++*(_DWORD *)(a2 + 8);
      }
      v11 = 31;
    }
    v16 = v11 - 1;
    *(_DWORD *)(a1 + 72) = (v5 >> v16) & 1;
    goto LABEL_22;
  }
  return 2;
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
  *(_OWORD *)(v2 + 28) = xmmword_2282546C0;
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
    v7 = (int32x4_t)xmmword_2282546D0;
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

uint64_t SD_Gobble(unsigned int *a1, uint64_t a2, int *a3)
{
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  signed int v11;
  int v12;
  int v13;

  v5 = *a3;
  v6 = a3[1] - *a3 + 1;
  v7 = a3[2];
  v8 = *a1;
  LODWORD(v9) = -1;
  do
  {
    v10 = (v9 + 2);
    v9 = (v9 + 1);
  }
  while (a1[v10] > (v8 + v8 * (v7 - *a3) - 1) / v6);
  v11 = v5 + a1[v9] * v6 / v8 - 1;
  a3[1] = v11;
  v12 = a1[v10] * v6 / *a1 + v5;
  *a3 = v12;
  while (1)
  {
    if (v11 < 0x8000)
      goto LABEL_11;
    if (v12 < 0x8000)
      break;
    v13 = -32768;
LABEL_10:
    v7 += v13;
    a3[2] = v7;
    v12 += v13;
    v11 += v13;
LABEL_11:
    *a3 = 2 * v12;
    a3[1] = (2 * v11) | 1;
    v7 = SD_GrabStartCode(a2, (uint64_t)a3) | (2 * v7);
    a3[2] = v7;
    v12 = *a3;
    v11 = a3[1];
  }
  if (v11 >> 14 <= 2 && v12 >= 0x4000)
  {
    v13 = -16384;
    goto LABEL_10;
  }
  return v9;
}

uint64_t SD_GrabStartCode(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v2 + 17;
  v3 = *(unsigned int *)(a1 + 4);
  if (v3 < 0x11)
  {
    v7 = 17 - v3;
    v4 = v3 + 15;
    *(_DWORD *)(a1 + 4) = v3 + 15;
    v6 = (*(_DWORD *)a1 << (17 - v3)) & *(_DWORD *)(a1 + 100);
    if ((v2 + 17) <= *(_DWORD *)(a1 + 20))
    {
      v8 = *(_QWORD *)(a1 + 24);
      v9 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v9 + 1;
      v5 = bswap32(*(_DWORD *)(v8 + 4 * v9));
      *(_DWORD *)a1 = v5;
      v6 |= *(_DWORD *)(a1 + 4 * v7 + 32) & (v5 >> v4);
    }
    else
    {
      v5 = 0;
      ++*(_DWORD *)(a1 + 8);
      *(_DWORD *)a1 = 0;
    }
  }
  else
  {
    v4 = v3 - 17;
    v5 = *(_DWORD *)a1;
    v6 = (*(_DWORD *)a1 >> (v3 - 17)) & *(_DWORD *)(a1 + 100);
  }
  v10 = v4 + 17;
  *(_DWORD *)(a1 + 4) = v4 + 17;
  *(_DWORD *)(a1 + 16) = v2;
  if (v4 >= 0x10)
  {
    v10 = v4 - 15;
    v11 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 4) = v10;
    *(_DWORD *)(a1 + 8) = v11 - 1;
    if (*(_DWORD *)(a1 + 20) >= (32 * (v11 - 1)))
    {
      v5 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v11 - 2)));
      *(_DWORD *)a1 = v5;
    }
  }
  if (v6 == 1)
    return 0;
  *(_DWORD *)(a1 + 16) = v2 + 1;
  *(_DWORD *)(a1 + 4) = v10 - 1;
  v13 = *(_DWORD *)(a2 + 12);
  v14 = v5 & (1 << (v10 - 1));
  if (v13 < 14)
  {
    v12 = v14 != 0;
    if (v14)
      v16 = 0;
    else
      v16 = v13 + 1;
  }
  else if (v14)
  {
    v15 = v2 + 2;
    *(_DWORD *)(a1 + 16) = v15;
    if (v10 == 1)
    {
      *(_DWORD *)(a1 + 4) = 31;
      if (v15 <= *(_DWORD *)(a1 + 20))
      {
        v17 = *(_QWORD *)(a1 + 24);
        v18 = *(unsigned int *)(a1 + 8);
        *(_DWORD *)(a1 + 8) = v18 + 1;
        LODWORD(v17) = bswap32(*(_DWORD *)(v17 + 4 * v18));
        *(_DWORD *)a1 = v17;
        v12 = v17 >> 31;
      }
      else
      {
        v12 = 0;
        *(_DWORD *)a1 = 0;
        ++*(_DWORD *)(a1 + 8);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 4) = v10 - 2;
      v12 = (v5 >> (v10 - 2)) & 1;
    }
    v16 = v12 ^ 1;
  }
  else
  {
    v12 = 0;
    v16 = 1;
  }
  *(_DWORD *)(a2 + 12) = v16;
  return v12;
}

uint64_t SD_Reset(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t result;

  v4 = 0;
  *(_OWORD *)a2 = xmmword_2282546F0;
  v5 = 16;
  do
  {
    result = SD_GrabStartCode(a1, a2);
    v4 = result | (2 * v4);
    *(_DWORD *)(a2 + 8) = v4;
    --v5;
  }
  while (v5);
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

uint64_t CPP_Callback_Function_SizeofSinglepassRatecontroller()
{
  return 272;
}

uint64_t CPP_Callback_Function_SizeofFrame()
{
  return 20;
}

void CPP_Callback_Function_Kill(_DWORD *a1)
{
  FrameComplexity::InvalidateFrameComplexity((FrameComplexity *)(a1 + 50));
  *a1 = 0;
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

_WORD *IZigZagBlock8x8S16(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[32] = result[10];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[4] = result[14];
  a2[5] = result[15];
  a2[12] = result[16];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[33] = result[19];
  a2[40] = result[20];
  a2[48] = result[21];
  a2[41] = result[22];
  a2[34] = result[23];
  a2[27] = result[24];
  a2[20] = result[25];
  a2[13] = result[26];
  a2[6] = result[27];
  a2[7] = result[28];
  a2[14] = result[29];
  a2[21] = result[30];
  a2[28] = result[31];
  a2[35] = result[32];
  a2[42] = result[33];
  a2[49] = result[34];
  a2[56] = result[35];
  a2[57] = result[36];
  a2[50] = result[37];
  a2[43] = result[38];
  a2[36] = result[39];
  a2[29] = result[40];
  a2[22] = result[41];
  a2[15] = result[42];
  a2[23] = result[43];
  a2[30] = result[44];
  a2[37] = result[45];
  a2[44] = result[46];
  a2[51] = result[47];
  a2[58] = result[48];
  a2[59] = result[49];
  a2[52] = result[50];
  a2[45] = result[51];
  a2[38] = result[52];
  a2[31] = result[53];
  a2[39] = result[54];
  a2[46] = result[55];
  a2[53] = result[56];
  a2[60] = result[57];
  a2[61] = result[58];
  a2[54] = result[59];
  a2[47] = result[60];
  a2[55] = result[61];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

_WORD *IZigZagBlock8x4S16(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[32] = result[10];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[33] = result[19];
  a2[40] = result[20];
  a2[48] = result[21];
  a2[41] = result[22];
  a2[34] = result[23];
  a2[27] = result[24];
  a2[35] = result[32];
  a2[42] = result[33];
  a2[49] = result[34];
  a2[56] = result[35];
  a2[57] = result[36];
  a2[50] = result[37];
  a2[43] = result[38];
  a2[51] = result[47];
  a2[58] = result[48];
  a2[59] = result[49];
  return result;
}

_WORD *IZigZagBlock4x8S16(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[4] = result[14];
  a2[5] = result[15];
  a2[12] = result[16];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[27] = result[24];
  a2[20] = result[25];
  a2[13] = result[26];
  a2[6] = result[27];
  a2[7] = result[28];
  a2[14] = result[29];
  a2[21] = result[30];
  a2[28] = result[31];
  a2[29] = result[40];
  a2[22] = result[41];
  a2[15] = result[42];
  a2[23] = result[43];
  a2[30] = result[44];
  a2[31] = result[53];
  return result;
}

_WORD *IZigZagBlock4x4S16(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[27] = result[24];
  return result;
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

uint64_t H263DMPR_Decompress(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;
  int v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  int v47;
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
  int v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  char v97;
  uint64_t v98;
  _DWORD *v99;
  char *v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned __int16 v106;
  int v107;
  uint64_t v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  unsigned __int8 v129;
  int v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  int v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  int v150;
  char *v151;
  uint64_t v152;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(_QWORD *)(v1 + 296230);
  v152 = *(_QWORD *)(v1 + 296222);
  v3 = *(_QWORD *)(v1 + 296214);
  v4 = *(_QWORD *)(v1 + 296190);
  v5 = *(_QWORD *)(v1 + 296174);
  v6 = *(_DWORD *)v5;
  v7 = *(int *)(v5 + 4);
  v8 = *(_DWORD *)v5 + 32;
  v9 = *(_QWORD *)(v1 + 24);
  v10 = *(_QWORD *)(v1 + 32);
  v11 = v7 + 32;
  *(_DWORD *)(v9 + 24) = v8;
  *(_DWORD *)(v9 + 28) = v7 + 32;
  *(_DWORD *)(v10 + 24) = v8;
  *(_DWORD *)(v10 + 28) = v7 + 32;
  *(_WORD *)(v4 + 70) = *(_WORD *)(v4 + 68) != 0;
  *(_WORD *)(v4 + 68) = *(_DWORD *)(a1 + 12);
  v12 = *(_DWORD *)(a1 + 52);
  v13 = *(_DWORD *)(v4 + 8);
  if (v12 != v13)
  {
    *(_DWORD *)(v4 + 4) = v13;
    *(_DWORD *)(v4 + 8) = v12;
    *(_QWORD *)(v1 + 24) = v10;
    *(_QWORD *)(v1 + 32) = v9;
  }
  v14 = *(_DWORD *)(v2 + 12) + *(_DWORD *)(v2 + 8);
  *(_QWORD *)v2 = 0;
  *(_DWORD *)(v2 + 8) = 0;
  *(_DWORD *)(v2 + 12) = v14;
  *(_QWORD *)(v2 + 24) = *(_QWORD *)a1;
  v15 = *(_DWORD *)(a1 + 88);
  if (v15)
    v16 = (8 * v15 + 24) & 0xFFFFFFE0;
  else
    v16 = 0x7FFFFFFF;
  *(_DWORD *)(v2 + 16) = 0;
  *(_DWORD *)(v2 + 20) = v16;
  if (*(_DWORD *)(v5 + 20) * *(_DWORD *)(v5 + 16))
  {
    v17 = 136;
    do
    {
      *(_BYTE *)(*(_QWORD *)(v1 + 296206) + v17) = 0;
      v18 = v17 - 135;
      ++v17;
    }
    while (v18 < (*(_DWORD *)(v5 + 20) * *(_DWORD *)(v5 + 16)));
  }
  H263PICT_Setup(v3, *(char *)(v5 + 40));
  result = H263PICT_decPictureLayer(v3, v2);
  if (!(_DWORD)result)
  {
    v20 = *(char *)(v3 + 16);
    if (v20 == 7)
    {
      if (*(_DWORD *)(v3 + 44) != *(_DWORD *)(v5 + 40))
        return 0;
    }
    else if (*(_DWORD *)(v5 + 40) != v20)
    {
      return 0;
    }
    if (*(_BYTE *)(v3 + 19))
      SD_Reset(v2, v1 + 296154);
    v151 = (char *)v3;
    if (*(_BYTE *)(v3 + 17) == 1 && (*(_BYTE *)(v3 + 18) || *(_BYTE *)(v3 + 20)))
    {
      v21 = 0;
      v22 = v8 >> 1;
      v23 = *(_QWORD **)(v1 + 24);
      v24 = 16 * v8;
      LODWORD(v25) = v6 + 15;
      v26 = 16;
      if (v6 + 15 <= 16)
        v25 = 16;
      else
        v25 = v25;
      do
      {
        v27 = v25 - 15;
        v28 = (int)v24 + 16;
        v29 = v26;
        if (v6 >= 1)
        {
          do
          {
            *(_BYTE *)(*v23 + v29++) = *(_BYTE *)(*v23 + v28++);
            --v27;
          }
          while (v27);
        }
        ++v21;
        v26 += v8;
      }
      while (v21 != 16);
      v30 = 0;
      if (v22 <= 17)
        v31 = 17;
      else
        v31 = v8 >> 1;
      v32 = (v31 - 8) - 8;
      v33 = 8;
      do
      {
        if (v6 >= 2)
        {
          v34 = v32;
          v35 = 8 * v22 + 8;
          v36 = v33;
          do
          {
            *(_BYTE *)(v23[1] + v36) = *(_BYTE *)(v23[1] + v35);
            *(_BYTE *)(v23[2] + v36++) = *(_BYTE *)(v23[2] + v35++);
            --v34;
          }
          while (v34);
        }
        ++v30;
        v33 += v22;
      }
      while (v30 != 8);
      v37 = (v7 + 15) * v8;
      v38 = (int)v7 + 16;
      v39 = v8 * v38 + 16;
      v40 = v25 - 15;
      v41 = v38;
      do
      {
        if (v6 >= 1)
        {
          v42 = v40;
          v43 = (int)v37 + 16;
          v44 = v39;
          do
          {
            *(_BYTE *)(*v23 + v44++) = *(_BYTE *)(*v23 + v43++);
            --v42;
          }
          while (v42);
        }
        ++v41;
        v39 += v8;
      }
      while (v41 < v11);
      v45 = (uint64_t)v11 >> 1;
      v46 = ((int)v45 - 9) * (uint64_t)v22;
      v47 = v45 - 8;
      v48 = ((int)v45 - 8) * (uint64_t)v22 + 8;
      v49 = v45 - 8;
      do
      {
        v50 = v32;
        v51 = (int)v46 + 8;
        v52 = v48;
        if (v6 >= 2)
        {
          do
          {
            *(_BYTE *)(v23[1] + v52) = *(_BYTE *)(v23[1] + v51);
            *(_BYTE *)(v23[2] + v52++) = *(_BYTE *)(v23[2] + v51++);
            --v50;
          }
          while (v50);
        }
        ++v49;
        v48 += v22;
      }
      while (v49 != v45);
      v53 = 0;
      if ((int)v38 <= 17)
        v54 = 17;
      else
        v54 = v38;
      v55 = v54 - 16;
      do
      {
        v56 = v55;
        v57 = 16 * v8;
        if ((int)v7 >= 1)
        {
          do
          {
            *(_BYTE *)(*v23 + v57 + v53) = *(_BYTE *)(*v23 + v57 + 16);
            v57 += v8;
            --v56;
          }
          while (v56);
        }
        ++v53;
      }
      while (v53 != 16);
      v58 = 0;
      if (v47 <= 9)
        v59 = 9;
      else
        v59 = v47;
      v60 = v59 - 8;
      do
      {
        if ((int)v7 >= 2)
        {
          v61 = v60;
          v62 = 8 * v22;
          do
          {
            *(_BYTE *)(v23[1] + v62 + v58) = *(_BYTE *)(v23[1] + v62 + 8);
            *(_BYTE *)(v23[2] + v62 + v58) = *(_BYTE *)(v23[2] + v62 + 8);
            v62 += v22;
            --v61;
          }
          while (v61);
        }
        ++v58;
      }
      while (v58 != 8);
      v63 = v6 + 16;
      v64 = 16 * v8 + v63;
      do
      {
        if ((int)v7 >= 1)
        {
          v65 = 0;
          v66 = v55;
          do
          {
            *(_BYTE *)(*v23 + v64 + v65) = *(_BYTE *)(*v23 + 17 * v8 - 17 + v65);
            v65 += v8;
            --v66;
          }
          while (v66);
        }
        ++v63;
        ++v64;
      }
      while (v63 < v8);
      v67 = v22 - 8;
      v68 = -8;
      do
      {
        v69 = v60;
        v70 = 9 * v22;
        if ((int)v7 >= 2)
        {
          do
          {
            *(_BYTE *)(v23[1] + v70 + v68) = *(_BYTE *)(v23[1] + v70 - 9);
            *(_BYTE *)(v23[2] + v70 + v68) = *(_BYTE *)(v23[2] + v70 - 9);
            v70 += v22;
            --v69;
          }
          while (v69);
        }
        ++v67;
        ++v68;
      }
      while (v67 != v22);
      v71 = 0;
      v72 = 0;
      v73 = v24 + 16;
      v74 = v37 + 16;
      v75 = (int)v38 * (uint64_t)v8 - 17;
      v76 = v6 + 31;
      v77 = -32 - v6;
      v78 = v11 * v8 - 1;
      v79 = v8 * (v7 + 31);
      do
      {
        v80 = 0;
        ++v72;
        v81 = v78;
        v82 = v76;
        do
        {
          *(_BYTE *)(*v23 + v71 + v80) = *(_BYTE *)(*v23 + v73);
          *(_BYTE *)(*v23 + v82) = *(_BYTE *)(*v23 + 17 * v8 - 17);
          *(_BYTE *)(*v23 + v79 + v80) = *(_BYTE *)(*v23 + v74);
          *(_BYTE *)(*v23 + v81) = *(_BYTE *)(*v23 + v75);
          ++v80;
          --v82;
          --v81;
        }
        while (v80 != 16);
        v76 += v8;
        v78 += v77;
        v79 += v77;
        v71 += v8;
      }
      while (v72 != 16);
      v83 = 0;
      v84 = 0;
      v85 = 8 * v22 + 8;
      v86 = 9 * v22 - 9;
      v87 = v46 + 8;
      v88 = v47 * (uint64_t)v22 - 9;
      v89 = v22 - 1;
      v90 = v45 * v22 - 1;
      v91 = ((int)v45 - 1) * (uint64_t)v22;
      do
      {
        v92 = 0;
        ++v84;
        v93 = v83;
        v94 = v91;
        do
        {
          *(_BYTE *)(v23[1] + v93) = *(_BYTE *)(v23[1] + v85);
          v95 = v89 + v92;
          *(_BYTE *)(v23[1] + v95) = *(_BYTE *)(v23[1] + v86);
          *(_BYTE *)(v23[1] + v94) = *(_BYTE *)(v23[1] + v87);
          v96 = v90 + v92;
          *(_BYTE *)(v23[1] + v96) = *(_BYTE *)(v23[1] + v88);
          *(_BYTE *)(v23[2] + v93) = *(_BYTE *)(v23[2] + v85);
          *(_BYTE *)(v23[2] + v95) = *(_BYTE *)(v23[2] + v86);
          *(_BYTE *)(v23[2] + v94) = *(_BYTE *)(v23[2] + v87);
          *(_BYTE *)(v23[2] + v96) = *(_BYTE *)(v23[2] + v88);
          --v92;
          ++v94;
          ++v93;
        }
        while (v92 != -8);
        v89 += v22;
        v90 -= v22;
        v91 -= v22;
        v83 += v22;
      }
      while (v84 != 8);
    }
    v97 = *(_BYTE *)(*(_QWORD *)(v1 + 296214) + 27);
    v98 = *(_QWORD *)(v1 + 296182);
    v99 = *(_DWORD **)(v1 + 296190);
    *(_BYTE *)(v98 + 152) = v97;
    *(_BYTE *)(v98 + 153) = v97;
    v100 = v151;
    *v99 = (*(_DWORD *)v151 - *(_DWORD *)(v4 + 8));
    v101 = *(_DWORD *)(v5 + 16);
    *(_DWORD *)(v4 + 20) = 0;
    if ((-1 << v101) == -1)
      return 0;
    v102 = 0;
    v103 = 0;
    v104 = v101 - 1;
    v105 = ~(-1 << v101);
LABEL_78:
    if (*(_DWORD *)(v2 + 16) >= *(_DWORD *)(v2 + 20))
      return 0;
    if (v102)
    {
      v106 = H263DMPR_GOBHeader((_BYTE *)v152, v4, *(_QWORD *)(v1 + 296182), v100[25], v2, v5);
      v107 = v106;
      *(_WORD *)(v152 + 4) = v106;
      v100 = v151;
      if (v106 != 1)
        goto LABEL_84;
      if (v151[19])
        SD_Reset(v2, v1 + 296154);
    }
    v107 = *(unsigned __int16 *)(v152 + 4);
LABEL_84:
    if (v107 == 1)
    {
      v108 = *(_QWORD *)(v1 + 296182);
      v109 = *(_DWORD *)(v4 + 20);
      if (*(unsigned __int8 *)(v108 + 153) - 32 < 0xFFFFFFE1)
      {
        v150 = 13;
        goto LABEL_87;
      }
    }
    else
    {
      v109 = *(_DWORD *)(v4 + 20);
    }
    if (v109 >= *(_DWORD *)(v5 + 16) || ((v105 >> v109) & 1) == 0)
    {
      *(_DWORD *)(v4 + 20) = 0;
      v110 = 12;
LABEL_97:
      v111 = *(_DWORD *)(v2 + 20);
      if (v111 == 0x7FFFFFFF || (v112 = *(_DWORD *)(v2 + 16), v112 >= v111) || !v105)
      {
        for (; v105; v105 &= ~(1 << *(_DWORD *)(v4 + 20)))
        {
          while (v103 <= v104 && ((v105 >> v103) & 1) == 0)
            ++v103;
          v136 = v103;
          if (v103 <= v104)
          {
            v136 = v103;
            do
            {
              if (((v105 >> v136) & 1) != 0)
                break;
              ++v136;
            }
            while (v136 <= v104);
          }
          *(_DWORD *)(v4 + 20) = v136;
          dealWithMBOnError(*(int ***)(v1 + 296182), *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), *(_QWORD **)(v1 + 32), *(_QWORD **)(v1 + 24), v136, *(_DWORD *)(v5 + 20), *(_DWORD *)v1 + 32, v100[17], v4 + 72 + 88 * v136, v4 + 72 + 44 * ((2 * v136) | 1));
        }
        goto LABEL_148;
      }
      v113 = *(_DWORD *)(v2 + 4);
      while (1)
      {
        v114 = v112 + 8;
        *(_DWORD *)(v2 + 16) = v112 + 8;
        if (v113 <= 7)
          break;
        v115 = v113 - 8;
        v116 = *(_DWORD *)(v2 + 64);
        v117 = *(_DWORD *)v2;
        v118 = (*(_DWORD *)v2 >> (v113 - 8)) & v116;
        v119 = v112 + 16;
        *(_DWORD *)(v2 + 16) = v112 + 16;
        if (v113 - 8 >= 8)
          goto LABEL_110;
        v120 = 16 - v113;
        v121 = v113 + 16;
        *(_DWORD *)(v2 + 4) = v113 + 16;
        v122 = (v117 << (16 - v113)) & v116;
        if (v119 <= v111)
        {
          v126 = *(_QWORD *)(v2 + 24);
          v127 = *(unsigned int *)(v2 + 8);
          *(_DWORD *)(v2 + 8) = v127 + 1;
          v117 = bswap32(*(_DWORD *)(v126 + 4 * v127));
          *(_DWORD *)v2 = v117;
          if (*(_DWORD *)(v2 + 4 * v120 + 32) & (v117 >> v121) | v122)
          {
LABEL_111:
            v113 = v121 + 8;
            *(_DWORD *)(v2 + 4) = v121 + 8;
            *(_DWORD *)(v2 + 16) = v114;
            if (v121 >= 0x19)
            {
              v113 = v121 - 24;
              goto LABEL_127;
            }
            goto LABEL_129;
          }
        }
        else
        {
          v117 = 0;
          ++*(_DWORD *)(v2 + 8);
          *(_DWORD *)v2 = 0;
          if (v122)
            goto LABEL_111;
        }
LABEL_114:
        if (v118)
        {
          v128 = 1;
          do
            v129 = v128++;
          while ((v118 << v129));
          v130 = 16 - v129;
          v113 = v121 + v130;
          *(_DWORD *)(v2 + 4) = v121 + v130;
          v114 = v119 - v130;
          *(_DWORD *)(v2 + 16) = v119 - v130;
          if (v121 + v130 >= 0x21)
          {
            v113 -= 32;
            goto LABEL_127;
          }
        }
        else
        {
          *(_DWORD *)(v2 + 16) = v112 + 17;
          if (v121)
          {
            v131 = v121 - 1;
            *(_DWORD *)(v2 + 4) = v121 - 1;
            if (((v117 >> (v121 - 1)) & 1) != 0)
              goto LABEL_162;
          }
          else
          {
            *(_DWORD *)(v2 + 4) = 31;
            if (v112 + 17 > v111)
            {
              *(_DWORD *)v2 = 0;
              ++*(_DWORD *)(v2 + 8);
              v114 = v112 + 1;
              *(_DWORD *)(v2 + 16) = v112 + 1;
              v131 = 31;
LABEL_126:
              v113 = v131 - 16;
LABEL_127:
              v134 = *(_DWORD *)(v2 + 8);
              *(_DWORD *)(v2 + 4) = v113;
              *(_DWORD *)(v2 + 8) = v134 - 1;
              if (v111 >= 32 * (v134 - 1))
                *(_DWORD *)v2 = bswap32(*(_DWORD *)(*(_QWORD *)(v2 + 24) + 4 * (v134 - 2)));
              goto LABEL_129;
            }
            v132 = *(_QWORD *)(v2 + 24);
            v133 = *(unsigned int *)(v2 + 8);
            *(_DWORD *)(v2 + 8) = v133 + 1;
            v117 = bswap32(*(_DWORD *)(v132 + 4 * v133));
            *(_DWORD *)v2 = v117;
            v131 = 31;
            if ((v117 & 0x80000000) != 0)
            {
LABEL_162:
              v137 = v131 + 1;
              *(_DWORD *)(v2 + 4) = v131 + 1;
              v138 = v112 + 16;
              *(_DWORD *)(v2 + 16) = v112 + 16;
              if (v131 >= 0x20)
              {
                v137 = v131 - 31;
                v139 = *(_DWORD *)(v2 + 8);
                *(_DWORD *)(v2 + 4) = v137;
                *(_DWORD *)(v2 + 8) = v139 - 1;
                if (v111 >= 32 * (v139 - 1))
                {
                  v117 = bswap32(*(_DWORD *)(*(_QWORD *)(v2 + 24) + 4 * (v139 - 2)));
                  *(_DWORD *)v2 = v117;
                }
              }
              if (v110 == -1)
              {
                do
                {
LABEL_130:
                  while (v103 <= v104 && ((v105 >> v103) & 1) == 0)
                    ++v103;
                  v135 = v103;
                  if (v103 <= v104)
                  {
                    v135 = v103;
                    do
                    {
                      if (((v105 >> v135) & 1) != 0)
                        break;
                      ++v135;
                    }
                    while (v135 <= v104);
                  }
                  *(_DWORD *)(v4 + 20) = v135;
                  dealWithMBOnError(*(int ***)(v1 + 296182), *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), *(_QWORD **)(v1 + 32), *(_QWORD **)(v1 + 24), v135, *(_DWORD *)(v5 + 20), *(_DWORD *)v1 + 32, v100[17], v4 + 72 + 88 * v135, v4 + 72 + 44 * ((2 * v135) | 1));
                  v105 &= ~(1 << *(_DWORD *)(v4 + 20));
                }
                while (v105);
                goto LABEL_148;
              }
              v140 = v112 + 38;
              *(_DWORD *)(v2 + 16) = v112 + 38;
              v141 = v137 - 22;
              if (v137 < 0x16)
              {
                v143 = 22 - v137;
                v141 = v137 + 10;
                *(_DWORD *)(v2 + 4) = v137 + 10;
                v142 = (v117 << (22 - v137)) & *(_DWORD *)(v2 + 120);
                if (v140 <= v111)
                {
                  v144 = *(_QWORD *)(v2 + 24);
                  v145 = *(unsigned int *)(v2 + 8);
                  *(_DWORD *)(v2 + 8) = v145 + 1;
                  LODWORD(v144) = bswap32(*(_DWORD *)(v144 + 4 * v145));
                  *(_DWORD *)v2 = v144;
                  v142 |= *(_DWORD *)(v2 + 4 * v143 + 32) & (v144 >> v141);
                }
                else
                {
                  ++*(_DWORD *)(v2 + 8);
                  *(_DWORD *)v2 = 0;
                }
              }
              else
              {
                *(_DWORD *)(v2 + 4) = v141;
                v142 = (v117 >> v141) & *(_DWORD *)(v2 + 120);
              }
              if ((v142 & 0x1F) != 0)
              {
                *(_DWORD *)(v2 + 4) = v141 + 22;
                *(_DWORD *)(v2 + 16) = v138;
                if (v141 >= 0xB)
                {
                  v146 = v141 - 10;
                  v147 = *(_DWORD *)(v2 + 8);
                  *(_DWORD *)(v2 + 4) = v146;
                  *(_DWORD *)(v2 + 8) = v147 - 1;
                  if (v111 >= 32 * (v147 - 1))
                    *(_DWORD *)v2 = bswap32(*(_DWORD *)(*(_QWORD *)(v2 + 24) + 4 * (v147 - 2)));
                }
              }
              else
              {
                v148 = v105;
                do
                {
                  while (v103 <= v104 && ((v148 >> v103) & 1) == 0)
                    ++v103;
                  v149 = v103;
                  if (v103 <= v104)
                  {
                    v149 = v103;
                    do
                    {
                      if (((v148 >> v149) & 1) != 0)
                        break;
                      ++v149;
                    }
                    while (v149 <= v104);
                  }
                  *(_DWORD *)(v4 + 20) = v149;
                  dealWithMBOnError(*(int ***)(v1 + 296182), *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), *(_QWORD **)(v1 + 32), *(_QWORD **)(v1 + 24), v149, *(_DWORD *)(v5 + 20), *(_DWORD *)v1 + 32, v151[17], v4 + 72 + 88 * v149, v4 + 72 + 44 * ((2 * v149) | 1));
                  v105 = 0;
                  v148 &= ~(1 << *(_DWORD *)(v4 + 20));
                }
                while (v148);
              }
LABEL_148:
              if (v103 <= v104)
              {
                v100 = v151;
                do
                {
                  if (((v105 >> v103) & 1) != 0)
                    break;
                  ++v103;
                }
                while (v103 <= v104);
              }
              else
              {
                v100 = v151;
              }
              v102 = v103;
              if (v103 <= v104)
              {
                v102 = v103;
                do
                {
                  if (((v105 >> v102) & 1) != 0)
                    break;
                  ++v102;
                }
                while (v102 <= v104);
              }
              *(_DWORD *)(v4 + 20) = v102;
              if (!v105)
                return 0;
              goto LABEL_78;
            }
          }
          v113 = v131 + 16;
          *(_DWORD *)(v2 + 4) = v131 + 16;
          v114 = v112 + 1;
          *(_DWORD *)(v2 + 16) = v112 + 1;
          if (v131 >= 0x11)
            goto LABEL_126;
        }
LABEL_129:
        v112 = v114;
        if (v114 >= v111)
          goto LABEL_130;
      }
      v123 = 8 - v113;
      v115 = v113 + 24;
      *(_DWORD *)(v2 + 4) = v113 + 24;
      v116 = *(_DWORD *)(v2 + 64);
      v118 = (*(_DWORD *)v2 << (8 - v113)) & v116;
      if (v114 <= v111)
      {
        v124 = *(_QWORD *)(v2 + 24);
        v125 = *(unsigned int *)(v2 + 8);
        *(_DWORD *)(v2 + 8) = v125 + 1;
        v117 = bswap32(*(_DWORD *)(v124 + 4 * v125));
        *(_DWORD *)v2 = v117;
        v118 |= *(_DWORD *)(v2 + 4 * v123 + 32) & (v117 >> v115);
      }
      else
      {
        v117 = 0;
        ++*(_DWORD *)(v2 + 8);
        *(_DWORD *)v2 = 0;
      }
      v119 = v112 + 16;
      *(_DWORD *)(v2 + 16) = v112 + 16;
LABEL_110:
      v121 = v115 - 8;
      *(_DWORD *)(v2 + 4) = v121;
      if (((v117 >> v121) & v116) != 0)
        goto LABEL_111;
      goto LABEL_114;
    }
    if (v100[20] && v100[17])
    {
      result = H263DMPR_GOB_OBMC1(v1, v152, v5, *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), v4 + 72 + 88 * v109, v4 + 72 + 44 * ((2 * v109) | 1), 0);
      if (!(_DWORD)result)
      {
        result = H263DMPR_GOB_OBMC2(v1, v5, *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), *(_DWORD *)(v4 + 20));
        if (!(_DWORD)result)
        {
          v105 &= ~(1 << *(_DWORD *)(v4 + 20));
          goto LABEL_148;
        }
      }
      goto LABEL_10;
    }
    v110 = H263DMPR_GOB(v1, v152, v5, *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), v4 + 72 + 88 * v109, v4 + 72 + 44 * ((2 * v109) | 1), 0);
    v109 = *(_DWORD *)(v4 + 20);
    v105 &= ~(1 << v109);
    if (!v110)
      goto LABEL_148;
    if (v110 == 12)
      goto LABEL_97;
    v150 = v110;
    v108 = *(_QWORD *)(v1 + 296182);
LABEL_87:
    dealWithMBOnError((int **)v108, *(_QWORD *)(*(_QWORD *)(v1 + 296198) + 32832), *(_QWORD **)(v1 + 32), *(_QWORD **)(v1 + 24), v109, *(_DWORD *)(v5 + 20), *(_DWORD *)v1 + 32, v100[17], v4 + 72 + 88 * v109, v4 + 72 + 44 * ((2 * v109) | 1));
    v110 = v150;
    goto LABEL_97;
  }
LABEL_10:
  if ((_DWORD)result == -1)
    return 0;
  return result;
}

uint64_t H263DMPR_GOBHeader(_BYTE *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  int v37;
  uint64_t result;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  char v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  char v61;
  uint64_t v62;
  uint64_t v63;

  v6 = *(_DWORD *)(a5 + 16);
  *(_DWORD *)(a5 + 16) = v6 + 17;
  v7 = *(unsigned int *)(a5 + 4);
  if (v7 < 0x11)
  {
    v12 = 17 - v7;
    v8 = v7 + 15;
    *(_DWORD *)(a5 + 4) = v7 + 15;
    v9 = *(_DWORD *)(a5 + 100);
    v11 = (*(_DWORD *)a5 << v12) & v9;
    if ((v6 + 17) <= *(_DWORD *)(a5 + 20))
    {
      v13 = *(_QWORD *)(a5 + 24);
      v14 = *(unsigned int *)(a5 + 8);
      *(_DWORD *)(a5 + 8) = v14 + 1;
      v10 = bswap32(*(_DWORD *)(v13 + 4 * v14));
      *(_DWORD *)a5 = v10;
      v11 |= *(_DWORD *)(a5 + 4 * v12 + 32) & (v10 >> v8);
    }
    else
    {
      v10 = 0;
      ++*(_DWORD *)(a5 + 8);
      *(_DWORD *)a5 = 0;
    }
  }
  else
  {
    v8 = v7 - 17;
    *(_DWORD *)(a5 + 4) = v7 - 17;
    v9 = *(_DWORD *)(a5 + 100);
    v10 = *(_DWORD *)a5;
    v11 = (*(_DWORD *)a5 >> v8) & v9;
  }
  if (v11 == 1)
  {
    v15 = v6 + 22;
    *(_DWORD *)(a5 + 16) = v6 + 22;
    v16 = v8 - 5;
    if (v8 < 5)
    {
      v19 = 5 - v8;
      v16 = v8 + 27;
      *(_DWORD *)(a5 + 4) = v8 + 27;
      v17 = (v10 << (5 - v8)) & *(_DWORD *)(a5 + 52);
      *a1 = v17;
      if (v15 > *(_DWORD *)(a5 + 20))
      {
        v10 = 0;
        ++*(_DWORD *)(a5 + 8);
        *(_DWORD *)a5 = 0;
        goto LABEL_21;
      }
      v26 = *(_QWORD *)(a5 + 24);
      v27 = *(unsigned int *)(a5 + 8);
      *(_DWORD *)(a5 + 8) = v27 + 1;
      v10 = bswap32(*(_DWORD *)(v26 + 4 * v27));
      *(_DWORD *)a5 = v10;
      v17 |= *(_DWORD *)(a5 + 4 * v19 + 32) & (v10 >> v16);
    }
    else
    {
      *(_DWORD *)(a5 + 4) = v16;
      v17 = (v10 >> v16) & *(_DWORD *)(a5 + 52);
    }
    *a1 = v17;
LABEL_21:
    *(_DWORD *)(a2 + 20) = (char)v17;
    if (*(_DWORD *)(a6 + 16) > (char)v17)
    {
      if (a4)
      {
        v15 = v6 + 24;
        *(_DWORD *)(a5 + 16) = v6 + 24;
        if (v16 < 2)
        {
          v16 += 30;
          *(_DWORD *)(a5 + 4) = v16;
          if (v15 <= *(_DWORD *)(a5 + 20))
          {
            v45 = *(_QWORD *)(a5 + 24);
            v46 = *(unsigned int *)(a5 + 8);
            *(_DWORD *)(a5 + 8) = v46 + 1;
            v10 = bswap32(*(_DWORD *)(v45 + 4 * v46));
          }
          else
          {
            v10 = 0;
            ++*(_DWORD *)(a5 + 8);
          }
          *(_DWORD *)a5 = v10;
          goto LABEL_54;
        }
        v16 -= 2;
      }
      *(_DWORD *)(a5 + 16) = v15 + 2;
      if (v16 <= 1)
      {
        v28 = v16 + 30;
        *(_DWORD *)(a5 + 4) = v16 + 30;
        if (v15 + 2 <= *(_DWORD *)(a5 + 20))
        {
          v43 = *(_QWORD *)(a5 + 24);
          v44 = *(unsigned int *)(a5 + 8);
          *(_DWORD *)(a5 + 8) = v44 + 1;
          v10 = bswap32(*(_DWORD *)(v43 + 4 * v44));
        }
        else
        {
          v10 = 0;
          ++*(_DWORD *)(a5 + 8);
        }
        *(_DWORD *)a5 = v10;
        *(_DWORD *)(a5 + 16) = v15 + 7;
        goto LABEL_55;
      }
LABEL_54:
      v28 = v16 - 2;
      v47 = v15 + 7;
      *(_DWORD *)(a5 + 16) = v15 + 7;
      if (v16 - 2 >= 5)
      {
LABEL_55:
        v48 = v28 - 5;
LABEL_66:
        *(_DWORD *)(a5 + 4) = v48;
        v51 = (v10 >> v48) & *(_DWORD *)(a5 + 52);
LABEL_67:
        *(_BYTE *)(a3 + 153) = v51;
LABEL_68:
        *(_BYTE *)(a3 + 152) = v51;
        return 1;
      }
      v49 = 7 - v16;
      v50 = v16 + 25;
      *(_DWORD *)(a5 + 4) = v16 + 25;
      v51 = (v10 << (7 - v16)) & *(_DWORD *)(a5 + 52);
      *(_BYTE *)(a3 + 153) = v51;
      if (v47 <= *(_DWORD *)(a5 + 20))
      {
        v52 = *(_QWORD *)(a5 + 24);
        v53 = *(unsigned int *)(a5 + 8);
        *(_DWORD *)(a5 + 8) = v53 + 1;
        LODWORD(v52) = bswap32(*(_DWORD *)(v52 + 4 * v53));
        *(_DWORD *)a5 = v52;
        v54 = *(_DWORD *)(a5 + 4 * v49 + 32) & (v52 >> v50);
LABEL_72:
        LOBYTE(v51) = v54 | v51;
        goto LABEL_67;
      }
      goto LABEL_70;
    }
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a5 + 16) = v6;
  if (v8 >= 0x10)
  {
    v18 = v8 - 15;
    v20 = *(_DWORD *)(a5 + 8);
    *(_DWORD *)(a5 + 4) = v18;
    *(_DWORD *)(a5 + 8) = v20 - 1;
    if (*(_DWORD *)(a5 + 20) >= (32 * (v20 - 1)))
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(a5 + 24) + 4 * (v20 - 2)));
      *(_DWORD *)a5 = v10;
    }
  }
  else
  {
    v18 = v8 + 17;
  }
  v21 = v18 & 7;
  v22 = v21 + v6;
  v23 = v18 & 0xFFFFFFF8;
  *(_DWORD *)(a5 + 4) = v18 & 0xFFFFFFF8;
  *(_DWORD *)(a5 + 16) = v21 + v6 + 17;
  v24 = (v18 & 0xFFFFFFF8) - 17;
  if (v23 < 0x11)
  {
    v24 = v23 + 15;
    *(_DWORD *)(a5 + 4) = v23 + 15;
    if ((v22 + 17) > *(_DWORD *)(a5 + 20))
    {
      ++*(_DWORD *)(a5 + 8);
      *(_DWORD *)a5 = 0;
      goto LABEL_32;
    }
    v29 = 17 - v23;
    v30 = (v10 << v29) & v9;
    v31 = *(_QWORD *)(a5 + 24);
    v32 = *(unsigned int *)(a5 + 8);
    *(_DWORD *)(a5 + 8) = v32 + 1;
    v10 = bswap32(*(_DWORD *)(v31 + 4 * v32));
    *(_DWORD *)a5 = v10;
    v25 = *(_DWORD *)(a5 + 4 * v29 + 32) & (v10 >> v24) | v30;
  }
  else
  {
    *(_DWORD *)(a5 + 4) = v24;
    v25 = (v10 >> v24) & v9;
  }
  if (v25 == 1)
  {
    v33 = v22 + 22;
    *(_DWORD *)(a5 + 16) = v22 + 22;
    v34 = v24 - 5;
    if (v24 < 5)
    {
      v39 = 5 - v24;
      v34 = v24 + 27;
      *(_DWORD *)(a5 + 4) = v24 + 27;
      v35 = (v10 << (5 - v24)) & *(_DWORD *)(a5 + 52);
      *a1 = v35;
      if (v33 > *(_DWORD *)(a5 + 20))
      {
        v10 = 0;
        ++*(_DWORD *)(a5 + 8);
        *(_DWORD *)a5 = 0;
        goto LABEL_42;
      }
      v40 = *(_QWORD *)(a5 + 24);
      v41 = *(unsigned int *)(a5 + 8);
      *(_DWORD *)(a5 + 8) = v41 + 1;
      v10 = bswap32(*(_DWORD *)(v40 + 4 * v41));
      *(_DWORD *)a5 = v10;
      v35 |= *(_DWORD *)(a5 + 4 * v39 + 32) & (v10 >> v34);
    }
    else
    {
      *(_DWORD *)(a5 + 4) = v34;
      v35 = (v10 >> v34) & *(_DWORD *)(a5 + 52);
    }
    *a1 = v35;
LABEL_42:
    *(_DWORD *)(a2 + 20) = (char)v35;
    if (*(_DWORD *)(a6 + 16) <= (char)v35)
      return 0xFFFFFFFFLL;
    if (a4)
    {
      v33 = v22 + 24;
      *(_DWORD *)(a5 + 16) = v22 + 24;
      if (v34 < 2)
      {
        v34 += 30;
        *(_DWORD *)(a5 + 4) = v34;
        if (v33 <= *(_DWORD *)(a5 + 20))
        {
          v57 = *(_QWORD *)(a5 + 24);
          v58 = *(unsigned int *)(a5 + 8);
          *(_DWORD *)(a5 + 8) = v58 + 1;
          v10 = bswap32(*(_DWORD *)(v57 + 4 * v58));
        }
        else
        {
          v10 = 0;
          ++*(_DWORD *)(a5 + 8);
        }
        *(_DWORD *)a5 = v10;
        goto LABEL_64;
      }
      v34 -= 2;
    }
    *(_DWORD *)(a5 + 16) = v33 + 2;
    if (v34 <= 1)
    {
      v42 = v34 + 30;
      *(_DWORD *)(a5 + 4) = v34 + 30;
      if (v33 + 2 <= *(_DWORD *)(a5 + 20))
      {
        v55 = *(_QWORD *)(a5 + 24);
        v56 = *(unsigned int *)(a5 + 8);
        *(_DWORD *)(a5 + 8) = v56 + 1;
        v10 = bswap32(*(_DWORD *)(v55 + 4 * v56));
      }
      else
      {
        v10 = 0;
        ++*(_DWORD *)(a5 + 8);
      }
      *(_DWORD *)a5 = v10;
      *(_DWORD *)(a5 + 16) = v33 + 7;
      goto LABEL_65;
    }
LABEL_64:
    v42 = v34 - 2;
    v59 = v33 + 7;
    *(_DWORD *)(a5 + 16) = v33 + 7;
    if (v34 - 2 < 5)
    {
      v60 = 7 - v34;
      v61 = v34 + 25;
      *(_DWORD *)(a5 + 4) = v34 + 25;
      v51 = (v10 << (7 - v34)) & *(_DWORD *)(a5 + 52);
      *(_BYTE *)(a3 + 153) = v51;
      if (v59 <= *(_DWORD *)(a5 + 20))
      {
        v62 = *(_QWORD *)(a5 + 24);
        v63 = *(unsigned int *)(a5 + 8);
        *(_DWORD *)(a5 + 8) = v63 + 1;
        LODWORD(v62) = bswap32(*(_DWORD *)(v62 + 4 * v63));
        *(_DWORD *)a5 = v62;
        v54 = *(_DWORD *)(a5 + 4 * v60 + 32) & (v62 >> v61);
        goto LABEL_72;
      }
LABEL_70:
      ++*(_DWORD *)(a5 + 8);
      *(_DWORD *)a5 = 0;
      goto LABEL_68;
    }
LABEL_65:
    v48 = v42 - 5;
    goto LABEL_66;
  }
LABEL_32:
  v36 = v21 + v24 + 17;
  *(_DWORD *)(a5 + 4) = v36;
  *(_DWORD *)(a5 + 16) = v6;
  if (v36 < 0x21)
    return 0;
  v37 = *(_DWORD *)(a5 + 8);
  *(_DWORD *)(a5 + 4) = v21 + v24 - 15;
  *(_DWORD *)(a5 + 8) = v37 - 1;
  if (*(_DWORD *)(a5 + 20) < (32 * (v37 - 1)))
    return 0;
  result = 0;
  *(_DWORD *)a5 = bswap32(*(_DWORD *)(*(_QWORD *)(a5 + 24) + 4 * (v37 - 2)));
  return result;
}

uint64_t H263DMPR_GOB_OBMC1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int v12;
  int v13;
  int8x8_t *v16;
  BOOL v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  unsigned int v35;
  int v36;
  int v37;
  __int32 v38;
  int v39;
  int v40;
  unsigned int v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  int8x16_t v66;
  uint64_t v67;
  uint32x2_t v68;
  int v69;
  unsigned int v70;
  uint64_t v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  uint64_t result;
  uint64_t *v84;
  int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  signed int v90;
  uint64_t *v91;
  signed int v92;
  int v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  signed int *v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  signed int v106;
  uint64_t v107;
  signed int v108;
  int v109;
  int v110;
  signed int v111;
  _BYTE *v112;
  BOOL v113;
  uint64_t v114;
  _WORD *v115;
  signed int v116;
  _BYTE *v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE *v122;
  _BYTE *v123;
  uint64_t v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  signed int *v131;
  _QWORD *v132;
  uint64_t v133;
  unsigned int *v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  int8x8_t *v142;
  uint64_t *v143;
  uint64_t v144;
  unsigned int v145;
  uint64_t v146;
  _BYTE *v148;
  uint64_t *v149;
  unsigned int v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  int *v154;
  uint64_t v157;

  v7 = a1 + 296182;
  v8 = *(uint64_t **)(a1 + 296182);
  v9 = *(_QWORD *)(a1 + 296230);
  v149 = *(uint64_t **)(*(_QWORD *)(a1 + 296238) + 40);
  v10 = *(_BYTE **)(a1 + 296214);
  v11 = v10[19];
  v140 = *(_QWORD **)(a1 + 32);
  v138 = *v8;
  v139 = *(_QWORD *)(a1 + 24);
  v12 = *(_DWORD *)a1;
  v157 = *(_QWORD *)(a1 + 296190);
  *(_DWORD *)(v157 + 24) = 0;
  if (!*(_DWORD *)(a3 + 20))
    return 0;
  v13 = a7;
  v16 = (int8x8_t *)((char *)v8 + 258);
  v154 = (int *)(a1 + 296154);
  v18 = v12 + 32;
  v17 = v12 < -32;
  v136 = (unsigned int *)((char *)v8 + 254);
  v132 = (uint64_t *)((char *)v8 + 286);
  v133 = (uint64_t)v8 + 198;
  v19 = v12 + 33;
  if (!v17)
    v19 = v18;
  v137 = v19 >> 1;
  v130 = (uint64_t)v8 + 222;
  v131 = (signed int *)((char *)v8 + 202);
  v141 = a1 + 296182;
  v142 = (int8x8_t *)((char *)v8 + 258);
  v143 = v8;
  v146 = v9;
  v148 = v10;
  v145 = v11;
  while (1)
  {
    if (*(_BYTE *)(*(_QWORD *)(v7 + 32) + 17) == 1)
    {
      if ((_DWORD)v11)
      {
        v20 = tabLast[SD_Gobble(cdfCod, v9, v154)];
      }
      else
      {
        v21 = *(_DWORD *)(v9 + 16) + 1;
        *(_DWORD *)(v9 + 16) = v21;
        v22 = *(_DWORD *)(v9 + 4);
        if (v22)
        {
          v23 = *(_DWORD *)v9;
          v24 = v22 - 1;
          *(_DWORD *)(v9 + 4) = v24;
          v20 = (v23 >> v24) & 1;
        }
        else
        {
          *(_DWORD *)(v9 + 4) = 31;
          if (v21 > *(_DWORD *)(v9 + 20))
          {
            v150 = 0;
            *(_DWORD *)v9 = 0;
            ++*(_DWORD *)(v9 + 8);
            *(_WORD *)a5 = 0;
            *(_WORD *)a6 = 0;
            if (*(_BYTE *)(*(_QWORD *)(v7 + 32) + 17) == 1)
              goto LABEL_22;
LABEL_25:
            v35 = decodeMCBPCINTRA(v9, v149[1]);
            *(_DWORD *)((char *)v8 + 246) = v35;
            if (v35 == -99)
              return 5;
            goto LABEL_26;
          }
          v25 = *(_QWORD *)(v9 + 24);
          v26 = *(unsigned int *)(v9 + 8);
          *(_DWORD *)(v9 + 8) = v26 + 1;
          LODWORD(v25) = bswap32(*(_DWORD *)(v25 + 4 * v26));
          *(_DWORD *)v9 = v25;
          v20 = v25 >> 31;
        }
      }
      *(_BYTE *)a5 = v20;
      *(_BYTE *)(a5 + 1) = v20;
      *(_BYTE *)a6 = v20;
      *(_BYTE *)(a6 + 1) = v20;
      if (v20 == 1)
      {
        v151 = a6;
        v27 = v9;
        v28 = a5;
        v29 = v10;
        v30 = v11;
        v31 = *(_DWORD *)(v157 + 20);
        v32 = *(_DWORD *)(v157 + 24);
        v33 = a4 + 288 * (v31 + 1) + 12 * (v32 + 1);
        *(_DWORD *)v33 = 0;
        *(_WORD *)(v33 + 10944) = 0;
        *(_WORD *)(v33 + 16416) = 0;
        *(_WORD *)(v33 + 5472) = 0;
        *(_WORD *)(v33 + 21888) = 0;
        *(_WORD *)(v33 + 27360) = 0;
        v34 = v8;
        *((_BYTE *)v8 + 154) = 0;
LABEL_178:
        v124 = *(int *)(v138 + 4 * v32 + 340) + (uint64_t)*(int *)(v138 + 4 * v31 + 188);
        Copy8x8(v140[1] + v124, *(_QWORD *)(v139 + 8) + v124, v137);
        Copy8x8(v140[2] + v124, *(_QWORD *)(v139 + 16) + v124, v137);
        v7 = v141;
        v16 = v142;
        v11 = v30;
        v10 = v29;
        v8 = v34;
        a5 = v28;
        v9 = v27;
        a6 = v151;
        goto LABEL_179;
      }
    }
    else
    {
      v20 = 0;
      *(_WORD *)a5 = 0;
      *(_WORD *)a6 = 0;
    }
    v150 = v20;
    if (*(_BYTE *)(*(_QWORD *)(v7 + 32) + 17) == 1)
    {
      if ((_DWORD)v11)
      {
        v35 = tabMCBPC[SD_Gobble(cdfMCBPC, v9, v154)];
        *(_DWORD *)((char *)v8 + 246) = v35;
      }
      else
      {
LABEL_22:
        v35 = decodeMCBPCINTER(v9, v149[2]);
        *(_DWORD *)((char *)v8 + 246) = v35;
        if (v35 == -99)
          return 5;
      }
      if (v35 == 20)
        goto LABEL_27;
      v36 = (v35 >> 2) & 7;
      goto LABEL_29;
    }
    if (!(_DWORD)v11)
      goto LABEL_25;
    v35 = tabIMCBPC[SD_Gobble(cdfIMCBPC, v9, v154)];
    *(_DWORD *)((char *)v8 + 246) = v35;
LABEL_26:
    if (v35 == 8)
    {
LABEL_27:
      --*(_DWORD *)(v157 + 24);
      goto LABEL_179;
    }
    v36 = (v35 >> 2) + 3;
LABEL_29:
    *(_WORD *)(a4
             + 288 * (*(_DWORD *)(v157 + 20) + 1)
             + 12 * (*(_DWORD *)(v157 + 24) + 1)
             + 2) = v36;
    *((_BYTE *)v8 + 154) = v36;
    *(_DWORD *)((char *)v8 + 246) = v35 & 3;
    v16[1].i32[1] = (v35 >> 1) & 1;
    v16[2].i32[0] = v35 & 1;
    v37 = *(_DWORD *)((char *)v8 + 4 * (char)v36 + 330);
    if (v10[22])
    {
      if ((_DWORD)v11)
      {
        v38 = tabModB[SD_Gobble(cdfMODB, v9, v154)];
        v16[2].i32[1] = v38;
        if (!v38)
          goto LABEL_55;
        if (v38 == 3)
        {
          v16[3].i32[1] = tabLast[SD_Gobble(cdfYCBPB, v9, v154)];
          v16[4].i32[0] = tabLast[SD_Gobble(cdfYCBPB, v9, v154)];
          v16[4].i32[1] = tabLast[SD_Gobble(cdfYCBPB, v9, v154)];
          v16[5].i32[0] = tabLast[SD_Gobble(cdfYCBPB, v9, v154)];
          v16[5].i32[1] = tabLast[SD_Gobble(cdfUVCBPB, v9, v154)];
          v10 = v148;
          v16[6].i32[0] = tabLast[SD_Gobble(cdfUVCBPB, v9, v154)];
LABEL_55:
          v153 = 0;
          v57 = tabCBPY[SD_Gobble(&cdfCBPY[17 * v37], v9, v154)];
          *(_DWORD *)((char *)v8 + 250) = v57;
          goto LABEL_63;
        }
      }
      else
      {
        v39 = *(_DWORD *)(v9 + 16);
        *(_DWORD *)(v9 + 16) = v39 + 1;
        v40 = *(_DWORD *)(v9 + 4);
        if (v40)
        {
          v41 = *(_DWORD *)v9;
          v42 = v40 - 1;
          *(_DWORD *)(v9 + 4) = v42;
          v43 = (v41 >> v42) & 1;
        }
        else
        {
          *(_DWORD *)(v9 + 4) = 31;
          if ((v39 + 1) > *(_DWORD *)(v9 + 20))
          {
            v16[2].i32[1] = 0;
            *(_DWORD *)v9 = 0;
            ++*(_DWORD *)(v9 + 8);
            goto LABEL_61;
          }
          v44 = *(_QWORD *)(v9 + 24);
          v45 = *(unsigned int *)(v9 + 8);
          *(_DWORD *)(v9 + 8) = v45 + 1;
          v41 = bswap32(*(_DWORD *)(v44 + 4 * v45));
          *(_DWORD *)v9 = v41;
          v43 = v41 >> 31;
          v42 = 31;
        }
        v16[2].i32[1] = v43;
        if (!v43)
          goto LABEL_61;
        *(_DWORD *)(v9 + 16) = v39;
        if (v42 >= 0x20)
        {
          v46 = v42 - 31;
          v47 = *(_DWORD *)(v9 + 8);
          *(_DWORD *)(v9 + 4) = v46;
          *(_DWORD *)(v9 + 8) = v47 - 1;
          if (*(_DWORD *)(v9 + 20) >= (32 * (v47 - 1)))
          {
            v41 = bswap32(*(_DWORD *)(*(_QWORD *)(v9 + 24) + 4 * (v47 - 2)));
            *(_DWORD *)v9 = v41;
          }
        }
        else
        {
          v46 = v42 + 1;
        }
        *(_DWORD *)(v9 + 16) = v39 + 2;
        v48 = v46 - 2;
        if (v46 < 2)
        {
          v50 = 2 - v46;
          v51 = v46 + 30;
          *(_DWORD *)(v9 + 4) = v46 + 30;
          v49 = (v41 << (2 - v46)) & *(_DWORD *)(v9 + 40);
          v16[2].i32[1] = v49;
          if ((v39 + 2) <= *(_DWORD *)(v9 + 20))
          {
            v52 = *(_QWORD *)(v9 + 24);
            v53 = *(unsigned int *)(v9 + 8);
            *(_DWORD *)(v9 + 8) = v53 + 1;
            v41 = bswap32(*(_DWORD *)(v52 + 4 * v53));
            *(_DWORD *)v9 = v41;
            v49 |= *(_DWORD *)(v9 + 4 * v50 + 32) & (v41 >> v51);
            v16[2].i32[1] = v49;
          }
          else
          {
            v41 = 0;
            ++*(_DWORD *)(v9 + 8);
            *(_DWORD *)v9 = 0;
          }
          v48 = 31;
        }
        else
        {
          *(_DWORD *)(v9 + 4) = v48;
          v49 = (v41 >> v48) & *(_DWORD *)(v9 + 40);
          v16[2].i32[1] = v49;
        }
        if (v49 == 3)
        {
          v54 = v39 + 8;
          *(_DWORD *)(v9 + 16) = v39 + 8;
          v55 = v48 - 6;
          if (v48 >= 6)
          {
            *(_DWORD *)(v9 + 4) = v55;
            v56 = (v41 >> v55) & *(_DWORD *)(v9 + 56);
            goto LABEL_59;
          }
          v62 = 6 - v48;
          v63 = v48 + 26;
          *(_DWORD *)(v9 + 4) = v48 + 26;
          v56 = (v41 << (6 - v48)) & *(_DWORD *)(v9 + 56);
          v16[3].i32[0] = v56;
          if (v54 <= *(_DWORD *)(v9 + 20))
          {
            v64 = *(_QWORD *)(v9 + 24);
            v65 = *(unsigned int *)(v9 + 8);
            *(_DWORD *)(v9 + 8) = v65 + 1;
            LODWORD(v64) = bswap32(*(_DWORD *)(v64 + 4 * v65));
            *(_DWORD *)v9 = v64;
            v56 |= *(_DWORD *)(v9 + 4 * v62 + 32) & (v64 >> v63);
LABEL_59:
            v16[3].i32[0] = v56;
          }
          else
          {
            ++*(_DWORD *)(v9 + 8);
            *(_DWORD *)v9 = 0;
          }
          v66.i64[0] = 0x100000001;
          v66.i64[1] = 0x100000001;
          *(int8x16_t *)&v16[3].u8[4] = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v56), (uint32x4_t)xmmword_228254740), v66);
          v16[5].i32[1] = (v56 >> 1) & 1;
          v16[6].i32[0] = v56 & 1;
          goto LABEL_61;
        }
      }
      *v132 = 0;
      v132[1] = 0;
      v132[2] = 0;
    }
    if ((_DWORD)v11)
      goto LABEL_55;
LABEL_61:
    v57 = decodeCBPY(v9, v149[3]);
    *(_DWORD *)((char *)v8 + 250) = v57;
    if (v57 == -99)
      return 6;
    v153 = 1;
LABEL_63:
    v67 = *((char *)v8 + 154);
    v68 = (uint32x2_t)vdup_n_s32(v57);
    if (*(_DWORD *)((char *)v8 + 4 * v67 + 330))
    {
      *v136 = (v57 >> 3) & 1;
      *v16 = vand_s8((int8x8_t)vshl_u32(v68, (uint32x2_t)-2), (int8x8_t)0x100000001);
      v69 = v57 & 1;
    }
    else
    {
      *v136 = (v57 & 8) == 0;
      *v16 = vbic_s8((int8x8_t)0x100000001, (int8x8_t)vshl_u32(v68, (uint32x2_t)-2));
      v69 = (v57 & 1) == 0;
    }
    v16[1].i32[0] = v69;
    *((_BYTE *)v8 + 155) = 0;
    if (*(_DWORD *)((char *)v8 + 4 * v67 + 310))
    {
      if (v153)
      {
        v70 = *(_DWORD *)(v9 + 16) + 2;
        *(_DWORD *)(v9 + 16) = v70;
        v71 = *(unsigned int *)(v9 + 4);
        if (v71 < 2)
        {
          v75 = 2 - v71;
          v76 = v71 + 30;
          *(_DWORD *)(v9 + 4) = v71 + 30;
          v73 = (*(_DWORD *)v9 << (2 - v71)) & *(_DWORD *)(v9 + 40);
          if (v70 <= *(_DWORD *)(v9 + 20))
          {
            v77 = *(_QWORD *)(v9 + 24);
            v78 = *(unsigned int *)(v9 + 8);
            *(_DWORD *)(v9 + 8) = v78 + 1;
            LODWORD(v77) = bswap32(*(_DWORD *)(v77 + 4 * v78));
            *(_DWORD *)v9 = v77;
            v73 |= *(_DWORD *)(v9 + 4 * v75 + 32) & (v77 >> v76);
          }
          else
          {
            ++*(_DWORD *)(v9 + 8);
            *(_DWORD *)v9 = 0;
          }
        }
        else
        {
          v72 = v71 - 2;
          *(_DWORD *)(v9 + 4) = v72;
          v73 = (*(_DWORD *)v9 >> v72) & *(_DWORD *)(v9 + 40);
        }
        if (v73 >= 4)
          return 0xFFFFFFFFLL;
        v74 = 0x201FEFFu >> (8 * v73);
      }
      else
      {
        v74 = tabDQuant[SD_Gobble(cdfDQuant, v9, v154)] - 2;
      }
      *((_BYTE *)v8 + 155) = v74;
      v79 = *((_BYTE *)v8 + 153) + v74;
      *((_BYTE *)v8 + 153) = v79;
      if ((v79 - 1) > 0x1Eu)
        return 0xFFFFFFFFLL;
      *((_BYTE *)v8 + 152) = v79;
    }
    v151 = a6;
    if (v10[17] != 1)
      goto LABEL_176;
    v80 = *((char *)v8 + 154);
    if (v80 > 4)
      return 0xFFFFFFFFLL;
    if (v80 == 2)
      break;
    if ((v80 - 3) > 1u || v10[22])
    {
      if (v153)
      {
        v81 = decodeMVD(v9, v149[4]);
        v82 = decodeMVD(v9, v149[4]);
        result = 7;
        if (v81 == -99 || v82 == -99)
          return result;
        v84 = v8;
      }
      else
      {
        v84 = v8;
        v81 = tabMVD[SD_Gobble(cdfMVD, v9, v154)];
        v82 = tabMVD[SD_Gobble(cdfMVD, v9, v154)];
      }
      v85 = pvx4(a4, 0, *(_DWORD *)(v157 + 20), *(_DWORD *)(v157 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
      v86 = pvy4(a4, 0, *(_DWORD *)(v157 + 20), *(_DWORD *)(v157 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
      v87 = v81 | 0xFFFFFFC0;
      if ((v81 & 0x20) == 0)
        v87 = v81;
      if ((v82 & 0x20) != 0)
        v88 = v82 | 0xFFFFFFC0;
      else
        v88 = v82;
      v89 = v85 + v87;
      *(_DWORD *)((char *)v84 + 198) = v85 + v87;
      v90 = v86 + v88;
      v91 = v84;
      *(_DWORD *)((char *)v84 + 222) = v86 + v88;
      v10 = v148;
      if (v148[18])
      {
        if ((v85 + 31) < 0x40)
          goto LABEL_154;
        v92 = (v89 << 26 >> 31) & 0xFFFFFFC0 | v89 & 0x3F;
        *(_DWORD *)v133 = v92;
        LOBYTE(v89) = v92;
        if (v85 > -32)
        {
          if ((v92 & 0x80000000) == 0)
            goto LABEL_154;
          v93 = 64;
        }
        else
        {
          if (v92 <= 0)
            goto LABEL_154;
          v93 = -64;
        }
        v89 = v92 + v93;
        *(_DWORD *)v133 = v89;
LABEL_154:
        if ((v86 + 31) < 0x40)
        {
          v9 = v146;
          v11 = v145;
          v8 = v91;
          goto LABEL_163;
        }
        v116 = (v90 << 26 >> 31) & 0xFFFFFFC0 | v90 & 0x3F;
        v8 = v84;
        *(_DWORD *)((char *)v84 + 222) = v116;
        v9 = v146;
        v11 = v145;
        if (v86 > -32)
        {
          if (v90 << 26 >> 31 < 0)
          {
            v90 = v116 + 64;
            goto LABEL_162;
          }
        }
        else if (v116 >= 1)
        {
          v90 = v116 - 64;
          goto LABEL_162;
        }
        v90 = (v90 << 26 >> 31) & 0xFFFFFFC0 | v90 & 0x3F;
        goto LABEL_163;
      }
      if (v89 >= -32)
      {
        v9 = v146;
        v11 = v145;
        v8 = v91;
        if (v89 < 32)
          goto LABEL_147;
        v94 = -64;
      }
      else
      {
        v94 = 64;
        v9 = v146;
        v11 = v145;
        v8 = v91;
      }
      v89 += v94;
      *(_DWORD *)v133 = v89;
LABEL_147:
      if (v90 > -33)
      {
        if (v90 < 32)
        {
LABEL_163:
          v117 = (_BYTE *)(a4
                         + 288 * (*(_DWORD *)(v157 + 20) + 1)
                         + 12 * (*(_DWORD *)(v157 + 24) + 1));
          *v117 = v89;
          v117[1] = v90;
          v117[5472] = v89;
          v117[5473] = v90;
          v117[10944] = v89;
          v117[10945] = v90;
          v117[16416] = v89;
          v117[16417] = v90;
          v117 += 21888;
          *v117 = v89;
          v117[1] = v90;
          goto LABEL_164;
        }
        v90 -= 64;
      }
      else
      {
        v90 += 64;
      }
LABEL_162:
      *(_DWORD *)((char *)v8 + 222) = v90;
      goto LABEL_163;
    }
    v114 = 0;
    *(_QWORD *)v133 = 0;
    *(_QWORD *)(v133 + 8) = 0;
    *(_QWORD *)(v133 + 16) = 0;
    do
    {
      *(_DWORD *)(v130 + v114) = 0;
      v114 += 4;
    }
    while (v114 != 24);
    v115 = (_WORD *)(a4
                   + 288 * (*(_DWORD *)(v157 + 20) + 1)
                   + 12 * (*(_DWORD *)(v157 + 24) + 1));
    v115[5472] = 0;
    v115[8208] = 0;
    *v115 = 0;
    v115[2736] = 0;
    v115[10944] = 0;
    v115[13680] = 0;
LABEL_164:
    v13 = a7;
    a6 = v151;
    v16 = v142;
    if (v10[22] && (v142[2].i32[1] & 0xFFFFFFFE) == 2)
    {
      if (v153)
      {
        *(_DWORD *)((char *)v8 + 218) = decodeMVD(v9, v149[4]);
        v118 = decodeMVD(v9, v149[4]);
        *(_DWORD *)((char *)v8 + 242) = v118;
        v119 = *(_DWORD *)((char *)v8 + 218);
        result = 7;
        if (v119 == -99 || v118 == -99)
          return result;
        v120 = v9;
        v121 = v11;
        v122 = v148;
        v16 = v142;
        if ((v119 & 0x20) == 0)
          goto LABEL_173;
      }
      else
      {
        v122 = v10;
        v121 = v11;
        *(_DWORD *)((char *)v8 + 218) = tabMVD[SD_Gobble(cdfMVD, v9, v154)];
        v120 = v9;
        v118 = tabMVD[SD_Gobble(cdfMVD, v9, v154)];
        *(_DWORD *)((char *)v8 + 242) = v118;
        v119 = *(_DWORD *)((char *)v8 + 218);
        if ((v119 & 0x20) == 0)
        {
LABEL_173:
          v11 = v121;
          v10 = v122;
          v9 = v120;
          v13 = a7;
          if ((v118 & 0x20) != 0)
          {
            v118 |= 0xFFFFFFC0;
            *(_DWORD *)((char *)v8 + 242) = v118;
          }
          v123 = (_BYTE *)(a4
                         + 288 * (*(_DWORD *)(v157 + 20) + 1)
                         + 12 * (*(_DWORD *)(v157 + 24) + 1)
                         + 27360);
          *v123 = v119;
          v123[1] = v118;
          goto LABEL_176;
        }
      }
      v119 |= 0xFFFFFFC0;
      *(_DWORD *)((char *)v8 + 218) = v119;
      goto LABEL_173;
    }
LABEL_176:
    if (v150)
    {
      v27 = v9;
      v28 = a5;
      v34 = v8;
      v29 = v10;
      v30 = v11;
      v31 = *(_DWORD *)(v157 + 20);
      v32 = *(_DWORD *)(v157 + 24);
      goto LABEL_178;
    }
    result = H263DMPR_MBS16(a1, v58, v59, v60, v61, v13);
    if ((_DWORD)result)
      return result;
    if (!v13)
      DumpDecoded263MB_OBMCS16(a1, v140, v139, v136);
    v7 = v141;
    if (v10[22])
    {
      if (v16[2].i32[1] == 3)
      {
        result = H263DMPR_MB_pbS16(a1, v126, v127, v128, v129, v13);
        if ((_DWORD)result)
          return result;
      }
    }
LABEL_179:
    v125 = *(_DWORD *)(v157 + 24) + 1;
    *(_DWORD *)(v157 + 24) = v125;
    a5 += 2;
    a6 += 2;
    if (v125 >= *(_DWORD *)(a3 + 20))
      return 0;
  }
  if (v10[20])
  {
    v95 = -4;
    v96 = 5473;
    v97 = v131;
    v144 = a5;
    while (1)
    {
      if (v153)
      {
        v98 = decodeMVD(v9, v149[4]);
        v99 = decodeMVD(v9, v149[4]);
        result = 7;
        if (v98 == -99 || v99 == -99)
          return result;
      }
      else
      {
        v98 = tabMVD[SD_Gobble(cdfMVD, v9, v154)];
        v99 = tabMVD[SD_Gobble(cdfMVD, v9, v154)];
      }
      v152 = v95;
      v100 = v95 + 5;
      v101 = pvx4(a4, v100, *(_DWORD *)(v157 + 20), *(_DWORD *)(v157 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
      v102 = pvy4(a4, v100, *(_DWORD *)(v157 + 20), *(_DWORD *)(v157 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
      v103 = v98 | 0xFFFFFFC0;
      if ((v98 & 0x20) == 0)
        v103 = v98;
      if ((v99 & 0x20) != 0)
        v104 = v99 | 0xFFFFFFC0;
      else
        v104 = v99;
      v105 = v101 + v103;
      *v97 = v101 + v103;
      v106 = v102 + v104;
      v97[6] = v102 + v104;
      v10 = v148;
      if (v148[18])
      {
        a5 = v144;
        v107 = v152;
        if ((v101 + 31) >= 0x40)
        {
          v108 = (v105 << 26 >> 31) & 0xFFFFFFC0 | v105 & 0x3F;
          *v97 = v108;
          LOBYTE(v105) = v108;
          if (v101 > -32)
          {
            if (v108 < 0)
            {
              v109 = 64;
LABEL_128:
              v105 = v108 + v109;
              *v97 = v105;
            }
          }
          else if (v108 > 0)
          {
            v109 = -64;
            goto LABEL_128;
          }
        }
        if ((v102 + 31) >= 0x40)
        {
          v111 = (v106 << 26 >> 31) & 0xFFFFFFC0 | v106 & 0x3F;
          v97[6] = v111;
          if (v102 > -32)
          {
            v9 = v146;
            v11 = v145;
            v8 = v143;
            if (v106 << 26 >> 31 < 0)
            {
              v106 = v111 + 64;
              goto LABEL_137;
            }
          }
          else
          {
            v9 = v146;
            v11 = v145;
            v8 = v143;
            if (v111 >= 1)
            {
              v106 = v111 - 64;
              goto LABEL_137;
            }
          }
          v106 = (v106 << 26 >> 31) & 0xFFFFFFC0 | v106 & 0x3F;
        }
        else
        {
          v9 = v146;
          v11 = v145;
          v8 = v143;
        }
        goto LABEL_138;
      }
      v8 = v143;
      a5 = v144;
      v107 = v152;
      if (v105 < -32)
        break;
      v9 = v146;
      v11 = v145;
      if (v105 >= 32)
      {
        v110 = -64;
        goto LABEL_121;
      }
LABEL_122:
      if (v106 <= -33)
      {
        v106 += 64;
LABEL_137:
        v97[6] = v106;
        goto LABEL_138;
      }
      if (v106 >= 32)
      {
        v106 -= 64;
        goto LABEL_137;
      }
LABEL_138:
      v112 = (_BYTE *)(a4
                     + v96
                     + 12 * (*(_DWORD *)(v157 + 24) + 1)
                     + 288 * (*(_DWORD *)(v157 + 20) + 1));
      *(v112 - 1) = v105;
      *v112 = v106;
      ++v97;
      v96 += 5472;
      v113 = __CFADD__(v107, 1);
      v95 = v107 + 1;
      if (v113)
        goto LABEL_164;
    }
    v110 = 64;
    v9 = v146;
    v11 = v145;
LABEL_121:
    v105 += v110;
    *v97 = v105;
    goto LABEL_122;
  }
  return 0xFFFFFFFFLL;
}

uint64_t H263DMPR_GOB_OBMC2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  char *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t result;
  char *v20;
  char *v21;
  int v22;
  int v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  char *v34;
  char *v35;
  int v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  char *v42;
  char *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  char *v49;
  char *v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  char *v61;
  char *v62;
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  char *v73;
  char *v74;
  unsigned int v75;
  int v76;
  uint64_t v77;
  int v78;
  char *v79;
  int v80;
  char *v81;
  char *v82;
  int v83;
  uint64_t v84;
  int v85;
  int v86;
  int v87;
  char *v88;
  char *v89;
  int v90;
  uint64_t v91;
  int v92;
  int v93;
  uint64_t v94;
  int v95;
  int v96;
  char *v97;
  char *v98;
  unsigned int v99;
  int v100;
  uint64_t v101;
  int v102;
  int v103;
  int v104;
  uint64_t v105;
  int v106;
  int v107;
  char *v108;
  char *v109;
  int v110;
  uint64_t v111;
  int v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  int v117;
  int v118;
  char *v119;
  char *v120;
  unsigned int v121;
  int v122;
  uint64_t v123;
  int v124;
  int v125;
  unsigned int v126;
  uint64_t v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  _QWORD *v133;
  char *v134;
  char *v135;
  char *v136;
  int v137;
  uint64_t v138;
  int v139;
  uint64_t v141;
  int v142;
  uint64_t v145;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  int v150;
  uint64_t v151;

  if (*(_DWORD *)(a2 + 20))
  {
    v4 = a3;
    v5 = 0;
    v6 = *(_DWORD *)a1 + 32;
    v7 = *(_QWORD *)(a1 + 24);
    v133 = *(_QWORD **)(a1 + 32);
    v8 = *(_QWORD *)v7;
    v9 = *(_QWORD *)v7 + (*(_DWORD *)(v7 + 28) * *(_DWORD *)(v7 + 24));
    v10 = v6 * (16 * a4 + 16);
    v11 = a4 + 1;
    v138 = *(_QWORD *)(a1 + 296214);
    v139 = 4 * *(_DWORD *)a1;
    v142 = 8 * *(_DWORD *)a1;
    v137 = 12 * *(_DWORD *)a1;
    v151 = *(_QWORD *)(a1 + 66);
    v132 = *(_QWORD *)(a1 + 58);
    v147 = a4 + 1;
    while (1)
    {
      v12 = v5 + 1;
      v13 = (char *)(v4 + 288 * v11 + 12 * (v5 + 1));
      v14 = *((__int16 *)v13 + 1);
      v148 = v5;
      v150 = v10;
      v149 = v5 + 1;
      if (v14 < 2)
        break;
      if (v14 == 2)
      {
        v23 = v10 + 16;
        v24 = v4 + 288 * v11 + 12 * v12;
        v25 = (char *)(v24 + 5472);
        v26 = (char *)(v24 + 5473);
        v145 = v151 + 4 * v23;
        result = MC_Copy8x8Y_wcc(v145, *(_QWORD *)v7 + v23, v6, *(char *)(v24 + 5472), *(char *)(v24 + 5473), (uint64_t)&wcc, v8, v9);
        if ((_DWORD)result)
          return result;
        v27 = v25;
        v28 = v26;
        if (a4)
        {
          v29 = *(unsigned __int16 *)(v4 + 288 * a4 + 12 * v149 + 2);
          if ((v29 - 3) > 1)
          {
            if (v29 != 2)
              goto LABEL_69;
            v77 = v4 + 288 * a4 + 12 * v149;
            v27 = (char *)(v77 + 16416);
            v28 = (char *)(v77 + 16417);
          }
          else
          {
            v27 = v25;
            v28 = v26;
            if (!*(_BYTE *)(v138 + 22))
              goto LABEL_70;
LABEL_69:
            v28 = (char *)(v4 + 288 * a4 + 12 * v149 + 1);
            v27 = (char *)(v4 + 288 * a4 + 12 * v149);
          }
        }
LABEL_70:
        v136 = v25;
        v78 = *(char *)(v4 + 288 * v11 + 12 * v149 + 16416);
        v131 = (char *)(v4 + 288 * v11 + 12 * v149 + 16416);
        v79 = (char *)(v4 + 288 * v11 + 12 * v149 + 16417);
        v80 = *v79;
        v130 = v79;
        v141 = v23;
        result = MC_Copy4x8Y_wtb(v145, *(_QWORD *)v7 + v23, v6, *v27, *v28, (uint64_t)&wtb, v8, v9);
        if ((_DWORD)result)
          return result;
        result = MC_Copy4x8Y_wtb(v151 + 4 * (v139 + v150 + 144), *(_QWORD *)v7 + v139 + v150 + 144, v6, v78, v80, (uint64_t)&unk_228254C00, v8, v9);
        if ((_DWORD)result)
          return result;
        v81 = v136;
        v82 = v26;
        if (v148)
        {
          v83 = *(unsigned __int16 *)(v4 + 288 * v147 + 12 * v148 + 2);
          if ((v83 - 3) > 1)
          {
            if (v83 != 2)
              goto LABEL_78;
            v84 = v4 + 288 * v147 + 12 * v148;
            v81 = (char *)(v84 + 10944);
            v82 = (char *)(v84 + 10945);
          }
          else
          {
            v81 = v136;
            v82 = v26;
            if (!*(_BYTE *)(v138 + 22))
              goto LABEL_79;
LABEL_78:
            v82 = (char *)(v4 + 288 * v147 + 12 * v148 + 1);
            v81 = (char *)(v4 + 288 * v147 + 12 * v148);
          }
        }
LABEL_79:
        v85 = *(char *)(v4 + 288 * v147 + 12 * v149 + 10944);
        v135 = (char *)(v4 + 288 * v147 + 12 * v149 + 10944);
        v86 = *(char *)(v4 + 288 * v147 + 12 * v149 + 10945);
        v134 = (char *)(v4 + 288 * v147 + 12 * v149 + 10945);
        result = MC_Copy8x4Y_wlr(v145, *(_QWORD *)v7 + v23, v6, *v81, *v82, (uint64_t)&wlr, v8, v9);
        if ((_DWORD)result)
          return result;
        result = MC_Copy8x4Y_wlr(v151 + 4 * (v150 + 20), *(_QWORD *)v7 + v150 + 20, v6, v85, v86, (uint64_t)&unk_228254C90, v8, v9);
        if ((_DWORD)result)
          return result;
        v87 = v150 + 24;
        v127 = v151 + 4 * (v150 + 24);
        result = MC_Copy8x8Y_wcc(v151 + 4 * v87, *(_QWORD *)v7 + v87, v6, *v135, *v134, (uint64_t)&wcc, v8, v9);
        if ((_DWORD)result)
          return result;
        v88 = (char *)(v4 + 288 * v147 + 12 * v149 + 10944);
        v89 = (char *)(v4 + 288 * v147 + 12 * v149 + 10945);
        if (a4)
        {
          v90 = *(unsigned __int16 *)(v4 + 288 * a4 + 12 * v149 + 2);
          if ((v90 - 3) > 1)
          {
            if (v90 != 2)
              goto LABEL_94;
            v94 = v4 + 288 * a4 + 12 * v149;
            v88 = (char *)(v94 + 21888);
            v89 = (char *)(v94 + 21889);
          }
          else
          {
            v88 = (char *)(v4 + 288 * v147 + 12 * v149 + 10944);
            v89 = (char *)(v4 + 288 * v147 + 12 * v149 + 10945);
            if (!*(_BYTE *)(v138 + 22))
              goto LABEL_95;
LABEL_94:
            v89 = (char *)(v4 + 288 * a4 + 12 * v149 + 1);
            v88 = (char *)(v4 + 288 * a4 + 12 * v149);
          }
        }
LABEL_95:
        v95 = *(char *)(v4 + 288 * v147 + 12 * v149 + 21888);
        v129 = (char *)(v4 + 288 * v147 + 12 * v149 + 21888);
        v96 = *(char *)(v4 + 288 * v147 + 12 * v149 + 21889);
        v128 = (char *)(v4 + 288 * v147 + 12 * v149 + 21889);
        result = MC_Copy4x8Y_wtb(v127, *(_QWORD *)v7 + v87, v6, *v88, *v89, (uint64_t)&wtb, v8, v9);
        if ((_DWORD)result)
          return result;
        result = MC_Copy4x8Y_wtb(v151 + 4 * (v139 + v150 + 152), *(_QWORD *)v7 + v139 + v150 + 152, v6, v95, v96, (uint64_t)&unk_228254C00, v8, v9);
        if ((_DWORD)result)
          return result;
        v97 = (char *)(v4 + 288 * v147 + 12 * v149 + 10944);
        v98 = (char *)(v4 + 288 * v147 + 12 * v149 + 10945);
        if (v149 != *(_DWORD *)(a2 + 20))
        {
          v99 = v148 + 2;
          v100 = *(unsigned __int16 *)(a3 + 288 * v147 + 12 * (v148 + 2) + 2);
          if ((v100 - 3) > 1)
          {
            if (v100 != 2)
              goto LABEL_103;
            v101 = a3 + 288 * v147 + 12 * v99;
            v97 = (char *)(v101 + 5472);
            v98 = (char *)(v101 + 5473);
          }
          else
          {
            v97 = (char *)(v4 + 288 * v147 + 12 * v149 + 10944);
            v98 = (char *)(v4 + 288 * v147 + 12 * v149 + 10945);
            if (!*(_BYTE *)(v138 + 22))
              goto LABEL_104;
LABEL_103:
            v98 = (char *)(a3 + 288 * v147 + 12 * v99 + 1);
            v97 = (char *)(a3 + 288 * v147 + 12 * (v148 + 2));
          }
        }
LABEL_104:
        v102 = *v98;
        v103 = *v97;
        result = MC_Copy8x4Y_wlr(v127, *(_QWORD *)v7 + v87, v6, *v136, *v26, (uint64_t)&wlr, v8, v9);
        if ((_DWORD)result)
          return result;
        result = MC_Copy8x4Y_wlr(v151 + 4 * (v150 + 28), *(_QWORD *)v7 + v150 + 28, v6, v103, v102, (uint64_t)&unk_228254C90, v8, v9);
        if ((_DWORD)result)
          return result;
        v104 = v142 + v150 + 272;
        v105 = v151 + 4 * v104;
        result = MC_Copy8x8Y_wcc(v105, *(_QWORD *)v7 + v104, v6, *v131, *v130, (uint64_t)&wcc, v8, v9);
        if ((_DWORD)result)
          return result;
        v106 = *v131;
        v107 = *v130;
        result = MC_Copy4x8Y_wtb(v105, *(_QWORD *)v7 + v104, v6, *v136, *v26, (uint64_t)&wtb, v8, v9);
        if ((_DWORD)result)
          return result;
        result = MC_Copy4x8Y_wtb(v151 + 4 * (v137 + v150 + 400), *(_QWORD *)v7 + v137 + v150 + 400, v6, v106, v107, (uint64_t)&unk_228254C00, v8, v9);
        if ((_DWORD)result)
          return result;
        v108 = v131;
        v109 = v130;
        if (v148)
        {
          v110 = *(unsigned __int16 *)(a3 + 288 * v147 + 12 * v148 + 2);
          if ((v110 - 3) > 1)
          {
            if (v110 != 2)
              goto LABEL_115;
            v111 = a3 + 288 * v147 + 12 * v148;
            v108 = (char *)(v111 + 21888);
            v109 = (char *)(v111 + 21889);
          }
          else
          {
            v108 = v131;
            v109 = v130;
            if (!*(_BYTE *)(v138 + 22))
              goto LABEL_116;
LABEL_115:
            v109 = (char *)(a3 + 288 * v147 + 12 * v148 + 1);
            v108 = (char *)(a3 + 288 * v147 + 12 * v148);
          }
        }
LABEL_116:
        v112 = *v129;
        v113 = *v128;
        result = MC_Copy8x4Y_wlr(v105, *(_QWORD *)v7 + v104, v6, *v108, *v109, (uint64_t)&wlr, v8, v9);
        if ((_DWORD)result)
          return result;
        v10 = v150;
        v114 = v142 + v150;
        result = MC_Copy8x4Y_wlr(v151 + 4 * (v114 + 276), *(_QWORD *)v7 + v114 + 276, v6, v112, v113, (uint64_t)&unk_228254C90, v8, v9);
        if ((_DWORD)result)
          return result;
        v115 = v114 + 280;
        v116 = v151 + 4 * v115;
        result = MC_Copy8x8Y_wcc(v116, *(_QWORD *)v7 + v115, v6, *v129, *v128, (uint64_t)&wcc, v8, v9);
        if ((_DWORD)result)
          return result;
        v117 = *v129;
        v118 = *v128;
        result = MC_Copy4x8Y_wtb(v116, *(_QWORD *)v7 + v115, v6, *v135, *v134, (uint64_t)&wtb, v8, v9);
        if ((_DWORD)result)
          return result;
        result = MC_Copy4x8Y_wtb(v151 + 4 * (v137 + v150 + 408), *(_QWORD *)v7 + v137 + v150 + 408, v6, v117, v118, (uint64_t)&unk_228254C00, v8, v9);
        if ((_DWORD)result)
          return result;
        if (v149 == *(_DWORD *)(a2 + 20))
        {
          v120 = v128;
          v119 = v129;
          goto LABEL_129;
        }
        v121 = v148 + 2;
        v122 = *(unsigned __int16 *)(a3 + 288 * v147 + 12 * (v148 + 2) + 2);
        v120 = v128;
        v119 = v129;
        if ((v122 - 3) > 1)
        {
          if (v122 == 2)
          {
            v123 = a3 + 288 * v147 + 12 * v121;
            v119 = (char *)(v123 + 16416);
            v120 = (char *)(v123 + 16417);
            goto LABEL_129;
          }
        }
        else if (!*(_BYTE *)(v138 + 22))
        {
LABEL_129:
          v124 = *v120;
          v125 = *v119;
          result = MC_Copy8x4Y_wlr(v116, *(_QWORD *)v7 + v115, v6, *v131, *v130, (uint64_t)&wlr, v8, v9);
          if ((_DWORD)result)
            return result;
          result = MC_Copy8x4Y_wlr(v151 + 4 * (v142 + v150 + 284), *(_QWORD *)v7 + v142 + v150 + 284, v6, v125, v124, (uint64_t)&unk_228254C90, v8, v9);
          if ((_DWORD)result)
            return result;
          goto LABEL_131;
        }
        v120 = (char *)(a3 + 288 * v147 + 12 * v121 + 1);
        v119 = (char *)(a3 + 288 * v147 + 12 * (v148 + 2));
        goto LABEL_129;
      }
LABEL_132:
      v126 = v5 + 2;
      ++v5;
      v10 += 16;
      if (v126 > *(_DWORD *)(a2 + 20))
        return 0;
    }
    v15 = v10 + 16;
    v16 = v4 + 288 * v11 + 12 * v12;
    v18 = *(char *)(v16 + 1);
    v17 = (char *)(v16 + 1);
    v145 = v151 + 4 * v15;
    result = MC_Copy8x8Y_wcc(v145, *(_QWORD *)v7 + v15, v6, *v13, v18, (uint64_t)&wcc, v8, v9);
    if ((_DWORD)result)
      return result;
    v20 = v13;
    v21 = v17;
    if (a4)
    {
      v22 = *(unsigned __int16 *)(v4 + 288 * a4 + 12 * v149 + 2);
      if ((v22 - 3) <= 1)
      {
        v20 = v13;
        v21 = v17;
        if (!*(_BYTE *)(v138 + 22))
          goto LABEL_18;
        goto LABEL_17;
      }
      if (v22 != 2)
      {
LABEL_17:
        v21 = (char *)(v4 + 288 * a4 + 12 * v149 + 1);
        v20 = (char *)(v4 + 288 * a4 + 12 * v149);
        goto LABEL_18;
      }
      v30 = v4 + 288 * a4 + 12 * v149;
      v20 = (char *)(v30 + 16416);
      v21 = (char *)(v30 + 16417);
    }
LABEL_18:
    v31 = v15;
    v32 = *v13;
    v33 = *v17;
    v141 = v31;
    result = MC_Copy4x8Y_wtb(v145, *(_QWORD *)v7 + v31, v6, *v20, *v21, (uint64_t)&wtb, v8, v9);
    if ((_DWORD)result)
      return result;
    result = MC_Copy4x8Y_wtb(v151 + 4 * (v139 + v150 + 144), *(_QWORD *)v7 + v139 + v150 + 144, v6, v32, v33, (uint64_t)&unk_228254C00, v8, v9);
    if ((_DWORD)result)
      return result;
    v34 = v13;
    v35 = v17;
    if (v148)
    {
      v36 = *(unsigned __int16 *)(v4 + 288 * v147 + 12 * v148 + 2);
      if ((v36 - 3) <= 1)
      {
        v34 = v13;
        v35 = v17;
        if (!*(_BYTE *)(v138 + 22))
          goto LABEL_27;
        goto LABEL_26;
      }
      if (v36 != 2)
      {
LABEL_26:
        v35 = (char *)(v4 + 288 * v147 + 12 * v148 + 1);
        v34 = (char *)(v4 + 288 * v147 + 12 * v148);
        goto LABEL_27;
      }
      v37 = v4 + 288 * v147 + 12 * v148;
      v34 = (char *)(v37 + 10944);
      v35 = (char *)(v37 + 10945);
    }
LABEL_27:
    v38 = *v13;
    v39 = *v17;
    result = MC_Copy8x4Y_wlr(v145, *(_QWORD *)v7 + v141, v6, *v34, *v35, (uint64_t)&wlr, v8, v9);
    if ((_DWORD)result)
      return result;
    result = MC_Copy8x4Y_wlr(v151 + 4 * (v150 + 20), *(_QWORD *)v7 + v150 + 20, v6, v38, v39, (uint64_t)&unk_228254C90, v8, v9);
    if ((_DWORD)result)
      return result;
    v40 = v150 + 24;
    v41 = v151 + 4 * (v150 + 24);
    result = MC_Copy8x8Y_wcc(v151 + 4 * v40, *(_QWORD *)v7 + v40, v6, *v13, *v17, (uint64_t)&wcc, v8, v9);
    if ((_DWORD)result)
      return result;
    v42 = v13;
    v43 = v17;
    if (a4)
    {
      v44 = *(unsigned __int16 *)(a3 + 288 * a4 + 12 * v149 + 2);
      if ((v44 - 3) <= 1)
      {
        v42 = v13;
        v43 = v17;
        if (!*(_BYTE *)(v138 + 22))
          goto LABEL_37;
        goto LABEL_36;
      }
      if (v44 != 2)
      {
LABEL_36:
        v43 = (char *)(a3 + 288 * a4 + 12 * v149 + 1);
        v42 = (char *)(a3 + 288 * a4 + 12 * v149);
        goto LABEL_37;
      }
      v45 = a3 + 288 * a4 + 12 * v149;
      v42 = (char *)(v45 + 21888);
      v43 = (char *)(v45 + 21889);
    }
LABEL_37:
    v46 = v40;
    v47 = *v13;
    v48 = *v17;
    result = MC_Copy4x8Y_wtb(v41, *(_QWORD *)v7 + v46, v6, *v42, *v43, (uint64_t)&wtb, v8, v9);
    if ((_DWORD)result)
      return result;
    result = MC_Copy4x8Y_wtb(v151 + 4 * (v139 + v150 + 152), *(_QWORD *)v7 + v139 + v150 + 152, v6, v47, v48, (uint64_t)&unk_228254C00, v8, v9);
    if ((_DWORD)result)
      return result;
    v49 = v13;
    v50 = v17;
    if (v149 != *(_DWORD *)(a2 + 20))
    {
      v51 = v148 + 2;
      v52 = *(unsigned __int16 *)(a3 + 288 * v147 + 12 * (v148 + 2) + 2);
      if ((v52 - 3) <= 1)
      {
        v49 = v13;
        v50 = v17;
        if (!*(_BYTE *)(v138 + 22))
          goto LABEL_46;
        goto LABEL_45;
      }
      if (v52 != 2)
      {
LABEL_45:
        v50 = (char *)(a3 + 288 * v147 + 12 * v51 + 1);
        v49 = (char *)(a3 + 288 * v147 + 12 * (v148 + 2));
        goto LABEL_46;
      }
      v53 = a3 + 288 * v147 + 12 * v51;
      v49 = (char *)(v53 + 5472);
      v50 = (char *)(v53 + 5473);
    }
LABEL_46:
    v54 = *v50;
    v55 = *v49;
    result = MC_Copy8x4Y_wlr(v41, *(_QWORD *)v7 + v46, v6, *v13, *v17, (uint64_t)&wlr, v8, v9);
    if ((_DWORD)result)
      return result;
    result = MC_Copy8x4Y_wlr(v151 + 4 * (v150 + 28), *(_QWORD *)v7 + v150 + 28, v6, v55, v54, (uint64_t)&unk_228254C90, v8, v9);
    if ((_DWORD)result)
      return result;
    v56 = v142 + v150 + 272;
    v57 = v151 + 4 * v56;
    result = MC_Copy8x8Y_wcc(v57, *(_QWORD *)v7 + v56, v6, *v13, *v17, (uint64_t)&wcc, v8, v9);
    if ((_DWORD)result)
      return result;
    v58 = v56;
    v59 = *v13;
    v60 = *v17;
    result = MC_Copy4x8Y_wtb(v57, *(_QWORD *)v7 + v58, v6, v59, v60, (uint64_t)&wtb, v8, v9);
    if ((_DWORD)result)
      return result;
    result = MC_Copy4x8Y_wtb(v151 + 4 * (v137 + v150 + 400), *(_QWORD *)v7 + v137 + v150 + 400, v6, v59, v60, (uint64_t)&unk_228254C00, v8, v9);
    if ((_DWORD)result)
      return result;
    v61 = v13;
    v62 = v17;
    if (v148)
    {
      v63 = *(unsigned __int16 *)(a3 + 288 * v147 + 12 * v148 + 2);
      if ((v63 - 3) <= 1)
      {
        v61 = v13;
        v62 = v17;
        if (!*(_BYTE *)(v138 + 22))
          goto LABEL_58;
        goto LABEL_57;
      }
      if (v63 != 2)
      {
LABEL_57:
        v62 = (char *)(a3 + 288 * v147 + 12 * v148 + 1);
        v61 = (char *)(a3 + 288 * v147 + 12 * v148);
        goto LABEL_58;
      }
      v64 = a3 + 288 * v147 + 12 * v148;
      v61 = (char *)(v64 + 21888);
      v62 = (char *)(v64 + 21889);
    }
LABEL_58:
    v65 = *v13;
    v66 = *v17;
    result = MC_Copy8x4Y_wlr(v57, *(_QWORD *)v7 + v58, v6, *v61, *v62, (uint64_t)&wlr, v8, v9);
    if ((_DWORD)result)
      return result;
    v67 = v142 + v150;
    result = MC_Copy8x4Y_wlr(v151 + 4 * (v67 + 276), *(_QWORD *)v7 + v67 + 276, v6, v65, v66, (uint64_t)&unk_228254C90, v8, v9);
    if ((_DWORD)result)
      return result;
    v68 = v67 + 280;
    v69 = v151 + 4 * (v67 + 280);
    result = MC_Copy8x8Y_wcc(v151 + 4 * v68, *(_QWORD *)v7 + v68, v6, *v13, *v17, (uint64_t)&wcc, v8, v9);
    if ((_DWORD)result)
      return result;
    v70 = v68;
    v71 = *v13;
    v72 = *v17;
    result = MC_Copy4x8Y_wtb(v69, *(_QWORD *)v7 + v70, v6, v71, v72, (uint64_t)&wtb, v8, v9);
    if ((_DWORD)result)
      return result;
    result = MC_Copy4x8Y_wtb(v151 + 4 * (v137 + v150 + 408), *(_QWORD *)v7 + v137 + v150 + 408, v6, v71, v72, (uint64_t)&unk_228254C00, v8, v9);
    if ((_DWORD)result)
      return result;
    v73 = v13;
    v74 = v17;
    if (v149 == *(_DWORD *)(a2 + 20))
      goto LABEL_89;
    v75 = v148 + 2;
    v76 = *(unsigned __int16 *)(a3 + 288 * v147 + 12 * (v148 + 2) + 2);
    if ((v76 - 3) > 1)
    {
      if (v76 == 2)
      {
        v91 = a3 + 288 * v147 + 12 * v75;
        v73 = (char *)(v91 + 16416);
        v74 = (char *)(v91 + 16417);
LABEL_89:
        v92 = *v74;
        v93 = *v73;
        result = MC_Copy8x4Y_wlr(v69, *(_QWORD *)v7 + v70, v6, *v13, *v17, (uint64_t)&wlr, v8, v9);
        if ((_DWORD)result)
          return result;
        v10 = v150;
        result = MC_Copy8x4Y_wlr(v151 + 4 * (v142 + v150 + 284), *(_QWORD *)v7 + v142 + v150 + 284, v6, v93, v92, (uint64_t)&unk_228254C90, v8, v9);
        if ((_DWORD)result)
          return result;
LABEL_131:
        OBMC_average(*v133 + v141, v132 + 4 * v141, v145, v6);
        v4 = a3;
        v11 = v147;
        v5 = v148;
        goto LABEL_132;
      }
    }
    else
    {
      v73 = v13;
      v74 = v17;
      if (!*(_BYTE *)(v138 + 22))
        goto LABEL_89;
    }
    v74 = (char *)(a3 + 288 * v147 + 12 * v75 + 1);
    v73 = (char *)(a3 + 288 * v147 + 12 * (v148 + 2));
    goto LABEL_89;
  }
  return 0;
}

uint64_t H263DMPR_GOB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int8x8_t *v16;
  BOOL v17;
  int v18;
  int *v19;
  int *v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  __int32 v35;
  int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  int8x16_t v62;
  uint64_t v63;
  uint32x2_t v64;
  int v65;
  unsigned int v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  char v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  uint64_t result;
  int v81;
  uint64_t v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  signed int v90;
  signed int v91;
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  signed int *v96;
  unsigned int v97;
  unsigned int v98;
  int v99;
  uint64_t v100;
  int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  signed int v106;
  uint64_t v107;
  signed int v108;
  int v109;
  int v110;
  signed int v111;
  int v112;
  int v113;
  _BYTE *v114;
  uint64_t v116;
  _WORD *v117;
  signed int v118;
  _BYTE *v119;
  int v120;
  int v121;
  uint64_t v122;
  _BYTE *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  signed int *v133;
  _QWORD *v134;
  _QWORD *v135;
  unsigned int v137;
  unsigned int v138;
  _QWORD *v139;
  _QWORD *v140;
  unsigned int *v141;
  uint64_t *v145;
  unsigned int v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  int8x8_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int *v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  uint64_t v163;
  int *v164;
  _BYTE *v166;

  v7 = a1 + 296182;
  v9 = *(_QWORD *)(a1 + 296182);
  v8 = *(_QWORD *)(a1 + 296190);
  v155 = *(int **)v9;
  v10 = *(_QWORD *)(a1 + 296230);
  v145 = *(uint64_t **)(*(_QWORD *)(a1 + 296238) + 40);
  v166 = *(_BYTE **)(a1 + 296214);
  v162 = v166[19];
  v139 = *(_QWORD **)(a1 + 24);
  v140 = *(_QWORD **)(a1 + 32);
  v11 = *(_DWORD *)a1;
  *(_DWORD *)(v8 + 24) = 0;
  if (!*(_DWORD *)(a3 + 20))
    return 0;
  v13 = a4;
  v14 = a3;
  v15 = 0;
  v16 = (int8x8_t *)(v9 + 258);
  v164 = (int *)(a1 + 296154);
  v17 = __OFADD__(v11, 32);
  v18 = v11 + 32;
  v141 = (unsigned int *)(v9 + 254);
  v134 = (_QWORD *)(v9 + 286);
  v135 = (_QWORD *)(v9 + 198);
  v138 = v18;
  if (v18 < 0 != v17)
    ++v18;
  v137 = v18 >> 1;
  v132 = v9 + 222;
  v133 = (signed int *)(v9 + 202);
  v156 = a1 + 296182;
  v149 = v9;
  v147 = v10;
  v163 = v8;
  v150 = (int8x8_t *)(v9 + 258);
  while (1)
  {
    v19 = &v155[*(unsigned int *)(v8 + 20)];
    v154 = *v19;
    v20 = &v155[v15];
    v152 = v20[19];
    v153 = v19[47];
    v151 = v20[85];
    v21 = a5;
    if (*(_BYTE *)(*(_QWORD *)(v7 + 32) + 17) == 1)
    {
      if (v162)
      {
        v22 = SD_Gobble(cdfCod, v10, v164);
        a5 = v21;
        v23 = tabLast[v22];
      }
      else
      {
        v24 = *(_DWORD *)(v10 + 16) + 1;
        *(_DWORD *)(v10 + 16) = v24;
        v25 = *(_DWORD *)(v10 + 4);
        if (v25)
        {
          v26 = *(_DWORD *)v10;
          v27 = v25 - 1;
          *(_DWORD *)(v10 + 4) = v27;
          v23 = (v26 >> v27) & 1;
        }
        else
        {
          *(_DWORD *)(v10 + 4) = 31;
          if (v24 > *(_DWORD *)(v10 + 20))
          {
            v146 = 0;
            *(_DWORD *)v10 = 0;
            ++*(_DWORD *)(v10 + 8);
            *(_WORD *)a5 = 0;
            *(_WORD *)a6 = 0;
            if (*(_BYTE *)(*(_QWORD *)(v7 + 32) + 17) != 1)
              goto LABEL_25;
LABEL_22:
            v31 = decodeMCBPCINTER(v10, v145[2]);
            *(_DWORD *)(v9 + 246) = v31;
            if (v31 == -99)
              return 5;
            goto LABEL_23;
          }
          v28 = *(_QWORD *)(v10 + 24);
          v29 = *(unsigned int *)(v10 + 8);
          *(_DWORD *)(v10 + 8) = v29 + 1;
          LODWORD(v28) = bswap32(*(_DWORD *)(v28 + 4 * v29));
          *(_DWORD *)v10 = v28;
          v23 = v28 >> 31;
        }
      }
      *(_BYTE *)a5 = v23;
      *(_BYTE *)(a5 + 1) = v23;
      *(_BYTE *)a6 = v23;
      *(_BYTE *)(a6 + 1) = v23;
      if (v23 == 1)
      {
        v30 = v13 + 288 * (*(_DWORD *)(v8 + 20) + 1) + 12 * (*(_DWORD *)(v8 + 24) + 1);
        *(_DWORD *)v30 = 0;
        *(_WORD *)(v30 + 10944) = 0;
        *(_WORD *)(v30 + 16416) = 0;
        *(_WORD *)(v30 + 5472) = 0;
        *(_WORD *)(v30 + 21888) = 0;
        *(_WORD *)(v30 + 27360) = 0;
        *(_BYTE *)(v9 + 154) = 0;
LABEL_180:
        if (!a7)
        {
          v160 = a5;
          v124 = v155[42] + v152 + v154;
          Copy8x8(*v140 + v124, *v139 + v124, v138);
          v125 = v155[43] + (uint64_t)((int)v152 + (int)v154);
          Copy8x8(*v140 + v125, *v139 + v125, v138);
          v126 = v155[44] + (uint64_t)((int)v152 + (int)v154);
          Copy8x8(*v140 + v126, *v139 + v126, v138);
          v10 = v147;
          v127 = v155[45] + (uint64_t)((int)v152 + (int)v154);
          Copy8x8(*v140 + v127, *v139 + v127, v138);
          Copy8x8(v140[1] + v151 + v153, v139[1] + v151 + v153, v137);
          v9 = v149;
          v8 = v163;
          v16 = v150;
          v7 = v156;
          Copy8x8(v140[2] + v151 + v153, v139[2] + v151 + v153, v137);
          a5 = v160;
        }
        goto LABEL_188;
      }
    }
    else
    {
      v23 = 0;
      *(_WORD *)a5 = 0;
      *(_WORD *)a6 = 0;
    }
    v146 = v23;
    if (*(_BYTE *)(*(_QWORD *)(v7 + 32) + 17) != 1)
    {
      if (v162)
      {
        v31 = tabIMCBPC[SD_Gobble(cdfIMCBPC, v10, v164)];
        *(_DWORD *)(v9 + 246) = v31;
      }
      else
      {
LABEL_25:
        v31 = decodeMCBPCINTRA(v10, v145[1]);
        *(_DWORD *)(v9 + 246) = v31;
        if (v31 == -99)
          return 5;
      }
      a5 = v21;
      if (v31 == 8)
        goto LABEL_188;
      v158 = v21;
      v33 = (v31 >> 2) + 3;
      *(_BYTE *)(v9 + 154) = (v31 >> 2) + 3;
      LOWORD(v32) = (char)((v31 >> 2) + 3);
      goto LABEL_28;
    }
    if (!v162)
      goto LABEL_22;
    v31 = tabMCBPC[SD_Gobble(cdfMCBPC, v10, v164)];
    *(_DWORD *)(v9 + 246) = v31;
LABEL_23:
    a5 = v21;
    if (v31 == 20)
      goto LABEL_188;
    v158 = v21;
    v32 = (v31 >> 2) & 7;
    *(_BYTE *)(v9 + 154) = (v31 >> 2) & 7;
    LOBYTE(v33) = v32;
LABEL_28:
    *(_WORD *)(v13
             + 288 * (*(_DWORD *)(v8 + 20) + 1)
             + 12 * (*(_DWORD *)(v8 + 24) + 1)
             + 2) = v32;
    *(_DWORD *)(v9 + 246) = v31 & 3;
    v16[1].i32[1] = (v31 >> 1) & 1;
    v16[2].i32[0] = v31 & 1;
    v34 = *(_DWORD *)(v9 + 4 * (char)v33 + 330);
    if (v166[22])
    {
      if (v162)
      {
        v35 = tabModB[SD_Gobble(cdfMODB, v10, v164)];
        v16[2].i32[1] = v35;
        if (!v35)
          goto LABEL_54;
        if (v35 == 3)
        {
          v16[3].i32[1] = tabLast[SD_Gobble(cdfYCBPB, v10, v164)];
          v16[4].i32[0] = tabLast[SD_Gobble(cdfYCBPB, v10, v164)];
          v16[4].i32[1] = tabLast[SD_Gobble(cdfYCBPB, v10, v164)];
          v16[5].i32[0] = tabLast[SD_Gobble(cdfYCBPB, v10, v164)];
          v16[5].i32[1] = tabLast[SD_Gobble(cdfUVCBPB, v10, v164)];
          v7 = v156;
          v14 = a3;
          v16[6].i32[0] = tabLast[SD_Gobble(cdfUVCBPB, v10, v164)];
LABEL_54:
          v157 = 0;
          v54 = tabCBPY[SD_Gobble(&cdfCBPY[17 * v34], v10, v164)];
          goto LABEL_61;
        }
      }
      else
      {
        v36 = *(_DWORD *)(v10 + 16);
        *(_DWORD *)(v10 + 16) = v36 + 1;
        v37 = *(_DWORD *)(v10 + 4);
        if (v37)
        {
          v38 = *(_DWORD *)v10;
          v39 = v37 - 1;
          *(_DWORD *)(v10 + 4) = v39;
          v40 = (v38 >> v39) & 1;
        }
        else
        {
          *(_DWORD *)(v10 + 4) = 31;
          if ((v36 + 1) > *(_DWORD *)(v10 + 20))
          {
            v16[2].i32[1] = 0;
            *(_DWORD *)v10 = 0;
            ++*(_DWORD *)(v10 + 8);
            goto LABEL_60;
          }
          v41 = *(_QWORD *)(v10 + 24);
          v42 = *(unsigned int *)(v10 + 8);
          *(_DWORD *)(v10 + 8) = v42 + 1;
          v38 = bswap32(*(_DWORD *)(v41 + 4 * v42));
          *(_DWORD *)v10 = v38;
          v40 = v38 >> 31;
          v39 = 31;
        }
        v16[2].i32[1] = v40;
        if (!v40)
          goto LABEL_60;
        *(_DWORD *)(v10 + 16) = v36;
        if (v39 >= 0x20)
        {
          v43 = v39 - 31;
          v44 = *(_DWORD *)(v10 + 8);
          *(_DWORD *)(v10 + 4) = v43;
          *(_DWORD *)(v10 + 8) = v44 - 1;
          if (*(_DWORD *)(v10 + 20) >= (32 * (v44 - 1)))
          {
            v38 = bswap32(*(_DWORD *)(*(_QWORD *)(v10 + 24) + 4 * (v44 - 2)));
            *(_DWORD *)v10 = v38;
          }
        }
        else
        {
          v43 = v39 + 1;
        }
        *(_DWORD *)(v10 + 16) = v36 + 2;
        v45 = v43 - 2;
        if (v43 < 2)
        {
          v47 = 2 - v43;
          v48 = v43 + 30;
          *(_DWORD *)(v10 + 4) = v43 + 30;
          v46 = (v38 << (2 - v43)) & *(_DWORD *)(v10 + 40);
          v16[2].i32[1] = v46;
          if ((v36 + 2) <= *(_DWORD *)(v10 + 20))
          {
            v49 = *(_QWORD *)(v10 + 24);
            v50 = *(unsigned int *)(v10 + 8);
            *(_DWORD *)(v10 + 8) = v50 + 1;
            v38 = bswap32(*(_DWORD *)(v49 + 4 * v50));
            *(_DWORD *)v10 = v38;
            v46 |= *(_DWORD *)(v10 + 4 * v47 + 32) & (v38 >> v48);
            v16[2].i32[1] = v46;
          }
          else
          {
            v38 = 0;
            ++*(_DWORD *)(v10 + 8);
            *(_DWORD *)v10 = 0;
          }
          v45 = 31;
        }
        else
        {
          *(_DWORD *)(v10 + 4) = v45;
          v46 = (v38 >> v45) & *(_DWORD *)(v10 + 40);
          v16[2].i32[1] = v46;
        }
        if (v46 == 3)
        {
          v51 = v36 + 8;
          *(_DWORD *)(v10 + 16) = v36 + 8;
          v52 = v45 - 6;
          if (v45 >= 6)
          {
            *(_DWORD *)(v10 + 4) = v52;
            v53 = (v38 >> v52) & *(_DWORD *)(v10 + 56);
            goto LABEL_58;
          }
          v58 = 6 - v45;
          v59 = v45 + 26;
          *(_DWORD *)(v10 + 4) = v45 + 26;
          v53 = (v38 << (6 - v45)) & *(_DWORD *)(v10 + 56);
          v16[3].i32[0] = v53;
          if (v51 <= *(_DWORD *)(v10 + 20))
          {
            v60 = *(_QWORD *)(v10 + 24);
            v61 = *(unsigned int *)(v10 + 8);
            *(_DWORD *)(v10 + 8) = v61 + 1;
            LODWORD(v60) = bswap32(*(_DWORD *)(v60 + 4 * v61));
            *(_DWORD *)v10 = v60;
            v53 |= *(_DWORD *)(v10 + 4 * v58 + 32) & (v60 >> v59);
LABEL_58:
            v16[3].i32[0] = v53;
          }
          else
          {
            ++*(_DWORD *)(v10 + 8);
            *(_DWORD *)v10 = 0;
          }
          v62.i64[0] = 0x100000001;
          v62.i64[1] = 0x100000001;
          *(int8x16_t *)&v16[3].u8[4] = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v53), (uint32x4_t)xmmword_228254740), v62);
          v16[5].i32[1] = (v53 >> 1) & 1;
          v16[6].i32[0] = v53 & 1;
          goto LABEL_60;
        }
      }
      *v134 = 0;
      v134[1] = 0;
      v134[2] = 0;
    }
    if (v162)
      goto LABEL_54;
LABEL_60:
    v54 = decodeCBPY(v10, v145[3]);
    v157 = 1;
LABEL_61:
    a5 = v158;
    *(_DWORD *)(v9 + 250) = v54;
    if (v54 == -99)
      return 6;
    v63 = *(char *)(v9 + 154);
    v64 = (uint32x2_t)vdup_n_s32(v54);
    if (*(_DWORD *)(v9 + 4 * v63 + 330))
    {
      *v141 = (v54 >> 3) & 1;
      *v16 = vand_s8((int8x8_t)vshl_u32(v64, (uint32x2_t)-2), (int8x8_t)0x100000001);
      v65 = v54 & 1;
    }
    else
    {
      *v141 = (v54 & 8) == 0;
      *v16 = vbic_s8((int8x8_t)0x100000001, (int8x8_t)vshl_u32(v64, (uint32x2_t)-2));
      v65 = (v54 & 1) == 0;
    }
    v16[1].i32[0] = v65;
    *(_BYTE *)(v9 + 155) = 0;
    if (*(_DWORD *)(v9 + 4 * v63 + 310))
    {
      if (v157)
      {
        v66 = *(_DWORD *)(v10 + 16) + 2;
        *(_DWORD *)(v10 + 16) = v66;
        v67 = *(unsigned int *)(v10 + 4);
        if (v67 < 2)
        {
          v73 = 2 - v67;
          v74 = v67 + 30;
          *(_DWORD *)(v10 + 4) = v67 + 30;
          v69 = (*(_DWORD *)v10 << (2 - v67)) & *(_DWORD *)(v10 + 40);
          if (v66 <= *(_DWORD *)(v10 + 20))
          {
            v75 = *(_QWORD *)(v10 + 24);
            v76 = *(unsigned int *)(v10 + 8);
            *(_DWORD *)(v10 + 8) = v76 + 1;
            LODWORD(v75) = bswap32(*(_DWORD *)(v75 + 4 * v76));
            *(_DWORD *)v10 = v75;
            v69 |= *(_DWORD *)(v10 + 4 * v73 + 32) & (v75 >> v74);
          }
          else
          {
            ++*(_DWORD *)(v10 + 8);
            *(_DWORD *)v10 = 0;
          }
        }
        else
        {
          v68 = v67 - 2;
          *(_DWORD *)(v10 + 4) = v68;
          v69 = (*(_DWORD *)v10 >> v68) & *(_DWORD *)(v10 + 40);
        }
        if (v69 >= 4)
          return 0xFFFFFFFFLL;
        v72 = 0x201FEFFu >> (8 * v69);
      }
      else
      {
        v71 = SD_Gobble(cdfDQuant, v10, v164);
        a5 = v158;
        v72 = tabDQuant[v71] - 2;
      }
      *(_BYTE *)(v9 + 155) = v72;
      v70 = *(_BYTE *)(v9 + 153) + v72;
      *(_BYTE *)(v9 + 153) = v70;
      if ((v70 - 1) > 0x1Eu)
        return 0xFFFFFFFFLL;
      *(_BYTE *)(v9 + 152) = v70;
    }
    else
    {
      v70 = *(_BYTE *)(v9 + 153);
    }
    *(_BYTE *)(*(_QWORD *)(v7 + 24)
             + (*(_DWORD *)(v8 + 24) + *(_DWORD *)(v14 + 20) * *(_DWORD *)(v8 + 20))
             + 136) = v70;
    *(_BYTE *)(v8 + 22 * *(unsigned int *)(v8 + 20) + *(unsigned int *)(v8 + 24) + 1656) = *(_BYTE *)(v9 + 153);
    if (v166[17] != 1)
      goto LABEL_179;
    v77 = *(char *)(v9 + 154);
    if (v77 > 4)
      return 0xFFFFFFFFLL;
    v159 = a5;
    if (v77 == 2)
    {
      v131 = a6;
      v94 = -4;
      v95 = 5473;
      v96 = v133;
      v148 = v15;
      while (1)
      {
        if (v157)
        {
          v97 = decodeMVD(v147, v145[4]);
          v98 = decodeMVD(v147, v145[4]);
          result = 7;
          if (v97 == -99 || v98 == -99)
            return result;
        }
        else
        {
          v97 = tabMVD[SD_Gobble(cdfMVD, v147, v164)];
          v98 = tabMVD[SD_Gobble(cdfMVD, v147, v164)];
        }
        v99 = pvx4(v13, (int)v94 + 5, *(_DWORD *)(v163 + 20), *(_DWORD *)(v163 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
        v100 = v13;
        v101 = v99;
        v102 = pvy4(v100, (int)v94 + 5, *(_DWORD *)(v163 + 20), *(_DWORD *)(v163 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
        v103 = v97 | 0xFFFFFFC0;
        if ((v97 & 0x20) == 0)
          v103 = v97;
        if ((v98 & 0x20) != 0)
          v104 = v98 | 0xFFFFFFC0;
        else
          v104 = v98;
        v105 = v101 + v103;
        *v96 = v101 + v103;
        v106 = v102 + v104;
        v96[6] = v102 + v104;
        if (v166[18])
        {
          v14 = a3;
          v107 = v156;
          v15 = v148;
          v9 = v149;
          v8 = v163;
          v16 = v150;
          if ((v101 + 31) >= 0x40)
          {
            v108 = (v105 << 26 >> 31) & 0xFFFFFFC0 | v105 & 0x3F;
            *v96 = v108;
            LOBYTE(v105) = v108;
            if (v101 > -32)
            {
              if (v108 < 0)
              {
                v109 = 64;
LABEL_130:
                v105 = v108 + v109;
                *v96 = v105;
              }
            }
            else if (v108 > 0)
            {
              v109 = -64;
              goto LABEL_130;
            }
          }
          if ((v102 + 31) >= 0x40)
          {
            v111 = (v106 << 26 >> 31) & 0xFFFFFFC0 | v106 & 0x3F;
            v96[6] = v111;
            v13 = a4;
            if (v102 > -32)
            {
              if (v106 << 26 >> 31 < 0)
              {
                v106 = v111 + 64;
                goto LABEL_139;
              }
            }
            else if (v111 >= 1)
            {
              v106 = v111 - 64;
              goto LABEL_139;
            }
            v106 = (v106 << 26 >> 31) & 0xFFFFFFC0 | v106 & 0x3F;
          }
          else
          {
            v13 = a4;
          }
          goto LABEL_140;
        }
        if (v105 < -32)
          break;
        v13 = a4;
        v14 = a3;
        v107 = v156;
        v15 = v148;
        v9 = v149;
        v8 = v163;
        v16 = v150;
        if (v105 >= 32)
        {
          v110 = -64;
          goto LABEL_123;
        }
LABEL_124:
        if (v106 <= -33)
        {
          v106 += 64;
LABEL_139:
          v96[6] = v106;
          goto LABEL_140;
        }
        if (v106 >= 32)
        {
          v106 -= 64;
          goto LABEL_139;
        }
LABEL_140:
        v112 = *(_DWORD *)(v8 + 20);
        v113 = *(_DWORD *)(v8 + 24);
        v114 = (_BYTE *)(v13 + v95 + 12 * (v113 + 1) + 288 * (v112 + 1));
        *(v114 - 1) = v105;
        *v114 = v106;
        ++v96;
        v95 += 5472;
        if (__CFADD__(v94++, 1))
        {
          a6 = v131;
          a5 = v159;
          v10 = v147;
          v7 = v107;
          goto LABEL_166;
        }
      }
      v110 = 64;
      v13 = a4;
      v14 = a3;
      v107 = v156;
      v15 = v148;
      v9 = v149;
      v8 = v163;
      v16 = v150;
LABEL_123:
      v105 += v110;
      *v96 = v105;
      goto LABEL_124;
    }
    if ((v77 - 3) > 1u || v166[22])
      break;
    v116 = 0;
    *v135 = 0;
    v135[1] = 0;
    v135[2] = 0;
    do
    {
      *(_DWORD *)(v132 + v116) = 0;
      v116 += 4;
    }
    while (v116 != 24);
    v112 = *(_DWORD *)(v8 + 20);
    v113 = *(_DWORD *)(v8 + 24);
    v117 = (_WORD *)(v13 + 288 * (v112 + 1) + 12 * (v113 + 1));
    v117[5472] = 0;
    *v117 = 0;
    v117[2736] = 0;
    v117[8208] = 0;
    v117[10944] = 0;
LABEL_166:
    if (v166[22] && (v16[2].i32[1] & 0xFFFFFFFE) == 2)
    {
      if (v157)
      {
        *(_DWORD *)(v9 + 218) = decodeMVD(v10, v145[4]);
        v120 = decodeMVD(v10, v145[4]);
        *(_DWORD *)(v9 + 242) = v120;
        v121 = *(_DWORD *)(v9 + 218);
        result = 7;
        if (v121 == -99 || v120 == -99)
          return result;
        a5 = v159;
        v14 = a3;
        v9 = v149;
        v16 = v150;
        v122 = v147;
        v8 = v163;
        if ((v121 & 0x20) == 0)
          goto LABEL_176;
      }
      else
      {
        *(_DWORD *)(v9 + 218) = tabMVD[SD_Gobble(cdfMVD, v10, v164)];
        v14 = a3;
        v122 = v10;
        v16 = v150;
        v120 = tabMVD[SD_Gobble(cdfMVD, v10, v164)];
        *(_DWORD *)(v9 + 242) = v120;
        v121 = *(_DWORD *)(v9 + 218);
        a5 = v159;
        if ((v121 & 0x20) == 0)
        {
LABEL_176:
          v7 = v156;
          v10 = v122;
          v13 = a4;
          if ((v120 & 0x20) != 0)
          {
            v120 |= 0xFFFFFFC0;
            *(_DWORD *)(v9 + 242) = v120;
          }
          v123 = (_BYTE *)(a4
                         + 288 * (*(_DWORD *)(v8 + 20) + 1)
                         + 12 * (*(_DWORD *)(v8 + 24) + 1)
                         + 27360);
          *v123 = v121;
          v123[1] = v120;
          goto LABEL_179;
        }
      }
      v121 |= 0xFFFFFFC0;
      *(_DWORD *)(v9 + 218) = v121;
      goto LABEL_176;
    }
    *(_WORD *)(v13 + 288 * (v112 + 1) + 12 * (v113 + 1) + 27360) = 0;
LABEL_179:
    if (v146)
      goto LABEL_180;
    v161 = a5;
    result = H263DMPR_MBS16(a1, v55, v56, v57, a5, a7);
    if ((_DWORD)result)
      return result;
    if (!a7)
      DumpDecoded263MB3S16(a1, v140, v139, v141);
    v7 = v156;
    a5 = v161;
    if (v166[22])
    {
      if (v16[2].i32[1] == 3)
      {
        result = H263DMPR_MB_pbS16(a1, v128, v129, v130, v161, a7);
        a5 = v161;
        if ((_DWORD)result)
          return result;
      }
    }
LABEL_188:
    ++v15;
    a5 += 2;
    a6 += 2;
    *(_DWORD *)(v8 + 24) = v15;
    if (v15 >= *(unsigned int *)(v14 + 20))
      return 0;
  }
  if (!v157)
  {
    v78 = tabMVD[SD_Gobble(cdfMVD, v10, v164)];
    v79 = tabMVD[SD_Gobble(cdfMVD, v10, v164)];
LABEL_88:
    if (v166[21])
    {
      v81 = pvx4(v13, 0, *(_DWORD *)(v8 + 20), *(_DWORD *)(v8 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
      v82 = v13;
      v83 = v81;
      v84 = pvy4(v82, 0, *(_DWORD *)(v8 + 20), *(_DWORD *)(v8 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
    }
    else
    {
      v85 = pvx(v13, *(_DWORD *)(v8 + 20), *(_DWORD *)(v8 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
      v86 = v13;
      v83 = v85;
      v84 = pvy(v86, *(_DWORD *)(v8 + 20), *(_DWORD *)(v8 + 24), *(__int16 *)(a2 + 4), *(_DWORD *)(a3 + 40));
    }
    v87 = v78 | 0xFFFFFFC0;
    if ((v78 & 0x20) == 0)
      v87 = v78;
    if ((v79 & 0x20) != 0)
      v88 = v79 | 0xFFFFFFC0;
    else
      v88 = v79;
    v89 = v83 + v87;
    v9 = v149;
    *(_DWORD *)(v149 + 198) = v83 + v87;
    v90 = v84 + v88;
    *(_DWORD *)(v149 + 222) = v84 + v88;
    v7 = v156;
    a5 = v159;
    if (v166[18])
    {
      v14 = a3;
      v16 = v150;
      if ((v83 + 31) < 0x40)
        goto LABEL_156;
      v91 = (v89 << 26 >> 31) & 0xFFFFFFC0 | v89 & 0x3F;
      *(_DWORD *)v135 = v91;
      LOBYTE(v89) = v91;
      if (v83 > -32)
      {
        if ((v91 & 0x80000000) == 0)
          goto LABEL_156;
        v92 = 64;
      }
      else
      {
        if (v91 <= 0)
          goto LABEL_156;
        v92 = -64;
      }
      v89 = v91 + v92;
      *(_DWORD *)v135 = v89;
LABEL_156:
      if ((v84 + 31) < 0x40)
      {
        v13 = a4;
        goto LABEL_165;
      }
      v118 = (v90 << 26 >> 31) & 0xFFFFFFC0 | v90 & 0x3F;
      *(_DWORD *)(v149 + 222) = v118;
      v13 = a4;
      if (v84 > -32)
      {
        if (v90 << 26 >> 31 < 0)
        {
          v90 = v118 + 64;
          goto LABEL_164;
        }
      }
      else if (v118 >= 1)
      {
        v90 = v118 - 64;
        goto LABEL_164;
      }
      v90 = (v90 << 26 >> 31) & 0xFFFFFFC0 | v90 & 0x3F;
      goto LABEL_165;
    }
    v14 = a3;
    if (v89 >= -32)
    {
      v13 = a4;
      v16 = v150;
      if (v89 < 32)
        goto LABEL_149;
      v93 = -64;
    }
    else
    {
      v93 = 64;
      v13 = a4;
      v16 = v150;
    }
    v89 += v93;
    *(_DWORD *)v135 = v89;
LABEL_149:
    if (v90 > -33)
    {
      if (v90 < 32)
      {
LABEL_165:
        v112 = *(_DWORD *)(v8 + 20);
        v113 = *(_DWORD *)(v8 + 24);
        v119 = (_BYTE *)(v13 + 288 * (v112 + 1) + 12 * (v113 + 1));
        *v119 = v89;
        v119[1] = v90;
        v119[5472] = v89;
        v119[5473] = v90;
        v119[10944] = v89;
        v119[10945] = v90;
        v119[16416] = v89;
        v119[16417] = v90;
        v119 += 21888;
        *v119 = v89;
        v119[1] = v90;
        goto LABEL_166;
      }
      v90 -= 64;
    }
    else
    {
      v90 += 64;
    }
LABEL_164:
    *(_DWORD *)(v149 + 222) = v90;
    goto LABEL_165;
  }
  v78 = decodeMVD(v10, v145[4]);
  v79 = decodeMVD(v10, v145[4]);
  result = 7;
  if (v78 != -99 && v79 != -99)
  {
    v10 = v147;
    v8 = v163;
    goto LABEL_88;
  }
  return result;
}

int **dealWithMBOnError(int **result, uint64_t a2, _QWORD *a3, _QWORD *a4, int a5, int a6, signed int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  int *v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
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
  unsigned int v39;
  __int16 v40;
  int *v41;
  uint64_t v42;
  int **v43;

  v43 = result;
  if (a6 >= 1)
  {
    v13 = 0;
    v14 = *result;
    v41 = &(*result)[a5 + 47];
    v42 = a5;
    if (a8 == 1)
      v15 = 0;
    else
      v15 = 3;
    v40 = v15;
    if (a7 >= 0)
      v16 = a7;
    else
      v16 = a7 + 1;
    v39 = v16 >> 1;
    v38 = 12 * a6;
    v17 = a2 + 288 * (a5 + 1);
    v18 = a10 + 1;
    v35 = v17 + 10956;
    v36 = v17 + 5484;
    v34 = v17 + 10957;
    v33 = v17 + 16428;
    v19 = a9 + 1;
    v32 = v17 + 21900;
    v31 = v17 + 21901;
    v37 = v17;
    v30 = v17 + 27373;
    v20 = *result;
    do
    {
      v21 = v20[19] + (uint64_t)v14[v42];
      v22 = v20[85] + (uint64_t)*v41;
      v23 = v37 + v13;
      *(_WORD *)(v23 + 12) = 0;
      *(_WORD *)(v36 + v13) = 0;
      *(_WORD *)(v33 + v13) = 0;
      *(_WORD *)(v30 + v13 - 1) = 0;
      v24 = v14[42] + v21;
      v25 = *a3 + v24;
      v26 = *a4 + v24;
      *(_BYTE *)(v35 + v13) = 0;
      *(_BYTE *)(v34 + v13) = 0;
      *(_BYTE *)(v32 + v13) = 0;
      *(_BYTE *)(v31 + v13) = 0;
      *((_BYTE *)v43 + 154) = v40;
      *(_WORD *)(v23 + 14) = v40;
      Copy8x8(v25, v26, a7);
      v27 = v14[43] + (uint64_t)(int)v21;
      Copy8x8(*a3 + v27, *a4 + v27, a7);
      v28 = v14[44] + (uint64_t)(int)v21;
      Copy8x8(*a3 + v28, *a4 + v28, a7);
      v29 = v14[45] + (uint64_t)(int)v21;
      Copy8x8(*a3 + v29, *a4 + v29, a7);
      Copy8x8(a3[1] + v22, a4[1] + v22, v39);
      result = (int **)Copy8x8(a3[2] + v22, a4[2] + v22, v39);
      *(_WORD *)(v19 - 1) = 257;
      *(_WORD *)(v18 - 1) = 257;
      ++v20;
      v13 += 12;
      v18 += 2;
      v19 += 2;
    }
    while (v38 != v13);
  }
  return result;
}

uint64_t H263DMPR_MBS16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int *v11;
  int v12;
  int16x8_t v13;
  uint64_t v14;
  int16x8_t *v15;
  int16x8_t **v16;
  int16x8_t *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  __int16 *v65;
  uint64_t v66;
  uint64_t v67;
  _WORD *v68;
  __int16 **v69;
  _WORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  unint64_t v79;
  uint64_t v80;
  _DWORD *v81;
  uint64_t v82;
  unsigned int *v83;
  unsigned int *v84;
  unsigned int *v85;
  uint64_t *v86;
  uint64_t v87;
  char *v88;
  int v89;

  v6 = a6;
  v7 = 0;
  v8 = *(_QWORD *)(a1 + 296182);
  v10 = *(_QWORD *)(a1 + 296230);
  v9 = *(_QWORD **)(a1 + 296238);
  v11 = (int *)(a1 + 296154);
  v87 = v9[6];
  v12 = *(_DWORD *)(v8 + 4 * *(char *)(v8 + 154) + 330);
  v85 = (unsigned int *)((char *)&cdfLast + 12 * v12);
  v76 = v9[4];
  v86 = (uint64_t *)v9[5];
  v84 = (unsigned int *)((char *)&cdfRun + 260 * v12);
  v89 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 296214) + 19);
  v83 = (unsigned int *)((char *)&cdfLevel + 1020 * v12);
  v13 = 0uLL;
  v88 = (char *)&cdfTCoef + 1664 * v12;
  v77 = v8;
  while (1)
  {
    v14 = v8 + 8 * v7;
    v17 = *(int16x8_t **)(v14 + 8);
    v16 = (int16x8_t **)(v14 + 8);
    v15 = v17;
    v17[6] = v13;
    v17[7] = v13;
    v17[4] = v13;
    v17[5] = v13;
    v17[2] = v13;
    v17[3] = v13;
    *v17 = v13;
    v17[1] = v13;
    if (*(_DWORD *)(v8 + 4 * *(char *)(v8 + 154) + 330))
      break;
    v21 = 0;
LABEL_17:
    v81 = (_DWORD *)(v8 + 4 * v7 + 254);
    if (!*v81)
    {
      v32 = 0;
      v31 = 0;
      if (!v6)
        goto LABEL_61;
      goto LABEL_81;
    }
    v79 = v7;
    v30 = 0;
    LODWORD(v31) = 0;
    LODWORD(v32) = 0;
    v33 = v87;
    do
    {
      if (v89)
      {
        v34 = SD_Gobble((unsigned int *)&v88[416 * v30], v10, v11);
        if (v34 == 102)
        {
          v35 = tabLast[SD_Gobble(v85, v10, v11)];
          v36 = tabRun[SD_Gobble(v84, v10, v11)];
          LOBYTE(v37) = ctabLevel[SD_Gobble(v83, v10, v11)];
        }
        else
        {
          v39 = tabTCoef[v34];
          v40 = v39 & 0xF;
          v35 = (v39 >> 12) & 1;
          v36 = (v39 >> 4);
          if (SD_Gobble(cdfSign, v10, v11))
            v37 = -v40;
          else
            LOBYTE(v37) = v40;
          v33 = v87;
        }
        v30 -= v30 > 2;
LABEL_32:
        v13 = 0uLL;
        goto LABEL_33;
      }
      v38 = decodeTC(v10, *v86);
      if (v38 != 6913)
      {
        if ((unsigned __int16)v38 == 65437)
          return 9;
        v35 = (v38 >> 7) & 1;
        v37 = v38 & 0xF;
        if ((v38 & 0x40) != 0)
          v37 = -v37;
        v36 = v38 >> 8;
        goto LABEL_32;
      }
      v45 = *(_DWORD *)(v10 + 16);
      *(_DWORD *)(v10 + 16) = v45 + 1;
      v46 = *(_DWORD *)(v10 + 4);
      if (v46)
      {
        v47 = *(_DWORD *)v10;
        v48 = v46 - 1;
        v35 = (*(_DWORD *)v10 >> (v46 - 1)) & 1;
        *(_DWORD *)(v10 + 16) = v45 + 7;
        v13 = 0uLL;
        if ((v46 - 1) <= 5)
        {
          v49 = 7 - v46;
          v50 = v46 + 25;
          *(_DWORD *)(v10 + 4) = v50;
          v36 = (v47 << v49) & *(_DWORD *)(v10 + 56);
          if ((v45 + 7) <= *(_DWORD *)(v10 + 20))
          {
            v59 = *(_QWORD *)(v10 + 24);
            v60 = *(unsigned int *)(v10 + 8);
            *(_DWORD *)(v10 + 8) = v60 + 1;
            v47 = bswap32(*(_DWORD *)(v59 + 4 * v60));
            *(_DWORD *)v10 = v47;
            v36 |= *(_DWORD *)(v10 + 4 * v49 + 32) & (v47 >> v50);
          }
          else
          {
            v47 = 0;
            ++*(_DWORD *)(v10 + 8);
            *(_DWORD *)v10 = 0;
          }
          *(_DWORD *)(v10 + 16) = v45 + 15;
LABEL_57:
          *(_DWORD *)(v10 + 4) = v50 - 8;
          v37 = (v47 >> (v50 - 8)) & *(_DWORD *)(v10 + 64);
          goto LABEL_33;
        }
      }
      else
      {
        *(_DWORD *)(v10 + 4) = 31;
        v13 = 0uLL;
        if ((v45 + 1) <= *(_DWORD *)(v10 + 20))
        {
          v51 = *(_QWORD *)(v10 + 24);
          v52 = *(unsigned int *)(v10 + 8);
          *(_DWORD *)(v10 + 8) = v52 + 1;
          v47 = bswap32(*(_DWORD *)(v51 + 4 * v52));
          v35 = v47 >> 31;
        }
        else
        {
          v47 = 0;
          v35 = 0;
          ++*(_DWORD *)(v10 + 8);
        }
        *(_DWORD *)v10 = v47;
        v48 = 31;
      }
      v50 = v48 - 6;
      v36 = (v47 >> (v48 - 6)) & *(_DWORD *)(v10 + 56);
      v53 = v45 + 15;
      *(_DWORD *)(v10 + 16) = v45 + 15;
      if ((v48 - 6) >= 8)
        goto LABEL_57;
      v54 = 14 - v48;
      v55 = v48 + 18;
      *(_DWORD *)(v10 + 4) = v48 + 18;
      v37 = (v47 << (14 - v48)) & *(_DWORD *)(v10 + 64);
      if (v53 <= *(_DWORD *)(v10 + 20))
      {
        v57 = *(_QWORD *)(v10 + 24);
        v58 = *(unsigned int *)(v10 + 8);
        *(_DWORD *)(v10 + 8) = v58 + 1;
        v56 = bswap32(*(_DWORD *)(v57 + 4 * v58));
        v37 = *(_DWORD *)(v10 + 4 * v54 + 32) & (v56 >> v55) | (char)v37;
      }
      else
      {
        v56 = 0;
        ++*(_DWORD *)(v10 + 8);
      }
      *(_DWORD *)v10 = v56;
LABEL_33:
      v41 = v36 + v21;
      if (v36 + v21 > 63)
        return 9;
      v42 = v33 + 4 * v41;
      v43 = *(_DWORD *)(v42 + 1532);
      if (v43 <= (int)v32)
        v32 = v32;
      else
        v32 = v43;
      v44 = *(_DWORD *)(v42 + 1788);
      if (v44 <= (int)v31)
        v31 = v31;
      else
        v31 = v44;
      v15 = *v16;
      v21 = v41 + 1;
      (*v16)->i16[v41] = (char)v37;
      ++v30;
    }
    while (!v35);
    v6 = a6;
    v7 = v79;
    v8 = v77;
    if (a6)
      goto LABEL_81;
LABEL_61:
    if (*v81 || *(_DWORD *)(v8 + 4 * *(char *)(v8 + 154) + 330))
    {
      v61 = 152;
      if (v7 < 4)
        v61 = 153;
      v62 = *(char *)(v8 + v61);
      if (v21 == 1)
      {
        Mr_LaForgeS16(v15->i16[0], (uint64_t)v15, *(_DWORD *)(v8 + 4 * *(char *)(v8 + 154) + 330), v62);
        goto LABEL_80;
      }
      v63 = v8;
      v64 = ((_DWORD)v62 << 8) | 0x80;
      if ((int)v32 <= 0 && (int)v31 < 3)
      {
        v65 = *(__int16 **)(v63 + 8 * v7 + 56);
        *v65 = v15->i16[0];
        v65[1] = v15->i16[1];
        v65[2] = v15->i16[5];
        v66 = v76 + 4 * v64;
        v8 = v63;
        iRowCol1x3fS16(v65, v15, v62, *(_DWORD *)(v63 + 4 * *(char *)(v63 + 154) + 330), v66 + 68608, v66 + 34816);
        goto LABEL_80;
      }
      v67 = v63 + 8 * v7;
      v70 = *(_WORD **)(v67 + 56);
      v69 = (__int16 **)(v67 + 56);
      v68 = v70;
      if ((int)v32 <= 3 && (int)v31 <= 3)
      {
        IZigZagBlock4x4S16(v15, v68);
        v71 = v76 + 4 * v64;
        v8 = v63;
        iRowCol4x4f1S16(*v69, *v16, v62, *(_DWORD *)(v63 + 4 * *(char *)(v63 + 154) + 330), v32, v31, v71 + 68608, v71 + 34816);
        goto LABEL_75;
      }
      v72 = v76 + 4 * v64;
      if ((int)v32 > 3)
      {
        v82 = v72 + 68608;
        v80 = v72 + 34816;
        if ((int)v31 > 3)
        {
          IZigZagBlock8x8S16(v15, v68);
          v8 = v63;
          iDct8x8fS16((uint64_t)*v69, *v16, v62, *(_DWORD *)(v63 + 4 * *(char *)(v63 + 154) + 330), v32, v31, v82, v80);
        }
        else
        {
          IZigZagBlock8x4S16(v15, v68);
          v8 = v63;
          iColRow8x4fS16((uint64_t)*v69, *v16, v62, *(_DWORD *)(v63 + 4 * *(char *)(v63 + 154) + 330), v32, v31, v82, v80);
        }
        v6 = a6;
LABEL_80:
        v13 = 0uLL;
      }
      else
      {
        IZigZagBlock4x8S16(v15, v68);
        v73 = v72 + 68608;
        v74 = v72 + 34816;
        v8 = v63;
        iRowCol4x8f1S16(*v69, *v16, v62, *(_DWORD *)(v63 + 4 * *(char *)(v63 + 154) + 330), v32, v31, v73, v74);
LABEL_75:
        v13 = 0uLL;
        v6 = a6;
      }
    }
LABEL_81:
    if (++v7 == 6)
      return 0;
  }
  if (v89)
  {
    v18 = SD_Gobble(cdfIntraDC, v10, v11);
    v13 = 0uLL;
    v19 = tabIntraDC[v18];
    v20 = (unsigned __int16)v19;
    v15 = *v16;
  }
  else
  {
    v22 = *(_DWORD *)(v10 + 16) + 8;
    *(_DWORD *)(v10 + 16) = v22;
    v23 = *(unsigned int *)(v10 + 4);
    if (v23 < 8)
    {
      v24 = 8 - v23;
      v25 = v23 + 24;
      *(_DWORD *)(v10 + 4) = v25;
      v26 = (*(_DWORD *)v10 << v24) & *(_DWORD *)(v10 + 64);
      v15->i16[0] = (*(_WORD *)v10 << v24) & *(_WORD *)(v10 + 64);
      if (v22 > *(_DWORD *)(v10 + 20))
      {
        v20 = (unsigned __int16)v26;
        ++*(_DWORD *)(v10 + 8);
        *(_DWORD *)v10 = 0;
        goto LABEL_13;
      }
      v27 = *(_QWORD *)(v10 + 24);
      v28 = *(unsigned int *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = v28 + 1;
      LODWORD(v27) = bswap32(*(_DWORD *)(v27 + 4 * v28));
      *(_DWORD *)v10 = v27;
      v19 = *(_DWORD *)(v10 + 4 * v24 + 32) & (v27 >> v25) | v26;
    }
    else
    {
      *(_DWORD *)(v10 + 4) = v23 - 8;
      v19 = (*(_DWORD *)v10 >> (v23 - 8)) & *(_DWORD *)(v10 + 64);
    }
    v20 = (unsigned __int16)v19;
  }
  v15->i16[0] = v19;
LABEL_13:
  v29 = v20 - 255;
  if (!v29)
  {
    v15->i16[0] = 128;
LABEL_16:
    v21 = 1;
    goto LABEL_17;
  }
  if (v29 >= 0xFFFFFF02)
    goto LABEL_16;
  return 8;
}

uint64_t H263DMPR_MB_pbS16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  unsigned int *v11;
  int16x8_t v12;
  uint64_t v13;
  int16x8_t *v14;
  __int16 *v15;
  int v16;
  uint64_t v17;
  signed int v18;
  int v19;
  int16x8_t *v20;
  int v21;
  unsigned int *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  signed int v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int *v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  __int16 *v65;
  _DWORD *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t *v69;
  int16x8_t *v70;
  uint64_t v71;
  int v72;

  v6 = 0;
  v7 = *(_QWORD *)(a1 + 296182);
  v9 = *(_QWORD *)(a1 + 296230);
  v8 = *(_QWORD **)(a1 + 296238);
  v71 = v8[6];
  v62 = v8[4];
  v63 = v7;
  v69 = (uint64_t *)v8[5];
  v10 = (int *)(a1 + 296154);
  v72 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 296214) + 19);
  v11 = (unsigned int *)&cdfTCoef;
  v12 = 0uLL;
  while (1)
  {
    v13 = v7 + 8 * v6;
    v14 = *(int16x8_t **)(v13 + 8);
    v15 = *(__int16 **)(v13 + 56);
    v14[6] = v12;
    v14[7] = v12;
    v14[4] = v12;
    v14[5] = v12;
    v14[2] = v12;
    v14[3] = v12;
    *v14 = v12;
    v14[1] = v12;
    v70 = v14;
    v66 = (_DWORD *)(v7 + 4 * v6 + 286);
    v68 = v6;
    v65 = v15;
    if (*v66)
      break;
    v19 = 0;
    v18 = 0;
    v17 = 0;
LABEL_42:
    v7 = v63;
    if (a6 || !*v66)
      goto LABEL_43;
    v55 = 152;
    if (v68 < 4)
      v55 = 153;
    v56 = *(char *)(v63 + v55);
    if (v19 == 1)
    {
      Mr_LaForgeS16(v70->i16[0], (uint64_t)v70, 0, *(char *)(v63 + v55));
    }
    else
    {
      v57 = v11;
      v58 = ((_DWORD)v56 << 8) | 0x80;
      if (v18 <= 0 && (int)v17 < 3)
      {
        *v65 = v70->i16[0];
        v65[1] = v70->i16[1];
        v65[2] = v70->i16[5];
        iRowCol1x3fS16(v65, v70, v56, 0, v62 + 4 * v58 + 68608, v62 + 4 * v58 + 34816);
LABEL_57:
        v12 = 0uLL;
        v11 = v57;
        goto LABEL_43;
      }
      if (v18 <= 3 && (int)v17 <= 3)
      {
        IZigZagBlock4x4S16(v70, v65);
        iRowCol4x4f1S16(v65, v70, v56, 0, v18, v17, v62 + 4 * v58 + 68608, v62 + 4 * v58 + 34816);
        goto LABEL_57;
      }
      v59 = v62 + 4 * v58;
      v60 = v59 + 68608;
      v67 = v59 + 34816;
      v11 = v57;
      if (v18 > 3)
      {
        IZigZagBlock8x8S16(v70, v65);
        iRowCol8x8f1S16(v65, v70, v56, 0, v18, v17, v60, v67);
      }
      else
      {
        IZigZagBlock4x8S16(v70, v65);
        iRowCol4x8f1S16(v65, v70, v56, 0, v18, v17, v60, v67);
      }
    }
    v12 = 0uLL;
LABEL_43:
    v6 = v68 + 1;
    if (v68 == 5)
      return 0;
  }
  v16 = 0;
  LODWORD(v17) = 0;
  v18 = 0;
  v19 = 0;
  v20 = v14;
  while (1)
  {
    if (v72)
    {
      v21 = SD_Gobble(&v11[104 * v16], v9, v10);
      if (v21 == 102)
      {
        v22 = v11;
        v23 = v19;
        v24 = tabLast[SD_Gobble(cdfLast, v9, v10)];
        v25 = tabRun[SD_Gobble(cdfRun, v9, v10)];
        v26 = SD_Gobble(cdfLevel, v9, v10);
        v27 = v24;
        v19 = v23;
        v11 = v22;
        LOBYTE(v28) = ctabLevel[v26];
      }
      else
      {
        v30 = tabTCoef[v21];
        v31 = v30 & 0xF;
        v32 = v19;
        v33 = (v30 >> 12) & 1;
        v25 = (v30 >> 4);
        v34 = SD_Gobble(cdfSign, v9, v10);
        v27 = v33;
        v19 = v32;
        if (v34)
          v28 = -v31;
        else
          LOBYTE(v28) = v31;
        v11 = (unsigned int *)&cdfTCoef;
        v20 = v70;
      }
      v12 = 0uLL;
      v16 -= v16 > 2;
    }
    else
    {
      v29 = decodeTC(v9, *v69);
      if (v29 == 6913)
      {
        v39 = *(_DWORD *)(v9 + 16);
        *(_DWORD *)(v9 + 16) = v39 + 1;
        v40 = *(_DWORD *)(v9 + 4);
        if (v40)
        {
          v41 = *(_DWORD *)v9;
          v42 = v40 - 1;
          v27 = (*(_DWORD *)v9 >> (v40 - 1)) & 1;
          *(_DWORD *)(v9 + 16) = v39 + 7;
          v12 = 0uLL;
          if ((v40 - 1) <= 5)
          {
            v43 = 7 - v40;
            v44 = v40 + 25;
            *(_DWORD *)(v9 + 4) = v44;
            v25 = (v41 << v43) & *(_DWORD *)(v9 + 56);
            if ((v39 + 7) <= *(_DWORD *)(v9 + 20))
            {
              v53 = *(_QWORD *)(v9 + 24);
              v54 = *(unsigned int *)(v9 + 8);
              *(_DWORD *)(v9 + 8) = v54 + 1;
              v41 = bswap32(*(_DWORD *)(v53 + 4 * v54));
              *(_DWORD *)v9 = v41;
              v25 |= *(_DWORD *)(v9 + 4 * v43 + 32) & (v41 >> v44);
            }
            else
            {
              v41 = 0;
              ++*(_DWORD *)(v9 + 8);
              *(_DWORD *)v9 = 0;
            }
            *(_DWORD *)(v9 + 16) = v39 + 15;
LABEL_40:
            *(_DWORD *)(v9 + 4) = v44 - 8;
            v28 = (v41 >> (v44 - 8)) & *(_DWORD *)(v9 + 64);
            goto LABEL_17;
          }
        }
        else
        {
          *(_DWORD *)(v9 + 4) = 31;
          v12 = 0uLL;
          if ((v39 + 1) <= *(_DWORD *)(v9 + 20))
          {
            v45 = *(_QWORD *)(v9 + 24);
            v46 = *(unsigned int *)(v9 + 8);
            *(_DWORD *)(v9 + 8) = v46 + 1;
            v41 = bswap32(*(_DWORD *)(v45 + 4 * v46));
            v27 = v41 >> 31;
          }
          else
          {
            v41 = 0;
            v27 = 0;
            ++*(_DWORD *)(v9 + 8);
          }
          *(_DWORD *)v9 = v41;
          v42 = 31;
        }
        v44 = v42 - 6;
        v25 = (v41 >> (v42 - 6)) & *(_DWORD *)(v9 + 56);
        v47 = v39 + 15;
        *(_DWORD *)(v9 + 16) = v39 + 15;
        if ((v42 - 6) >= 8)
          goto LABEL_40;
        v48 = 14 - v42;
        v49 = v42 + 18;
        *(_DWORD *)(v9 + 4) = v42 + 18;
        v28 = (v41 << (14 - v42)) & *(_DWORD *)(v9 + 64);
        if (v47 <= *(_DWORD *)(v9 + 20))
        {
          v51 = *(_QWORD *)(v9 + 24);
          v52 = *(unsigned int *)(v9 + 8);
          *(_DWORD *)(v9 + 8) = v52 + 1;
          v50 = bswap32(*(_DWORD *)(v51 + 4 * v52));
          v28 = *(_DWORD *)(v9 + 4 * v48 + 32) & (v50 >> v49) | (char)v28;
        }
        else
        {
          v50 = 0;
          ++*(_DWORD *)(v9 + 8);
        }
        *(_DWORD *)v9 = v50;
      }
      else
      {
        if ((unsigned __int16)v29 == 65437)
          return 9;
        v27 = (v29 >> 7) & 1;
        v28 = v29 & 0xF;
        if ((v29 & 0x40) != 0)
          v28 = -v28;
        v25 = v29 >> 8;
        v12 = 0uLL;
      }
    }
LABEL_17:
    v35 = v25 + v19;
    if (v25 + v19 > 63)
      return 9;
    v36 = v71 + 4 * v35;
    v37 = *(_DWORD *)(v36 + 1788);
    if (v37 <= (int)v17)
      v17 = v17;
    else
      v17 = v37;
    v38 = *(_DWORD *)(v36 + 1532);
    if (v38 > v18)
      v18 = v38;
    v19 = v35 + 1;
    v20->i16[v35] = (char)v28;
    ++v16;
    if (v27)
      goto LABEL_42;
  }
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
  memset_pattern16(v2, &unk_228257AE0, 0x800uLL);
  for (i = 0; i != 1024; i += 16)
    *(_OWORD *)&v4[i] = 0uLL;
  v6 = &word_2282573C4;
  v7 = (__int16 *)&unk_2282573C6;
  v8 = &word_2282573C8;
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
  memset_pattern16(v17, &unk_228257AE0, 0x400uLL);
  for (j = 0; j != 512; j += 16)
    *(_OWORD *)&v18[j] = 0uLL;
  v20 = &word_22825769C;
  v21 = (__int16 *)&unk_22825769E;
  v22 = &word_2282576A0;
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
  v4 = &word_2282578DA;
  v5 = (__int16 *)&unk_2282578DC;
  v6 = &word_2282578DE;
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
  v4 = &word_228257942;
  v5 = (__int16 *)&unk_228257944;
  v6 = &word_228257946;
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
  v4 = &word_2282578A2;
  v5 = (__int16 *)&unk_2282578A4;
  v6 = &word_2282578A6;
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
  v5 = &word_2282579AA;
  v6 = (__int16 *)&unk_2282579AC;
  v7 = &word_2282579AE;
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
      *(_BYTE *)(*a1 + i) = byte_228257143[i];
      *(_BYTE *)(*a1 + i + 64) = byte_228257183[i];
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
      v7 = byte_2282571C3[v6 + 4];
      v8 = byte_2282571C3[v6];
      v9 = byte_2282571C3[v6 + 1];
      v10 = byte_2282571C3[v6 + 2];
      *(_BYTE *)(*(_QWORD *)(*a1 + (v8 << 9) + 8 * v9 + 0x10000) + v10) = 2 * v7;
      *(_BYTE *)(*(_QWORD *)(*a1 + (v8 << 9) + 8 * v9 + 0x10000) - v10) = (2 * v7) | 1;
      v11 = byte_2282571C3[v6 + 3];
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

uint64_t decodeTC(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  __int16 *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v25;

  v2 = *(_DWORD *)(a1 + 16);
  v3 = v2 + 10;
  *(_DWORD *)(a1 + 16) = v2 + 10;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 0xA)
  {
    v8 = 10 - v4;
    v5 = v4 + 22;
    *(_DWORD *)(a1 + 4) = v4 + 22;
    v7 = (*(_DWORD *)a1 << (10 - v4)) & *(_DWORD *)(a1 + 72);
    if (v3 <= *(_DWORD *)(a1 + 20))
    {
      v9 = *(_QWORD *)(a1 + 24);
      v10 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v10 + 1;
      v6 = bswap32(*(_DWORD *)(v9 + 4 * v10));
      *(_DWORD *)a1 = v6;
      v7 |= *(_DWORD *)(a1 + 4 * v8 + 32) & (v6 >> v5);
    }
    else
    {
      v6 = 0;
      ++*(_DWORD *)(a1 + 8);
      *(_DWORD *)a1 = 0;
    }
  }
  else
  {
    v5 = v4 - 10;
    *(_DWORD *)(a1 + 4) = v4 - 10;
    v6 = *(_DWORD *)a1;
    v7 = (*(_DWORD *)a1 >> (v4 - 10)) & *(_DWORD *)(a1 + 72);
  }
  if (v7 < 34)
  {
    v17 = v2 + 13;
    *(_DWORD *)(a1 + 16) = v2 + 13;
    v18 = v5 - 3;
    if (v5 < 3)
    {
      v20 = 3 - v5;
      v18 = v5 + 29;
      *(_DWORD *)(a1 + 4) = v5 + 29;
      v19 = (v6 << (3 - v5)) & *(_DWORD *)(a1 + 44);
      if (v17 <= *(_DWORD *)(a1 + 20))
      {
        v21 = *(_QWORD *)(a1 + 24);
        v22 = *(unsigned int *)(a1 + 8);
        *(_DWORD *)(a1 + 8) = v22 + 1;
        LODWORD(v21) = bswap32(*(_DWORD *)(v21 + 4 * v22));
        *(_DWORD *)a1 = v21;
        v19 |= *(_DWORD *)(a1 + 4 * v20 + 32) & (v21 >> v18);
      }
      else
      {
        ++*(_DWORD *)(a1 + 8);
        *(_DWORD *)a1 = 0;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 4) = v18;
      v19 = (v6 >> v18) & *(_DWORD *)(a1 + 44);
    }
    v23 = ((unsigned __int16)v19 | (unsigned __int16)(8 * v7)) & 0x1FF;
    v24 = v18 + *(char *)(a2 + v23 + 4096);
    *(_DWORD *)(a1 + 4) = v24;
    *(_DWORD *)(a1 + 16) = v17 - *(char *)(a2 + v23 + 4096);
    if (v24 >= 0x21)
    {
      v25 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 4) = v24 - 32;
      *(_DWORD *)(a1 + 8) = v25 - 1;
      if (*(_DWORD *)(a1 + 20) >= (32 * (v25 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v25 - 2)));
    }
    v16 = (__int16 *)(a2 + 2 * v23 + 3072);
  }
  else
  {
    v11 = v7;
    v12 = a2 + v7;
    v13 = v5 + *(char *)(v12 + 2048);
    *(_DWORD *)(a1 + 4) = v13;
    *(_DWORD *)(a1 + 16) = v3 - *(char *)(v12 + 2048);
    if (v13 >= 0x21)
    {
      v14 = v13 - 32;
      v15 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 4) = v14;
      *(_DWORD *)(a1 + 8) = v15 - 1;
      if (*(_DWORD *)(a1 + 20) >= (32 * (v15 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v15 - 2)));
    }
    v16 = (__int16 *)(a2 + 2 * v11);
  }
  return *v16;
}

uint64_t decodeMCBPCINTRA(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_DWORD *)(a1 + 16);
  v3 = v2 + 6;
  *(_DWORD *)(a1 + 16) = v2 + 6;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 6)
  {
    v8 = 6 - v4;
    v5 = v4 + 26;
    *(_DWORD *)(a1 + 4) = v5;
    v7 = (*(_DWORD *)a1 << v8) & *(_DWORD *)(a1 + 56);
    if (v3 <= *(_DWORD *)(a1 + 20))
    {
      v9 = *(_QWORD *)(a1 + 24);
      v10 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v10 + 1;
      v6 = bswap32(*(_DWORD *)(v9 + 4 * v10));
      *(_DWORD *)a1 = v6;
      v7 |= *(_DWORD *)(a1 + 4 * v8 + 32) & (v6 >> v5);
    }
    else
    {
      v6 = 0;
      ++*(_DWORD *)(a1 + 8);
      *(_DWORD *)a1 = 0;
    }
  }
  else
  {
    v5 = v4 - 6;
    *(_DWORD *)(a1 + 4) = v5;
    v6 = *(_DWORD *)a1;
    v7 = (*(_DWORD *)a1 >> v5) & *(_DWORD *)(a1 + 56);
  }
  if (v7 < 1)
  {
    v15 = v2 + 9;
    *(_DWORD *)(a1 + 16) = v2 + 9;
    v16 = v5 - 3;
    if (v5 < 3)
    {
      v18 = 3 - v5;
      v19 = v5 + 29;
      *(_DWORD *)(a1 + 4) = v5 + 29;
      v17 = (v6 << (3 - v5)) & *(_DWORD *)(a1 + 44);
      if (v15 <= *(_DWORD *)(a1 + 20))
      {
        v20 = *(_QWORD *)(a1 + 24);
        v21 = *(unsigned int *)(a1 + 8);
        *(_DWORD *)(a1 + 8) = v21 + 1;
        LODWORD(v20) = bswap32(*(_DWORD *)(v20 + 4 * v21));
        *(_DWORD *)a1 = v20;
        v17 |= *(_DWORD *)(a1 + 4 * v18 + 32) & (v20 >> v19);
      }
      else
      {
        ++*(_DWORD *)(a1 + 8);
        *(_DWORD *)a1 = 0;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 4) = v16;
      v17 = (v6 >> v16) & *(_DWORD *)(a1 + 44);
    }
    if (v17 == 1)
      return 8;
    else
      return 4294967197;
  }
  else
  {
    v11 = a2 + v7;
    v12 = v5 + *(char *)(v11 + 64);
    *(_DWORD *)(a1 + 4) = v12;
    *(_DWORD *)(a1 + 16) = v3 - *(char *)(v11 + 64);
    if (v12 >= 0x21)
    {
      v13 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 4) = v12 - 32;
      *(_DWORD *)(a1 + 8) = v13 - 1;
      if (*(_DWORD *)(a1 + 20) >= (32 * (v13 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v13 - 2)));
    }
    return *(char *)(a2 + v7);
  }
}

uint64_t decodeMCBPCINTER(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  unsigned int v22;

  v2 = *(_DWORD *)(a1 + 16);
  v3 = v2 + 8;
  *(_DWORD *)(a1 + 16) = v2 + 8;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 8)
  {
    v8 = 8 - v4;
    v5 = v4 + 24;
    *(_DWORD *)(a1 + 4) = v4 + 24;
    v7 = (*(_DWORD *)a1 << (8 - v4)) & *(_DWORD *)(a1 + 64);
    if (v3 <= *(_DWORD *)(a1 + 20))
    {
      v9 = *(_QWORD *)(a1 + 24);
      v10 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v10 + 1;
      v6 = bswap32(*(_DWORD *)(v9 + 4 * v10));
      *(_DWORD *)a1 = v6;
      v7 |= *(_DWORD *)(a1 + 4 * v8 + 32) & (v6 >> v5);
    }
    else
    {
      v6 = 0;
      ++*(_DWORD *)(a1 + 8);
      *(_DWORD *)a1 = 0;
    }
  }
  else
  {
    v5 = v4 - 8;
    *(_DWORD *)(a1 + 4) = v4 - 8;
    v6 = *(_DWORD *)a1;
    v7 = (*(_DWORD *)a1 >> (v4 - 8)) & *(_DWORD *)(a1 + 64);
  }
  if (v7 < 3)
  {
    *(_DWORD *)(a1 + 16) = v2 + 9;
    if (v5)
    {
      *(_DWORD *)(a1 + 4) = v5 - 1;
      v17 = (v6 >> (v5 - 1)) & 1;
    }
    else
    {
      *(_DWORD *)(a1 + 4) = 31;
      if ((v2 + 9) <= *(_DWORD *)(a1 + 20))
      {
        v18 = *(_QWORD *)(a1 + 24);
        v19 = *(unsigned int *)(a1 + 8);
        *(_DWORD *)(a1 + 8) = v19 + 1;
        LODWORD(v18) = bswap32(*(_DWORD *)(v18 + 4 * v19));
        *(_DWORD *)a1 = v18;
        v17 = v18 >> 31;
      }
      else
      {
        v17 = 0;
        *(_DWORD *)a1 = 0;
        ++*(_DWORD *)(a1 + 8);
      }
    }
    if (v17)
      v20 = 20;
    else
      v20 = -99;
    if (v17)
      v21 = 18;
    else
      v21 = 19;
    if (v17)
      v22 = 7;
    else
      v22 = 17;
    if (v7 != 2)
      v22 = -99;
    if (v7 == 1)
      v22 = v21;
    if (v7)
      return v22;
    else
      return v20;
  }
  else
  {
    v11 = v7;
    v12 = a2 + v7;
    v13 = v5 + *(char *)(v12 + 256);
    *(_DWORD *)(a1 + 4) = v13;
    *(_DWORD *)(a1 + 16) = v3 - *(char *)(v12 + 256);
    if (v13 >= 0x21)
    {
      v14 = v13 - 32;
      v15 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 4) = v14;
      *(_DWORD *)(a1 + 8) = v15 - 1;
      if (*(_DWORD *)(a1 + 20) >= (32 * (v15 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v15 - 2)));
    }
    return *(char *)(a2 + v11);
  }
}

uint64_t decodeCBPY(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;

  v2 = *(_DWORD *)(a1 + 16) + 6;
  *(_DWORD *)(a1 + 16) = v2;
  v3 = *(unsigned int *)(a1 + 4);
  if (v3 < 6)
  {
    v6 = 6 - v3;
    v4 = v3 + 26;
    *(_DWORD *)(a1 + 4) = v4;
    v5 = (*(_DWORD *)a1 << v6) & *(_DWORD *)(a1 + 56);
    if (v2 <= *(_DWORD *)(a1 + 20))
    {
      v7 = *(_QWORD *)(a1 + 24);
      v8 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v8 + 1;
      LODWORD(v7) = bswap32(*(_DWORD *)(v7 + 4 * v8));
      *(_DWORD *)a1 = v7;
      v5 |= *(_DWORD *)(a1 + 4 * v6 + 32) & (v7 >> v4);
    }
    else
    {
      ++*(_DWORD *)(a1 + 8);
      *(_DWORD *)a1 = 0;
    }
  }
  else
  {
    v4 = v3 - 6;
    *(_DWORD *)(a1 + 4) = v4;
    v5 = (*(_DWORD *)a1 >> v4) & *(_DWORD *)(a1 + 56);
  }
  if (v5 < 2)
    return 4294967197;
  v9 = v5;
  v10 = a2 + v5;
  v11 = v4 + *(char *)(v10 + 64);
  *(_DWORD *)(a1 + 4) = v11;
  *(_DWORD *)(a1 + 16) = v2 - *(char *)(v10 + 64);
  if (v11 >= 0x21)
  {
    v12 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 4) = v11 - 32;
    *(_DWORD *)(a1 + 8) = v12 - 1;
    if (*(_DWORD *)(a1 + 20) >= (32 * (v12 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v12 - 2)));
  }
  return *(char *)(a2 + v9);
}

uint64_t decodeMVD(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  uint64_t result;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  BOOL v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *(_DWORD *)(a1 + 16);
  v3 = v2 + 11;
  *(_DWORD *)(a1 + 16) = v2 + 11;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 0xB)
  {
    v8 = 11 - v4;
    v5 = v4 + 21;
    *(_DWORD *)(a1 + 4) = v4 + 21;
    v7 = (*(_DWORD *)a1 << (11 - v4)) & *(_DWORD *)(a1 + 76);
    if (v3 <= *(_DWORD *)(a1 + 20))
    {
      v9 = *(_QWORD *)(a1 + 24);
      v10 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v10 + 1;
      v6 = bswap32(*(_DWORD *)(v9 + 4 * v10));
      *(_DWORD *)a1 = v6;
      v7 |= *(_DWORD *)(a1 + 4 * v8 + 32) & (v6 >> v5);
    }
    else
    {
      v6 = 0;
      ++*(_DWORD *)(a1 + 8);
      *(_DWORD *)a1 = 0;
    }
  }
  else
  {
    v5 = v4 - 11;
    *(_DWORD *)(a1 + 4) = v4 - 11;
    v6 = *(_DWORD *)a1;
    v7 = (*(_DWORD *)a1 >> (v4 - 11)) & *(_DWORD *)(a1 + 76);
  }
  if (v7 < 8)
  {
    *(_DWORD *)(a1 + 16) = v2 + 12;
    if (v5)
    {
      v17 = v5 - 1;
      *(_DWORD *)(a1 + 4) = v17;
      v18 = (v6 >> v17) & 1;
    }
    else
    {
      *(_DWORD *)(a1 + 4) = 31;
      if ((v2 + 12) <= *(_DWORD *)(a1 + 20))
      {
        v19 = *(_QWORD *)(a1 + 24);
        v20 = *(unsigned int *)(a1 + 8);
        *(_DWORD *)(a1 + 8) = v20 + 1;
        v6 = bswap32(*(_DWORD *)(v19 + 4 * v20));
        *(_DWORD *)a1 = v6;
        v18 = v6 >> 31;
      }
      else
      {
        v6 = 0;
        v18 = 0;
        *(_DWORD *)a1 = 0;
        ++*(_DWORD *)(a1 + 8);
      }
      v17 = 31;
    }
    switch(v7)
    {
      case 1:
        v21 = v2 + 13;
        *(_DWORD *)(a1 + 16) = v21;
        if (v17)
        {
          *(_DWORD *)(a1 + 4) = v17 - 1;
          v22 = (v6 >> (v17 - 1)) & 1;
        }
        else
        {
          *(_DWORD *)(a1 + 4) = 31;
          if (v21 <= *(_DWORD *)(a1 + 20))
          {
            v26 = *(_QWORD *)(a1 + 24);
            v27 = *(unsigned int *)(a1 + 8);
            *(_DWORD *)(a1 + 8) = v27 + 1;
            LODWORD(v26) = bswap32(*(_DWORD *)(v26 + 4 * v27));
            *(_DWORD *)a1 = v26;
            v22 = v26 >> 31;
          }
          else
          {
            v22 = 0;
            *(_DWORD *)a1 = 0;
            ++*(_DWORD *)(a1 + 8);
          }
        }
        v23 = v22 == 0;
        if (v18)
        {
          v24 = 33;
          v25 = 31;
        }
        else
        {
          v24 = 32;
          v25 = -99;
        }
        goto LABEL_33;
      case 2:
        v23 = v18 == 0;
        v24 = 34;
        v25 = 30;
        goto LABEL_33;
      case 3:
        v23 = v18 == 0;
        v24 = 35;
        v25 = 29;
        goto LABEL_33;
      case 4:
        v23 = v18 == 0;
        v24 = 36;
        v25 = 28;
        goto LABEL_33;
      case 5:
        v23 = v18 == 0;
        v24 = 37;
        v25 = 27;
        goto LABEL_33;
      case 6:
        v23 = v18 == 0;
        v24 = 38;
        v25 = 26;
        goto LABEL_33;
      case 7:
        v23 = v18 == 0;
        v24 = 39;
        v25 = 25;
LABEL_33:
        if (v23)
          result = v25;
        else
          result = v24;
        break;
      default:
        result = 4294967197;
        break;
    }
  }
  else
  {
    v11 = v7;
    v12 = a2 + v7;
    v13 = v5 + *(char *)(v12 + 2048);
    *(_DWORD *)(a1 + 4) = v13;
    *(_DWORD *)(a1 + 16) = v3 - *(char *)(v12 + 2048);
    if (v13 >= 0x21)
    {
      v14 = v13 - 32;
      v15 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 4) = v14;
      *(_DWORD *)(a1 + 8) = v15 - 1;
      if (*(_DWORD *)(a1 + 20) >= (32 * (v15 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (v15 - 2)));
    }
    return *(char *)(a2 + v11);
  }
  return result;
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
  v8 = (int64x2_t)xmmword_2282546A0;
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
  v17 = (int64x2_t)xmmword_2282546A0;
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
        *(_OWORD *)(v5 + 310) = xmmword_228257B10;
        *(_OWORD *)(v5 + 326) = xmmword_228257B20;
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

int32x4_t Res_Copy8x8YS16(int32x4_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  int32x4_t *v4;
  int32x4_t result;

  v3 = 0;
  v4 = a1 + 1;
  do
  {
    result = vmovl_s16(*(int16x4_t *)(a2 + v3 + 8));
    v4[-1] = vmovl_s16(*(int16x4_t *)(a2 + v3));
    *v4 = result;
    v3 += 16;
    v4 = (int32x4_t *)((char *)v4 + 4 * a3);
  }
  while ((_DWORD)v3 != 128);
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

uint64_t OBMC_average(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _BYTE *v4;
  int v5;
  uint64_t v6;
  _DWORD *v7;
  int *v8;
  int v9;
  BOOL v10;
  BOOL v11;
  int v12;
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
  int v28;
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
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t result;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;

  v4 = (_BYTE *)(a1 + 7);
  v5 = 16;
  v6 = 32;
  do
  {
    v7 = (_DWORD *)(a2 + v6);
    v8 = (int *)(a3 + v6);
    v9 = *(_DWORD *)(a3 + v6 - 32);
    v11 = __OFADD__(v9, 4);
    v12 = v9 + 4;
    v10 = v9 + 4 < 0;
    v13 = v9 + 11;
    if (v10 == v11)
      v13 = v12;
    v14 = *(_DWORD *)(a2 + v6 - 32) + (v13 >> 3);
    if (v14 >= 255)
      v14 = 255;
    *(v4 - 7) = v14 & ~(v14 >> 31);
    v15 = *(v8 - 7);
    v11 = __OFADD__(v15, 4);
    v16 = v15 + 4;
    v10 = v15 + 4 < 0;
    v17 = v15 + 11;
    if (v10 == v11)
      v17 = v16;
    v18 = *(v7 - 7) + (v17 >> 3);
    if (v18 >= 255)
      v18 = 255;
    *(v4 - 6) = v18 & ~(v18 >> 31);
    v19 = *(v8 - 6);
    v11 = __OFADD__(v19, 4);
    v20 = v19 + 4;
    v10 = v19 + 4 < 0;
    v21 = v19 + 11;
    if (v10 == v11)
      v21 = v20;
    v22 = *(v7 - 6) + (v21 >> 3);
    if (v22 >= 255)
      v22 = 255;
    *(v4 - 5) = v22 & ~(v22 >> 31);
    v23 = *(v8 - 5);
    v11 = __OFADD__(v23, 4);
    v24 = v23 + 4;
    v10 = v23 + 4 < 0;
    v25 = v23 + 11;
    if (v10 == v11)
      v25 = v24;
    v26 = *(v7 - 5) + (v25 >> 3);
    if (v26 >= 255)
      v26 = 255;
    *(v4 - 4) = v26 & ~(v26 >> 31);
    v27 = *(v8 - 4);
    v11 = __OFADD__(v27, 4);
    v28 = v27 + 4;
    v10 = v27 + 4 < 0;
    v29 = v27 + 11;
    if (v10 == v11)
      v29 = v28;
    v30 = *(v7 - 4) + (v29 >> 3);
    if (v30 >= 255)
      v30 = 255;
    *(v4 - 3) = v30 & ~(v30 >> 31);
    v31 = *(v8 - 3);
    v11 = __OFADD__(v31, 4);
    v32 = v31 + 4;
    v10 = v31 + 4 < 0;
    v33 = v31 + 11;
    if (v10 == v11)
      v33 = v32;
    v34 = *(v7 - 3) + (v33 >> 3);
    if (v34 >= 255)
      v34 = 255;
    *(v4 - 2) = v34 & ~(v34 >> 31);
    v35 = *(v8 - 2);
    v11 = __OFADD__(v35, 4);
    v36 = v35 + 4;
    v10 = v35 + 4 < 0;
    v37 = v35 + 11;
    if (v10 == v11)
      v37 = v36;
    v38 = *(v7 - 2) + (v37 >> 3);
    if (v38 >= 255)
      v38 = 255;
    *(v4 - 1) = v38 & ~(v38 >> 31);
    v39 = *(v8 - 1);
    v11 = __OFADD__(v39, 4);
    v40 = v39 + 4;
    v10 = v39 + 4 < 0;
    v41 = v39 + 11;
    if (v10 == v11)
      v41 = v40;
    v42 = *(v7 - 1) + (v41 >> 3);
    if (v42 >= 255)
      v42 = 255;
    *v4 = v42 & ~(v42 >> 31);
    v43 = *v8 + 11;
    if (*v8 >= -4)
      v43 = *v8 + 4;
    v44 = *v7 + (v43 >> 3);
    if (v44 >= 255)
      v44 = 255;
    v4[1] = v44 & ~(v44 >> 31);
    v45 = v8[1];
    v11 = __OFADD__(v45, 4);
    v46 = v45 + 4;
    v10 = v45 + 4 < 0;
    v47 = v45 + 11;
    if (v10 == v11)
      v47 = v46;
    v48 = v7[1] + (v47 >> 3);
    if (v48 >= 255)
      v48 = 255;
    v4[2] = v48 & ~(v48 >> 31);
    v49 = v8[2];
    v11 = __OFADD__(v49, 4);
    v50 = v49 + 4;
    v10 = v49 + 4 < 0;
    v51 = v49 + 11;
    if (v10 == v11)
      v51 = v50;
    v52 = v7[2] + (v51 >> 3);
    if (v52 >= 255)
      v52 = 255;
    v4[3] = v52 & ~(v52 >> 31);
    v53 = v8[3];
    v11 = __OFADD__(v53, 4);
    v54 = v53 + 4;
    v10 = v53 + 4 < 0;
    v55 = v53 + 11;
    if (v10 == v11)
      v55 = v54;
    v56 = v7[3] + (v55 >> 3);
    if (v56 >= 255)
      v56 = 255;
    v4[4] = v56 & ~(v56 >> 31);
    v57 = v8[4];
    v11 = __OFADD__(v57, 4);
    v58 = v57 + 4;
    v10 = v57 + 4 < 0;
    v59 = v57 + 11;
    if (v10 == v11)
      v59 = v58;
    v60 = v7[4] + (v59 >> 3);
    if (v60 >= 255)
      v60 = 255;
    v4[5] = v60 & ~(v60 >> 31);
    v61 = v8[5];
    v11 = __OFADD__(v61, 4);
    v62 = v61 + 4;
    v10 = v61 + 4 < 0;
    v63 = v61 + 11;
    if (v10 == v11)
      v63 = v62;
    v64 = v7[5] + (v63 >> 3);
    if (v64 >= 255)
      v64 = 255;
    v4[6] = v64 & ~(v64 >> 31);
    v65 = v8[6];
    v11 = __OFADD__(v65, 4);
    result = (v65 + 4);
    v10 = v65 + 4 < 0;
    v67 = v65 + 11;
    if (v10 == v11)
      v67 = result;
    v68 = v7[6] + (v67 >> 3);
    if (v68 >= 255)
      v68 = 255;
    v4[7] = v68 & ~(v68 >> 31);
    v69 = v7[7];
    v70 = v8[7];
    v11 = __OFADD__(v70, 4);
    v71 = v70 + 4;
    v10 = v70 + 4 < 0;
    v72 = v70 + 11;
    if (v10 == v11)
      v72 = v71;
    v73 = v69 + (v72 >> 3);
    if (v73 >= 255)
      v73 = 255;
    v4[8] = v73 & ~(v73 >> 31);
    v6 += 4 * a4;
    v4 += a4;
    --v5;
  }
  while (v5);
  return result;
}

uint64_t DumpDecoded263MB_OBMCS16(uint64_t result, _QWORD *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  __int16 *v20;
  int v21;
  int v22;
  int v23;
  int v24;
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
  int v35;
  int v36;
  int v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  __int16 *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  __int16 *v47;
  int v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  __int16 *v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  __int16 *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  __int16 *v64;
  int v65;
  int v66;
  int v67;
  int v68;

  v8 = *(_QWORD *)(result + 296182);
  v7 = *(_QWORD *)(result + 296190);
  v9 = *(_DWORD **)v8;
  v10 = (int *)(*(_QWORD *)v8 + 4 * *(unsigned int *)(v7 + 20));
  v11 = *(_QWORD *)v8 + 4 * *(unsigned int *)(v7 + 24);
  v12 = *(int *)(v11 + 76) + (uint64_t)*v10;
  v13 = *(int *)(v11 + 340) + (uint64_t)v10[47];
  v14 = *(_DWORD *)result + 32;
  v15 = *(_DWORD *)(result + 4) + 16;
  v16 = *(_QWORD *)(result + 58);
  v17 = *(char *)(v8 + 154);
  if (v17 < 2)
  {
    if (*a4)
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[42] + (int)v12)), *(_QWORD *)(v8 + 8), v14);
    if (a4[1])
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[43] + (int)v12)), *(_QWORD *)(v8 + 16), v14);
    if (a4[2])
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[44] + (int)v12)), *(_QWORD *)(v8 + 24), v14);
    if (a4[3])
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[45] + (int)v12)), *(_QWORD *)(v8 + 32), v14);
    v21 = *(_DWORD *)(v8 + 198);
    v22 = (v21 >> 31) | 1;
    if (-4 * v21 * v22 >= 0)
      v23 = -((-4 * v21 * v22) & 0xF);
    else
      v23 = (4 * v21 * v22) & 0xC;
    v24 = *(_DWORD *)(v8 + 222);
    v25 = v22 * roundtab16[v23] + 2 * (v21 / 4);
    v26 = (v24 >> 31) | 1;
    if (-4 * v24 * v26 >= 0)
      v27 = -((-4 * v24 * v26) & 0xF);
    else
      v27 = (4 * v24 * v26) & 0xC;
    v28 = v26 * roundtab16[v27] + 2 * (v24 / 4);
    if (a4[4])
      MC_InvUVS16(*(_QWORD *)(v8 + 40), *(_QWORD *)(a3 + 8) + (int)v13, a2[1] + (int)v13, v15, v25, v28);
    else
      MC_Copy8x8UV(a2[1] + (int)v13, *(_QWORD *)(a3 + 8) + (int)v13, v15, v25, v28);
    if (a4[5])
      return MC_InvUVS16(*(_QWORD *)(v8 + 48), *(_QWORD *)(a3 + 16) + (int)v13, a2[2] + (int)v13, v15, v25, v28);
    return MC_Copy8x8UV(a2[2] + (int)v13, *(_QWORD *)(a3 + 16) + (int)v13, v15, v25, v28);
  }
  if (v17 - 3 >= 2)
  {
    if (v17 != 2)
      return result;
    if (*a4)
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[42] + (int)v12)), *(_QWORD *)(v8 + 8), v14);
    if (a4[1])
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[43] + (int)v12)), *(_QWORD *)(v8 + 16), v14);
    if (a4[2])
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[44] + (int)v12)), *(_QWORD *)(v8 + 24), v14);
    if (a4[3])
      Res_Copy8x8YS16((int32x4_t *)(v16 + 4 * (v9[45] + (int)v12)), *(_QWORD *)(v8 + 32), v14);
    v29 = vaddvq_s32(*(int32x4_t *)(v8 + 202));
    v30 = vaddvq_s32(*(int32x4_t *)(v8 + 226));
    v31 = (v29 >> 31) | 1;
    if (v31 * v29 <= 0)
      v32 = -(-(v31 * v29) & 0xF);
    else
      v32 = (v31 * v29) & 0xF;
    v25 = roundtab16[v32] * v31 + 2 * (v29 / 16);
    v33 = (v30 >> 31) | 1;
    if (v33 * v30 <= 0)
      v34 = -(-(v33 * v30) & 0xF);
    else
      v34 = (v33 * v30) & 0xF;
    v28 = roundtab16[v34] * v33 + 2 * (v30 / 16);
    if (a4[4])
      MC_InvUV4S16(*(_QWORD *)(v8 + 40), *(_QWORD *)(a3 + 8) + (int)v13, a2[1] + (int)v13, v15, v25, v28);
    else
      MC_Copy8x8UV(a2[1] + (int)v13, *(_QWORD *)(a3 + 8) + (int)v13, v15, v25, v28);
    if (a4[5])
      return MC_InvUV4S16(*(_QWORD *)(v8 + 48), *(_QWORD *)(a3 + 16) + (int)v13, a2[2] + (int)v13, v15, v25, v28);
    return MC_Copy8x8UV(a2[2] + (int)v13, *(_QWORD *)(a3 + 16) + (int)v13, v15, v25, v28);
  }
  v18 = *(_QWORD *)(*(_QWORD *)(result + 296238) + 48);
  v19 = *a2 + (int)v9[42] + v12;
  v20 = *(__int16 **)(v8 + 8);
  if (*a4)
  {
    Dump8x8CharS16(v19, v14, (uint64_t)v20);
  }
  else
  {
    v35 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v20);
    v36 = (v35 << 16) | (v35 << 24) | (v35 << 8) | v35;
    v37 = 1;
    v38 = -8;
    do
    {
      *(_DWORD *)(v19 + 4 * (v37 - 1)) = v36;
      *(_DWORD *)(v19 + 4 * v37) = v36;
      v37 += v14 >> 2;
      v39 = __CFADD__(v38++, 1);
    }
    while (!v39);
  }
  v40 = *a2 + (int)v9[43] + (uint64_t)(int)v12;
  v41 = *(__int16 **)(v8 + 16);
  if (a4[1])
  {
    Dump8x8CharS16(v40, v14, (uint64_t)v41);
  }
  else
  {
    v42 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v41);
    v43 = (v42 << 16) | (v42 << 24) | (v42 << 8) | v42;
    v44 = 1;
    v45 = -8;
    do
    {
      *(_DWORD *)(v40 + 4 * (v44 - 1)) = v43;
      *(_DWORD *)(v40 + 4 * v44) = v43;
      v44 += v14 >> 2;
      v39 = __CFADD__(v45++, 1);
    }
    while (!v39);
  }
  v46 = *a2 + (int)v9[44] + (uint64_t)(int)v12;
  v47 = *(__int16 **)(v8 + 24);
  if (a4[2])
  {
    Dump8x8CharS16(v46, v14, (uint64_t)v47);
  }
  else
  {
    v48 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v47);
    v49 = (v48 << 16) | (v48 << 24) | (v48 << 8) | v48;
    v50 = 1;
    v51 = -8;
    do
    {
      *(_DWORD *)(v46 + 4 * (v50 - 1)) = v49;
      *(_DWORD *)(v46 + 4 * v50) = v49;
      v50 += v14 >> 2;
      v39 = __CFADD__(v51++, 1);
    }
    while (!v39);
  }
  v52 = *a2 + (int)v9[45] + (uint64_t)(int)v12;
  v53 = *(__int16 **)(v8 + 32);
  if (a4[3])
  {
    Dump8x8CharS16(v52, v14, (uint64_t)v53);
  }
  else
  {
    v54 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v53);
    v55 = (v54 << 16) | (v54 << 24) | (v54 << 8) | v54;
    v56 = 1;
    v57 = -8;
    do
    {
      *(_DWORD *)(v52 + 4 * (v56 - 1)) = v55;
      *(_DWORD *)(v52 + 4 * v56) = v55;
      v56 += v14 >> 2;
      v39 = __CFADD__(v57++, 1);
    }
    while (!v39);
  }
  v58 = a2[1] + v13;
  v59 = *(__int16 **)(v8 + 40);
  if (a4[4])
  {
    Dump8x8CharS16(v58, v15, (uint64_t)v59);
  }
  else
  {
    v60 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v59);
    v61 = (v60 << 16) | (v60 << 24) | (v60 << 8) | v60;
    v62 = 1;
    v63 = -8;
    do
    {
      *(_DWORD *)(v58 + 4 * (v62 - 1)) = v61;
      *(_DWORD *)(v58 + 4 * v62) = v61;
      v62 += v15 >> 2;
      v39 = __CFADD__(v63++, 1);
    }
    while (!v39);
  }
  result = a2[2] + v13;
  v64 = *(__int16 **)(v8 + 48);
  if (a4[5])
    return Dump8x8CharS16(result, v15, (uint64_t)v64);
  v65 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 1312) + *v64);
  v66 = (v65 << 16) | (v65 << 24) | (v65 << 8) | v65;
  v67 = 1;
  v68 = -8;
  do
  {
    *(_DWORD *)(result + 4 * (v67 - 1)) = v66;
    *(_DWORD *)(result + 4 * v67) = v66;
    v67 += v15 >> 2;
    v39 = __CFADD__(v68++, 1);
  }
  while (!v39);
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
    v5 = dword_228257B7C[a5 - 1];
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
    v5 = dword_228257B7C[a5 - 1];
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
    v6 = dword_228257B7C[a6 - 1];
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
    v6 = dword_228257B7C[a6 - 1];
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
      *v7 = xmmword_228257B90;
      v7[1] = xmmword_228257BA0;
      v7[2] = xmmword_228257BB0;
      v7[3] = xmmword_228257BC0;
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
      v15 = (int32x4_t)xmmword_2282546D0;
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
      v22 = (int32x4_t)xmmword_2282546D0;
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
      v29 = (int32x4_t)xmmword_2282546D0;
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
      v37 = (int32x4_t)xmmword_2282546D0;
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
      v41 = (int32x4_t)xmmword_228257BD0;
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
  v45 = (int8x16_t)xmmword_228257BE0;
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
  *v50 = xmmword_228257BF0;
  v50[1] = xmmword_228257C00;
  v50[2] = xmmword_228257C10;
  v50[3] = xmmword_228257C20;
  v50[4] = xmmword_228257C30;
  v50[5] = xmmword_228257C40;
  v50[6] = xmmword_228257C50;
  v50[7] = xmmword_2282546D0;
  v50[8] = xmmword_228257C60;
  v50[9] = xmmword_228257C70;
  v50[10] = xmmword_228257C80;
  v50[11] = xmmword_228257C90;
  v50[12] = xmmword_228257CA0;
  v50[13] = xmmword_228257CB0;
  v50[14] = xmmword_228257CC0;
  v50[15] = xmmword_228257CD0;
  v50[16] = xmmword_228257B10;
  v50[17] = xmmword_228257CE0;
  v50[18] = xmmword_228257C00;
  v50[19] = xmmword_228257CF0;
  v50[20] = xmmword_228257D00;
  v50[21] = xmmword_228257BF0;
  v50[22] = xmmword_228257C90;
  v50[23] = xmmword_228257C70;
  v50[24] = xmmword_228257C50;
  v50[25] = xmmword_228257C30;
  v50[26] = xmmword_228257CD0;
  v50[27] = xmmword_228257D10;
  v50[28] = xmmword_228257CF0;
  v50[29] = xmmword_228257CC0;
  v50[30] = xmmword_228257D20;
  v50[31] = xmmword_228257D30;
  v51 = *a1;
  v52 = (uint64_t)*a1 + 1324;
  *(_OWORD *)v52 = xmmword_228257D40;
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
  v12 = dword_228257D6C[v9];
  v13 = dword_228257D78[v9];
  v14 = dword_228257D84[v9];
  v15 = dword_228257D90[v9];
  v16 = dword_228257D9C[v9];
  v10[4] = dword_228257D60[v9];
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
  v4 = (int64x2_t)xmmword_2282546A0;
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x24BDC00B0](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
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

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
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

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x24BDC08A8]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x24BDC09E8]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x24BDF9028]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x24BDF9040]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x24BDF9048]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x24BDF9188]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x24BDF91D8]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x24BDF91E0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

