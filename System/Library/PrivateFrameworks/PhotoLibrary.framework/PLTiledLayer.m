@implementation PLTiledLayer

- (void)prepareForDecoding
{
  int v3;
  FILE **v4;
  uint64_t v5;
  uint64_t v6;

  applejpeg_decode_options_init();
  v3 = applejpeg_decode_build_index_table();
  self->_err = v3;
  if (v3)
  {
    if (gPLTiledLayerTrace)
    {
      v4 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "-[PLTiledLayer prepareForDecoding]");
      fprintf(*v4, "ffjpeg_decode_build_index_table: error: %d", self->_err);
      fputc(10, *v4);
    }
  }
  else if (self->_decoderCount >= 2)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      self->_decoders[v5 + 1].var0 = (ajdec *)applejpeg_decode_clone_session();
      self->_decoders[v5 + 1].var1 = dispatch_queue_create("com.apple.coremedia.ajdecodesession", 0);
      ++v6;
      ++v5;
    }
    while (v6 < self->_decoderCount);
  }
}

- (double)zoomStartScaleForImage:(CGSize)a3 placeholderImageSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double result;

  v4 = a4.width / a3.width;
  v5 = a4.height / a3.height;
  if (v4 >= v5)
    v5 = v4;
  v6 = 1.0;
  do
  {
    result = v6;
    v6 = v6 * 0.5;
  }
  while (v6 > v5);
  return result;
}

