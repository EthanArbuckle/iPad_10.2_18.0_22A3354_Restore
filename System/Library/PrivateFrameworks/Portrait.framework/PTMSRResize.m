@implementation PTMSRResize

- (id)targetRGBA
{
  return -[NSArray lastObject](self->_pyramidRGBA, "lastObject");
}

- (int)queryCapabilities
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  int v9;

  v3 = *MEMORY[0x1E0CBBAA8];
  v4 = IOServiceMatching("AppleM2ScalerCSCDriver");
  MatchingService = IOServiceGetMatchingService(v3, v4);
  if (!MatchingService)
    return 0;
  v6 = MatchingService;
  v7 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("IOSurfaceAcceleratorCapabilitiesDict"), 0, 0);
  if (v7)
  {
    v8 = v7;
    if (FigCFDictionaryGetInt32IfPresent(v7, CFSTR("IOSurfaceAcceleratorFilterHorizontalTapsCount"), &self->_cap)&& FigCFDictionaryGetInt32IfPresent(v8, CFSTR("IOSurfaceAcceleratorFilterVerticalTapsCount"), &self->_cap.vTaps)&& FigCFDictionaryGetInt32IfPresent(v8, CFSTR("IOSurfaceAcceleratorFilterHorizontalPhasesCount"), &self->_cap.hPhases)&& FigCFDictionaryGetInt32IfPresent(v8, CFSTR("IOSurfaceAcceleratorFilterVerticalPhasesCount"), &self->_cap.vPhases)&& FigCFDictionaryGetInt32IfPresent(v8, CFSTR("IOSurfaceAcceleratorFilterCoefficientsPrePointBits"), &self->_cap.prePointBits)
      && FigCFDictionaryGetInt32IfPresent(v8, CFSTR("IOSurfaceAcceleratorFilterCoefficientsPostPointBits"), &self->_cap.postPointBits))
    {
      v9 = 0;
    }
    else
    {
      v9 = -1;
    }
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  IOObjectRelease(v6);
  return v9;
}

- (PTMSRResize)initWithMetalContext:(id)a3 inputSize:(id *)a4 targetSize:(id *)a5 rotateTargetPixelBuffer:(BOOL)a6 sRGB:(BOOL)a7 sharedResources:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  PTMSRResize *v17;
  uint64_t v18;
  NSMutableArray *additionalSteps;
  int var0;
  int var1;
  uint64_t v22;
  uint64_t v23;
  __CVBuffer **outputPixelbuffer;
  uint64_t v25;
  size_t v26;
  unint64_t v27;
  int allocatedIOSurfaces;
  unint64_t v29;
  signed int v31;
  signed int v32;
  IOSurfaceRef IOSurface;
  __IOSurface *v34;
  CGColorSpace *v35;
  CFPropertyListRef v36;
  const void *v37;
  PTMSRResize *v38;
  NSObject *v39;
  uint64_t v41;
  void *v42;
  size_t Width;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSArray *pyramidRGBA;
  NSObject *v49;
  NSObject *v50;
  __IOSurface *v51;
  NSObject *v52;
  _BOOL4 v53;
  id v54;
  id v55;
  const __CFString *key;
  __CFString *keya;
  uint64_t v58;
  __IOSurface **outputIOSurface;
  const __CFAllocator *allocator;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];

  v9 = a7;
  v10 = a6;
  v64[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  v17 = -[PTMSRResize init](self, "init");
  if (!v17)
  {
    v38 = 0;
    goto LABEL_36;
  }
  v53 = v10;
  v54 = v16;
  v55 = v15;
  PTKTraceInit();
  objc_storeStrong((id *)&v17->_metalContext, a3);
  v17->_sRGB = v9;
  v18 = objc_opt_new();
  additionalSteps = v17->_additionalSteps;
  v17->_additionalSteps = (NSMutableArray *)v18;

  var0 = a4->var0;
  var1 = a4->var1;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v22 = *MEMORY[0x1E0CA8FF0];
  v23 = *MEMORY[0x1E0CA8F68];
  outputPixelbuffer = v17->_outputPixelbuffer;
  v25 = 192;
  if (v9)
    v25 = 200;
  v58 = v25;
  outputIOSurface = v17->_outputIOSurface;
  key = (const __CFString *)*MEMORY[0x1E0CBBF90];
  while (1)
  {
    v26 = var0;
    v27 = a5->var0;
    if (a5->var0 == var0)
      break;
    allocatedIOSurfaces = v17->_allocatedIOSurfaces;
LABEL_10:
    if (!allocatedIOSurfaces)
      goto LABEL_21;
    v29 = a5->var1;
    if ((double)var0 / 3.0 >= (double)v27 || (double)var1 / 3.0 >= (double)v29)
    {
      v31 = vcvtps_s32_f32((float)var0 * 0.5);
      if (v27 <= v31)
        LODWORD(v27) = v31;
      v32 = vcvtps_s32_f32((float)var1 * 0.5);
      if (v29 <= v32)
        LODWORD(v29) = v32;
    }
    if (allocatedIOSurfaces >= 10)
      -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:].cold.6();
    var0 = v27;
    var1 = v29;
LABEL_22:
    v63[0] = v22;
    v63[1] = v23;
    v64[0] = MEMORY[0x1E0C9AA70];
    v64[1] = &unk_1E8252088;
    if (CVPixelBufferCreate(allocator, var0, var1, 0x42475241u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2), &outputPixelbuffer[v17->_allocatedIOSurfaces]))
    {
      _PTLogSystem();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:].cold.1();
