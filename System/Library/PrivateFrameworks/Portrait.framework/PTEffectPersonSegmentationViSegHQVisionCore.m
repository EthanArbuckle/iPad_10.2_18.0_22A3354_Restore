@implementation PTEffectPersonSegmentationViSegHQVisionCore

- (PTEffectPersonSegmentationViSegHQVisionCore)initWithMetalContext:(id)a3 colorSize:(CGSize)a4
{
  double height;
  double width;
  id v8;
  PTEffectPersonSegmentationViSegHQVisionCore *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *asyncDispatchQueue;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *semaphore;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  void **v21;
  void **v22;
  PTEffectPersonSegmentationViSegHQVisionCore *v23;
  void *v24;
  id *v25;
  id *v26;
  NSObject *v27;
  uint64_t context;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t k;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Class *v45;
  Class v46;
  BOOL v47;
  uint64_t plan;
  void *v49;
  id v50;
  int v51;
  int version;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __CVBuffer **pixelBufferMatting;
  MTLTexture **textureMatting;
  char v94;
  char v95;
  __CVBuffer *v96;
  void *v97;
  uint64_t v98;
  MTLTexture *v99;
  int v100;
  NSObject *v101;
  uint64_t v102;
  id *p_metalContext;
  id v104;
  const __CFAllocator *allocator;
  void *v106;
  NSObject *v107;
  PTEffectPersonSegmentationViSegHQVisionCore *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117;
  char v118[7];
  id v119;
  objc_super v120;
  _QWORD v121[2];
  _QWORD v122[2];
  _BYTE v123[128];
  _BYTE buf[32];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  uint8_t v134[128];
  uint8_t v135[4];
  _BYTE *v136;
  __int16 v137;
  int v138;
  id v139;
  id v140;
  id v141;
  uint64_t v142;

  height = a4.height;
  width = a4.width;
  v142 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v120.receiver = self;
  v120.super_class = (Class)PTEffectPersonSegmentationViSegHQVisionCore;
  v9 = -[PTEffectPersonSegmentationViSegHQVisionCore init](&v120, sel_init);
  if (!v9)
  {
    v23 = 0;
    goto LABEL_30;
  }
  kdebug_trace();
  v10 = dispatch_queue_create("com.apple.portrait.PTEffectPersonSegmentationViSegHQVisionCore", 0);
  asyncDispatchQueue = v9->asyncDispatchQueue;
  v9->asyncDispatchQueue = (OS_dispatch_queue *)v10;

  objc_storeStrong((id *)&v9->_metalContext, a3);
  v12 = dispatch_semaphore_create(1);
  semaphore = v9->_semaphore;
  v9->_semaphore = (OS_dispatch_semaphore *)v12;

  _PTLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 2;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 0;
    _os_log_impl(&dword_1C9281000, v14, OS_LOG_TYPE_INFO, "ViSegHQ version %i %i", buf, 0xEu);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6CB8]), "initWithMajor:minor:", 2, 0);
  v16 = +[PTEffectUtil closestAspectRatio:](PTEffectUtil, "closestAspectRatio:", width, height);
  v139 = 0;
  v140 = 0;
  v141 = 0;
  if (v16 == 1)
  {
    v17 = (id *)MEMORY[0x1E0DC6DB8];
    v18 = (id *)MEMORY[0x1E0DC6DA0];
    v19 = (id *)MEMORY[0x1E0DC6D98];
    v20 = (id *)MEMORY[0x1E0DC6D80];
    v21 = (void **)MEMORY[0x1E0DC6D78];
    v22 = (void **)MEMORY[0x1E0DC6D60];
  }
  else
  {
    if (v16 != 2)
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.1();
      goto LABEL_26;
    }
    v17 = (id *)MEMORY[0x1E0DC6DB0];
    v18 = (id *)MEMORY[0x1E0DC6DA8];
    v19 = (id *)MEMORY[0x1E0DC6D90];
    v20 = (id *)MEMORY[0x1E0DC6D88];
    v21 = (void **)MEMORY[0x1E0DC6D70];
    v22 = (void **)MEMORY[0x1E0DC6D68];
  }
  if (width < height)
    v21 = v22;
  v24 = *v21;
  if (width >= height)
    v25 = v19;
  else
    v25 = v20;
  if (width >= height)
    v26 = v17;
  else
    v26 = v18;
  v139 = v24;
  v140 = *v25;
  v141 = *v26;
  +[PTInference ANEConfigForSynchronousWork](PTInference, "ANEConfigForSynchronousWork");
  v27 = objc_claimAutoreleasedReturnValue();
  -[NSObject espressoEngine](v27, "espressoEngine");
  context = espresso_create_context();
  v9->_context = (void *)context;
  if (!context)
  {
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.2(v29);
    goto LABEL_25;
  }
  if (espresso_context_set_low_precision_accumulation())
  {
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.9(v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_25:

LABEL_26:
    v37 = 0;
    v23 = 0;
    goto LABEL_27;
  }
  p_metalContext = (id *)&v9->_metalContext;
  v104 = v8;
  v40 = 0;
  v41 = 0;
  v107 = v27;
  v42 = -1800;
  v106 = v15;
  do
  {
    v43 = (uint64_t)*(&v139 + v41);
    v119 = 0;
    objc_msgSend(MEMORY[0x1E0DC6D10], "descriptorForIdentifier:version:error:", v43, v15, &v119, p_metalContext);
    v44 = objc_claimAutoreleasedReturnValue();
    v37 = v119;
    v45 = &v9->super.isa + v41;
    v46 = v45[225];
    v45[225] = (Class)v44;

    if (v45[225])
      v47 = v37 == 0;
    else
      v47 = 0;
    if (!v47)
    {
      _PTLogSystem();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v37;
        _os_log_error_impl(&dword_1C9281000, v55, OS_LOG_TYPE_ERROR, "Error getting SegmentationInferenceNetworkDescriptor for %@ (%@). Error %@", buf, 0x20u);
      }

      goto LABEL_58;
    }
    plan = espresso_create_plan();
    v45[2] = (Class)plan;
    if (!plan)
    {
      _PTLogSystem();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.3();
      goto LABEL_57;
    }
    -[NSObject espressoPlanPriority](v107, "espressoPlanPriority");
    if (espresso_plan_set_priority())
    {
      _PTLogSystem();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.8(v57);
      goto LABEL_57;
    }
    -[objc_class URL](v45[225], "URL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "path");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v50, "UTF8String");
    v51 = espresso_plan_add_network();

    if (v51)
    {
      _PTLogSystem();
      v57 = objc_claimAutoreleasedReturnValue();
      v15 = v106;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.7(v41, (id *)((char *)&v9->super.isa - v42), v57);
LABEL_57:

      v37 = 0;
LABEL_58:
      v23 = 0;
LABEL_59:
      v27 = v107;
      goto LABEL_27;
    }
    version = espresso_network_get_version();
    _PTLogSystem();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (version)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.6(&v117, v118, v54);
    }
    else if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v135 = 136315394;
      v136 = buf;
      v137 = 1024;
      v138 = v41;
      _os_log_debug_impl(&dword_1C9281000, v54, OS_LOG_TYPE_DEBUG, "PersonSegmentation network version: %s subtype %i", v135, 0x12u);
    }

    v15 = v106;
    if (espresso_plan_build())
    {
      _PTLogSystem();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.5(v58);

      v37 = 0;
      v23 = 0;
      goto LABEL_59;
    }
    ++v41;
    v40 += 16;
    v42 -= 8;
  }
  while (v41 != 3);
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v59 = objc_msgSend(&unk_1E8252F48, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v114 != v61)
          objc_enumerationMutation(&unk_1E8252F48);
        v63 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i);
        objc_msgSend(&unk_1E8252F48, "objectForKeyedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (uint64_t)v9->_ebuffer[(int)objc_msgSend(v64, "intValue")];
        -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBufferFromNetwork:name:isInput:](v9, "createEspressoBufferFromNetwork:name:isInput:", 2, v63, 1);
        v66 = *(_OWORD *)buf;
        v67 = v125;
        *(_OWORD *)(v65 + 16) = *(_OWORD *)&buf[16];
        *(_OWORD *)(v65 + 32) = v67;
        *(_OWORD *)v65 = v66;
        v68 = v126;
        v69 = v127;
        v70 = v129;
        *(_OWORD *)(v65 + 80) = v128;
        *(_OWORD *)(v65 + 96) = v70;
        *(_OWORD *)(v65 + 48) = v68;
        *(_OWORD *)(v65 + 64) = v69;
        v71 = v130;
        v72 = v131;
        v73 = v132;
        *(_QWORD *)(v65 + 160) = v133;
        *(_OWORD *)(v65 + 128) = v72;
        *(_OWORD *)(v65 + 144) = v73;
        *(_OWORD *)(v65 + 112) = v71;

      }
      v60 = objc_msgSend(&unk_1E8252F48, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
    }
    while (v60);
  }
  v108 = v9;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v74 = objc_msgSend(&unk_1E8252F70, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v110;
    do
    {
      for (j = 0; j != v75; ++j)
      {
        if (*(_QWORD *)v110 != v76)
          objc_enumerationMutation(&unk_1E8252F70);
        v78 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * j);
        objc_msgSend(&unk_1E8252F70, "objectForKeyedSubscript:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (uint64_t)v9->_ebuffer[(int)objc_msgSend(v79, "intValue")];
        -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBufferFromNetwork:name:isInput:](v9, "createEspressoBufferFromNetwork:name:isInput:", 2, v78, 0);
        v81 = *(_OWORD *)buf;
        v82 = *(_OWORD *)&buf[16];
        *(_OWORD *)(v80 + 200) = v125;
        *(_OWORD *)(v80 + 184) = v82;
        *(_OWORD *)(v80 + 168) = v81;
        v83 = v126;
        v84 = v127;
        v85 = v128;
        *(_OWORD *)(v80 + 264) = v129;
        *(_OWORD *)(v80 + 248) = v85;
        *(_OWORD *)(v80 + 232) = v84;
        *(_OWORD *)(v80 + 216) = v83;
        v86 = v130;
        v87 = v131;
        v88 = v132;
        *(_QWORD *)(v80 + 328) = v133;
        *(_OWORD *)(v80 + 296) = v87;
        *(_OWORD *)(v80 + 312) = v88;
        *(_OWORD *)(v80 + 280) = v86;

      }
      v75 = objc_msgSend(&unk_1E8252F70, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
    }
    while (v75);
  }
  memset(buf, 0, 24);
  +[PTEffectPersonSegmentationViSegHQVisionCore segmentationSizeForColorSize:](PTEffectPersonSegmentationViSegHQVisionCore, "segmentationSizeForColorSize:", width, height);
  v89 = 0;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v90 = *MEMORY[0x1E0CA8FF0];
  v91 = *MEMORY[0x1E0CA8F68];
  pixelBufferMatting = v9->_pixelBufferMatting;
  textureMatting = v9->_textureMatting;
  v94 = 1;
  do
  {
    v95 = v94;
    v121[0] = v90;
    v121[1] = v91;
    v122[0] = MEMORY[0x1E0C9AA70];
    v122[1] = &unk_1E82523A0;
    CVPixelBufferCreate(allocator, *(size_t *)buf, *(size_t *)&buf[8], 0x4C303068u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 2), &pixelBufferMatting[v89]);
    v96 = pixelBufferMatting[v89];
    objc_msgSend(*p_metalContext, "device");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:", v96, v97);
    v98 = objc_claimAutoreleasedReturnValue();
    v99 = textureMatting[v89];
    textureMatting[v89] = (MTLTexture *)v98;

    v94 = 0;
    v89 = 1;
  }
  while ((v95 & 1) != 0);
  v9 = v108;
  v100 = -[PTEffectPersonSegmentationViSegHQVisionCore reset](v108, "reset");
  objc_msgSend(v106, "major");
  objc_msgSend(v106, "minor");
  kdebug_trace();
  if (v100)
  {
    _PTLogSystem();
    v101 = objc_claimAutoreleasedReturnValue();
    v8 = v104;
    v27 = v107;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.4(v100, v101, v102);

    v23 = 0;
    v15 = v106;
  }
  else
  {
    v23 = v108;
    v8 = v104;
    v15 = v106;
    v27 = v107;
  }
  v37 = 0;