- (void)setupConverterForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4
{
  void *v7;
  void *v8;
  void *v9;
  MTLDevice *v10;
  CGColorConversionInfoRef v11;
  objc_class *v12;
  const CGColorConversionInfo *v13;
  MTLDevice *metalDevice;
  CFDataRef v15;
  CFDataRef v16;
  const __CFData *v17;
  const __CFData *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[24];
  uint64_t v53;
  CGColorSpace *v54;
  _QWORD v55[4];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  uint64_t v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1BCCC6CF8](self, a2);
  v53 = 0;
  v54 = (CGColorSpace *)&v53;
  v55[0] = 0x2020000000;
  v8 = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  v55[1] = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  if (!getMTLCreateSystemDefaultDeviceSymbolLoc_ptr)
  {
    v9 = MetalLibrary();
    v8 = dlsym(v9, "MTLCreateSystemDefaultDevice");
    *((_QWORD *)v54 + 3) = v8;
    getMTLCreateSystemDefaultDeviceSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v53, 8);
  if (!v8)
  {
    v43 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id PL_MTLCreateSystemDefaultDevice(void)"), CFSTR("PLTiledLayer.m"), 72, CFSTR("%s"), dlerror());
    goto LABEL_40;
  }
  v10 = (MTLDevice *)((uint64_t (*)(void))v8)();
  self->_metalDevice = v10;
  if (v10)
  {
    v65 = *MEMORY[0x1E0C9DA28];
    v66[0] = MEMORY[0x1E0C9AAB0];
    v11 = CGColorConversionInfoCreateFromList((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1), a3, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, a4, 1, 0, 0);
    if (v11)
    {
      v53 = 0;
      v54 = (CGColorSpace *)&v53;
      v55[0] = 0x3052000000;
      v55[1] = __Block_byref_object_copy__2897;
      v55[2] = __Block_byref_object_dispose__2898;
      v12 = (objc_class *)getMPSImageConversionClass_softClass;
      v55[3] = getMPSImageConversionClass_softClass;
      if (!getMPSImageConversionClass_softClass)
      {
        v50 = MEMORY[0x1E0C809B0];
        v51 = 3221225472;
        *(_QWORD *)v52 = __getMPSImageConversionClass_block_invoke;
        *(_QWORD *)&v52[8] = &unk_1E70B61D8;
        *(_QWORD *)&v52[16] = &v53;
        __getMPSImageConversionClass_block_invoke((uint64_t)&v50);
        v12 = (objc_class *)*((_QWORD *)v54 + 5);
      }
      _Block_object_dispose(&v53, 8);
      self->_metalConverter = (MPSImageConversion *)objc_msgSend([v12 alloc], "initWithDevice:srcAlpha:destAlpha:backgroundColor:conversionInfo:", self->_metalDevice, 1, 1, 0, v11);
      self->_metalCmdQueue = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_metalDevice, "newCommandQueue");
      v13 = v11;
    }
    metalDevice = self->_metalDevice;
    if (metalDevice && self->_metalConverter && self->_metalCmdQueue)
      goto LABEL_38;

    self->_metalDevice = 0;
    self->_metalCmdQueue = 0;

    self->_metalConverter = 0;
  }
  v53 = 0x2000000008;
  v54 = a3;
  LODWORD(v55[0]) = 8198;
  memset((char *)v55 + 4, 0, 20);
  v50 = 0x2000000008;
  v51 = (uint64_t)a4;
  *(_DWORD *)v52 = 8198;
  memset(&v52[4], 0, 20);
  v15 = CGColorSpaceCopyICCData(a3);
  v16 = CGColorSpaceCopyICCData(a4);
  v17 = v15;
  v18 = v16;
  if (v15)
  {
    if (v16)
    {
      v19 = (void *)PL_ColorSyncProfileCreate((uint64_t)v15);
      v20 = (void *)PL_ColorSyncProfileCreate((uint64_t)v16);
      v21 = v19;
      v22 = v20;
      if (v19)
      {
        if (v20)
        {
          v63[0] = getkColorSyncProfile();
          v64[0] = v19;
          v63[1] = getkColorSyncRenderingIntent();
          v64[1] = getkColorSyncRenderingIntentPerceptual();
          v63[2] = getkColorSyncTransformTag();
          v56 = 0;
          v57 = &v56;
          v58 = 0x2020000000;
          v23 = (_QWORD *)getkColorSyncTransformDeviceToPCSSymbolLoc_ptr;
          v59 = (void *)getkColorSyncTransformDeviceToPCSSymbolLoc_ptr;
          if (!getkColorSyncTransformDeviceToPCSSymbolLoc_ptr)
          {
            v24 = ColorSyncLibrary();
            v23 = dlsym(v24, "kColorSyncTransformDeviceToPCS");
            v57[3] = (uint64_t)v23;
            getkColorSyncTransformDeviceToPCSSymbolLoc_ptr = (uint64_t)v23;
          }
          _Block_object_dispose(&v56, 8);
          if (!v23)
            goto LABEL_41;
          v64[2] = *v23;
          v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
          v61[0] = getkColorSyncProfile();
          v62[0] = v20;
          v61[1] = getkColorSyncRenderingIntent();
          v62[1] = getkColorSyncRenderingIntentPerceptual();
          v61[2] = getkColorSyncTransformTag();
          v56 = 0;
          v57 = &v56;
          v58 = 0x2020000000;
          v26 = (_QWORD *)getkColorSyncTransformPCSToDeviceSymbolLoc_ptr;
          v59 = (void *)getkColorSyncTransformPCSToDeviceSymbolLoc_ptr;
          if (!getkColorSyncTransformPCSToDeviceSymbolLoc_ptr)
          {
            v27 = ColorSyncLibrary();
            v26 = dlsym(v27, "kColorSyncTransformPCSToDevice");
            v57[3] = (uint64_t)v26;
            getkColorSyncTransformPCSToDeviceSymbolLoc_ptr = (uint64_t)v26;
          }
          _Block_object_dispose(&v56, 8);
          if (!v26)
          {
            v45 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncTransformPCSToDevice(void)"), CFSTR("PLTiledLayer.m"), 87, CFSTR("%s"), dlerror());
            goto LABEL_40;
          }
          v62[2] = *v26;
          v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
          v60[0] = v25;
          v60[1] = v28;
          v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
          v56 = 0;
          v57 = &v56;
          v58 = 0x2020000000;
          v30 = getColorSyncTransformCreateSymbolLoc_ptr;
          v59 = getColorSyncTransformCreateSymbolLoc_ptr;
          if (!getColorSyncTransformCreateSymbolLoc_ptr)
          {
            v31 = ColorSyncLibrary();
            v30 = dlsym(v31, "ColorSyncTransformCreate");
            v57[3] = (uint64_t)v30;
            getColorSyncTransformCreateSymbolLoc_ptr = v30;
          }
          _Block_object_dispose(&v56, 8);
          if (!v30)
          {
            v46 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ColorSyncTransformRef PL_ColorSyncTransformCreate(CFArrayRef, CFDictionaryRef)"), CFSTR("PLTiledLayer.m"), 82, CFSTR("%s"), dlerror());
            goto LABEL_40;
          }
          v32 = (void *)((uint64_t (*)(uint64_t, _QWORD))v30)(v29, 0);
          v33 = v32;
          if (v32)
          {
            v56 = 0;
            v57 = &v56;
            v58 = 0x2020000000;
            v34 = (uint64_t *)getkColorSyncTransformFullConversionDataSymbolLoc_ptr;
            v59 = (void *)getkColorSyncTransformFullConversionDataSymbolLoc_ptr;
            if (!getkColorSyncTransformFullConversionDataSymbolLoc_ptr)
            {
              v35 = ColorSyncLibrary();
              v34 = (uint64_t *)dlsym(v35, "kColorSyncTransformFullConversionData");
              v57[3] = (uint64_t)v34;
              getkColorSyncTransformFullConversionDataSymbolLoc_ptr = (uint64_t)v34;
            }
            _Block_object_dispose(&v56, 8);
            if (!v34)
            {
              v47 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncTransformFullConversionData(void)"), CFSTR("PLTiledLayer.m"), 88, CFSTR("%s"), dlerror());
              goto LABEL_40;
            }
            v36 = *v34;
            v56 = 0;
            v57 = &v56;
            v58 = 0x2020000000;
            v37 = getColorSyncTransformCopyPropertySymbolLoc_ptr;
            v59 = getColorSyncTransformCopyPropertySymbolLoc_ptr;
            if (!getColorSyncTransformCopyPropertySymbolLoc_ptr)
            {
              v38 = ColorSyncLibrary();
              v37 = dlsym(v38, "ColorSyncTransformCopyProperty");
              v57[3] = (uint64_t)v37;
              getColorSyncTransformCopyPropertySymbolLoc_ptr = v37;
            }
            _Block_object_dispose(&v56, 8);
            if (!v37)
            {
              v48 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef PL_ColorSyncTransformCopyProperty(ColorSyncTransformRef, CFTypeRef, CFDictionaryRef)"), CFSTR("PLTiledLayer.m"), 84, CFSTR("%s"), dlerror());
              goto LABEL_40;
            }
            v39 = (void *)((uint64_t (*)(void *, uint64_t, _QWORD))v37)(v32, v36, 0);
            v40 = v39;
            if (v39)
            {
              v56 = 0;
              v57 = &v56;
              v58 = 0x2020000000;
              v41 = getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr;
              v59 = getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr;
              if (!getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr)
              {
                v42 = AccelerateLibrary();
                v41 = dlsym(v42, "vImageConverter_CreateWithColorSyncCodeFragment");
                v57[3] = (uint64_t)v41;
                getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr = v41;
              }
              _Block_object_dispose(&v56, 8);
              if (v41)
              {
                self->_vimageConverter = (vImageConverter *)((uint64_t (*)(void *, uint64_t *, uint64_t *, _QWORD, _QWORD, _QWORD))v41)(v39, &v53, &v50, 0, 0, 0);
                goto LABEL_38;
              }
              v49 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vImageConverterRef PL_vImageConverter_CreateWithColorSyncCodeFragment(CFTypeRef, const vImage_CGImageFormat *, const vImage_CGImageFormat *, const CGFloat *, vImage_Flags, vImage_Error *)"), CFSTR("PLTiledLayer.m"), 78, CFSTR("%s"), dlerror());
              while (1)
              {
LABEL_40:
                __break(1u);
LABEL_41:
                v44 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncTransformDeviceToPCS(void)"), CFSTR("PLTiledLayer.m"), 86, CFSTR("%s"), dlerror());
              }
            }
          }
        }
      }
    }
  }
LABEL_38:
  objc_autoreleasePoolPop(v7);
}

