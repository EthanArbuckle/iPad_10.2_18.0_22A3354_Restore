uint64_t FigSampleBufferProcessorCreateForHDR(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t DerivedStorage;
  pthread_mutex_t *v7;
  _QWORD *v8;

  if (!a3)
    return FigSignalErrorAt();
  FigSampleBufferProcessorGetClassID();
  v4 = CMDerivedObjectCreate();
  if ((_DWORD)v4)
  {
    CFRelease(0);
    return v4;
  }
  else
  {
    *a3 = 0;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    v7 = (pthread_mutex_t *)(DerivedStorage + 40);
    pthread_mutex_init((pthread_mutex_t *)(DerivedStorage + 40), 0);
    v8 = RegWarp_constructor(0, 1);
    *(_QWORD *)(DerivedStorage + 16) = v8;
    if (v8)
    {
      *(_QWORD *)(DerivedStorage + 32) = extractToneCurvePlist((_DWORD *)(DerivedStorage + 24));
      if ((FigSampleBufferProcessorCreateForHDR_gl_cache_do_prewarm & 1) == 0)
      {
        FigSampleBufferProcessorCreateForHDR_gl_cache_do_prewarm = 1;
        GLBase_setCachedContext();
        pthread_mutex_lock(v7);
        gl_prewarm_caches(*(_QWORD **)(DerivedStorage + 16), 0);
        pthread_mutex_unlock(v7);
        GLBase_removeCachedContext();
      }
      return 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
}

uint64_t sbp_HDR_invalidate()
{
  uint64_t DerivedStorage;
  void *v1;
  unint64_t v2;

  disposeCachedGLContext();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 40));
  RegWarp_destructor(*(void ***)(DerivedStorage + 16));
  pthread_mutex_unlock((pthread_mutex_t *)(DerivedStorage + 40));
  *(_QWORD *)(DerivedStorage + 16) = 0;
  v1 = *(void **)(DerivedStorage + 32);
  if (v1)
  {
    if (*(_DWORD *)(DerivedStorage + 24))
    {
      v2 = 0;
      do
        free(*(void **)(*(_QWORD *)(DerivedStorage + 32) + 8 * v2++));
      while (v2 < *(unsigned int *)(DerivedStorage + 24));
      v1 = *(void **)(DerivedStorage + 32);
    }
    free(v1);
    *(_QWORD *)(DerivedStorage + 32) = 0;
  }
  *(_QWORD *)DerivedStorage = 0;
  return 0;
}

__CFString *sbp_HDR_copyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<FigSampleBufferProcessor_HDR %p>"), a1);
  return Mutable;
}

uint64_t sbp_HDR_copyProperty(int a1, CFTypeRef cf1, const __CFAllocator *a3, CFNumberRef *a4)
{
  int valuePtr;

  if (!CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BDDCF78]))
    return FigSignalErrorAt();
  valuePtr = GLBase_GetClientPidOfCurrentContext();
  *a4 = CFNumberCreate(a3, kCFNumberSInt32Type, &valuePtr);
  return 0;
}

uint64_t sbp_HDR_setProperty(int a1, CFTypeRef cf1, const __CFNumber *a3)
{
  CFTypeID v4;
  int valuePtr;

  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BDDCF78]))
  {
    if (a3 && (v4 = CFGetTypeID(a3), v4 != CFNumberGetTypeID()))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else if (CFNumberGetType(a3) == kCFNumberSInt32Type)
    {
      valuePtr = 0;
      CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
      GLBase_BindClientPidToCurrentContext(valuePtr);
      return 0;
    }
  }
  return FigSignalErrorAt();
}

uint64_t sbp_HDR_setOutputCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *DerivedStorage;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  *DerivedStorage = a2;
  DerivedStorage[1] = a3;
  return 0;
}

uint64_t sbp_HDR_processSampleBuffer(uint64_t a1, const void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  __CVBuffer *ImageBuffer;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFNumber *Value;
  int *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  _OWORD *v22;
  double Width;
  size_t Height;
  const __CFNumber *v25;
  const __CFNumber *v26;
  int16x4_t v27;
  const __CFNumber *v28;
  int16x4_t v29;
  const __CFNumber *v30;
  int16x4_t v31;
  const __CFNumber *v32;
  const __CFNumber *v33;
  int v34;
  const __CFNumber *v35;
  float v36;
  _DWORD **v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  const __CFDictionary *v41;
  __CFDictionary *MutableCopy;
  uint64_t DerivedStorage;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *key;
  __int16 v59;
  int valuePtr;
  __int128 v61;
  _OWORD v62[3];
  __int128 v63;
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[13];
  _OWORD v69[6];
  float v70[4];
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  CVPixelBufferRef v75;
  CVPixelBufferRef v76;
  CVPixelBufferRef v77;
  CMAttachmentBearerRef v78;
  CMAttachmentBearerRef v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v79 = 0;
  v80 = 0;
  v75 = 0;
  v76 = 0;
  v77 = 0;
  v78 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  memset(v70, 0, 12);
  memset(v68, 0, sizeof(v68));
  v66 = 0u;
  v67 = 0u;
  v65 = 0u;
  v63 = 0u;
  memset(v64, 0, sizeof(v64));
  v61 = 0u;
  memset(v62, 0, sizeof(v62));
  valuePtr = 0;
  HDRInitializeOptionalParam(&v61);
  CFRetain(a2);
  v3 = 0;
  v4 = *MEMORY[0x24BE11E48];
  v5 = *MEMORY[0x24BE11E58];
  v6 = *MEMORY[0x24BE11E50];
  v7 = (const __CFString *)*MEMORY[0x24BE11A80];
  v57 = (void *)*MEMORY[0x24BE11B68];
  key = (void *)*MEMORY[0x24BE11C60];
  v55 = (void *)*MEMORY[0x24BE11D98];
  v56 = (void *)*MEMORY[0x24BE11DB0];
  v52 = (void *)*MEMORY[0x24BE11D68];
  v54 = (void *)*MEMORY[0x24BE11D70];
  v53 = (void *)*MEMORY[0x24BE11CF0];
  v51 = (void *)*MEMORY[0x24BE11C50];
  v48 = (void *)*MEMORY[0x24BE11C38];
  v46 = (void *)*MEMORY[0x24BE11C48];
  v47 = (void *)*MEMORY[0x24BE11C40];
  v50 = (void *)*MEMORY[0x24BE11C18];
  v49 = (void *)*MEMORY[0x24BE11D38];
  v45 = (void *)*MEMORY[0x24BE11D40];
  do
  {
    while (1)
    {
      v8 = v3 == 1 ? v5 : v6;
      v9 = (const __CFString *)(v3 ? v8 : v4);
      v10 = (void *)CMGetAttachment(a2, v9, 0);
      *(&v78 + v3) = v10;
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v10);
      *(&v75 + v3) = ImageBuffer;
      CVPixelBufferLockBaseAddress(ImageBuffer, 0);
      v12 = (const __CFDictionary *)CMGetAttachment(v10, v7, 0);
      if (v12)
        break;
      syslog(4, "No meta data");
      if (++v3 == 3)
        goto LABEL_45;
    }
    v13 = v12;
    Value = (const __CFNumber *)CFDictionaryGetValue(v12, key);
    v15 = &v73 + v3;
    *v15 = 2143289344;
    if (Value)
      CFNumberGetValue(Value, kCFNumberFloatType, v15);
    v16 = (const __CFNumber *)CFDictionaryGetValue(v13, v57);
    if (v16)
    {
      CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
      *((float *)&v71 + v3) = (float)valuePtr * 0.0039062;
    }
    v17 = (const __CFNumber *)CFDictionaryGetValue(v13, v56);
    if (v17)
    {
      CFNumberGetValue(v17, kCFNumberSInt32Type, &valuePtr);
      v70[v3] = (float)valuePtr * 0.0039062;
    }
    v18 = (const __CFNumber *)CFDictionaryGetValue(v13, v55);
    if (v18)
    {
      CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
      v70[v3] = (float)(v70[v3] * 0.0039062) * (float)valuePtr;
    }
    if (v3 == 2)
    {
      v19 = (const __CFNumber *)CFDictionaryGetValue(v13, v52);
      if (v19)
        CFNumberGetValue(v19, kCFNumberFloat32Type, v62);
    }
    v20 = (const __CFNumber *)CFDictionaryGetValue(v13, v54);
    if (v20)
      CFNumberGetValue(v20, kCFNumberIntType, &v61);
    v21 = (const __CFNumber *)CFDictionaryGetValue(v13, v53);
    if (v21)
      CFNumberGetValue(v21, kCFNumberIntType, (char *)&v61 + 4);
    v22 = &v69[2 * v3];
    Width = (double)CVPixelBufferGetWidth(ImageBuffer);
    Height = CVPixelBufferGetHeight(ImageBuffer);
    *(_QWORD *)v22 = 0;
    *((_QWORD *)v22 + 1) = 0;
    *((double *)v22 + 2) = Width;
    *((double *)v22 + 3) = (double)Height;
    syslog(6, "roi[%d]: x=%f, y=%f, w=%f, h=%f\n", v3, 0.0, 0.0, Width, (double)Height);
    if (v3 == 1)
    {
      v59 = 0;
      v25 = (const __CFNumber *)CFDictionaryGetValue(v13, v51);
      if (v25)
        CFNumberGetValue(v25, kCFNumberSInt16Type, &v59);
      if (v59 < 1)
      {
        syslog(4, "Tone curve parameter values passed are not valid; using default tone parameters to finish reprocessing.");
        v32 = (const __CFNumber *)CFDictionaryGetValue(v13, v50);
        if (!v32)
          goto LABEL_37;
      }
      else
      {
        *((float *)&v65 + 2) = (float)v59;
        v26 = (const __CFNumber *)CFDictionaryGetValue(v13, v48);
        if (v26)
        {
          CFNumberGetValue(v26, kCFNumberSInt16Type, &v59);
          v27.i16[0] = v59;
          *((float *)&v65 + 1) = (float)vmovl_s16(v27).i32[0];
        }
        v28 = (const __CFNumber *)CFDictionaryGetValue(v13, v47);
        if (v28)
        {
          CFNumberGetValue(v28, kCFNumberSInt16Type, &v59);
          v29.i16[0] = v59;
          *((float *)&v65 + 3) = (float)vmovl_s16(v29).i32[0];
        }
        v30 = (const __CFNumber *)CFDictionaryGetValue(v13, v46);
        if (v30)
        {
          CFNumberGetValue(v30, kCFNumberSInt16Type, &v59);
          v31.i16[0] = v59;
          *(float *)&v66 = (float)vmovl_s16(v31).i32[0];
        }
        v32 = (const __CFNumber *)CFDictionaryGetValue(v13, v50);
        if (!v32)
          goto LABEL_37;
      }
      CFNumberGetValue(v32, kCFNumberSInt32Type, &valuePtr);
      *((float *)&v64[1] + 2) = (float)valuePtr * 0.000015259;
LABEL_37:
      v33 = (const __CFNumber *)CFDictionaryGetValue(v13, v49);
      if (v33)
      {
        CFNumberGetValue(v33, kCFNumberSInt32Type, &valuePtr);
        v34 = valuePtr;
        v35 = (const __CFNumber *)CFDictionaryGetValue(v13, v45);
        if (v35)
        {
          v36 = (float)v34 * 0.000015259;
          CFNumberGetValue(v35, kCFNumberSInt32Type, &valuePtr);
          *(float *)&v65 = (float)((float)(v36 * v36)
                                 - (float)((float)((float)valuePtr * 0.000015259)
                                         * (float)((float)valuePtr * 0.000015259)))
                         * 1.0159;
          *((float *)&v64[1] + 3) = (float)(v36 * v36) - *(float *)&v65;
        }
      }
    }
    ++v3;
  }
  while (v3 != 3);
  HIDWORD(v63) = v71;
  *(_QWORD *)((char *)&v63 + 4) = v72;
  *((float *)v64 + 2) = v70[0];
  *(_QWORD *)&v64[0] = *(_QWORD *)&v70[1];
  DWORD1(v64[1]) = v73;
  *(_QWORD *)((char *)v64 + 12) = v74;
  *(_OWORD *)&v68[1] = v69[2];
  *(_OWORD *)&v68[3] = v69[3];
  *(_OWORD *)&v68[11] = v69[1];
  *(_OWORD *)&v68[9] = v69[0];
  *(_OWORD *)&v68[7] = v69[5];
  *(_OWORD *)&v68[5] = v69[4];
LABEL_45:
  v37 = *(_DWORD ***)(DerivedStorage + 32);
  if (v37)
  {
    v38 = *(unsigned int *)(DerivedStorage + 24);
    if ((_DWORD)v38)
    {
      while (1)
      {
        v39 = *v37;
        if (**v37 == (_DWORD)v61)
          break;
        ++v37;
        if (!--v38)
          goto LABEL_49;
      }
    }
    else
    {
LABEL_49:
      v39 = 0;
    }
    syslog(4, "Found TCP for sensorId 0x%x\n", (_DWORD)v61);
  }
  else
  {
    v39 = 0;
  }
  GLBase_setCachedContext();
  pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 40));
  v40 = createHDRFromYCC420Buffers(&v75, (uint64_t)&v61, *(_QWORD **)(DerivedStorage + 16), (uint64_t)v39);
  pthread_mutex_unlock((pthread_mutex_t *)(DerivedStorage + 40));
  GLBase_removeCachedContext();
  CVPixelBufferUnlockBaseAddress(v75, 0);
  CVPixelBufferUnlockBaseAddress(v76, 0);
  CVPixelBufferUnlockBaseAddress(v77, 0);
  v41 = (const __CFDictionary *)CMGetAttachment(v79, v7, 0);
  if (v41)
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v41);
    CFDictionaryRemoveValue(MutableCopy, (const void *)*MEMORY[0x24BE11BF8]);
    CMSetAttachment(v78, v7, MutableCopy, 1u);
    CFRelease(MutableCopy);
  }
  (*(void (**)(_QWORD, uint64_t, const void *))DerivedStorage)(*(_QWORD *)(DerivedStorage + 8), v40, a2);
  CFRelease(a2);
  return v40;
}

uint64_t sbp_HDR_finishPendingProcessing()
{
  return 0;
}

uint64_t HDRInitializeOptionalParam(void *a1)
{
  if (a1)
    memcpy(a1, &defaultOptionalParamBlock, 0x108uLL);
  return 0;
}

uint64_t disposeCachedGLContext()
{
  gl_combineandrender_dispose_glcache();
  return GLBase_dispose_glcache();
}

void gl_prewarm_caches(_QWORD *a1, uint64_t a2)
{
  _BYTE __dst[264];
  CVPixelBufferRef v5;
  CVPixelBufferRef v6;
  CVPixelBufferRef v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = 0;
  v7 = 0;
  GLBase_CreateYUV420DestCVPixelBuffers(3, &v5, 128, 128, 0, 0);
  CVPixelBufferLockBaseAddress(v5, 0);
  CVPixelBufferLockBaseAddress(v6, 0);
  CVPixelBufferLockBaseAddress(v7, 0);
  memcpy(__dst, &defaultOptionalParamBlock, sizeof(__dst));
  createHDRFromYCC420Buffers(&v5, (uint64_t)__dst, a1, a2);
  CVPixelBufferUnlockBaseAddress(v5, 0);
  CVPixelBufferRelease(v5);
  CVPixelBufferUnlockBaseAddress(v6, 0);
  CVPixelBufferRelease(v6);
  CVPixelBufferUnlockBaseAddress(v7, 0);
  CVPixelBufferRelease(v7);
}

uint64_t createHDRFromYCC420Buffers(CVPixelBufferRef *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t v10;
  double Current;
  __CVBuffer *v12;
  __CVBuffer *v13;
  float v14;
  double v15;
  float v16;
  int32x4_t v18;
  CVPixelBufferRef texture;
  CVPixelBufferRef v20[3];
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float *v31;
  int *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = 0;
  texture = 0;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(*a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(*a1, 0);
  v10 = GLBase_CreateYUV420DestCVPixelBuffers(1, &texture, WidthOfPlane, HeightOfPlane, 0, 0);
  if (!(_DWORD)v10)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v27 = 0;
    v28 = 0x3F80000000000000;
    v29 = 0;
    v30 = 0x3F80000000000000;
    v26 = 1065353216;
    v23 = 0x3F80000000000000;
    v22 = 0;
    v24 = 0;
    v25 = 0x3F80000000000000;
    v21 = 1065353216;
    v31 = (float *)&v26;
    v32 = &v21;
    v12 = a1[1];
    v13 = a1[2];
    v20[0] = *a1;
    v20[1] = v13;
    v20[2] = texture;
    v18 = vuzp1q_s32((int32x4_t)vcvtq_s64_f64(*(float64x2_t *)(a2 + 168)), (int32x4_t)vcvtq_s64_f64(*(float64x2_t *)(a2 + 184)));
    v10 = Register((uint64_t)a3, v12, v20, 2, 1, v18.i32);
    RegWarp_getTransforms(a3, (uint64_t *)&v31, 2);
    if (!(_DWORD)v10)
    {
      v14 = CFAbsoluteTimeGetCurrent() - Current;
      *(float *)(a2 + 132) = v14;
      v15 = CFAbsoluteTimeGetCurrent();
      v10 = gl_combineandrender(*a1, a1, &v31, a2, a4);
      v16 = CFAbsoluteTimeGetCurrent() - v15;
      *(float *)(a2 + 136) = v16;
      syslog(4, "HDR (OpenGL) - total execution time: %.2fs + %.2fs = %.2fs\n", *(float *)(a2 + 132), v16, (float)(*(float *)(a2 + 132) + v16));
    }
  }
  CVPixelBufferRelease(texture);
  return v10;
}

void calculateNoiseAndFusingCurves(uint64_t a1, float32x4_t *a2, int a3)
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float *v10;
  float *v11;
  char *v12;
  float *v13;
  float *v14;
  float v15;
  int32x2_t v16;
  float v17;
  char *v18;
  int32x2_t v19;
  void *v20;
  uint64_t v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int16x4_t v27;
  float32x4_t v32;
  uint64_t i;
  float32x4_t v34;
  float32x4_t v35;
  uint64_t v36;
  float32x4_t v37;
  uint64_t v38;
  float32x4_t v39;
  float32x4_t v40;
  int32x2_t v41;
  float32x4_t v42;
  int32x2_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  float *v47;
  int v48;
  unsigned int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  BOOL v55;
  float32x4_t v57;
  float32x4_t *v58;
  float32x4_t *v59;
  uint64_t v60;
  float *v61;
  float *v62;
  uint64_t v63;
  float v64;
  uint64_t v65;
  unsigned __int16 v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  int16x4_t v70;
  float32x4_t *v71;
  unint64_t v72;
  uint64_t v73;
  float32x4_t v74;
  float v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  int16x4_t v79;
  float32x4_t *v80;
  uint64_t v81;
  float32x4_t v82;
  float v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  int16x4_t v87;
  float32x4_t *v88;
  uint64_t v89;
  float32x4_t v90;
  float v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  int16x4_t v95;
  float32x4_t *v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  int v104;
  uint64_t v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float32x4_t *v110;
  float *v111;
  float v112;
  uint64_t v113;
  float v114;
  float v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t j;
  uint64_t k;
  uint64_t v121;
  int32x2_t v122;
  float32x4_t v123;
  float32x4_t *v124;
  uint64_t v125;
  float *v126;
  float *v127;
  float v128;
  float v129;
  float v130;
  uint64_t v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float32x4_t *v136;
  uint64_t v137;
  int16x4_t v138;
  float32x4_t v139;
  uint64_t v140;
  float32x4_t *v141;
  float32x4_t v142;
  float32x4_t *v143;
  uint64_t v144;
  unsigned int v145;
  float v146;
  float *v147;
  float v148;
  float v149;
  float v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  int16x4_t v155;
  float32x4_t *v156;
  float32x4_t v157;
  unint64_t v158;
  unsigned int v160;
  void *__dst;
  float *v162;
  __int16 v163;
  void *v164;
  float *v165;
  float *v166;
  float *v167;
  float *__src;
  float *v169;
  float *v170;
  int32x2_t v171;
  float32x4_t v172;
  float v173;
  float v174;
  float v175;
  int32x2_t v176;
  float v177;
  int32x2_t v178;
  float32x4_t v179;
  float v180;

  v5 = *(float *)(a1 + 80);
  v6 = (float)(*(float *)(a1 + 76) * *(float *)(a1 + 100)) * *(float *)(a1 + 88);
  v7 = *(float *)(a1 + 92);
  v8 = *(float *)(a1 + 68);
  v9 = (float)(*(float *)(a1 + 72) * *(float *)(a1 + 96)) * *(float *)(a1 + 84);
  v10 = (float *)malloc_type_malloc(0x1000uLL, 0xAA64639DuLL);
  v166 = v10 + 512;
  v11 = (float *)malloc_type_malloc(0x808uLL, 0xDD32C859uLL);
  v12 = (char *)malloc_type_malloc(0x1FE8uLL, 0x814138E2uLL);
  v13 = (float *)(v12 + 4084);
  v14 = (float *)malloc_type_malloc(0x1FE8uLL, 0xC3CE6330uLL);
  *(_OWORD *)(v12 + 4084) = xmmword_24B722B10;
  *(_OWORD *)(v12 + 4100) = xmmword_24B722B20;
  *(_OWORD *)(v12 + 4116) = xmmword_24B722B30;
  *(_OWORD *)(v12 + 4132) = xmmword_24B722B40;
  *(_OWORD *)(v12 + 4148) = xmmword_24B722B50;
  *(_OWORD *)(v12 + 4164) = xmmword_24B722B60;
  *(_OWORD *)(v12 + 4180) = xmmword_24B722B70;
  *(_OWORD *)(v12 + 4196) = xmmword_24B722B80;
  *(_OWORD *)(v12 + 4212) = xmmword_24B722B90;
  *(_OWORD *)(v12 + 4228) = xmmword_24B722BA0;
  *(_OWORD *)(v12 + 4244) = xmmword_24B722BB0;
  *(_OWORD *)(v12 + 4260) = xmmword_24B722BC0;
  *(_OWORD *)(v12 + 4276) = xmmword_24B722BD0;
  *(_OWORD *)(v12 + 4292) = xmmword_24B722BE0;
  *(_OWORD *)(v12 + 4308) = xmmword_24B722BF0;
  *(_OWORD *)(v12 + 4324) = xmmword_24B722C00;
  *(_OWORD *)(v12 + 4340) = xmmword_24B722C10;
  *(_OWORD *)(v12 + 4356) = xmmword_24B722C20;
  *(_OWORD *)(v12 + 4372) = xmmword_24B722C30;
  *(_OWORD *)(v12 + 4388) = xmmword_24B722C40;
  *(_OWORD *)(v12 + 4404) = xmmword_24B722C50;
  *(_OWORD *)(v12 + 4420) = xmmword_24B722C60;
  *(_OWORD *)(v12 + 4436) = xmmword_24B722C70;
  *(_OWORD *)(v12 + 4452) = xmmword_24B722C80;
  *(_OWORD *)(v12 + 4468) = xmmword_24B722C90;
  *(_OWORD *)(v12 + 4484) = xmmword_24B722CA0;
  *(_OWORD *)(v12 + 4500) = xmmword_24B722CB0;
  *(_OWORD *)(v12 + 4516) = xmmword_24B722CC0;
  v15 = (float)(v8 * v7) * v5;
  *(_OWORD *)(v12 + 4532) = xmmword_24B722CD0;
  *(_OWORD *)(v12 + 4548) = xmmword_24B722CE0;
  *(_OWORD *)(v12 + 4564) = xmmword_24B722CF0;
  *(_OWORD *)(v12 + 4580) = xmmword_24B722D00;
  *(_OWORD *)(v12 + 4596) = xmmword_24B722D10;
  *(_OWORD *)(v12 + 4612) = xmmword_24B722D20;
  *(_OWORD *)(v12 + 4628) = xmmword_24B722D30;
  *(_OWORD *)(v12 + 4644) = xmmword_24B722D40;
  *(_OWORD *)(v12 + 4660) = xmmword_24B722D50;
  *(_OWORD *)(v12 + 4676) = xmmword_24B722D60;
  *(_OWORD *)(v12 + 4692) = xmmword_24B722D70;
  *(_OWORD *)(v12 + 4708) = xmmword_24B722D80;
  *(_OWORD *)(v12 + 4724) = xmmword_24B722D90;
  *(_OWORD *)(v12 + 4740) = xmmword_24B722DA0;
  *(_OWORD *)(v12 + 4756) = xmmword_24B722DB0;
  *(_OWORD *)(v12 + 4772) = xmmword_24B722DC0;
  *(_OWORD *)(v12 + 4788) = xmmword_24B722DD0;
  *(_OWORD *)(v12 + 4804) = xmmword_24B722DE0;
  *(_OWORD *)(v12 + 4820) = xmmword_24B722DF0;
  *(_OWORD *)(v12 + 4836) = xmmword_24B722E00;
  *(_OWORD *)(v12 + 4852) = xmmword_24B722E10;
  *(_OWORD *)(v12 + 4868) = xmmword_24B722E20;
  *(_OWORD *)(v12 + 4884) = xmmword_24B722E30;
  *(_OWORD *)(v12 + 4900) = xmmword_24B722E40;
  *(_OWORD *)(v12 + 4916) = xmmword_24B722E50;
  *(_OWORD *)(v12 + 4932) = xmmword_24B722E60;
  *(_OWORD *)(v12 + 4948) = xmmword_24B722E70;
  *(_OWORD *)(v12 + 4964) = xmmword_24B722E80;
  *(_OWORD *)(v12 + 4980) = xmmword_24B722E90;
  *(_OWORD *)(v12 + 4996) = xmmword_24B722EA0;
  *(_OWORD *)(v12 + 5012) = xmmword_24B722EB0;
  *(_OWORD *)(v12 + 5028) = xmmword_24B722EC0;
  *(_OWORD *)(v12 + 5044) = xmmword_24B722ED0;
  *(_OWORD *)(v12 + 5060) = xmmword_24B722EE0;
  v16.i32[1] = 1065156608;
  *(_OWORD *)(v12 + 5076) = xmmword_24B722EF0;
  *(_OWORD *)(v12 + 5092) = xmmword_24B722F00;
  *((_DWORD *)v12 + 1277) = 1065353216;
  v173 = v15 / v6;
  v170 = v10 + 256;
  __dst = v11 + 257;
  v174 = *(float *)(a1 + 120) * 0.0039062;
  v17 = *(float *)(a1 + 128);
  *(float *)v16.i32 = *(float *)(a1 + 124) * 0.0039062;
  v176 = v16;
  v16.i32[0] = *(_DWORD *)(a1 + 116);
  v178 = v16;
  v18 = (char *)malloc_type_malloc(0x404uLL, 0x100004052888210uLL);
  v19.i32[1] = v176.i32[1];
  v20 = v18;
  v21 = 0;
  v22 = (float)(*(float *)v176.i32 + -2.0) + (float)(v17 * 0.0039062);
  *(float *)v19.i32 = 1.0 - (float)(*(float *)v176.i32 + v22);
  v23 = (float32x4_t)vdupq_lane_s32(v178, 0);
  v24 = (float32x4_t)vdupq_lane_s32(v19, 0);
  v25 = (float32x4_t)vdupq_lane_s32(v176, 0);
  v26 = (float32x4_t)vdupq_n_s32(0x3B800000u);
  v27 = (int16x4_t)0x3000200010000;
  __asm { FMOV            V19.4S, #1.0 }
  do
  {
    v32 = vminnmq_f32(vmulq_n_f32(vmaxnmq_f32(vmulq_f32(vsubq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v27)), v23), v26), (float32x4_t)0), v174), _Q19);
    *(float32x4_t *)&v18[v21] = vminnmq_f32(vmaxnmq_f32(vmulq_f32(vmlaq_f32(v25, vmlaq_n_f32(v24, v32, v22), v32), v32), (float32x4_t)0), _Q19);
    v27 = vadd_s16(v27, (int16x4_t)0x4000400040004);
    v21 += 16;
  }
  while (v21 != 1024);
  *(_DWORD *)v18 = 0;
  *((_DWORD *)v18 + 256) = 1065353216;
  v172 = _Q19;
  lutInterp(0x101u, 0, (const float *)v18, 0x101u, ISP_DEFAULT_TONE_CURVE, v11);
  free(v20);
  lutInterp(0x101u, v11, v13, 0x3FDu, 0, (float *)v12);
  for (i = 0; i != 4064; i += 32)
  {
    v34 = vminnmq_f32(vmulq_n_f32(*(float32x4_t *)&v12[i], v173), v172);
    v35 = vminnmq_f32(vmulq_n_f32(*(float32x4_t *)&v12[i + 16], v173), v172);
    *(float32x4_t *)&v12[i + 4084] = v34;
    *(float32x4_t *)&v12[i + 4100] = v35;
  }
  *((float *)v12 + 2037) = fminf(*((float *)v12 + 1016) * v173, 1.0);
  *((float *)v12 + 2038) = fminf(*((float *)v12 + 1017) * v173, 1.0);
  *((float *)v12 + 2039) = fminf(*((float *)v12 + 1018) * v173, 1.0);
  *((float *)v12 + 2040) = fminf(*((float *)v12 + 1019) * v173, 1.0);
  *((float *)v12 + 2041) = fminf(*((float *)v12 + 1020) * v173, 1.0);
  v34.f32[0] = v15 / v9;
  v171 = *(int32x2_t *)v34.f32;
  lutInterp(0x101u, 0, v11, 0x3FDu, v13, v14);
  v36 = 0;
  v179 = (float32x4_t)vdupq_lane_s32(v171, 0);
  do
  {
    v37 = vmulq_n_f32(*(float32x4_t *)&v12[v36 + 16], *(float *)v171.i32);
    *(float32x4_t *)&v12[v36 + 4084] = vmulq_n_f32(*(float32x4_t *)&v12[v36], *(float *)v171.i32);
    *(float32x4_t *)&v12[v36 + 4100] = v37;
    v36 += 32;
  }
  while (v36 != 4064);
  *((float *)v12 + 2037) = *((float *)v12 + 1016) * *(float *)v171.i32;
  *((float *)v12 + 2038) = *((float *)v12 + 1017) * *(float *)v171.i32;
  *((float *)v12 + 2039) = *((float *)v12 + 1018) * *(float *)v171.i32;
  *((float *)v12 + 2040) = *((float *)v12 + 1019) * *(float *)v171.i32;
  *((float *)v12 + 2041) = *((float *)v12 + 1020) * *(float *)v171.i32;
  lutInterp(0x101u, 0, v11, 0x3FDu, v13, a2[384].f32);
  v38 = 0;
  v39 = vdivq_f32(v172, v179);
  do
  {
    v40 = vminnmq_f32(vmulq_f32(*(float32x4_t *)&v12[v38 + 16], v39), v172);
    *(float32x4_t *)&v12[v38 + 4084] = vminnmq_f32(vmulq_f32(*(float32x4_t *)&v12[v38], v39), v172);
    *(float32x4_t *)&v12[v38 + 4100] = v40;
    v38 += 32;
  }
  while (v38 != 4064);
  *((float *)v12 + 2037) = fminf(*((float *)v12 + 1016) * (float)(1.0 / *(float *)v171.i32), 1.0);
  *((float *)v12 + 2038) = fminf(*((float *)v12 + 1017) * (float)(1.0 / *(float *)v171.i32), 1.0);
  *((float *)v12 + 2039) = fminf(*((float *)v12 + 1018) * (float)(1.0 / *(float *)v171.i32), 1.0);
  *((float *)v12 + 2040) = fminf(*((float *)v12 + 1019) * (float)(1.0 / *(float *)v171.i32), 1.0);
  *((float *)v12 + 2041) = fminf(*((float *)v12 + 1020) * (float)(1.0 / *(float *)v171.i32), 1.0);
  v162 = v14 + 1021;
  lutInterp(0x101u, 0, v11, 0x3FDu, v13, v14 + 1021);
  v44 = 1;
  while (v14[v44] < 1.0)
  {
    if (++v44 == 1021)
      goto LABEL_14;
  }
  *(float *)(a1 + 8) = 1021.0 / (float)(unsigned __int16)v44;
LABEL_14:
  v45 = 1022;
  while (v14[v45] < 1.0)
  {
    if (++v45 == 2042)
    {
      v46 = *(float *)(a1 + 12);
      goto LABEL_19;
    }
  }
  v46 = (float)(unsigned __int16)(v45 - 1021) * 0.00097943;
  *(float *)(a1 + 12) = v46;
LABEL_19:
  v47 = (float *)(a1 + 8);
  v41.i32[0] = *(_DWORD *)(a1 + 8);
  v48 = (int)(float)(1020.0 / *(float *)v41.i32);
  v49 = v48 + 1;
  v50 = (int)(float)(v46 * 255.0);
  if (((v48 + 1) & 0x10000) != 0)
    goto LABEL_40;
  v51 = (unsigned __int16)(v48 + 1);
  if ((unsigned __int16)(v48 + 1) < 0xCu)
  {
    v52 = 0;
LABEL_37:
    v61 = &a2[639].f32[v52 + 2];
    v62 = &v14[v52];
    v63 = v51 - v52;
    do
    {
      v64 = *v62++;
      *v61++ = v64 / *v47;
      --v63;
    }
    while (v63);
    goto LABEL_39;
  }
  v52 = 0;
  v53 = (unint64_t)&a2[639].u64[1] + 4 * v51;
  v55 = (unint64_t)&a2[639].u64[1] < a1 + 12 && (unint64_t)v47 < v53;
  if ((unint64_t)v14 < v53 && &a2[639].u32[2] < (unsigned __int32 *)&v14[v51])
    goto LABEL_37;
  if (v55)
    goto LABEL_37;
  v52 = (unsigned __int16)v49 & 0xFFF8;
  v57 = vdivq_f32(v172, (float32x4_t)vdupq_lane_s32(v41, 0));
  v58 = (float32x4_t *)((char *)a2 + 10248);
  v59 = (float32x4_t *)(v14 + 4);
  v60 = v52;
  do
  {
    v42 = vmulq_f32(*v59, v57);
    v58[-1] = vmulq_f32(v59[-1], v57);
    *v58 = v42;
    v58 += 2;
    v59 += 2;
    v60 -= 8;
  }
  while (v60);
  if (v52 != v51)
    goto LABEL_37;
LABEL_39:
  if ((unsigned __int16)(v48 + 1) <= 0x3FCu)
  {
LABEL_40:
    v65 = (unsigned __int16)(v48 + 1);
    v66 = v48 + 2;
    v67 = (unsigned __int16)(v48 + 2);
    v68 = v65;
    if (v67 > 0x3F6)
      goto LABEL_101;
    v69 = 1022 - v66;
    v68 = (v69 & 0xFFFFFFFFFFFFFFF8) + v65;
    v70 = vadd_s16(vdup_n_s16(v49), (int16x4_t)0x3000200010000);
    v71 = (float32x4_t *)((char *)a2 + 4 * v65 + 10248);
    v42 = (float32x4_t)vdupq_n_s32(0x3A808081u);
    v43.i32[1] = 524296;
    v72 = v69 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v71[-1] = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v70)), v42);
      *v71 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v70, (int16x4_t)0x4000400040004))), v42);
      v70 = vadd_s16(v70, (int16x4_t)0x8000800080008);
      v71 += 2;
      v72 -= 8;
    }
    while (v72);
    if (v69 != (v69 & 0xFFFFFFFFFFFFFFF8))
    {
LABEL_101:
      do
      {
        a2[639].f32[v68 + 2] = (float)(unsigned __int16)v68 * 0.00098039;
        ++v68;
      }
      while ((unsigned __int16)v68 != 1021);
    }
  }
  v73 = 0;
  a2[894].i32[3] = 1065353216;
  v74 = (float32x4_t)vdupq_n_s32(0x40806061u);
  v160 = v50 + 1;
  a2[639].i32[1] = a2[639].i32[0];
  v43.i32[0] = *(_DWORD *)(a1 + 68);
  v42.f32[0] = *(float *)(a1 + 104) * (float)(*(float *)(a1 + 80) * *(float *)v43.i32);
  v75 = v42.f32[0] * 0.00097752;
  *(float *)v43.i32 = (float)(*(float *)(a1 + 112) / (float)(*(float *)v43.i32 * *(float *)v43.i32))
                    + *(float *)(a1 + 108);
  v76 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 0);
  v77 = (float32x4_t)vdupq_lane_s32(v43, 0);
  v78 = vdivq_f32(v172, v76);
  v79 = (int16x4_t)0x3000200010000;
  do
  {
    v80 = (float32x4_t *)&v10[v73];
    v80[64] = vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v77, vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v79)), v74), v78)), v75);
    v80[65] = vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v77, vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v79, (int16x4_t)0x4000400040004))), v74), v78)), v75);
    v79 = vadd_s16(v79, (int16x4_t)0x8000800080008);
    v73 += 8;
  }
  while (v73 != 256);
  v81 = 0;
  v82 = (float32x4_t)vdupq_n_s32(0x40806061u);
  v78.i32[0] = *(_DWORD *)(a1 + 76);
  v77.f32[0] = *(float *)(a1 + 104) * (float)(*(float *)(a1 + 88) * v78.f32[0]);
  v83 = v77.f32[0] * 0.00097752;
  v78.f32[0] = (float)(*(float *)(a1 + 112) / (float)(v78.f32[0] * v78.f32[0])) + *(float *)(a1 + 108);
  v84 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 0);
  v85 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v78.f32, 0);
  v86 = vdivq_f32(v172, v84);
  v87 = (int16x4_t)0x3000200010000;
  do
  {
    v88 = (float32x4_t *)&v10[v81];
    v88[192] = vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v85, vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v87)), v82), v86)), v83);
    v88[193] = vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v85, vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v87, (int16x4_t)0x4000400040004))), v82), v86)), v83);
    v87 = vadd_s16(v87, (int16x4_t)0x8000800080008);
    v81 += 8;
  }
  while (v81 != 256);
  v169 = (float *)(a1 + 8);
  v163 = v50;
  v165 = (float *)(v12 + 4084);
  v167 = v14;
  __src = v11;
  v89 = 0;
  v90 = (float32x4_t)vdupq_n_s32(0x40806061u);
  v86.i32[0] = *(_DWORD *)(a1 + 72);
  v85.f32[0] = *(float *)(a1 + 104) * (float)(*(float *)(a1 + 84) * v86.f32[0]);
  v91 = v85.f32[0] * 0.00097752;
  v86.f32[0] = (float)(*(float *)(a1 + 112) / (float)(v86.f32[0] * v86.f32[0])) + *(float *)(a1 + 108);
  v92 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.f32, 0);
  v93 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 0);
  v94 = vdivq_f32(v172, v92);
  v95 = (int16x4_t)0x3000200010000;
  do
  {
    v96 = (float32x4_t *)&v10[v89];
    v96[128] = vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v93, vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v95)), v90), v94)), v91);
    v96[129] = vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v93, vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v95, (int16x4_t)0x4000400040004))), v90), v94)), v91);
    v95 = vadd_s16(v95, (int16x4_t)0x8000800080008);
    v89 += 8;
  }
  while (v89 != 256);
  v97 = v173 / (float)(v10[639] * *(float *)v171.i32);
  v164 = v10 + 768;
  v98 = 0.02 / v10[307];
  v99 = 2.0 - v98;
  v100 = 3.0 - v98;
  if (v99 > 0.0)
    v100 = 1.0;
  v101 = fmaxf(v100, 0.0) / v10[(int)(float)((float)(*(float *)v171.i32 / v173) * 127.5) + 768];
  v102 = (float)((float)(v173 / v170[(float)(*(float *)v171.i32 * 127.5)]) + v97) + v101;
  v103 = *(float *)(a1 + 52);
  v180 = 7.6004 / (float)(v103 - *(float *)(a1 + 48));
  v104 = 0;
  v177 = v101 / v102;
  v175 = 1.0 / (float)(v103 * *(float *)(a1 + 12));
  v105 = 768;
  v106 = v97 * (float)(1.0 / v102);
  v107 = (float)(1.0 - (float)(v101 / v102))
       * (float)(1.0 / (float)((float)(tanhf((float)(v180 + 3.8002) - (float)(v180 * v103)) * 0.5005) + 0.5));
  do
  {
    v108 = (float)(unsigned __int16)v104;
    v109 = fmaxf((float)((float)(tanhf((float)((float)(v108 * -0.029805) * v175) + 3.8002) * 0.5005) + 0.5) * v106, 0.0);
    v110 = a2;
    v111 = &a2->f32[v105];
    v111[256] = v109;
    v112 = v177
         + (float)(fmaxf((float)(tanhf((float)((float)-(float)(*(float *)(a1 + 52) - (float)(v108 * 0.0039216)) * v180) + 3.8002)* 0.5005)+ 0.5, 0.0)* v107);
    *v111 = v112;
    v111[512] = 1.0 - (float)(v109 + v112);
    a2 = v110;
    ++v104;
    ++v105;
  }
  while (v105 != 1024);
  v113 = 0;
  while (__src[v113] < 1.0)
  {
    if (++v113 == 257)
    {
      v114 = 0.0;
      goto LABEL_60;
    }
  }
  v114 = (float)(unsigned __int16)v113;
LABEL_60:
  if (v173 >= 1.0)
    v115 = (float)(int)(256.0 / v173 + 0.5);
  else
    v115 = 256.0;
  v116 = (int)(float)((float)(v115 * (float)(0.0039062 * v114)) + 0.5);
  memcpy(__dst, __src, 0x404uLL);
  v117 = 0;
  if ((((_WORD)v116 + 1) & 0xFFFE) != 0)
    v118 = (unsigned __int16)(v116 + 1);
  else
    v118 = 1;
  do
  {
    __src[v117 + 257] = __src[(float)((float)((float)((float)(unsigned __int16)v117 * 256.0) * (float)(1.0 / v115)) + 0.5)]
                      / *v169;
    ++v117;
  }
  while (v118 != v117);
  *(_OWORD *)v165 = xmmword_24B722B10;
  *(_OWORD *)(v12 + 4100) = xmmword_24B722B20;
  *(_OWORD *)(v12 + 4116) = xmmword_24B722B30;
  *(_OWORD *)(v12 + 4132) = xmmword_24B722B40;
  *(_OWORD *)(v12 + 4148) = xmmword_24B722B50;
  *(_OWORD *)(v12 + 4164) = xmmword_24B722B60;
  *(_OWORD *)(v12 + 4180) = xmmword_24B722B70;
  *(_OWORD *)(v12 + 4196) = xmmword_24B722B80;
  *(_OWORD *)(v12 + 4212) = xmmword_24B722B90;
  *(_OWORD *)(v12 + 4228) = xmmword_24B722BA0;
  *(_OWORD *)(v12 + 4244) = xmmword_24B722BB0;
  *(_OWORD *)(v12 + 4260) = xmmword_24B722BC0;
  *(_OWORD *)(v12 + 4276) = xmmword_24B722BD0;
  *(_OWORD *)(v12 + 4292) = xmmword_24B722BE0;
  *(_OWORD *)(v12 + 4308) = xmmword_24B722BF0;
  *(_OWORD *)(v12 + 4324) = xmmword_24B722C00;
  *(_OWORD *)(v12 + 4340) = xmmword_24B722C10;
  *(_OWORD *)(v12 + 4356) = xmmword_24B722C20;
  *(_OWORD *)(v12 + 4372) = xmmword_24B722C30;
  *(_OWORD *)(v12 + 4388) = xmmword_24B722C40;
  *(_OWORD *)(v12 + 4404) = xmmword_24B722C50;
  *(_OWORD *)(v12 + 4420) = xmmword_24B722C60;
  *(_OWORD *)(v12 + 4436) = xmmword_24B722C70;
  *(_OWORD *)(v12 + 4452) = xmmword_24B722C80;
  *(_OWORD *)(v12 + 4468) = xmmword_24B722C90;
  *(_OWORD *)(v12 + 4484) = xmmword_24B722CA0;
  *(_OWORD *)(v12 + 4500) = xmmword_24B722CB0;
  *(_OWORD *)(v12 + 4516) = xmmword_24B722CC0;
  *(_OWORD *)(v12 + 4532) = xmmword_24B722CD0;
  *(_OWORD *)(v12 + 4548) = xmmword_24B722CE0;
  *(_OWORD *)(v12 + 4564) = xmmword_24B722CF0;
  *(_OWORD *)(v12 + 4580) = xmmword_24B722D00;
  *(_OWORD *)(v12 + 4596) = xmmword_24B722D10;
  *(_OWORD *)(v12 + 4612) = xmmword_24B722D20;
  *(_OWORD *)(v12 + 4628) = xmmword_24B722D30;
  *(_OWORD *)(v12 + 4644) = xmmword_24B722D40;
  *(_OWORD *)(v12 + 4660) = xmmword_24B722D50;
  *(_OWORD *)(v12 + 4676) = xmmword_24B722D60;
  *(_OWORD *)(v12 + 4692) = xmmword_24B722D70;
  *(_OWORD *)(v12 + 4708) = xmmword_24B722D80;
  *(_OWORD *)(v12 + 4724) = xmmword_24B722D90;
  *(_OWORD *)(v12 + 4740) = xmmword_24B722DA0;
  *(_OWORD *)(v12 + 4756) = xmmword_24B722DB0;
  *(_OWORD *)(v12 + 4772) = xmmword_24B722DC0;
  *(_OWORD *)(v12 + 4788) = xmmword_24B722DD0;
  *(_OWORD *)(v12 + 4804) = xmmword_24B722DE0;
  *(_OWORD *)(v12 + 4820) = xmmword_24B722DF0;
  *(_OWORD *)(v12 + 4836) = xmmword_24B722E00;
  *(_OWORD *)(v12 + 4852) = xmmword_24B722E10;
  *(_OWORD *)(v12 + 4868) = xmmword_24B722E20;
  *(_OWORD *)(v12 + 4884) = xmmword_24B722E30;
  *(_OWORD *)(v12 + 4900) = xmmword_24B722E40;
  *(_OWORD *)(v12 + 4916) = xmmword_24B722E50;
  *(_OWORD *)(v12 + 4932) = xmmword_24B722E60;
  *(_OWORD *)(v12 + 4948) = xmmword_24B722E70;
  *(_OWORD *)(v12 + 4964) = xmmword_24B722E80;
  *(_OWORD *)(v12 + 4980) = xmmword_24B722E90;
  *(_OWORD *)(v12 + 4996) = xmmword_24B722EA0;
  *(_OWORD *)(v12 + 5012) = xmmword_24B722EB0;
  *(_OWORD *)(v12 + 5028) = xmmword_24B722EC0;
  *(_OWORD *)(v12 + 5044) = xmmword_24B722ED0;
  *(_OWORD *)(v12 + 5060) = xmmword_24B722EE0;
  *(_OWORD *)(v12 + 5076) = xmmword_24B722EF0;
  *(_OWORD *)(v12 + 5092) = xmmword_24B722F00;
  *((_DWORD *)v12 + 1277) = 1065353216;
  lutInterp(0x101u, (float *)__dst, v165, 0x100u, 0, (float *)v12);
  lutInterp(0x100u, 0, v170, 0x100u, (float *)v12, v110[64].f32);
  for (j = 0; j != 256; ++j)
    v10[j] = v170[fminf((float)(v173 * (float)(unsigned __int16)j) + 0.5, 255.0)];
  lutInterp(0x100u, 0, v10, 0x100u, (float *)v12, v170);
  for (k = 0; k != 256; ++k)
    v10[k] = v166[fminf((float)((float)(v173 * (float)(unsigned __int16)k) * (float)(1.0 / *(float *)v171.i32)) + 0.5, 255.0)];
  lutInterp(0x100u, 0, v10, 0x100u, (float *)v12, v166);
  memcpy(v10, v164, 0x400uLL);
  lutInterp(0x100u, 0, v10, 0x100u, (float *)v12, (float *)v164);
  v121 = 0;
  *(float *)v122.i32 = (float)((float)(__src[(float)(*(float *)v171.i32 * 127.5)] - *__src) * 0.50196)
                     / (float)(int)(float)(*(float *)v171.i32 * 127.5);
  v123 = (float32x4_t)vdupq_lane_s32(v122, 0);
  do
  {
    v124 = (float32x4_t *)&v10[v121];
    v124[128] = vmulq_n_f32(vmaxnmq_f32(*(float32x4_t *)&v10[v121 + 512], v123), *(float *)v171.i32 / v173);
    v124[64] = vmulq_n_f32(vmaxnmq_f32(*(float32x4_t *)&v10[v121 + 256], v123), 1.0 / v173);
    v124[192] = vmaxnmq_f32(*(float32x4_t *)&v10[v121 + 768], v123);
    v121 += 4;
  }
  while (v121 != 256);
  v125 = 0;
  v126 = v10;
  do
  {
    v127 = &v110->f32[fminf((float)(*v169 * (float)(unsigned __int16)v125) + 0.5, 255.0)];
    v128 = v127[768];
    v129 = v127[1024];
    v130 = v126[256] - (float)((float)(v128 + v129) * v126[256]);
    *v126 = sqrtf((float)((float)(v130 * v130) + (float)((float)(v126[768] * v128) * (float)(v126[768] * v128)))+ (float)((float)(v126[512] * v129) * (float)(v126[512] * v129)));
    ++v126;
    ++v125;
  }
  while (v125 != 256);
  if ((_WORD)v160)
  {
    v131 = 0;
    v132 = v110[256].f32[0];
    v133 = 0.72;
    if (a3)
      v133 = 0.0;
    v134 = (float)(v132 * v133) * *(float *)(a1 + 12);
    v135 = 1.0 / v132;
    v136 = v110;
    do
    {
      v136[895].f32[0] = (float)((float)(unsigned __int16)v131 * 0.0039216)
                       + (float)((float)((float)(v134 * v136[256].f32[0]) * v135)
                               * (float)-(float)((float)((float)(unsigned __int16)v131 * 0.0039216)
                                               - (float)(*(float *)(a1 + 12)
                                                       * v162[vcvts_n_s32_f32((float)(unsigned __int16)v131, 2uLL)])));
      ++v131;
      v136 = (float32x4_t *)((char *)v136 + 4);
    }
    while ((unsigned __int16)v160 != v131);
    if ((unsigned __int16)v160 >= 4u)
    {
      v138 = (int16x4_t)0x3000200010000;
      v137 = (unsigned __int16)v160 & 0xFFFC;
      v139 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v140 = v137;
      v141 = v110;
      do
      {
        v142 = vmaxnmq_f32(vdivq_f32(vmulq_f32(v141[895], v139), vcvtq_f32_u32(vmovl_u16(vmax_u16((uint16x4_t)v138, (uint16x4_t)0x1000100010001)))), v172);
        v141[256] = vmulq_f32(v142, v141[256]);
        v141[192] = vmulq_f32(v142, v141[192]);
        v141[320] = vmulq_f32(v141[320], v142);
        v138 = vadd_s16(v138, (int16x4_t)0x4000400040004);
        ++v141;
        v140 -= 4;
      }
      while (v140);
      if (v137 == (unsigned __int16)v160)
        goto LABEL_89;
    }
    else
    {
      v137 = 0;
    }
    v143 = v110 + 320;
    do
    {
      v144 = v137;
      v145 = (unsigned __int16)v137;
      if ((v137 & 0xFFFE) == 0)
        v145 = 1;
      v146 = (float)(v110[895].f32[v137] * 255.0) / (float)v145;
      v147 = &v110->f32[v144];
      v148 = fmaxf(v146, 1.0);
      v149 = v148 * v110[192].f32[v144];
      v150 = v143->f32[v137];
      v147[1024] = v148 * v110[256].f32[v144];
      v147[768] = v149;
      v143->f32[v137++] = v150 * v148;
    }
    while ((unsigned __int16)v160 != v137);
LABEL_89:
    if ((unsigned __int16)v160 > 0xFFu)
      goto LABEL_92;
  }
  v151 = (unsigned __int16)v160;
  v152 = (unsigned __int16)(v163 + 2);
  v153 = 257 - v152;
  if ((unint64_t)(257 - v152) < 8)
    goto LABEL_102;
  v154 = 256 - v152;
  if ((unsigned __int16)(-3 - v163) < (unsigned __int16)v154)
    goto LABEL_102;
  if (v154 >> 16)
    goto LABEL_102;
  v155 = vadd_s16(vdup_n_s16(v160), (int16x4_t)0x3000200010000);
  v156 = (float32x4_t *)((char *)v110 + 4 * (unsigned __int16)v160 + 14336);
  v157 = (float32x4_t)vdupq_n_s32(0x3B808081u);
  v158 = v153 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v156[-1] = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v155)), v157);
    *v156 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v155, (int16x4_t)0x4000400040004))), v157);
    v155 = vadd_s16(v155, (int16x4_t)0x8000800080008);
    v156 += 2;
    v158 -= 8;
  }
  while (v158);
  v151 = (v153 & 0xFFFFFFFFFFFFFFF8) + (unsigned __int16)v160;
  if (v153 != (v153 & 0xFFFFFFFFFFFFFFF8))
  {
LABEL_102:
    do
    {
      v110[895].f32[v151] = (float)(unsigned __int16)v151 * 0.0039216;
      ++v151;
    }
    while ((unsigned __int16)v151 != 256);
  }
LABEL_92:
  v110[959].i32[0] = 1065353216;
  lutInterp(0x100u, v110[895].f32, v10, 0x100u, 0, v110->f32);
  free(v10);
  free(__src);
  free(v12);
  free(v167);
}

void lutInterp(unsigned int a1, float *a2, const float *a3, unsigned int a4, float *a5, float *a6)
{
  float *v12;
  float *v13;
  int32x2_t v14;
  uint64_t v15;
  unint64_t v16;
  float32x4_t v22;
  int16x4_t v23;
  float32x4_t *v24;
  float v25;
  float *v26;
  float *v27;
  int32x2_t v28;
  uint64_t v29;
  unint64_t v30;
  float32x4_t v32;
  int16x4_t v33;
  float32x4_t *v34;
  float v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  float v40;
  int v41;
  float v42;
  uint64_t v43;
  float v44;

  v12 = a2;
  if (!a2)
  {
    v13 = (float *)malloc_type_malloc(4 * a1, 0x100004052888210uLL);
    v12 = v13;
    if (a1)
    {
      *(float *)v14.i32 = (float)(int)(a1 - 1);
      if (a1 < 8)
      {
        v15 = 0;
LABEL_8:
        v25 = 1.0 / *(float *)v14.i32;
        do
        {
          v13[v15] = (float)(unsigned __int16)v15 * v25;
          ++v15;
        }
        while (a1 != v15);
        goto LABEL_10;
      }
      v16 = 0;
      v15 = (unsigned __int16)a1 & 0xFFF8;
      __asm { FMOV            V2.4S, #1.0 }
      v22 = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(v14, 0));
      v23 = (int16x4_t)0x3000200010000;
      do
      {
        v24 = (float32x4_t *)&v13[v16 / 4];
        *v24 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v23)), v22);
        v24[1] = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v23, (int16x4_t)0x4000400040004))), v22);
        v23 = vadd_s16(v23, (int16x4_t)0x8000800080008);
        v16 += 32;
      }
      while (((4 * a1) & 0x3FFE0) != v16);
      if (v15 != a1)
        goto LABEL_8;
    }
  }
LABEL_10:
  v26 = a5;
  if (a5)
    goto LABEL_19;
  v27 = (float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  v26 = v27;
  if (!a4)
    goto LABEL_35;
  *(float *)v28.i32 = (float)(int)(a4 - 1);
  if (a4 < 8)
  {
    v29 = 0;
LABEL_17:
    v35 = 1.0 / *(float *)v28.i32;
    do
    {
      v27[v29] = (float)(unsigned __int16)v29 * v35;
      ++v29;
    }
    while (a4 != v29);
    goto LABEL_19;
  }
  v30 = 0;
  v29 = (unsigned __int16)a4 & 0xFFF8;
  __asm { FMOV            V2.4S, #1.0 }
  v32 = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(v28, 0));
  v33 = (int16x4_t)0x3000200010000;
  do
  {
    v34 = (float32x4_t *)&v27[v30 / 4];
    *v34 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v33)), v32);
    v34[1] = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v33, (int16x4_t)0x4000400040004))), v32);
    v33 = vadd_s16(v33, (int16x4_t)0x8000800080008);
    v30 += 32;
  }
  while (((4 * a4) & 0x3FFE0) != v30);
  if (v29 != a4)
    goto LABEL_17;
LABEL_19:
  if (a4)
  {
    v36 = 0;
    v37 = 0;
    v38 = a1 - 1;
    v39 = 1;
    do
    {
      v40 = fminf(v26[v36], v12[v38]);
      if ((int)v38 > (int)v37)
      {
        v41 = v37;
        do
        {
          v42 = v12[v41];
          if (v42 >= v40)
            break;
          if (v40 >= v42 && v42 > v12[v37])
            v37 = v41;
          ++v41;
        }
        while ((int)v38 > v41);
      }
      if (v39 < a1)
      {
        v43 = v39;
        do
        {
          v44 = v12[v43];
          if (v40 <= v44)
          {
            v39 = (unsigned __int16)v43;
            if (v44 > v12[v37])
              break;
          }
          ++v43;
        }
        while (a1 != (unsigned __int16)v43);
      }
      a6[v36++] = (float)((float)((float)(v40 - v12[v37]) * (float)(a3[v39] - a3[v37])) / (float)(v12[v39] - v12[v37]))
                + a3[v37];
    }
    while (v36 != a4);
  }
LABEL_35:
  if (a2)
  {
    if (a5)
      return;
LABEL_39:
    free(v26);
    return;
  }
  free(v12);
  if (!a5)
    goto LABEL_39;
}

void noiseHistToneCurve(uint64_t a1, float *a2, float *a3, float *a4)
{
  float32x4_t *v8;
  float32x4_t *v9;
  uint64_t v10;
  float v11;
  float *v12;
  float v13;
  unsigned int v14;
  float *v15;
  float v16;
  unsigned __int16 v17;
  uint64_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v27;
  float32x4_t *v28;
  float32x4_t v29;
  uint64_t v30;
  float *v31;
  float v32;
  uint64_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t *v37;
  float32x4_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float32x4_t *v42;
  float32x4_t v43;
  float *v44;
  uint64_t v45;
  float *v46;
  float v47;
  uint64_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t *v52;
  float32x4_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float32x4_t *v57;
  float32x4_t v58;
  uint64_t v59;
  float *v60;
  float *v61;
  float v62;
  uint64_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t *v67;
  float32x4_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  float32x4_t *v72;
  float32x4_t v73;
  uint64_t v74;
  float *v75;
  float *v76;
  float v77;
  uint64_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t *v82;
  float32x4_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  float32x4_t *v87;
  float32x4_t v88;
  uint64_t v89;
  float *v90;
  float *v91;
  float v92;
  uint64_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t *v97;
  float32x4_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  float32x4_t *v102;
  float32x4_t v103;
  uint64_t v104;
  float *v105;
  float *v106;
  float v107;
  uint64_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t *v112;
  float32x4_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  float32x4_t *v117;
  float32x4_t v118;
  uint64_t v119;
  float *v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  float32x4_t *v124;
  float32x4_t v125;
  float *v126;
  uint64_t v127;
  uint64_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t *v132;
  float32x4_t v133;
  uint64_t v134;
  const float *v135;
  int8x16_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t *v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  uint64_t v145;
  float v146;
  float v147;
  float v148;
  float v149;
  const float *v150;
  float32x4_t v151;
  int8x16_t v152;
  float32x4_t v153;
  float32x4_t *v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  uint64_t v159;
  float v160;
  float v161;
  float v162;
  float v163;
  const float *v164;
  float32x4_t v165;
  int8x16_t v166;
  float32x4_t v167;
  float32x4_t *v168;
  float32x4_t v169;
  float32x4_t v170;
  float32x4_t v171;
  float32x4_t v172;
  uint64_t v173;
  float v174;
  float v175;
  float v176;
  float v177;
  const float *v178;
  float32x4_t v179;
  int8x16_t v180;
  float32x4_t v181;
  float32x4_t *v182;
  float32x4_t v183;
  float32x4_t v184;
  float32x4_t v185;
  float32x4_t v186;
  uint64_t v187;
  float v188;
  float v189;
  float v190;
  float v191;
  const float *v192;
  float32x4_t v193;
  int8x16_t v194;
  float32x4_t v195;
  float32x4_t *v196;
  float32x4_t v197;
  float32x4_t v198;
  float32x4_t v199;
  float32x4_t v200;
  uint64_t v201;
  float v202;
  float v203;
  float v204;
  float v205;
  const float *v206;
  float32x4_t v207;
  int8x16_t v208;
  float32x4_t v209;
  float32x4_t *v210;
  float32x4_t v211;
  float32x4_t v212;
  float32x4_t v213;
  uint64_t v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float32x4_t v219;
  float32x4_t v220;
  float32x4_t v221;
  float32x4_t *v222;
  float32x4_t v223;
  float v224;
  uint64_t i;
  unsigned __int16 v226;
  float v227;
  uint64_t v228;
  float v229;
  float v230;
  float v231;
  float v232;
  float v233;
  uint64_t v234;
  uint64_t v235;
  int16x4_t v236;
  float32x4_t *v237;
  uint64_t v238;
  float32x4_t v239;
  uint64_t j;
  unsigned int v241;
  float v242;
  float v243;
  float v244;
  float v245;
  float v246;
  float v247;
  float v248;
  uint64_t v249;
  float32x4_t v250;
  float32x4_t *v251;
  float32x4_t v252;

  v8 = (float32x4_t *)malloc_type_malloc(0xC00uLL, 0xE9E765BAuLL);
  if (!v8)
    exit(1);
  v9 = v8;
  v10 = 0;
  v11 = a2[6] * 0.0039062;
  v12 = (float *)v8;
  do
  {
    *v12 = sqrtf((float)*(unsigned int *)(a1 + 4 * v10));
    v13 = (float)(unsigned __int16)v10;
    v14 = (int)(float)((float)(a2[2] * v13) + 0.5);
    if (v14 >= 0xFF)
      v14 = 255;
    v12[256] = v11;
    v15 = &a3[v14];
    v16 = (float)(a2[9] * v15[768])
        + (float)((float)((float)(a2[8] - (float)((float)(v15[1024] + v15[768]) * a2[8])) + (float)(a2[7] * v15[1024]))
                * a2[2]);
    v12[512] = v16;
    v12[512] = fmaxf(fminf(v16 * 0.0039216, fmaxf(v13 * 0.0039216, a2[16]) / (float)(a3[v10++] * (float)(255.0 * a2[5]))), v11);
    ++v12;
  }
  while (v10 != 256);
  if ((int)(float)((float)(256.0 / a2[2]) + 0.5) <= 0x100)
  {
    v17 = 256;
    do
    {
      if (v8->f32[v17] >= 1.0)
        break;
      v8[64].i32[v17--] = 0;
    }
    while ((int)(float)((float)(256.0 / a2[2]) + 0.5) <= v17);
  }
  else
  {
    v17 = 256;
  }
  v18 = 0;
  v19 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v20 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v19);
  v20.i64[0] = vpaddq_f32(v20, v20).u64[0];
  v20.f32[0] = vaddv_f32(*(float32x2_t *)v20.f32);
  v21 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 0);
  __asm { FMOV            V0.4S, #1.0 }
  v27 = vdivq_f32(_Q0, v21);
  do
  {
    v28 = &v8[v18];
    v29 = vmulq_f32(v8[v18 + 1], v27);
    *v28 = vmulq_f32(v8[v18], v27);
    v28[1] = v29;
    v18 += 2;
  }
  while (v18 != 64);
  if (v17)
  {
    v30 = v17;
    v27.i32[0] = 0;
    v31 = (float *)v8;
    do
    {
      v32 = v31[256];
      if (*v31 < v32)
        v27.f32[0] = (float)(v27.f32[0] - *v31) + v32;
      ++v31;
      --v30;
    }
    while (v30);
  }
  else
  {
    v27.i32[0] = 0;
  }
  v33 = 0;
  v34 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v35 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v34);
  v27.f32[0] = v27.f32[0] + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v35, v35));
  v36 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0));
  do
  {
    v37 = &v8[v33];
    v38 = vmulq_f32(v8[v33 + 1], v36);
    *v37 = vmulq_f32(v8[v33], v36);
    v37[1] = v38;
    v33 += 2;
  }
  while (v33 != 64);
  if (!v17)
  {
    v36.i32[0] = 0;
    goto LABEL_35;
  }
  v39 = v17;
  if (v17 < 8u)
  {
    v40 = 0;
LABEL_29:
    v44 = &v8->f32[v40];
    v45 = v17 - v40;
    do
    {
      *v44 = fminf(*v44, v44[512]);
      ++v44;
      --v45;
    }
    while (v45);
    goto LABEL_31;
  }
  v40 = v17 & 0xFFF8;
  v41 = v40;
  v42 = v8;
  do
  {
    v36 = vminnmq_f32(*v42, v42[128]);
    v43 = vminnmq_f32(v42[1], v42[129]);
    *v42 = v36;
    v42[1] = v43;
    v42 += 2;
    v41 -= 8;
  }
  while (v41);
  if (v40 != v17)
    goto LABEL_29;
LABEL_31:
  v36.i32[0] = 0;
  v46 = (float *)v8;
  do
  {
    v47 = v46[256];
    if (*v46 < v47)
      v36.f32[0] = (float)(v36.f32[0] - *v46) + v47;
    ++v46;
    --v39;
  }
  while (v39);
LABEL_35:
  v48 = 0;
  v49 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v50 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v49);
  v36.f32[0] = v36.f32[0] + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v50, v50));
  v51 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 0));
  do
  {
    v52 = &v8[v48];
    v53 = vmulq_f32(v8[v48 + 1], v51);
    *v52 = vmulq_f32(v8[v48], v51);
    v52[1] = v53;
    v48 += 2;
  }
  while (v48 != 64);
  if (!v17)
  {
    v51.i32[0] = 0;
    goto LABEL_50;
  }
  v54 = v17;
  if (v17 < 8u)
  {
    v55 = 0;
LABEL_44:
    v59 = v17 - v55;
    v60 = &v8->f32[v55];
    do
    {
      *v60 = fminf(*v60, v60[512]);
      ++v60;
      --v59;
    }
    while (v59);
    goto LABEL_46;
  }
  v55 = v17 & 0xFFF8;
  v56 = v55;
  v57 = v8;
  do
  {
    v51 = vminnmq_f32(*v57, v57[128]);
    v58 = vminnmq_f32(v57[1], v57[129]);
    *v57 = v51;
    v57[1] = v58;
    v57 += 2;
    v56 -= 8;
  }
  while (v56);
  if (v55 != v17)
    goto LABEL_44;
LABEL_46:
  v51.i32[0] = 0;
  v61 = (float *)v8;
  do
  {
    v62 = v61[256];
    if (*v61 < v62)
      v51.f32[0] = (float)(v51.f32[0] - *v61) + v62;
    ++v61;
    --v54;
  }
  while (v54);
LABEL_50:
  v63 = 0;
  v64 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v65 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v64);
  v51.f32[0] = v51.f32[0] + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v65, v65));
  v66 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0));
  do
  {
    v67 = &v8[v63];
    v68 = vmulq_f32(v8[v63 + 1], v66);
    *v67 = vmulq_f32(v8[v63], v66);
    v67[1] = v68;
    v63 += 2;
  }
  while (v63 != 64);
  if (!v17)
  {
    v66.i32[0] = 0;
    goto LABEL_65;
  }
  v69 = v17;
  if (v17 < 8u)
  {
    v70 = 0;
LABEL_59:
    v74 = v17 - v70;
    v75 = &v8->f32[v70];
    do
    {
      *v75 = fminf(*v75, v75[512]);
      ++v75;
      --v74;
    }
    while (v74);
    goto LABEL_61;
  }
  v70 = v17 & 0xFFF8;
  v71 = v70;
  v72 = v8;
  do
  {
    v66 = vminnmq_f32(*v72, v72[128]);
    v73 = vminnmq_f32(v72[1], v72[129]);
    *v72 = v66;
    v72[1] = v73;
    v72 += 2;
    v71 -= 8;
  }
  while (v71);
  if (v70 != v17)
    goto LABEL_59;
LABEL_61:
  v66.i32[0] = 0;
  v76 = (float *)v8;
  do
  {
    v77 = v76[256];
    if (*v76 < v77)
      v66.f32[0] = (float)(v66.f32[0] - *v76) + v77;
    ++v76;
    --v69;
  }
  while (v69);
LABEL_65:
  v78 = 0;
  v79 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v80 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v79);
  v66.f32[0] = v66.f32[0] + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v80, v80));
  v81 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.f32, 0));
  do
  {
    v82 = &v8[v78];
    v83 = vmulq_f32(v8[v78 + 1], v81);
    *v82 = vmulq_f32(v8[v78], v81);
    v82[1] = v83;
    v78 += 2;
  }
  while (v78 != 64);
  if (!v17)
  {
    v81.i32[0] = 0;
    goto LABEL_80;
  }
  v84 = v17;
  if (v17 < 8u)
  {
    v85 = 0;
LABEL_74:
    v89 = v17 - v85;
    v90 = &v8->f32[v85];
    do
    {
      *v90 = fminf(*v90, v90[512]);
      ++v90;
      --v89;
    }
    while (v89);
    goto LABEL_76;
  }
  v85 = v17 & 0xFFF8;
  v86 = v85;
  v87 = v8;
  do
  {
    v81 = vminnmq_f32(*v87, v87[128]);
    v88 = vminnmq_f32(v87[1], v87[129]);
    *v87 = v81;
    v87[1] = v88;
    v87 += 2;
    v86 -= 8;
  }
  while (v86);
  if (v85 != v17)
    goto LABEL_74;
LABEL_76:
  v81.i32[0] = 0;
  v91 = (float *)v8;
  do
  {
    v92 = v91[256];
    if (*v91 < v92)
      v81.f32[0] = (float)(v81.f32[0] - *v91) + v92;
    ++v91;
    --v84;
  }
  while (v84);
LABEL_80:
  v93 = 0;
  v94 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v95 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v94);
  v81.f32[0] = v81.f32[0] + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v95, v95));
  v96 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 0));
  do
  {
    v97 = &v8[v93];
    v98 = vmulq_f32(v8[v93 + 1], v96);
    *v97 = vmulq_f32(v8[v93], v96);
    v97[1] = v98;
    v93 += 2;
  }
  while (v93 != 64);
  if (!v17)
  {
    v96.i32[0] = 0;
    goto LABEL_95;
  }
  v99 = v17;
  if (v17 < 8u)
  {
    v100 = 0;
LABEL_89:
    v104 = v17 - v100;
    v105 = &v8->f32[v100];
    do
    {
      *v105 = fminf(*v105, v105[512]);
      ++v105;
      --v104;
    }
    while (v104);
    goto LABEL_91;
  }
  v100 = v17 & 0xFFF8;
  v101 = v100;
  v102 = v8;
  do
  {
    v96 = vminnmq_f32(*v102, v102[128]);
    v103 = vminnmq_f32(v102[1], v102[129]);
    *v102 = v96;
    v102[1] = v103;
    v102 += 2;
    v101 -= 8;
  }
  while (v101);
  if (v100 != v17)
    goto LABEL_89;
LABEL_91:
  v96.i32[0] = 0;
  v106 = (float *)v8;
  do
  {
    v107 = v106[256];
    if (*v106 < v107)
      v96.f32[0] = (float)(v96.f32[0] - *v106) + v107;
    ++v106;
    --v99;
  }
  while (v99);
LABEL_95:
  v108 = 0;
  v109 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v110 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v109);
  v96.f32[0] = v96.f32[0] + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v110, v110));
  v111 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 0));
  do
  {
    v112 = &v8[v108];
    v113 = vmulq_f32(v8[v108 + 1], v111);
    *v112 = vmulq_f32(v8[v108], v111);
    v112[1] = v113;
    v108 += 2;
  }
  while (v108 != 64);
  if (!v17)
    goto LABEL_113;
  v114 = v17;
  if (v17 < 8u)
  {
    v115 = 0;
LABEL_103:
    v119 = v17 - v115;
    v120 = &v8->f32[v115];
    do
    {
      *v120 = fminf(*v120, v120[512]);
      ++v120;
      --v119;
    }
    while (v119);
    goto LABEL_105;
  }
  v115 = v17 & 0xFFF8;
  v116 = v115;
  v117 = v8;
  do
  {
    v118 = vminnmq_f32(v117[1], v117[129]);
    *v117 = vminnmq_f32(*v117, v117[128]);
    v117[1] = v118;
    v117 += 2;
    v116 -= 8;
  }
  while (v116);
  if (v115 != v17)
    goto LABEL_103;
LABEL_105:
  if (v17 > 1u)
  {
    if (v17 >= 9u)
    {
      v122 = (v17 - 1) & 0xFFFFFFFFFFFFFFF8;
      v121 = v122 | 1;
      v123 = v122;
      v124 = v8;
      do
      {
        v125 = vmaxnmq_f32(*(float32x4_t *)((char *)v124 + 20), *(float32x4_t *)((char *)v124 + 1044));
        *(float32x4_t *)((char *)v124 + 4) = vmaxnmq_f32(*(float32x4_t *)((char *)v124 + 4), *(float32x4_t *)((char *)v124 + 1028));
        *(float32x4_t *)((char *)v124 + 20) = v125;
        v124 += 2;
        v123 -= 8;
      }
      while (v123);
      if (v114 - 1 == v122)
        goto LABEL_113;
    }
    else
    {
      v121 = 1;
    }
    v126 = &v8->f32[v121];
    v127 = v114 - v121;
    do
    {
      *v126 = fmaxf(*v126, v126[256]);
      ++v126;
      --v127;
    }
    while (v127);
  }
LABEL_113:
  v128 = 0;
  v129 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v130 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v129);
  v130.i64[0] = vpaddq_f32(v130, v130).u64[0];
  v130.f32[0] = vaddv_f32(*(float32x2_t *)v130.f32);
  v131 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v130.f32, 0));
  do
  {
    v132 = &v8[v128];
    v133 = vmulq_f32(v8[v128 + 1], v131);
    *v132 = vmulq_f32(v8[v128], v131);
    v132[1] = v133;
    v128 += 2;
  }
  while (v128 != 64);
  v134 = 0;
  v135 = (const float *)v8;
  v136 = (int8x16_t)vld1q_dup_f32(v135++);
  v137 = vld1q_dup_f32(v135);
  v138.i64[0] = 0x3F0000003F000000;
  v138.i64[1] = 0x3F0000003F000000;
  __asm { FMOV            V1.4S, #0.25 }
  do
  {
    v140 = &v8[v134];
    v141 = *(float32x4_t *)((char *)&v8[v134] + 8);
    v142 = (float32x4_t)vextq_s8((int8x16_t)v137, (int8x16_t)v141, 0xCuLL);
    v137 = *(float32x4_t *)((char *)&v8[v134 + 1] + 8);
    v143 = (float32x4_t)vextq_s8((int8x16_t)v141, (int8x16_t)v137, 0xCuLL);
    v144 = (float32x4_t)vextq_s8((int8x16_t)v142, (int8x16_t)v143, 0xCuLL);
    *(float32x4_t *)((char *)v140 + 4) = vmlaq_f32(vmulq_f32(v142, v138), vaddq_f32(v141, (float32x4_t)vextq_s8(v136, (int8x16_t)v142, 0xCuLL)), _Q1);
    *(float32x4_t *)((char *)v140 + 20) = vmlaq_f32(vmulq_f32(v143, v138), vaddq_f32(v137, v144), _Q1);
    v134 += 2;
    v136 = (int8x16_t)v143;
  }
  while (v134 != 62);
  v145 = 0;
  v146 = v8[62].f32[2];
  v8[62].f32[1] = vmuls_lane_f32(0.5, v137, 3) + (float)((float)(v146 + v137.f32[2]) * 0.25);
  v147 = v8[62].f32[3];
  v8[62].f32[2] = (float)(v146 * 0.5) + (float)((float)(v147 + v137.f32[3]) * 0.25);
  v148 = v8[63].f32[0];
  v8[62].f32[3] = (float)(v147 * 0.5) + (float)((float)(v148 + v146) * 0.25);
  v149 = v8[63].f32[1];
  v8[63].f32[0] = (float)(v148 * 0.5) + (float)((float)(v149 + v147) * 0.25);
  v144.i32[0] = v8[63].i32[2];
  v150 = &v8->f32[1];
  v151 = vld1q_dup_f32(v150);
  v8[63].f32[1] = (float)(v149 * 0.5) + (float)((float)(v144.f32[0] + v148) * 0.25);
  v152 = (int8x16_t)vdupq_lane_s32(*(int32x2_t *)v144.f32, 0);
  v8[63].f32[2] = (float)(v144.f32[0] * 0.5) + (float)((float)(v8[63].f32[3] + v149) * 0.25);
  v153.i64[0] = 0x3F0000003F000000;
  v153.i64[1] = 0x3F0000003F000000;
  do
  {
    v154 = &v8[v145];
    v155 = *(float32x4_t *)((char *)&v8[v145] + 8);
    v156 = (float32x4_t)vextq_s8((int8x16_t)v151, (int8x16_t)v155, 0xCuLL);
    v151 = *(float32x4_t *)((char *)&v8[v145 + 1] + 8);
    v157 = (float32x4_t)vextq_s8((int8x16_t)v155, (int8x16_t)v151, 0xCuLL);
    v158 = (float32x4_t)vextq_s8((int8x16_t)v156, (int8x16_t)v157, 0xCuLL);
    *(float32x4_t *)((char *)v154 + 4) = vmlaq_f32(vmulq_f32(v156, v153), vaddq_f32(v155, (float32x4_t)vextq_s8(v152, (int8x16_t)v156, 0xCuLL)), _Q1);
    *(float32x4_t *)((char *)v154 + 20) = vmlaq_f32(vmulq_f32(v157, v153), vaddq_f32(v151, v158), _Q1);
    v145 += 2;
    v152 = (int8x16_t)v157;
  }
  while (v145 != 62);
  v159 = 0;
  v160 = v8[62].f32[2];
  v8[62].f32[1] = vmuls_lane_f32(0.5, v151, 3) + (float)((float)(v160 + v151.f32[2]) * 0.25);
  v161 = v8[62].f32[3];
  v8[62].f32[2] = (float)(v160 * 0.5) + (float)((float)(v161 + v151.f32[3]) * 0.25);
  v162 = v8[63].f32[0];
  v8[62].f32[3] = (float)(v161 * 0.5) + (float)((float)(v162 + v160) * 0.25);
  v163 = v8[63].f32[1];
  v8[63].f32[0] = (float)(v162 * 0.5) + (float)((float)(v163 + v161) * 0.25);
  v158.i32[0] = v8[63].i32[2];
  v164 = &v8->f32[1];
  v165 = vld1q_dup_f32(v164);
  v8[63].f32[1] = (float)(v163 * 0.5) + (float)((float)(v158.f32[0] + v162) * 0.25);
  v166 = (int8x16_t)vdupq_lane_s32(*(int32x2_t *)v158.f32, 0);
  v8[63].f32[2] = (float)(v158.f32[0] * 0.5) + (float)((float)(v8[63].f32[3] + v163) * 0.25);
  v167.i64[0] = 0x3F0000003F000000;
  v167.i64[1] = 0x3F0000003F000000;
  do
  {
    v168 = &v8[v159];
    v169 = *(float32x4_t *)((char *)&v8[v159] + 8);
    v170 = (float32x4_t)vextq_s8((int8x16_t)v165, (int8x16_t)v169, 0xCuLL);
    v165 = *(float32x4_t *)((char *)&v8[v159 + 1] + 8);
    v171 = (float32x4_t)vextq_s8((int8x16_t)v169, (int8x16_t)v165, 0xCuLL);
    v172 = (float32x4_t)vextq_s8((int8x16_t)v170, (int8x16_t)v171, 0xCuLL);
    *(float32x4_t *)((char *)v168 + 4) = vmlaq_f32(vmulq_f32(v170, v167), vaddq_f32(v169, (float32x4_t)vextq_s8(v166, (int8x16_t)v170, 0xCuLL)), _Q1);
    *(float32x4_t *)((char *)v168 + 20) = vmlaq_f32(vmulq_f32(v171, v167), vaddq_f32(v165, v172), _Q1);
    v159 += 2;
    v166 = (int8x16_t)v171;
  }
  while (v159 != 62);
  v173 = 0;
  v174 = v8[62].f32[2];
  v8[62].f32[1] = vmuls_lane_f32(0.5, v165, 3) + (float)((float)(v174 + v165.f32[2]) * 0.25);
  v175 = v8[62].f32[3];
  v8[62].f32[2] = (float)(v174 * 0.5) + (float)((float)(v175 + v165.f32[3]) * 0.25);
  v176 = v8[63].f32[0];
  v8[62].f32[3] = (float)(v175 * 0.5) + (float)((float)(v176 + v174) * 0.25);
  v177 = v8[63].f32[1];
  v8[63].f32[0] = (float)(v176 * 0.5) + (float)((float)(v177 + v175) * 0.25);
  v172.i32[0] = v8[63].i32[2];
  v178 = &v8->f32[1];
  v179 = vld1q_dup_f32(v178);
  v8[63].f32[1] = (float)(v177 * 0.5) + (float)((float)(v172.f32[0] + v176) * 0.25);
  v180 = (int8x16_t)vdupq_lane_s32(*(int32x2_t *)v172.f32, 0);
  v8[63].f32[2] = (float)(v172.f32[0] * 0.5) + (float)((float)(v8[63].f32[3] + v177) * 0.25);
  v181.i64[0] = 0x3F0000003F000000;
  v181.i64[1] = 0x3F0000003F000000;
  do
  {
    v182 = &v8[v173];
    v183 = *(float32x4_t *)((char *)&v8[v173] + 8);
    v184 = (float32x4_t)vextq_s8((int8x16_t)v179, (int8x16_t)v183, 0xCuLL);
    v179 = *(float32x4_t *)((char *)&v8[v173 + 1] + 8);
    v185 = (float32x4_t)vextq_s8((int8x16_t)v183, (int8x16_t)v179, 0xCuLL);
    v186 = (float32x4_t)vextq_s8((int8x16_t)v184, (int8x16_t)v185, 0xCuLL);
    *(float32x4_t *)((char *)v182 + 4) = vmlaq_f32(vmulq_f32(v184, v181), vaddq_f32(v183, (float32x4_t)vextq_s8(v180, (int8x16_t)v184, 0xCuLL)), _Q1);
    *(float32x4_t *)((char *)v182 + 20) = vmlaq_f32(vmulq_f32(v185, v181), vaddq_f32(v179, v186), _Q1);
    v173 += 2;
    v180 = (int8x16_t)v185;
  }
  while (v173 != 62);
  v187 = 0;
  v188 = v8[62].f32[2];
  v8[62].f32[1] = vmuls_lane_f32(0.5, v179, 3) + (float)((float)(v188 + v179.f32[2]) * 0.25);
  v189 = v8[62].f32[3];
  v8[62].f32[2] = (float)(v188 * 0.5) + (float)((float)(v189 + v179.f32[3]) * 0.25);
  v190 = v8[63].f32[0];
  v8[62].f32[3] = (float)(v189 * 0.5) + (float)((float)(v190 + v188) * 0.25);
  v191 = v8[63].f32[1];
  v8[63].f32[0] = (float)(v190 * 0.5) + (float)((float)(v191 + v189) * 0.25);
  v186.i32[0] = v8[63].i32[2];
  v192 = &v8->f32[1];
  v193 = vld1q_dup_f32(v192);
  v8[63].f32[1] = (float)(v191 * 0.5) + (float)((float)(v186.f32[0] + v190) * 0.25);
  v194 = (int8x16_t)vdupq_lane_s32(*(int32x2_t *)v186.f32, 0);
  v8[63].f32[2] = (float)(v186.f32[0] * 0.5) + (float)((float)(v8[63].f32[3] + v191) * 0.25);
  v195.i64[0] = 0x3F0000003F000000;
  v195.i64[1] = 0x3F0000003F000000;
  do
  {
    v196 = &v8[v187];
    v197 = *(float32x4_t *)((char *)&v8[v187] + 8);
    v198 = (float32x4_t)vextq_s8((int8x16_t)v193, (int8x16_t)v197, 0xCuLL);
    v193 = *(float32x4_t *)((char *)&v8[v187 + 1] + 8);
    v199 = (float32x4_t)vextq_s8((int8x16_t)v197, (int8x16_t)v193, 0xCuLL);
    v200 = (float32x4_t)vextq_s8((int8x16_t)v198, (int8x16_t)v199, 0xCuLL);
    *(float32x4_t *)((char *)v196 + 4) = vmlaq_f32(vmulq_f32(v198, v195), vaddq_f32(v197, (float32x4_t)vextq_s8(v194, (int8x16_t)v198, 0xCuLL)), _Q1);
    *(float32x4_t *)((char *)v196 + 20) = vmlaq_f32(vmulq_f32(v199, v195), vaddq_f32(v193, v200), _Q1);
    v187 += 2;
    v194 = (int8x16_t)v199;
  }
  while (v187 != 62);
  v201 = 0;
  v202 = v8[62].f32[2];
  v8[62].f32[1] = vmuls_lane_f32(0.5, v193, 3) + (float)((float)(v202 + v193.f32[2]) * 0.25);
  v203 = v8[62].f32[3];
  v8[62].f32[2] = (float)(v202 * 0.5) + (float)((float)(v203 + v193.f32[3]) * 0.25);
  v204 = v8[63].f32[0];
  v8[62].f32[3] = (float)(v203 * 0.5) + (float)((float)(v204 + v202) * 0.25);
  v205 = v8[63].f32[1];
  v8[63].f32[0] = (float)(v204 * 0.5) + (float)((float)(v205 + v203) * 0.25);
  v200.i32[0] = v8[63].i32[2];
  v206 = &v8->f32[1];
  v207 = vld1q_dup_f32(v206);
  v8[63].f32[1] = (float)(v205 * 0.5) + (float)((float)(v200.f32[0] + v204) * 0.25);
  v208 = (int8x16_t)vdupq_lane_s32(*(int32x2_t *)v200.f32, 0);
  v8[63].f32[2] = (float)(v200.f32[0] * 0.5) + (float)((float)(v8[63].f32[3] + v205) * 0.25);
  v209.i64[0] = 0x3F0000003F000000;
  v209.i64[1] = 0x3F0000003F000000;
  do
  {
    v210 = &v8[v201];
    v211 = *(float32x4_t *)((char *)&v8[v201] + 8);
    v212 = (float32x4_t)vextq_s8((int8x16_t)v207, (int8x16_t)v211, 0xCuLL);
    v207 = *(float32x4_t *)((char *)&v8[v201 + 1] + 8);
    v213 = (float32x4_t)vextq_s8((int8x16_t)v211, (int8x16_t)v207, 0xCuLL);
    *(float32x4_t *)((char *)v210 + 4) = vmlaq_f32(vmulq_f32(v212, v209), vaddq_f32(v211, (float32x4_t)vextq_s8(v208, (int8x16_t)v212, 0xCuLL)), _Q1);
    *(float32x4_t *)((char *)v210 + 20) = vmlaq_f32(vmulq_f32(v213, v209), vaddq_f32(v207, (float32x4_t)vextq_s8((int8x16_t)v212, (int8x16_t)v213, 0xCuLL)), _Q1);
    v201 += 2;
    v208 = (int8x16_t)v213;
  }
  while (v201 != 62);
  v214 = 0;
  v215 = v8[62].f32[2];
  v8[62].f32[1] = vmuls_lane_f32(0.5, v207, 3) + (float)((float)(v215 + v207.f32[2]) * 0.25);
  v207.i32[0] = v8[62].i32[3];
  v8[62].f32[2] = (float)(v215 * 0.5) + (float)((float)(v207.f32[0] + v207.f32[3]) * 0.25);
  v216 = v8[63].f32[0];
  v8[62].f32[3] = (float)(v207.f32[0] * 0.5) + (float)((float)(v216 + v215) * 0.25);
  v217 = v8[63].f32[1];
  v8[63].f32[0] = (float)(v216 * 0.5) + (float)((float)(v217 + v207.f32[0]) * 0.25);
  v218 = v8[63].f32[2];
  v8[63].f32[1] = (float)(v217 * 0.5) + (float)((float)(v218 + v216) * 0.25);
  v8[63].f32[2] = (float)(v218 * 0.5) + (float)((float)(v8[63].f32[3] + v217) * 0.25);
  v219 = vaddq_f32(vaddq_f32(v8[62], vaddq_f32(v8[60], v8[58])), vaddq_f32(vaddq_f32(v8[56], vaddq_f32(v8[54], vaddq_f32(v8[52], vaddq_f32(v8[50], vaddq_f32(v8[48], vaddq_f32(v8[46], v8[44])))))), vaddq_f32(vaddq_f32(v8[42], vaddq_f32(v8[40], vaddq_f32(v8[38], vaddq_f32(v8[36], vaddq_f32(v8[34], v8[32]))))), vaddq_f32(vaddq_f32(v8[30], vaddq_f32(v8[28], vaddq_f32(v8[26], vaddq_f32(v8[24], v8[22])))), vaddq_f32(vaddq_f32(v8[20], vaddq_f32(v8[18], vaddq_f32(v8[16], v8[14]))), vaddq_f32(vaddq_f32(v8[12], vaddq_f32(v8[10], v8[8])), vaddq_f32(vaddq_f32(v8[6], v8[4]), vaddq_f32(v8[2], *v8))))))));
  v220 = vaddq_f32(vaddq_f32(vaddq_f32(v8[63], vaddq_f32(v8[61], v8[59])), vaddq_f32(vaddq_f32(v8[57], vaddq_f32(v8[55], vaddq_f32(v8[53], vaddq_f32(v8[51], vaddq_f32(v8[49], vaddq_f32(v8[47], v8[45])))))), vaddq_f32(vaddq_f32(v8[43], vaddq_f32(v8[41], vaddq_f32(v8[39], vaddq_f32(v8[37], vaddq_f32(v8[35], v8[33]))))), vaddq_f32(vaddq_f32(v8[31], vaddq_f32(v8[29], vaddq_f32(v8[27], vaddq_f32(v8[25], v8[23])))), vaddq_f32(vaddq_f32(v8[21], vaddq_f32(v8[19], vaddq_f32(v8[17], v8[15]))), vaddq_f32(vaddq_f32(v8[13], vaddq_f32(v8[11], v8[9])), vaddq_f32(vaddq_f32(v8[7], v8[5]), vaddq_f32(v8[3], v8[1])))))))), v219);
  v220.i64[0] = vpaddq_f32(v220, v220).u64[0];
  v220.f32[0] = vaddv_f32(*(float32x2_t *)v220.f32);
  v221 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v220.f32, 0));
  do
  {
    v222 = &v8[v214];
    v223 = vmulq_f32(v8[v214 + 1], v221);
    *v222 = vmulq_f32(v8[v214], v221);
    v222[1] = v223;
    v214 += 2;
  }
  while (v214 != 64);
  v224 = v8->f32[0];
  for (i = 1; i != 256; ++i)
  {
    v224 = v8->f32[i] + v224;
    v8->f32[i] = v224;
  }
  v226 = 0;
  v227 = 0.0;
  v228 = 1;
  while (1)
  {
    v229 = (float)(unsigned __int16)v228 * 0.0039216;
    v230 = v8->f32[v228];
    if (v230 > (float)(a2[2] * v229))
      break;
    v231 = v230 / v229;
    v232 = fmaxf(v231, v227);
    if (v231 > v227)
      v226 = v228;
    ++v228;
    v227 = v232;
    if (v228 == 256)
    {
      if (!v226)
        goto LABEL_145;
      goto LABEL_139;
    }
  }
  v232 = a2[2];
  v226 = v228;
  if (!(_WORD)v228)
    goto LABEL_145;
LABEL_139:
  v233 = v232 * 0.0039216;
  v234 = v226;
  if (v226 >= 8u)
  {
    v235 = v226 & 0xFFF8;
    v236 = (int16x4_t)0x3000200010000;
    v237 = v8 + 1;
    v238 = (unsigned __int16)v234 & 0xFFF8;
    do
    {
      v239 = vmaxnmq_f32(*v237, vmulq_n_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)vadd_s16(v236, (int16x4_t)0x4000400040004))), v233));
      v237[-1] = vmaxnmq_f32(v237[-1], vmulq_n_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)v236)), v233));
      *v237 = v239;
      v236 = vadd_s16(v236, (int16x4_t)0x8000800080008);
      v237 += 2;
      v238 -= 8;
    }
    while (v238);
    if (v235 == v234)
      goto LABEL_145;
  }
  else
  {
    v235 = 0;
  }
  do
  {
    v8->f32[v235] = fmaxf(v8->f32[v235], v233 * (float)(unsigned __int16)v235);
    ++v235;
  }
  while (v234 != v235);
LABEL_145:
  for (j = 0; j != 256; ++j)
  {
    v241 = (unsigned __int16)j;
    v242 = (float)(unsigned __int16)j * 0.0039216;
    v243 = a2[2];
    v244 = fmaxf(v243 * *a3, v8->f32[j]);
    v245 = fmaxf(v242, *a3);
    if ((j & 0xFFFE) == 0)
      v241 = 1;
    v246 = fmaxf((float)(a3[3580] * 255.0) / (float)v241, 1.0);
    v247 = (float)(v246 * v244) / v245;
    if (v247 > v243)
    {
      v248 = sqrtf(v247 * v243);
      v247 = (float)(v248 + (float)(a2[10] * v248)) - (float)(a2[10] * v243);
    }
    a3[512] = (float)(v247 + (float)((float)((float)((float)(1.0 - v242) * v242) * a2[11]) * v247)) / v246;
    ++a3;
  }
  lutInterp(0x100u, 0, v8->f32, 0x1000u, 0, a4);
  v249 = 0;
  v250 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    v251 = (float32x4_t *)&a4[v249];
    v252 = vmulq_f32(*(float32x4_t *)&a4[v249 + 4], v250);
    *v251 = vmulq_f32(*(float32x4_t *)&a4[v249], v250);
    v251[1] = v252;
    v249 += 8;
  }
  while (v249 != 4096);
  free(v9);
}

float image_key(uint64_t a1, int a2, int a3, int a4)
{
  float v4;
  unint64_t i;
  unint64_t v6;
  const char *v7;
  unint64_t v8;
  uint8x8_t v9;
  int32x4_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v4 = 0.0;
  if (a3 >= 1 && a2 >= 32)
  {
    for (i = 0; i < a3; i += 4)
    {
      v6 = 0;
      do
      {
        v7 = (const char *)(a1 + v6);
        v6 += 32;
        v8 = (unint64_t)vld4_s8(v7);
        v9 = vmin_u8((uint8x8_t)vclz_s8((int8x8_t)v8), (uint8x8_t)0x707070707070707);
        ++*((_DWORD *)&v12 + ((7 - v9.i8[0]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[1]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[2]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[3]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[4]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[5]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[6]) & 7));
        ++*((_DWORD *)&v12 + ((7 - v9.i8[7]) & 7));
      }
      while (v6 <= (a2 - 32));
      a1 += 4 * a4;
    }
    v10.i64[0] = __PAIR64__(DWORD1(v13), HIDWORD(v12));
    v10.i64[1] = *((_QWORD *)&v13 + 1);
    v4 = (float)(vaddvq_s32(vmulq_s32(v10, (int32x4_t)xmmword_24B722F10)) + 2 * DWORD2(v12) + DWORD1(v12) + 4 * v13)
       * 0.25018;
  }
  return exp2f((float)(v4 / (float)(a3 * a2 / 16)) + -1.0) * 0.4;
}

_QWORD *extractToneCurvePlist(_DWORD *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  CFTypeID TypeID;
  const __CFDictionary *v7;
  int Count;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  const void **v12;
  size_t v13;
  char *v14;
  _QWORD *v15;
  int v16;
  _WORD *v17;
  const __CFString *v18;
  const __CFDictionary *v19;
  const __CFString *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  _WORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFNumber *v29;
  const __CFNumber *v30;
  const __CFArray *v31;
  const __CFArray *v32;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v34;
  const __CFArray *v35;
  const __CFArray *v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  const __CFArray *v39;
  const __CFArray *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  const __CFArray *v43;
  const __CFArray *v44;
  const __CFNumber *v45;
  const __CFNumber *v46;
  const __CFArray *v47;
  const __CFArray *v48;
  const __CFNumber *v49;
  const __CFNumber *v50;
  const __CFArray *v51;
  const __CFArray *v52;
  const __CFNumber *v53;
  const __CFNumber *v54;
  const __CFArray *v55;
  const __CFArray *v56;
  const __CFNumber *v57;
  const __CFNumber *v58;
  const __CFNumber *v59;
  const __CFNumber *v60;
  const __CFArray *v61;
  const __CFArray *v62;
  const __CFNumber *v63;
  const __CFNumber *v64;
  const __CFArray *v65;
  const __CFArray *v66;
  const __CFNumber *v67;
  const __CFNumber *v68;
  const __CFArray *v69;
  const __CFArray *v70;
  const __CFNumber *v71;
  const __CFNumber *v72;
  const __CFArray *v73;
  const __CFArray *v74;
  const __CFNumber *v75;
  const __CFNumber *v76;
  const __CFNumber *v77;
  const __CFNumber *v78;
  const __CFArray *v79;
  const __CFArray *v80;
  const __CFNumber *v81;
  const __CFNumber *v82;
  const __CFNumber *v83;
  const __CFNumber *v84;
  const __CFNumber *v85;
  const __CFNumber *v86;
  _QWORD v88[2];
  _DWORD *v89;
  const __CFDictionary *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  int v99;
  char buffer[108];
  char v101[4];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  v2 = (const __CFDictionary *)FigCaptureCFCreatePropertyList();
  if (!v2)
    return 0;
  v3 = v2;
  Value = (const __CFDictionary *)CFDictionaryGetValue(v2, CFSTR("TuningParameters"));
  if (Value && (v5 = Value, TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v5)))
  {
    v89 = a1;
    v90 = v3;
    v7 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("DefaultSensorIDs"));
    Count = CFDictionaryGetCount(v7);
    v88[1] = v88;
    v9 = Count;
    v10 = 8 * Count;
    MEMORY[0x24BDAC7A8]();
    v11 = (v10 + 15) & 0xFFFFFFFF0;
    v12 = (const void **)((char *)v88 - v11);
    if (v10 >= 0x200)
      v13 = 512;
    else
      v13 = 8 * Count;
    bzero((char *)v88 - v11, v13);
    MEMORY[0x24BDAC7A8]();
    v14 = (char *)v88 - v11;
    bzero(v14, v13);
    v15 = malloc_type_calloc(Count, 8uLL, 0x2004093837F09uLL);
    CFDictionaryGetKeysAndValues(v7, v12, (const void **)v14);
    if (Count < 1)
    {
      v16 = 0;
    }
    else
    {
      v16 = 0;
      v98 = 0x3F0000003F8CCCCDLL;
      v97 = xmmword_24B722F30;
      v96 = xmmword_24B722F40;
      v95 = xmmword_24B722F50;
      v94 = xmmword_24B722F60;
      v93 = xmmword_24B722F70;
      v92 = xmmword_24B722F80;
      v91 = xmmword_24B722F90;
      do
      {
        CFStringGetCString((CFStringRef)*v12, buffer, 128, 0);
        v18 = (const __CFString *)*v12;
        v19 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("DefaultSensorIDs"));
        if (v19
          && (v20 = (const __CFString *)CFDictionaryGetValue(v19, v18),
              v21 = (const __CFDictionary *)CFDictionaryGetValue(v5, v18),
              (v22 = (const __CFDictionary *)CFDictionaryGetValue(v21, v20)) != 0)
          && (v23 = (const __CFDictionary *)CFDictionaryGetValue(v22, CFSTR("HDR_ToneCurveParameters"))) != 0)
        {
          v24 = v23;
          v25 = malloc_type_calloc(1uLL, 0x94uLL, 0x1000040BE682E6FuLL);
          v17 = v25;
          if (v25)
          {
            *(_DWORD *)v25 = 0;
            v25[4] = 0;
            *((_DWORD *)v25 + 6) = 1084227584;
            *((_QWORD *)v25 + 2) = v98;
            v26 = v96;
            *((_OWORD *)v25 + 2) = v97;
            *((_OWORD *)v25 + 3) = v26;
            v27 = v94;
            *((_OWORD *)v25 + 4) = v95;
            *((_OWORD *)v25 + 5) = v27;
            v28 = v92;
            *((_OWORD *)v25 + 6) = v93;
            *((_OWORD *)v25 + 7) = v28;
            *((_OWORD *)v25 + 8) = v91;
            *((_DWORD *)v25 + 36) = 1039516303;
          }
          v29 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("Contrast"));
          if (v29)
            CFNumberGetValue(v29, kCFNumberFloatType, v17 + 8);
          v30 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("Midpoint"));
          if (v30)
            CFNumberGetValue(v30, kCFNumberFloatType, v17 + 10);
          v31 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("HighContrastRange"));
          if (v31)
          {
            v32 = v31;
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 0);
            CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, v17 + 12);
            v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v32, 1);
            CFNumberGetValue(v34, kCFNumberFloatType, v17 + 14);
          }
          v35 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("DeepShadowsRange"));
          if (v35)
          {
            v36 = v35;
            v37 = (const __CFNumber *)CFArrayGetValueAtIndex(v35, 0);
            CFNumberGetValue(v37, kCFNumberFloatType, v17 + 16);
            v38 = (const __CFNumber *)CFArrayGetValueAtIndex(v36, 1);
            CFNumberGetValue(v38, kCFNumberFloatType, v17 + 18);
          }
          v39 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("HighKeyRange"));
          if (v39)
          {
            v40 = v39;
            v41 = (const __CFNumber *)CFArrayGetValueAtIndex(v39, 0);
            CFNumberGetValue(v41, kCFNumberFloatType, v17 + 20);
            v42 = (const __CFNumber *)CFArrayGetValueAtIndex(v40, 1);
            CFNumberGetValue(v42, kCFNumberFloatType, v17 + 22);
          }
          v43 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("NoiseThresholds"));
          if (v43)
          {
            v44 = v43;
            v45 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 0);
            CFNumberGetValue(v45, kCFNumberFloatType, v17 + 24);
            v46 = (const __CFNumber *)CFArrayGetValueAtIndex(v44, 1);
            CFNumberGetValue(v46, kCFNumberFloatType, v17 + 26);
          }
          v47 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("VarContrast"));
          if (v47)
          {
            v48 = v47;
            v49 = (const __CFNumber *)CFArrayGetValueAtIndex(v47, 0);
            CFNumberGetValue(v49, kCFNumberFloatType, v17 + 28);
            v50 = (const __CFNumber *)CFArrayGetValueAtIndex(v48, 1);
            CFNumberGetValue(v50, kCFNumberFloatType, v17 + 30);
          }
          v51 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("HighlightsContrast"));
          if (v51)
          {
            v52 = v51;
            v53 = (const __CFNumber *)CFArrayGetValueAtIndex(v51, 0);
            CFNumberGetValue(v53, kCFNumberFloatType, v17 + 32);
            v54 = (const __CFNumber *)CFArrayGetValueAtIndex(v52, 1);
            CFNumberGetValue(v54, kCFNumberFloatType, v17 + 34);
          }
          v55 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("HighlightsSB"));
          if (v55)
          {
            v56 = v55;
            v57 = (const __CFNumber *)CFArrayGetValueAtIndex(v55, 0);
            CFNumberGetValue(v57, kCFNumberFloatType, v17 + 36);
            v58 = (const __CFNumber *)CFArrayGetValueAtIndex(v56, 1);
            CFNumberGetValue(v58, kCFNumberFloatType, v17 + 38);
            v59 = (const __CFNumber *)CFArrayGetValueAtIndex(v56, 2);
            CFNumberGetValue(v59, kCFNumberFloatType, v17 + 40);
            v60 = (const __CFNumber *)CFArrayGetValueAtIndex(v56, 3);
            CFNumberGetValue(v60, kCFNumberFloatType, v17 + 42);
          }
          v61 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("MidtonesSB"));
          if (v61)
          {
            v62 = v61;
            v63 = (const __CFNumber *)CFArrayGetValueAtIndex(v61, 0);
            CFNumberGetValue(v63, kCFNumberFloatType, v17 + 44);
            v64 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 1);
            CFNumberGetValue(v64, kCFNumberFloatType, v17 + 46);
          }
          v65 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("ShadowsSB"));
          if (v65)
          {
            v66 = v65;
            v67 = (const __CFNumber *)CFArrayGetValueAtIndex(v65, 0);
            CFNumberGetValue(v67, kCFNumberFloatType, v17 + 48);
            v68 = (const __CFNumber *)CFArrayGetValueAtIndex(v66, 1);
            CFNumberGetValue(v68, kCFNumberFloatType, v17 + 50);
          }
          v69 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("GappinessSB"));
          if (v69)
          {
            v70 = v69;
            v71 = (const __CFNumber *)CFArrayGetValueAtIndex(v69, 0);
            CFNumberGetValue(v71, kCFNumberFloatType, v17 + 52);
            v72 = (const __CFNumber *)CFArrayGetValueAtIndex(v70, 1);
            CFNumberGetValue(v72, kCFNumberFloatType, v17 + 54);
          }
          v73 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("DeepShadowsSB"));
          if (v73)
          {
            v74 = v73;
            v75 = (const __CFNumber *)CFArrayGetValueAtIndex(v73, 0);
            CFNumberGetValue(v75, kCFNumberFloatType, v17 + 56);
            v76 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 1);
            CFNumberGetValue(v76, kCFNumberFloatType, v17 + 58);
            v77 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 2);
            CFNumberGetValue(v77, kCFNumberFloatType, v17 + 60);
            v78 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 3);
            CFNumberGetValue(v78, kCFNumberFloatType, v17 + 62);
          }
          v79 = (const __CFArray *)CFDictionaryGetValue(v24, CFSTR("KeySB"));
          if (v79)
          {
            v80 = v79;
            v81 = (const __CFNumber *)CFArrayGetValueAtIndex(v79, 0);
            CFNumberGetValue(v81, kCFNumberFloatType, v17 + 64);
            v82 = (const __CFNumber *)CFArrayGetValueAtIndex(v80, 1);
            CFNumberGetValue(v82, kCFNumberFloatType, v17 + 66);
          }
          v83 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("HighRes_Device"));
          if (v83)
          {
            CFNumberGetValue(v83, kCFNumberCharType, (char *)v17 + 9);
            *((_BYTE *)v17 + 8) = 1;
          }
          v84 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("HighRes_KeyBoost"));
          if (v84)
            CFNumberGetValue(v84, kCFNumberFloatType, v17 + 68);
          v85 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("HighRes_ShadowsBoost"));
          if (v85)
            CFNumberGetValue(v85, kCFNumberFloatType, v17 + 70);
          v86 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("Sigma_R"));
          if (v86)
            CFNumberGetValue(v86, kCFNumberFloatType, v17 + 72);
          if (v17)
          {
            CFStringGetCString(v20, v101, 20, 0);
            v99 = 0;
            sscanf(v101, "%x", &v99);
            *(_DWORD *)v17 = v99;
            if (CFStringCompare(v18, CFSTR("PortTypeBack"), 0))
            {
              if (CFStringCompare(v18, CFSTR("PortTypeFront"), 0))
                *((_DWORD *)v17 + 1) = -1;
              else
                *((_DWORD *)v17 + 1) = 1;
            }
            else
            {
              *((_DWORD *)v17 + 1) = 0;
            }
          }
        }
        else
        {
          v17 = 0;
        }
        v15[v16] = v17;
        if (v17)
          ++v16;
        ++v12;
        --v9;
      }
      while (v9);
    }
    *v89 = v16;
    v3 = v90;
  }
  else
  {
    v15 = 0;
  }
  CFRelease(v3);
  return v15;
}

uint64_t noiseHistParametricToneCurve(int *a1, uint64_t a2, float32x4_t *a3, float *a4, uint64_t a5)
{
  float32x4_t v10;
  float32x4_t v11;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float32x4_t v24;
  float v25;
  float v26;
  float v27;
  int v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float64x2_t v38;
  float32x2_t v39;
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
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  double v61;
  double v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  double v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  double v83;
  int32x4_t *v84;
  double v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  unsigned int v93;
  uint64_t v94;
  float v95;
  float v96;
  float *v97;
  float v98;
  float v99;
  uint64_t v100;
  float v101;
  float v102;
  double v103;
  double v104;
  uint64_t v105;
  float v106;
  float v107;
  float v108;
  float v109;
  unsigned int v110;
  uint64_t v111;
  float *v112;
  float v113;
  float v114;
  float v115;
  float v116;
  int v117;
  float v118;
  float v119;
  float v120;
  uint64_t v121;
  float32x4_t *v122;
  uint64_t result;
  float v124;
  double v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float32_t v134;
  float v135;
  float32x4_t *v136;
  double v137;
  float v138;
  float v139;
  double v140;
  float v141;
  float v142;
  float v143;
  double v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  int v153;
  float v154;
  float v155[9];
  float v156[2];
  float v157;
  float v158;
  float v159;
  float v160;
  float v161;
  float v162;
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v10 = vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 5)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 13))), vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 21)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 29)))), vaddq_f32(
                                  vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 37)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 45))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 53)))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 93))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 109))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 125))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 141))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 157))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 173))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 189))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 205))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 221))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 237))), vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(
                      vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 61)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 69))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 77))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 85))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 101))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 117))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 133))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 149))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 165))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 181))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 197))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 213))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 229))),
            vcvtq_f32_u32(*(uint32x4_t *)(a1 + 245))));
  v11 = vaddq_f32(v10, vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 1)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 9))), vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 17)),
                                      vcvtq_f32_u32(*(uint32x4_t *)(a1 + 25)))),
                                  vaddq_f32(vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 33)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 41))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 49)))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 89))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 105))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 121))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 137))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 153))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 169))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 185))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 201))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 217))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 233))), vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(
                      vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vcvtq_f32_u32(*(uint32x4_t *)(a1 + 57)), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 65))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 73))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 81))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 97))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 113))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 129))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 145))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 161))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 177))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 193))), vcvtq_f32_u32(*(uint32x4_t *)(a1 + 209))),
                vcvtq_f32_u32(*(uint32x4_t *)(a1 + 225))),
              vcvtq_f32_u32(*(uint32x4_t *)(a1 + 241)))));
  v12 = 1.0
      / (float)((float)((float)((float)((float)((float)((float)((float)a1[249]
                                                              + (float)a1[250])
                                                      + (float)a1[251])
                                              + (float)a1[252])
                                      + (float)a1[253])
                              + (float)a1[254])
                      + (float)a1[255])
              + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v11, v11)));
  v13 = 0.0;
  v14 = 255;
  while (1)
  {
    v13 = v13 + (float)a1[v14];
    if ((float)(v13 * v12) >= 0.00005)
      break;
    if (--v14 == -1)
    {
      v15 = 65793.0;
      goto LABEL_6;
    }
  }
  v15 = (float)(int)v14 * 16.063;
LABEL_6:
  v16 = fmaxf(v15, 1024.0);
  v154 = 0.0;
  v17 = histogram_key((int32x4_t *)a1, &v154, v156, a4);
  v138 = v16;
  v24 = vmaxnmq_f32(a3[62], vmaxnmq_f32(a3[60], vmaxnmq_f32(a3[58], vmaxnmq_f32(a3[56], vmaxnmq_f32(a3[54], vmaxnmq_f32(a3[52], vmaxnmq_f32(a3[50], vmaxnmq_f32(a3[48], vmaxnmq_f32(a3[46], vmaxnmq_f32(a3[44],
                            vmaxnmq_f32(a3[42], vmaxnmq_f32(a3[40], vmaxnmq_f32(a3[38], vmaxnmq_f32(a3[36], vmaxnmq_f32(a3[34], vmaxnmq_f32(a3[32], vmaxnmq_f32(a3[30], vmaxnmq_f32(a3[28], vmaxnmq_f32(a3[26], vmaxnmq_f32(a3[24],
                                                vmaxnmq_f32(a3[22], vmaxnmq_f32(a3[20], vmaxnmq_f32(a3[18], vmaxnmq_f32(a3[16], vmaxnmq_f32(a3[14], vmaxnmq_f32(a3[12], vmaxnmq_f32(a3[10], vmaxnmq_f32(a3[8], vmaxnmq_f32(a3[6], vmaxnmq_f32(a3[4],
                                                                    vmaxnmq_f32(a3[2], vmaxnmq_f32(*a3, (float32x4_t)0))))))))))))))))))))))))))))))));
  v18 = v16 * -0.000325520833 + 1.33333333;
  v19 = *(float *)(a5 + 12);
  v20 = *(float *)(a5 + 20);
  v21 = *(float *)(a5 + 48);
  v22 = *(float *)(a5 + 52);
  v23 = (float)(fminf(fmaxf(vmaxnmvq_f32(vmaxnmq_f32(v24, vmaxnmq_f32(a3[63], vmaxnmq_f32(a3[61], vmaxnmq_f32(a3[59], vmaxnmq_f32(a3[57], vmaxnmq_f32(a3[55], vmaxnmq_f32(a3[53], vmaxnmq_f32(a3[51], vmaxnmq_f32(
                                        a3[49],
                                        vmaxnmq_f32(a3[47], vmaxnmq_f32(a3[45], vmaxnmq_f32(a3[43], vmaxnmq_f32(a3[41], vmaxnmq_f32(a3[39], vmaxnmq_f32(a3[37], vmaxnmq_f32(a3[35], vmaxnmq_f32(a3[33], vmaxnmq_f32(a3[31], vmaxnmq_f32(a3[29],
                                                            vmaxnmq_f32(a3[27], vmaxnmq_f32(a3[25], vmaxnmq_f32(a3[23], vmaxnmq_f32(a3[21], vmaxnmq_f32(a3[19], vmaxnmq_f32(a3[17], vmaxnmq_f32(a3[15], vmaxnmq_f32(a3[13], vmaxnmq_f32(a3[11], vmaxnmq_f32(a3[9],
                                                                                vmaxnmq_f32(a3[7], vmaxnmq_f32(a3[5], vmaxnmq_f32(a3[3], vmaxnmq_f32(a3[1], (float32x4_t)0)))))))))))))))))))))))))))))))))), v21), v22)- v21)/ (float)(v22 - v21);
  v25 = v157;
  v24.f32[0] = v158;
  v26 = (float)(fminf(fmaxf(v158, *(float *)(a5 + 32)), *(float *)(a5 + 36)) - *(float *)(a5 + 32))
      / (float)(*(float *)(a5 + 36) - *(float *)(a5 + 32));
  v27 = v162;
  v28 = *(_DWORD *)(a5 + 4);
  if (v28)
  {
    v29 = *(float *)(a5 + 16);
    if (v28 == 1)
    {
      v30 = (float)((float)((float)(v29 * 0.5)
                          * (float)(*(float *)(a5 + 60) - fminf(fmaxf(v154, *(float *)(a5 + 56)), *(float *)(a5 + 60))))
                  / (float)(*(float *)(a5 + 60) - *(float *)(a5 + 56)))
          + (float)(v29 * 0.5);
      v29 = (float)((float)((float)(v30 * 0.5)
                          * (float)(*(float *)(a5 + 68) - fminf(fmaxf(v162, *(float *)(a5 + 64)), *(float *)(a5 + 68))))
                  / (float)(*(float *)(a5 + 68) - *(float *)(a5 + 64)))
          + (float)(v30 * 0.5);
      v31 = v20 + -0.1;
      v32 = v20 + 0.1;
      v33 = v31 + (float)((float)((float)(fminf(fmaxf(v19, 0.45), 0.55) * 10.0) + -4.5) * (float)(v32 - v31));
      v34 = v161 - v23 * v161;
      v20 = (float)((float)(fminf(fmaxf(v34, 0.15), 0.6) * -0.55556) + 1.0833) * v33;
    }
    v35 = *(float *)(a5 + 12);
  }
  else
  {
    v29 = 1.3;
    if (*(_BYTE *)(a5 + 8))
      v29 = 1.5;
    v36 = v20 + -0.1;
    v37 = v20 + 0.1;
    v20 = v36 + (float)(fminf(fmaxf(v162, 0.0), 1.0) * (float)(v37 - v36));
    v38 = vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v17), LODWORD(v157)));
    v24.f32[1] = v26;
    v39 = vmla_f32((float32x2_t)0xBEE66663BF800000, vminnm_f32(vmaxnm_f32(vcvt_f32_f64(vmlsq_f64(v38, v38, vcvtq_f64_f32(*(float32x2_t *)v24.f32))), (float32x2_t)0x3EE666663E000000), (float32x2_t)0x3F19999A3E800000), (float32x2_t)0x3F7FFFFD41000000);
    v35 = v19 - vmul_lane_f32(v39, v39, 1).f32[0];
  }
  v40 = *(float *)(a5 + 40);
  v41 = *(float *)(a5 + 44);
  v42 = v160;
  v43 = (float)(v29 + -0.1) - (float)(fminf(fmaxf(v18 * v18, 0.0), 1.0) * (float)(v29 + -0.1));
  v44 = v35 + 0.025;
  v45 = 1.0 - fminf(fmaxf(v23, 0.0), 1.0);
  v46 = v35
      + (float)((float)((float)((float)(fminf(fmaxf(v18, 0.0), 1.0) * 10.0)
                              * (float)(0.55 - fminf(fmaxf(v35, 0.45), 0.55)))
                      * (float)(v44 - v35))
              * v45);
  v150 = v20;
  if (v28 == 1)
  {
    v59 = 2.0;
  }
  else
  {
    if (!v28)
    {
      v139 = v46;
      if (*(_BYTE *)(a5 + 8))
        v47 = 1.0;
      else
        v47 = 0.0;
      v145 = *(float *)(a5 + 44);
      v147 = v18;
      v48 = (double)*(int *)(a2 + 4) * 0.0000152590219;
      v142 = v48;
      v151 = v26;
      v49 = *(float *)(a5 + 12);
      v149 = v157;
      v143 = v17;
      v50 = *(float *)(a5 + 40);
      v51 = v43;
      v52 = log2f(v48 + 1.0);
      v53 = v51;
      v41 = v145;
      v40 = v50;
      v25 = v149;
      v19 = v49;
      v26 = v151;
      v20 = v150;
      v54 = v47 + (float)((float)((float)(1.0 - v47) + (float)(fminf(fmaxf(v52 - v142, 0.0), 0.0861) * 23.229)) * v45);
      v55 = v47 + (float)((float)((float)((float)(fminf(fmaxf(v143, 0.3), 0.5) * -10.0) + 7.0) - v47) * v45);
      v46 = v139;
      v18 = v147;
      v56 = (float)(fminf(fmaxf(v142, 0.7), 0.9) * -5.0) + 4.5;
      v57 = v55 - v56 * v55 + (float)(v54 * v56);
      v58 = v53 + 0.1;
      v136 = a3;
      if (!*(_BYTE *)(a5 + 9))
        goto LABEL_27;
LABEL_23:
      v73 = (float)(fminf(fmaxf(v19, v40), v41) - v40) / (float)(v41 - v40);
      v74 = *(float *)(a5 + 136);
      if (v74 > 1.0)
      {
        v75 = *(float *)(a5 + 112);
        v76 = *(float *)(a5 + 116);
        v77 = (1.0 - v23 - v73 * (1.0 - v23)) * v26;
        *(float *)&v77 = v77 - v25 * v77;
        v78 = *(float *)(a5 + 120);
        v79 = *(float *)(a5 + 124);
        *(float *)&v77 = fminf(fmaxf(*(float *)&v77, v78), v79) - v78;
        v80 = v79 - v78;
        v81 = v76 - fminf(fmaxf(v46, v75), v76);
        v46 = v46
            + (float)((float)((float)((float)-(float)(v81 - (float)(v74 * v81)) * *(float *)&v77)
                            / (float)(v80 * (float)(v76 - v75)))
                    * v46);
      }
      v82 = *(float *)(a5 + 140);
      if (v82 > v57)
      {
        v83 = (1.0 - v23 - v73 * (1.0 - v23)) * v26;
        *(float *)&v83 = v83 + (float)(v42 - v27) * v83;
        v57 = (float)((float)((float)((float)(*(float *)(a5 + 116)
                                            - fminf(fmaxf(v46, *(float *)(a5 + 112)), *(float *)(a5 + 116)))
                                    * (float)(fminf(fmaxf(*(float *)&v83, *(float *)(a5 + 120)), *(float *)(a5 + 124))
                                            - *(float *)(a5 + 120)))
                            * (float)(v82 - v57))
                    / (float)((float)(*(float *)(a5 + 124) - *(float *)(a5 + 120))
                            * (float)(*(float *)(a5 + 116) - *(float *)(a5 + 112))))
            + v57;
      }
      goto LABEL_27;
    }
    v60 = (float)(fminf(fmaxf(v17, 0.45), 0.6) * -6.6667) + 4.0;
    v59 = (float)(v60
                + (float)((float)(fminf(fmaxf(1.0 - v23, 0.0), 1.0)
                                * (float)((float)(fminf(fmaxf(v17, 0.4), 0.5) * 10.0) + -4.0))
                        * v60))
        + 1.0;
  }
  v61 = 1.0 - v23;
  v62 = v61 - v162 * v61;
  v63 = v62;
  v64 = (float)((float)((float)(*(float *)(a5 + 76) - fminf(fmaxf(v46, *(float *)(a5 + 72)), *(float *)(a5 + 76))) * v59)
              * (float)(fminf(fmaxf(v63, *(float *)(a5 + 80)), *(float *)(a5 + 84)) - *(float *)(a5 + 80)))
      / (float)((float)(*(float *)(a5 + 84) - *(float *)(a5 + 80)) * (float)(*(float *)(a5 + 76) - *(float *)(a5 + 72)));
  v65 = v61 * v161;
  v66 = (float)((float)((float)(v59 - v64)
                      * (float)(fminf(fmaxf(v65, *(float *)(a5 + 88)), *(float *)(a5 + 92)) - *(float *)(a5 + 88)))
              / (float)(*(float *)(a5 + 92) - *(float *)(a5 + 88)))
      + v64;
  v67 = v61 * v160;
  v68 = (float)((float)((float)(v59 - v66)
                      * (float)(fminf(fmaxf(v67, *(float *)(a5 + 96)), *(float *)(a5 + 100)) - *(float *)(a5 + 96)))
              / (float)(*(float *)(a5 + 100) - *(float *)(a5 + 96)))
      + v66;
  v69 = v61 * v159;
  v70 = (float)((float)((float)(v59 - v68)
                      * (float)(fminf(fmaxf(v69, *(float *)(a5 + 104)), *(float *)(a5 + 108)) - *(float *)(a5 + 104)))
              / (float)(*(float *)(a5 + 108) - *(float *)(a5 + 104)))
      + v68;
  v71 = v62 * v26;
  v72 = v61 * v46;
  v57 = (float)((float)((float)((float)((float)((float)(fminf(fmaxf(v71, *(float *)(a5 + 120)), *(float *)(a5 + 124))
                                                      - *(float *)(a5 + 120))
                                              * (float)(*(float *)(a5 + 116)
                                                      - fminf(fmaxf(v46, *(float *)(a5 + 112)), *(float *)(a5 + 116))))
                                      * (float)(v59 - v70))
                              / (float)((float)(*(float *)(a5 + 124) - *(float *)(a5 + 120))
                                      * (float)(*(float *)(a5 + 116) - *(float *)(a5 + 112))))
                      + v70)
              * (float)(fminf(fmaxf(v72, *(float *)(a5 + 128)), *(float *)(a5 + 132)) - *(float *)(a5 + 128)))
      / (float)(*(float *)(a5 + 132) - *(float *)(a5 + 128));
  v58 = v43 + 0.1;
  v136 = a3;
  if (*(_BYTE *)(a5 + 9))
    goto LABEL_23;
LABEL_27:
  v135 = v57;
  v84 = (int32x4_t *)operator new[]();
  v153 = 0;
  v140 = v18 * -0.2 + 1.0;
  v85 = v58 * 3.14159265;
  v86 = v85 * (float)-v20;
  v87 = atanf(v86) * 0.318309886;
  v144 = v85;
  v88 = v85 * (float)(1.0 - v20);
  v89 = atanf(v88) * 0.318309886;
  v141 = 1.0 / (float)(v89 - v87);
  v90 = 10.0;
  v91 = 0.01;
  v92 = 0.01;
  while (1)
  {
    v146 = v91;
    v148 = v90;
    bzero(v84, 0x400uLL);
    v93 = 0;
    v94 = 0;
    v137 = log2f((float)((float)(v92 * 4096.0) + v138) / (float)(v92 * 4096.0));
    do
    {
      v95 = v140
          * (1.0
           / v137)
          * log2f((float)((float)((float)(v92 * 4096.0) + (float)(int)v94) * 0.00024414) * (float)(1.0 / v92));
      v96 = v144 * (float)(v95 - v150);
      v98 = atanf(v96) * 0.318309886;
      v99 = (float)(v98 - v87) * (float)(255.0 * v141);
      a4[v94] = v99;
      v100 = (int)fmaxf(fminf(v99, 255.0), 0.0);
      v84->i32[v100] += a1[v93 / 0xFFF];
      ++v94;
      v93 += 255;
    }
    while (v94 != 4096);
    v101 = v92 * 4096.0;
    v102 = histogram_key(v84, (float *)&v153, v155, v97) * 0.98;
    if (vabds_f32(v46, v102) <= 0.001)
      break;
    v90 = v148;
    v91 = v146;
    if (v102 < v46)
      v90 = v92;
    else
      v91 = v92;
    v92 = v91 + (float)((float)(v90 - v91) * 0.5);
    if (v92 >= v90)
    {
      v101 = v92 * 4096.0;
      v103 = log2f((float)((float)(v92 * 4096.0) + v138) / (float)(v92 * 4096.0));
      v104 = v140;
      goto LABEL_37;
    }
  }
  v104 = v18 * -0.2 + 1.0;
  v103 = v137;
LABEL_37:
  MEMORY[0x24BD25DD4](v84, 0x1000C8052888210);
  v105 = 0;
  v152 = 1.0 / v92;
  do
  {
    v106 = v104 * (1.0 / v103) * log2f((float)((float)(v101 + (float)(int)v105) * 0.00024414) * v152);
    v107 = powf(fmaxf(v106, 0.0), 0.15) * v135;
    v108 = v144 * (float)((float)(v106 + (float)((float)(v107 * expf(v106 * -8.0)) * v106)) - v150);
    v109 = atanf(v108) * 0.318309886;
    a4[v105++] = (float)(v109 - v87) * (float)(255.0 * v141);
  }
  while (v105 != 4096);
  v110 = 0;
  v111 = 0;
  v112 = (float *)v136;
  do
  {
    v113 = (float)(int)v111 * 0.0039216;
    v114 = *(float *)(a2 + 8);
    v115 = fmaxf(v114 * *v112, *(float *)((char *)a4 + (((2155905153u * (unint64_t)v110) >> 37) & 0x7FFFFFC)) * 0.0039216);
    v116 = fmaxf(v113, *v112);
    if (v111 <= 1)
      v117 = 1;
    else
      v117 = v111;
    v118 = fmaxf((float)(v112[3580] * 255.0) / (float)v117, 1.0);
    v119 = (float)(v118 * v115) / v116;
    if (v119 > v114)
    {
      v120 = sqrtf(v119 * v114);
      v119 = (float)(v120 + (float)(*(float *)(a2 + 40) * v120)) - (float)(*(float *)(a2 + 40) * v114);
    }
    v112[512] = (float)(v119 + (float)((float)((float)((float)(1.0 - v113) * v113) * *(float *)(a2 + 44)) * v119))
              / v118;
    ++v111;
    ++v112;
    v110 += 4095;
  }
  while (v111 != 256);
  v121 = 0;
  v122 = v136 + 128;
  result = 971662137;
  do
  {
    v124 = (float)(int)v121 * 0.0039062;
    if (v124 >= 0.5)
    {
      v126 = (float)(v124 + 0.3) + (float)((float)(int)v121 * -0.0011719);
      v125 = v124;
    }
    else
    {
      v125 = v124;
      v126 = v125 * 1.30000001;
    }
    v127 = v125 + v125 - v126;
    v128 = v127 + (float)(v126 - v127) * 1.0;
    v129 = (float)((float)(v128 * -0.3313) + (float)(v127 * -0.1687)) + (float)(v126 * 0.5);
    if (v129 > 0.0)
    {
      v130 = a4[4095 * (int)(fminf(v127, 1.0) * 255.0) / 255];
      v131 = a4[4095 * (int)(fminf(v128, 1.0) * 255.0) / 255];
      v132 = a4[4095 * (int)(fminf(v126, 1.0) * 255.0) / 255];
      if ((float)((float)((float)(v130 * 0.0011725) + (float)(v131 * 0.002302)) + (float)(v132 * 0.00044706)) > 0.0)
      {
        v133 = (float)((float)((float)(v130 * -0.00066157) + (float)(v131 * -0.0012992)) + (float)(v132 * 0.0019608))
             / v129;
        if (v133 < 1.0)
        {
          v134 = (v133 * 0.4 + 0.6) * v122->f32[v121];
          v122->f32[v121] = v134;
        }
      }
    }
    ++v121;
  }
  while (v121 != 256);
  return result;
}

float histogram_key(int32x4_t *a1, float *a2, float *a3, float *a4)
{
  int32x4_t v7;
  int v8;
  float v9;
  uint64_t v10;
  signed int v11;
  int32x2_t v12;
  int v13;
  float v14;
  uint64_t v15;
  int32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  float32x4_t v20;
  float v21;
  float32x4_t v22;
  float v23;
  float32x4_t v24;
  float32x4_t v25;
  float v26;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  int32x4_t v33;
  float32x4_t v34;
  float v35;
  float v36;
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
  float v49;
  float v50;
  int v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  BOOL v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  BOOL v76;
  float v77;
  float v78;
  float v79;
  float v80;
  int v81;
  float v82;
  float v83;
  int v84;
  _BOOL4 v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  int v91;
  _BOOL4 v92;
  float v93;
  float v94;
  float v95;
  float v96;
  int v97;
  int v98;
  float v99;
  int v100;
  float v101;
  int v102;
  float v103;
  int v104;
  float v105;
  int v106;
  int v107;
  int v108;
  float v109;
  float v110;
  int v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  BOOL v118;
  int v119;
  float v120;
  int v121;
  float v122;
  int v123;
  float v124;
  int v125;
  float v126;
  int v127;
  float v128;
  float v129;
  float32x4_t v132;
  int32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  float v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  v7 = vaddq_s32(vaddq_s32(a1[62], vaddq_s32(a1[60], a1[58])), vaddq_s32(vaddq_s32(a1[56], vaddq_s32(a1[54], vaddq_s32(a1[52], vaddq_s32(a1[50], vaddq_s32(a1[48], vaddq_s32(a1[46], a1[44])))))), vaddq_s32(vaddq_s32(a1[42], vaddq_s32(a1[40], vaddq_s32(a1[38], vaddq_s32(a1[36], vaddq_s32(a1[34], a1[32]))))), vaddq_s32(vaddq_s32(a1[30], vaddq_s32(a1[28], vaddq_s32(a1[26], vaddq_s32(a1[24], a1[22])))), vaddq_s32(vaddq_s32(a1[20], vaddq_s32(a1[18], vaddq_s32(a1[16], a1[14]))), vaddq_s32(vaddq_s32(a1[12], vaddq_s32(a1[10], a1[8])), vaddq_s32(vaddq_s32(a1[6], a1[4]), vaddq_s32(a1[2], *a1))))))));
  v8 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(a1[63], vaddq_s32(a1[61], a1[59])), vaddq_s32(vaddq_s32(a1[57], vaddq_s32(a1[55], vaddq_s32(a1[53], vaddq_s32(a1[51], vaddq_s32(a1[49], vaddq_s32(a1[47], a1[45])))))), vaddq_s32(vaddq_s32(a1[43], vaddq_s32(a1[41], vaddq_s32(a1[39], vaddq_s32(a1[37], vaddq_s32(a1[35], a1[33]))))), vaddq_s32(vaddq_s32(a1[31], vaddq_s32(a1[29], vaddq_s32(a1[27], vaddq_s32(a1[25], a1[23])))), vaddq_s32(vaddq_s32(a1[21], vaddq_s32(a1[19], vaddq_s32(a1[17], a1[15]))), vaddq_s32(vaddq_s32(a1[13], vaddq_s32(a1[11], a1[9])), vaddq_s32(vaddq_s32(a1[7], a1[5]), vaddq_s32(a1[3], a1[1])))))))), v7));
  v9 = 0.0;
  v10 = 1;
  v144 = 0u;
  v145 = 0u;
  do
  {
    v11 = vcvtms_s32_f32(log2f((float)(int)v10));
    v13 = a1->i32[v10];
    v9 = v9 + (float)(v13 * v11);
    *((_DWORD *)&v144 + v11) += v13;
    ++v10;
  }
  while (v10 != 256);
  v14 = (float)v8;
  *(float *)v12.i32 = v9 / (float)v8;
  if (a2)
  {
    v15 = 0;
    v132 = (float32x4_t)vdupq_lane_s32(v12, 0);
    v16 = (int32x4_t)xmmword_24B722FA0;
    v17 = 0uLL;
    v18 = 0uLL;
    do
    {
      v137 = v18;
      v138 = v17;
      v133 = v16;
      v19.i64[0] = 0x400000004;
      v19.i64[1] = 0x400000004;
      v134 = vcvtq_f32_s32(v16);
      v139 = vcvtq_f32_s32(vaddq_s32(v16, v19));
      v140 = log2f(v134.f32[1]);
      v20.f32[0] = log2f(v134.f32[0]);
      v20.f32[1] = v140;
      v141 = v20;
      v21 = log2f(v134.f32[2]);
      v22 = v141;
      v22.f32[2] = v21;
      v142 = v22;
      v23 = log2f(v134.f32[3]);
      v24 = v142;
      v24.f32[3] = v23;
      v143 = v24;
      v134.i32[0] = log2f(v139.f32[1]);
      v25.f32[0] = log2f(v139.f32[0]);
      v25.i32[1] = v134.i32[0];
      v135 = v25;
      v26 = log2f(v139.f32[2]);
      v27 = v135;
      v27.f32[2] = v26;
      v136 = v27;
      v28 = log2f(v139.f32[3]);
      v29 = v136;
      v29.f32[3] = v28;
      v30 = vsubq_f32(vrndmq_f32(v143), v132);
      v31 = vsubq_f32(vrndmq_f32(v29), v132);
      v32 = vmlaq_f32(v138, vmulq_f32(v30, v30), vcvtq_f32_s32(*(int32x4_t *)((char *)&a1[v15] + 4)));
      v17 = v32;
      v18 = vmlaq_f32(v137, vmulq_f32(v31, v31), vcvtq_f32_s32(*(int32x4_t *)((char *)&a1[v15 + 1] + 4)));
      v33.i64[0] = 0x800000008;
      v33.i64[1] = 0x800000008;
      v16 = vaddq_s32(v133, v33);
      v15 += 2;
    }
    while (v15 != 62);
    v34 = vaddq_f32(v18, v32);
    v35 = (float)(7.0 - (float)(v9 / (float)v8)) * (float)(7.0 - (float)(v9 / (float)v8));
    v36 = exp2f(sqrtf((float)((float)((float)((float)((float)((float)((float)(vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v34, v34))+ (float)(v35 * (float)a1[62].i32[1]))+ (float)(v35 * (float)a1[62].i32[2]))+ (float)(v35 * (float)a1[62].i32[3]))+ (float)(v35 * (float)a1[63].i32[0]))+ (float)(v35 * (float)a1[63].i32[1]))+ (float)(v35 * (float)a1[63].i32[2]))+ (float)(v35 * (float)a1[63].i32[3]))/ v14));
    *(float *)v12.i32 = v9 / (float)v8;
    *a2 = v36;
    if (a3)
    {
      v38 = v144;
      v37 = DWORD1(v144);
      v40 = DWORD2(v144);
      v39 = HIDWORD(v144);
      v41 = DWORD1(v144) + v144 + DWORD2(v144) + HIDWORD(v144);
      v43 = v145;
      v42 = DWORD1(v145);
      v44 = v41 + v145;
      v45 = v41 + v145 + DWORD1(v145);
      v46 = DWORD2(v145);
      v47 = HIDWORD(v145);
      v48 = v45 + DWORD2(v145);
      v49 = (float)SHIDWORD(v145);
      v50 = (float)v45;
      v51 = HIDWORD(v145) + DWORD2(v145);
      *a3 = (float)v48 / (float)SHIDWORD(v145);
      a3[1] = v50 / (float)v51;
      a3[2] = (float)v44 / (float)(v51 + v42);
      a3[3] = (float)v41 / (float)(v51 + v42 + v43);
      v52 = 1.0 / v14;
      v53 = (float)v38 * (float)(1.0 / v14);
      v54 = truncf(v53 * 100.0);
      if ((int)(float)(v53 * 100.0) >= 1)
        v55 = v54;
      else
        v55 = -0.0;
      v56 = 0.0;
      v57 = (float)v37;
      if ((int)(float)(v53 * 100.0) >= 1)
        v58 = 1.0;
      else
        v58 = 0.0;
      v59 = v57 * v52;
      v60 = (float)(v57 * v52) * 100.0;
      v61 = (int)v60 < 1;
      v62 = truncf(v60);
      v63 = v58 + 1.0;
      if ((int)(float)(v53 * 100.0) < 1 && v61)
      {
        v63 = v58;
        v62 = -0.0;
      }
      v64 = (float)v40;
      v65 = (float)v40 * v52;
      v66 = v62 + v55;
      v67 = truncf(v65 * 100.0);
      v68 = v63 + 1.0;
      if ((int)(float)(v53 * 100.0) < 1 && v61 && (int)(float)(v65 * 100.0) < 1)
      {
        v68 = v63;
        v67 = -0.0;
      }
      v69 = (float)v39;
      v70 = (float)v39 * v52;
      v71 = truncf(v70 * 100.0);
      if ((int)(float)(v53 * 100.0) < 1 && v61 && (int)(float)(v65 * 100.0) < 1 && (int)(float)(v70 * 100.0) < 1)
        v71 = -0.0;
      else
        v68 = v68 + 1.0;
      v72 = v71 + v67;
      v73 = (float)v43;
      v74 = (float)v43 * v52;
      v75 = truncf(v74 * 100.0);
      v76 = (int)(float)(v53 * 100.0) < 1
         && v61
         && (int)(float)(v65 * 100.0) < 1
         && (int)(float)(v70 * 100.0) < 1
         && (int)(float)(v74 * 100.0) < 1;
      if (v76)
        v75 = -0.0;
      else
        v68 = v68 + 1.0;
      v77 = v75 + v66;
      v78 = (float)v42;
      v79 = (float)v42 * v52;
      v80 = truncf(v79 * 100.0);
      v81 = v76 && (int)(float)(v79 * 100.0) < 1;
      if (v76 && (int)(float)(v79 * 100.0) < 1)
        v80 = -0.0;
      else
        v68 = v68 + 1.0;
      v82 = v80 + v72;
      v83 = (float)((float)v46 * 100.0) * v52;
      v84 = (int)v83;
      v85 = (int)v83 < 1;
      v86 = truncf(v83);
      v87 = v68 + 1.0;
      if ((v85 & v81) != 0)
      {
        v87 = v68;
        v88 = -0.0;
      }
      else
      {
        v88 = v86;
      }
      v89 = v88 + v77;
      v90 = (float)(v49 * 100.0) * v52;
      v91 = (int)v90;
      v92 = (int)v90 < 1;
      v93 = truncf(v90);
      v94 = v87 + 1.0;
      if ((v92 & v81 & v85) != 0)
      {
        v94 = v87;
        v95 = -0.0;
      }
      else
      {
        v95 = v93;
      }
      v96 = (float)((float)(v95 + v82) + v89) / v94;
      v97 = (int)(float)((float)((float)v38 * 100.0) * v52);
      if (v97 < 1)
      {
        v98 = (int)(float)((float)(v57 * 100.0) / v14);
        if (v98 < 1)
        {
          v100 = (int)(float)((float)(v64 * 100.0) / v14);
          if (v100 < 1)
          {
            v102 = (int)(float)((float)(v69 * 100.0) / v14);
            if (v102 < 1)
            {
              v104 = (int)(float)((float)(v73 * 100.0) / v14);
              if (v104 < 1)
              {
                v106 = (int)(float)((float)(v78 * 100.0) / v14);
                v105 = 0.0;
                if (v106 < 1)
                {
                  v108 = 0;
                  v107 = 1;
                  v109 = v53 + v59;
                  v110 = v65 + v70;
                  if (v84 > 0)
                    goto LABEL_51;
                  goto LABEL_40;
                }
LABEL_39:
                v107 = 0;
                v105 = v105 + (float)((int)(float)((float)v106 - v96) * (int)(float)((float)v106 - v96));
                v108 = 1;
                v109 = v53 + v59;
                v110 = v65 + v70;
                if (v84 > 0)
                  goto LABEL_51;
LABEL_40:
                if ((v107 & 1) != 0)
                {
                  v111 = 0;
                  v112 = v109 + v110;
                  v113 = v74 + v79;
                  if (v91 > 0)
                  {
LABEL_56:
                    v105 = v105 + (float)((int)(float)(v93 - v96) * (int)(float)(v93 - v96));
LABEL_57:
                    v114 = v112 + v113;
                    v115 = v105 / (v94 * 100.0);
                    a3[4] = v115;
                    v116 = (float)(v38 - v37) / v14;
                    if (v116 <= 0.01)
                    {
                      v120 = (float)(v37 - v40) / v14;
                      v117 = 0.0;
                      if (v120 <= 0.01)
                      {
LABEL_65:
                        v122 = (float)(v40 - v39) / v14;
                        if (v122 > 0.01)
                        {
                          if (v122 > v117)
                            v117 = (float)(v40 - v39) / v14;
LABEL_68:
                          v118 = __OFSUB__(v43, v39);
                          v123 = v43 - v39;
                          if (!((v123 < 0) ^ v118 | (v123 == 0)))
                          {
                            v117 = fmaxf((float)v123 / v14, v117);
                            goto LABEL_75;
                          }
                          goto LABEL_73;
                        }
LABEL_70:
                        v124 = (float)(v39 - v43) / v14;
                        if (v124 <= 0.01)
                        {
LABEL_75:
                          v126 = (float)(v43 - v42) / v14;
                          if (v126 > 0.01)
                          {
                            if (v126 > v117)
                              v117 = (float)(v43 - v42) / v14;
LABEL_78:
                            v118 = __OFSUB__(v46, v42);
                            v127 = v46 - v42;
                            if (!((v127 < 0) ^ v118 | (v127 == 0)))
                            {
                              v117 = fmaxf((float)v127 / v14, v117);
LABEL_85:
                              v129 = (float)(v46 - v47) / v14;
                              if (v129 > v117 && v129 > 0.01)
                                v117 = (float)(v46 - v47) / v14;
LABEL_90:
                              a3[2] = (float)(v46 + 8 * v47) / (float)(9 * v8);
                              a3[5] = v117;
                              a3[6] = v109;
                              a3[7] = v112;
                              a3[8] = v114;
                              return exp2f((float)(*(float *)v12.i32 * 0.25018) + -1.0) * 0.4;
                            }
LABEL_83:
                            if (v47 > v46)
                              v117 = fmaxf((float)(v47 - v46) / v14, v117);
                            goto LABEL_90;
                          }
LABEL_80:
                          v128 = (float)(v42 - v46) / v14;
                          if (v128 <= 0.01)
                            goto LABEL_85;
                          if (v128 > v117)
                            v117 = (float)(v42 - v46) / v14;
                          goto LABEL_83;
                        }
                        if (v124 > v117)
                          v117 = (float)(v39 - v43) / v14;
LABEL_73:
                        v118 = __OFSUB__(v42, v43);
                        v125 = v42 - v43;
                        if ((v125 < 0) ^ v118 | (v125 == 0))
                          goto LABEL_78;
                        v117 = fmaxf((float)v125 / v14, v117);
                        goto LABEL_80;
                      }
                      if (v120 > 0.0)
                        v117 = (float)(v37 - v40) / v14;
                    }
                    else
                    {
                      v117 = fmaxf(v116, 0.0);
                      v118 = __OFSUB__(v40, v37);
                      v119 = v40 - v37;
                      if (!((v119 < 0) ^ v118 | (v119 == 0)))
                      {
                        v117 = fmaxf((float)v119 / v14, v117);
                        goto LABEL_65;
                      }
                    }
                    v118 = __OFSUB__(v39, v40);
                    v121 = v39 - v40;
                    if ((v121 < 0) ^ v118 | (v121 == 0))
                      goto LABEL_68;
                    v117 = fmaxf((float)v121 / v14, v117);
                    goto LABEL_70;
                  }
LABEL_55:
                  if (!v111)
                    goto LABEL_57;
                  goto LABEL_56;
                }
LABEL_51:
                v105 = v105 + (float)((int)(float)(v86 - v96) * (int)(float)(v86 - v96));
                if (v107)
                  v111 = 1;
                else
                  v111 = v108;
                v112 = v109 + v110;
                v113 = v74 + v79;
                if (v91 > 0)
                  goto LABEL_56;
                goto LABEL_55;
              }
              v103 = 0.0;
LABEL_38:
              v105 = v103 + (float)((int)(float)((float)v104 - v96) * (int)(float)((float)v104 - v96));
              v106 = (int)(float)((float)(v78 * 100.0) / v14);
              goto LABEL_39;
            }
            v101 = 0.0;
LABEL_37:
            v103 = v101 + (float)((int)(float)((float)v102 - v96) * (int)(float)((float)v102 - v96));
            v104 = (int)(float)((float)(v73 * 100.0) / v14);
            goto LABEL_38;
          }
          v99 = 0.0;
LABEL_36:
          v101 = v99 + (float)((int)(float)((float)v100 - v96) * (int)(float)((float)v100 - v96));
          v102 = (int)(float)((float)(v69 * 100.0) / v14);
          goto LABEL_37;
        }
      }
      else
      {
        v56 = (float)((int)(float)((float)v97 - v96) * (int)(float)((float)v97 - v96));
        v98 = (int)(float)((float)(v57 * 100.0) / v14);
      }
      v99 = v56 + (float)((int)(float)((float)v98 - v96) * (int)(float)((float)v98 - v96));
      v100 = (int)(float)((float)(v64 * 100.0) / v14);
      goto LABEL_36;
    }
  }
  return exp2f((float)(*(float *)v12.i32 * 0.25018) + -1.0) * 0.4;
}

void computeNormalizedHistogram(uint64_t a1, int a2, int a3, int a4, int8x16_t *a5)
{
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  _DWORD v27[256];
  uint64_t v28;
  int8x16x4_t v29;

  _X20 = a1;
  v28 = *MEMORY[0x24BDAC8D0];
  bzero(v27, 0x400uLL);
  v10 = a3 - 5;
  if (a3 != 5)
  {
    v11 = 0;
    do
    {
      v12 = 0;
      __asm { PRFM            #4, [X20] }
      do
      {
        _X13 = _X20 + v12;
        __asm { PRFUM           #4, [X13,#5] }
        ++v27[*(unsigned __int8 *)(_X20 + v12)];
        v12 += 5;
      }
      while (v12 <= a2 - 5);
      _X20 += (5 * a4);
      v11 += 5;
    }
    while (v11 < v10);
    v10 = v27[0];
  }
  for (i = 1; i != 256; ++i)
  {
    v10 += v27[i];
    v27[i] = v10;
  }
  v21 = 0;
  v22 = 255.0 / (float)v27[255];
  do
  {
    v23.i64[0] = 0x3F0000003F000000;
    v23.i64[1] = 0x3F0000003F000000;
    v24.i64[0] = 0x3F0000003F000000;
    v24.i64[1] = 0x3F0000003F000000;
    v25.i64[0] = 0x3F0000003F000000;
    v25.i64[1] = 0x3F0000003F000000;
    v26.i64[0] = 0x3F0000003F000000;
    v26.i64[1] = 0x3F0000003F000000;
    v29.val[3] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v26, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21 + 12]), v22));
    v29.val[2] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v25, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21 + 8]), v22));
    v29.val[1] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v24, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21 + 4]), v22));
    v29.val[0] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v23, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21]), v22));
    *a5++ = vqtbl4q_s8(v29, (int8x16_t)xmmword_24B723430);
    v21 += 16;
  }
  while (v21 != 256);
}

uint64_t histEqualization_uint8(void *a1, unsigned int a2, char *a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  Pixel_8 *v12;
  unsigned int data;
  unsigned int v14;
  uint64_t v16;
  uint64_t i;
  uint64_t v25;
  uint32x4_t *p_src;
  float v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  vImage_Buffer dest;
  vImage_Buffer src;
  unsigned int v35;
  uint64_t v36;
  int8x16x4_t v37;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = (Pixel_8 *)malloc_type_calloc(0x100uLL, 1uLL, 0x19325D71uLL);
  bzero(&src, 0x400uLL);
  data = a6 - 5;
  if (a6 != 5)
  {
    v14 = 0;
    _X11 = a3;
    do
    {
      v16 = 0;
      __asm { PRFM            #4, [X11] }
      do
      {
        _X14 = &_X11[v16];
        __asm { PRFUM           #4, [X14,#5] }
        ++*((_DWORD *)&src.data + _X11[v16]);
        v16 += 5;
      }
      while (v16 <= a5 - 5);
      _X11 += 5 * a4;
      v14 += 5;
    }
    while (v14 < data);
    data = src.data;
  }
  for (i = 4; i != 1024; i += 4)
  {
    data += *(_DWORD *)((char *)&src.data + i);
    *(_DWORD *)((char *)&src.data + i) = data;
  }
  v25 = 0;
  p_src = (uint32x4_t *)&src;
  v27 = 255.0 / (float)v35;
  do
  {
    v28.i64[0] = 0x3F0000003F000000;
    v28.i64[1] = 0x3F0000003F000000;
    v29.i64[0] = 0x3F0000003F000000;
    v29.i64[1] = 0x3F0000003F000000;
    v30.i64[0] = 0x3F0000003F000000;
    v30.i64[1] = 0x3F0000003F000000;
    v31.i64[0] = 0x3F0000003F000000;
    v31.i64[1] = 0x3F0000003F000000;
    v37.val[2] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v31, vcvtq_f32_u32(p_src[2]), v27));
    v37.val[1] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v30, vcvtq_f32_u32(p_src[1]), v27));
    v37.val[0] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v29, vcvtq_f32_u32(*p_src), v27));
    v37.val[3] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v28, vcvtq_f32_u32(p_src[3]), v27));
    *(int8x16_t *)&v12[v25] = vqtbl4q_s8(v37, (int8x16_t)xmmword_24B723430);
    v25 += 16;
    p_src += 4;
  }
  while (v25 != 256);
  src.data = a3;
  src.height = a6;
  src.width = a5;
  src.rowBytes = a4;
  dest.data = a1;
  dest.height = a6;
  dest.width = a5;
  dest.rowBytes = a2;
  vImageTableLookUp_Planar8(&src, &dest, v12, 0x10u);
  free(v12);
  return 0;
}

vImage_Error boxFilter_uint8_init(unsigned int a1, unsigned int a2, unsigned int a3, uint32_t kernel_height)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;
  char v7;

  v7 = 0;
  src.data = &v7;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a1;
  dest.data = &v7;
  dest.height = a3;
  dest.width = a2;
  dest.rowBytes = a1;
  result = vImageBoxConvolve_Planar8(&src, &dest, 0, 0, 0, kernel_height, kernel_height, 0, 0x82u);
  if ((result & 0x80000000) != 0)
  {
    syslog(3, "boxFilter_uint8_init: box filter failed when request minimum size err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

vImage_Error boxFilter_uint8(void *a1, void *a2, unsigned int a3, unsigned int a4, unsigned int a5, uint32_t kernel_width, void *tempBuffer)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = a2;
  src.height = a5;
  src.width = a4;
  src.rowBytes = a3;
  dest.data = a1;
  dest.height = a5;
  dest.width = a4;
  dest.rowBytes = a3;
  result = vImageBoxConvolve_Planar8(&src, &dest, tempBuffer, 0, 0, kernel_width, kernel_width, 0, 2u);
  if (result)
  {
    syslog(3, "boxFilter_uint8: box filter failed err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

char *copyImage(char *result, size_t __n, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  uint64_t v12;
  char *v14;
  char *v15;

  if (a3)
  {
    v12 = a3;
    v14 = &result[a5 + a6 * a4];
    v15 = (char *)(a7 + a9 + a10 * a8);
    do
    {
      result = (char *)memcpy(v14, v15, __n);
      v14 += a4;
      v15 += a8;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t invMatrix(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  v3 = malloc_type_malloc(4 * (a2 + 1), 0x100004052888210uLL);
  v4 = malloc_type_malloc(4 * (a2 * a2), 0x100004052888210uLL);
  sgetrf_NEWLAPACK();
  sgetri_NEWLAPACK();
  free(v3);
  free(v4);
  return 0;
}

char *IPDetector_constructor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  int v12;
  void *v13;
  void *v14;
  size_t v15;
  size_t v16;
  void *v17;
  void *v18;
  const char *v19;

  v6 = (char *)malloc_type_calloc(1uLL, 0x78uLL, 0x10B0040839BCD1CuLL);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 10) = 3;
    *(_QWORD *)v6 = a1;
    *((_QWORD *)v6 + 1) = a2;
    *((_QWORD *)v6 + 2) = a3;
    *(int64x2_t *)(v6 + 72) = vdupq_n_s64(0xAuLL);
    *((_QWORD *)v6 + 13) = 23;
    *(_OWORD *)(v6 + 88) = xmmword_24B723440;
    *((_WORD *)v6 + 56) = -1;
    v8 = malloc_type_calloc(1uLL, a3 * a2, 0x100004077774924uLL);
    *((_QWORD *)v7 + 3) = v8;
    if (v8)
    {
      v10 = *((_QWORD *)v7 + 1);
      v9 = *((_QWORD *)v7 + 2);
      v11 = 2 * v9 * v10;
      v12 = boxFilter_uint8_init(v9, *(_DWORD *)v7, v10, *((_DWORD *)v7 + 10));
      if (v11 <= v12)
        v11 = v12;
      v13 = malloc_type_calloc(1uLL, v11, 0x19B98B04uLL);
      *((_QWORD *)v7 + 4) = v13;
      if (v13)
      {
        bzero(v13, v11);
        v14 = malloc_type_calloc(1uLL, 0x258uLL, 0x1000040274DC3F3uLL);
        *((_QWORD *)v7 + 6) = v14;
        if (v14)
        {
          bzero(v14, 0x258uLL);
          v15 = 2 * a1;
          *((_QWORD *)v7 + 7) = malloc_type_calloc(1uLL, v15, 0x1000040BDFB0063uLL);
          v16 = 2 * a2;
          v17 = malloc_type_calloc(1uLL, v16, 0x1000040BDFB0063uLL);
          *((_QWORD *)v7 + 8) = v17;
          v18 = (void *)*((_QWORD *)v7 + 7);
          v19 = "IPDetector_constructor: Cannot allocate mBX, mBY ";
          if (v18 && v17)
          {
            bzero(v18, v15);
            bzero(*((void **)v7 + 8), v16);
            return v7;
          }
        }
        else
        {
          v19 = "IPDetector_constructor: Cannot allocate mCornerVec ";
        }
        syslog(3, v19);
      }
      else
      {
        syslog(3, "IPDetector_constructor: Cannot allocate mTmpBuffer ");
      }
    }
    else
    {
      syslog(3, "IPDetector_constructor: Cannot allocate mFltImage ");
    }
  }
  IPDetector_destructor(v7);
  return 0;
}

void IPDetector_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = (void *)a1[8];
    if (v2)
    {
      free(v2);
      a1[8] = 0;
    }
    v3 = (void *)a1[7];
    if (v3)
    {
      free(v3);
      a1[7] = 0;
    }
    v4 = (void *)a1[6];
    if (v4)
    {
      free(v4);
      a1[6] = 0;
    }
    v5 = (void *)a1[4];
    if (v5)
    {
      free(v5);
      a1[4] = 0;
    }
    v6 = (void *)a1[3];
    if (v6)
      free(v6);
    free(a1);
  }
}

uint64_t IPDetector_execute(uint64_t a1, _WORD *a2, _WORD *a3, _WORD *a4, unsigned int a5, uint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9, uint64_t a10, NSObject *a11)
{
  unint64_t v11;
  unint64_t v12;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned __int16 *v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned __int16 v28;
  _WORD *v29;

  v11 = *(_QWORD *)(a1 + 104);
  v12 = a8 - v11;
  if (a8 <= v11 || a9 <= v11)
    return 0;
  v18 = *(_QWORD *)(a1 + 96);
  if (IPDetector_response(a1, a6, a7, a8, a9, a10, a11) == -1)
    return 0;
  IPDetector_cornerDetect(a1, v12, a9 - v11, a10, v18);
  if (!a2 || !a3 || !a4)
  {
    FigDebugAssert3();
    return 0;
  }
  qsort(*(void **)(a1 + 48), *(_QWORD *)(a1 + 88), 6uLL, (int (__cdecl *)(const void *, const void *))Corner_compare);
  v19 = *(_QWORD *)(a1 + 88);
  if (!v19)
  {
    LODWORD(v20) = 0;
    v21 = 0;
    v26 = *(unsigned __int16 *)(a1 + 112);
    v25 = a5;
    if (v26 != 0xFFFF)
      goto LABEL_20;
    goto LABEL_19;
  }
  v20 = 0;
  v21 = 0;
  v22 = (unsigned __int16 *)(*(_QWORD *)(a1 + 48) + 4);
  while (1)
  {
    v24 = *v22;
    v22 += 3;
    v23 = v24;
    if (!v24)
      break;
    ++v20;
    v21 += v23;
    if (v19 == v20)
    {
      v20 = *(_QWORD *)(a1 + 88);
      break;
    }
  }
  v25 = a5;
  v26 = *(unsigned __int16 *)(a1 + 112);
  if (v26 == 0xFFFF)
  {
    if ((_DWORD)v20)
      v21 /= v20;
LABEL_19:
    v26 = v21 >> 1;
  }
LABEL_20:
  if (v20 >= v25)
    v27 = v25;
  else
    v27 = v20;
  if (!(_DWORD)v27)
    return 0;
  v28 = 0;
  v29 = (_WORD *)(*(_QWORD *)(a1 + 48) + 4);
  do
  {
    if (v26 < (unsigned __int16)*v29)
    {
      ++v28;
      *a2 = *(v29 - 2);
      *a3 = *(v29 - 1);
      *a4 = *v29;
    }
    v29 += 3;
    ++a4;
    ++a3;
    ++a2;
    --v27;
  }
  while (v27);
  return v28;
}

uint64_t IPDetector_response(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, NSObject *a7)
{
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _WORD *v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8x8_t *v24;
  uint8x8_t *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  uint8x8_t v28;
  int8x16_t v29;
  int16x4_t v30;
  int8x16_t v31;
  int16x4_t v32;
  int8x16_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int32x4_t v38;
  int16x4_t v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  _WORD *v43;
  unsigned __int8 *v44;
  unsigned __int8 *v45;
  unsigned __int8 *v46;
  unsigned __int8 *v47;
  unsigned __int8 *v48;
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
  int v66;
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
  _QWORD v89[7];
  _QWORD block[6];
  _QWORD v91[11];
  _QWORD v92[4];

  v12 = a3 + a3 * a6;
  v13 = (unsigned __int8 *)(*(_QWORD *)(a1 + 24) + v12);
  if (boxFilter_uint8(v13, (void *)(a2 + v12), a6, a4, a5, *(_DWORD *)(a1 + 40), *(void **)(a1 + 32)) != -1)
  {
    v14 = 2 * a6;
    v15 = 3 * a6;
    v92[0] = 0;
    v92[1] = v92;
    v16 = a4 >> 3;
    v17 = a4 & 7;
    v92[2] = 0x2000000000;
    v18 = *(_WORD **)(a1 + 32);
    v92[3] = v18;
    v91[0] = MEMORY[0x24BDAC760];
    v91[1] = 0x40000000;
    v91[2] = __IPDetector_response_block_invoke;
    v91[3] = &unk_251C9DE20;
    v91[4] = v92;
    v91[5] = v13;
    v91[6] = a6;
    v91[7] = 3 * a6;
    v91[8] = 2 * a6;
    v91[9] = a4 >> 3;
    v91[10] = v17;
    if (a7)
    {
      v89[6] = a5;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __IPDetector_response_block_invoke_2;
      block[3] = &unk_251C9DE48;
      block[4] = v91;
      block[5] = a5 >> 1;
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 0x40000000;
      v89[2] = __IPDetector_response_block_invoke_3;
      v89[3] = &unk_251C9DE70;
      v89[4] = v91;
      v89[5] = a5 >> 1;
      dispatch_async(a7, v89);
      dispatch_async(a7, block);
      dispatch_barrier_sync(a7, &__block_literal_global);
LABEL_4:
      _Block_object_dispose(v92, 8);
      return 0;
    }
    if (!a5)
      goto LABEL_4;
    v20 = 0;
    v21 = a4 >> 3;
    while (1)
    {
      if (v21)
      {
        v22 = 0;
        v23 = 0;
        v24 = (uint8x8_t *)v13;
        do
        {
          v25 = v24;
          v26 = (unsigned __int8 *)v24 + v14;
          v27 = (unsigned __int8 *)v24 - v14;
          v28 = *v24++;
          v29 = (int8x16_t)vmovl_u8(v28);
          v30 = (int16x4_t)vextq_s8(v29, v29, 8uLL).u64[0];
          *(int16x4_t *)v29.i8 = vadd_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v29.i8);
          v31 = (int8x16_t)vaddl_u8(*(uint8x8_t *)((char *)v25 + 3), *(uint8x8_t *)((char *)v25 - 3));
          v32 = vsub_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v31.i8);
          v33 = (int8x16_t)vaddl_u8(*(uint8x8_t *)((char *)v25 + 3 * a6), *(uint8x8_t *)((char *)v25 - 3 * a6));
          *(int16x4_t *)v29.i8 = vsub_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v33.i8);
          v34 = vmull_s16(v32, *(int16x4_t *)v29.i8);
          *(int16x4_t *)v29.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)v29.i8, v32), 4uLL);
          v35 = vsubq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)(v26 - 2), *(uint8x8_t *)(v27 + 2)), (int16x8_t)vaddl_u8(*(uint8x8_t *)(v26 + 2), *(uint8x8_t *)(v27 - 2)));
          v36 = vadd_s16(v30, v30);
          *(int16x4_t *)v31.i8 = vsub_s16(v36, (int16x4_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
          v37 = vsub_s16(v36, (int16x4_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL));
          v38 = vmull_s16(*(int16x4_t *)v31.i8, v37);
          v39 = vshr_n_s16(vadd_s16(v37, *(int16x4_t *)v31.i8), 4uLL);
          *(int16x8_t *)&v18[8 * v23++] = vshrn_high_n_s32(vshrn_n_s32(vmlsl_s16(vmlsl_s16(v34, *(int16x4_t *)v29.i8, *(int16x4_t *)v29.i8), *(int16x4_t *)v35.i8, *(int16x4_t *)v35.i8), 9uLL), vmlsl_high_s16(vmlsl_s16(v38, v39, v39), v35, v35), 9uLL);
          v22 += 8;
        }
        while (v23 < v16);
        v40 = (unsigned __int8 *)((char *)v24 - v14 - 2);
        v41 = (unsigned __int8 *)((char *)v24 - v14 + 2);
        v42 = (unsigned __int8 *)v24 + v14 + 2;
        v43 = &v18[v22];
        v44 = (unsigned __int8 *)v24 + v14 - 2;
        v45 = (unsigned __int8 *)v24 + v15;
        v46 = (unsigned __int8 *)v24 - v15;
        v47 = (unsigned __int8 *)&v25[1] + 3;
        v48 = (unsigned __int8 *)v25 + 5;
        v21 = v16;
        if (v17)
        {
LABEL_15:
          v49 = 2 * v24->u8[0];
          v50 = v49 - (*v48 + *v47);
          v51 = v49 - (*v46 + v24->u8[3 * a6]);
          v52 = v51 * v50;
          v53 = (v51 + v50) >> 4;
          v54 = *v44 - *v42 - *v40 + *v41;
          *v43 = (v52 - v54 * v54 - v53 * v53) >> 9;
          if (v17 != 1)
          {
            v55 = 2 * v24->u8[1];
            v56 = v55 - (v48[1] + v47[1]);
            v57 = v55 - (v46[1] + v45[1]);
            v58 = v57 * v56;
            v59 = (v57 + v56) >> 4;
            v60 = v44[1] - v42[1] - v40[1] + v41[1];
            v43[1] = (v58 - v60 * v60 - v59 * v59) >> 9;
            if (v17 != 2)
            {
              v61 = 2 * v24->u8[2];
              v62 = v61 - (v48[2] + v47[2]);
              v63 = v61 - (v46[2] + v45[2]);
              v64 = v63 * v62;
              v65 = (v63 + v62) >> 4;
              v66 = v44[2] - v42[2] - v40[2] + v41[2];
              v43[2] = (v64 - v66 * v66 - v65 * v65) >> 9;
              if (v17 != 3)
              {
                v67 = 2 * v24->u8[3];
                v68 = v67 - (v48[3] + v47[3]);
                v69 = v67 - (v46[3] + v45[3]);
                v70 = v69 * v68;
                v71 = (v69 + v68) >> 4;
                v72 = v44[3] - v42[3] - v40[3] + v41[3];
                v43[3] = (v70 - v72 * v72 - v71 * v71) >> 9;
                if (v17 != 4)
                {
                  v73 = 2 * v24->u8[4];
                  v74 = v73 - (v48[4] + v47[4]);
                  v75 = v73 - (v46[4] + v45[4]);
                  v76 = v75 * v74;
                  v77 = (v75 + v74) >> 4;
                  v78 = v44[4] - v42[4] - v40[4] + v41[4];
                  v43[4] = (v76 - v78 * v78 - v77 * v77) >> 9;
                  if (v17 != 5)
                  {
                    v79 = 2 * v24->u8[5];
                    v80 = v79 - (v48[5] + v47[5]);
                    v81 = v79 - (v46[5] + v45[5]);
                    v82 = v81 * v80;
                    v83 = (v81 + v80) >> 4;
                    v84 = v44[5] - v42[5] - v40[5] + v41[5];
                    v43[5] = (v82 - v84 * v84 - v83 * v83) >> 9;
                    if (v17 != 6)
                    {
                      v85 = 2 * v24->u8[6];
                      v86 = v85 - (v48[6] + v47[6]);
                      v87 = v85 - (v46[6] + v45[6]);
                      v88 = v44[6] - v42[6] - v40[6] + v41[6];
                      v43[6] = (v87 * v86 - v88 * v88 - ((v87 + v86) >> 4) * ((v87 + v86) >> 4)) >> 9;
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v48 = v13 - 3;
        v47 = v13 + 3;
        v46 = &v13[-v15];
        v45 = &v13[v15];
        v44 = &v13[v14 - 2];
        v42 = &v13[v14 + 2];
        v41 = &v13[-v14 + 2];
        v40 = &v13[-v14 - 2];
        v43 = v18;
        v24 = (uint8x8_t *)v13;
        if (v17)
          goto LABEL_15;
      }
      v13 += a6;
      v18 = (_WORD *)((char *)v18 + v14);
      if (++v20 == a5)
        goto LABEL_4;
    }
  }
  syslog(3, "IPDetector_response: box filter failed");
  return 0xFFFFFFFFLL;
}

void IPDetector_cornerDetect(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  _WORD *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  _WORD *v25;
  unint64_t v26;
  unint64_t v27;
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
  uint64_t i;
  int v39;
  __int16 *v40;
  __int16 *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _WORD *v46;

  bzero(*(void **)(a1 + 48), 6 * *(_QWORD *)(a1 + 88));
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = a2 / v10;
  v13 = a2 / v10 * v10;
  v14 = a3 / v11;
  v15 = a3 / v11 * v11;
  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 64);
    if (v15 == 1)
    {
      v17 = 0;
      v18 = 0;
      do
      {
LABEL_9:
        *(_WORD *)(v16 + 2 * v17) = v17 / v14;
        v17 = (unsigned __int16)++v18;
      }
      while (v15 > (unsigned __int16)v18);
      goto LABEL_10;
    }
    v18 = 0;
    v17 = 0;
    if (!(_WORD)v15)
      goto LABEL_9;
    v19 = (v15 - 1) >> 16;
    if (v19)
      goto LABEL_9;
    v17 = v15 & 0xFFFFFFFFFFFFFFFELL;
    v18 = v15 & 0xFFFFFFFE;
    do
    {
      v20 = (_WORD *)(v16 + 2 * v19);
      *v20 = v19 / v14;
      v20[1] = (v19 + 1) / v14;
      v19 += 2;
    }
    while (v17 != v19);
    if (v15 != v17)
      goto LABEL_9;
  }
LABEL_10:
  if (!v13)
    goto LABEL_19;
  v21 = *(_QWORD *)(a1 + 56);
  if (v13 == 1)
  {
    v22 = 0;
    v23 = 0;
    do
    {
LABEL_18:
      *(_WORD *)(v21 + 2 * v22) = v22 / v12;
      v22 = (unsigned __int16)++v23;
    }
    while (v13 > (unsigned __int16)v23);
    goto LABEL_19;
  }
  v23 = 0;
  v22 = 0;
  if (!(_WORD)v13)
    goto LABEL_18;
  v24 = (v13 - 1) >> 16;
  if (v24)
    goto LABEL_18;
  v22 = v13 & 0xFFFFFFFFFFFFFFFELL;
  v23 = v13 & 0xFFFFFFFE;
  do
  {
    v25 = (_WORD *)(v21 + 2 * v24);
    *v25 = v24 / v12;
    v25[1] = (v24 + 1) / v12;
    v24 += 2;
  }
  while (v22 != v24);
  if (v13 != v22)
    goto LABEL_18;
LABEL_19:
  v26 = v15 - 1;
  if (v15 - 1 >= 2)
  {
    v27 = v13 - 1;
    if (v27 >= 2)
    {
      v28 = *(_QWORD *)(a1 + 64);
      v29 = *(_QWORD *)(a1 + 32);
      v30 = 2 * a4;
      v31 = a5 * (2 * a4 + 2);
      v32 = v31 + 2 * a4 + v29 + 4;
      v33 = v29 + v31;
      v34 = v29 + v31 + 4 * a4;
      v35 = 1;
      do
      {
        v36 = 0;
        v37 = v10 * *(unsigned __int16 *)(v28 + 2 * v35);
        for (i = 1; i != v27; ++i)
        {
          v39 = *(__int16 *)(v32 + v36 - 2);
          if (v39 >= 1 && v39 >= *(__int16 *)(v32 + v36 - 4) && v39 >= *(__int16 *)(v32 + v36))
          {
            v40 = (__int16 *)(v33 + v36);
            if (v39 >= *(__int16 *)(v33 + v36 + 2))
            {
              v41 = (__int16 *)(v34 + v36);
              if (v39 >= *(__int16 *)(v34 + v36 + 2) && v39 >= *v40 && v39 >= v40[2] && v39 >= *v41 && v39 >= v41[2])
              {
                v42 = *(_QWORD *)(a1 + 48);
                v43 = v37 + *(unsigned __int16 *)(*(_QWORD *)(a1 + 56) + v36 + 2);
                v44 = v42 + 6 * v43;
                if (*(unsigned __int16 *)(v44 + 4) < (unsigned __int16)v39)
                {
                  *(_WORD *)(v44 + 4) = v39;
                  *(_WORD *)(v42 + 6 * v43) = i;
                  *(_WORD *)(v44 + 2) = v35;
                }
              }
            }
          }
          v36 += 2;
        }
        ++v35;
        v32 += v30;
        v33 += v30;
        v34 += v30;
      }
      while (v35 != v26);
    }
  }
  v45 = *(_QWORD *)(a1 + 88);
  if (v45)
  {
    v46 = (_WORD *)(*(_QWORD *)(a1 + 48) + 2);
    do
    {
      *(v46 - 1) += a5;
      *v46 += a5;
      v46 += 3;
      --v45;
    }
    while (v45);
  }
}

uint64_t Corner_compare(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 4) - *(unsigned __int16 *)(a1 + 4);
}

uint64_t *FeatureMatcher_constructor()
{
  int64x2_t *v0;
  uint64_t *v1;
  void *v2;
  void *v4;
  void *v5;

  v0 = (int64x2_t *)malloc_type_calloc(0x330uLL, 1uLL, 0x684EFA7BuLL);
  v1 = (uint64_t *)v0;
  if (!v0)
    return v1;
  *v0 = vdupq_n_s64(0xBuLL);
  v0[1] = vdupq_n_s64(0x17uLL);
  v0[2].i64[0] = 529;
  v0[50].i16[4] = 0;
  v0[2].i64[1] = (uint64_t)malloc_type_calloc(0x844uLL, 1uLL, 0xFC9EB72EuLL);
  v1[6] = (uint64_t)malloc_type_calloc(4 * v1[4], 1uLL, 0x4C7C9D80uLL);
  v2 = malloc_type_calloc(4 * v1[4], 1uLL, 0xE2134AE9uLL);
  v1[8] = (uint64_t)v2;
  if (v1[5])
  {
    if (v1[6] && v2)
      return v1;
  }
  if (v2)
  {
    free(v2);
    v1[8] = 0;
  }
  v4 = (void *)v1[6];
  if (v4)
  {
    free(v4);
    v1[6] = 0;
  }
  v5 = (void *)v1[5];
  if (v5)
    free(v5);
  free(v1);
  return 0;
}

void FeatureMatcher_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)a1[8];
    if (v2)
    {
      free(v2);
      a1[8] = 0;
    }
    v3 = (void *)a1[6];
    if (v3)
    {
      free(v3);
      a1[6] = 0;
    }
    v4 = (void *)a1[5];
    if (v4)
      free(v4);
    free(a1);
  }
}

void FeatureMatcher_init(uint64_t a1)
{
  bzero(*(void **)(a1 + 40), 4 * *(_QWORD *)(a1 + 32));
  bzero(*(void **)(a1 + 48), 4 * *(_QWORD *)(a1 + 32));
  bzero(*(void **)(a1 + 64), 4 * *(_QWORD *)(a1 + 32));
}

uint64_t FeatureMatcher_getPreprocessBlkData(uint64_t a1, void *a2, float *a3, unsigned int a4, unsigned int a5, uint64_t a6, size_t a7)
{
  vImagePixelCount v10;
  vImagePixelCount v11;
  vImage_Error v12;
  float __C;
  vImage_Buffer dest;
  vImage_Buffer src;

  v11 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 24);
  src.data = (void *)(a6 - *(_QWORD *)a1 + a4 + (a5 - *(_QWORD *)(a1 + 8)) * a7);
  src.height = v10;
  src.width = v11;
  src.rowBytes = a7;
  dest.data = a2;
  dest.height = v10;
  dest.width = v11;
  dest.rowBytes = 4 * v11;
  v12 = vImageConvert_Planar8toPlanarF(&src, &dest, 255.0, 0.0, 0);
  if (v12)
  {
    syslog(3, "FeatureMatcher_getPreprocessBlkData: block extraction faild err=%d", v12);
    return 0xFFFFFFFFLL;
  }
  else
  {
    __C = 0.0;
    vDSP_meanv((const float *)a2, 1, &__C, *(_QWORD *)(a1 + 32));
    __C = -__C;
    vDSP_vsadd((const float *)a2, 1, &__C, (float *)a2, 1, *(_QWORD *)(a1 + 32));
    vDSP_vsq((const float *)a2, 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    vDSP_meanv(*(const float **)(a1 + 64), 1, a3, *(_QWORD *)(a1 + 32));
    return 0;
  }
}

uint64_t FeatureMatcher_BestMatch(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, float *a4, uint64_t a5, size_t a6, int a7)
{
  _WORD *v10;
  _WORD *v11;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  float v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t result;
  unsigned __int16 v29;
  unsigned int v30;
  void *v31;
  vImagePixelCount v32;
  vImagePixelCount v33;
  vImage_Error v34;
  float v35;
  unint64_t v36;
  _WORD *v37;
  _WORD *v38;
  float *v39;
  unsigned int v40;
  unsigned __int16 v41;
  unsigned int v42;
  uint64_t v43;
  __int16 v44;
  __int16 v45;
  float __B;
  vImage_Buffer dest;
  vImage_Buffer __C;

  v10 = a3;
  v11 = a2;
  v13 = *a2;
  v14 = *a3;
  if (*(_BYTE *)(a1 + 808))
  {
    v15 = *(_QWORD *)(a1 + 784);
    if (v15)
      memset_pattern16((void *)(a1 + 72), &unk_24B7234A0, 4 * v15);
    memset_pattern16((void *)(a1 + 748), &unk_24B7234A0, 0x24uLL);
  }
  if (FeatureMatcher_getPreprocessBlkData(a1, *(void **)(a1 + 48), (float *)(a1 + 60), v13, v14, a5, a6) == -1)
  {
    syslog(3, "FeatureMatcher_BestMatch: failed getting the template block");
    return 0xFFFFFFFFLL;
  }
  LODWORD(__C.data) = 0;
  vDSP_vmul(*(const float **)(a1 + 40), 1, *(const float **)(a1 + 48), 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
  vDSP_meanv(*(const float **)(a1 + 64), 1, (float *)&__C, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 809))
  {
    v16 = *(float *)&__C.data / sqrtf(*(float *)(a1 + 60) * *(float *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 808))
      goto LABEL_13;
LABEL_11:
    v17 = *(_QWORD *)(a1 + 792) + *(_QWORD *)(a1 + 792) * *(_QWORD *)(a1 + 800);
    if (v17 < *(_QWORD *)(a1 + 784))
      *(float *)(a1 + 4 * v17 + 72) = v16;
    goto LABEL_13;
  }
  v16 = (float)(*(float *)&__C.data * *(float *)&__C.data) / (float)(*(float *)(a1 + 60) * *(float *)(a1 + 56));
  if (*(_BYTE *)(a1 + 808))
    goto LABEL_11;
LABEL_13:
  v18 = v14 - a7;
  v19 = (unsigned __int16)(v14 - a7);
  if (v14 + a7 < v19)
    goto LABEL_26;
  v42 = v14 + a7;
  v20 = v13 + a7;
  v41 = v13 - a7;
  v40 = (unsigned __int16)(v13 - a7);
  if (v13 + a7 < v40)
  {
    v21 = v14 + a7 + 1;
    v22 = (unsigned __int16)(v18 + 1);
    v23 = v42 + 1 - v22;
    if (v42 + 1 < v22)
      v23 = 0;
    v24 = v23 + 1;
    if (v24 < 2)
      goto LABEL_47;
    v25 = v21 >= v22;
    v26 = v21 - v22;
    if (!v25)
      v26 = 0;
    if (((v22 + (unsigned __int16)v26) & 0x10000) != 0)
      goto LABEL_47;
    if (HIWORD(v26))
      goto LABEL_47;
    v18 += v24 & 0xFFFFFFFE;
    v27 = v24 & 0xFFFFFFFE;
    do
      v27 -= 2;
    while (v27);
    if (v24 != (v24 & 0xFFFFFFFE))
    {
LABEL_47:
      do
        ++v18;
      while (v42 >= (unsigned __int16)v18);
    }
LABEL_26:
    v44 = v14;
    v45 = v13;
LABEL_27:
    result = 0;
    *v11 = v45;
    *v10 = v44;
    *a4 = v16;
    return result;
  }
  v44 = v14;
  v45 = v13;
  v38 = v10;
  v39 = a4;
  v37 = v11;
LABEL_30:
  v43 = (int)(v19 - v14);
  v30 = v40;
  v29 = v41;
  while (v13 == v29 && v14 == (unsigned __int16)v18)
  {
LABEL_31:
    v30 = ++v29;
    if (v20 < v29)
    {
      LOWORD(v18) = v18 + 1;
      v19 = (unsigned __int16)v18;
      v10 = v38;
      a4 = v39;
      v11 = v37;
      if (v42 < (unsigned __int16)v18)
        goto LABEL_27;
      goto LABEL_30;
    }
  }
  v31 = *(void **)(a1 + 48);
  v33 = *(_QWORD *)(a1 + 16);
  v32 = *(_QWORD *)(a1 + 24);
  __C.data = (void *)(a5 - *(_QWORD *)a1 + v29 + ((unsigned __int16)v18 - *(_QWORD *)(a1 + 8)) * a6);
  __C.height = v32;
  __C.width = v33;
  __C.rowBytes = a6;
  dest.data = v31;
  dest.height = v32;
  dest.width = v33;
  dest.rowBytes = 4 * v33;
  v34 = vImageConvert_Planar8toPlanarF(&__C, &dest, 255.0, 0.0, 0);
  if (!v34)
  {
    __B = 0.0;
    vDSP_meanv((const float *)v31, 1, &__B, *(_QWORD *)(a1 + 32));
    __B = -__B;
    vDSP_vsadd((const float *)v31, 1, &__B, (float *)v31, 1, *(_QWORD *)(a1 + 32));
    vDSP_vsq((const float *)v31, 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    vDSP_meanv(*(const float **)(a1 + 64), 1, (float *)(a1 + 60), *(_QWORD *)(a1 + 32));
    LODWORD(__C.data) = 0;
    vDSP_vmul(*(const float **)(a1 + 40), 1, *(const float **)(a1 + 48), 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    vDSP_meanv(*(const float **)(a1 + 64), 1, (float *)&__C, *(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 809))
    {
      v35 = *(float *)&__C.data / sqrtf(*(float *)(a1 + 60) * *(float *)(a1 + 56));
      if (!*(_BYTE *)(a1 + 808))
      {
LABEL_41:
        if (v35 > v16)
        {
          v44 = v18;
          v45 = v29;
          v16 = v35;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v35 = (float)(*(float *)&__C.data * *(float *)&__C.data) / (float)(*(float *)(a1 + 60) * *(float *)(a1 + 56));
      if (!*(_BYTE *)(a1 + 808))
        goto LABEL_41;
    }
    v36 = *(_QWORD *)(a1 + 792) + (int)(v30 - v13) + (*(_QWORD *)(a1 + 792) + v43) * *(_QWORD *)(a1 + 800);
    if (v36 < *(_QWORD *)(a1 + 784))
      *(float *)(a1 + 72 + 4 * v36) = v35;
    goto LABEL_41;
  }
  syslog(3, "FeatureMatcher_getPreprocessBlkData: block extraction faild err=%d", v34);
  syslog(3, "FeatureMatcher_BestMatch: failed getting the source block");
  return 0xFFFFFFFFLL;
}

uint64_t FeatureMatcher_execute(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, float *a6, unsigned int a7, uint64_t a8, size_t a9, uint64_t a10, size_t a11, unsigned __int16 a12)
{
  unint64_t v20;
  int v21;
  int PreprocessBlkData;
  uint64_t v24;
  float *v25;

  if (a7)
  {
    v25 = (float *)(a1 + 56);
    if (FeatureMatcher_getPreprocessBlkData(a1, *(void **)(a1 + 40), (float *)(a1 + 56), *a2, *a3, a8, a9) == -1)
    {
      v21 = 1;
      syslog(3, "FeatureMatcher_execute: failed getting the source block");
    }
    else
    {
      v24 = a8;
      v20 = 1;
      v21 = 1;
      while (FeatureMatcher_BestMatch(a1, a4, a5, a6, a10, a11, a12) != -1)
      {
        if (a7 == v20)
          goto LABEL_8;
        v21 = v20 < a7;
        PreprocessBlkData = FeatureMatcher_getPreprocessBlkData(a1, *(void **)(a1 + 40), v25, a2[v20], a3[v20], v24, a9);
        ++v20;
        ++a6;
        ++a5;
        ++a4;
        if (PreprocessBlkData == -1)
        {
          syslog(3, "FeatureMatcher_execute: failed getting the source block");
          return (v21 << 31 >> 31);
        }
      }
      syslog(3, "FeatureMatcher_execute: failed finding the best match");
    }
  }
  else
  {
LABEL_8:
    v21 = 0;
  }
  return (v21 << 31 >> 31);
}

float Norm_constructor(unint64_t a1, unint64_t a2)
{
  float *v4;
  float result;
  float v6;
  float v7;
  unint64_t v8;
  float v9;
  float v10;

  v4 = (float *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v4)
  {
    v6 = (float)a2;
    v7 = (float)a1;
    if (a1 <= a2)
      v8 = a2;
    else
      v8 = a1;
    v9 = 1.0 / (float)v8;
    *v4 = v9 + v9;
    v4[1] = v9 + v9;
    v4[2] = -(float)(v7 * v9);
    v4[3] = -(float)(v6 * v9);
    v10 = 1.0 / (float)(v9 + v9);
    v4[4] = v10;
    v4[5] = v10;
    result = v6 * 0.5;
    v4[6] = v7 * 0.5;
    v4[7] = result;
  }
  return result;
}

void Norm_destructor(void *a1)
{
  if (a1)
    free(a1);
}

float32_t Norm_dirs(float *a1, unint64_t a2, unint64_t a3, uint16x8_t *a4, uint16x8_t *a5, unsigned int a6, float32x4_t a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v11;
  BOOL v13;
  const float *v15;
  const float *v16;
  float32x4_t v17;
  float32x4_t v18;
  const float *v19;
  uint64_t v20;
  float32x4_t v21;
  float32x4_t *v22;
  float32x4_t *v23;
  uint16x8_t *v24;
  uint16x8_t *v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  unsigned __int16 *v29;
  unsigned __int16 *v30;
  _DWORD *v31;
  float *v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  float v37;

  if (a6)
  {
    if (a6 < 8)
    {
      v7 = 0;
LABEL_25:
      v29 = (unsigned __int16 *)a4 + v7;
      v30 = (unsigned __int16 *)a5 + v7;
      v31 = (_DWORD *)(a2 + 4 * v7);
      v32 = (float *)(a3 + 4 * v7);
      v33 = a6 - v7;
      do
      {
        v35 = *v29++;
        v34 = v35;
        v36 = *v30++;
        a7.f32[0] = a1[2] + (float)(*a1 * (float)v34);
        v37 = a1[3] + (float)(a1[1] * (float)v36);
        *v31++ = a7.i32[0];
        *v32++ = v37;
        --v33;
      }
      while (v33);
      return a7.f32[0];
    }
    v7 = 0;
    v8 = a2 + 4 * a6;
    v9 = a3 + 4 * a6;
    v11 = (unint64_t)(a1 + 4) > a2 && v8 > (unint64_t)a1;
    v13 = (unint64_t)(a1 + 4) > a3 && v9 > (unint64_t)a1;
    if (v8 > a3 && v9 > a2)
      goto LABEL_25;
    if (v11)
      goto LABEL_25;
    if (v13)
      goto LABEL_25;
    v7 = (unsigned __int16)a6 & 0xFFF8;
    v15 = a1;
    a7 = vld1q_dup_f32(v15++);
    v16 = a1 + 2;
    v17 = vld1q_dup_f32(v16);
    v18 = vld1q_dup_f32(v15);
    v19 = a1 + 3;
    v20 = v7;
    v21 = vld1q_dup_f32(v19);
    v22 = (float32x4_t *)a3;
    v23 = (float32x4_t *)a2;
    v24 = a5;
    v25 = a4;
    do
    {
      v26 = *v25++;
      v27 = v26;
      v28 = *v24++;
      *v23 = vmlaq_f32(v17, a7, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v27.i8)));
      v23[1] = vmlaq_f32(v17, a7, vcvtq_f32_u32(vmovl_high_u16(v27)));
      v23 += 2;
      *v22 = vmlaq_f32(v21, v18, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v28.i8)));
      v22[1] = vmlaq_f32(v21, v18, vcvtq_f32_u32(vmovl_high_u16(v28)));
      v22 += 2;
      v20 -= 8;
    }
    while (v20);
    if (v7 != a6)
      goto LABEL_25;
  }
  return a7.f32[0];
}

float *Norm_invs(float *result, int16x8_t *a2, int16x8_t *a3, float32x4_t *a4, float32x4_t *a5, unsigned int a6, double a7, double a8, double a9, double a10)
{
  uint64_t v10;
  float v11;
  float v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t v15;
  int16x8_t *v16;
  int16x8_t *v17;
  float32x4_t *v18;
  float32x4_t *v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float *v24;
  float *v25;
  __int16 *v26;
  __int16 *v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;

  if (a6)
  {
    v10 = 0;
    v11 = result[4];
    v12 = result[5];
    *(float *)&a9 = result[6] + 0.5;
    *(float *)&a10 = result[7] + 0.5;
    if (a6 < 8)
      goto LABEL_7;
    if ((unint64_t)((char *)a3 - (char *)a2) < 0x10)
      goto LABEL_7;
    v10 = (unsigned __int16)a6 & 0xFFF8;
    v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a9, 0);
    v14 = v10;
    v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a10, 0);
    v16 = a3;
    v17 = a2;
    v18 = a5;
    v19 = a4;
    do
    {
      v20 = *v19;
      v21 = v19[1];
      v19 += 2;
      v22 = *v18;
      v23 = v18[1];
      v18 += 2;
      *v17++ = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v13, v20, v11)), (int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v13, v21, v11)));
      *v16++ = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v15, v22, v12)), (int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v15, v23, v12)));
      v14 -= 8;
    }
    while (v14);
    if (v10 != a6)
    {
LABEL_7:
      v24 = &a4->f32[v10];
      v25 = &a5->f32[v10];
      v26 = &a2->i16[v10];
      v27 = &a3->i16[v10];
      v28 = a6 - v10;
      do
      {
        v29 = *v24++;
        v30 = v29;
        v31 = *v25++;
        *v26++ = (int)(float)(*(float *)&a9 + (float)(v11 * v30));
        *v27++ = (int)(float)(*(float *)&a10 + (float)(v12 * v31));
        --v28;
      }
      while (v28);
    }
  }
  return result;
}

unsigned __int16 *Pyramid_constructor(unint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  unsigned int v10;
  unint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  void *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned __int16 *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v28;
  uint64_t v29;
  unsigned __int16 *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  int64x2_t v35;
  unint64_t v36;
  int64x2_t v37;
  unsigned __int16 *v38;
  uint64_t v39;

  v8 = (unsigned __int16 *)malloc_type_calloc(0x330uLL, 1uLL, 0x6E6CDEE9uLL);
  v9 = v8;
  if (!v8)
    return v9;
  *v8 = a3;
  if (a4 >= 9)
    v10 = 9;
  else
    v10 = a4;
  v8[1] = v10;
  v8[2] = v10 - a3 + 1;
  v8[4] = 26;
  v8[3] = a3;
  *((_QWORD *)v8 + 42) = a1;
  *((_QWORD *)v8 + 52) = a2;
  if (v10)
  {
    v11 = (unint64_t *)(v8 + 212);
    v12 = a4;
    if (a4 >= 9uLL)
      v12 = 9;
    do
    {
      a1 >>= 1;
      *(v11 - 10) = a1;
      a2 >>= 1;
      *v11++ = a2;
      --v12;
    }
    while (v12);
  }
  v13 = 0;
  v14 = a4;
  if (a4 >= 9uLL)
    v14 = 9;
  v15 = 8 * v14 + 8;
  do
  {
    v16 = &v8[v13 / 2];
    *((_QWORD *)v16 + 32) = *(_QWORD *)&v8[v13 / 2 + 208] + 52;
    *((_QWORD *)v16 + 22) = *(_QWORD *)&v8[v13 / 2 + 168] + 52;
    v13 += 8;
  }
  while (v15 != v13);
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  if (v10 < a3)
  {
LABEL_16:
    v19 = v10;
    v20 = &v9[4 * v10];
    v21 = *((_QWORD *)v20 + 52);
    v22 = v21 >> 1;
    *((_QWORD *)v20 + 62) = v21 >> 1;
    *((_QWORD *)v20 + 72) = v21 - (v21 >> 1);
    if (v10)
    {
      v23 = v10 + 1;
      v24 = &v9[4 * v19 + 204];
      do
      {
        v22 *= 2;
        *((_QWORD *)v24 + 10) = v22;
        *((_QWORD *)v24 + 20) = *(_QWORD *)v24 - v22;
        --v23;
        v24 -= 4;
      }
      while (v23 > 1);
    }
    v25 = *v9;
    if (*v9)
    {
      if ((_DWORD)v25 == 1)
      {
        v26 = 0;
LABEL_26:
        v30 = &v9[4 * v26 + 368];
        v31 = v25 - v26;
        do
        {
          *((_QWORD *)v30 - 10) = 0;
          *(_QWORD *)v30 = 0;
          v30 += 4;
          --v31;
        }
        while (v31);
        goto LABEL_28;
      }
      v26 = (unsigned __int16)v25 & 0xFFFE;
      v28 = v9 + 368;
      v29 = v26;
      do
      {
        *(v28 - 5) = 0uLL;
        *v28++ = 0uLL;
        v29 -= 2;
      }
      while (v29);
      if (v26 != v25)
        goto LABEL_26;
    }
LABEL_28:
    if (v25 <= v19)
    {
      v32 = v19 - v25 + 1;
      if (v32 >= 2)
      {
        v33 = (v32 & 0xFFFFFFFFFFFFFFFELL) + v25;
        v34 = &v9[4 * v25];
        v35 = vdupq_n_s64(0x1AuLL);
        v36 = v32 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *((_OWORD *)v34 + 41) = 0uLL;
          v37 = vaddq_s64(*((int64x2_t *)v34 + 31), v35);
          v37.i64[0] *= *((_QWORD *)v34 + 22);
          v37.i64[1] *= *((_QWORD *)v34 + 23);
          *((int64x2_t *)v34 + 46) = v37;
          v34 += 8;
          v36 -= 2;
        }
        while (v36);
        if (v32 == (v32 & 0xFFFFFFFFFFFFFFFELL))
          return v9;
      }
      else
      {
        v33 = v25;
      }
      v38 = &v9[4 * v33];
      v39 = v19 - v33 + 1;
      do
      {
        *((_QWORD *)v38 + 82) = 0;
        *((_QWORD *)v38 + 92) = (*((_QWORD *)v38 + 62) + 26) * *((_QWORD *)v38 + 22);
        v38 += 4;
        --v39;
      }
      while (v39);
    }
    return v9;
  }
  while (1)
  {
    v17 = &v9[4 * (unsigned __int16)a3];
    v18 = malloc_type_calloc(*((_QWORD *)v17 + 32) * *((_QWORD *)v17 + 22), 1uLL, 0x51D75206uLL);
    *((_QWORD *)v17 + 2) = v18;
    if (!v18)
      break;
    bzero(v18, *((_QWORD *)v17 + 32) * *((_QWORD *)v17 + 22));
    *((_QWORD *)v17 + 12) = *((_QWORD *)v17 + 2) + v9[4] + *((_QWORD *)v17 + 22) * v9[4];
    LOWORD(a3) = a3 + 1;
    v10 = v9[1];
    if (v10 < (unsigned __int16)a3)
      goto LABEL_16;
  }
  Pyramid_destructor(v9);
  return 0;
}

void Pyramid_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
    {
      free(v2);
      a1[2] = 0;
    }
    v3 = (void *)a1[3];
    if (v3)
    {
      free(v3);
      a1[3] = 0;
    }
    v4 = (void *)a1[4];
    if (v4)
    {
      free(v4);
      a1[4] = 0;
    }
    v5 = (void *)a1[5];
    if (v5)
    {
      free(v5);
      a1[5] = 0;
    }
    v6 = (void *)a1[6];
    if (v6)
    {
      free(v6);
      a1[6] = 0;
    }
    v7 = (void *)a1[7];
    if (v7)
    {
      free(v7);
      a1[7] = 0;
    }
    v8 = (void *)a1[8];
    if (v8)
    {
      free(v8);
      a1[8] = 0;
    }
    v9 = (void *)a1[9];
    if (v9)
    {
      free(v9);
      a1[9] = 0;
    }
    v10 = (void *)a1[10];
    if (v10)
    {
      free(v10);
      a1[10] = 0;
    }
    v11 = (void *)a1[11];
    if (v11)
      free(v11);
    free(a1);
  }
}

uint64_t Pyramid_loadImage(unsigned __int16 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, NSObject *a9)
{
  uint64_t v9;
  uint64_t v10;
  int v13;
  int v14;
  int8x16_t *v18;
  unsigned int v19;
  uint64_t v20;
  unsigned __int16 *v21;
  uint64_t v22;
  size_t v23;
  uint64_t v24;
  char *v25;
  unsigned __int8 *v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  char *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  NSObject *v35;
  unsigned __int8 *v36;
  _QWORD block[7];
  _QWORD v38[7];
  _QWORD v39[7];
  int v40;
  int v41;
  int8x16_t v42[16];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = *((_QWORD *)a1 + 42);
  v10 = *((_QWORD *)a1 + 52);
  if (v9 != a4 || v10 != a5)
  {
    syslog(3, "Pyramid_loadImage: incompatible size in pyramid (%lu!=%lu) or (%lu!=%lu)", a4, v9, a5, v10);
    return 0xFFFFFFFFLL;
  }
  v13 = a7;
  v14 = a6;
  memset(&v42[2], 0, 224);
  if (a8)
    v18 = v42;
  else
    v18 = 0;
  memset(v42, 0, 32);
  if (!a8)
  {
    v19 = *a1;
    v36 = a2;
    if (v19 < 2)
      goto LABEL_11;
LABEL_14:
    v20 = 0;
    do
    {
      v21 = &a1[4 * v20++];
      filterSubsampling1channel(a2, *((_QWORD *)v21 + 43), *((_QWORD *)v21 + 53), a3, 0, 0, (uint64_t)a2, a3, v14, v13, (uint64_t)v18);
      if (v20 == a1[3])
      {
        v22 = *((_QWORD *)v21 + 53);
        if (v22)
        {
          v23 = *((_QWORD *)v21 + 43);
          v24 = *((_QWORD *)v21 + 23);
          v25 = (char *)(*((_QWORD *)v21 + 3) + a1[4] + v24 * a1[4]);
          v26 = a2;
          do
          {
            memcpy(v25, v26, v23);
            v25 += v24;
            v26 += a3;
            --v22;
          }
          while (v22);
        }
      }
      v18 = 0;
      v14 = 0;
      v13 = 0;
    }
    while (v20 < *a1 - 1);
    v13 = 0;
    v35 = a9;
    if (!*a1)
      goto LABEL_23;
    goto LABEL_22;
  }
  computeNormalizedHistogram((uint64_t)&a2[a6 + a7 * a3], a4, a5, a3, v42);
  v19 = *a1;
  v36 = a2;
  if (v19 >= 2)
    goto LABEL_14;
LABEL_11:
  v35 = a9;
  if (!v19)
  {
LABEL_23:
    v27 = *((_QWORD *)a1 + 52);
    if (v27)
    {
      v28 = *((_QWORD *)a1 + 42);
      v29 = *((_QWORD *)a1 + 22);
      v30 = (char *)(*((_QWORD *)a1 + 2) + a1[4] + v29 * a1[4]);
      v31 = &v36[v14 + v13 * a3];
      do
      {
        memcpy(v30, v31, v28);
        v30 += v29;
        v31 += a3;
        --v27;
      }
      while (v27);
    }
    goto LABEL_26;
  }
LABEL_22:
  if (!a1[3])
    goto LABEL_23;
LABEL_26:
  v32 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 0x40000000;
  v39[2] = __Pyramid_loadImage_block_invoke;
  v39[3] = &__block_descriptor_tmp_0;
  v39[4] = a1;
  v39[5] = v36;
  v39[6] = a3;
  v40 = v14;
  v41 = v13;
  if (v35)
  {
    v33 = *a1;
    if (*a1)
    {
      v34 = a1 + 368;
      do
      {
        *v34 = *(v34 - 30) * a3;
        ++v34;
        --v33;
      }
      while (v33);
    }
    block[6] = v18;
    v38[0] = v32;
    v38[1] = 0x40000000;
    v38[2] = __Pyramid_loadImage_block_invoke_2;
    v38[3] = &unk_251C9DEF8;
    v38[4] = v39;
    v38[5] = a1;
    v38[6] = v18;
    block[0] = v32;
    block[1] = 0x40000000;
    block[2] = __Pyramid_loadImage_block_invoke_3;
    block[3] = &unk_251C9DF20;
    block[4] = v39;
    block[5] = a1;
    dispatch_async(v35, block);
    dispatch_async(v35, v38);
    dispatch_barrier_sync(v35, &__block_literal_global_0);
  }
  else
  {
    __Pyramid_loadImage_block_invoke((unsigned __int8 *)v39, (uint64_t)(a1 + 208), (uint64_t)(a1 + 328), a1[4], a1[4], (uint64_t)v18);
  }
  return 0;
}

unsigned __int8 *filterSubsampling1channel(unsigned __int8 *result, unint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  uint8x8_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  uint8x8_t *v23;
  const char *v24;
  unsigned __int8 *v25;
  const char *v26;
  uint8x8_t v27;
  uint8x8_t v28;
  uint8x8_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint8x8_t *v34;
  const char *v35;
  unsigned __int8 *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint8x8_t v41;
  int8x8x2_t v42;
  int8x8x2_t v43;
  uint16x8_t v44;
  int8x8x2_t v45;
  int8x8x2_t v46;

  if (a3)
  {
    v11 = (int)a8 * a10;
    v12 = (int)a4 * a6;
    v13 = 2 * a8;
    v14 = a2 & 7;
    if (a2 > 7)
    {
      v17 = (uint8x8_t *)&result[a5 + v12];
      v18 = a2 >> 3;
      if (a11)
      {
        v19 = 0;
        v20 = a9 + v11 + a7 - 16;
        do
        {
          v21 = v18;
          v22 = (unsigned __int8 *)v20;
          v23 = v17;
          do
          {
            result = v22 + 16;
            v24 = (const char *)(v22 + 16);
            v45 = vld2_s8(v24);
            v25 = (unsigned __int8 *)&v24[a8];
            v26 = (const char *)&v22[a8 + 16];
            v42 = vld2_s8(v26);
            v27.i8[0] = *(_BYTE *)(a11 + v45.val[0].u8[0]);
            v27.i8[1] = *(_BYTE *)(a11 + v45.val[0].u8[1]);
            v27.i8[2] = *(_BYTE *)(a11 + v45.val[0].u8[2]);
            v27.i8[3] = *(_BYTE *)(a11 + v45.val[0].u8[3]);
            v28.i8[0] = *(_BYTE *)(a11 + v45.val[1].u8[0]);
            v28.i8[1] = *(_BYTE *)(a11 + v45.val[1].u8[1]);
            v28.i8[2] = *(_BYTE *)(a11 + v45.val[1].u8[2]);
            v28.i8[3] = *(_BYTE *)(a11 + v45.val[1].u8[3]);
            v29.i8[0] = *(_BYTE *)(a11 + v42.val[0].u8[0]);
            v27.i8[4] = *(_BYTE *)(a11 + v45.val[0].u8[4]);
            v28.i8[4] = *(_BYTE *)(a11 + v45.val[1].u8[4]);
            v29.i8[1] = *(_BYTE *)(a11 + v42.val[0].u8[1]);
            v27.i8[5] = *(_BYTE *)(a11 + v45.val[0].u8[5]);
            v28.i8[5] = *(_BYTE *)(a11 + v45.val[1].u8[5]);
            v29.i8[2] = *(_BYTE *)(a11 + v42.val[0].u8[2]);
            v27.i8[6] = *(_BYTE *)(a11 + v45.val[0].u8[6]);
            v28.i8[6] = *(_BYTE *)(a11 + v45.val[1].u8[6]);
            v29.i8[3] = *(_BYTE *)(a11 + v42.val[0].u8[3]);
            v27.i8[7] = *(_BYTE *)(a11 + v45.val[0].u8[7]);
            v28.i8[7] = *(_BYTE *)(a11 + v45.val[1].u8[7]);
            v29.i8[4] = *(_BYTE *)(a11 + v42.val[0].u8[4]);
            v29.i8[5] = *(_BYTE *)(a11 + v42.val[0].u8[5]);
            v29.i8[6] = *(_BYTE *)(a11 + v42.val[0].u8[6]);
            v29.i8[7] = *(_BYTE *)(a11 + v42.val[0].u8[7]);
            v45.val[0].i8[0] = *(_BYTE *)(a11 + v42.val[1].u8[0]);
            v45.val[0].i8[1] = *(_BYTE *)(a11 + v42.val[1].u8[1]);
            v45.val[0].i8[2] = *(_BYTE *)(a11 + v42.val[1].u8[2]);
            v45.val[0].i8[3] = *(_BYTE *)(a11 + v42.val[1].u8[3]);
            v45.val[0].i8[4] = *(_BYTE *)(a11 + v42.val[1].u8[4]);
            v45.val[0].i8[5] = *(_BYTE *)(a11 + v42.val[1].u8[5]);
            v45.val[0].i8[6] = *(_BYTE *)(a11 + v42.val[1].u8[6]);
            v45.val[0].i8[7] = *(_BYTE *)(a11 + v42.val[1].u8[7]);
            v22 = result;
            *v23++ = vqmovn_u16(vrshrq_n_u16(vaddw_u8(vaddw_u8(vaddl_u8(v28, v27), v29), (uint8x8_t)v45.val[0]), 2uLL));
            --v21;
          }
          while (v21);
          if (v14)
          {
            result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + result[16])
                                       + *(unsigned __int8 *)(a11 + result[17])
                                       + *(unsigned __int8 *)(a11 + v25[16]));
            v23->i8[0] = (result + *(unsigned __int8 *)(a11 + v25[17]) + 2) >> 2;
            if (v14 != 1)
            {
              result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[18])
                                         + *(unsigned __int8 *)(a11 + v22[19])
                                         + *(unsigned __int8 *)(a11 + v25[18]));
              v23->i8[1] = (result + *(unsigned __int8 *)(a11 + v25[19]) + 2) >> 2;
              if (v14 != 2)
              {
                result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[20])
                                           + *(unsigned __int8 *)(a11 + v22[21])
                                           + *(unsigned __int8 *)(a11 + v25[20]));
                v23->i8[2] = (result + *(unsigned __int8 *)(a11 + v25[21]) + 2) >> 2;
                if (v14 != 3)
                {
                  result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[22])
                                             + *(unsigned __int8 *)(a11 + v22[23])
                                             + *(unsigned __int8 *)(a11 + v25[22]));
                  v23->i8[3] = (result + *(unsigned __int8 *)(a11 + v25[23]) + 2) >> 2;
                  if (v14 != 4)
                  {
                    result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[24])
                                               + *(unsigned __int8 *)(a11 + v22[25])
                                               + *(unsigned __int8 *)(a11 + v25[24]));
                    v23->i8[4] = (result + *(unsigned __int8 *)(a11 + v25[25]) + 2) >> 2;
                    if (v14 != 5)
                    {
                      result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[26])
                                                 + *(unsigned __int8 *)(a11 + v22[27])
                                                 + *(unsigned __int8 *)(a11 + v25[26]));
                      v23->i8[5] = (result + *(unsigned __int8 *)(a11 + v25[27]) + 2) >> 2;
                      if (v14 != 6)
                      {
                        result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[28])
                                                   + *(unsigned __int8 *)(a11 + v22[29]));
                        v23->i8[6] = ((_DWORD)result
                                    + *(unsigned __int8 *)(a11 + v25[28])
                                    + *(unsigned __int8 *)(a11 + v25[29])
                                    + 2) >> 2;
                      }
                    }
                  }
                }
              }
            }
          }
          v17 = (uint8x8_t *)((char *)v17 + a4);
          ++v19;
          v20 += v13;
        }
        while (v19 != a3);
      }
      else if ((a2 & 7) != 0)
      {
        v30 = 0;
        v31 = a9 + v11 + a7 - 16;
        do
        {
          v32 = a2 >> 3;
          v33 = v31;
          v34 = v17;
          do
          {
            v35 = (const char *)(v33 + a8);
            v33 += 16;
            v43 = vld2_s8((const char *)v33);
            v36 = (unsigned __int8 *)(v33 + a8);
            v35 += 16;
            v46 = vld2_s8(v35);
            *v34++ = vqmovn_u16(vrshrq_n_u16(vaddw_u8(vaddw_u8(vaddl_u8((uint8x8_t)v43.val[1], (uint8x8_t)v43.val[0]), (uint8x8_t)v46.val[0]), (uint8x8_t)v46.val[1]), 2uLL));
            --v32;
          }
          while (v32);
          result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 17);
          v34->i8[0] = (*(unsigned __int8 *)(v33 + 16) + (_DWORD)result + v36[16] + v36[17] + 2) >> 2;
          if (v14 != 1)
          {
            result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 19);
            v34->i8[1] = (*(unsigned __int8 *)(v33 + 18) + (_DWORD)result + v36[18] + v36[19] + 2) >> 2;
            if (v14 != 2)
            {
              result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 21);
              v34->i8[2] = (*(unsigned __int8 *)(v33 + 20) + (_DWORD)result + v36[20] + v36[21] + 2) >> 2;
              if (v14 != 3)
              {
                result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 23);
                v34->i8[3] = (*(unsigned __int8 *)(v33 + 22) + (_DWORD)result + v36[22] + v36[23] + 2) >> 2;
                if (v14 != 4)
                {
                  result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 25);
                  v34->i8[4] = (*(unsigned __int8 *)(v33 + 24) + (_DWORD)result + v36[24] + v36[25] + 2) >> 2;
                  if (v14 != 5)
                  {
                    result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 27);
                    v34->i8[5] = (*(unsigned __int8 *)(v33 + 26) + (_DWORD)result + v36[26] + v36[27] + 2) >> 2;
                    if (v14 != 6)
                    {
                      result = (unsigned __int8 *)v36[28];
                      v34->i8[6] = (*(unsigned __int8 *)(v33 + 28)
                                  + *(unsigned __int8 *)(v33 + 29)
                                  + (_DWORD)result
                                  + v36[29]
                                  + 2) >> 2;
                    }
                  }
                }
              }
            }
          }
          v17 = (uint8x8_t *)((char *)v17 + a4);
          ++v30;
          v31 += v13;
        }
        while (v30 != a3);
      }
      else
      {
        v37 = (const char *)(a7 + a9 + v11);
        do
        {
          v38 = 0;
          v39 = v37;
          do
          {
            v40 = &v39[a8];
            v44 = (uint16x8_t)vld2_s8(v39);
            v39 += 16;
            v44 = vaddl_u8((uint8x8_t)v44.u64[1], *(uint8x8_t *)v44.i8);
            *(int8x8x2_t *)((char *)&v44 + 8) = vld2_s8(v40);
            v17[v38++] = vqmovn_u16(vrshrq_n_u16(vaddw_u8(vaddw_u8(v44, (uint8x8_t)v44.u64[1]), v41), 2uLL));
          }
          while (v18 != v38);
          v17 = (uint8x8_t *)((char *)v17 + a4);
          v37 += v13;
          ++v14;
        }
        while (v14 != a3);
      }
    }
    else if ((a2 & 7) != 0)
    {
      v15 = (unsigned __int8 *)(a9 + v11 + a7 + 13);
      v16 = &result[a5 + 3 + v12];
      if (a11)
      {
        do
        {
          *(v16 - 3) = (*(unsigned __int8 *)(a11 + *(v15 - 13))
                      + *(unsigned __int8 *)(a11 + *(v15 - 12))
                      + *(unsigned __int8 *)(a11 + v15[a8 - 13])
                      + *(unsigned __int8 *)(a11 + v15[a8 - 12])
                      + 2) >> 2;
          if (v14 != 1)
          {
            *(v16 - 2) = (*(unsigned __int8 *)(a11 + *(v15 - 11))
                        + *(unsigned __int8 *)(a11 + *(v15 - 10))
                        + *(unsigned __int8 *)(a11 + v15[a8 - 11])
                        + *(unsigned __int8 *)(a11 + v15[a8 - 10])
                        + 2) >> 2;
            if (v14 != 2)
            {
              *(v16 - 1) = (*(unsigned __int8 *)(a11 + *(v15 - 9))
                          + *(unsigned __int8 *)(a11 + *(v15 - 8))
                          + *(unsigned __int8 *)(a11 + v15[a8 - 9])
                          + *(unsigned __int8 *)(a11 + v15[a8 - 8])
                          + 2) >> 2;
              if (v14 != 3)
              {
                *v16 = (*(unsigned __int8 *)(a11 + *(v15 - 7))
                      + *(unsigned __int8 *)(a11 + *(v15 - 6))
                      + *(unsigned __int8 *)(a11 + v15[a8 - 7])
                      + *(unsigned __int8 *)(a11 + v15[a8 - 6])
                      + 2) >> 2;
                if (v14 != 4)
                {
                  v16[1] = (*(unsigned __int8 *)(a11 + *(v15 - 5))
                          + *(unsigned __int8 *)(a11 + *(v15 - 4))
                          + *(unsigned __int8 *)(a11 + v15[a8 - 5])
                          + *(unsigned __int8 *)(a11 + v15[a8 - 4])
                          + 2) >> 2;
                  if (v14 != 5)
                  {
                    v16[2] = (*(unsigned __int8 *)(a11 + *(v15 - 3))
                            + *(unsigned __int8 *)(a11 + *(v15 - 2))
                            + *(unsigned __int8 *)(a11 + v15[a8 - 3])
                            + *(unsigned __int8 *)(a11 + v15[a8 - 2])
                            + 2) >> 2;
                    if (v14 != 6)
                      v16[3] = (*(unsigned __int8 *)(a11 + *(v15 - 1))
                              + *(unsigned __int8 *)(a11 + *v15)
                              + *(unsigned __int8 *)(a11 + v15[a8 - 1])
                              + *(unsigned __int8 *)(a11 + v15[a8])
                              + 2) >> 2;
                  }
                }
              }
            }
          }
          v15 += v13;
          v16 += a4;
          --a3;
        }
        while (a3);
      }
      else
      {
        do
        {
          *(v16 - 3) = (*(v15 - 13) + *(v15 - 12) + v15[a8 - 13] + v15[a8 - 12] + 2) >> 2;
          if (v14 != 1)
          {
            *(v16 - 2) = (*(v15 - 11) + *(v15 - 10) + v15[a8 - 11] + v15[a8 - 10] + 2) >> 2;
            if (v14 != 2)
            {
              *(v16 - 1) = (*(v15 - 9) + *(v15 - 8) + v15[a8 - 9] + v15[a8 - 8] + 2) >> 2;
              if (v14 != 3)
              {
                *v16 = (*(v15 - 7) + *(v15 - 6) + v15[a8 - 7] + v15[a8 - 6] + 2) >> 2;
                if (v14 != 4)
                {
                  v16[1] = (*(v15 - 5) + *(v15 - 4) + v15[a8 - 5] + v15[a8 - 4] + 2) >> 2;
                  if (v14 != 5)
                  {
                    v16[2] = (*(v15 - 3) + *(v15 - 2) + v15[a8 - 3] + v15[a8 - 2] + 2) >> 2;
                    if (v14 != 6)
                      v16[3] = (*(v15 - 1) + *v15 + v15[a8 - 1] + v15[a8] + 2) >> 2;
                  }
                }
              }
            }
          }
          v15 += v13;
          v16 += a4;
          --a3;
        }
        while (a3);
      }
    }
  }
  return result;
}

unint64_t *RansacEngine_constructor(unint64_t a1)
{
  unint64_t *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = (unint64_t *)malloc_type_calloc(0x40uLL, 1uLL, 0xF2B40F10uLL);
  v3 = v2;
  if (!v2)
    goto LABEL_12;
  *v2 = a1;
  v2[1] = (unint64_t)malloc_type_calloc(8 * a1, 1uLL, 0xB85DB823uLL);
  v3[2] = (unint64_t)malloc_type_calloc(4 * a1, 1uLL, 0xB1FEC377uLL);
  v3[3] = (unint64_t)malloc_type_calloc(4 * a1, 1uLL, 0x8078C128uLL);
  v3[4] = (unint64_t)malloc_type_calloc(4 * a1, 1uLL, 0xA0F9A1BEuLL);
  v3[5] = (unint64_t)malloc_type_calloc(2 * a1, 1uLL, 0xE7969C0DuLL);
  RigidTransform_constructor();
  v3[7] = v4;
  v5 = v3[1];
  if (!v5)
    goto LABEL_12;
  if (v3[2] && v3[3] && v3[4] && v3[5] && v4)
  {
    if (*v3)
    {
      v6 = 0;
      do
      {
        *(_QWORD *)(v5 + 8 * v6) = v6;
        ++v6;
      }
      while (v6 < *v3);
    }
    return v3;
  }
  else
  {
LABEL_12:
    RansacEngine_destructor(v3);
    return 0;
  }
}

void RansacEngine_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
    {
      free(v2);
      a1[1] = 0;
    }
    v3 = (void *)a1[2];
    if (v3)
    {
      free(v3);
      a1[2] = 0;
    }
    v4 = (void *)a1[3];
    if (v4)
    {
      free(v4);
      a1[3] = 0;
    }
    v5 = (void *)a1[4];
    if (v5)
    {
      free(v5);
      a1[4] = 0;
    }
    v6 = (void *)a1[5];
    if (v6)
    {
      free(v6);
      a1[5] = 0;
    }
    v7 = (void *)a1[7];
    if (v7)
      Norm_destructor(v7);
    free(a1);
  }
}

void RansacEngine_init(uint64_t a1)
{
  bzero(*(void **)(a1 + 8), 8 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 16), 4 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 24), 4 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 32), 4 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 40), 2 * *(_QWORD *)a1);
}

uint64_t RansacEngine_execute(uint64_t a1, uint64_t a2, void *a3, float32x4_t *a4, float32x4_t *a5, const float *a6, const float *a7, const float *__C, vDSP_Length __N)
{
  vDSP_Length *v14;
  vDSP_Length v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  float32x4_t v22;
  float32x4_t *v23;
  float32x4_t *v24;
  float32x4_t *v25;
  const float *v26;
  const float *v27;
  const float *v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  float32x4_t v33;
  int v34;
  float32x4_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;
  unsigned __int16 v39;
  int v40;
  unsigned __int16 v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 v48;
  int v49;
  unsigned __int16 v50[2];

  v14 = *(vDSP_Length **)(a1 + 8);
  if (*(_QWORD *)a1)
  {
    v15 = 0;
    do
    {
      v14[v15] = v15;
      ++v15;
    }
    while (v15 < *(_QWORD *)a1);
  }
  vDSP_vsorti(__C, v14, 0, (unsigned __int16)__N, -1);
  v48 = 0;
  v16 = 0;
  v17 = 0;
  v49 = 1000;
  do
  {
    if (v17 <= (unsigned __int16)__N - 2)
      v18 = v17;
    else
      v18 = 0;
    v19 = (uint64_t *)(*(_QWORD *)(a1 + 8) + 8 * v18);
    v21 = *v19;
    v20 = v19[1];
    v50[0] = v21;
    v50[1] = v20;
    v22.f32[0] = RigidTransform_estimate(*(float **)(a1 + 56), (uint64_t)a6, (uint64_t)a7, (uint64_t)a4, (uint64_t)a5, v50, 2);
    v23 = a4;
    v24 = a4;
    v25 = a5;
    RigidTransform_dirs(*(float **)(a1 + 56), *(float32x4_t **)(a1 + 16), *(float32x4_t **)(a1 + 24), v24, a5, (unsigned __int16)__N, v22);
    v26 = a6;
    v27 = a6;
    v28 = a7;
    vDSP_vpythg(v27, 1, a7, 1, *(const float **)(a1 + 16), 1, *(const float **)(a1 + 24), 1, *(float **)(a1 + 32), 1, (unsigned __int16)__N);
    *(_WORD *)(a1 + 48) = 0;
    if ((_WORD)__N)
    {
      v29 = 0;
      v30 = 0;
      v31 = *(_QWORD *)(a1 + 32);
      do
      {
        if (*(float *)(v31 + 4 * v29) < 0.005)
        {
          *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v30) = v29;
          v30 = *(_WORD *)(a1 + 48) + 1;
          *(_WORD *)(a1 + 48) = v30;
        }
        ++v29;
      }
      while ((unsigned __int16)__N != v29);
      if (v30 > v48)
      {
        memcpy(a3, *(const void **)(a1 + 40), 2 * v30);
        v49 = RigidTransform_numTestsToDo(v30, (unsigned __int16)__N);
        v48 = v30;
      }
    }
    a7 = v28;
    a6 = v26;
    a5 = v25;
    a4 = v23;
    if ((int)(v16 + 1) >= v49)
      break;
    v17 = v18 + 1;
  }
  while (v16++ < 0x3E7);
  if (!v48)
    return 0;
  v33.f32[0] = RigidTransform_estimate(*(float **)(a1 + 56), (uint64_t)a6, (uint64_t)a7, (uint64_t)v23, (uint64_t)a5, (unsigned __int16 *)a3, v48);
  if (v34 == -1)
  {
LABEL_36:
    syslog(3, "RigidTransform_estimate failed", *(double *)v33.i64);
    return 0;
  }
  v35.f32[0] = RigidTransform_deepCopy(a2, *(_QWORD *)(a1 + 56));
  RigidTransform_dirs(*(float **)(a1 + 56), *(float32x4_t **)(a1 + 16), *(float32x4_t **)(a1 + 24), v23, a5, (unsigned __int16)__N, v35);
  vDSP_vpythg(a6, 1, a7, 1, *(const float **)(a1 + 16), 1, *(const float **)(a1 + 24), 1, *(float **)(a1 + 32), 1, (unsigned __int16)__N);
  *(_WORD *)(a1 + 48) = 0;
  if ((_WORD)__N)
  {
    v36 = 0;
    v37 = 0;
    v38 = *(_QWORD *)(a1 + 32);
    v39 = v48;
    do
    {
      if (*(float *)(v38 + 4 * v36) < 0.005)
      {
        *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v37) = v36;
        v37 = *(_WORD *)(a1 + 48) + 1;
        *(_WORD *)(a1 + 48) = v37;
      }
      ++v36;
    }
    while ((unsigned __int16)__N != v36);
  }
  else
  {
    v37 = 0;
    v39 = v48;
  }
  if (v39 < v37)
  {
    while (1)
    {
      v40 = v37;
      v41 = v37;
      memcpy(a3, *(const void **)(a1 + 40), 2 * v37);
      RigidTransform_deepCopy(a2, *(_QWORD *)(a1 + 56));
      v33.f32[0] = RigidTransform_estimate(*(float **)(a1 + 56), (uint64_t)a6, (uint64_t)a7, (uint64_t)a4, (uint64_t)a5, (unsigned __int16 *)a3, v40);
      if (v42 == -1)
        break;
      RigidTransform_dirs(*(float **)(a1 + 56), *(float32x4_t **)(a1 + 16), *(float32x4_t **)(a1 + 24), a4, a5, (unsigned __int16)__N, v33);
      vDSP_vpythg(a6, 1, a7, 1, *(const float **)(a1 + 16), 1, *(const float **)(a1 + 24), 1, *(float **)(a1 + 32), 1, (unsigned __int16)__N);
      *(_WORD *)(a1 + 48) = 0;
      if ((_WORD)__N)
      {
        v43 = 0;
        v37 = 0;
        v44 = *(_QWORD *)(a1 + 32);
        v39 = v41;
        do
        {
          if (*(float *)(v44 + 4 * v43) < 0.005)
          {
            *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v37) = v43;
            v37 = *(_WORD *)(a1 + 48) + 1;
            *(_WORD *)(a1 + 48) = v37;
          }
          ++v43;
        }
        while ((unsigned __int16)__N != v43);
      }
      else
      {
        v37 = 0;
        v39 = v41;
      }
      if (v39 >= v37)
        return v39;
    }
    goto LABEL_36;
  }
  return v39;
}

_QWORD *RegistrationEngine_constructor()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t *v7;

  v0 = malloc_type_calloc(1uLL, 0x25A8uLL, 0x1020040A4D661E3uLL);
  if (!v0)
    goto LABEL_10;
  HomographyTransform_constructor();
  v0[2] = v1;
  if (!v1)
    goto LABEL_10;
  RigidTransform_constructor();
  v0[3] = v2;
  RigidTransform_constructor();
  v0[4] = v3;
  v4 = !v0[3] || v3 == 0;
  if (v4
    || (RigidTransform_constructor(), (v0[5] = v5) == 0)
    || (v6 = FeatureMatcher_constructor(), (v0[1202] = v6) == 0)
    || (v7 = RansacEngine_constructor(0x64uLL), (v0[1203] = v7) == 0))
  {
LABEL_10:
    RegistrationEngine_destructor((uint64_t)v0);
    return 0;
  }
  return v0;
}

void RegistrationEngine_destructor(uint64_t a1)
{
  RegistrationEngine_purgeResources(a1);
  if (a1)
  {
    RansacEngine_destructor(*(_QWORD **)(a1 + 9624));
    FeatureMatcher_destructor(*(_QWORD **)(a1 + 9616));
    Norm_destructor(*(void **)(a1 + 32));
    Norm_destructor(*(void **)(a1 + 16));
    Norm_destructor(*(void **)(a1 + 24));
    Norm_destructor(*(void **)(a1 + 40));
    bzero((void *)a1, 0x25A8uLL);
    free((void *)a1);
  }
}

void RegistrationEngine_purgeResources(uint64_t a1)
{
  if (a1)
  {
    IPDetector_destructor(*(_QWORD **)(a1 + 9608));
    *(_QWORD *)(a1 + 9608) = 0;
    Pyramid_destructor(*(_QWORD **)a1);
    *(_QWORD *)a1 = 0;
    Pyramid_destructor(*(_QWORD **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
    Norm_destructor(*(void **)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
    Norm_destructor(*(void **)(a1 + 56));
    *(_QWORD *)(a1 + 56) = 0;
    Norm_destructor(*(void **)(a1 + 64));
    *(_QWORD *)(a1 + 64) = 0;
    Norm_destructor(*(void **)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
    Norm_destructor(*(void **)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
    Norm_destructor(*(void **)(a1 + 88));
    *(_QWORD *)(a1 + 88) = 0;
    Norm_destructor(*(void **)(a1 + 96));
    *(_QWORD *)(a1 + 96) = 0;
    Norm_destructor(*(void **)(a1 + 104));
    *(_QWORD *)(a1 + 104) = 0;
    Norm_destructor(*(void **)(a1 + 112));
    *(_QWORD *)(a1 + 112) = 0;
    Norm_destructor(*(void **)(a1 + 120));
    *(_QWORD *)(a1 + 120) = 0;
  }
}

uint64_t RegistrationEngine_init(uint64_t a1, unint64_t a2, unint64_t a3, int a4, int a5, unint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, char a10)
{
  unsigned __int16 v13;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
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
  char *v31;
  unint64_t v32;
  unint64_t v33;

  if (!a1)
    return 0;
  v13 = a5;
  v17 = a1;
  if (*(_QWORD *)(a1 + 128) == a2
    && *(_QWORD *)(a1 + 136) == a3
    && *(_DWORD *)(a1 + 176) == a4
    && *(_DWORD *)(a1 + 180) == a5
    && *(_QWORD *)(a1 + 144) == a6
    && *(_QWORD *)(a1 + 152) == a7
    && *(_QWORD *)(a1 + 160) == a8
    && *(_QWORD *)(a1 + 168) == a9
    && *(_QWORD *)(a1 + 9608)
    && *(_QWORD *)a1
    && *(_QWORD *)(a1 + 8)
    && *(_QWORD *)(a1 + 48)
    && *(_QWORD *)(a1 + 56)
    && *(_QWORD *)(a1 + 64)
    && *(_QWORD *)(a1 + 72)
    && *(_QWORD *)(a1 + 80)
    && *(_QWORD *)(a1 + 88)
    && *(_QWORD *)(a1 + 96)
    && *(_QWORD *)(a1 + 104)
    && *(_QWORD *)(a1 + 112)
    && *(_QWORD *)(a1 + 120))
  {
    return 0;
  }
  RegistrationEngine_purgeResources(a1);
  *(_QWORD *)(v17 + 128) = a2;
  *(_QWORD *)(v17 + 136) = a3;
  *(_QWORD *)(v17 + 160) = a8;
  *(_QWORD *)(v17 + 168) = a9;
  *(_QWORD *)(v17 + 144) = a6;
  *(_QWORD *)(v17 + 152) = a7;
  v19 = Pyramid_constructor(a6, a7, (unsigned __int16)a4, v13);
  *(_QWORD *)v17 = v19;
  if (v19)
  {
    v20 = Pyramid_constructor(*(_QWORD *)(v17 + 144), *(_QWORD *)(v17 + 152), (unsigned __int16)a4, v13);
    *(_QWORD *)(v17 + 8) = v20;
    if (v20)
    {
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 336), *(_QWORD *)(*(_QWORD *)v17 + 416));
      *(_QWORD *)(v17 + 48) = v21;
      if (!v21)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 344), *(_QWORD *)(*(_QWORD *)v17 + 424));
      *(_QWORD *)(v17 + 56) = v22;
      if (!v22)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 352), *(_QWORD *)(*(_QWORD *)v17 + 432));
      *(_QWORD *)(v17 + 64) = v23;
      if (!v23)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 360), *(_QWORD *)(*(_QWORD *)v17 + 440));
      *(_QWORD *)(v17 + 72) = v24;
      if (!v24)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 368), *(_QWORD *)(*(_QWORD *)v17 + 448));
      *(_QWORD *)(v17 + 80) = v25;
      if (!v25)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 376), *(_QWORD *)(*(_QWORD *)v17 + 456));
      *(_QWORD *)(v17 + 88) = v26;
      if (!v26)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 384), *(_QWORD *)(*(_QWORD *)v17 + 464));
      *(_QWORD *)(v17 + 96) = v27;
      if (!v27)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 392), *(_QWORD *)(*(_QWORD *)v17 + 472));
      *(_QWORD *)(v17 + 104) = v28;
      if (v28
        && (Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 400), *(_QWORD *)(*(_QWORD *)v17 + 480)),
            (*(_QWORD *)(v17 + 112) = v29) != 0)
        && (Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 408), *(_QWORD *)(*(_QWORD *)v17 + 488)),
            (*(_QWORD *)(v17 + 120) = v30) != 0))
      {
        v31 = IPDetector_constructor(*(_QWORD *)(*(_QWORD *)v17 + 8 * a4 + 336), *(_QWORD *)(*(_QWORD *)v17 + 8 * a4 + 256), *(_QWORD *)(*(_QWORD *)v17 + 8 * a4 + 176));
        *(_QWORD *)(v17 + 9608) = v31;
        if (v31)
        {
          if (a6 <= a7)
            v32 = a7;
          else
            v32 = a6;
          if (a2 <= a3)
            v33 = a3;
          else
            v33 = a2;
          RigidTransform_setParams(*(float **)(v17 + 40), (float)v32 * (float)(1.0 / (float)v33), 0.0, (float)((float)((float)a6 - (float)a2) + (float)((float)a8 + (float)a8)) * (float)(1.0 / (float)v33), (float)((float)((float)a7 - (float)a3) + (float)((float)a9 + (float)a9)) * (float)(1.0 / (float)v33));
          v18 = 0;
          *(_BYTE *)(v17 + 9632) = a10;
          v17 = 0;
        }
        else
        {
          v18 = 4294967292;
        }
      }
      else
      {
LABEL_44:
        v18 = 4294967293;
      }
    }
    else
    {
      v18 = 4294967294;
    }
  }
  else
  {
    v18 = 0xFFFFFFFFLL;
  }
  RegistrationEngine_purgeResources(v17);
  return v18;
}

uint64_t RegistrationEngine_loadTemplateImage(uint64_t a1, unsigned __int8 *a2, uint64_t a3, NSObject *a4)
{
  return Pyramid_loadImage(*(unsigned __int16 **)a1, a2, a3, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(unsigned __int8 *)(a1 + 9632), a4);
}

uint64_t RegistrationEngine_loadInputImage(uint64_t a1, unsigned __int8 *a2, uint64_t a3, NSObject *a4)
{
  return Pyramid_loadImage(*(unsigned __int16 **)(a1 + 8), a2, a3, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(unsigned __int8 *)(a1 + 9632), a4);
}

uint64_t RegistrationEngine_detectCorners(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t *v6;

  v2 = *a1;
  v3 = *(unsigned __int16 *)(*a1 + 2);
  if (v3 >= *(unsigned __int16 *)*a1)
  {
    v6 = a1 + 773;
    do
    {
      *((_WORD *)v6 + v3) = IPDetector_execute(a1[1201], &a1[25 * v3 + 23], &a1[25 * v3 + 273], &a1[25 * v3 + 523], 0x64u, *(_QWORD *)(v2 + 8 * v3 + 16), 26, *(_QWORD *)(v2 + 8 * v3 + 336), *(_QWORD *)(v2 + 8 * v3 + 416), *(_QWORD *)(v2 + 8 * v3 + 176), a2);
      v2 = *a1;
    }
    while ((int)v3-- > *(unsigned __int16 *)*a1);
  }
  return 0;
}

uint64_t RegistrationEngine_oneLevel(uint64_t a1, int a2)
{
  uint16x8_t *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint16x8_t *v13;
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
  float32x4_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v36;
  uint64_t v37;
  float32x4_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  unsigned __int16 v44;
  unsigned __int16 *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _DWORD *v50;
  _WORD *v51;
  uint64_t v52;
  _WORD *v53;
  _DWORD *v54;
  uint64_t result;
  float32x4_t v56;
  vDSP_Length __N;
  uint16x8_t *v58;
  uint16x8_t *v59;

  v2 = (uint16x8_t *)(a1 + 6204);
  v3 = a1 + 200 * a2;
  *(_OWORD *)(a1 + 6204) = *(_OWORD *)(v3 + 184);
  v4 = *(_OWORD *)(v3 + 200);
  v5 = *(_OWORD *)(v3 + 216);
  v6 = *(_OWORD *)(v3 + 248);
  *(_OWORD *)(a1 + 6252) = *(_OWORD *)(v3 + 232);
  *(_OWORD *)(a1 + 6268) = v6;
  *(_OWORD *)(a1 + 6220) = v4;
  *(_OWORD *)(a1 + 6236) = v5;
  v7 = *(_OWORD *)(v3 + 264);
  v8 = *(_OWORD *)(v3 + 280);
  v9 = *(_OWORD *)(v3 + 312);
  *(_OWORD *)(a1 + 6316) = *(_OWORD *)(v3 + 296);
  *(_OWORD *)(a1 + 6332) = v9;
  *(_OWORD *)(a1 + 6284) = v7;
  *(_OWORD *)(a1 + 6300) = v8;
  v10 = *(_OWORD *)(v3 + 328);
  v11 = *(_OWORD *)(v3 + 344);
  v12 = *(_OWORD *)(v3 + 360);
  *(_QWORD *)(a1 + 6396) = *(_QWORD *)(v3 + 376);
  *(_OWORD *)(a1 + 6364) = v11;
  *(_OWORD *)(a1 + 6380) = v12;
  *(_OWORD *)(a1 + 6348) = v10;
  v13 = (uint16x8_t *)(a1 + 6404);
  *(_OWORD *)(a1 + 6404) = *(_OWORD *)(v3 + 2184);
  v14 = *(_OWORD *)(v3 + 2200);
  v15 = *(_OWORD *)(v3 + 2216);
  v16 = *(_OWORD *)(v3 + 2248);
  *(_OWORD *)(a1 + 6452) = *(_OWORD *)(v3 + 2232);
  *(_OWORD *)(a1 + 6468) = v16;
  *(_OWORD *)(a1 + 6420) = v14;
  *(_OWORD *)(a1 + 6436) = v15;
  v17 = *(_OWORD *)(v3 + 2264);
  v18 = *(_OWORD *)(v3 + 2280);
  v19 = *(_OWORD *)(v3 + 2312);
  *(_OWORD *)(a1 + 6516) = *(_OWORD *)(v3 + 2296);
  *(_OWORD *)(a1 + 6532) = v19;
  *(_OWORD *)(a1 + 6484) = v17;
  *(_OWORD *)(a1 + 6500) = v18;
  v20 = *(_OWORD *)(v3 + 2328);
  v21 = *(_OWORD *)(v3 + 2344);
  v22 = *(_OWORD *)(v3 + 2360);
  *(_QWORD *)(a1 + 6596) = *(_QWORD *)(v3 + 2376);
  *(_OWORD *)(a1 + 6564) = v21;
  *(_OWORD *)(a1 + 6580) = v22;
  *(_OWORD *)(a1 + 6548) = v20;
  *(_OWORD *)(a1 + 6604) = *(_OWORD *)(v3 + 4184);
  v23 = *(_OWORD *)(v3 + 4200);
  v24 = *(_OWORD *)(v3 + 4216);
  v25 = *(_OWORD *)(v3 + 4248);
  *(_OWORD *)(a1 + 6652) = *(_OWORD *)(v3 + 4232);
  *(_OWORD *)(a1 + 6668) = v25;
  *(_OWORD *)(a1 + 6620) = v23;
  *(_OWORD *)(a1 + 6636) = v24;
  v26 = *(_OWORD *)(v3 + 4264);
  v27 = *(_OWORD *)(v3 + 4280);
  v28 = *(_OWORD *)(v3 + 4312);
  *(_OWORD *)(a1 + 6716) = *(_OWORD *)(v3 + 4296);
  *(_OWORD *)(a1 + 6732) = v28;
  *(_OWORD *)(a1 + 6684) = v26;
  *(_OWORD *)(a1 + 6700) = v27;
  v29 = *(float32x4_t *)(v3 + 4328);
  v30 = *(_OWORD *)(v3 + 4344);
  v31 = *(_OWORD *)(v3 + 4360);
  *(_QWORD *)(a1 + 6796) = *(_QWORD *)(v3 + 4376);
  *(_OWORD *)(a1 + 6764) = v30;
  *(_OWORD *)(a1 + 6780) = v31;
  *(float32x4_t *)(a1 + 6748) = v29;
  v32 = 2 * a2;
  v33 = *(unsigned __int16 *)(a1 + v32 + 6184);
  v34 = *(unsigned __int16 *)((char *)&kRegistrationMinNumInliers + v32);
  if (v33 < v34)
    return 0;
  v36 = 8 * a2;
  v37 = a1 + v36;
  v38.f32[0] = Norm_dirs(*(float **)(a1 + v36 + 48), a1 + 7404, a1 + 7804, v2, v13, v33, v29);
  *(float *)&v39 = RigidTransform_invs(*(float **)(a1 + 24), (float32x4_t *)(a1 + 8204), (float32x4_t *)(a1 + 8604), (float32x4_t *)(a1 + 7404), (float32x4_t *)(a1 + 7804), v33, v38);
  v58 = (uint16x8_t *)(a1 + 7004);
  v59 = (uint16x8_t *)(a1 + 6804);
  Norm_invs(*(float **)(v37 + 48), (int16x8_t *)(a1 + 6804), (int16x8_t *)(a1 + 7004), (float32x4_t *)(a1 + 8204), (float32x4_t *)(a1 + 8604), v33, v39, v40, v41, v42);
  if (!(_DWORD)v33)
    goto LABEL_15;
  v43 = 0;
  v44 = 0;
  v45 = (unsigned __int16 *)(a1 + 7004);
  do
  {
    v46 = *(v45 - 100);
    if (v46 >= 0x1A)
    {
      v47 = *(_QWORD *)a1 + v36;
      if (*(_QWORD *)(v47 + 336) - 26 > v46)
      {
        v48 = *v45;
        if (v48 >= 0x1A && *(_QWORD *)(v47 + 416) - 26 > v48)
          *(_WORD *)(a1 + 7204 + 2 * v44++) = v43;
      }
    }
    ++v43;
    ++v45;
  }
  while (v33 != v43);
  if (v44)
  {
    v49 = 0;
    v50 = (_DWORD *)(a1 + 7404);
    v51 = (_WORD *)(a1 + 6204);
    do
    {
      v52 = (unsigned __int16)v51[500];
      if (v49 != v52)
      {
        v53 = (_WORD *)(a1 + 2 * v52);
        v51[300] = v53[3402];
        v54 = (_DWORD *)(a1 + 4 * v52);
        v50[200] = v54[2051];
        v51[400] = v53[3502];
        v50[300] = v54[2151];
        *v51 = v53[3102];
        *v50 = v54[1851];
        v51[100] = v53[3202];
        v50[100] = v54[1951];
      }
      ++v49;
      ++v50;
      ++v51;
    }
    while (v44 != v49);
  }
  else
  {
LABEL_15:
    v44 = 0;
  }
  if (v34 > v44)
    return 0;
  FeatureMatcher_execute(*(_QWORD *)(a1 + 9616), (unsigned __int16 *)v2, (unsigned __int16 *)v13, (unsigned __int16 *)v59, (unsigned __int16 *)v58, (float *)(a1 + 9004), v44, *(_QWORD *)(*(_QWORD *)a1 + v36 + 96), *(_QWORD *)(*(_QWORD *)a1 + v36 + 176), *(_QWORD *)(*(_QWORD *)(a1 + 8) + v36 + 96), *(_QWORD *)(*(_QWORD *)(a1 + 8) + v36 + 176), 1u);
  Norm_dirs(*(float **)(v37 + 48), a1 + 8204, a1 + 8604, v59, v58, v44, v56);
  RigidTransform_deepCopy(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 24));
  LOWORD(__N) = v44;
  result = RansacEngine_execute(*(_QWORD *)(a1 + 9624), *(_QWORD *)(a1 + 24), (void *)(a1 + 9404), (float32x4_t *)(a1 + 8204), (float32x4_t *)(a1 + 8604), (const float *)(a1 + 7404), (const float *)(a1 + 7804), (const float *)(a1 + 9004), __N);
  *(_WORD *)(a1 + 9604) = result;
  if (result <= v34)
  {
    RigidTransform_deepCopy(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
    return *(unsigned __int16 *)(a1 + 9604);
  }
  return result;
}

uint64_t RegistrationEngine_execute(unsigned __int16 **a1)
{
  unsigned __int16 *v2;
  int v3;
  unsigned int v5;

  v2 = (unsigned __int16 *)a1 + 4802;
  *((_WORD *)a1 + 4802) = 0;
  RigidTransform_eye(a1[3]);
  HomographyTransform_eye(a1[2]);
  FeatureMatcher_init((uint64_t)a1[1202]);
  RansacEngine_init((uint64_t)a1[1203]);
  v3 = (*a1)[1];
  if (v3 >= **a1)
  {
    do
      RegistrationEngine_oneLevel((uint64_t)a1, v3);
    while (v3-- > **a1);
  }
  v5 = *v2;
  if (v5 >= 6)
  {
    AffineTransform_estimate((float32x4_t *)a1[2], (uint64_t)a1 + 8204, (uint64_t)a1 + 8604, (uint64_t)a1 + 7404, (uint64_t)a1 + 7804, (unsigned __int16 *)a1 + 4702, v5);
    RigidTransform_changeCoordinateSystem((float *)a1[3], (float *)a1[5]);
    return 0;
  }
  else
  {
    syslog(4, "Registration could not detect more that %d inlier corners at the highest resolution.\n", *v2);
    return 0xFFFFFFFFLL;
  }
}

_QWORD *RegWarp_constructor(uint64_t a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  GLuint *v15;
  dispatch_queue_t v16;

  v4 = malloc_type_calloc(8uLL, 1uLL, 0x47154BD6uLL);
  if (!v4)
    return v4;
  v5 = malloc_type_calloc(0xA0uLL, 1uLL, 0xC8EC4DBAuLL);
  *v4 = v5;
  if (!v5)
  {
    free(v4);
    return 0;
  }
  v6 = v5;
  v7 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
  v6[11] = v7;
  if (!v7)
    goto LABEL_16;
  v8 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
  v6[12] = v8;
  if (!v8)
    goto LABEL_16;
  v9 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
  v6[13] = v9;
  if (!v9)
    goto LABEL_16;
  v10 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
  v6[14] = v10;
  if (!v10)
    goto LABEL_16;
  v11 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
  v6[15] = v11;
  if (!v11)
    goto LABEL_16;
  v12 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
  v6[16] = v12;
  if (!v12
    || (v13 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL), (v6[17] = v13) == 0)
    || (v14 = RegistrationEngine_constructor(), (v6[9] = v14) == 0)
    || a1 && (v15 = WarpingEngine_constructor(a1), (v6[10] = v15) == 0))
  {
LABEL_16:
    RegWarp_destructor((void **)v4);
    return 0;
  }
  if (a2)
  {
    v16 = dispatch_queue_create("regWarpQueue", MEMORY[0x24BDAC9C0]);
    v6[19] = v16;
    if (!v16)
    {
      syslog(4, "RegWarp_constructor: Cannot create GCD queue.");
      return v4;
    }
  }
  return v4;
}

void RegWarp_destructor(void **a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v3 = *((_QWORD *)v2 + 19);
      if (v3)
      {
        dispatch_release(v3);
        *((_QWORD *)v2 + 19) = 0;
      }
      v4 = (void *)*((_QWORD *)v2 + 11);
      if (v4)
      {
        free(v4);
        *((_QWORD *)v2 + 11) = 0;
      }
      v5 = (void *)*((_QWORD *)v2 + 12);
      if (v5)
      {
        free(v5);
        *((_QWORD *)v2 + 12) = 0;
      }
      v6 = (void *)*((_QWORD *)v2 + 13);
      if (v6)
      {
        free(v6);
        *((_QWORD *)v2 + 13) = 0;
      }
      v7 = (void *)*((_QWORD *)v2 + 14);
      if (v7)
      {
        free(v7);
        *((_QWORD *)v2 + 14) = 0;
      }
      v8 = (void *)*((_QWORD *)v2 + 15);
      if (v8)
      {
        free(v8);
        *((_QWORD *)v2 + 15) = 0;
      }
      v9 = (void *)*((_QWORD *)v2 + 16);
      if (v9)
      {
        free(v9);
        *((_QWORD *)v2 + 16) = 0;
      }
      v10 = (void *)*((_QWORD *)v2 + 17);
      if (v10)
      {
        free(v10);
        *((_QWORD *)v2 + 17) = 0;
      }
      RegistrationEngine_destructor(*((_QWORD *)v2 + 9));
      WarpingEngine_destructor(*((void **)v2 + 10));
      free(*a1);
    }
    free(a1);
  }
}

uint64_t Reg_execute(uint64_t a1, __CVBuffer *a2, CVPixelBufferRef *a3, int a4, int a5)
{
  uint64_t v6;
  CVPixelBufferRef *v7;
  _QWORD *v10;
  __CVBuffer *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *BaseAddressOfPlane;
  unsigned int BytesPerRowOfPlane;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __CVBuffer *v36;

  LODWORD(v6) = a4;
  v7 = a3;
  v10 = *(_QWORD **)a1;
  v11 = a3[a4];
  CVPixelBufferLockBaseAddress(v11, 0);
  if (*((_BYTE *)v10 + 144))
  {
    v12 = 0;
    v13 = *(_QWORD **)a1;
    v14 = *(_QWORD *)(*(_QWORD *)a1 + 88);
    v15 = *(_QWORD *)(*(_QWORD *)a1 + 96);
    *(_OWORD *)v14 = xmmword_24B7234D0;
    *(_OWORD *)(v14 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v14 + 32) = 1065353216;
    *(_OWORD *)v15 = xmmword_24B7234D0;
    *(_OWORD *)(v15 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v15 + 32) = 1065353216;
    v16 = v13[13];
    v17 = v13[14];
    *(_OWORD *)v16 = xmmword_24B7234D0;
    *(_OWORD *)(v16 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v16 + 32) = 1065353216;
    *(_OWORD *)v17 = xmmword_24B7234D0;
    *(_OWORD *)(v17 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v17 + 32) = 1065353216;
    v18 = v13[15];
    v19 = v13[16];
    *(_OWORD *)v18 = xmmword_24B7234D0;
    *(_OWORD *)(v18 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v18 + 32) = 1065353216;
    *(_OWORD *)v19 = xmmword_24B7234D0;
    *(_OWORD *)(v19 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v19 + 32) = 1065353216;
    v20 = v13[17];
    *(_OWORD *)v20 = xmmword_24B7234D0;
    *(_OWORD *)(v20 + 16) = xmmword_24B7234D0;
    *(_DWORD *)(v20 + 32) = 1065353216;
  }
  else
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v11, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v11, 0);
    v23 = v10[7] + v10[2] * v10[8];
    v24 = v10[9];
    v25 = (char *)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
    if (a5)
    {
      histEqualization_uint8(BaseAddressOfPlane, BytesPerRowOfPlane, &v25[v23], *((_DWORD *)v10 + 4), *((_DWORD *)v10 + 10), *((_DWORD *)v10 + 12));
      v26 = BytesPerRowOfPlane;
    }
    else
    {
      v26 = BytesPerRowOfPlane;
      copyImage((char *)BaseAddressOfPlane, v10[5], v10[6], BytesPerRowOfPlane, 0, 0, (uint64_t)&v25[v23], v10[2], 0, 0);
    }
    RegistrationEngine_loadTemplateImage(v24, (unsigned __int8 *)BaseAddressOfPlane, v26, v10[19]);
    RegistrationEngine_detectCorners((uint64_t *)v24, v10[19]);
    if ((_DWORD)v6)
    {
      v6 = v6;
      if ((a5 & 1) != 0)
      {
        v36 = v11;
        v27 = v10 + 11;
        while (1)
        {
          v28 = (char *)CVPixelBufferGetBaseAddressOfPlane(*v7, 0);
          histEqualization_uint8(BaseAddressOfPlane, BytesPerRowOfPlane, &v28[v23], *((_DWORD *)v10 + 4), *((_DWORD *)v10 + 10), *((_DWORD *)v10 + 12));
          RegistrationEngine_loadInputImage(v24, (unsigned __int8 *)BaseAddressOfPlane, v26, v10[19]);
          v29 = RegistrationEngine_execute((unsigned __int16 **)v24);
          if ((_DWORD)v29)
            break;
          v30 = *v27++;
          HomographyTransform_get3x3Matrix(*(float **)(v24 + 16), v30, 1, *((float *)v10 + 6));
          ++v7;
          if (!--v6)
          {
            v12 = 0;
            v11 = v36;
            goto LABEL_16;
          }
        }
        v12 = v29;
        v11 = v36;
      }
      else
      {
        v31 = v10 + 11;
        while (1)
        {
          v32 = CVPixelBufferGetBaseAddressOfPlane(*v7, 0);
          copyImage((char *)BaseAddressOfPlane, v10[5], v10[6], v26, 0, 0, (uint64_t)v32 + v23, v10[2], 0, 0);
          RegistrationEngine_loadInputImage(v24, (unsigned __int8 *)BaseAddressOfPlane, v26, v10[19]);
          v33 = RegistrationEngine_execute((unsigned __int16 **)v24);
          if ((_DWORD)v33)
            break;
          v34 = *v31++;
          HomographyTransform_get3x3Matrix(*(float **)(v24 + 16), v34, 1, *((float *)v10 + 6));
          ++v7;
          if (!--v6)
            goto LABEL_15;
        }
        v12 = v33;
      }
      FigDebugAssert3();
    }
    else
    {
LABEL_15:
      v12 = 0;
    }
  }
LABEL_16:
  CVPixelBufferUnlockBaseAddress(v11, 0);
  return v12;
}

uint64_t RegisterWarp(uint64_t a1, CVPixelBufferRef pixelBuffer, CVPixelBufferRef *a3, int a4, int a5, int a6, int *a7)
{
  unint64_t v9;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  _OWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  BOOL v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (!a1)
    return 0xFFFFFFFFLL;
  LODWORD(v9) = a4;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v16 = *(_OWORD **)a1;
  if (*(_OWORD *)*(_QWORD *)a1 != __PAIR128__(HeightOfPlane, WidthOfPlane)
    || *((_QWORD *)v16 + 2) != BytesPerRowOfPlane
    || !*((_QWORD *)v16 + 9))
  {
    *(_QWORD *)v16 = WidthOfPlane;
    *((_QWORD *)v16 + 1) = HeightOfPlane;
    *((float *)v16 + 6) = (float)HeightOfPlane / (float)WidthOfPlane;
    *((_QWORD *)v16 + 2) = BytesPerRowOfPlane;
    if (a7)
    {
      v17 = a7[2];
      v18 = a7[3];
      v19 = *a7;
      v20 = a7[1];
      *((_QWORD *)v16 + 5) = v17;
      *((_QWORD *)v16 + 6) = v18;
      *((_QWORD *)v16 + 7) = v19;
      *((_QWORD *)v16 + 8) = v20;
      if (v17 >= v18)
        v21 = v18;
      else
        v21 = v17;
      if (v21 >= 0x56)
      {
LABEL_10:
        v22 = 0;
        do
        {
          ++v22;
          v23 = v21 > 0xAB;
          v21 >>= 1;
        }
        while (v23);
LABEL_19:
        if (v22 >= 7)
          v25 = 7;
        else
          v25 = v22;
        v26 = v25 != 0;
        *((_DWORD *)v16 + 7) = v26;
        *((_DWORD *)v16 + 8) = v25;
        *((_BYTE *)v16 + 144) = v22 < 2;
        if (RegistrationEngine_init(*((_QWORD *)v16 + 9), WidthOfPlane, HeightOfPlane, v26, v25, v17, v18, v19, v20, 0))
        {
          v24 = 0xFFFFFFFFLL;
LABEL_24:
          FigDebugAssert3();
          return v24;
        }
        v27 = *((_QWORD *)v16 + 10);
        if (v27 && WarpingEngine_init(v27))
        {
          v24 = 4294967294;
          goto LABEL_24;
        }
        goto LABEL_28;
      }
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v17 = WidthOfPlane;
      v18 = HeightOfPlane;
      *((_QWORD *)v16 + 5) = WidthOfPlane;
      *((_QWORD *)v16 + 6) = HeightOfPlane;
      *((_QWORD *)v16 + 7) = 0;
      *((_QWORD *)v16 + 8) = 0;
      if (WidthOfPlane >= HeightOfPlane)
        v21 = HeightOfPlane;
      else
        v21 = WidthOfPlane;
      if (v21 >= 0x56)
        goto LABEL_10;
    }
    v22 = 0;
    goto LABEL_19;
  }
LABEL_28:
  v28 = Reg_execute(a1, pixelBuffer, a3, v9, a5);
  if ((_DWORD)v28)
  {
    v24 = v28;
    FigDebugAssert3();
  }
  else
  {
    if (a6)
    {
      v29 = *(_QWORD *)(*(_QWORD *)a1 + 80);
      if (v29)
      {
        if ((_DWORD)v9)
        {
          v9 = v9;
          v30 = *(_QWORD *)a1 + 80;
          do
          {
            WarpingEngine_execute(v29, *(GLfloat **)(v30 + 8 * v9), a3[v9], a3[v9 - 1], 1);
            v23 = v9-- > 1;
          }
          while (v23);
        }
        glFinish();
      }
    }
    return 0;
  }
  return v24;
}

uint64_t Register(uint64_t a1, __CVBuffer *a2, CVPixelBufferRef *a3, int a4, int a5, int *a6)
{
  return RegisterWarp(a1, a2, a3, a4, a5, 0, a6);
}

__n128 RegWarp_getTransforms(_QWORD *a1, uint64_t *a2, int a3)
{
  int v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;

  if (a3 >= 7)
    v4 = 7;
  else
    v4 = a3;
  if (a3 >= 1)
  {
    v5 = (_QWORD *)*a1;
    v6 = *a2;
    v7 = v5[11];
    result = *(__n128 *)v7;
    v9 = *(_OWORD *)(v7 + 16);
    *(_DWORD *)(v6 + 32) = *(_DWORD *)(v7 + 32);
    *(__n128 *)v6 = result;
    *(_OWORD *)(v6 + 16) = v9;
    if (v4 <= 1)
      v10 = 1;
    else
      v10 = v4;
    if (v4 > 1)
    {
      v11 = a2[1];
      v12 = v5[12];
      result = *(__n128 *)v12;
      v13 = *(_OWORD *)(v12 + 16);
      *(_DWORD *)(v11 + 32) = *(_DWORD *)(v12 + 32);
      *(__n128 *)v11 = result;
      *(_OWORD *)(v11 + 16) = v13;
      if (v10 != 2)
      {
        v14 = a2[2];
        v15 = v5[13];
        result = *(__n128 *)v15;
        v16 = *(_OWORD *)(v15 + 16);
        *(_DWORD *)(v14 + 32) = *(_DWORD *)(v15 + 32);
        *(__n128 *)v14 = result;
        *(_OWORD *)(v14 + 16) = v16;
        if (v10 != 3)
        {
          v17 = a2[3];
          v18 = v5[14];
          result = *(__n128 *)v18;
          v19 = *(_OWORD *)(v18 + 16);
          *(_DWORD *)(v17 + 32) = *(_DWORD *)(v18 + 32);
          *(__n128 *)v17 = result;
          *(_OWORD *)(v17 + 16) = v19;
          if (v10 != 4)
          {
            v20 = a2[4];
            v21 = v5[15];
            result = *(__n128 *)v21;
            v22 = *(_OWORD *)(v21 + 16);
            *(_DWORD *)(v20 + 32) = *(_DWORD *)(v21 + 32);
            *(__n128 *)v20 = result;
            *(_OWORD *)(v20 + 16) = v22;
            if (v10 != 5)
            {
              v23 = a2[5];
              v24 = v5[16];
              result = *(__n128 *)v24;
              v25 = *(_OWORD *)(v24 + 16);
              *(_DWORD *)(v23 + 32) = *(_DWORD *)(v24 + 32);
              *(__n128 *)v23 = result;
              *(_OWORD *)(v23 + 16) = v25;
              if (v10 != 6)
              {
                v26 = a2[6];
                v27 = v5[17];
                result = *(__n128 *)v27;
                v28 = *(_OWORD *)(v27 + 16);
                *(_DWORD *)(v26 + 32) = *(_DWORD *)(v27 + 32);
                *(__n128 *)v26 = result;
                *(_OWORD *)(v26 + 16) = v28;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t createCVPixelBuffers(unsigned int a1, CVPixelBufferRef *a2, OSType a3, int a4, int a5, int a6, int a7)
{
  const __CFAllocator *v14;
  __CFDictionary *Mutable;
  __CFDictionary *v16;
  CFMutableDictionaryRef v17;
  __CFDictionary *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int valuePtr;
  int v29;

  valuePtr = a7;
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v16 = Mutable;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5788], (const void *)*MEMORY[0x24BDBD270]);
    v17 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v17)
    {
      v25 = 0xFFFFFFFFLL;
LABEL_19:
      CFRelease(v16);
      return v25;
    }
    v18 = v17;
    if (a7 >= 1)
    {
      v19 = CFNumberCreate(v14, kCFNumberSInt32Type, &valuePtr);
      if (!v19)
        goto LABEL_16;
      v20 = v19;
      CFDictionaryAddValue(v16, (const void *)*MEMORY[0x24BDC55D0], v19);
      CFRelease(v20);
    }
    if (!a6)
      goto LABEL_9;
    v29 = a6;
    v21 = CFNumberCreate(v14, kCFNumberIntType, &v29);
    if (v21)
    {
      v22 = v21;
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x24BDD8E40], v21);
      CFRelease(v22);
LABEL_9:
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x24BDC5668], v18);
      if (a1)
      {
        v23 = a5;
        v24 = a1 - 1;
        v25 = 0;
        do
        {
          v26 = v24;
          if (CVPixelBufferCreate(v14, a4, v23, a3, v16, a2))
            break;
          v24 = v26 - 1;
          ++a2;
        }
        while (v26);
      }
      else
      {
        v25 = 0;
      }
      goto LABEL_18;
    }
LABEL_16:
    v25 = 0xFFFFFFFFLL;
LABEL_18:
    CFRelease(v18);
    goto LABEL_19;
  }
  return 0xFFFFFFFFLL;
}

uint64_t createYUV420DestCVPixelBuffers(unsigned int a1, CVPixelBufferRef *a2, int a3, int a4, int a5, int a6)
{
  return createCVPixelBuffers(a1, a2, 0x34323066u, a3, a4, a5, a6);
}

CVPixelBufferRef createFloat16CVPixelBufferRef(int a1, int a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  OSType v6;
  CVPixelBufferRef v8;

  v8 = 0;
  if (a3 == 2)
    v4 = 1647522401;
  else
    v4 = 1647392359;
  if (a3 == 4)
    v5 = 1647719521;
  else
    v5 = v4;
  if (a3 == 3)
    v6 = 1647589490;
  else
    v6 = v5;
  createCVPixelBuffers(1u, &v8, v6, a1, a2, 0, a4);
  return v8;
}

CVPixelBufferRef createShortCVPixelBufferRef(int a1, int a2, int a3)
{
  CVPixelBufferRef v4;

  v4 = 0;
  createCVPixelBuffers(1u, &v4, 0x10u, a1, a2, 0, a3);
  return v4;
}

double RigidTransform_constructor()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v0)
  {
    *(_QWORD *)&result = 1065353216;
    *v0 = xmmword_24B7234D0;
    v0[1] = xmmword_24B7234D0;
  }
  return result;
}

double RigidTransform_eye(_OWORD *a1)
{
  double result;

  *(_QWORD *)&result = 1065353216;
  *a1 = xmmword_24B7234D0;
  a1[1] = xmmword_24B7234D0;
  return result;
}

float RigidTransform_deepCopy(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  result = *(float *)(a2 + 28);
  *(float *)(a1 + 28) = result;
  return result;
}

float RigidTransform_setParams(float *a1, float a2, float a3, float a4, float a5)
{
  float v5;
  float v6;
  float result;

  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  v5 = 1.0 / (float)((float)(a2 * a2) + (float)(a3 * a3));
  a1[4] = a2 * v5;
  a1[5] = -(float)(a3 * v5);
  v6 = -(float)((float)((float)(a4 * a2) + (float)(a5 * a3)) * v5);
  result = (float)-(float)((float)(a5 * a2) - (float)(a4 * a3)) * v5;
  a1[6] = v6;
  a1[7] = result;
  return result;
}

float RigidTransform_changeCoordinateSystem(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float result;

  v2 = a2[1];
  v3 = a1[1];
  v4 = -(float)((float)(v3 * v2) - (float)(*a1 * *a2));
  v5 = (float)(v2 * *a1) + (float)(v3 * *a2);
  v6 = a2[4];
  v7 = a2[5];
  v8 = -(float)((float)(v7 * v5) - (float)(v4 * v6));
  v9 = (float)(v7 * v4) + (float)(v5 * v6);
  v10 = a2[6];
  v11 = a2[7];
  v12 = a1[2];
  v13 = a1[3];
  v14 = (float)((float)((float)(v10 * v4) + (float)(v12 * *a2)) + a2[2])
      - (float)((float)(v11 * v5) + (float)(v13 * v2));
  v15 = (float)((float)((float)((float)(v10 * v5) + (float)(v11 * v4)) + (float)(v12 * v2)) + (float)(v13 * *a2))
      + a2[3];
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v14;
  a1[3] = v15;
  v16 = 1.0 / (float)((float)(v8 * v8) + (float)(v9 * v9));
  a1[4] = v8 * v16;
  a1[5] = -(float)(v9 * v16);
  v17 = -(float)((float)((float)(v15 * v9) + (float)(v14 * v8)) * v16);
  result = (float)-(float)((float)(v15 * v8) - (float)(v14 * v9)) * v16;
  a1[6] = v17;
  a1[7] = result;
  return result;
}

float32_t RigidTransform_dirs(float *a1, float32x4_t *a2, float32x4_t *a3, float32x4_t *a4, float32x4_t *a5, unsigned int a6, float32x4_t a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  float *v12;
  BOOL v14;
  BOOL v16;
  BOOL v18;
  BOOL v20;
  BOOL v22;
  BOOL v24;
  const float *v26;
  float32x4_t v27;
  const float *v28;
  float32x4_t v29;
  const float *v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t *v33;
  float32x4_t *v34;
  float32x4_t *v35;
  float32x4_t *v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float *v40;
  __int32 *v41;
  float *v42;
  float *v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;

  if (a6)
  {
    if (a6 < 0xC)
    {
      v7 = 0;
LABEL_53:
      v40 = &a2->f32[v7];
      v41 = &a3->i32[v7];
      v42 = &a4->f32[v7];
      v43 = &a5->f32[v7];
      v44 = a6 - v7;
      do
      {
        v45 = *v42++;
        v46 = v45;
        v47 = a1[2] + (float)(*a1 * v45);
        v48 = *v43++;
        *v40++ = v47 - (float)(a1[1] * v48);
        a7.f32[0] = (float)((float)(a1[1] * v46) + (float)(*a1 * v48)) + a1[3];
        *v41++ = a7.i32[0];
        --v44;
      }
      while (v44);
      return a7.f32[0];
    }
    v7 = 0;
    v8 = (unint64_t)a2->u64 + 4 * a6;
    v9 = (unint64_t)a3->u64 + 4 * a6;
    v10 = &a4->i8[4 * a6];
    v11 = &a5->i8[4 * a6];
    v12 = a1 + 4;
    v14 = v10 > (char *)a2 && v8 > (unint64_t)a4;
    v16 = v11 > (char *)a2 && v8 > (unint64_t)a5;
    v18 = v12 > (float *)a2 && v8 > (unint64_t)a1;
    v20 = v10 > (char *)a3 && v9 > (unint64_t)a4;
    v22 = v11 > (char *)a3 && v9 > (unint64_t)a5;
    v24 = v12 > (float *)a3 && v9 > (unint64_t)a1;
    if (v8 > (unint64_t)a3 && v9 > (unint64_t)a2)
      goto LABEL_53;
    if (v14)
      goto LABEL_53;
    if (v16)
      goto LABEL_53;
    if (v18)
      goto LABEL_53;
    if (v20)
      goto LABEL_53;
    if (v22)
      goto LABEL_53;
    if (v24)
      goto LABEL_53;
    v26 = a1;
    a7 = vld1q_dup_f32(v26++);
    v27 = vld1q_dup_f32(v26);
    v7 = (unsigned __int16)a6 & 0xFFFC;
    v28 = a1 + 2;
    v29 = vld1q_dup_f32(v28);
    v30 = a1 + 3;
    v31 = v7;
    v32 = vld1q_dup_f32(v30);
    v33 = a5;
    v34 = a4;
    v35 = a3;
    v36 = a2;
    do
    {
      v37 = *v34++;
      v38 = v37;
      v39 = *v33++;
      *v36++ = vmlsq_f32(vmlaq_f32(v29, a7, v38), v27, v39);
      *v35++ = vaddq_f32(vmlaq_f32(vmulq_f32(v27, v38), a7, v39), v32);
      v31 -= 4;
    }
    while (v31);
    if (v7 != a6)
      goto LABEL_53;
  }
  return a7.f32[0];
}

float32_t RigidTransform_invs(float *a1, float32x4_t *a2, float32x4_t *a3, float32x4_t *a4, float32x4_t *a5, unsigned int a6, float32x4_t a7)
{
  uint64_t v7;
  uint64_t v8;
  float *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  float *v14;
  BOOL v16;
  BOOL v18;
  BOOL v20;
  BOOL v22;
  BOOL v24;
  BOOL v26;
  const float *v28;
  const float *v29;
  float32x4_t v30;
  const float *v31;
  float32x4_t v32;
  const float *v33;
  uint64_t v34;
  float32x4_t v35;
  float32x4_t *v36;
  float32x4_t *v37;
  float32x4_t *v38;
  float32x4_t *v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float *v43;
  __int32 *v44;
  float *v45;
  float *v46;
  uint64_t v47;
  float v48;
  float v49;
  float v50;
  float v51;

  if (a6)
  {
    v7 = a6;
    if (a6 < 0xC)
    {
      v8 = 0;
LABEL_53:
      v43 = &a2->f32[v8];
      v44 = &a3->i32[v8];
      v45 = &a4->f32[v8];
      v46 = &a5->f32[v8];
      v47 = v7 - v8;
      do
      {
        v48 = *v45++;
        v49 = v48;
        v50 = a1[6] + (float)(a1[4] * v48);
        v51 = *v46++;
        *v43++ = v50 - (float)(a1[5] * v51);
        a7.f32[0] = (float)((float)(a1[5] * v49) + (float)(a1[4] * v51)) + a1[7];
        *v44++ = a7.i32[0];
        --v47;
      }
      while (v47);
      return a7.f32[0];
    }
    v8 = 0;
    v9 = a1 + 4;
    v10 = &a2->i8[4 * a6];
    v11 = &a3->i8[4 * a6];
    v12 = &a4->i8[4 * a6];
    v13 = &a5->i8[4 * a6];
    v14 = a1 + 8;
    v16 = v12 > (char *)a2 && v10 > (char *)a4;
    v18 = v13 > (char *)a2 && v10 > (char *)a5;
    v20 = v14 > (float *)a2 && v9 < (float *)v10;
    v22 = v12 > (char *)a3 && v11 > (char *)a4;
    v24 = v13 > (char *)a3 && v11 > (char *)a5;
    v26 = v14 > (float *)a3 && v9 < (float *)v11;
    if (v10 > (char *)a3 && v11 > (char *)a2)
      goto LABEL_53;
    if (v16)
      goto LABEL_53;
    if (v18)
      goto LABEL_53;
    if (v20)
      goto LABEL_53;
    if (v22)
      goto LABEL_53;
    if (v24)
      goto LABEL_53;
    if (v26)
      goto LABEL_53;
    v28 = a1 + 4;
    a7 = vld1q_dup_f32(v28);
    v29 = a1 + 5;
    v30 = vld1q_dup_f32(v29);
    v8 = (unsigned __int16)v7 & 0xFFFC;
    v31 = a1 + 6;
    v32 = vld1q_dup_f32(v31);
    v33 = a1 + 7;
    v34 = v8;
    v35 = vld1q_dup_f32(v33);
    v36 = a5;
    v37 = a4;
    v38 = a3;
    v39 = a2;
    do
    {
      v40 = *v37++;
      v41 = v40;
      v42 = *v36++;
      *v39++ = vmlsq_f32(vmlaq_f32(v32, a7, v41), v30, v42);
      *v38++ = vaddq_f32(vmlaq_f32(vmulq_f32(v30, v41), a7, v42), v35);
      v34 -= 4;
    }
    while (v34);
    if (v8 != v7)
      goto LABEL_53;
  }
  return a7.f32[0];
}

float RigidTransform_estimate(float *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 *a6, int a7)
{
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float result;
  float v29;
  float v30;
  float v31;
  float v32;

  v8 = 4 * *a6;
  v9 = *(float *)(a4 + v8);
  v10 = *(float *)(a5 + v8);
  v11 = *(float *)(a2 + v8);
  v12 = *(float *)(a3 + v8);
  v13 = (float)(v9 * v9) + (float)(v10 * v10);
  v14 = (float)(v11 * v9) + (float)(v12 * v10);
  v15 = -(float)((float)(v11 * v10) - (float)(v12 * v9));
  if (a7 >= 2)
  {
    v16 = a6 + 1;
    v17 = a7 - 1;
    do
    {
      v18 = *v16++;
      v19 = 4 * v18;
      v20 = *(float *)(a4 + v19);
      v21 = *(float *)(a5 + v19);
      v22 = *(float *)(a2 + v19);
      v23 = *(float *)(a3 + v19);
      v13 = (float)((float)(v20 * v20) + (float)(v21 * v21)) + v13;
      v9 = v9 + v20;
      v10 = v10 + v21;
      v14 = (float)((float)(v22 * v20) + (float)(v23 * v21)) + v14;
      v15 = v15 - (float)((float)(v22 * v21) - (float)(v23 * v20));
      v11 = v11 + v22;
      v12 = v12 + v23;
      --v17;
    }
    while (v17);
  }
  v32 = v12;
  v29 = v14;
  v30 = v15;
  v31 = v11;
  sposv_NEWLAPACK();
  v24 = v29;
  v25 = 0.0;
  if (v29 < 0.95)
    v24 = 1.0;
  else
    v25 = v30;
  *a1 = v24;
  a1[1] = v25;
  a1[2] = v31;
  a1[3] = v32;
  v26 = 1.0 / (float)((float)(v24 * v24) + (float)(v25 * v25));
  a1[4] = v24 * v26;
  a1[5] = -(float)(v25 * v26);
  v27 = -(float)((float)((float)(v31 * v24) + (float)(v32 * v25)) * v26);
  result = (float)-(float)((float)(v32 * v24) - (float)(v31 * v25)) * v26;
  a1[6] = v27;
  a1[7] = result;
  return result;
}

uint64_t RigidTransform_numTestsToDo(int a1, int a2)
{
  return KKNumSamplesToTest_Rigid[((a2 - a1) << 10) / a2];
}

void gl_hdr_fusion::gl_hdr_fusion(gl_hdr_fusion *this)
{
  OpenGLWrapper *v2;

  v2 = GLBase_constructor();
  *(_QWORD *)this = v2;
  if (v2)
  {
    *((_DWORD *)this + 2) = GLBase_CreateProgram(v2, hdr_fusion_vs, hdr_fusion_fs);
    *((_DWORD *)this + 3) = GLBase_CreateProgram(*(_QWORD *)this, hdr_fusion_vs, hdr_fusionRGB_fs);
  }
  else
  {
    *((_DWORD *)this + 2) = -1;
    *((_DWORD *)this + 3) = -1;
  }
}

void gl_hdr_fusion::~gl_hdr_fusion(gl_hdr_fusion *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)this;
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
}

void gl_hdr_fusion::unbind_textures(gl_hdr_fusion *this)
{
  GLBase_DeleteTextures(*(_QWORD *)this);
}

uint64_t gl_hdr_fusion::setup_gl_context(gl_hdr_fusion *this, __CVBuffer *a2, __CVBuffer **a3, float **a4, __CVBuffer *a5, GLfloat a6, GLfloat a7, GLfloat a8, uint64_t a9)
{
  GLuint v9;
  uint64_t v18;
  GLint UniformLocation;
  GLint v20;
  GLint v21;
  GLint v22;
  GLfloat Width;
  size_t Height;
  uint64_t v25;
  GLfloat v26;
  int v27;
  GLfloat v28;
  GLfloat v29;
  GLfloat v30;
  GLfloat v31;
  GLint v32;
  GLint v33;
  GLint v34;
  GLint v35;
  float *v36;
  GLfloat v37;
  int v38;
  GLfloat v39;
  GLfloat v40;
  GLfloat v41;
  GLfloat v42;
  GLint v43;
  GLint v44;
  GLint v45;
  GLint v46;
  GLfloat value;
  int v49;
  int v50;
  int v51;
  uint64_t v52;

  v9 = a9;
  v52 = *MEMORY[0x24BDAC8D0];
  v18 = GLBase_UseProgram(*(_QWORD *)this, a9);
  GLBase_LoadBuffer(*(_QWORD *)this, *a3, 1, "evm_texture_y", 9729, 0, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, a3[1], 2, "ev0_texture_y", 9729, 0, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, a3[2], 3, "evp_texture_y", 9729, 0, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, *a3, 4, "evm_texture_cc", 9729, 1, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, a3[1], 5, "ev0_texture_cc", 9729, 1, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, a3[2], 6, "evp_texture_cc", 9729, 1, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, a5, 7, "table_texture", 9728, 0, v9, 0);
  GLBase_LoadBuffer(*(_QWORD *)this, a2, 0, "output", 9728, 0, v9, 1);
  UniformLocation = glGetUniformLocation(v18, "evp_scale");
  glUniform1f(UniformLocation, a6);
  v20 = glGetUniformLocation(v18, "evm_scale");
  glUniform1f(v20, a7);
  v21 = glGetUniformLocation(v18, "motion_scale");
  glUniform1f(v21, a8);
  v22 = glGetUniformLocation(v18, "u_outSize");
  Width = (float)CVPixelBufferGetWidth(a2);
  Height = CVPixelBufferGetHeight(a2);
  glUniform2f(v22, Width, (float)Height);
  v25 = (uint64_t)*a4;
  CVPixelBufferGetWidthOfPlane(*a3, 0);
  CVPixelBufferGetHeightOfPlane(*a3, 0);
  v26 = *(float *)v25;
  v50 = *(_DWORD *)(v25 + 4);
  v28 = *(float *)(v25 + 8);
  v27 = *(_DWORD *)(v25 + 12);
  value = v26;
  v49 = v27;
  v29 = *(float *)(v25 + 20);
  v51 = *(_DWORD *)(v25 + 16);
  v30 = *(float *)(v25 + 24);
  v31 = *(float *)(v25 + 28);
  v32 = glGetUniformLocation(v18, "A_m");
  glUniformMatrix2fv(v32, 1, 0, &value);
  v33 = glGetUniformLocation(v18, "b_m");
  glUniform2f(v33, v28, v29);
  v34 = glGetUniformLocation(v18, "c_m");
  glUniform2f(v34, v30, v31);
  v35 = glGetUniformLocation(v18, "d_m");
  glUniform1f(v35, 1.0);
  v36 = a4[1];
  CVPixelBufferGetWidthOfPlane(a3[2], 0);
  CVPixelBufferGetHeightOfPlane(a3[2], 0);
  v37 = *v36;
  v50 = *((_DWORD *)v36 + 1);
  v39 = v36[2];
  v38 = *((_DWORD *)v36 + 3);
  value = v37;
  v49 = v38;
  v40 = v36[5];
  v51 = *((_DWORD *)v36 + 4);
  v41 = v36[6];
  v42 = v36[7];
  v43 = glGetUniformLocation(v18, "A_p");
  glUniformMatrix2fv(v43, 1, 0, &value);
  v44 = glGetUniformLocation(v18, "b_p");
  glUniform2f(v44, v39, v40);
  v45 = glGetUniformLocation(v18, "c_p");
  glUniform2f(v45, v41, v42);
  v46 = glGetUniformLocation(v18, "d_p");
  glUniform1f(v46, 1.0);
  return v18;
}

uint64_t gl_hdr_fusion::execute_ycc(GLuint *this, __CVBuffer *a2, __CVBuffer **a3, float **a4, __CVBuffer *a5, GLfloat a6, GLfloat a7, GLfloat a8, GLfloat a9, GLfloat a10)
{
  GLuint v17;
  GLint UniformLocation;
  GLint v19;
  GLint v20;
  GLint v21;
  float v22;
  GLint v23;
  GLuint v24;
  OpenGLWrapper *v25;
  GLsizei Width;
  GLsizei Height;

  v17 = gl_hdr_fusion::setup_gl_context((gl_hdr_fusion *)this, a2, a3, a4, a5, a6, a7, a8, this[2]);
  UniformLocation = glGetUniformLocation(v17, "post_ccm_sat_level");
  glUniform1f(UniformLocation, a9);
  v19 = glGetUniformLocation(v17, "motion_scale_evm");
  glUniform1f(v19, a8 / a7);
  v20 = glGetUniformLocation(v17, "motion_scale");
  glUniform1f(v20, a8 / a6);
  v21 = glGetUniformLocation(v17, "rcp_sat_head_room");
  v22 = 1.0;
  if (a9 < 1.0)
    v22 = 1.0 / (float)(1.0 - a9);
  glUniform1f(v21, v22);
  v23 = glGetUniformLocation(v17, "sat_scale");
  glUniform1f(v23, a10);
  v24 = this[2];
  GLBase_PrepareRendering(*(OpenGLWrapper **)this, v24);
  v25 = *(OpenGLWrapper **)this;
  Width = CVPixelBufferGetWidth(a2);
  Height = CVPixelBufferGetHeight(a2);
  GLBase_RenderProgram((int)v25, v24, 0, 0, Width, Height);
  return 0;
}

uint64_t gl_combineandrender_dispose_glcache()
{
  uint64_t result;

  if (qword_2544D9D48)
  {
    gl_hdr_fusion::~gl_hdr_fusion((gl_hdr_fusion *)qword_2544D9D48);
    MEMORY[0x24BD25DE0]();
    qword_2544D9D48 = 0;
  }
  result = qword_2544D9D50;
  if (qword_2544D9D50)
  {
    gl_bilateral::~gl_bilateral((gl_bilateral *)qword_2544D9D50);
    result = MEMORY[0x24BD25DE0]();
    qword_2544D9D50 = 0;
  }
  return result;
}

uint64_t gl_combineandrender(__CVBuffer *a1, __CVBuffer **a2, float **a3, uint64_t a4, uint64_t a5)
{
  void *BaseAddressOfPlane;
  void *v11;
  size_t Height;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  size_t v16;
  float32x4_t *v17;
  double Current;
  gl_hdr_fusion *v19;
  __CVBuffer *Float16CVPixelBufferRef;
  __CVBuffer *v21;
  char *BaseAddress;
  uint64_t v23;
  float32x4_t *v24;
  const float *f32;
  float32x4_t v26;
  char *v27;
  const float *v28;
  float32x4_t v29;
  const float *v30;
  float32x4_t v31;
  const float *v32;
  float32x4_t v33;
  float v34;
  __CVBuffer *v35;
  char *v36;
  float v37;
  int v38;
  int32x4_t *v39;
  NSObject *v40;
  float v41;
  size_t BytesPerRow;
  char *v43;
  double v44;
  int32x4_t *v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
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
  float *v78;
  uint64_t v79;
  unsigned int v80;
  unint64_t v81;
  uint32x4_t v87;
  unint64_t v88;
  uint64_t v89;
  const __int16 *v90;
  float16x4_t v91;
  uint32x4_t v92;
  __CVBuffer *v93;
  __CVBuffer *v94;
  __CVBuffer *v95;
  gl_bilateral *v96;
  __CVBuffer *v97;
  char *v98;
  uint64_t v99;
  _WORD *v100;
  float *v101;
  float v102;
  double v103;
  const float *v104;
  float32x4_t v105;
  _DWORD *v106;
  const char *v107;
  size_t v108;
  const char *v109;
  size_t v110;
  float v111;
  double v112;
  float v113;
  uint64_t v115;
  int v116;
  unint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  size_t v122;
  size_t BytesPerRowOfPlane;
  float32x4_t *v124;
  uint64_t v125;
  size_t Width;
  __CVBuffer *pixelBuffer;
  dispatch_object_t object;
  size_t block;
  uint64_t v130;
  unint64_t (*v131)(unint64_t, uint64_t);
  void *v132;
  char *v133;
  size_t v134;
  unint64_t v135;
  unint64_t v136;
  int32x4_t *v137;
  int32x4_t *v138;

  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  v11 = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
  Width = CVPixelBufferGetWidth(a2[1]);
  Height = CVPixelBufferGetHeight(a2[1]);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  v122 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
  v13 = (unint64_t)*(double *)(a4 + 184);
  v14 = (unint64_t)*(double *)(a4 + 192);
  v125 = a5;
  if (a5)
  {
    v15 = CVPixelBufferGetBaseAddressOfPlane(a2[1], 0);
    v16 = CVPixelBufferGetBytesPerRowOfPlane(a2[1], 0);
    *(float *)(a5 + 12) = image_key((uint64_t)v15 + (uint64_t)(*(double *)(a4 + 168) + *(double *)(a4 + 176) * (double)v16), v13, v14, v16);
    syslog(4, "HDR: using parametric tone curve.\n");
    v17 = (float32x4_t *)operator new();
    LODWORD(a5) = *(_DWORD *)(a5 + 4) == 0;
  }
  else
  {
    syslog(4, "HDR: using non-parametric tone curve\n");
    v17 = (float32x4_t *)operator new();
  }
  calculateNoiseAndFusingCurves(a4, v17, a5);
  pixelBuffer = createFloat16CVPixelBufferRef(Width, Height, 2, 0);
  if (!pixelBuffer)
  {
    fwrite("Could not create fused image buffer.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
LABEL_47:
    MEMORY[0x24BD25DE0](v17, 0x1000C4027833926);
    return 0;
  }
  v121 = Height;
  v124 = v17;
  Current = CFAbsoluteTimeGetCurrent();
  if (!qword_2544D9D48)
  {
    v19 = (gl_hdr_fusion *)operator new();
    gl_hdr_fusion::gl_hdr_fusion(v19);
    qword_2544D9D48 = (uint64_t)v19;
  }
  v119 = (uint64_t)v11;
  Float16CVPixelBufferRef = createFloat16CVPixelBufferRef(256, 1, 4, 0);
  v120 = (uint64_t)BaseAddressOfPlane;
  if (Float16CVPixelBufferRef)
  {
    v21 = Float16CVPixelBufferRef;
    CVPixelBufferLockBaseAddress(Float16CVPixelBufferRef, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v21);
    v23 = 0;
    v24 = v124;
    do
    {
      f32 = v24[64].f32;
      v26 = vld1q_dup_f32(f32);
      v27 = &BaseAddress[v23 + 6];
      *((_WORD *)v27 - 3) = vcvt_f16_f32(v26).u16[0];
      v28 = v24[192].f32;
      v29 = vld1q_dup_f32(v28);
      *((_WORD *)v27 - 2) = vcvt_f16_f32(v29).u16[0];
      v30 = v24[256].f32;
      v31 = vld1q_dup_f32(v30);
      *((_WORD *)v27 - 1) = vcvt_f16_f32(v31).u16[0];
      v32 = v24[320].f32;
      v33 = vld1q_dup_f32(v32);
      *(_WORD *)v27 = vcvt_f16_f32(v33).u16[0];
      v23 += 8;
      v24 = (float32x4_t *)((char *)v24 + 4);
    }
    while (v23 != 2048);
    v34 = 1.0;
    if ((_DWORD)a5)
      v34 = 0.25;
    v35 = pixelBuffer;
    gl_hdr_fusion::execute_ycc((GLuint *)qword_2544D9D48, pixelBuffer, a2, a3, v21, *(GLfloat *)(a4 + 12), *(GLfloat *)(a4 + 8), *(GLfloat *)(a4 + 56), *(GLfloat *)(a4 + 60), v34);
    CVPixelBufferUnlockBaseAddress(v21, 0);
    CVPixelBufferRelease(v21);
  }
  else
  {
    fwrite("Could not create fusion statistics buffer.", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v35 = pixelBuffer;
  }
  CVPixelBufferLockBaseAddress(v35, 0);
  v36 = (char *)CVPixelBufferGetBaseAddress(v35);
  v37 = CFAbsoluteTimeGetCurrent() - Current;
  *(float *)(a4 + 140) = v37;
  v38 = _MergedGlobals;
  if (!_MergedGlobals)
  {
    block = 4;
    sysctlbyname("hw.ncpu", &_MergedGlobals, &block, 0, 0);
    v38 = (int)fmaxf((float)_MergedGlobals, 1.0);
    _MergedGlobals = v38;
  }
  v39 = (int32x4_t *)operator new[]();
  bzero(v39, 0x400uLL);
  v40 = dispatch_queue_create("hdr queue", MEMORY[0x24BDAC9C0]);
  object = v40;
  if (v125)
    v41 = *(float *)(v125 + 144);
  else
    v41 = 0.12;
  BytesPerRow = CVPixelBufferGetBytesPerRow(v35);
  v43 = &v36[(uint64_t)(*(double *)(a4 + 168) + *(double *)(a4 + 168) + *(double *)(a4 + 176) * (double)BytesPerRow)];
  v44 = CFAbsoluteTimeGetCurrent();
  if (v38 < 2)
  {
    if (v13 && v14)
    {
      v79 = 0;
      v80 = 0;
      v81 = v13 - 8;
      __asm { FMOV            V0.4S, #1.0 }
      v87.i64[0] = 0xFF000000FFLL;
      v87.i64[1] = 0xFF000000FFLL;
      do
      {
        v88 = 4 * v80;
        if (v81 > v88)
        {
          v89 = 16 * v80;
          do
          {
            v90 = (const __int16 *)&v43[v89];
            v91 = (float16x4_t)*(_OWORD *)vld2_s16(v90).val;
            v92 = vminq_u32(vcvtq_n_u32_f32(vmaxq_f32(vminq_f32(vcvtq_f32_f16(v91), _Q0), (float32x4_t)0), 8uLL), v87);
            ++v39->i32[v92.u32[0]];
            ++v39->i32[v92.u32[1]];
            ++v39->i32[v92.u32[2]];
            ++v39->i32[v92.u32[3]];
            v88 += 20;
            v89 += 80;
          }
          while (v81 > v88);
        }
        v80 = (v80 + 7) % 5;
        ++v79;
        v43 += BytesPerRow;
      }
      while (v79 != v14);
      if (HIDWORD(v14))
      {
        v115 = v14;
        do
        {
          if (v80 < v13)
          {
            v116 = 2 * v80;
            v117 = v80;
            do
            {
              _Q0.i16[0] = *(_WORD *)&v43[2 * v116];
              _Q0.i64[0] = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q0.f32, 0)).u64[0];
              _Q0.f32[0] = 255.0 * _Q0.f32[0];
              v118 = (int)_Q0.f32[0];
              if ((int)_Q0.f32[0] >= 255)
                v118 = 255;
              ++v39->i32[v118];
              v117 += 5;
              v116 += 10;
            }
            while (v117 < v13);
          }
          v80 = (v80 + 7) % 5;
          ++v115;
          v43 += BytesPerRow;
        }
        while (v115 != v14);
      }
    }
  }
  else
  {
    v45 = (int32x4_t *)operator new[]();
    bzero(v45, 0x400uLL);
    block = MEMORY[0x24BDAC760];
    v130 = 0x40000000;
    v131 = ___ZL26compute_parallel_histogramPKP16dispatch_queue_sPDhmmmPj_block_invoke;
    v132 = &__block_descriptor_tmp_1;
    v133 = v43;
    v134 = BytesPerRow;
    v135 = v14;
    v136 = v13;
    v137 = v39;
    v138 = v45;
    dispatch_apply(2uLL, v40, &block);
    v46 = vaddq_s32(v39[1], v45[1]);
    *v39 = vaddq_s32(*v39, *v45);
    v39[1] = v46;
    v47 = vaddq_s32(v39[3], v45[3]);
    v39[2] = vaddq_s32(v39[2], v45[2]);
    v39[3] = v47;
    v48 = vaddq_s32(v39[5], v45[5]);
    v39[4] = vaddq_s32(v39[4], v45[4]);
    v39[5] = v48;
    v49 = vaddq_s32(v39[7], v45[7]);
    v39[6] = vaddq_s32(v39[6], v45[6]);
    v39[7] = v49;
    v50 = vaddq_s32(v39[9], v45[9]);
    v39[8] = vaddq_s32(v39[8], v45[8]);
    v39[9] = v50;
    v51 = vaddq_s32(v39[11], v45[11]);
    v39[10] = vaddq_s32(v39[10], v45[10]);
    v39[11] = v51;
    v52 = vaddq_s32(v39[13], v45[13]);
    v39[12] = vaddq_s32(v39[12], v45[12]);
    v39[13] = v52;
    v53 = vaddq_s32(v39[15], v45[15]);
    v39[14] = vaddq_s32(v39[14], v45[14]);
    v39[15] = v53;
    v54 = vaddq_s32(v39[17], v45[17]);
    v39[16] = vaddq_s32(v39[16], v45[16]);
    v39[17] = v54;
    v55 = vaddq_s32(v39[19], v45[19]);
    v39[18] = vaddq_s32(v39[18], v45[18]);
    v39[19] = v55;
    v56 = vaddq_s32(v39[21], v45[21]);
    v39[20] = vaddq_s32(v39[20], v45[20]);
    v39[21] = v56;
    v57 = vaddq_s32(v39[23], v45[23]);
    v39[22] = vaddq_s32(v39[22], v45[22]);
    v39[23] = v57;
    v58 = vaddq_s32(v39[25], v45[25]);
    v39[24] = vaddq_s32(v39[24], v45[24]);
    v39[25] = v58;
    v59 = vaddq_s32(v39[27], v45[27]);
    v39[26] = vaddq_s32(v39[26], v45[26]);
    v39[27] = v59;
    v60 = vaddq_s32(v39[29], v45[29]);
    v39[28] = vaddq_s32(v39[28], v45[28]);
    v39[29] = v60;
    v61 = vaddq_s32(v39[31], v45[31]);
    v39[30] = vaddq_s32(v39[30], v45[30]);
    v39[31] = v61;
    v62 = vaddq_s32(v39[33], v45[33]);
    v39[32] = vaddq_s32(v39[32], v45[32]);
    v39[33] = v62;
    v63 = vaddq_s32(v39[35], v45[35]);
    v39[34] = vaddq_s32(v39[34], v45[34]);
    v39[35] = v63;
    v64 = vaddq_s32(v39[37], v45[37]);
    v39[36] = vaddq_s32(v39[36], v45[36]);
    v39[37] = v64;
    v65 = vaddq_s32(v39[39], v45[39]);
    v39[38] = vaddq_s32(v39[38], v45[38]);
    v39[39] = v65;
    v66 = vaddq_s32(v39[41], v45[41]);
    v39[40] = vaddq_s32(v39[40], v45[40]);
    v39[41] = v66;
    v67 = vaddq_s32(v39[43], v45[43]);
    v39[42] = vaddq_s32(v39[42], v45[42]);
    v39[43] = v67;
    v68 = vaddq_s32(v39[45], v45[45]);
    v39[44] = vaddq_s32(v39[44], v45[44]);
    v39[45] = v68;
    v69 = vaddq_s32(v39[47], v45[47]);
    v39[46] = vaddq_s32(v39[46], v45[46]);
    v39[47] = v69;
    v70 = vaddq_s32(v39[49], v45[49]);
    v39[48] = vaddq_s32(v39[48], v45[48]);
    v39[49] = v70;
    v71 = vaddq_s32(v39[51], v45[51]);
    v39[50] = vaddq_s32(v39[50], v45[50]);
    v39[51] = v71;
    v72 = vaddq_s32(v39[53], v45[53]);
    v39[52] = vaddq_s32(v39[52], v45[52]);
    v39[53] = v72;
    v73 = vaddq_s32(v39[55], v45[55]);
    v39[54] = vaddq_s32(v39[54], v45[54]);
    v39[55] = v73;
    v74 = vaddq_s32(v39[57], v45[57]);
    v39[56] = vaddq_s32(v39[56], v45[56]);
    v39[57] = v74;
    v75 = vaddq_s32(v39[59], v45[59]);
    v39[58] = vaddq_s32(v39[58], v45[58]);
    v39[59] = v75;
    v76 = vaddq_s32(v39[61], v45[61]);
    v39[60] = vaddq_s32(v39[60], v45[60]);
    v39[61] = v76;
    v77 = vaddq_s32(v39[63], v45[63]);
    v39[62] = vaddq_s32(v39[62], v45[62]);
    v39[63] = v77;
    MEMORY[0x24BD25DD4](v45, 0x1000C8052888210);
  }
  v78 = (float *)operator new[]();
  if (v125)
    noiseHistParametricToneCurve(v39->i32, a4, v124, v78, v125);
  else
    noiseHistToneCurve((uint64_t)v39, (float *)a4, v124->f32, v78);
  CVPixelBufferUnlockBaseAddress(a2[1], 0);
  CVPixelBufferUnlockBaseAddress(a2[2], 0);
  v94 = a2[1];
  v93 = a2[2];
  if (qword_2544D9D50)
  {
    v95 = createFloat16CVPixelBufferRef(4096, 1, 2, 0);
    if (!v95)
      goto LABEL_42;
  }
  else
  {
    v96 = (gl_bilateral *)operator new();
    gl_bilateral::gl_bilateral(v96);
    qword_2544D9D50 = (uint64_t)v96;
    v95 = createFloat16CVPixelBufferRef(4096, 1, 2, 0);
    if (!v95)
    {
LABEL_42:
      v106 = (_DWORD *)qword_2544D9D50;
      *(_DWORD *)(a4 + 152) = *(_DWORD *)(qword_2544D9D50 + 64);
      *(_DWORD *)(a4 + 156) = v106[17];
      *(_DWORD *)(a4 + 160) = v106[18];
      *(_DWORD *)(a4 + 164) = v106[19];
      CVPixelBufferLockBaseAddress(a2[1], 0);
      v107 = (const char *)CVPixelBufferGetBaseAddressOfPlane(a2[1], 0);
      v108 = CVPixelBufferGetBytesPerRowOfPlane(a2[1], 0);
      convert_422_to_420<unsigned char>(&object, v120, v119, Width >> 1, v121, BytesPerRowOfPlane, v122, v107, v108);
      CVPixelBufferLockBaseAddress(a2[2], 0);
      v109 = (const char *)CVPixelBufferGetBaseAddressOfPlane(a2[2], 0);
      v110 = CVPixelBufferGetBytesPerRowOfPlane(a2[2], 0);
      convert_422_to_420<unsigned char>(&object, v120 + (Width >> 1), v119 + (Width >> 1), Width >> 1, v121, BytesPerRowOfPlane, v122, v109, v110);
      v111 = CFAbsoluteTimeGetCurrent() - v44;
      *(float *)(a4 + 144) = v111;
      v112 = CFAbsoluteTimeGetCurrent();
      v113 = CFAbsoluteTimeGetCurrent() - v112;
      *(float *)(a4 + 148) = v113;
      if (qword_2544D9D48)
        gl_hdr_fusion::unbind_textures((gl_hdr_fusion *)qword_2544D9D48);
      if (qword_2544D9D50)
        gl_hdr_fusion::unbind_textures((gl_hdr_fusion *)qword_2544D9D50);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      CVPixelBufferRelease(pixelBuffer);
      MEMORY[0x24BD25DD4](v78, 0x1000C8052888210);
      MEMORY[0x24BD25DD4](v39, 0x1000C8052888210);
      dispatch_release(object);
      v17 = v124;
      goto LABEL_47;
    }
  }
  v97 = v95;
  CVPixelBufferLockBaseAddress(v95, 0);
  v98 = (char *)CVPixelBufferGetBaseAddress(v97);
  v99 = 0;
  v100 = v98 + 2;
  v101 = v78;
  do
  {
    v102 = *v101++;
    v103 = v102 * 0.00392156863;
    *(float *)&v103 = v103;
    *(v100 - 1) = vcvt_f16_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v103, 0)).u16[0];
    v104 = &v124[128].f32[v99 / 0xFFF];
    v105 = vld1q_dup_f32(v104);
    *v100 = vcvt_f16_f32(v105).u16[0];
    v99 += 255;
    v100 += 2;
  }
  while (v99 != 1044480);
  gl_bilateral::create_grid<2>(qword_2544D9D50, &object, pixelBuffer, 64.0, v41);
  if (*(_QWORD *)(qword_2544D9D50 + 48) && *(_QWORD *)(qword_2544D9D50 + 56))
  {
    gl_bilateral::blur_grid((gl_bilateral *)qword_2544D9D50);
    gl_bilateral::normalize_grid((gl_bilateral *)qword_2544D9D50);
    LODWORD(block) = 843264056;
    HIDWORD(block) = CVPixelBufferGetWidth(v94) >> 1;
    LODWORD(v130) = CVPixelBufferGetHeight(v94);
    gl_bilateral::tone_mapping(qword_2544D9D50, v94, 1, (signed int *)&block, pixelBuffer, v97, 64.0, v41);
    gl_bilateral::tone_mapping(qword_2544D9D50, v93, 2, (signed int *)&block, pixelBuffer, v97, 64.0, v41);
    CVPixelBufferUnlockBaseAddress(v97, 0);
    CVPixelBufferRelease(v97);
    goto LABEL_42;
  }
  CFRelease(pixelBuffer);
  return 0xFFFFFFFFLL;
}

void sub_24B71D754(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD25DE0](v1, 0x10A0C40C1011A9DLL);
  _Unwind_Resume(a1);
}

void sub_24B71D778(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD25DE0](v1, 0x1020C40EDED9539);
  _Unwind_Resume(a1);
}

void convert_422_to_420<unsigned char>(NSObject **a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const char *a8, uint64_t a9)
{
  NSObject *v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  unsigned __int128 v25;
  uint64_t v26;
  int v27;
  const char *v28;
  int v29;
  _QWORD block[12];
  int v31;
  int v32;
  int v33;
  size_t v34;
  int8x16x2_t v35;

  if (_MergedGlobals)
  {
    if (_MergedGlobals >= 2)
    {
LABEL_3:
      v17 = *a1;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___ZL18convert_422_to_420IhEvPKP16dispatch_queue_sPhS4_mmmmPKT_m_block_invoke;
      block[3] = &__block_descriptor_tmp_7_0;
      block[4] = a2;
      block[5] = a3;
      v31 = (unint64_t)(a6 * a5) >> 1;
      v32 = (unint64_t)(a7 * a5) >> 2;
      block[6] = a4;
      block[7] = a5;
      block[8] = a6;
      block[9] = a7;
      v33 = (unint64_t)(a9 * a5) >> 1;
      block[10] = a8;
      block[11] = a9;
      dispatch_apply(2uLL, v17, block);
      return;
    }
  }
  else
  {
    v34 = 4;
    sysctlbyname("hw.ncpu", &_MergedGlobals, &v34, 0, 0);
    _MergedGlobals = (int)fmaxf((float)_MergedGlobals, 1.0);
    if (_MergedGlobals >= 2)
      goto LABEL_3;
  }
  if (a5)
  {
    v18 = 0;
    v19 = 0;
    v20 = a4 - 16;
    v21 = a8;
    do
    {
      v22 = a3 + a7 * (v19 >> 1);
      v23 = 0;
      v24 = v21;
      if ((v19 & 1) != 0)
      {
        do
        {
          v25 = (unsigned __int128)vld2q_s8(v24);
          v24 += 32;
          *(_OWORD *)(a2 + v23) = v25;
          v23 += 16;
        }
        while (v20 >= v23);
      }
      else
      {
        do
        {
          v35 = vld2q_s8(v24);
          v24 += 32;
          *(int8x16_t *)(a2 + v23) = v35.val[0];
          *(int8x16_t *)(v22 + v23) = v35.val[1];
          v23 += 16;
        }
        while (v20 >= v23);
      }
      v26 = v23;
      if (v23 < a4)
      {
        if ((v19 & 1) != 0)
        {
          v29 = v18 + 2 * v23;
          do
          {
            *(_BYTE *)(a2 + v26++) = a8[v29];
            v29 += 2;
          }
          while (a4 != v26);
        }
        else
        {
          v27 = v18 + 2 * v23;
          do
          {
            v28 = &a8[v27];
            *(_BYTE *)(a2 + v26) = *v28;
            *(_BYTE *)(v22 + v26++) = v28[1];
            v27 += 2;
          }
          while (a4 != v26);
        }
      }
      ++v19;
      v21 += a9;
      a2 += a6;
      v18 += a9;
    }
    while (v19 != a5);
  }
}

unint64_t ___ZL26compute_parallel_histogramPKP16dispatch_queue_sPDhmmmPj_block_invoke(unint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint32x4_t v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  const __int16 *v21;
  float16x4_t v22;
  uint32x4_t v23;
  unint64_t v24;
  unsigned int v25;
  int v26;
  unint64_t v27;
  int v28;

  v3 = *(_QWORD *)(result + 48);
  v2 = *(_QWORD *)(result + 56);
  v4 = 72;
  if (!a2)
    v4 = 64;
  if (v3 >= 2 && v2 != 0)
  {
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)(result + v4);
    v9 = v3 >> 1;
    v10 = *(_QWORD *)(result + 40);
    v11 = *(_QWORD *)(result + 32) + v10 * a2 * (v3 >> 1);
    v12 = v2 - 8;
    __asm { FMOV            V0.4S, #1.0 }
    v17.i64[0] = 0xFF000000FFLL;
    v17.i64[1] = 0xFF000000FFLL;
    do
    {
      v19 = 4 * v7;
      if (v12 > v19)
      {
        v20 = 16 * v7;
        do
        {
          v21 = (const __int16 *)(v11 + v20);
          v22 = (float16x4_t)*(_OWORD *)vld2_s16(v21).val;
          v23 = vminq_u32(vcvtq_n_u32_f32(vmaxq_f32(vminq_f32(vcvtq_f32_f16(v22), _Q0), (float32x4_t)0), 8uLL), v17);
          ++*(_DWORD *)(v8 + 4 * v23.u32[0]);
          ++*(_DWORD *)(v8 + 4 * v23.u32[1]);
          ++*(_DWORD *)(v8 + 4 * v23.u32[2]);
          ++*(_DWORD *)(v8 + 4 * v23.u32[3]);
          v19 += 20;
          v20 += 80;
        }
        while (v12 > v19);
      }
      v18 = v7 + 7;
      result = 5 * (v18 / 5);
      v7 = v18 % 5;
      ++v6;
      v11 += v10;
    }
    while (v6 != v9);
    if (v3 >> 33)
    {
      v24 = (v3 >> 1);
      do
      {
        if (v2 > v7)
        {
          v26 = 2 * v7;
          v27 = v7;
          do
          {
            _Q0.i16[0] = *(_WORD *)(v11 + 2 * v26);
            _Q0.i64[0] = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q0.f32, 0)).u64[0];
            _Q0.f32[0] = 255.0 * _Q0.f32[0];
            v28 = (int)_Q0.f32[0];
            if ((int)_Q0.f32[0] >= 255)
              v28 = 255;
            ++*(_DWORD *)(v8 + 4 * v28);
            v27 += 5;
            v26 += 10;
          }
          while (v27 < v2);
        }
        v25 = v7 + 7;
        result = 5 * (v25 / 5);
        v7 = v25 % 5;
        ++v24;
        v11 += v10;
      }
      while (v24 < v9);
    }
  }
  return result;
}

uint64_t ___ZL18convert_422_to_420IhEvPKP16dispatch_queue_sPhS4_mmmmPKT_m_block_invoke(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  const char *v18;
  unsigned __int128 v19;
  uint64_t v20;
  int v21;
  const char *v22;
  int v23;
  int8x16x2_t v24;

  v2 = *(_QWORD *)(result + 56);
  if (v2 >= 2)
  {
    v3 = 0;
    v4 = 0;
    v5 = *(_QWORD *)(result + 32) + *(int *)(result + 96) * a2;
    v6 = *(_QWORD *)(result + 48);
    v7 = v2 >> 1;
    v8 = *(_QWORD *)(result + 88);
    v9 = (const char *)(*(_QWORD *)(result + 80) + *(int *)(result + 104) * a2);
    v10 = *(_QWORD *)(result + 64);
    v11 = *(_QWORD *)(result + 72);
    v12 = v6 - 16;
    result = *(_QWORD *)(result + 40) + *(int *)(result + 100) * a2;
    v13 = v9;
    do
    {
      v14 = result + v11 * (v4 >> 1);
      if ((v4 & 1) != 0)
      {
        v16 = 0;
        v18 = v13;
        do
        {
          v19 = (unsigned __int128)vld2q_s8(v18);
          v18 += 32;
          *(_OWORD *)(v5 + v16) = v19;
          v16 += 16;
        }
        while (v12 >= v16);
      }
      else
      {
        v15 = 0;
        v16 = 0;
        do
        {
          v17 = &v13[v15];
          v24 = vld2q_s8(v17);
          *(int8x16_t *)(v5 + v16) = v24.val[0];
          *(int8x16_t *)(v14 + v16) = v24.val[1];
          v16 += 16;
          v15 += 32;
        }
        while (v12 >= v16);
      }
      v20 = v16;
      if (v16 < v6)
      {
        if ((v4 & 1) != 0)
        {
          v23 = v3 + 2 * v16;
          do
          {
            *(_BYTE *)(v5 + v20++) = v9[v23];
            v23 += 2;
          }
          while (v6 != v20);
        }
        else
        {
          v21 = v3 + 2 * v16;
          do
          {
            v22 = &v9[v21];
            *(_BYTE *)(v5 + v20) = *v22;
            *(_BYTE *)(v14 + v20++) = v22[1];
            v21 += 2;
          }
          while (v6 != v20);
        }
      }
      ++v4;
      v13 += v8;
      v5 += v10;
      v3 += v8;
    }
    while (v4 != v7);
  }
  return result;
}

GLuint *WarpingEngine_constructor(uint64_t a1)
{
  uint64_t v1;
  GLuint *v3;
  GLuint *v4;
  GLuint Shader;
  GLuint v6;
  GLuint v7;
  GLuint v8;
  GLuint Program;
  GLuint v10;
  uint64_t Error;
  uint64_t v13;
  GLint v14;
  GLint params;

  v14 = 0;
  v3 = (GLuint *)malloc_type_calloc(1uLL, 0x68uLL, 0x10800409BFD8778uLL);
  v4 = v3;
  if (!v3)
    goto LABEL_17;
  *(_QWORD *)v3 = a1;
  Shader = gl_UtilsCreateShader(0x8B31u, "attribute vec2 position;\n"
             "varying   vec2 v_texCoord;\n"
             "uniform mat2 A;\n"
             "uniform vec2 b;\n"
             "uniform vec2 c;\n"
             "uniform float d;\n"
             "void main() { \n"
             "   vec2 t = 0.5 * (position + 1.0);\n"
             "   v_texCoord  = A*t + b;\n"
             "   gl_Position = vec4(position.x, position.y, 0.0, 1.0);\n"
             "} \n");
  if (!Shader)
  {
    fig_log_get_emitter();
    v13 = v1;
    FigDebugAssert3();
LABEL_15:
    v4[2] = 0;
LABEL_16:
    NSLog(CFSTR("%s : GL warping program failed to compile/link\n"), "WarpingEngine_constructor", v13);
    goto LABEL_17;
  }
  v6 = Shader;
  v7 = gl_UtilsCreateShader(0x8B30u, "precision highp float;\n"
         "varying   vec2 v_texCoord;\n"
         "uniform sampler2D texture; \n"
         "void main() { \n"
         "   gl_FragColor = texture2D( texture, v_texCoord);\n"
         "} \n");
  if (!v7)
  {
    fig_log_get_emitter();
    v13 = v1;
    FigDebugAssert3();
    glDeleteShader(v6);
    goto LABEL_15;
  }
  v8 = v7;
  params = 0;
  Program = glCreateProgram();
  v10 = Program;
  if (!Program)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    glDeleteShader(v6);
    glDeleteShader(v8);
    v4[2] = 0;
    NSLog(CFSTR("%s : GL warping program failed to compile/link\n"), "WarpingEngine_constructor", v1);
    goto LABEL_17;
  }
  glAttachShader(Program, v6);
  glAttachShader(v10, v8);
  glLinkProgram(v10);
  glGetProgramiv(v10, 0x8B82u, &params);
  if (!params)
  {
    glDeleteProgram(v10);
    v10 = 0;
  }
  glDeleteShader(v6);
  glDeleteShader(v8);
  v4[2] = v10;
  if (!v10)
    goto LABEL_16;
  glBindAttribLocation(v10, 1u, "position");
  glLinkProgram(v4[2]);
  glGetProgramiv(v4[2], 0x8B82u, &v14);
  if (!v14)
  {
    NSLog(CFSTR("Binding vertext position attribute caused relinking failure in WarpingEngine!"));
    goto LABEL_17;
  }
  glUseProgram(v4[2]);
  v4[3] = glGetUniformLocation(v4[2], "A");
  v4[4] = glGetUniformLocation(v4[2], "b");
  v4[5] = glGetUniformLocation(v4[2], "c");
  v4[6] = glGetUniformLocation(v4[2], "d");
  v4[7] = glGetUniformLocation(v4[2], "texture");
  glGenFramebuffers(1, v4 + 24);
  glGenTextures(4, v4 + 8);
  glGenTextures(4, v4 + 12);
  glGenTextures(4, v4 + 16);
  glGenTextures(4, v4 + 20);
  glBindFramebuffer(0x8D40u, v4[24]);
  Error = glGetError();
  if ((_DWORD)Error)
  {
    NSLog(CFSTR("%s : glGetError returned 0x%04x\n"), "WarpingEngine_constructor", Error);
LABEL_17:
    WarpingEngine_destructor(v4);
    return 0;
  }
  glUseProgram(0);
  glBindFramebuffer(0x8D40u, 0);
  return v4;
}

void WarpingEngine_destructor(void *a1)
{
  if (a1)
  {
    glDeleteProgram(*((_DWORD *)a1 + 2));
    glDeleteFramebuffers(1, (const GLuint *)a1 + 24);
    glDeleteTextures(4, (const GLuint *)a1 + 8);
    glDeleteTextures(4, (const GLuint *)a1 + 12);
    glDeleteTextures(4, (const GLuint *)a1 + 16);
    glDeleteTextures(4, (const GLuint *)a1 + 20);
    *((_QWORD *)a1 + 12) = 0;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    free(a1);
  }
}

uint64_t WarpingEngine_init(uint64_t a1)
{
  if (a1)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t WarpingEngine_execute(uint64_t a1, GLfloat *a2, CVPixelBufferRef pixelBuffer, __CVBuffer *a4, int a5)
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v13;
  IOSurfaceRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  GLfloat v20;
  uint64_t v21;
  GLfloat v22;
  GLfloat v23;
  GLfloat v24;
  GLfloat v25;
  GLfloat v26;
  GLfloat v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t Error;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  GLfloat value[4];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  WarpingEngine_execute_textureUnitIndex = ((_BYTE)WarpingEngine_execute_textureUnitIndex + 1) & 3;
  IOSurface = CVPixelBufferGetIOSurface(a4);
  v13 = CVPixelBufferGetIOSurface(pixelBuffer);
  if (!IOSurface || (v14 = v13) == 0)
  {
    NSLog(CFSTR("%s: Couldn't get source or dest IOSurface\n"), "WarpingEngine_execute");
    goto LABEL_32;
  }
  glUseProgram(*(_DWORD *)(a1 + 8));
  v15 = 1;
  if (a5)
    v16 = 1;
  else
    v16 = 3;
  v17 = 2;
  if (a5)
    v18 = 2;
  else
    v18 = 6;
  if (a5)
    v15 = 3;
  v19 = 5;
  v20 = a2[v18];
  if (a5)
    v21 = 5;
  else
    v21 = 7;
  if (a5)
  {
    v17 = 6;
    v19 = 7;
  }
  v22 = a2[4];
  v23 = a2[v15];
  v24 = a2[v16];
  value[0] = *a2;
  value[1] = v23;
  v25 = a2[v17];
  value[2] = v24;
  value[3] = v22;
  v26 = a2[v19];
  v27 = a2[v21];
  v28 = 1;
  glUniformMatrix2fv(*(_DWORD *)(a1 + 12), 1, 0, value);
  glUniform2f(*(_DWORD *)(a1 + 16), v20, v27);
  glUniform2f(*(_DWORD *)(a1 + 20), v25, v26);
  glUniform1f(*(_DWORD *)(a1 + 24), 1.0);
  glVertexAttribPointer(1u, 2, 0x1406u, 0, 0, &WarpingEngine_execute_verts);
  glEnableVertexAttribArray(1u);
  glBindFramebuffer(0x8D40u, *(_DWORD *)(a1 + 96));
  glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33992);
  glBindTexture(0xDE1u, *(_DWORD *)(a1 + 4 * WarpingEngine_execute_textureUnitIndex + 64));
  BYTE4(v38) = 0;
  LODWORD(v38) = 0;
  if ((objc_msgSend(*(id *)a1, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v14, 3553, 33321, WidthOfPlane, HeightOfPlane, 6403, 5121, v38) & 1) != 0)
  {
    glTexParameterf(0xDE1u, 0x2800u, 9729.0);
    glTexParameterf(0xDE1u, 0x2801u, 9729.0);
    glTexParameterf(0xDE1u, 0x2802u, 33071.0);
    glTexParameterf(0xDE1u, 0x2803u, 33071.0);
    glFramebufferTexture2D(0x8D40u, 0x8CE0u, 0xDE1u, *(_DWORD *)(a1 + 4 * WarpingEngine_execute_textureUnitIndex + 64), 0);
    v29 = glCheckFramebufferStatus(0x8D40u);
    if ((_DWORD)v29 != 36053)
    {
      NSLog(CFSTR("%s : Framebuffer Y not complete (status 0x%04x)\n"), "WarpingEngine_execute", v29);
      goto LABEL_32;
    }
    glUniform1i(*(_DWORD *)(a1 + 28), WarpingEngine_execute_textureUnitIndex);
    glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33984);
    glBindTexture(0xDE1u, *(_DWORD *)(a1 + 4 * WarpingEngine_execute_textureUnitIndex + 32));
    BYTE4(v39) = 0;
    LODWORD(v39) = 0;
    if ((objc_msgSend(*(id *)a1, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", IOSurface, 3553, 33321, WidthOfPlane, HeightOfPlane, 6403, 5121, v39) & 1) != 0)
    {
      glTexParameterf(0xDE1u, 0x2800u, 9729.0);
      glTexParameterf(0xDE1u, 0x2801u, 9729.0);
      glTexParameterf(0xDE1u, 0x2802u, 33071.0);
      glTexParameterf(0xDE1u, 0x2803u, 33071.0);
      glViewport(0, 0, WidthOfPlane, HeightOfPlane);
      glDrawArrays(5u, 0, 4);
      glFlush();
      glBindFramebuffer(0x8D40u, *(_DWORD *)(a1 + 96));
      glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33996);
      glBindTexture(0xDE1u, *(_DWORD *)(a1 + 4 * WarpingEngine_execute_textureUnitIndex + 80));
      v30 = (WidthOfPlane & 0x80000000) == 0 ? WidthOfPlane : (int)WidthOfPlane + 1;
      v31 = (v30 >> 1);
      v32 = (HeightOfPlane & 0x80000000) == 0 ? HeightOfPlane : (int)HeightOfPlane + 1;
      v33 = (v32 >> 1);
      BYTE4(v40) = 0;
      LODWORD(v40) = 1;
      if ((objc_msgSend(*(id *)a1, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v14, 3553, 33323, v31, v33, 33319, 5121, v40) & 1) != 0)
      {
        glTexParameterf(0xDE1u, 0x2800u, 9729.0);
        glTexParameterf(0xDE1u, 0x2801u, 9729.0);
        glTexParameterf(0xDE1u, 0x2802u, 33071.0);
        glTexParameterf(0xDE1u, 0x2803u, 33071.0);
        glFramebufferTexture2D(0x8D40u, 0x8CE0u, 0xDE1u, *(_DWORD *)(a1 + 4 * WarpingEngine_execute_textureUnitIndex + 80), 0);
        v34 = glCheckFramebufferStatus(0x8D40u);
        if ((_DWORD)v34 == 36053)
        {
          glUniform1i(*(_DWORD *)(a1 + 28), WarpingEngine_execute_textureUnitIndex + 4);
          glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33988);
          glBindTexture(0xDE1u, *(_DWORD *)(a1 + 4 * WarpingEngine_execute_textureUnitIndex + 48));
          BYTE4(v41) = 0;
          LODWORD(v41) = 1;
          v35 = objc_msgSend(*(id *)a1, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", IOSurface, 3553, 33323, v31, v33, 33319, 5121, v41);
          v28 = v35 ^ 1u;
          if ((v35 & 1) != 0)
          {
            setTextureMode();
            glViewport(0, 0, v31, v33);
            glDrawArrays(5u, 0, 4);
            glFlush();
            goto LABEL_33;
          }
          goto LABEL_36;
        }
        NSLog(CFSTR("%s : Framebuffer UV not complete (status 0x%04x)\n"), "WarpingEngine_execute", v34);
LABEL_32:
        v28 = 0xFFFFFFFFLL;
        goto LABEL_33;
      }
    }
  }
LABEL_36:
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_33:
  glVertexAttribPointer(1u, 2, 0x1406u, 0, 0, 0);
  glDisableVertexAttribArray(1u);
  glBindFramebuffer(0x8D40u, 0);
  glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33992);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33984);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33996);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(WarpingEngine_execute_textureUnitIndex + 33988);
  glBindTexture(0xDE1u, 0);
  glUseProgram(0);
  Error = glGetError();
  if ((_DWORD)Error)
  {
    NSLog(CFSTR("%s : glGetError returned 0x%04x\n"), "WarpingEngine_execute", Error);
    return 0xFFFFFFFFLL;
  }
  return v28;
}

void setTextureMode()
{
  glTexParameterf(0xDE1u, 0x2800u, 9729.0);
  glTexParameterf(0xDE1u, 0x2801u, 9729.0);
  glTexParameterf(0xDE1u, 0x2802u, 33071.0);
  glTexParameterf(0xDE1u, 0x2803u, 33071.0);
}

uint64_t gl_UtilsCreateShader(GLenum a1, GLchar *a2)
{
  uint64_t Shader;
  uint64_t v3;
  GLint params;
  GLchar *string;

  string = a2;
  Shader = glCreateShader(a1);
  v3 = Shader;
  if ((_DWORD)Shader)
  {
    params = 0;
    glShaderSource(Shader, 1, (const GLchar *const *)&string, 0);
    glCompileShader(v3);
    glGetShaderiv(v3, 0x8B81u, &params);
    if (params)
    {
      return v3;
    }
    else
    {
      glDeleteShader(v3);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v3;
  }
}

void gl_bilateral::gl_bilateral(gl_bilateral *this)
{
  OpenGLWrapper *v2;

  v2 = GLBase_constructor();
  *(_QWORD *)this = v2;
  if (v2)
  {
    *((_DWORD *)this + 2) = GLBase_CreateProgram(v2, bilateral_upsample_vs, bilateral_upsample_fs);
    *((_DWORD *)this + 3) = GLBase_CreateProgram(*(_QWORD *)this, bilateral_upsample_vs, bilateral_tone_mapping_fs);
  }
  else
  {
    *((_DWORD *)this + 2) = -1;
    *((_DWORD *)this + 3) = -1;
  }
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
}

void gl_bilateral::~gl_bilateral(gl_bilateral *this)
{
  void ***v2;
  void ***v3;
  signed int v4;
  signed int v5;

  v2 = (void ***)*((_QWORD *)this + 6);
  if (v2)
  {
    free(**v2);
    free(*v2);
    free(v2);
  }
  v3 = (void ***)*((_QWORD *)this + 7);
  if (v3)
  {
    free(**v3);
    free(*v3);
    free(v3);
  }
  v4 = *((_DWORD *)this + 2);
  if (v4 >= 1)
    OpenGLWrapper::deleteProgram(*(OpenGLWrapper **)this, v4);
  v5 = *((_DWORD *)this + 3);
  if (v5 >= 1)
    OpenGLWrapper::deleteProgram(*(OpenGLWrapper **)this, v5);
  if (*(_QWORD *)this)
    (*(void (**)(_QWORD))(**(_QWORD **)this + 8))(*(_QWORD *)this);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

float gl_bilateral::blur_grid(gl_bilateral *this)
{
  double Current;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t **v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void **v11;
  void **v12;
  void ***v13;
  float32x4_t ***v14;
  float32x4_t ***v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  float32x4_t *v21;
  unint64_t v22;
  int v23;
  float32x4_t *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  float32x4_t *v31;
  float32x4_t *v32;
  unint64_t v33;
  char *v34;
  float32x4_t *v35;
  char *v36;
  uint64_t v37;
  int v38;
  float *v39;
  __int8 *v40;
  float32x4_t *v41;
  float32x4_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  float32x4_t *v51;
  float32x4_t *v52;
  uint64_t v53;
  float *v54;
  float *v55;
  float *v56;
  float *v57;
  float *v58;
  float *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  float *v64;
  float *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  BOOL v74;
  BOOL v76;
  BOOL v78;
  BOOL v80;
  BOOL v81;
  uint64_t v82;
  float32x4_t *v83;
  float32x4_t *v84;
  unint64_t v85;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  BOOL v98;
  BOOL v100;
  BOOL v102;
  BOOL v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  float32x4_t *v108;
  float32x4_t *v109;
  char *v110;
  uint64_t v112;
  uint64_t v125;
  uint64_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  int v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float32x4_t *v145;
  float32x4_t *v146;
  float32x4_t *v147;
  float32x4_t *v148;
  float *v149;
  float *v150;
  float *v151;
  float *v152;
  float *v153;
  float *v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  float *v159;
  float *v160;
  uint64_t v162;
  float32x4_t v163;
  float32x4_t v164;
  float32x4_t v165;
  float32x4_t v166;
  float32x4_t v167;
  float32x4_t v168;
  int v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  char *v183;
  float32x4_t *v184;
  float32x4_t *v185;
  uint64_t v186;
  float *v187;
  float *v188;
  float *v189;
  float *v190;
  float *v191;
  float *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  int v198;
  uint64_t v199;
  float *v200;
  float *v201;
  uint64_t v203;
  float32x4_t v204;
  float32x4_t v205;
  float32x4_t v206;
  float32x4_t v207;
  float32x4_t v208;
  float32x4_t v209;
  int v210;
  float v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  float v220;
  float32x4_t *v221;
  float32x4_t *v222;
  char *v223;
  float *v224;
  float *v225;
  float *v226;
  float *v227;
  float *v228;
  float *v229;
  uint64_t v230;
  uint64_t v231;
  unint64_t v232;
  int v233;
  uint64_t v234;
  float *v235;
  float *v236;
  float *v237;
  float *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  uint64_t v244;
  int v245;
  float v246;
  float v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float result;
  uint64_t v257;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *((_DWORD *)this + 8);
  v4 = *((_DWORD *)this + 9);
  v5 = *((_DWORD *)this + 10);
  v6 = v4 * v3 * v5;
  v7 = (uint64_t **)*((_QWORD *)this + 6);
  v8 = **v7;
  v9 = (unint64_t)((*v7)[1] - v8) >> 2;
  v10 = (unint64_t)(*v7[1] - v8) >> 2;
  v11 = array3D(v3, v4, v5);
  v12 = array3D(*((_DWORD *)this + 8), *((_DWORD *)this + 9), *((_DWORD *)this + 10));
  v13 = (void ***)v12;
  v15 = (float32x4_t ***)*((_QWORD *)this + 6);
  v14 = (float32x4_t ***)*((_QWORD *)this + 7);
  v16 = (v6 - 2);
  if ((int)v16 < 1)
    goto LABEL_12;
  *((_QWORD *)this + 6) = v11;
  *((_QWORD *)this + 7) = v12;
  v17 = *(_QWORD *)*v11;
  v18 = *(_QWORD *)*v12;
  v19 = (unint64_t)**v15;
  v20 = (unint64_t)**v14;
  v21 = (float32x4_t *)(v19 + 8);
  v22 = v20 + 8;
  if (v16 < 8)
  {
    v23 = 1;
LABEL_4:
    v24 = **v14;
    v25 = (char *)(v19 + 8);
    v26 = (char *)**v13;
    v27 = *(_QWORD *)*v11;
LABEL_5:
    v28 = 0;
    v29 = ~v23 + v6;
    do
    {
      v30 = 4 * v28;
      *(float *)(v27 + 4 + v30) = (float)((float)(*(float *)(v19 + 4 + 4 * v28) + *(float *)(v19 + 4 + 4 * v28))
                                        + (float)(*(float *)&v25[4 * v28] + *(float *)(v19 + 4 * v28)))
                                * 0.25;
      *(float *)&v26[v30 + 4] = (float)((float)(v24->f32[v28 + 1] + v24->f32[v28 + 1])
                                      + (float)(*(float *)(v22 + 4 * v28) + v24->f32[v28]))
                              * 0.25;
      ++v28;
    }
    while (v29 != (_DWORD)v28);
    goto LABEL_7;
  }
  v66 = v17 + 4;
  v67 = 4 * (v6 - 3);
  v68 = v17 + v67 + 8;
  v69 = v18 + 4;
  v70 = v18 + v67 + 8;
  v71 = v19 + v67 + 12;
  v72 = v20 + v67 + 12;
  v74 = v17 + 4 < v71 && v19 < v68;
  v76 = v66 < v72 && v20 < v68;
  v78 = v69 < v71 && v19 < v70;
  v80 = v69 < v72 && v20 < v70;
  v81 = v69 >= v68 || v66 >= v70;
  v23 = 1;
  if (!v81 || v74 || v76 || v78 || v80)
    goto LABEL_4;
  v23 = v16 & 0xFFFFFFFC | 1;
  v82 = 4 * (v16 & 0xFFFFFFFC);
  v24 = (float32x4_t *)(v20 + v82);
  v19 += v82;
  v22 += v82;
  v25 = (char *)v21 + v82;
  v26 = (char *)(v18 + v82);
  v27 = v17 + v82;
  v83 = (float32x4_t *)(v17 + 4);
  v84 = (float32x4_t *)(v18 + 4);
  v85 = v20 + 4;
  __asm { FMOV            V0.4S, #0.25 }
  v90 = v16 & 0xFFFFFFFC;
  do
  {
    *v83++ = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)((char *)v21 - 4), *(float32x4_t *)((char *)v21 - 4)), vaddq_f32(*v21, *(float32x4_t *)((char *)v21 - 8))), _Q0);
    *v84++ = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)v85, *(float32x4_t *)v85), vaddq_f32(*(float32x4_t *)(v85 + 4), *(float32x4_t *)(v85 - 4))), _Q0);
    v85 += 16;
    ++v21;
    v90 -= 4;
  }
  while (v90);
  if ((v16 & 0x7FFFFFFC) != v16)
    goto LABEL_5;
LABEL_7:
  *((_QWORD *)this + 6) = v15;
  *((_QWORD *)this + 7) = v14;
  v31 = **v15;
  v32 = **v14;
  v33 = *(_QWORD *)*v11;
  v34 = (char *)**v13;
  v35 = (float32x4_t *)(v33 + 8);
  v36 = v34 + 8;
  v37 = (v6 - 3);
  if (v37 >= 7)
  {
    v91 = (unint64_t)v31->u64 + 4;
    v92 = (unint64_t)&v31->u64[1] + 4 * v37;
    v93 = (unint64_t)v32->u64 + 4;
    v94 = (unint64_t)&v32->u64[1] + 4 * v37;
    v95 = v33 + 4 * v37 + 12;
    v96 = (unint64_t)&v34[4 * v37 + 12];
    v98 = (unint64_t)v31->u64 + 4 < v95 && v33 < v92;
    v100 = v91 < v96 && (unint64_t)v34 < v92;
    v102 = v93 < v95 && v33 < v94;
    v104 = v93 < v96 && (unint64_t)v34 < v94;
    v105 = v93 >= v92 || v91 >= v94;
    v38 = 1;
    if (v105 && !v98 && !v100 && !v102 && !v104)
    {
      v106 = v37 + 1;
      v107 = (v37 + 1) & 0x1FFFFFFFCLL;
      v38 = v107 | 1;
      v39 = (float *)&v34[4 * v107];
      v33 += 4 * v107;
      v36 += 4 * v107;
      v40 = &v35->i8[4 * v107];
      v41 = (float32x4_t *)((char *)v32 + 4 * v107);
      v42 = (float32x4_t *)((char *)v31 + 4 * v107);
      v108 = (float32x4_t *)&v31->i32[1];
      v109 = (float32x4_t *)&v32->i32[1];
      v110 = v34 + 4;
      __asm { FMOV            V0.4S, #0.25 }
      v112 = v107;
      do
      {
        *v108++ = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)((char *)v35 - 4), *(float32x4_t *)((char *)v35 - 4)), vaddq_f32(*v35, *(float32x4_t *)((char *)v35 - 8))), _Q0);
        *v109++ = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)v110, *(float32x4_t *)v110), vaddq_f32(*(float32x4_t *)(v110 + 4), *(float32x4_t *)(v110 - 4))), _Q0);
        v110 += 16;
        ++v35;
        v112 -= 4;
      }
      while (v112);
      if (v106 == v107)
        goto LABEL_12;
      goto LABEL_10;
    }
  }
  else
  {
    v38 = 1;
  }
  v39 = (float *)**v13;
  v40 = (__int8 *)(v33 + 8);
  v41 = **v14;
  v42 = **v15;
LABEL_10:
  v43 = 0;
  v44 = ~v38 + v6;
  v45 = (uint64_t)v41->i64 + 4;
  v46 = (uint64_t)v42->i64 + 4;
  do
  {
    v47 = 4 * v43;
    *(float *)(v46 + v47) = (float)((float)(*(float *)(v33 + 4 + 4 * v43) + *(float *)(v33 + 4 + 4 * v43))
                                  + (float)(*(float *)&v40[4 * v43] + *(float *)(v33 + 4 * v43)))
                          * 0.25;
    *(float *)(v45 + v47) = (float)((float)(v39[v43 + 1] + v39[v43 + 1]) + (float)(*(float *)&v36[4 * v43] + v39[v43]))
                          * 0.25;
    ++v43;
  }
  while (v44 != (_DWORD)v43);
LABEL_12:
  if ((v9 & 0x80000000) == 0)
    v48 = v9;
  else
    v48 = -(int)v9;
  if ((int)v48 > v6 + ~(_DWORD)v48)
    goto LABEL_156;
  *((_QWORD *)this + 6) = v11;
  *((_QWORD *)this + 7) = v13;
  v49 = *(_QWORD *)*v11;
  v50 = (char *)**v13;
  v51 = **v15;
  v52 = **v14;
  v53 = 4 * v48;
  v54 = (float *)(v49 + 4 * v48);
  v55 = (float *)&v50[4 * v48];
  v56 = &v51->f32[v48];
  v57 = &v52->f32[v48];
  v58 = &v56[v48];
  v59 = &v57[v48];
  v60 = (v6 + ~(2 * v48));
  v61 = v60 + 1;
  v62 = 8 * v48;
  if (v60 >= 0xF)
  {
    v257 = v60 + 1;
    if ((unint64_t)&v50[-v49] >= 0x10
      && (unint64_t)(v53 + v49 - (_QWORD)v51) >= 0x10
      && (unint64_t)(v53 + v49 - ((_QWORD)v51 + v62)) >= 0x10
      && (unint64_t)(v49 - (_QWORD)v51) >= 0x10
      && (unint64_t)v52 - v53 - v49 >= 0x10
      && (unint64_t)v52 + v62 - v53 - v49 >= 0x10
      && (unint64_t)v52 - v49 >= 0x10
      && (unint64_t)(&v50[v53] - (char *)v51) >= 0x10
      && (unint64_t)(&v50[v53] - ((char *)v51 + v62)) >= 0x10
      && (unint64_t)(v50 - (char *)v51) >= 0x10
      && (unint64_t)(&v50[v53] - (char *)v52) >= 0x10
      && (unint64_t)(&v50[v53] - ((char *)v52 + v62)) >= 0x10
      && (unint64_t)(v50 - (char *)v52) >= 0x10)
    {
      v61 = v60 + 1;
      v63 = v48 + (v257 & 0xFFFFFFFC);
      v125 = 4 * (v257 & 0x1FFFFFFFCLL);
      v64 = &v52->f32[(unint64_t)v125 / 4];
      v65 = &v51->f32[(unint64_t)v125 / 4];
      v59 = (float *)((char *)v59 + v125);
      v58 = (float *)((char *)v58 + v125);
      v57 = (float *)((char *)v57 + v125);
      v56 = (float *)((char *)v56 + v125);
      v55 = (float *)((char *)v55 + v125);
      v54 = (float *)((char *)v54 + v125);
      __asm { FMOV            V0.4S, #0.25 }
      v127 = v257 & 0x1FFFFFFFCLL;
      do
      {
        v128 = vaddq_f32(*(float32x4_t *)((char *)v51 + 4 * v48), *(float32x4_t *)((char *)v51 + 4 * v48));
        v129 = *(float32x4_t *)((char *)v51 + 8 * v48);
        v130 = *v51++;
        *(float32x4_t *)(v49 + 4 * v48) = vmulq_f32(vaddq_f32(v128, vaddq_f32(v129, v130)), _Q0);
        v131 = vaddq_f32(*(float32x4_t *)((char *)v52 + 4 * v48), *(float32x4_t *)((char *)v52 + 4 * v48));
        v132 = *(float32x4_t *)((char *)v52 + 8 * v48);
        v133 = *v52++;
        *(float32x4_t *)&v50[4 * v48] = vmulq_f32(vaddq_f32(v131, vaddq_f32(v132, v133)), _Q0);
        v49 += 16;
        v50 += 16;
        v127 -= 4;
      }
      while (v127);
      if (v257 == (v257 & 0x1FFFFFFFCLL))
        goto LABEL_135;
    }
    else
    {
      v63 = v48;
      v64 = (float *)**v14;
      v65 = (float *)**v15;
      v61 = v60 + 1;
    }
  }
  else
  {
    v63 = v48;
    v64 = (float *)**v14;
    v65 = (float *)**v15;
  }
  v134 = v6 - v63 - v48;
  do
  {
    v135 = *v56++;
    v136 = v135 + v135;
    v137 = *v58++;
    v138 = v137;
    v139 = *v65++;
    *v54++ = (float)(v136 + (float)(v138 + v139)) * 0.25;
    v140 = *v57++;
    v141 = v140;
    v142 = *v59++;
    v143 = v142;
    v144 = *v64++;
    *v55++ = (float)((float)(v141 + v141) + (float)(v143 + v144)) * 0.25;
    --v134;
  }
  while (v134);
LABEL_135:
  *((_QWORD *)this + 6) = v15;
  *((_QWORD *)this + 7) = v14;
  v145 = **v15;
  v146 = **v14;
  v147 = *(float32x4_t **)*v11;
  v148 = (float32x4_t *)**v13;
  v149 = &v145->f32[(unint64_t)v53 / 4];
  v150 = &v146->f32[(unint64_t)v53 / 4];
  v151 = &v147->f32[(unint64_t)v53 / 4];
  v152 = &v148->f32[(unint64_t)v53 / 4];
  v153 = &v147->f32[(unint64_t)v53 / 4 + (unint64_t)v53 / 4];
  v154 = &v148->f32[(unint64_t)v53 / 4 + (unint64_t)v53 / 4];
  if (v60 < 0xF
    || (v155 = (uint64_t)v146 + v53, v156 = (uint64_t)v145 + v53, (unint64_t)((char *)v146 - (char *)v145) < 0x10)
    || (unint64_t)(v156 - (_QWORD)v147) < 0x10
    || (unint64_t)(v156 - ((_QWORD)v147 + v62)) < 0x10
    || (unint64_t)((char *)v145 - (char *)v147) < 0x10
    || (unint64_t)v148 - v156 < 0x10
    || (unint64_t)v148 + v62 - v156 < 0x10
    || (unint64_t)((char *)v148 - (char *)v145) < 0x10
    || (unint64_t)(v155 - (_QWORD)v147) < 0x10
    || (unint64_t)(v155 - ((_QWORD)v147 + v62)) < 0x10
    || (unint64_t)((char *)v146 - (char *)v147) < 0x10
    || (unint64_t)(v155 - (_QWORD)v148) < 0x10
    || (unint64_t)(v155 - ((_QWORD)v148 + v62)) < 0x10
    || (unint64_t)((char *)v146 - (char *)v148) < 0x10)
  {
    v157 = v48;
    v159 = (float *)**v13;
    v160 = *(float **)*v11;
  }
  else
  {
    v157 = v48 + (v61 & 0xFFFFFFFC);
    v158 = 4 * (v61 & 0x1FFFFFFFCLL);
    v159 = &v148->f32[(unint64_t)v158 / 4];
    v160 = &v147->f32[(unint64_t)v158 / 4];
    v154 = (float *)((char *)v154 + v158);
    v153 = (float *)((char *)v153 + v158);
    v152 = (float *)((char *)v152 + v158);
    v151 = (float *)((char *)v151 + v158);
    v150 = (float *)((char *)v150 + v158);
    v149 = (float *)((char *)v149 + v158);
    __asm { FMOV            V0.4S, #0.25 }
    v162 = v61 & 0x1FFFFFFFCLL;
    do
    {
      v163 = vaddq_f32(*(float32x4_t *)((char *)v147 + 4 * v48), *(float32x4_t *)((char *)v147 + 4 * v48));
      v164 = *(float32x4_t *)((char *)v147 + 8 * v48);
      v165 = *v147++;
      *(float32x4_t *)((char *)v145 + 4 * v48) = vmulq_f32(vaddq_f32(v163, vaddq_f32(v164, v165)), _Q0);
      v166 = vaddq_f32(*(float32x4_t *)((char *)v148 + 4 * v48), *(float32x4_t *)((char *)v148 + 4 * v48));
      v167 = *(float32x4_t *)((char *)v148 + 8 * v48);
      v168 = *v148++;
      *(float32x4_t *)((char *)v146 + 4 * v48) = vmulq_f32(vaddq_f32(v166, vaddq_f32(v167, v168)), _Q0);
      ++v145;
      ++v146;
      v162 -= 4;
    }
    while (v162);
    if (v61 == (v61 & 0x1FFFFFFFCLL))
      goto LABEL_156;
  }
  v169 = v6 - v157 - v48;
  do
  {
    v170 = *v151++;
    v171 = v170 + v170;
    v172 = *v153++;
    v173 = v172;
    v174 = *v160++;
    *v149++ = (float)(v171 + (float)(v173 + v174)) * 0.25;
    v175 = *v152++;
    v176 = v175;
    v177 = *v154++;
    v178 = v177;
    v179 = *v159++;
    *v150++ = (float)((float)(v176 + v176) + (float)(v178 + v179)) * 0.25;
    --v169;
  }
  while (v169);
LABEL_156:
  if ((v10 & 0x80000000) == 0)
    v180 = v10;
  else
    v180 = -(int)v10;
  if ((int)v180 > v6 + ~(_DWORD)v180)
  {
    *((_QWORD *)this + 6) = v15;
    *((_QWORD *)this + 7) = v14;
    v181 = *(char **)*v11;
    goto LABEL_203;
  }
  *((_QWORD *)this + 6) = v11;
  *((_QWORD *)this + 7) = v13;
  v182 = *(_QWORD *)*v11;
  v183 = (char *)**v13;
  v184 = **v15;
  v185 = **v14;
  v186 = 4 * v180;
  v187 = (float *)(v182 + 4 * v180);
  v188 = (float *)&v183[4 * v180];
  v189 = &v184->f32[v180];
  v190 = &v185->f32[v180];
  v191 = &v189[v180];
  v192 = &v190[v180];
  v193 = (v6 + ~(2 * v180));
  v194 = v193 + 1;
  v195 = 8 * v180;
  if (v193 < 0xF
    || (v196 = &v183[v186], v197 = v186 + v182, (unint64_t)&v183[-v182] < 0x10)
    || (unint64_t)(v197 - (_QWORD)v184) < 0x10
    || (unint64_t)(v197 - ((_QWORD)v184 + v195)) < 0x10
    || (unint64_t)(v182 - (_QWORD)v184) < 0x10
    || (unint64_t)v185 - v197 < 0x10
    || (unint64_t)v185 + v195 - v197 < 0x10
    || (unint64_t)v185 - v182 < 0x10
    || (unint64_t)(v196 - (char *)v184) < 0x10
    || (unint64_t)(v196 - ((char *)v184 + v195)) < 0x10
    || (unint64_t)(v183 - (char *)v184) < 0x10
    || (unint64_t)(v196 - (char *)v185) < 0x10
    || (unint64_t)(v196 - ((char *)v185 + v195)) < 0x10
    || (unint64_t)(v183 - (char *)v185) < 0x10)
  {
    v198 = v180;
    v200 = (float *)**v14;
    v201 = (float *)**v15;
LABEL_180:
    v210 = v6 - v198 - v180;
    do
    {
      v211 = *v189++;
      v212 = v211 + v211;
      v213 = *v191++;
      v214 = v213;
      v215 = *v201++;
      *v187++ = (float)(v212 + (float)(v214 + v215)) * 0.25;
      v216 = *v190++;
      v217 = v216;
      v218 = *v192++;
      v219 = v218;
      v220 = *v200++;
      *v188++ = (float)((float)(v217 + v217) + (float)(v219 + v220)) * 0.25;
      --v210;
    }
    while (v210);
    goto LABEL_182;
  }
  v198 = v180 + (v194 & 0xFFFFFFFC);
  v199 = 4 * (v194 & 0x1FFFFFFFCLL);
  v200 = &v185->f32[(unint64_t)v199 / 4];
  v201 = &v184->f32[(unint64_t)v199 / 4];
  v192 = (float *)((char *)v192 + v199);
  v191 = (float *)((char *)v191 + v199);
  v190 = (float *)((char *)v190 + v199);
  v189 = (float *)((char *)v189 + v199);
  v188 = (float *)((char *)v188 + v199);
  v187 = (float *)((char *)v187 + v199);
  __asm { FMOV            V0.4S, #0.25 }
  v203 = v194 & 0x1FFFFFFFCLL;
  do
  {
    v204 = vaddq_f32(*(float32x4_t *)((char *)v184 + 4 * v180), *(float32x4_t *)((char *)v184 + 4 * v180));
    v205 = *(float32x4_t *)((char *)v184 + 8 * v180);
    v206 = *v184++;
    *(float32x4_t *)(v182 + 4 * v180) = vmulq_f32(vaddq_f32(v204, vaddq_f32(v205, v206)), _Q0);
    v207 = vaddq_f32(*(float32x4_t *)((char *)v185 + 4 * v180), *(float32x4_t *)((char *)v185 + 4 * v180));
    v208 = *(float32x4_t *)((char *)v185 + 8 * v180);
    v209 = *v185++;
    *(float32x4_t *)&v183[4 * v180] = vmulq_f32(vaddq_f32(v207, vaddq_f32(v208, v209)), _Q0);
    v182 += 16;
    v183 += 16;
    v203 -= 4;
  }
  while (v203);
  if (v194 != (v194 & 0x1FFFFFFFCLL))
    goto LABEL_180;
LABEL_182:
  *((_QWORD *)this + 6) = v15;
  *((_QWORD *)this + 7) = v14;
  v221 = **v15;
  v222 = **v14;
  v181 = *(char **)*v11;
  v223 = (char *)**v13;
  v224 = &v221->f32[(unint64_t)v186 / 4];
  v225 = &v222->f32[(unint64_t)v186 / 4];
  v226 = (float *)&v181[v186];
  v227 = (float *)&v223[v186];
  v228 = (float *)&v181[v186 + v186];
  v229 = (float *)&v223[v186 + v186];
  if (v193 < 0xF
    || (v230 = (uint64_t)v222 + v186, v231 = (uint64_t)v221 + v186, (unint64_t)v222 + v186 - v231 < 0x10)
    || (unint64_t)(v231 - (_QWORD)v181) < 0x10
    || (unint64_t)(v231 - (_QWORD)&v181[v195]) < 0x10
    || (unint64_t)(v231 - (_QWORD)&v181[v186]) < 0x10
    || (unint64_t)&v223[-v231] < 0x10
    || (unint64_t)&v223[v195 - v231] < 0x10
    || (unint64_t)&v223[v186 - v231] < 0x10
    || (unint64_t)(v230 - (_QWORD)v181) < 0x10
    || (unint64_t)(v230 - (_QWORD)&v181[v195]) < 0x10
    || (unint64_t)((char *)v222 - v181) < 0x10
    || (unint64_t)(v230 - (_QWORD)v223) < 0x10
    || (unint64_t)(v230 - (_QWORD)&v223[v195]) < 0x10
    || (unint64_t)((char *)v222 - v223) < 0x10)
  {
    v233 = v180;
    v235 = (float *)**v13;
    v236 = *(float **)*v11;
    v237 = v225;
    v238 = v224;
LABEL_201:
    v245 = v6 - v233 - v180;
    do
    {
      v246 = *v226++;
      v247 = v246 + v246;
      v248 = *v228++;
      v249 = v248;
      v250 = *v236++;
      *v238++ = (float)(v247 + (float)(v249 + v250)) * 0.25;
      v251 = *v227++;
      v252 = v251;
      v253 = *v229++;
      v254 = v253;
      v255 = *v235++;
      *v237++ = (float)((float)(v252 + v252) + (float)(v254 + v255)) * 0.25;
      --v245;
    }
    while (v245);
    goto LABEL_203;
  }
  v232 = 0;
  v233 = v180 + (v194 & 0xFFFFFFFC);
  v234 = 4 * (v194 & 0x1FFFFFFFCLL);
  v235 = (float *)&v223[v234];
  v236 = (float *)&v181[v234];
  v229 = (float *)((char *)v229 + v234);
  v228 = (float *)((char *)v228 + v234);
  v227 = (float *)((char *)v227 + v234);
  v226 = (float *)((char *)v226 + v234);
  v237 = &v225[(unint64_t)v234 / 4];
  v238 = &v224[(unint64_t)v234 / 4];
  v239 = &v181[v186];
  v240 = &v223[v186];
  v241 = &v181[v195];
  v242 = &v223[v195];
  __asm { FMOV            V0.4S, #0.25 }
  v244 = v194 & 0x1FFFFFFFCLL;
  do
  {
    *(float32x4_t *)&v224[v232 / 4] = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)&v239[v232], *(float32x4_t *)&v239[v232]), vaddq_f32(*(float32x4_t *)&v241[v232], *(float32x4_t *)&v181[v232])), _Q0);
    *(float32x4_t *)&v225[v232 / 4] = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)&v240[v232], *(float32x4_t *)&v240[v232]), vaddq_f32(*(float32x4_t *)&v242[v232], *(float32x4_t *)&v223[v232])), _Q0);
    v232 += 16;
    v244 -= 4;
  }
  while (v244);
  if (v194 != (v194 & 0x1FFFFFFFCLL))
    goto LABEL_201;
LABEL_203:
  free(v181);
  free(*v11);
  free(v11);
  free(**v13);
  free(*v13);
  free(v13);
  result = CFAbsoluteTimeGetCurrent() - Current;
  *((float *)this + 17) = result;
  return result;
}

void **array3D(int a1, int a2, int a3)
{
  void **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v13;
  _QWORD *v14;

  v6 = (void **)malloc_type_calloc(a1, 8uLL, 0x80040B8603338uLL);
  if (!v6)
    return v6;
  v7 = malloc_type_calloc(a2 * a1, 8uLL, 0x80040B8603338uLL);
  *v6 = v7;
  if (v7)
  {
    *(_QWORD *)*v6 = malloc_type_calloc(a2 * a1 * a3, 4uLL, 0x100004052888210uLL);
    if (*(_QWORD *)*v6)
    {
      if (a2 < 2)
      {
        if (a1 >= 2)
        {
          v13 = 0;
          do
          {
            v14 = v6[v13 / 8];
            v6[v13 / 8 + 1] = &v14[a2];
            v14[a2] = *v14 + 4 * a3 * a2;
            v13 += 8;
          }
          while (8 * a1 - 8 != v13);
        }
      }
      else
      {
        v8 = 0;
        do
        {
          *(_QWORD *)((char *)*v6 + v8 + 8) = *(_QWORD *)((char *)*v6 + v8) + 4 * a3;
          v8 += 8;
        }
        while (8 * a2 - 8 != v8);
        if (a1 > 1)
        {
          v9 = 1;
          do
          {
            v10 = 0;
            v11 = v6[v9 - 1];
            v6[v9] = &v11[a2];
            v11[a2] = *v11 + 4 * a3 * a2;
            do
            {
              *(_QWORD *)((char *)v6[v9] + v10 + 8) = *(_QWORD *)((char *)v6[v9] + v10) + 4 * a3;
              v10 += 8;
            }
            while (8 * a2 - 8 != v10);
            ++v9;
          }
          while (v9 != a1);
        }
      }
      return v6;
    }
    free(*v6);
  }
  free(v6);
  return 0;
}

float gl_bilateral::normalize_grid(gl_bilateral *this)
{
  double Current;
  int v3;
  float *v4;
  float *v5;
  float result;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *((_DWORD *)this + 9) * *((_DWORD *)this + 8) * *((_DWORD *)this + 10);
  if (v3 >= 1)
  {
    v4 = (float *)***((_QWORD ***)this + 7);
    v5 = (float *)***((_QWORD ***)this + 6);
    do
    {
      if (*v4 != 0.0)
        *v5 = *v5 / *v4;
      ++v5;
      ++v4;
      --v3;
    }
    while (v3);
  }
  result = CFAbsoluteTimeGetCurrent() - Current;
  *((float *)this + 18) = result;
  return result;
}

uint64_t gl_bilateral::run_program(uint64_t a1, __CVBuffer *a2, int a3, signed int *a4, __CVBuffer *a5, __CVBuffer *a6, GLfloat a7, float a8)
{
  double Current;
  uint64_t v14;
  GLuint v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  __CVBuffer *ShortCVPixelBufferRef;
  __CVBuffer *v22;
  int16x4_t *v23;
  float32x4_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float *v31;
  uint64_t v32;
  float v33;
  size_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float32x4_t v38;
  float32x4_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float32x4_t v45;
  float32x4_t *v46;
  uint64_t v47;
  float *v48;
  unint64_t v49;
  float v50;
  size_t BytesPerRow;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int16x4_t *v61;
  int16x4_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int16x4_t *v66;
  int16x4_t *v67;
  float *v68;
  float *v69;
  int16x4_t *v70;
  int16x4_t *v71;
  uint64_t v72;
  float v73;
  float v74;
  float v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  float32x4_t v84;
  int32x4_t v86;
  float32x4_t v87;
  int16x4_t *v88;
  int16x4_t *v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int16x4_t *v94;
  int16x4_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  float32x4_t *v99;
  float32x4_t *v100;
  uint64_t v101;
  int16x4_t *v102;
  int16x4_t *v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  uint64_t v111;
  uint64_t v112;
  float v113;
  float v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  size_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  int16x4_t *v134;
  int16x4_t *v135;
  uint64_t v136;
  __int128 v137;
  _OWORD *v138;
  __int128 v139;
  _OWORD *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  size_t Width;
  size_t Height;
  GLint UniformLocation;
  GLint v153;
  GLint v154;
  GLint v155;
  GLint v156;
  GLint v157;
  float v158;
  GLint v159;
  GLint v160;
  GLint v161;
  float v162;
  GLuint v164;
  __CVBuffer *v165;
  float v166;
  uint64_t v167;
  __CVBuffer *v169;
  GLuint program;
  __CVBuffer *pixelBuffer;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  int16x4_t *BaseAddress;

  Current = CFAbsoluteTimeGetCurrent();
  v169 = a6;
  v14 = 12;
  if (!a6)
    v14 = 8;
  v15 = *(_DWORD *)(a1 + v14);
  program = GLBase_UseProgram(*(_QWORD *)a1, v15);
  GLBase_LoadBuffer(*(_QWORD *)a1, a5, 1, "base_texture", 9728, 0, v15, 0);
  v16 = *(int *)(a1 + 36);
  v17 = *(int *)(a1 + 32) - 4;
  v18 = v16 - 3;
  v19 = *(int *)(a1 + 40);
  v174 = v19 - 3;
  v20 = (v19 - 3) * (v16 - 3);
  ShortCVPixelBufferRef = createShortCVPixelBufferRef(*(_DWORD *)(a1 + 32) - 4, v20, 0);
  CVPixelBufferLockBaseAddress(ShortCVPixelBufferRef, 0);
  BaseAddress = (int16x4_t *)CVPixelBufferGetBaseAddress(ShortCVPixelBufferRef);
  v22 = createShortCVPixelBufferRef(v17, v20, 0);
  CVPixelBufferLockBaseAddress(v22, 0);
  pixelBuffer = v22;
  v23 = (int16x4_t *)CVPixelBufferGetBaseAddress(v22);
  v25 = v19 - 4;
  v175 = v18;
  v176 = v17;
  if (v19 == 4)
  {
    v34 = CVPixelBufferGetBytesPerRow(ShortCVPixelBufferRef) >> 1;
    if ((_DWORD)v18)
      goto LABEL_60;
    goto LABEL_76;
  }
  if ((_DWORD)v18)
    _ZF = (_DWORD)v17 == 0;
  else
    _ZF = 1;
  v27 = _ZF;
  v24.i32[0] = 0;
  if (!_ZF)
  {
    v28 = *(_QWORD *)(a1 + 56);
    if (v17 > 7)
    {
      v35 = v17 - (unint64_t)(v17 & 0xFFFFFFF8);
      if (v17 == (unint64_t)(v17 & 0xFFFFFFF8))
      {
        v36 = v28 + 16;
        v24.i32[0] = 0;
        do
        {
          v37 = 0;
          do
          {
            v38 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 0);
            v39 = (float32x4_t *)(*(_QWORD *)(*(_QWORD *)(v36 + 8 * v35) + 16 + 8 * v37) + 24);
            v40 = v17 & 0xFFFFFFF8;
            v24 = v38;
            do
            {
              v38 = vmaxnmq_f32(v39[-1], v38);
              v24 = vmaxnmq_f32(*v39, v24);
              v39 += 2;
              v40 -= 8;
            }
            while (v40);
            v24.f32[0] = vmaxnmvq_f32(vmaxnmq_f32(v38, v24));
            ++v37;
          }
          while (v37 != v18);
          ++v35;
        }
        while (v35 != v25);
      }
      else
      {
        v41 = 0;
        v42 = v28 + 16;
        v24.i32[0] = 0;
        do
        {
          v43 = 0;
          do
          {
            v44 = *(_QWORD *)(*(_QWORD *)(v42 + 8 * v41) + 16 + 8 * v43);
            v45 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 0);
            v46 = (float32x4_t *)(v44 + 24);
            v47 = v17 & 0xFFFFFFF8;
            v24 = v45;
            do
            {
              v45 = vmaxnmq_f32(v46[-1], v45);
              v24 = vmaxnmq_f32(*v46, v24);
              v46 += 2;
              v47 -= 8;
            }
            while (v47);
            v24.f32[0] = vmaxnmvq_f32(vmaxnmq_f32(v45, v24));
            v48 = (float *)(v44 + ((32 * (v17 >> 3)) | 8));
            v49 = v17 - (unint64_t)(v17 & 0xFFFFFFF8);
            do
            {
              v50 = *v48++;
              v24.f32[0] = fmaxf(v50, v24.f32[0]);
              --v49;
            }
            while (v49);
            ++v43;
          }
          while (v43 != v18);
          ++v41;
        }
        while (v41 != v25);
      }
    }
    else
    {
      v29 = 0;
      v24.i32[0] = 0;
      do
      {
        v30 = 0;
        do
        {
          v31 = (float *)(*(_QWORD *)(*(_QWORD *)(v28 + 16 + 8 * v29) + 16 + 8 * v30) + 8);
          v32 = v17;
          do
          {
            v33 = *v31++;
            v24.f32[0] = fmaxf(v33, v24.f32[0]);
            --v32;
          }
          while (v32);
          ++v30;
        }
        while (v30 != v18);
        ++v29;
      }
      while (v29 != v25);
    }
  }
  v166 = v24.f32[0];
  BytesPerRow = CVPixelBufferGetBytesPerRow(ShortCVPixelBufferRef);
  if ((v27 & 1) != 0)
    goto LABEL_76;
  v165 = ShortCVPixelBufferRef;
  v34 = BytesPerRow >> 1;
  v53 = *(_QWORD *)(a1 + 48);
  v52 = *(_QWORD *)(a1 + 56);
  v54 = v17;
  v55 = 2 * (BytesPerRow >> 1) * v18;
  v56 = 1.0 / v166;
  if (v17 < 4)
  {
    v57 = 0;
    v58 = v53 + 16;
    v59 = v52 + 16;
    v60 = 2 * v34;
    v61 = BaseAddress;
    v62 = v23;
    do
    {
      v63 = 0;
      v64 = *(_QWORD *)(v58 + 8 * v57) + 16;
      v65 = *(_QWORD *)(v59 + 8 * v57) + 16;
      v66 = v61;
      v67 = v62;
      do
      {
        v68 = (float *)(*(_QWORD *)(v64 + 8 * v63) + 8);
        v69 = (float *)(*(_QWORD *)(v65 + 8 * v63) + 8);
        v70 = v66;
        v71 = v67;
        v72 = v17;
        do
        {
          v73 = *v68++;
          v74 = v73;
          v75 = *v69++;
          v70->i16[0] = (int)((float)(fminf(fmaxf(v74, 0.0), 1.0) * 65535.0) + 0.5);
          v70 = (int16x4_t *)((char *)v70 + 2);
          v71->i16[0] = (int)((float)(fminf(fmaxf((float)((float)((float)(COERCE_FLOAT(1597463174 - (COERCE_UNSIGNED_INT(v75 * v56) >> 1))* -0.5)* (float)((float)(v75 * v56)* COERCE_FLOAT(1597463174 - (COERCE_UNSIGNED_INT(v75 * v56) >> 1))))+ 1.5)* (float)((float)(v75 * v56)* COERCE_FLOAT(1597463174 - (COERCE_UNSIGNED_INT(v75 * v56) >> 1))), 0.0), 1.0)* 65535.0)+ 0.5);
          v71 = (int16x4_t *)((char *)v71 + 2);
          --v72;
        }
        while (v72);
        ++v63;
        v67 = (int16x4_t *)((char *)v67 + v60);
        v66 = (int16x4_t *)((char *)v66 + v60);
      }
      while (v63 != v175);
      ++v57;
      v62 = (int16x4_t *)((char *)v62 + v55);
      v61 = (int16x4_t *)((char *)v61 + v55);
    }
    while (v57 != v25);
    if (!(_DWORD)v175)
      goto LABEL_76;
LABEL_60:
    if (!(_DWORD)v17)
      goto LABEL_76;
    v116 = 0;
    v117 = v17;
    v118 = v34 * v175 * v25;
    v119 = (char *)v23 + 2 * v118;
    v120 = 2 * v34;
    v121 = v34 * v175 * (v174 - 2);
    v122 = 2 * v121;
    v123 = (char *)BaseAddress + 2 * v121;
    v124 = (char *)v23 + 2 * v121;
    v125 = (char *)BaseAddress + 2 * v118;
    v126 = v17 & 0xFFFFFFF0;
    v127 = 2 * v118 + 16;
    while (1)
    {
      if (v17 >= 0x18)
      {
        v128 = 0;
        v129 = v120 * v116;
        v130 = &v123[v120 * v116];
        v131 = &v119[v120 * v116];
        if ((unint64_t)(v131 - v130) >= 0x20)
        {
          v132 = &v125[v129];
          v133 = &v124[v129];
          if ((unint64_t)(v133 - v132) >= 0x20
            && (unint64_t)(v131 - v132) >= 0x20
            && (unint64_t)(v132 - v130) >= 0x20
            && (unint64_t)(v131 - v133) >= 0x20)
          {
            v134 = BaseAddress;
            v135 = v23;
            v136 = v126;
            do
            {
              v137 = *(_OWORD *)&v134[2].i8[v122];
              v138 = (_OWORD *)((char *)v134 + v127);
              *(v138 - 1) = *(_OWORD *)&v134->i8[v122];
              *v138 = v137;
              v139 = *(_OWORD *)&v135[2].i8[v122];
              v140 = (_OWORD *)((char *)v135 + v127);
              *(v140 - 1) = *(_OWORD *)&v135->i8[v122];
              *v140 = v139;
              v135 += 4;
              v134 += 4;
              v136 -= 16;
            }
            while (v136);
            v128 = v126;
            if (v126 == v117)
              goto LABEL_62;
          }
        }
      }
      else
      {
        v128 = 0;
      }
      v141 = 0;
      v142 = 2 * (v128 + v118);
      v143 = (char *)v23 + v142;
      v144 = (char *)BaseAddress + v142;
      v145 = 2 * (v128 + v121);
      v146 = (char *)v23 + v145;
      v147 = (char *)BaseAddress + v145;
      v148 = v117 - v128;
      do
      {
        v149 = 2 * v141;
        *(_WORD *)&v144[v149] = *(_WORD *)&v147[2 * v141];
        *(_WORD *)&v143[v149] = *(_WORD *)&v146[2 * v141++];
      }
      while (v148 != v141);
LABEL_62:
      ++v116;
      v127 += v120;
      v122 += v120;
      v118 += v34;
      v121 += v34;
      LODWORD(v17) = v176;
      if (v116 == v175)
        goto LABEL_76;
    }
  }
  v164 = v15;
  v167 = a1;
  v76 = 0;
  v77 = BytesPerRow & 0xFFFFFFFFFFFFFFFELL;
  v78 = v53 + 16;
  v79 = v52 + 16;
  __asm { FMOV            V7.4S, #1.0 }
  v84 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
  __asm { FMOV            V17.2D, #0.5 }
  v86 = vdupq_n_s32(0x5F375A86u);
  v87.i64[0] = 0xBF000000BF000000;
  v87.i64[1] = 0xBF000000BF000000;
  v88 = BaseAddress;
  v89 = v23;
  __asm { FMOV            V20.4S, #1.5 }
  while (2)
  {
    v91 = 0;
    v92 = *(_QWORD *)(v78 + 8 * v76) + 16;
    v93 = *(_QWORD *)(v79 + 8 * v76) + 16;
    v94 = v88;
    v95 = v89;
    do
    {
      v96 = *(_QWORD *)(v92 + 8 * v91);
      v97 = *(_QWORD *)(v93 + 8 * v91);
      if ((unint64_t)(&v23->i8[v55 * v76 + v77 * v91] - &BaseAddress->i8[v55 * v76 + v77 * v91]) < 8)
      {
        v98 = 0;
LABEL_56:
        v111 = v96 + 8;
        v112 = v97 + 8;
        do
        {
          LODWORD(v113) = 1597463174 - (COERCE_UNSIGNED_INT(*(float *)(v112 + 4 * v98) * v56) >> 1);
          v114 = (float)(*(float *)(v112 + 4 * v98) * v56) * v113;
          v115 = v98;
          v94->i16[v115] = (int)((float)(fminf(fmaxf(*(float *)(v111 + 4 * v98), 0.0), 1.0) * 65535.0) + 0.5);
          v95->i16[v115] = (int)((float)(fminf(fmaxf((float)((float)((float)(v113 * -0.5) * v114) + 1.5) * v114, 0.0), 1.0)* 65535.0)+ 0.5);
          ++v98;
        }
        while (v54 != v98);
        goto LABEL_50;
      }
      v99 = (float32x4_t *)(v96 + 8);
      v100 = (float32x4_t *)(v97 + 8);
      v101 = v54 & 0xFFFFFFFC;
      v102 = v94;
      v103 = v95;
      do
      {
        v104 = *v99++;
        v105 = vmulq_f32(vminnmq_f32(vmaxnmq_f32(v104, (float32x4_t)0), _Q7), v84);
        v106 = *v100++;
        v107 = vmulq_n_f32(v106, v56);
        v108 = (float32x4_t)vsubq_s32(v86, (int32x4_t)vshrq_n_u32((uint32x4_t)v107, 1uLL));
        v109 = vmulq_f32(v107, v108);
        v110 = vmulq_f32(vminnmq_f32(vmaxnmq_f32(vmulq_f32(vmlaq_f32(_Q20, vmulq_f32(v108, v87), v109), v109), (float32x4_t)0), _Q7), v84);
        *v102++ = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v105.f32), _Q17))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64(vcvt_hight_f64_f32(v105), _Q17))));
        *v103++ = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v110.f32), _Q17))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64(vcvt_hight_f64_f32(v110), _Q17))));
        v101 -= 4;
      }
      while (v101);
      v98 = v54 & 0xFFFFFFFC;
      if (v98 != v54)
        goto LABEL_56;
LABEL_50:
      ++v91;
      v95 = (int16x4_t *)((char *)v95 + v77);
      v94 = (int16x4_t *)((char *)v94 + v77);
    }
    while (v91 != v175);
    ++v76;
    v89 = (int16x4_t *)((char *)v89 + v55);
    v88 = (int16x4_t *)((char *)v88 + v55);
    if (v76 != v25)
      continue;
    break;
  }
  ShortCVPixelBufferRef = v165;
  a1 = v167;
  v15 = v164;
  LODWORD(v17) = v176;
  if ((_DWORD)v175)
    goto LABEL_60;
LABEL_76:
  CVPixelBufferUnlockBaseAddress(ShortCVPixelBufferRef, 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  GLBase_LoadBuffer(*(_QWORD *)a1, ShortCVPixelBufferRef, 2, "grid_texture", 9729, 0, v15, 0);
  if (v169)
  {
    GLBase_LoadBuffer(*(_QWORD *)a1, pixelBuffer, 3, "weight_texture", 9729, 0, v15, 0);
    GLBase_LoadBuffer(*(_QWORD *)a1, v169, 4, "tone_texture", 9728, 0, v15, 0);
  }
  GLBase_LoadRepurposedBuffer(*(_QWORD *)a1, a2, a4, 0, "output", 9728, 0, v15, 1);
  Width = CVPixelBufferGetWidth(a2);
  Height = CVPixelBufferGetHeight(a2);
  UniformLocation = glGetUniformLocation(program, "u_gridSize");
  glUniform3f(UniformLocation, (float)v176, (float)v175, (float)v174);
  v153 = glGetUniformLocation(program, "u_sizeRatio");
  glUniform2f(v153, (float)Width / (float)((float)v176 * a7), (float)Height / (float)((float)v175 * a7));
  v154 = glGetUniformLocation(program, "u_inv_sigma_r");
  glUniform1f(v154, 1.0 / a8);
  v155 = glGetUniformLocation(program, "u_sigma_s");
  glUniform1f(v155, a7);
  v156 = glGetUniformLocation(program, "z_step");
  glUniform1f(v156, 1.0 / (float)v174);
  if (a4)
  {
    v157 = glGetUniformLocation(program, "u_offset");
    v158 = 0.0;
    if (a3 == 2)
      v158 = 0.5;
    glUniform2f(v157, v158, 0.0);
    v159 = glGetUniformLocation(program, "u_stretch");
    glUniform2f(v159, 0.5, 1.0);
    GLBase_PrepareRendering(*(OpenGLWrapper **)a1, v15);
    LODWORD(Width) = a4[1];
  }
  else
  {
    v160 = glGetUniformLocation(program, "u_offset");
    glUniform2f(v160, 0.0, 0.0);
    v161 = glGetUniformLocation(program, "u_stretch");
    glUniform2f(v161, 1.0, 1.0);
    GLBase_PrepareRendering(*(OpenGLWrapper **)a1, v15);
  }
  GLBase_RenderProgram(*(_QWORD *)a1, v15, 0, 0, Width, Height);
  v162 = CFAbsoluteTimeGetCurrent() - Current;
  *(float *)(a1 + 76) = v162;
  CVPixelBufferRelease(ShortCVPixelBufferRef);
  CVPixelBufferRelease(pixelBuffer);
  return 0;
}

uint64_t gl_bilateral::tone_mapping(uint64_t a1, __CVBuffer *a2, int a3, signed int *a4, __CVBuffer *a5, __CVBuffer *a6, GLfloat a7, float a8)
{
  gl_bilateral::run_program(a1, a2, a3, a4, a5, a6, a7, a8);
  return 0;
}

float gl_bilateral::create_grid<2>(uint64_t a1, NSObject **a2, __CVBuffer *a3, float a4, float a5)
{
  double Current;
  void ***v11;
  void ***v12;
  int Width;
  int Height;
  void *BaseAddressOfPlane;
  int v16;
  int v17;
  float v18;
  int v19;
  void **v20;
  void ***v21;
  void ***v22;
  int v23;
  NSObject *v24;
  float result;
  _QWORD v26[6];
  int v27;
  int v28;
  int v29;
  int v30;
  float v31;
  int v32;
  int v33;
  float v34;

  Current = CFAbsoluteTimeGetCurrent();
  v11 = *(void ****)(a1 + 48);
  if (v11)
  {
    free(**v11);
    free(*v11);
    free(v11);
  }
  v12 = *(void ****)(a1 + 56);
  if (v12)
  {
    free(**v12);
    free(*v12);
    free(v12);
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v16 = (int)(float)((float)(Width - 1) / a4);
  v17 = (int)(float)((float)(Height - 1) / a4);
  *(_DWORD *)(a1 + 32) = v16 + 5;
  *(_DWORD *)(a1 + 36) = v17 + 5;
  v18 = 1.0 / a5;
  v19 = (int)v18 + 5;
  *(_DWORD *)(a1 + 40) = v19;
  *(_QWORD *)(a1 + 48) = array3D(v19, v17 + 5, v16 + 5);
  v20 = array3D(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32));
  v21 = (void ***)v20;
  *(_QWORD *)(a1 + 56) = v20;
  v22 = *(void ****)(a1 + 48);
  if (v22 && v20)
  {
    v23 = v17 + 2;
    if (v17 >= -1)
      v23 = v17 + 1;
    v24 = *a2;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 0x40000000;
    v26[2] = ___ZN12gl_bilateral11create_gridILi2EEEvPKP16dispatch_queue_sP10__CVBufferff_block_invoke;
    v26[3] = &__block_descriptor_tmp_2;
    v27 = v17 + 1;
    v28 = v23 >> 1;
    v29 = Height;
    v30 = (int)(a4 + 0.5);
    v31 = 1.0 / a4;
    v32 = v16 + 1;
    v33 = Width;
    v26[4] = a1;
    v26[5] = BaseAddressOfPlane;
    v34 = v18;
    dispatch_apply(2uLL, v24, v26);
  }
  else
  {
    if (v22)
    {
      free(**v22);
      free(*v22);
      free(v22);
      *(_QWORD *)(a1 + 48) = 0;
      v21 = *(void ****)(a1 + 56);
    }
    if (v21)
    {
      free(**v21);
      free(*v21);
      free(v21);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  result = CFAbsoluteTimeGetCurrent() - Current;
  *(float *)(a1 + 64) = result;
  return result;
}

uint64_t ___ZN12gl_bilateral11create_gridILi2EEEvPKP16dispatch_queue_sP10__CVBufferff_block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, float32x4_t a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  int32x4_t v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
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
  _QWORD *v76;
  int v77;
  const __int16 *v78;
  float16x4_t v79;
  float32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  uint64_t v83;
  uint64_t v84;
  float32x2_t v85;
  int v86;
  int v87;
  int v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v6 = *(_DWORD *)(result + 48);
  if (a2)
  {
    v7 = *(_DWORD *)(result + 52);
    v8 = v6 + v7 * (a2 - 2) + 2;
    v9 = v6 + (a2 - 1) * v7 + 1;
    if (v9 < v8)
      return result;
  }
  else
  {
    v7 = *(_DWORD *)(result + 52);
    v8 = 2;
    v9 = v6 - v7 + 1;
    if (v9 < 2)
      return result;
  }
  v10 = *(_DWORD *)(result + 60);
  v11 = v10 - 1;
  if (v10 >= 1)
  {
    v12 = *(_QWORD *)(result + 32);
    v13 = *(_DWORD *)(result + 56) + ~((v7 - v7 * a2) * v10);
    if (v10 >= 4)
    {
      v48.i64[0] = 0x200000002;
      v48.i64[1] = 0x200000002;
      do
      {
        if ((v13 & 0x80000000) == 0)
        {
          v50 = *(_DWORD *)(result + 68);
          if (v50 <= 0)
          {
            if (v13 >= v11)
              v49 = v10 - 1;
            else
              v49 = v13;
            v13 += ~v49;
          }
          else
          {
            v51 = *(int *)(result + 72);
            v52 = v13;
            v53 = v50 + 1;
            v54 = v13 * v51;
            v55 = v10 - 1;
            do
            {
              LODWORD(v56) = 0;
              v57 = 8 * (int)(float)((float)(*(float *)(result + 64) * (float)(int)v52) + 0.5);
              v58 = 2;
              do
              {
                v60 = 0;
                v61 = (int)v56;
                v62 = v56;
                v63 = 2 * (v54 + v56);
                do
                {
                  if (v61 + v60 > v51 - 4)
                  {
                    LODWORD(v56) = v62 + v60;
                    v47 = __OFSUB__(v10, (_DWORD)v60);
                    v86 = v10 - v60;
                    if ((v86 < 0) ^ v47 | (v86 == 0))
                      goto LABEL_42;
                    goto LABEL_52;
                  }
                  v77 = (int)(float)((float)(*(float *)(result + 64) * (float)(v62 + v60)) + 0.5);
                  LODWORD(v72) = v77 + 2;
                  v78 = (const __int16 *)(*(_QWORD *)(result + 40) + 2 * v63);
                  v79 = (float16x4_t)*(_OWORD *)vld2_s16(v78).val;
                  a6 = vcvtq_f32_f16(v79);
                  v80.i64[0] = 0x3F0000003F000000;
                  v80.i64[1] = 0x3F0000003F000000;
                  v81 = vaddq_s32(vcvtq_s32_f32(vmlaq_n_f32(v80, a6, *(float *)(result + 76))), v48);
                  v82 = vsubq_s32(v81, vdupq_lane_s32(*(int32x2_t *)v81.i8, 0));
                  v82.i64[0] = vpaddq_s32(v82, v82).u64[0];
                  if (vpadd_s32(*(int32x2_t *)v82.i8, *(int32x2_t *)v82.i8).u32[0])
                  {
                    v64 = *(_QWORD *)(v12 + 48);
                    v65 = *(_QWORD *)(v12 + 56);
                    v66 = 4 * v77;
                    v67 = *(_QWORD *)(*(_QWORD *)(v64 + 8 * v81.i32[0]) + v57 + 16) + v66;
                    *(float *)(v67 + 8) = *(float *)(v67 + 8) + a6.f32[0];
                    v68 = 8 * v81.i32[1];
                    v69 = *(_QWORD *)(*(_QWORD *)(v64 + v68) + v57 + 16) + v66;
                    *(float *)(v69 + 8) = *(float *)(v69 + 8) + a6.f32[1];
                    v70 = *(_QWORD *)(*(_QWORD *)(v64 + 8 * v81.i32[2]) + v57 + 16) + v66;
                    *(float *)(v70 + 8) = *(float *)(v70 + 8) + a6.f32[2];
                    v71 = *(_QWORD *)(*(_QWORD *)(v64 + 8 * v81.i32[3]) + v57 + 16) + v66;
                    *(float *)(v71 + 8) = *(float *)(v71 + 8) + a6.f32[3];
                    v72 = (int)v72;
                    v73 = *(_QWORD *)(*(_QWORD *)(v65 + 8 * v81.i32[0]) + v57 + 16) + v66;
                    a6.i32[0] = 1.0;
                    *(float *)(v73 + 8) = *(float *)(v73 + 8) + 1.0;
                    v74 = *(_QWORD *)(*(_QWORD *)(v65 + v68) + v57 + 16) + v66;
                    *(float *)(v74 + 8) = *(float *)(v74 + 8) + 1.0;
                    v75 = *(_QWORD *)(*(_QWORD *)(v65 + 8 * v81.i32[2]) + v57 + 16) + v66;
                    *(float *)(v75 + 8) = *(float *)(v75 + 8) + 1.0;
                    v76 = (_QWORD *)(v65 + 8 * v81.i32[3]);
                  }
                  else
                  {
                    v83 = *(_QWORD *)(v12 + 56);
                    v84 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * v81.i32[0]) + v57 + 16) + 4 * v77;
                    v85 = (float32x2_t)vpaddq_f32(a6, a6).u64[0];
                    *(float32x2_t *)a6.f32 = vpadd_f32(v85, v85);
                    v72 = (int)v72;
                    *(float *)(v84 + 8) = *(float *)(v84 + 8) + a6.f32[0];
                    v76 = (_QWORD *)(v83 + 8 * v81.i32[0]);
                    a6.i32[0] = 4.0;
                  }
                  *(float *)(*(_QWORD *)(*v76 + v57 + 16) + 4 * v72) = *(float *)(*(_QWORD *)(*v76 + v57 + 16) + 4 * v72)
                                                                     + a6.f32[0];
                  v60 += 4;
                  v63 += 8;
                }
                while ((int)v60 <= v10 - 4);
                LODWORD(v56) = v61 + v60;
                v47 = __OFSUB__(v10, (_DWORD)v60);
                v86 = v10 - v60;
                if ((v86 < 0) ^ v47 | (v86 == 0))
                  continue;
LABEL_52:
                if ((int)v56 <= (int)v51)
                  v87 = v51;
                else
                  v87 = v56;
                v56 = (int)v56;
                v88 = 2 * (v54 + v56);
                do
                {
                  if (v87 == v56)
                    break;
                  a6.f32[0] = (float)(*(float *)(result + 64) * (float)(int)v56) + 0.5;
                  v89 = (int)a6.f32[0];
                  a6.i16[0] = *(_WORD *)(*(_QWORD *)(result + 40) + 2 * v88);
                  a6.i64[0] = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)a6.f32, 0)).u64[0];
                  v90 = 8 * (int)(float)((float)(*(float *)(result + 76) * a6.f32[0]) + 0.5);
                  v91 = *(_QWORD *)(v12 + 56);
                  v92 = 4 * v89;
                  v93 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 48) + v90 + 16) + v57 + 16) + v92;
                  *(float *)(v93 + 8) = *(float *)(v93 + 8) + a6.f32[0];
                  v94 = *(_QWORD *)(*(_QWORD *)(v91 + v90 + 16) + v57 + 16) + v92;
                  *(float *)(v94 + 8) = *(float *)(v94 + 8) + 1.0;
                  ++v56;
                  v88 += 2;
                  --v86;
                }
                while (v86);
LABEL_42:
                ;
              }
              while (v58++ != v53);
              v13 = v52 - 1;
              v47 = __OFSUB__(v55--, 1);
              if (v55 < 0 != v47)
                break;
              v54 -= v51;
              v15 = v52-- <= 0;
            }
            while (!v15);
          }
        }
        v15 = v9-- <= v8;
      }
      while (!v15);
    }
    else
    {
      do
      {
        if ((v13 & 0x80000000) == 0)
        {
          v16 = *(_DWORD *)(result + 68);
          if (v16 <= 0)
          {
            if (v13 >= v11)
              v14 = v10 - 1;
            else
              v14 = v13;
            v13 += ~v14;
          }
          else
          {
            v17 = *(_DWORD *)(result + 72);
            v18 = v13;
            v19 = v10 - 1;
            do
            {
              v20 = 0;
              v21 = v18 * v17;
              v22 = 8 * (int)(float)((float)(*(float *)(result + 64) * (float)(int)v18) + 0.5);
              v23 = v16;
              do
              {
                if (v20 <= v17)
                  v24 = v17;
                else
                  v24 = v20;
                if (v20 < v17)
                {
                  *(float *)&a5 = (float)(*(float *)(result + 64) * (float)v20) + 0.5;
                  v25 = (int)*(float *)&a5;
                  LOWORD(a5) = *(_WORD *)(*(_QWORD *)(result + 40) + 4 * (v20 + v21));
                  *(_QWORD *)&a5 = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)&a5, 0)).u64[0];
                  v26 = 8 * (int)(float)((float)(*(float *)(result + 76) * *(float *)&a5) + 0.5);
                  v27 = *(_QWORD *)(v12 + 56);
                  v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 48) + v26 + 16) + v22 + 16);
                  v29 = 4 * v25;
                  *(float *)(v28 + v29 + 8) = *(float *)(v28 + v29 + 8) + *(float *)&a5;
                  v30 = v20;
                  v31 = *(_QWORD *)(*(_QWORD *)(v27 + v26 + 16) + v22 + 16) + v29;
                  *(float *)(v31 + 8) = *(float *)(v31 + 8) + 1.0;
                  v32 = v20 + 1;
                  if (v10 != 1)
                  {
                    v33 = v24 - v20;
                    if (v33 != 1)
                    {
                      v34 = v21 + v32;
                      *(float *)&a5 = (float)(*(float *)(result + 64) * (float)v32) + 0.5;
                      v35 = (int)*(float *)&a5;
                      LOWORD(a5) = *(_WORD *)(*(_QWORD *)(result + 40) + 4 * v34);
                      *(_QWORD *)&a5 = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)&a5, 0)).u64[0];
                      v36 = 8 * (int)(float)((float)(*(float *)(result + 76) * *(float *)&a5) + 0.5);
                      v37 = *(_QWORD *)(v12 + 56);
                      v38 = 4 * v35;
                      v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 48) + v36 + 16) + v22 + 16) + v38;
                      *(float *)(v39 + 8) = *(float *)(v39 + 8) + *(float *)&a5;
                      v40 = *(_QWORD *)(*(_QWORD *)(v37 + v36 + 16) + v22 + 16) + v38;
                      *(float *)(v40 + 8) = *(float *)(v40 + 8) + 1.0;
                      v32 = v30 + 2;
                      if (v10 != 2 && v33 != 2)
                      {
                        *(float *)&a5 = (float)(*(float *)(result + 64) * (float)v32) + 0.5;
                        v41 = (int)*(float *)&a5;
                        LOWORD(a5) = *(_WORD *)(*(_QWORD *)(result + 40) + 4 * (v21 + v32));
                        *(_QWORD *)&a5 = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)&a5, 0)).u64[0];
                        v42 = 8 * (int)(float)((float)(*(float *)(result + 76) * *(float *)&a5) + 0.5);
                        v43 = *(_QWORD *)(v12 + 56);
                        v44 = 4 * v41;
                        v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 48) + v42 + 16) + v22 + 16) + v44;
                        *(float *)(v45 + 8) = *(float *)(v45 + 8) + *(float *)&a5;
                        v46 = *(_QWORD *)(*(_QWORD *)(v43 + v42 + 16) + v22 + 16) + v44;
                        *(float *)(v46 + 8) = *(float *)(v46 + 8) + 1.0;
                        v32 = v30 + 3;
                      }
                    }
                  }
                  v20 = v32;
                }
                --v23;
              }
              while (v23);
              v13 = v18 - 1;
              v47 = __OFSUB__(v19--, 1);
              if (v19 < 0 != v47)
                break;
              v15 = v18-- <= 0;
            }
            while (!v15);
          }
        }
        v15 = v9-- <= v8;
      }
      while (!v15);
    }
  }
  return result;
}

id **OpenGLWrapper::createInstance(OpenGLWrapper *this)
{
  id **v1;
  id v3;
  int v4;

  v1 = (id **)OpenGLWrapper::contextCache;
  if (OpenGLWrapper::contextCache)
    return v1;
  v1 = (id **)operator new();
  OpenGLWrapper::OpenGLWrapper((OpenGLWrapper *)v1, 0);
  if (*v1[1])
  {
    OpenGLWrapper::contextCache = (uint64_t)v1;
    if (OpenGLWrapper::contextClientPid == -1)
      return v1;
    v4 = OpenGLWrapper::contextClientPid;
    v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
    objc_msgSend(*v1[1], "setParameter:to:", 609, &v4);

    return v1;
  }
  else
  {
    ((void (*)(id **))(*v1)[1])(v1);
    return 0;
  }
}

void sub_24B720DD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD25DE0](v1, 0x10A1C40089FC6C3);
  _Unwind_Resume(a1);
}

void OpenGLWrapper::OpenGLWrapper(OpenGLWrapper *this, OpenGLWrapper *a2)
{
  _QWORD *v4;
  uint64_t v5;
  GLint *v6;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  int v12;

  *(_QWORD *)this = &off_251C9DFF0;
  if (!a2)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
    *((_QWORD *)this + 1) = operator new();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 2);
    **((_QWORD **)this + 1) = v8;
    *((_DWORD *)this + 4) = 0;
    *((_BYTE *)this + 20) = 1;
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD1460]);
      v10 = objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", **((_QWORD **)this + 1));

      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

        **((_QWORD **)this + 1) = 0;
        if (**((_QWORD **)this + 1))
          goto LABEL_8;
        goto LABEL_13;
      }
      v12 = 2;
      objc_msgSend(**((id **)this + 1), "setParameter:to:", 608, &v12);
      glDisable(0xB71u);
    }

    if (**((_QWORD **)this + 1))
    {
LABEL_8:
      if (*((_BYTE *)this + 20) && !*((_DWORD *)this + 4))
      {
        glGenFramebuffers(1, (GLuint *)this + 4);
        glBindFramebuffer(0x8D40u, *((_DWORD *)this + 4));
        v11 = **((_QWORD **)this + 1);
        *((_DWORD *)this + 6) = 0;
        v6 = (GLint *)((char *)this + 24);
        if (!v11)
          return;
      }
      else
      {
        *((_DWORD *)this + 6) = 0;
        v6 = (GLint *)((char *)this + 24);
      }
LABEL_11:
      glGetIntegerv(0x8872u, v6);
      return;
    }
LABEL_13:
    *((_DWORD *)this + 6) = 0;
    return;
  }
  v4 = (_QWORD *)operator new();
  *((_QWORD *)this + 1) = v4;
  v5 = **((_QWORD **)a2 + 1);
  *v4 = v5;
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_BYTE *)this + 20) = 0;
  *((_DWORD *)this + 6) = 0;
  v6 = (GLint *)((char *)this + 24);
  if (v5)
    goto LABEL_11;
}

void OpenGLWrapper::~OpenGLWrapper(id **this)
{
  id v2;

  *this = (id *)&off_251C9DFF0;
  if (*this[1])
  {
    if (*((_BYTE *)this + 20))
    {
      v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
      objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

      *this[1] = 0;
    }
    MEMORY[0x24BD25DE0]();
    this[1] = 0;
  }
}

{
  id v2;

  *this = (id *)&off_251C9DFF0;
  if (*this[1])
  {
    if (*((_BYTE *)this + 20))
    {
      v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
      objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

      *this[1] = 0;
    }
    MEMORY[0x24BD25DE0]();
    this[1] = 0;
  }
  JUMPOUT(0x24BD25DE0);
}

void OpenGLClient::OpenGLClient(OpenGLClient *this, OpenGLWrapper *a2)
{
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  void *v6;

  OpenGLWrapper::OpenGLWrapper(this, a2);
  *(_QWORD *)v3 = &off_251C9E010;
  v4 = *(unsigned int *)(v3 + 24);
  if ((int)v4 >= 1)
  {
    v5 = 4 * v4;
    v6 = (void *)operator new[]();
    *((_QWORD *)this + 4) = v6;
    bzero(v6, v5);
  }
}

void sub_24B72116C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  id v3;

  *(_QWORD *)v1 = &off_251C9DFF0;
  if (**(_QWORD **)(v1 + 8))
  {
    if (*(_BYTE *)(v1 + 20))
    {
      v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
      objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

      **(_QWORD **)(v1 + 8) = 0;
    }
    MEMORY[0x24BD25DE0]();
    *(_QWORD *)(v1 + 8) = 0;
  }
  _Unwind_Resume(exception_object);
}

void OpenGLClient::~OpenGLClient(GLuint *framebuffers)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  *(_QWORD *)framebuffers = &off_251C9E010;
  if (**((_QWORD **)framebuffers + 1))
  {
    v2 = framebuffers[6];
    if ((int)v2 < 1)
      goto LABEL_19;
    v3 = 0;
    v4 = *((_QWORD *)framebuffers + 4);
    v5 = 4 * v2;
    do
    {
      if (*(_DWORD *)(v4 + v3))
      {
        glDeleteTextures(1, (const GLuint *)(v4 + v3));
        v4 = *((_QWORD *)framebuffers + 4);
        *(_DWORD *)(v4 + v3) = 0;
      }
      v3 += 4;
    }
    while (v5 != v3);
    if (**((_QWORD **)framebuffers + 1))
    {
LABEL_19:
      if (*((_BYTE *)framebuffers + 20) && framebuffers[4])
      {
        glDeleteFramebuffers(1, framebuffers + 4);
        framebuffers[4] = 0;
      }
    }
  }
  v6 = *((_QWORD *)framebuffers + 4);
  if (v6)
    MEMORY[0x24BD25DE0](v6, 0x1000C4052888210);
  *(_QWORD *)framebuffers = &off_251C9DFF0;
  if (**((_QWORD **)framebuffers + 1))
  {
    if (*((_BYTE *)framebuffers + 20))
    {
      v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
      objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

      **((_QWORD **)framebuffers + 1) = 0;
    }
    MEMORY[0x24BD25DE0]();
    *((_QWORD *)framebuffers + 1) = 0;
  }
}

void OpenGLClient::~OpenGLClient(GLuint *this)
{
  OpenGLClient::~OpenGLClient(this);
  JUMPOUT(0x24BD25DE0);
}

uint64_t OpenGLWrapper::createProgram(OpenGLWrapper *this, GLchar *a2, const char *a3)
{
  GLuint Shader;
  GLuint v5;
  GLuint v6;
  GLuint v7;
  uint64_t Program;
  uint64_t v9;
  const GLchar *v11;
  GLchar *string;

  v11 = a3;
  string = a2;
  if (**((_QWORD **)this + 1))
  {
    Shader = glCreateShader(0x8B31u);
    if (Shader)
    {
      v5 = Shader;
      glShaderSource(Shader, 1, (const GLchar *const *)&string, 0);
      glCompileShader(v5);
      if ((OpenGLWrapper::checkCompileStatusForShader(this, v5) & 0x80000000) != 0
        || (v6 = glCreateShader(0x8B30u)) == 0)
      {
        glDeleteShader(v5);
      }
      else
      {
        v7 = v6;
        glShaderSource(v6, 1, &v11, 0);
        glCompileShader(v7);
        if ((OpenGLWrapper::checkCompileStatusForShader(this, v7) & 0x80000000) != 0)
        {
          v9 = 0;
        }
        else
        {
          Program = glCreateProgram();
          v9 = Program;
          if ((_DWORD)Program)
          {
            glAttachShader(Program, v5);
            glAttachShader(v9, v7);
            glLinkProgram(v9);
            if ((OpenGLWrapper::checkLinkStatusForProgram(this, v9) & 0x80000000) == 0)
            {
              glDeleteShader(v5);
              glDeleteShader(v7);
              return v9;
            }
          }
        }
        glDeleteShader(v5);
        glDeleteShader(v7);
        if (!(_DWORD)v9)
          return v9;
        glDeleteProgram(v9);
      }
    }
  }
  return 0;
}

uint64_t OpenGLWrapper::checkCompileStatusForShader(OpenGLWrapper *this, GLuint shader)
{
  uint64_t result;
  GLchar *v4;
  GLint params[2];

  if (**((_QWORD **)this + 1))
  {
    *(_QWORD *)params = 0;
    glGetShaderiv(shader, 0x8B81u, &params[1]);
    glGetShaderiv(shader, 0x8B84u, params);
    result = 0;
    if (params[1] == 1)
      return result;
    if (params[0] >= 2)
    {
      v4 = (GLchar *)malloc_type_malloc(params[0], 0x3FA31647uLL);
      glGetShaderInfoLog(shader, params[0], 0, v4);
      free(v4);
    }
    glDeleteShader(shader);
  }
  return 0xFFFFFFFFLL;
}

uint64_t OpenGLWrapper::checkLinkStatusForProgram(OpenGLWrapper *this, GLuint program)
{
  uint64_t result;
  GLchar *v4;
  GLint params[2];

  if (**((_QWORD **)this + 1))
  {
    *(_QWORD *)params = 0;
    glGetProgramiv(program, 0x8B82u, &params[1]);
    glGetProgramiv(program, 0x8B84u, params);
    result = 0;
    if (params[1] == 1)
      return result;
    if (params[0] >= 2)
    {
      v4 = (GLchar *)malloc_type_malloc(params[0], 0xA5887A2CuLL);
      glGetProgramInfoLog(program, params[0], 0, v4);
      free(v4);
    }
  }
  return 0xFFFFFFFFLL;
}

void OpenGLWrapper::deleteProgram(OpenGLWrapper *this, GLuint program)
{
  if (**((_QWORD **)this + 1))
    glDeleteProgram(program);
}

uint64_t OpenGLClient::loadBuffer(uint64_t a1, IOSurfaceRef buffer, signed int *a3, GLint a4, GLchar *a5, GLint a6, int a7, GLuint a8, char a9)
{
  id *v9;
  signed int PixelFormat;
  size_t Height;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  GLuint *v23;
  int v24;
  id v25;
  int v26;
  GLint UniformLocation;
  uint64_t v28;
  GLint param;
  GLchar *name;
  GLuint program;
  size_t Width;

  v9 = *(id **)(a1 + 8);
  if (!*v9)
    return 0xFFFFFFFFLL;
  if (a3)
  {
    PixelFormat = *a3;
    Width = a3[1];
    Height = a3[2];
    result = 0xFFFFFFFFLL;
    if (*a3 > 1278226487)
      goto LABEL_4;
LABEL_19:
    if (PixelFormat > 875704421)
    {
      if (PixelFormat != 875704422)
      {
        v24 = 1111970369;
LABEL_25:
        if (PixelFormat != v24)
          return result;
        param = a6;
        name = a5;
        program = a8;
        v21 = 5121;
        v20 = 6408;
        v22 = a4;
        v23 = (GLuint *)(*(_QWORD *)(a1 + 32) + 4 * a4);
        if (!*v23)
          goto LABEL_27;
        goto LABEL_28;
      }
      if (!a7)
      {
LABEL_40:
        param = a6;
        name = a5;
        program = a8;
        v21 = 5121;
        v20 = 6403;
        v22 = a4;
        v23 = (GLuint *)(*(_QWORD *)(a1 + 32) + 4 * a4);
        if (*v23)
          goto LABEL_28;
        goto LABEL_27;
      }
      if (a7 != 1)
        return result;
    }
    else
    {
      if (PixelFormat == 16)
      {
        param = a6;
        name = a5;
        program = a8;
        v21 = 32819;
        v20 = 6408;
        v22 = a4;
        v23 = (GLuint *)(*(_QWORD *)(a1 + 32) + 4 * a4);
        if (*v23)
          goto LABEL_28;
        goto LABEL_27;
      }
      if (PixelFormat != 843264056)
        return result;
    }
    param = a6;
    name = a5;
    program = a8;
    v21 = 5121;
    v20 = 33319;
    v22 = a4;
    v23 = (GLuint *)(*(_QWORD *)(a1 + 32) + 4 * a4);
    if (*v23)
      goto LABEL_28;
    goto LABEL_27;
  }
  PixelFormat = IOSurfaceGetPixelFormat(buffer);
  if (IOSurfaceGetPlaneCount(buffer) == 1)
  {
    Width = IOSurfaceGetWidth(buffer);
    Height = IOSurfaceGetHeight(buffer);
    result = 0xFFFFFFFFLL;
    if (PixelFormat <= 1278226487)
      goto LABEL_19;
  }
  else
  {
    Width = IOSurfaceGetWidthOfPlane(buffer, a7);
    Height = IOSurfaceGetHeightOfPlane(buffer, a7);
    result = 0xFFFFFFFFLL;
    if (PixelFormat <= 1278226487)
      goto LABEL_19;
  }
LABEL_4:
  if (PixelFormat <= 1647392358)
  {
    if (PixelFormat != 1278226488)
    {
      v24 = 1380401729;
      goto LABEL_25;
    }
    goto LABEL_40;
  }
  program = a8;
  name = a5;
  param = a6;
  if (PixelFormat == 1647392359)
    goto LABEL_8;
  if (PixelFormat == 1647719521)
  {
    v21 = 36193;
    v20 = 6408;
    v22 = a4;
    v23 = (GLuint *)(*(_QWORD *)(a1 + 32) + 4 * a4);
    if (*v23)
      goto LABEL_28;
LABEL_27:
    glGenTextures(1, v23);
    goto LABEL_28;
  }
  if (PixelFormat != 1647522401)
    return result;
LABEL_8:
  if (PixelFormat == 1647522401)
    v20 = 33319;
  else
    v20 = 6403;
  v21 = 36193;
  v22 = a4;
  v23 = (GLuint *)(*(_QWORD *)(a1 + 32) + 4 * a4);
  if (!*v23)
    goto LABEL_27;
LABEL_28:
  glActiveTexture(a4 + 33984);
  glBindTexture(0xDE1u, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v22));
  v25 = objc_alloc_init(MEMORY[0x24BDD1460]);
  BYTE4(v28) = 0;
  LODWORD(v28) = a7;
  v26 = objc_msgSend(*v9, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", buffer, 3553, v20, Width, Height, v20, v21, v28);

  if (!v26)
    return 0xFFFFFFFFLL;
  glTexParameteri(0xDE1u, 0x2801u, param);
  glTexParameteri(0xDE1u, 0x2800u, param);
  glTexParameteri(0xDE1u, 0x2802u, 33071);
  glTexParameteri(0xDE1u, 0x2803u, 33071);
  UniformLocation = glGetUniformLocation(program, name);
  glUniform1i(UniformLocation, a4);
  if (a9)
  {
    glFramebufferTexture2D(0x8D40u, 0x8CE0u, 0xDE1u, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v22), 0);
    glCheckFramebufferStatus(0x8D40u);
  }
  return 0;
}

uint64_t OpenGLWrapper::checkProgramValidity(OpenGLWrapper *this, GLuint program)
{
  uint64_t result;
  GLchar *v4;
  GLint length;
  GLint params;

  if (**((_QWORD **)this + 1))
  {
    params = 0;
    glValidateProgram(program);
    glGetProgramiv(program, 0x8B83u, &params);
    result = 0;
    if (params)
      return result;
    length = 0;
    glGetProgramiv(program, 0x8B84u, &length);
    if (length >= 1)
    {
      v4 = (GLchar *)malloc_type_malloc(length, 0x6AA1A735uLL);
      glGetProgramInfoLog(program, length, &length, v4);
      free(v4);
    }
  }
  return 0xFFFFFFFFLL;
}

OpenGLWrapper *GLBase_constructor()
{
  OpenGLWrapper *v0;
  id **Instance;

  v0 = (OpenGLWrapper *)operator new();
  Instance = OpenGLWrapper::createInstance(v0);
  OpenGLClient::OpenGLClient(v0, (OpenGLWrapper *)Instance);
  return v0;
}

void sub_24B721AD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD25DE0](v1, 0x10B1C402D9CDCC7);
  _Unwind_Resume(a1);
}

void GLBase_BindClientPidToCurrentContext(int a1)
{
  uint64_t v1;
  id v2;
  int v3;

  if (OpenGLWrapper::contextClientPid != a1)
  {
    OpenGLWrapper::contextClientPid = a1;
    v1 = OpenGLWrapper::contextCache;
    if (OpenGLWrapper::contextCache)
    {
      v3 = a1;
      if (**(_QWORD **)(OpenGLWrapper::contextCache + 8))
      {
        v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
        objc_msgSend(**(id **)(v1 + 8), "setParameter:to:", 609, &v3);

      }
    }
  }
}

uint64_t GLBase_GetClientPidOfCurrentContext()
{
  return OpenGLWrapper::contextClientPid;
}

uint64_t GLBase_dispose_glcache()
{
  uint64_t result;

  result = OpenGLWrapper::contextCache;
  if (OpenGLWrapper::contextCache)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)OpenGLWrapper::contextCache + 8))(OpenGLWrapper::contextCache);
    OpenGLWrapper::contextCache = 0;
    OpenGLWrapper::contextClientPid = -1;
  }
  return result;
}

uint64_t GLBase_UseProgram(uint64_t a1, uint64_t program)
{
  if (!**(_QWORD **)(a1 + 8))
    return 0;
  glUseProgram(program);
  return program;
}

uint64_t GLBase_LoadBuffer(uint64_t a1, CVPixelBufferRef pixelBuffer, GLint a3, GLchar *a4, GLint a5, int a6, GLuint a7, char a8)
{
  __IOSurface *IOSurface;

  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  return OpenGLClient::loadBuffer(a1, IOSurface, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t GLBase_LoadRepurposedBuffer(uint64_t a1, CVPixelBufferRef pixelBuffer, signed int *a3, GLint a4, GLchar *a5, GLint a6, int a7, GLuint a8, char a9)
{
  __IOSurface *IOSurface;

  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  return OpenGLClient::loadBuffer(a1, IOSurface, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t GLBase_RenderProgram(int a1, int a2, GLint x, GLint y, GLsizei width, GLsizei height)
{
  glViewport(x, y, width, height);
  glClear(0x4000u);
  glDrawElements(4u, 6, 0x1403u, &KIndices);
  glFlush();
  return 0;
}

uint64_t GLBase_PrepareRendering(OpenGLWrapper *a1, GLuint program)
{
  GLuint AttribLocation;
  GLuint v5;

  AttribLocation = glGetAttribLocation(program, "a_position");
  glVertexAttribPointer(AttribLocation, 3, 0x1406u, 0, 0, &KVertices);
  glEnableVertexAttribArray(AttribLocation);
  v5 = glGetAttribLocation(program, "a_texCoord");
  glVertexAttribPointer(v5, 2, 0x1406u, 0, 0, &KTexCoords);
  glEnableVertexAttribArray(v5);
  OpenGLWrapper::checkProgramValidity(a1, program);
  return 0;
}

void GLBase_DeleteTextures(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (**(_QWORD **)(a1 + 8))
  {
    v2 = *(unsigned int *)(a1 + 24);
    if ((int)v2 >= 1)
    {
      v3 = 0;
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 4 * v2;
      do
      {
        if (*(_DWORD *)(v4 + v3))
        {
          glDeleteTextures(1, (const GLuint *)(v4 + v3));
          v4 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)(v4 + v3) = 0;
        }
        v3 += 4;
      }
      while (v5 != v3);
    }
  }
}

void GLBase_setCachedContext()
{
  uint64_t v0;
  id v1;

  v0 = OpenGLWrapper::contextCache;
  if (OpenGLWrapper::contextCache)
  {
    if (**(_QWORD **)(OpenGLWrapper::contextCache + 8))
    {
      v1 = objc_alloc_init(MEMORY[0x24BDD1460]);
      objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", **(_QWORD **)(v0 + 8));

    }
  }
}

void GLBase_removeCachedContext()
{
  id v0;

  if (OpenGLWrapper::contextCache)
  {
    v0 = objc_alloc_init(MEMORY[0x24BDD1460]);
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

  }
}

double HomographyTransform_constructor()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
  if (v0)
  {
    *(_QWORD *)&result = 1065353216;
    *v0 = xmmword_24B7234D0;
    v0[1] = xmmword_24B7234D0;
    v0[2] = xmmword_24B7234D0;
    v0[3] = xmmword_24B7234D0;
  }
  return result;
}

double HomographyTransform_eye(_OWORD *a1)
{
  double result;

  *(_QWORD *)&result = 1065353216;
  *a1 = xmmword_24B7234D0;
  a1[1] = xmmword_24B7234D0;
  a1[2] = xmmword_24B7234D0;
  a1[3] = xmmword_24B7234D0;
  return result;
}

uint64_t AffineTransform_estimate(float32x4_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 *a6, int a7)
{
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  const float *v28;
  float32x4_t v29;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v39;
  unint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = 4 * *a6;
  v9 = *(float *)(a4 + v8);
  v10 = *(float *)(a5 + v8);
  v11 = *(float *)(a2 + v8);
  v12 = *(float *)(a3 + v8);
  v13 = v9 * v9;
  v14 = v10 * v9;
  v15 = v10 * v10;
  v16 = v11 * v9;
  v17 = v11 * v10;
  v18 = v12 * v9;
  v19 = v12 * v10;
  if (a7 >= 2)
  {
    v20 = a6 + 1;
    v21 = a7 - 1;
    do
    {
      v22 = *v20++;
      v23 = 4 * v22;
      v24 = *(float *)(a4 + v23);
      v25 = *(float *)(a5 + v23);
      v26 = *(float *)(a2 + v23);
      v27 = *(float *)(a3 + v23);
      v13 = v13 + (float)(v24 * v24);
      v14 = v14 + (float)(v25 * v24);
      v15 = v15 + (float)(v25 * v25);
      v9 = v9 + v24;
      v10 = v10 + v25;
      v16 = v16 + (float)(v26 * v24);
      v17 = v17 + (float)(v26 * v25);
      v11 = v11 + v26;
      v18 = v18 + (float)(v27 * v24);
      v19 = v19 + (float)(v27 * v25);
      v12 = v12 + v27;
      --v21;
    }
    while (v21);
  }
  v39.i64[0] = __PAIR64__(LODWORD(v17), LODWORD(v16));
  v39.i64[1] = __PAIR64__(LODWORD(v18), LODWORD(v11));
  v40 = __PAIR64__(LODWORD(v12), LODWORD(v19));
  sposv_NEWLAPACK();
  *a1 = v39;
  a1[1].i64[0] = v40;
  a1[1].i64[1] = 0;
  v41 = v39;
  v42 = (float32x4_t)v40;
  v43 = 1065353216;
  invMatrix((uint64_t)&v41, 3);
  v28 = (const float *)&v43;
  v29 = vld1q_dup_f32(v28);
  __asm { FMOV            V1.4S, #1.0 }
  v35 = vdivq_f32(_Q1, v29);
  v36 = vmulq_f32(v41, v35);
  v37 = vmulq_f32(v42, v35);
  a1[2] = v36;
  a1[3] = v37;
  return 0;
}

float HomographyTransform_get3x3Matrix(float *a1, uint64_t a2, int a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float result;

  *(float *)a2 = a1[6] + *a1;
  v4 = 4;
  if (a3)
    v5 = 4;
  else
    v5 = 12;
  v6 = 8;
  if (a3)
    v7 = 8;
  else
    v7 = 24;
  if (a3)
  {
    v4 = 12;
    v8 = 20;
  }
  else
  {
    v8 = 28;
  }
  if (a3)
    v6 = 24;
  *(float *)(a2 + v5) = (float)(a1[7] + a1[1]) * a4;
  *(float *)(a2 + v7) = (float)((float)((float)(a1[2] - (float)(a1[6] + *a1)) - (float)((float)(a1[7] + a1[1]) * a4))
                              * 0.5)
                      + 0.5;
  *(float *)(a2 + v4) = (float)(a1[3] / a4) + a1[6];
  *(float *)(a2 + 16) = a1[4] + (float)(a1[7] * a4);
  *(float *)(a2 + v8) = (float)((float)((float)(a1[3] - (float)(a1[5] + a4))
                                      + (float)((float)((float)(a1[4] + a1[6]) + (float)(a1[7] * a4)) * a4))
                              * -0.5)
                      / a4;
  if (a3)
    v9 = 28;
  else
    v9 = 20;
  *(float *)(a2 + v6) = a1[6] + a1[6];
  result = a4 * (float)(a1[7] + a1[7]);
  *(float *)(a2 + v9) = result;
  *(_DWORD *)(a2 + 32) = 1065353216;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
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

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
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

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigCaptureCFCreatePropertyList()
{
  return MEMORY[0x24BE10360]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x24BDC07F8]();
}

uint64_t FigSampleBufferProcessorGetClassID()
{
  return MEMORY[0x24BDDCE08]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x24BDC09E0]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_251C9D958();
}

uint64_t operator delete()
{
  return off_251C9D960();
}

uint64_t operator new[]()
{
  return off_251C9D968();
}

uint64_t operator new()
{
  return off_251C9D970();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x24BDC0B30]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void glActiveTexture(GLenum texture)
{
  MEMORY[0x24BDE2820](*(_QWORD *)&texture);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x24BDE2828](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
  MEMORY[0x24BDE2830](*(_QWORD *)&program, *(_QWORD *)&index, name);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x24BDE2840](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindTexture(GLenum target, GLuint texture)
{
  MEMORY[0x24BDE2850](*(_QWORD *)&target, *(_QWORD *)&texture);
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x24BDE2890](*(_QWORD *)&target);
}

void glClear(GLbitfield mask)
{
  MEMORY[0x24BDE2898](*(_QWORD *)&mask);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x24BDE28C0](*(_QWORD *)&shader);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x24BDE28D0]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x24BDE28D8](*(_QWORD *)&type);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x24BDE28E8](*(_QWORD *)&n, framebuffers);
}

void glDeleteProgram(GLuint program)
{
  MEMORY[0x24BDE28F0](*(_QWORD *)&program);
}

void glDeleteShader(GLuint shader)
{
  MEMORY[0x24BDE2900](*(_QWORD *)&shader);
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
  MEMORY[0x24BDE2910](*(_QWORD *)&n, textures);
}

void glDisable(GLenum cap)
{
  MEMORY[0x24BDE2938](*(_QWORD *)&cap);
}

void glDisableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2940](*(_QWORD *)&index);
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x24BDE2950](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
  MEMORY[0x24BDE2958](*(_QWORD *)&mode, *(_QWORD *)&count, *(_QWORD *)&type, indices);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2968](*(_QWORD *)&index);
}

void glFinish(void)
{
  MEMORY[0x24BDE2978]();
}

void glFlush(void)
{
  MEMORY[0x24BDE2980]();
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
  MEMORY[0x24BDE2990](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&textarget, *(_QWORD *)&texture, *(_QWORD *)&level);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x24BDE29A0](*(_QWORD *)&n, framebuffers);
}

void glGenTextures(GLsizei n, GLuint *textures)
{
  MEMORY[0x24BDE29B0](*(_QWORD *)&n, textures);
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE29C8](*(_QWORD *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x24BDE29D8]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
  MEMORY[0x24BDE29F0](*(_QWORD *)&pname, params);
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE29F8](*(_QWORD *)&program, *(_QWORD *)&bufsize, length, infolog);
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A00](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE2A10](*(_QWORD *)&shader, *(_QWORD *)&bufsize, length, infolog);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A18](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE2A30](*(_QWORD *)&program, name);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x24BDE2A48](*(_QWORD *)&program);
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x24BDE2AA0](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
{
  MEMORY[0x24BDE2AC8](*(_QWORD *)&target, *(_QWORD *)&pname, param);
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
  MEMORY[0x24BDE2AD8](*(_QWORD *)&target, *(_QWORD *)&pname, *(_QWORD *)&param);
}

void glUniform1f(GLint location, GLfloat x)
{
  MEMORY[0x24BDE2AF0](*(_QWORD *)&location, x);
}

void glUniform1i(GLint location, GLint x)
{
  MEMORY[0x24BDE2B00](*(_QWORD *)&location, *(_QWORD *)&x);
}

void glUniform2f(GLint location, GLfloat x, GLfloat y)
{
  MEMORY[0x24BDE2B10](*(_QWORD *)&location, x, y);
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
  MEMORY[0x24BDE2B30](*(_QWORD *)&location, x, y, z);
}

void glUniformMatrix2fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B70](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

void glUseProgram(GLuint program)
{
  MEMORY[0x24BDE2B98](*(_QWORD *)&program);
}

void glValidateProgram(GLuint program)
{
  MEMORY[0x24BDE2BA0](*(_QWORD *)&program);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x24BDE2BB8](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2BC0](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
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

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

uint64_t sgetrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2FB0]();
}

uint64_t sgetri_NEWLAPACK()
{
  return MEMORY[0x24BDB2FC0]();
}

uint64_t sposv_NEWLAPACK()
{
  return MEMORY[0x24BDB3098]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

float tanhf(float a1)
{
  float result;

  MEMORY[0x24BDB0150](a1);
  return result;
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vpythg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x24BDB3450](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x24BDB3510](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3528](__A, __IA, __C, __IC, __N);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3618](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37A0](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageTableLookUp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_8 table[256], vImage_Flags flags)
{
  return MEMORY[0x24BDB3A90](src, dest, table, *(_QWORD *)&flags);
}