LABEL_33:
      v38 = 0;
LABEL_34:
      v16 = v54;
      v15 = v55;
      goto LABEL_35;
    }
    IOSurface = CVPixelBufferGetIOSurface(outputPixelbuffer[v17->_allocatedIOSurfaces]);
    outputIOSurface[v17->_allocatedIOSurfaces] = IOSurface;
    if (!IOSurface)
    {
      _PTLogSystem();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:].cold.1();
      goto LABEL_33;
    }
    v34 = IOSurface;
    v35 = *(Class *)((char *)&v17->super.isa + v58);
    if (v35)
    {
      v36 = CGColorSpaceCopyPropertyList(v35);
      if (v36)
      {
        v37 = v36;
        IOSurfaceSetValue(v34, key, v36);
        CFRelease(v37);
      }
    }
    ++v17->_allocatedIOSurfaces;
  }
  allocatedIOSurfaces = v17->_allocatedIOSurfaces;
  if (a5->var1 != var1)
    goto LABEL_10;
  if (!allocatedIOSurfaces)
  {
LABEL_21:
    var0 = SLODWORD(a4->var0) / 2;
    var1 = SLODWORD(a4->var1) / 2;
    goto LABEL_22;
  }
  keya = (__CFString *)objc_opt_new();
  if (v17->_allocatedIOSurfaces < 1)
  {
LABEL_41:
    v39 = keya;
    v47 = -[__CFString copy](keya, "copy");
    pyramidRGBA = v17->_pyramidRGBA;
    v17->_pyramidRGBA = (NSArray *)v47;

    v17->_rotateTargetPixelBuffer = v53;
    if (v53 && v17->_hasMSR)
    {
      v61[0] = v22;
      v61[1] = v23;
      v62[0] = MEMORY[0x1E0C9AA70];
      v62[1] = &unk_1E8252088;
      if (CVPixelBufferCreate(allocator, var1, v26, 0x42475241u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2), &outputPixelbuffer[v17->_allocatedIOSurfaces]))
      {
        _PTLogSystem();
        v49 = objc_claimAutoreleasedReturnValue();
        v16 = v54;
        v15 = v55;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:].cold.1();

LABEL_47:
        v38 = 0;
        goto LABEL_35;
      }
      v51 = CVPixelBufferGetIOSurface(outputPixelbuffer[v17->_allocatedIOSurfaces]);
      outputIOSurface[v17->_allocatedIOSurfaces] = v51;
      if (!v51)
      {
        _PTLogSystem();
        v52 = objc_claimAutoreleasedReturnValue();
        v16 = v54;
        v15 = v55;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:].cold.4();

        goto LABEL_47;
      }
      PTIOSurfaceSetColorSpace(v51, *(CGColorSpaceRef *)((char *)&v17->super.isa + v58));
      ++v17->_allocatedIOSurfaces;
    }
    v38 = v17;
    goto LABEL_34;
  }
  v41 = 0;
  while (1)
  {
    v42 = (void *)MEMORY[0x1E0CC6BB0];
    Width = CVPixelBufferGetWidth(outputPixelbuffer[v41]);
    objc_msgSend(v42, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 81, Width, CVPixelBufferGetHeight(outputPixelbuffer[v41]), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setUsage:", +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", outputPixelbuffer[v41]) | 3);
    -[PTMetalContext device](v17->_metalContext, "device");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "newTextureWithDescriptor:iosurface:plane:", v44, CVPixelBufferGetIOSurface(outputPixelbuffer[v41]), 0);

    if (!v46)
      break;
    -[__CFString addObject:](keya, "addObject:", v46);

    if (++v41 >= v17->_allocatedIOSurfaces)
      goto LABEL_41;
  }
  _PTLogSystem();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:].cold.3(v50);

  v38 = 0;
  v16 = v54;
  v15 = v55;
  v39 = keya;