LABEL_27:

  for (k = 16; k != -8; k -= 8)
LABEL_30:

  return v23;
}

- (void)dealloc
{
  uint64_t i;
  uint64_t v4;
  char v5;
  char v6;
  char *v7;
  uint64_t j;
  objc_super v9;

  for (i = 16; i != 40; i += 8)
    espresso_plan_destroy();
  espresso_context_destroy();
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    CVPixelBufferRelease(self->_pixelBufferMatting[v4]);
    v7 = (char *)self + 168 * v4;
    for (j = 88; j != 1768; j += 336)
      free(*(void **)&v7[j]);
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  v9.receiver = self;
  v9.super_class = (Class)PTEffectPersonSegmentationViSegHQVisionCore;
  -[PTEffectPersonSegmentationViSegHQVisionCore dealloc](&v9, sel_dealloc);
}

- ($FD4688982923A924290ECB669CAF1EC2)createEspressoBufferFromNetwork:(SEL)a3 name:(int)a4 isInput:(id)a5
{
  _BOOL4 v6;
  id v10;
  VisionCoreVideoSegmentationInferenceNetworkDescriptor *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  $FD4688982923A924290ECB669CAF1EC2 *result;
  id v34;
  id v35;

  v6 = a6;
  v10 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)retstr->var2 = 0u;
  *(_OWORD *)&retstr->var2[2] = 0u;
  *(_OWORD *)retstr->var3 = 0u;
  *(_OWORD *)&retstr->var3[2] = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_QWORD *)&retstr->var14 = 0;
  v11 = self->_viSegHQDescriptor[a4];
  if (v6)
  {
    v35 = 0;
    -[VisionCoreVideoSegmentationInferenceNetworkDescriptor inputNamed:error:](v11, "inputNamed:error:", v10, &v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v35;
    if (v13)
    {
      v14 = v13;
      _PTLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBufferFromNetwork:name:isInput:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_8:

    }
  }
  else
  {
    v34 = 0;
    -[VisionCoreVideoSegmentationInferenceNetworkDescriptor outputNamed:error:](v11, "outputNamed:error:", v10, &v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v34;
    if (v23)
    {
      v14 = v23;
      _PTLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBufferFromNetwork:name:isInput:].cold.1(v15, v24, v25, v26, v27, v28, v29, v30);
      goto LABEL_8;
    }
  }
  objc_msgSend(v12, "shape");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rank");
  v32 = objc_retainAutorelease(v31);
  objc_msgSend(v32, "sizes");
  espresso_buffer_pack_tensor_shape();
  retstr->var0 = malloc_type_calloc(1uLL, objc_msgSend(v12, "storageByteCount"), 0x7AF0D159uLL);

  return result;
}