- (PLTiledLayer)initWithJPEGData:(id)a3 placeholderImage:(CGImage *)a4 screenSize:(CGSize)a5
{
  double height;
  double width;
  char *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFTypeID v12;
  BOOL v13;
  _BOOL4 v14;
  CFTypeID v15;
  unsigned int v16;
  int v17;
  FILE **v18;
  int v19;
  int v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  CFTypeID v24;
  _DWORD *v25;
  CFTypeID v26;
  size_t v27;
  const __CFString *v28;
  const __CFString *v29;
  CFTypeID v30;
  double v31;
  CFTypeID v32;
  NSObject *v33;
  NSObject *v34;
  FILE **v35;
  FILE **v36;
  CFTypeID v37;
  FILE **v38;
  int64x2_t v39;
  void *v40;
  const __CFDictionary *v41;
  CGImageSource *v42;
  CGImageSource *v43;
  CGImage *ImageAtIndex;
  CGImage *v45;
  CGColorSpace *ColorSpace;
  CGColorSpace *v47;
  FILE **v48;
  CFPropertyListRef v49;
  const void *v50;
  double *v51;
  int v52;
  double v53;
  double v54;
  int v55;
  unsigned int v56;
  int v57;
  int v58;
  int v59;
  BOOL v60;
  char v61;
  _BOOL4 v62;
  int v63;
  double v64;
  FILE **v65;
  void *v67;
  double v68;
  uint64_t v69;
  __int128 v70;
  int v71;
  _OWORD valuePtr[2];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  objc_super v76;
  const __CFString *v77;
  _QWORD v78[3];

  height = a5.height;
  width = a5.width;
  v78[1] = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)PLTiledLayer;
  v9 = -[PLTiledLayer init](&v76, sel_init);
  if (!v9)
    return (PLTiledLayer *)v9;
  v10 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("ajtiledlayer_trace"), CFSTR("com.apple.coremedia"));
  if (!v10)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v11 = v10;
  v12 = CFGetTypeID(v10);
  if (v12 == CFStringGetTypeID())
  {
    v13 = CFStringGetIntValue(v11) == 0;
  }
  else
  {
    v15 = CFGetTypeID(v11);
    if (v15 != CFNumberGetTypeID())
    {
      v37 = CFGetTypeID(v11);
      v14 = v37 == CFBooleanGetTypeID() && v11 == (const __CFString *)*MEMORY[0x1E0C9AE50];
      goto LABEL_11;
    }
    LODWORD(valuePtr[0]) = 0;
    CFNumberGetValue((CFNumberRef)v11, kCFNumberIntType, valuePtr);
    v13 = LODWORD(valuePtr[0]) == 0;
  }
  v14 = !v13;
LABEL_11:
  CFRelease(v11);
LABEL_12:
  gPLTiledLayerTrace = v14;
  if (!a3)
    goto LABEL_102;
  v9[80] = MGGetBoolAnswer();
  *((_QWORD *)v9 + 4) = a3;
  if (width * height >= 1000000.0)
    v16 = 512;
  else
    v16 = 256;
  v17 = gPLTiledLayerTrace;
  v18 = (FILE **)MEMORY[0x1E0C80C20];
  if (gPLTiledLayerTrace)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "using tile size: %d x %d\n", v16, v16);
    v17 = gPLTiledLayerTrace;
  }
  *((_DWORD *)v9 + 13) = v16;
  v19 = (int)width / (int)(v16 >> 1) + 1 + ((int)width / (int)(v16 >> 1) + 1) * ((int)height / (int)(v16 >> 1));
  v20 = v19 + v19 / 4;
  v21 = v20 / 10 + v20;
  if (v17)
    fprintf(*v18, "Maximum number of cached tiles: %d\n", v20 / 10 + v20);
  *((_DWORD *)v9 + 14) = v21;
  LODWORD(valuePtr[0]) = 0;
  v22 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("ajtiledlayer_decoder_count"), CFSTR("com.apple.coremedia"));
  if (!v22)
  {
    v25 = v9 + 48;
    *((_DWORD *)v9 + 12) = 0;
LABEL_27:
    LODWORD(v27) = FigThreadGetMaxLogicalCoreCount();
    goto LABEL_28;
  }
  v23 = v22;
  v24 = CFGetTypeID(v22);
  if (v24 == CFStringGetTypeID())
  {
    LODWORD(valuePtr[0]) = CFStringGetIntValue(v23);
  }
  else
  {
    v26 = CFGetTypeID(v23);
    if (v26 == CFNumberGetTypeID())
      CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, valuePtr);
  }
  CFRelease(v23);
  LODWORD(v27) = valuePtr[0];
  v25 = v9 + 48;
  *((_DWORD *)v9 + 12) = valuePtr[0];
  v18 = (FILE **)MEMORY[0x1E0C80C20];
  if ((int)v27 <= 0)
    goto LABEL_27;