LABEL_35:

LABEL_36:
  return v38;
}

- (id)pyramidRGBA
{
  return self->_pyramidRGBA;
}

- (__CVBuffer)targetRGBAPixelBuffer
{
  return (__CVBuffer *)*((_QWORD *)&self->super.isa + self->_allocatedIOSurfaces);
}

- (PTMSRResize)init
{
  PTMSRResize *v2;
  NSObject *v3;
  PTMSRResize *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTMSRResize;
  v2 = -[PTMSRResize init](&v6, sel_init);
  if (v2)
  {
    v2->_hasMSR = MGGetBoolAnswer();
    v2->_allocatedIOSurfaces = 0;
    v2->_runOptions = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v2->_csRGBLinear = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D990]);
    v2->_csSRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    if (v2->_hasMSR)
    {
      if (IOSurfaceAcceleratorCreate())
      {
        _PTLogSystem();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          -[PTMSRResize init].cold.1();

        goto LABEL_7;
      }
      -[PTMSRResize queryCapabilities](v2, "queryCapabilities");
    }
    v4 = v2;
    goto LABEL_10;
  }
LABEL_7:
  v4 = 0;
LABEL_10:

  return v4;
}

- (__CVBuffer)addAdditionalOutput:(id *)a3
{
  uint64_t v5;
  unint64_t var0;
  void *v7;
  unint64_t var1;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  PTMSRResizeAdditionalOutput *v24;
  uint64_t v25;
  uint64_t v26;
  PTMSRResizeAdditionalOutput *v27;
  __CVBuffer *v29;
  __int128 v30;
  unint64_t var2;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_allocatedIOSurfaces < 1)
  {
LABEL_10:
    v16 = 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      var0 = a3->var0;
      -[NSArray objectAtIndexedSubscript:](self->_pyramidRGBA, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (var0 == objc_msgSend(v7, "width"))
      {
        var1 = a3->var1;
        -[NSArray objectAtIndexedSubscript:](self->_pyramidRGBA, "objectAtIndexedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "height");

        if (var1 == v10)
          return self->_outputPixelbuffer[v5];
      }
      else
      {

      }
      v11 = a3->var0;
      -[NSArray objectAtIndexedSubscript:](self->_pyramidRGBA, "objectAtIndexedSubscript:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 > objc_msgSend(v12, "width"))
        break;
      v13 = a3->var1;
      -[NSArray objectAtIndexedSubscript:](self->_pyramidRGBA, "objectAtIndexedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "height");

      if (v13 > v15)
        goto LABEL_12;
      if (++v5 >= self->_allocatedIOSurfaces)
        goto LABEL_10;
    }

LABEL_12:
    if ((int)v5 <= 1)
      v17 = 1;
    else
      v17 = v5;
    v16 = (v17 - 1);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self->_additionalSteps;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v23, "pixelbuffer")) == a3->var0
          && CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v23, "pixelbuffer")) == a3->var1)
        {
          v29 = (__CVBuffer *)objc_msgSend(v23, "pixelbuffer");

          return v29;
        }
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v20)
        continue;
      break;
    }
  }

  v24 = [PTMSRResizeAdditionalOutput alloc];
  v25 = 200;
  if (!self->_sRGB)
    v25 = 192;
  v26 = *(uint64_t *)((char *)&self->super.isa + v25);
  v30 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v27 = -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:](v24, "initWithSize:colorSpace:", &v30, v26);
  -[PTMSRResizeAdditionalOutput setSourcePyramidIndex:](v27, "setSourcePyramidIndex:", v16);
  -[NSMutableArray addObject:](self->_additionalSteps, "addObject:", v27);
  v29 = -[PTMSRResizeAdditionalOutput pixelbuffer](v27, "pixelbuffer");

  return v29;
}