- (unsigned)reset
{
  IOSurfaceRef IOSurface;
  double v4;
  unsigned int v5;
  IOSurfaceRef v6;
  double v7;
  unsigned int v8;
  NSObject *v9;

  self->_frameCount = 0;
  IOSurface = CVPixelBufferGetIOSurface(self->_pixelBufferMatting[0]);
  LODWORD(v4) = -1.0;
  v5 = -[PTEffectPersonSegmentationViSegHQVisionCore clearIOSurface:tensorType:value:](self, "clearIOSurface:tensorType:value:", IOSurface, 0, v4);
  v6 = CVPixelBufferGetIOSurface(self->_pixelBufferMatting[1]);
  LODWORD(v7) = 0;
  v8 = -[PTEffectPersonSegmentationViSegHQVisionCore clearIOSurface:tensorType:value:](self, "clearIOSurface:tensorType:value:", v6, 0, v7) | v5;
  bzero(self->_ebuffer[4][0].data, self->_ebuffer[4][0].stride[3]);
  bzero(self->_ebuffer[1][1].data, self->_ebuffer[4][0].stride[3]);
  if (v8)
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore reset].cold.1();

  }
  return v8;
}

- (unsigned)clearIOSurface:(__IOSurface *)a3 tensorType:(int)a4 value:(float)a5
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  uint64_t v11;
  uint64_t i;
  NSObject *v19;
  NSObject *v20;

  if (!a3)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore clearIOSurface:tensorType:value:].cold.1();

    return -1;
  }
  _S8 = a5;
  if (IOSurfaceGetPixelFormat(a3) != 1278226536)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore clearIOSurface:tensorType:value:].cold.2(a3, v20);

    return -1;
  }
  IOSurfaceLock(a3, 0, 0);
  Width = IOSurfaceGetWidth(a3);
  Height = IOSurfaceGetHeight(a3);
  BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a3);
  if (Height)
  {
    v11 = 0;
    __asm { FCVT            H0, S8 }
    do
    {
      if (Width)
      {
        for (i = 0; i != Width; ++i)
          *(_WORD *)&BaseAddress[2 * i] = _H0;
      }
      BaseAddress += BytesPerRow;
      ++v11;
    }
    while (v11 != Height);
  }
  IOSurfaceUnlock(a3, 0, 0);
  return 0;
}