LABEL_28:
  if ((int)v27 <= 1)
    v27 = 1;
  else
    v27 = v27;
  *v25 = v27;
  *((_QWORD *)v9 + 5) = malloc_type_calloc(v27, 0x10uLL, 0xA0040AFF93C70uLL);
  if (gPLTiledLayerTrace)
    fprintf(*v18, "creating %d decoders\n", *v25);
  *(_QWORD *)&valuePtr[0] = 0;
  v28 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("ajtiledlayer_zoomlevel_scale_factor"), CFSTR("com.apple.coremedia"));
  if (v28)
  {
    v29 = v28;
    v30 = CFGetTypeID(v28);
    if (v30 == CFStringGetTypeID())
    {
      *(_QWORD *)&valuePtr[0] = CFStringGetDoubleValue(v29);
    }
    else
    {
      v32 = CFGetTypeID(v29);
      if (v32 == CFNumberGetTypeID())
        CFNumberGetValue((CFNumberRef)v29, kCFNumberCGFloatType, valuePtr);
    }
    CFRelease(v29);
    v31 = *(double *)valuePtr;
    v18 = (FILE **)MEMORY[0x1E0C80C20];
  }
  else
  {
    v31 = 0.0;
  }
  if (v31 <= 0.0)
    v31 = 1.0;
  sZoomLevelScaleFactor = *(_QWORD *)&v31;
  if (gPLTiledLayerTrace)
    fprintf(*v18, "using zoom-level scale factor %f\n", v31);
  v74 = 0;
  v75 = 0;
  v73 = 0;
  memset(valuePtr, 0, sizeof(valuePtr));
  v74 = objc_msgSend(*((id *)v9 + 4), "bytes");
  v75 = objc_msgSend(*((id *)v9 + 4), "length");
  v33 = dispatch_queue_create("com.apple.coremedia.ajtiledecoder", 0);
  *((_QWORD *)v9 + 22) = v33;
  dispatch_queue_set_specific(v33, (const void *)PLTiledLayerDecodeQueueSpecific, (void *)PLTiledLayerDecodeQueueSpecific, 0);
  v34 = dispatch_queue_create("com.apple.coremedia.ajconversionqueue", 0);
  *((_QWORD *)v9 + 23) = v34;
  dispatch_queue_set_specific(v34, (const void *)PLTiledLayerConversionQueueSpecific, (void *)PLTiledLayerConversionQueueSpecific, 0);
  pl_dispatch_sync();
  if (!**((_QWORD **)v9 + 5))
  {
    if (gPLTiledLayerTrace)
    {
      v36 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fwrite("ffjpeg_decode_create failed", 0x1BuLL, 1uLL, *v36);
      goto LABEL_101;
    }
LABEL_102:

    return 0;
  }
  if (applejpeg_decode_open_mem())
  {
    if (gPLTiledLayerTrace)
    {
      v35 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fprintf(*v35, "ffjpeg_decode_open_mem: error: %d");
LABEL_101:
      fputc(10, (FILE *)*MEMORY[0x1E0C80C10]);
      goto LABEL_102;
    }
    goto LABEL_102;
  }
  if (applejpeg_decode_get_image_info())
  {
    if (gPLTiledLayerTrace)
    {
      v38 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fprintf(*v38, "ffjpeg_decode_get_image_info: error: %d");
      goto LABEL_101;
    }
    goto LABEL_102;
  }
  v39.i64[0] = SDWORD2(valuePtr[0]);
  v39.i64[1] = SHIDWORD(valuePtr[0]);
  *((float64x2_t *)v9 + 4) = vcvtq_f64_s64(v39);
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  *((_DWORD *)v9 + 24) = 875704422;
  v77 = CFSTR("kCGImageSourceKeepOriginalProfile");
  v78[0] = *MEMORY[0x1E0C9AE50];
  v41 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
  v42 = CGImageSourceCreateWithData((CFDataRef)a3, v41);
  if (v42)
  {
    v43 = v42;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v42, 0, v41);
    if (ImageAtIndex)
    {
      v45 = ImageAtIndex;
      ColorSpace = CGImageGetColorSpace(ImageAtIndex);
      *((_QWORD *)v9 + 11) = CGColorSpaceRetain(ColorSpace);
      CFRelease(v45);
    }
    CFRelease(v43);
  }
  if (!*((_QWORD *)v9 + 11))
  {
    v52 = 0;
    v48 = (FILE **)MEMORY[0x1E0C80C20];
    v51 = (double *)(v9 + 64);
    goto LABEL_72;
  }
  v47 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v48 = (FILE **)MEMORY[0x1E0C80C20];
  if (v47 && (CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    if (!v9[80])
    {
      if (gPLTiledLayerTrace)
        fwrite("Baking in color matching", 0x18uLL, 1uLL, *v48);
      objc_msgSend(v9, "setupConverterForSourceColorSpace:destinationColorSpace:", *((_QWORD *)v9 + 11), v47);
      if (*((_QWORD *)v9 + 15) || *((_QWORD *)v9 + 16))
      {
        *((_DWORD *)v9 + 24) = 1111970369;
        if (v9[80])
          v71 = 1999843442;
        else
          v71 = 1111970369;
        *((_DWORD *)v9 + 25) = v71;
        v52 = 1;
        goto LABEL_69;
      }
    }
    v49 = CGColorSpaceCopyPropertyList(*((CGColorSpaceRef *)v9 + 11));
    if (v49)
    {
      v50 = v49;
      v51 = (double *)(v9 + 64);
      if (gPLTiledLayerTrace)
        fwrite("Doing color conversion at render time", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C20]);
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0CBBF90]);
      CFRelease(v50);
      v52 = 0;
      v48 = (FILE **)MEMORY[0x1E0C80C20];
      goto LABEL_70;
    }
  }
  v52 = 0;
LABEL_69:
  v51 = (double *)(v9 + 64);
LABEL_70:
  CGColorSpaceRelease(v47);