- (void)dealloc
{
  int allocatedIOSurfaces;
  uint64_t v4;
  __CVBuffer **outputPixelbuffer;
  __CVBuffer *v6;
  __IOSurfaceAccelerator *accelRef;
  objc_super v8;

  CFRelease(self->_runOptions);
  CFRelease(self->_csRGBLinear);
  CFRelease(self->_csSRGB);
  allocatedIOSurfaces = self->_allocatedIOSurfaces;
  if (allocatedIOSurfaces >= 1)
  {
    v4 = 0;
    outputPixelbuffer = self->_outputPixelbuffer;
    do
    {
      v6 = outputPixelbuffer[v4];
      if (v6)
      {
        CVPixelBufferRelease(v6);
        outputPixelbuffer[v4] = 0;
        allocatedIOSurfaces = self->_allocatedIOSurfaces;
      }
      ++v4;
    }
    while (v4 < allocatedIOSurfaces);
  }
  accelRef = self->_accelRef;
  if (accelRef)
    CFRelease(accelRef);
  v8.receiver = self;
  v8.super_class = (Class)PTMSRResize;
  -[PTMSRResize dealloc](&v8, sel_dealloc);
}

- (int)setCustomFilter:(int)a3 alignment:(int)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 destinationWidth:(unint64_t)a7 destinationHeight:(unint64_t)a8 luma_param:(float)a9 chroma_param:(float)a10
{
  unsigned int *v19;
  unsigned int *v20;
  int vTaps;
  int vPhases;
  unsigned int *v23;
  unsigned int *v24;
  int hTaps;
  int hPhases;
  unsigned int *v27;
  int prePointBits;
  int postPointBits;
  float v30;
  int v31;
  int v33;
  int v34;
  unsigned int *v35;
  unsigned int *v36;
  int v37;

  v19 = (unsigned int *)malloc_type_calloc(1uLL, 8 * (self->_cap.hPhases * self->_cap.hTaps + self->_cap.vPhases * self->_cap.vTaps), 0x100004052888210uLL);
  if (!v19)
    return -536870211;
  v20 = v19;
  if (a3 == 3)
  {
    filter_coefficients(self->_cap.vTaps, self->_cap.vPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v19, (float)a8 / (float)a6);
    vTaps = self->_cap.vTaps;
    vPhases = self->_cap.vPhases;
    v23 = &v20[vPhases * vTaps];
    filter_coefficients(vTaps, vPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v23, (float)a8 / (float)a6);
    v24 = &v23[self->_cap.vPhases * self->_cap.vTaps];
    filter_coefficients(self->_cap.hTaps, self->_cap.hPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v24, (float)a7 / (float)a5);
    hTaps = self->_cap.hTaps;
    hPhases = self->_cap.hPhases;
    v27 = &v24[hPhases * hTaps];
    prePointBits = self->_cap.prePointBits;
    postPointBits = self->_cap.postPointBits;
    v30 = (float)a7 / (float)a5;
    v31 = 3;
  }
  else
  {
    filter_coefficients(self->_cap.vTaps, self->_cap.vPhases, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v19, a10);
    v33 = self->_cap.vTaps;
    v34 = self->_cap.vPhases;
    v35 = &v20[v34 * v33];
    filter_coefficients(v33, v34, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v35, a9);
    v36 = &v35[self->_cap.vPhases * self->_cap.vTaps];
    filter_coefficients(self->_cap.hTaps, self->_cap.hPhases, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v36, a10);
    hTaps = self->_cap.hTaps;
    hPhases = self->_cap.hPhases;
    v27 = &v36[hPhases * hTaps];
    prePointBits = self->_cap.prePointBits;
    postPointBits = self->_cap.postPointBits;
    v30 = a9;
    v31 = a3;
  }
  filter_coefficients(hTaps, hPhases, v31, a4, prePointBits, postPointBits, v27, v30);
  v37 = IOSurfaceAcceleratorSetCustomFilter();
  free(v20);
  return v37;
}