- (id)runPersonSegmentationForPixelBuffer:(__CVBuffer *)a3
{
  int frameCount;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  BOOL v64;
  char v65;
  int v66;
  int v67;
  int v68;
  int v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSObject *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  NSObject *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  MTLTexture *v167;
  _QWORD v169[5];
  int v170;

  frameCount = self->_frameCount;
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);
  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!frameCount)
  {
    objc_msgSend(CFSTR("input_image"), "UTF8String");
    if (espresso_network_bind_cvpixelbuffer())
    {
      _PTLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
    objc_msgSend(CFSTR("mask"), "UTF8String");
    if (espresso_network_bind_cvpixelbuffer())
    {
      _PTLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    objc_msgSend(CFSTR("hidden_state"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _PTLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    }
    objc_msgSend(CFSTR("hidden"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _PTLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);

    }
    objc_msgSend(CFSTR("key"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _PTLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);

    }
    objc_msgSend(CFSTR("value"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _PTLogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v46, v47, v48, v49, v50, v51, v52, v53);

    }
    if (espresso_plan_execute_sync())
    {
      _PTLogSystem();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v54, v55, v56, v57, v58, v59, v60, v61);

    }
  }
  v62 = self->_frameCount;
  v63 = v62 + 1;
  self->_frameCount = v62 + 1;
  v64 = __OFADD__(v62, 2);
  v62 += 2;
  v65 = (v62 < 0) ^ v64;
  v66 = v62 & 1;
  if (v65)
    v67 = -v66;
  else
    v67 = v66;
  v68 = v63 % 5;
  if (v63 % 5)
    v69 = 1;
  else
    v69 = 2;
  objc_msgSend(CFSTR("input_image"), "UTF8String");
  if (espresso_network_bind_cvpixelbuffer())
  {
    _PTLogSystem();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v70, v71, v72, v73, v74, v75, v76, v77);

  }
  objc_msgSend(CFSTR("input_matting"), "UTF8String");
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    _PTLogSystem();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v78, v79, v80, v81, v82, v83, v84, v85);

  }
  objc_msgSend(CFSTR("input_prob"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v86, v87, v88, v89, v90, v91, v92, v93);

  }
  objc_msgSend(CFSTR("prev_key"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    _PTLogSystem();
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v94, v95, v96, v97, v98, v99, v100, v101);

  }
  objc_msgSend(CFSTR("prev_value"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    _PTLogSystem();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v102, v103, v104, v105, v106, v107, v108, v109);

  }
  objc_msgSend(CFSTR("hidden_state"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    _PTLogSystem();
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v110, v111, v112, v113, v114, v115, v116, v117);

  }
  objc_msgSend(CFSTR("output_matting"), "UTF8String");
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    _PTLogSystem();
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v118, v119, v120, v121, v122, v123, v124, v125);

  }
  objc_msgSend(CFSTR("output"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    _PTLogSystem();
    v126 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v126, v127, v128, v129, v130, v131, v132, v133);

  }
  objc_msgSend(CFSTR("hidden"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    _PTLogSystem();
    v134 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v134, v135, v136, v137, v138, v139, v140, v141);

  }
  if (!v68)
  {
    objc_msgSend(CFSTR("key"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _PTLogSystem();
      v142 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v142, v143, v144, v145, v146, v147, v148, v149);

    }
    objc_msgSend(CFSTR("value"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _PTLogSystem();
      v150 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v150, v151, v152, v153, v154, v155, v156, v157);

    }
  }
  v169[0] = MEMORY[0x1E0C809B0];
  v169[1] = 3221225472;
  v169[2] = __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke;
  v169[3] = &unk_1E822A6A0;
  v170 = v69;
  v169[4] = self;
  v158 = (void *)MEMORY[0x1CAA3AE80](v169);
  if (espresso_plan_submit())
  {
    _PTLogSystem();
    v159 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:].cold.1(v159, v160, v161, v162, v163, v164, v165, v166);

  }
  v167 = self->_textureMatting[v67];

  return v167;
}