LABEL_72:
  v53 = *v51;
  v54 = v51[1];
  v55 = *((_DWORD *)v9 + 13) * *((_DWORD *)v9 + 13);
  if (*((_DWORD *)v9 + 24) == 875704422)
  {
    v56 = (3 * v55) >> 1;
    v57 = (int)v54 * (int)v53;
    v58 = 3 * v57 / 2;
  }
  else
  {
    v56 = 4 * v55;
    v57 = (int)v54 * (int)v53;
    v58 = 4 * v57;
  }
  v59 = v56 * *((_DWORD *)v9 + 14);
  if (v53 < v54)
    v53 = v51[1];
  v60 = v53 >= 4096.0 || v59 < v58;
  v61 = v60;
  if (v60)
    v62 = 1;
  else
    v62 = v52;
  if (v52 && (v61 & 1) == 0)
  {
    if (*((_DWORD *)v9 + 25) == 875704422)
      v63 = 3 * v57 / 2;
    else
      v63 = 4 * v57;
    v62 = v59 < v63 + v58;
  }
  if (gPLTiledLayerTrace)
    fprintf(*v48, "shouldTileImage: %d", v62);
  v9[81] = v62;
  if (!v62)
  {
    *((_DWORD *)v9 + 14) = 1;
    v64 = *v51;
    if (*v51 < v51[1])
      v64 = v51[1];
    *((_DWORD *)v9 + 13) = (int)v64;
  }
  objc_msgSend(v40, "setObject:forKeyedSubscript:", &unk_1E70C68B0, CFSTR("HighWaterBytes"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", &unk_1E70C68B0, CFSTR("LowWaterBytes"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2 * *((int *)v9 + 14) + 50), CFSTR("HighWaterBufferCount"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2 * *((int *)v9 + 14)), CFSTR("LowWaterBufferCount"));
  if (FigJPEGIOSurfaceImagePoolCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (const __CFDictionary *)v40, (uint64_t *)v9 + 19))
  {
    if (gPLTiledLayerTrace)
    {
      v65 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fprintf(*v65, "FigJPEGIOSurfaceImagePoolCreate: error: %d");
      goto LABEL_101;
    }
    goto LABEL_102;
  }
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, (double)SDWORD2(valuePtr[0]), (double)SHIDWORD(valuePtr[0]));
  *((_QWORD *)v9 + 18) = -[PLCache initWithCountLimit:totalCostLimit:]([PLCache alloc], "initWithCountLimit:totalCostLimit:", *((int *)v9 + 14), 0);
  *((_QWORD *)v9 + 20) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
  *((_QWORD *)v9 + 21) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  *((_DWORD *)v9 + 49) = -1;
  *((_DWORD *)v9 + 56) = 0;
  *((_QWORD *)v9 + 26) = a4;
  if (a4)
  {
    CGImageRetain(a4);
    v67 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    *((_QWORD *)v9 + 25) = v67;
    objc_msgSend(v67, "setContents:", *((_QWORD *)v9 + 26));
    objc_msgSend(*((id *)v9 + 25), "setAllowsDisplayCompositing:", 0);
    objc_msgSend(v9, "frame");
    objc_msgSend(*((id *)v9 + 25), "setFrame:");
    objc_msgSend(*((id *)v9 + 25), "setHidden:", 0);
    objc_msgSend(v9, "addSublayer:", *((_QWORD *)v9 + 25));
    v68 = (double)CGImageGetWidth(*((CGImageRef *)v9 + 26));
    objc_msgSend(v9, "zoomStartScaleForImage:placeholderImageSize:", *v51, v51[1], v68, (double)CGImageGetHeight(*((CGImageRef *)v9 + 26)));
    *((_QWORD *)v9 + 27) = v69;
  }
  if (gPLTiledLayerTrace)
    fprintf(*v48, "zoomStartScale: %f\n", *((double *)v9 + 27));
  v70 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v9 + 232) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v9 + 248) = v70;
  v9[272] = getShowTilePreferences();
  pl_dispatch_async();
  return (PLTiledLayer *)v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  iosPoolOpaque *surfacePool;
  NSObject *decodeQueue;
  NSObject *conversionQueue;
  uint64_t v8;
  uint64_t v9;
  jpegDecoder *decoders;
  NSObject *var1;
  CGColorSpace *colorspace;
  vImageConverter *vimageConverter;
  objc_super v14;

  if (self->_decodeQueue)
  {
    v3 = (void *)PLTiledLayerDecodeQueueSpecific;
    if (dispatch_get_specific((const void *)PLTiledLayerDecodeQueueSpecific) != v3)
      pl_dispatch_sync();
  }
  if (self->_conversionQueue)
  {
    v4 = (void *)PLTiledLayerConversionQueueSpecific;
    if (dispatch_get_specific((const void *)PLTiledLayerConversionQueueSpecific) != v4)
      pl_dispatch_sync();
  }

  surfacePool = self->_surfacePool;
  if (surfacePool)
    CFRelease(surfacePool);
  decodeQueue = self->_decodeQueue;
  if (decodeQueue)
    dispatch_release(decodeQueue);
  conversionQueue = self->_conversionQueue;
  if (conversionQueue)
    dispatch_release(conversionQueue);
  if (self->_decoderCount >= 1)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      decoders = self->_decoders;
      if (decoders[v8].var0)
      {
        applejpeg_decode_destroy();
        decoders = self->_decoders;
      }
      var1 = decoders[v8].var1;
      if (var1)
        dispatch_release(var1);
      ++v9;
      ++v8;
    }
    while (v9 < self->_decoderCount);
  }
  free(self->_decoders);
  CGImageRelease(self->_placeholderImage);
  colorspace = self->_colorspace;
  if (colorspace)
    CFRelease(colorspace);
  vimageConverter = self->_vimageConverter;
  if (vimageConverter)
    CFRelease(vimageConverter);

  v14.receiver = self;
  v14.super_class = (Class)PLTiledLayer;
  -[PLTiledLayer dealloc](&v14, sel_dealloc);
}

- (CGSize)jpegImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullSize.width;
  height = self->_fullSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)flushCache
{
  -[PLCache removeAllObjects](self->_tileCache, "removeAllObjects");
  FigJPEGIOSurfacePoolFlush((uint64_t)self->_surfacePool);
}