- (unsigned)downsampleToQuarterSize:(__CVBuffer *)a3
{
  unsigned int v5;
  NSObject *v7;
  NSObject *v8;

  if (self->_allocatedIOSurfaces)
  {
    if (self->_hasMSR)
    {
      kdebug_trace();
      v5 = -[PTMSRResize _downsample:toDest:useCustomFilter:centerAlignment:synchronous:](self, "_downsample:toDest:useCustomFilter:centerAlignment:synchronous:", CVPixelBufferGetIOSurface(a3), self->_outputIOSurface[0], 1, 0, 1);
      kdebug_trace();
      return v5;
    }
    else
    {
      _PTLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PTMSRResize downsampleToQuarterSize:].cold.2();

      return -1;
    }
  }
  else
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTMSRResize downsampleToQuarterSize:].cold.1();

    return -10;
  }
}

- (int)downsampleToLayer:(int)a3
{
  if (self->_allocatedIOSurfaces - 1 == a3 && self->_rotateTargetPixelBuffer)
    return -[PTMSRResize _rotate:toDest:synchronous:](self, "_rotate:toDest:synchronous:", self->_outputPixelbuffer[a3 + 9], self->_outputIOSurface[a3], 0);
  else
    return -[PTMSRResize _downsample:toDest:useCustomFilter:centerAlignment:synchronous:](self, "_downsample:toDest:useCustomFilter:centerAlignment:synchronous:", self->_outputPixelbuffer[a3 + 9], self->_outputIOSurface[a3], 1, 1, 0);
}

- (unsigned)downsampleQuarterSizeToTargetSize:(__CVBuffer *)a3
{
  uint64_t v4;
  int v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  NSObject *v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_allocatedIOSurfaces)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTMSRResize downsampleToQuarterSize:].cold.1();

    return -10;
  }
  if (!self->_hasMSR)
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTMSRResize downsampleToQuarterSize:].cold.2();

    return 0;
  }
  kdebug_trace();
  if (self->_allocatedIOSurfaces < 2)
  {
LABEL_7:
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_additionalSteps;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = -[PTMSRResize _downsample:toDest:useCustomFilter:centerAlignment:synchronous:](self, "_downsample:toDest:useCustomFilter:centerAlignment:synchronous:", self->_outputIOSurface[(int)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sourcePyramidIndex", (_QWORD)v18)], objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "ioSurface"), 1, 1, 0);
          if (v11)
          {
            v13 = v11;
            _PTLogSystem();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[PTMSRResize downsampleQuarterSizeToTargetSize:].cold.3();

            return v13;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          continue;
        break;
      }
    }

    kdebug_trace();
    return 0;
  }
  v4 = 1;
  while (1)
  {
    v5 = -[PTMSRResize downsampleToLayer:](self, "downsampleToLayer:", v4);
    if (v5)
      break;
    v4 = (v4 + 1);
    if ((int)v4 >= self->_allocatedIOSurfaces)
      goto LABEL_7;
  }
  v13 = v5;
  _PTLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[PTMSRResize downsampleQuarterSizeToTargetSize:].cold.4((uint64_t)self, v4, v16);

  return v13;
}