uint64_t __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke(uint64_t a1, int *a2)
{
  NSObject *v4;

  if (a2)
  {
    _PTLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke_cold_1(a2, v4);

  }
  if (*(_DWORD *)(a1 + 40) == 2)
    objc_msgSend(*(id *)(a1 + 32), "postProcessUpdateFrame");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1832));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1784), "width");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1784), "height");
  return kdebug_trace();
}

- (__CVBuffer)outputPixelbuffer
{
  int frameCount;
  BOOL v3;
  char v4;
  int v5;

  frameCount = self->_frameCount;
  v3 = __OFADD__(frameCount++, 1);
  v4 = (frameCount < 0) ^ v3;
  v5 = frameCount & 1;
  if (v4)
    v5 = -v5;
  return self->_pixelBufferMatting[v5];
}

- (void)postProcessUpdateFrame
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1C9281000, v1, OS_LOG_TYPE_ERROR, "postProcessing error %@ success %i", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSizeForColorSize:(SEL)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  NSObject *v10;
  float64x2_t v12;

  v12 = *(float64x2_t *)&a4.height;
  result = +[PTEffectUtil closestAspectRatio:](PTEffectUtil, "closestAspectRatio:");
  if (result == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)2)
  {
    v6 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v12, (float64x2_t)a4).i64[0], 0);
    v7 = (int8x16_t)xmmword_1C9323400;
    v8 = (int8x16_t)xmmword_1C9323410;
    goto LABEL_5;
  }
  if (result == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)1)
  {
    v6 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v12, (float64x2_t)a4).i64[0], 0);
    v7 = (int8x16_t)xmmword_1C9323420;
    v8 = (int8x16_t)xmmword_1C9323430;