- (void)updateSubLayers:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  CGColorSpace *DeviceRGB;
  CGColor *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "visible"))
        {
          v10 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
          if (self->_showTileBorders)
          {
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            v12 = CGColorCreate(DeviceRGB, updateSubLayers__orange);
            objc_msgSend(v10, "setBorderColor:", v12);
            CGColorRelease(v12);
            CGColorSpaceRelease(DeviceRGB);
            objc_msgSend(v10, "setBorderWidth:", 4.0);
          }
          objc_msgSend(v10, "setContents:", objc_msgSend(v9, "decodedSurface"));
          objc_msgSend(v10, "setAllowsDisplayCompositing:", 0);
          objc_msgSend(v9, "imageRect");
          objc_msgSend(v10, "setFrame:");
          objc_msgSend(v10, "setHidden:", 0);
          -[PLTiledLayer addSublayer:](self, "addSublayer:", v10);
          -[NSMutableDictionary setObject:forKey:](self->_subLayers, "setObject:forKey:", v10, objc_msgSend(v9, "tileId"));
        }
        else
        {
          v13 = (void *)-[NSMutableDictionary objectForKey:](self->_subLayers, "objectForKey:", objc_msgSend(v9, "tileId"));
          objc_msgSend(v13, "removeFromSuperlayer");
          objc_msgSend(v13, "setContents:", 0);
          -[NSMutableDictionary removeObjectForKey:](self->_subLayers, "removeObjectForKey:", objc_msgSend(v9, "tileId"));
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)runMetalConversionOnSurface:(__IOSurface *)a3 completionHandler:(id)a4
{
  void *v7;
  size_t Width;
  size_t Height;
  IOSurfaceRef DecodeSurfaceFromPool;
  IOSurfaceRef v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v7 = (void *)MEMORY[0x1BCCC6CF8](self, a2);
  Width = IOSurfaceGetWidth(a3);
  Height = IOSurfaceGetHeight(a3);
  DecodeSurfaceFromPool = createDecodeSurfaceFromPool((uint64_t)self->_surfacePool, self->_conversionPixelFormat, Width, Height);
  if (DecodeSurfaceFromPool)
  {
    v11 = DecodeSurfaceFromPool;
    v12 = (void *)-[MTLCommandQueue commandBuffer](self->_metalCmdQueue, "commandBuffer");
    if (self->_hasExtendedColorDisplay)
      v13 = 554;
    else
      v13 = 80;
    v14 = objc_msgSend((id)getMTLTextureDescriptorClass(), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, Width, Height, 0);
    v15 = (void *)objc_msgSend((id)getMTLTextureDescriptorClass(), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v13, Width, Height, 0);
    objc_msgSend(v15, "setUsage:", 6);
    v16 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_metalDevice, "newTextureWithDescriptor:iosurface:plane:", v14, a3, 0);
    v17 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_metalDevice, "newTextureWithDescriptor:iosurface:plane:", v15, v11, 0);
    -[MPSImageConversion encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_metalConverter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v12, v16, v17);

    v18 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke;
    v21[3] = &unk_1E70B6038;
    v21[4] = a4;
    v21[5] = v11;
    objc_msgSend(v12, "addScheduledHandler:", v21);
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke_2;
    v20[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    v20[4] = a3;
    objc_msgSend(v12, "addCompletedHandler:", v20);
    objc_msgSend(v12, "commit");
    v19 = v12;
    pl_dispatch_async();
  }
  else
  {
    (*((void (**)(id, __IOSurface *))a4 + 2))(a4, a3);
    CFRelease(a3);
  }
  objc_autoreleasePoolPop(v7);
}

- (void)runVImageConversionOnSurface:(__IOSurface *)a3 completionHandler:(id)a4
{
  size_t Width;
  size_t Height;
  IOSurfaceRef DecodeSurfaceFromPool;
  __IOSurface *v10;
  vImageConverter *vimageConverter;
  void *v12;
  void *v13;
  uint64_t v14;
  FILE **v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  Width = IOSurfaceGetWidth(a3);
  Height = IOSurfaceGetHeight(a3);
  DecodeSurfaceFromPool = createDecodeSurfaceFromPool((uint64_t)self->_surfacePool, self->_conversionPixelFormat, Width, Height);
  if (!DecodeSurfaceFromPool)
  {
    (*((void (**)(id, __IOSurface *))a4 + 2))(a4, a3);
LABEL_12:
    CFRelease(a3);
    return;
  }
  v10 = DecodeSurfaceFromPool;
  IOSurfaceLock(a3, 0, 0);
  IOSurfaceLock(v10, 0, 0);
  v18[0] = IOSurfaceGetBaseAddress(a3);
  v18[1] = Height;
  v18[2] = Width;
  v18[3] = IOSurfaceGetBytesPerRow(a3);
  v17[0] = IOSurfaceGetBaseAddress(v10);
  v17[1] = Height;
  v17[2] = Width;
  v17[3] = IOSurfaceGetBytesPerRow(v10);
  vimageConverter = self->_vimageConverter;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v12 = getvImageConvert_AnyToAnySymbolLoc_ptr;
  v22 = getvImageConvert_AnyToAnySymbolLoc_ptr;
  if (!getvImageConvert_AnyToAnySymbolLoc_ptr)
  {
    v13 = AccelerateLibrary();
    v12 = dlsym(v13, "vImageConvert_AnyToAny");
    v20[3] = (uint64_t)v12;
    getvImageConvert_AnyToAnySymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v19, 8);
  if (v12)
  {
    v14 = ((uint64_t (*)(vImageConverter *, _QWORD *, _QWORD *, _QWORD, uint64_t))v12)(vimageConverter, v18, v17, 0, 16);
    IOSurfaceUnlock(a3, 0, 0);
    IOSurfaceUnlock(v10, 0, 0);
    if (v14)
    {
      if (gPLTiledLayerTrace)
      {
        v15 = (FILE **)MEMORY[0x1E0C80C10];
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "-[PLTiledLayer runVImageConversionOnSurface:completionHandler:]");
        fprintf(*v15, "Color conversion failed with error %zd", v14);
        fputc(10, *v15);
      }
      IOSurfaceDecrementUseCount(v10);
      (*((void (**)(id, __IOSurface *))a4 + 2))(a4, a3);
    }
    else
    {
      IOSurfaceDecrementUseCount(a3);
      (*((void (**)(id, __IOSurface *))a4 + 2))(a4, v10);
    }
    CFRelease(v10);
    goto LABEL_12;
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vImage_Error PL_vImageConvert_AnyToAny(const vImageConverterRef, const vImage_Buffer *, const vImage_Buffer *, void *, vImage_Flags)"), CFSTR("PLTiledLayer.m"), 79, CFSTR("%s"), dlerror());
  __break(1u);
}