- (int)_rotate:(__IOSurface *)a3 toDest:(__IOSurface *)a4 synchronous:(BOOL)a5
{
  const void *v6;

  v6 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A328], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A280], v6);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A340], (const void *)*MEMORY[0x1E0C9AE40]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A330], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 4));
  return IOSurfaceAcceleratorTransformSurface();
}

- (unsigned)rotate:(__IOSurface *)a3 crop:(int)a4 rotationDegree:(__IOSurface *)a5 toDest:(BOOL)a6 synchronous:
{
  __int128 v6;
  const void *v11;
  unsigned int v12;
  uint64_t v13;
  __int128 v15;

  v15 = v6;
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A328], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A280], v11);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A340], (const void *)*MEMORY[0x1E0C9AE40]);
  if (a4)
  {
    if (a4 == 180)
      v12 = 3;
    else
      v12 = 7;
    if (a4 == 90)
      v13 = 4;
    else
      v13 = v12;
    CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A330], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13, v15));
  }
  else
  {
    CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A330]);
  }
  IOSurfaceGetWidth(a3);
  IOSurfaceGetHeight(a3);
  IOSurfaceGetWidth(a3);
  IOSurfaceGetHeight(a3);
  IOSurfaceGetWidth(a5);
  IOSurfaceGetHeight(a5);
  return IOSurfaceAcceleratorTransformSurface();
}

- (int)_downsample:(__IOSurface *)a3 toDest:(__IOSurface *)a4 useCustomFilter:(BOOL)a5 centerAlignment:(BOOL)a6 synchronous:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  const void *v12;
  const void *v13;
  uint64_t v14;
  size_t Width;
  size_t Height;
  size_t v17;
  size_t v18;
  double v19;
  double v20;

  v7 = a6;
  v8 = a5;
  v12 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A328], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A280], v12);
  if (v8)
    v13 = v12;
  else
    v13 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A340], v13);
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A330]);
  if (v8)
  {
    if (v7)
      v14 = 2;
    else
      v14 = 0;
    Width = IOSurfaceGetWidth(a3);
    Height = IOSurfaceGetHeight(a3);
    v17 = IOSurfaceGetWidth(a4);
    v18 = IOSurfaceGetHeight(a4);
    LODWORD(v19) = 2143289344;
    LODWORD(v20) = 2143289344;
    -[PTMSRResize setCustomFilter:alignment:sourceWidth:sourceHeight:destinationWidth:destinationHeight:luma_param:chroma_param:](self, "setCustomFilter:alignment:sourceWidth:sourceHeight:destinationWidth:destinationHeight:luma_param:chroma_param:", 3, v14, Width, Height, v17, v18, v19, v20);
  }
  return IOSurfaceAcceleratorTransformSurface();
}

- (__CVBuffer)pyramidRGBAPixelBuffer
{
  return self->_outputPixelbuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSteps, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_pyramidRGBA, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15(&dword_1C9281000, v0, v1, "IOSurfaceAcceleratorCreate failed %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "IOSurface not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(os_log_t)log inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "tex";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "IOSurface not found. Rotation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.6()
{
  __assert_rtn("-[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:]", "PTMSRResize.m", 467, "_allocatedIOSurfaces < MAX_DOWNSAMPLING_STEPS");
}

- (void)downsampleToQuarterSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "IOSurfaces is not initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)downsampleToQuarterSize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "No MSR support", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)downsampleQuarterSizeToTargetSize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15(&dword_1C9281000, v0, v1, "MSR additional steps failed %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)downsampleQuarterSizeToTargetSize:(os_log_t)log .cold.4(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(a1 + 217);
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "MSR failed %i %i", (uint8_t *)v4, 0xEu);
}

@end