LABEL_5:
    v9 = vbslq_s8(v6, v8, v7);
    goto LABEL_9;
  }
  _PTLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[PTEffectPersonSegmentationViSegHQVisionCore segmentationSizeForColorSize:].cold.1(v10, a4.width, v12.f64[0]);

  v9 = (int8x16_t)xmmword_1C9323400;
LABEL_9:
  *(int8x16_t *)&retstr->var0 = v9;
  retstr->var2 = 1;
  return result;
}

- (id)debugTextures
{
  int frameCount;
  BOOL v3;
  char v4;
  int v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  frameCount = self->_frameCount;
  v3 = __OFADD__(frameCount++, 1);
  v4 = (frameCount < 0) ^ v3;
  v5 = frameCount & 1;
  if (v4)
    v5 = -v5;
  v7[0] = self->_textureMatting[v5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t v4;
  MTLTexture **v5;

  objc_storeStrong((id *)&self->asyncDispatchQueue, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_viSegHQDescriptor[i + 2], 0);
  v4 = 0;
  v5 = &self->_textureMatting[1];
  do
    objc_storeStrong((id *)&v5[v4--], 0);
  while (v4 != -2);
}

- (void)initWithMetalContext:colorSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Unsupported aspect ratio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(NSObject *)a1 colorSize:.cold.2(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, v2, "Error creating espresso context %s", v3);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:colorSize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Error creating espresso plan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:.cold.4(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_6_0(&dword_1C9281000, a2, a3, "Error during reset %i", (uint8_t *)v3);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(NSObject *)a1 colorSize:.cold.5(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, v2, "Espresso error building plan: %s", v3);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:(os_log_t)log colorSize:.cold.6(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "unknown version of espresso model loaded", buf, 2u);
}

- (void)initWithMetalContext:(NSObject *)a3 colorSize:.cold.7(int a1, id *a2, NSObject *a3)
{
  uint64_t last_error;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  last_error = espresso_get_last_error();
  objc_msgSend(*a2, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = last_error;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a1;
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "Error espresso plan add network: %s for %@ subtype %i", (uint8_t *)&v8, 0x1Cu);

}

- (void)initWithMetalContext:(NSObject *)a1 colorSize:.cold.8(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, v2, "Error espresso set priority: %s", v3);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createEspressoBufferFromNetwork:(uint64_t)a3 name:(uint64_t)a4 isInput:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Error resetting segmentation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)clearIOSurface:tensorType:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "iosurface not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)clearIOSurface:(__IOSurface *)a1 tensorType:(NSObject *)a2 value:.cold.2(__IOSurface *a1, NSObject *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109120;
  v4[1] = IOSurfaceGetPixelFormat(a1);
  OUTLINED_FUNCTION_6_0(&dword_1C9281000, a2, v3, "Unsupported pixelformat %ul", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

- (void)runPersonSegmentationForPixelBuffer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)a1 + 1);
  v3 = *a1;
  v4 = a1[1];
  v5 = 136315650;
  v6 = v2;
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "espresso_plan_submit callback. %s %i %i", (uint8_t *)&v5, 0x18u);
  OUTLINED_FUNCTION_1();
}

+ (void)segmentationSizeForColorSize:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Unknown aspect ratio for (%f x %f)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