- (void)decodeImageRectangle:(CGRect)a3 forLevel:(int)a4 requestId:(unsigned int)a5 completionHandler:(id)a6
{
  PLTiledLayer *v7;
  int v8;
  void *v9;
  NSMutableSet *visibleTileIds;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  BOOL v17;
  int v18;
  BOOL v19;
  PLTile *v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  int v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  _QWORD *v28;
  uint64_t *v29;
  PLTiledLayer *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int v35;
  PLTiledLayer *v36;
  int v37;
  NSMutableSet *v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  _QWORD v43[4];
  uint64_t v44;
  _QWORD v45[5];
  uint64_t v46;
  _QWORD v47[5];
  uint64_t v48;
  _QWORD v49[8];
  CGRect v50;
  _DWORD v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v57 = *MEMORY[0x1E0C80C00];
  if (!self->_err)
  {
    v7 = self;
    v37 = self->_tilePixelSize << a4;
    v8 = (int)(a3.origin.x / (double)v37);
    v40 = (int)(a3.origin.y / (double)v37);
    v41 = (int)((a3.origin.x + a3.size.width + -1.0) / (double)v37);
    v39 = (int)((a3.origin.y + a3.size.height + -1.0) / (double)v37);
    v38 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v36 = v7;
    visibleTileIds = v7->_visibleTileIds;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](visibleTileIds, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v53;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(visibleTileIds);
          v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
          v16 = (int *)objc_msgSend(v15, "bytes");
          if (v16[2] == a4
            && (*v16 >= v8 ? (v17 = *v16 <= v41) : (v17 = 0),
                v17 && ((v18 = v16[1], v18 >= v40) ? (v19 = v18 <= v39) : (v19 = 0), v19)))
          {
            -[NSMutableSet addObject:](v38, "addObject:", v15);
          }
          else
          {
            v20 = objc_alloc_init(PLTile);
            -[PLTile setVisible:](v20, "setVisible:", 0);
            -[PLTile setTileId:](v20, "setTileId:", v15);
            objc_msgSend(v9, "addObject:", v20);

          }
          ++v14;
        }
        while (v12 != v14);
        v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](visibleTileIds, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        v12 = v21;
      }
      while (v21);
    }
    v22 = a5;
    if (v8 <= v41)
    {
      v35 = 0;
      v33 = &v44;
      do
      {
        if (v7->_requestId != v22)
          break;
        v23 = v40;
        if (v40 <= v39)
        {
          v24 = v40 * v37;
          do
          {
            if (v7->_requestId != v22)
              break;
            v51[2] = a4;
            v51[0] = v8;
            v51[1] = v23;
            v25 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v51, 12);
            v26 = -[PLCache objectForKey:](v7->_tileCache, "objectForKey:", v25);
            if ((-[NSMutableSet containsObject:](v7->_visibleTileIds, "containsObject:", v25) & 1) == 0)
            {
              if (v26)
              {
                objc_msgSend(v26, "setVisible:", 1);
                os_unfair_lock_lock(&v7->_lock);
                objc_msgSend(v9, "addObject:", v26);
                -[NSMutableSet addObject:](v38, "addObject:", v25);
                os_unfair_lock_unlock(&v7->_lock);
              }
              else
              {
                v58.origin.y = (double)v24;
                v60.size.width = v7->_fullSize.width;
                v60.size.height = v7->_fullSize.height;
                v60.origin.x = 0.0;
                v60.origin.y = 0.0;
                v58.origin.x = (double)(v8 * v37);
                v58.size.width = (double)v37;
                v58.size.height = (double)v37;
                v59 = CGRectIntersection(v58, v60);
                if ((int)v59.size.width)
                  v27 = (int)v59.size.height == 0;
                else
                  v27 = 1;
                if (!v27)
                {
                  v49[0] = MEMORY[0x1E0C809B0];
                  v49[1] = 3221225472;
                  v49[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke;
                  v49[3] = &unk_1E70B6080;
                  v50 = v59;
                  v49[4] = v25;
                  v49[5] = v7;
                  v49[6] = v9;
                  v49[7] = v38;
                  if (v7->_metalConverter)
                  {
                    v47[0] = MEMORY[0x1E0C809B0];
                    v47[1] = 3221225472;
                    v47[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_2;
                    v47[3] = &unk_1E70B60A8;
                    v28 = v47;
                    v29 = &v48;
                    v47[4] = v7;
                  }
                  else if (v7->_vimageConverter)
                  {
                    v45[0] = MEMORY[0x1E0C809B0];
                    v45[1] = 3221225472;
                    v45[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_3;
                    v45[3] = &unk_1E70B60A8;
                    v28 = v45;
                    v29 = &v46;
                    v45[4] = v7;
                  }
                  else
                  {
                    v43[0] = MEMORY[0x1E0C809B0];
                    v43[1] = 3221225472;
                    v28 = v43;
                    v29 = v33;
                    v43[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_4;
                    v43[3] = &unk_1E70B60D0;
                  }
                  ++v35;
                  *v29 = (uint64_t)v49;
                  v7 = v36;
                  v42 = (void *)objc_msgSend(v28, "copy", v33);
                  v22 = a5;
                  pl_dispatch_async();

                }
              }
            }
            ++v23;
            v24 += v37;
          }
          while (v39 + 1 != v23);
        }
        v27 = v8++ == v41;
      }
      while (!v27);
    }
    v30 = v7;
    if (v7->_decoderCount >= 1)
    {
      v31 = 0;
      v32 = 8;
      do
      {
        pl_dispatch_sync();
        ++v31;
        v32 += 16;
      }
      while (v31 < v30->_decoderCount);
    }
    pl_dispatch_sync();
    if (v30->_requestId == a5)
    {

      v30->_visibleTileIds = v38;
      v30->_zoomLevel = a4;
      pl_dispatch_async();
    }
    else
    {

    }
  }
}

- (void)removeAllTiles
{
  self->_visibleTileIds = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
  pl_dispatch_async();
}

- (BOOL)visibleTileRegionHasChanged:(CGRect)a3 level:(int)a4
{
  unsigned int shouldTile;
  double v5;
  double x;
  int v7;
  double y;
  BOOL result;

  shouldTile = self->_shouldTile;
  if (self->_shouldTile)
  {
    v5 = *(double *)&sZoomLevelScaleFactor;
    shouldTile = -1;
    do
    {
      v5 = v5 * 0.5;
      ++shouldTile;
    }
    while (v5 > self->_lastZoomScale);
  }
  if (shouldTile >= 3)
    shouldTile = 3;
  result = shouldTile != a4
        || (x = self->_lastVisibleRect.origin.x, v7 = self->_tilePixelSize << a4, (int)a3.origin.x / v7 != (int)x / v7)
        || (y = self->_lastVisibleRect.origin.y, (int)a3.origin.y / v7 != (int)y / v7)
        || (int)(a3.origin.x + a3.size.width + -1.0) / v7 != (int)(x + self->_lastVisibleRect.size.width + -1.0) / v7
        || (int)(a3.origin.y + a3.size.height + -1.0) / v7 != (int)(y + self->_lastVisibleRect.size.height + -1.0) / v7;
  return result;
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  unsigned int shouldTile;
  double v13;
  uint64_t v14;
  BOOL v15;
  unsigned int *p_requestId;
  unsigned int v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  shouldTile = self->_shouldTile;
  if (self->_shouldTile)
  {
    v13 = *(double *)&sZoomLevelScaleFactor;
    shouldTile = -1;
    do
    {
      v13 = v13 * 0.5;
      ++shouldTile;
    }
    while (v13 > a4);
  }
  if (shouldTile >= 3)
    v14 = 3;
  else
    v14 = shouldTile;
  v15 = -[PLTiledLayer visibleTileRegionHasChanged:level:](self, "visibleTileRegionHasChanged:level:", v14, x, a3.origin.y, a3.size.width, a3.size.height);
  self->_lastVisibleRect.origin.x = x;
  self->_lastVisibleRect.origin.y = y;
  self->_lastVisibleRect.size.width = width;
  self->_lastVisibleRect.size.height = height;
  self->_lastZoomScale = a4;
  if (!v15)
  {
    if (!a5)
      return;
    goto LABEL_14;
  }
  p_requestId = &self->_requestId;
  do
    v17 = __ldaxr(p_requestId);
  while (__stlxr(v17 + 1, p_requestId));
  if (self->_zoomStartScale >= a4 || !self->_err)
LABEL_14:
    pl_dispatch_async();
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4
{
  -[PLTiledLayer setVisibleRectangle:zoomScale:completionHandler:](self, "setVisibleRectangle:zoomScale:completionHandler:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

uint64_t __64__PLTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllTiles");
}

uint64_t __64__PLTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeImageRectangle:forLevel:requestId:completionHandler:", *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __30__PLTiledLayer_removeAllTiles__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "objectForKey:", v7);
        objc_msgSend(v8, "removeFromSuperlayer");
        objc_msgSend(v8, "setContents:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "removeObjectForKey:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  PLTile *v4;

  v4 = objc_alloc_init(PLTile);
  -[PLTile setDecodedSurface:](v4, "setDecodedSurface:", a2);
  -[PLTile setVisible:](v4, "setVisible:", 1);
  -[PLTile setTileId:](v4, "setTileId:", *(_QWORD *)(a1 + 32));
  -[PLTile setImageRect:](v4, "setImageRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 224));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 224));

}

uint64_t __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "runMetalConversionOnSurface:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "runVImageConversionOnSurface:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

void __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_4(uint64_t a1, const void *a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(a2);
}

void __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;
  double v6;
  double v7;
  __IOSurface *DecodeSurfaceFromPool;
  __IOSurface *v9;
  FILE **v10;
  FILE **v11;
  FILE **v12;
  int PlaneCount;
  int v14;
  FILE **v15;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 88) == *(_DWORD *)(v1 + 192))
  {
    v3 = *(_QWORD *)(v1 + 152);
    v4 = *(_DWORD *)(a1 + 92);
    v5 = *(_DWORD *)(v1 + 96);
    v6 = *(double *)(a1 + 72);
    v7 = *(double *)(a1 + 80);
    applejpeg_decode_options_init();
    DecodeSurfaceFromPool = createDecodeSurfaceFromPool(v3, v5, (int)v6 / (1 << v4), (int)v7 / (1 << v4));
    if (DecodeSurfaceFromPool)
    {
      v9 = DecodeSurfaceFromPool;
      if (v5 == 875704422)
      {
        IOSurfaceGetBytesPerRowOfPlane(DecodeSurfaceFromPool, 0);
        IOSurfaceGetBytesPerRowOfPlane(v9, 1uLL);
      }
      else
      {
        if (v5 != 1111970369)
        {
          if (gPLTiledLayerTrace)
          {
            v12 = (FILE **)MEMORY[0x1E0C80C10];
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "createDecodedTileSurface");
            fwrite("Unsupported format", 0x12uLL, 1uLL, *v12);
            goto LABEL_20;
          }
LABEL_21:
          IOSurfaceDecrementUseCount(v9);
          CFRelease(v9);
          return;
        }
        IOSurfaceGetBytesPerRow(DecodeSurfaceFromPool);
      }
      if (!applejpeg_decode_set_options())
      {
        PlaneCount = IOSurfaceGetPlaneCount(v9);
        IOSurfaceLock(v9, 0, 0);
        if (PlaneCount < 2)
        {
          IOSurfaceGetBaseAddress(v9);
        }
        else
        {
          IOSurfaceGetBaseAddressOfPlane(v9, 0);
          IOSurfaceGetBaseAddressOfPlane(v9, 1uLL);
        }
        v14 = applejpeg_decode_image_all();
        IOSurfaceUnlock(v9, 0, 0);
        if (!v14 || !gPLTiledLayerTrace)
        {
          if (!v14)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
            return;
          }
          goto LABEL_21;
        }
        v15 = (FILE **)MEMORY[0x1E0C80C10];
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "createDecodedTileSurface");
        fprintf(*v15, "ffjpeg_decode_image_all: error: %d");
        goto LABEL_20;
      }
      if (gPLTiledLayerTrace)
      {
        v11 = (FILE **)MEMORY[0x1E0C80C10];
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "createDecodedTileSurface");
        fprintf(*v11, "ffjpeg_decode_set_options: error: %d");
LABEL_20:
        fputc(10, (FILE *)*MEMORY[0x1E0C80C10]);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (gPLTiledLayerTrace)
    {
      v10 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "createDecodedTileSurface");
      fwrite("createDecodeSurfaceFromPool failed", 0x22uLL, 1uLL, *v10);
      fputc(10, *v10);
    }
  }
}

uint64_t __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateSubLayers:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke_2(uint64_t a1)
{
  IOSurfaceDecrementUseCount(*(IOSurfaceRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "waitUntilScheduled");

}

dispatch_queue_t __61__PLTiledLayer_initWithJPEGData_placeholderImage_screenSize___block_invoke(uint64_t a1)
{
  dispatch_queue_t result;

  **(_QWORD **)(*(_QWORD *)(a1 + 32) + 40) = applejpeg_decode_create();
  result = dispatch_queue_create("com.apple.coremedia.ajdecodesession", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = result;
  return result;
}

uint64_t __61__PLTiledLayer_initWithJPEGData_placeholderImage_screenSize___block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareForDecoding");
}

@end
