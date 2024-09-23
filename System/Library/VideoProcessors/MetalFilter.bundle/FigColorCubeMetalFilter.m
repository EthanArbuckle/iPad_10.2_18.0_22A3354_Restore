@implementation FigColorCubeMetalFilter

- (int)prewarm
{
  return 0;
}

- (int)setup
{
  return 0;
}

+ (int)createCubeTexture:(id *)a3 ofSize:(int)a4 cubesCount:(int)a5 textureType:(unint64_t)a6 withDevice:(id)a7
{
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  id v27;
  int v28;

  v11 = a7;
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
    v14 = 0;
    goto LABEL_12;
  }
  v12 = (void *)objc_opt_new();
  v14 = v12;
  if (!v12)
    goto LABEL_14;
  switch(a6)
  {
    case 2uLL:
      objc_msgSend_setTextureType_(v12, v13, 2);
      objc_msgSend_setHeight_(v14, v19, (a4 * a4));
      objc_msgSend_setWidth_(v14, v20, a4);
      break;
    case 3uLL:
      objc_msgSend_setTextureType_(v12, v13, 3);
      objc_msgSend_setHeight_(v14, v21, (a4 * a4));
      objc_msgSend_setWidth_(v14, v22, a4);
      objc_msgSend_setArrayLength_(v14, v23, a5);
      break;
    case 7uLL:
      objc_msgSend_setTextureType_(v12, v13, 7);
      objc_msgSend_setHeight_(v14, v15, a4);
      objc_msgSend_setWidth_(v14, v16, a4);
      objc_msgSend_setDepth_(v14, v17, a4);
      break;
    default:
      v28 = -1;
      goto LABEL_12;
  }
  objc_msgSend_setPixelFormat_(v14, v18, 70);
  objc_msgSend_setUsage_(v14, v24, 7);
  v26 = (void *)objc_msgSend_newTextureWithDescriptor_(v11, v25, (uint64_t)v14);
  if (!v26)
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
    goto LABEL_12;
  }
  v27 = objc_retainAutorelease(v26);
  *a3 = v27;

  v28 = 0;
LABEL_12:

  return v28;
}

+ (int)loadCube:(id)a3 ofSize:(int)a4 intoTexture:(id)a5 toSliceIndex:(int)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  int v31;
  _QWORD v33[6];
  _QWORD v34[6];
  vImage_Buffer dest;
  vImage_Buffer src;

  v9 = a3;
  v10 = a5;
  v13 = objc_msgSend_length(v9, v11, v12);
  v16 = (a4 * a4);
  if (16 * a4 * v16 == v13)
  {
    objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v14, (uint64_t)v13 >> 2);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (void *)objc_msgSend_mutableBytes(v17, v18, v19);
    v21 = objc_retainAutorelease(v9);
    src.data = (void *)objc_msgSend_bytes(v21, v22, v23);
    src.height = (a4 * a4);
    src.width = 4 * a4;
    src.rowBytes = 4 * src.width;
    dest.data = v20;
    dest.height = src.height;
    dest.width = src.width;
    dest.rowBytes = src.width;
    vImageConvert_PlanarFtoPlanar8(&src, &dest, 1.0, 0.0, 0);

    v9 = v17;
  }
  if (objc_msgSend_length(v9, v14, v15) != (int)v16 * (uint64_t)(4 * a4))
    goto LABEL_10;
  v24 = objc_retainAutorelease(v9);
  v27 = objc_msgSend_bytes(v24, v25, v26);
  if (objc_msgSend_textureType(v10, v28, v29) != 7)
  {
    memset(v33, 0, 24);
    v33[3] = a4;
    v33[4] = (a4 * a4);
    v33[5] = 1;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v10, v30, (uint64_t)v33, 0, a6, v27, 4 * a4, 0);
    goto LABEL_8;
  }
  if (a6)
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    v31 = FigSignalErrorAt();
    goto LABEL_9;
  }
  memset(v34, 0, 24);
  v34[3] = a4;
  v34[4] = a4;
  v34[5] = a4;
  objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v10, v30, (uint64_t)v34, 0, 0, v27, 4 * a4, 4 * v16);
LABEL_8:
  v31 = 0;
LABEL_9:

  return v31;
}

- (NSString)debugDescription
{
  return (NSString *)CFSTR("FigColorCubeMetalFilter");
}

- (FigColorCubeMetalFilter)init
{
  return (FigColorCubeMetalFilter *)MEMORY[0x24BEDD108](self, sel_initWithCommandQueue_, 0);
}

- (FigColorCubeMetalFilter)initWithCommandQueue:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t inited;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  _DWORD *v22;
  __int128 v23;
  void *v24;
  FigColorCubeMetalFilter *v25;
  int v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FigColorCubeMetalFilter;
  v5 = -[FigColorCubeMetalFilter init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1488];
    v7 = objc_opt_class();
    objc_msgSend_bundleForClass_(v6, v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BE11A10]);
    inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v10, v11, (uint64_t)v9, v4);
    v13 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = inited;

    v16 = (void *)*((_QWORD *)v5 + 1);
    if (v16)
    {
      objc_msgSend_commandQueue(v16, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v5 + 66);
      *((_QWORD *)v5 + 66) = v17;

      *((_QWORD *)v5 + 2) = 540;
      objc_msgSend_device(*((void **)v5 + 1), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      MTLPixelFormatGetInfoForDevice();

      byte_253E50C30 = 1;
      v5[504] = 0;
      v22 = malloc_type_malloc(0x14uLL, 0x1000040742B88DAuLL);
      *((_QWORD *)v5 + 67) = v22;
      *(_QWORD *)v22 = 0x100000020;
      v22[3] = 0;
      *((_BYTE *)v22 + 16) = 0;
      v23 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
      *(_OWORD *)(v5 + 568) = *MEMORY[0x24BDBF070];
      *(_OWORD *)(v5 + 584) = v23;
      *((_DWORD *)v5 + 115) = 0;
      *((_DWORD *)v5 + 125) = 0;

    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v27 = FigSignalErrorAt();

      v24 = 0;
      if (v27)
        goto LABEL_5;
    }
  }
  v24 = v5;
LABEL_5:
  v25 = v24;

  return v25;
}

- (int)finishProcessing
{
  uint64_t v2;

  objc_msgSend_waitForIdle(self->_metal, a2, v2);
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  const char *v4;
  uint64_t v5;
  int result;

  if (objc_msgSend_createKernels(self, a2, *(uint64_t *)&a3)
    || (result = objc_msgSend_allocateResources(self, v4, v5)) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  int result;

  result = objc_msgSend_createKernels(self, a2, (uint64_t)a3);
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)allocateResources
{
  uint64_t v2;
  uint64_t v3;
  $C7AD2F4C285567854F02E01F06575F34 *filterDescriptor;
  uint64_t var1;
  uint64_t var0;
  void *v8;
  const char *v9;
  int CubeTexture_ofSize_cubesCount_textureType_withDevice;
  MTLTexture *v11;
  MTLTexture *v12;
  MTLTexture *v13;
  $C7AD2F4C285567854F02E01F06575F34 *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  MTLTexture *v21;
  const char *v22;
  uint64_t v23;
  $C7AD2F4C285567854F02E01F06575F34 *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  MTLTexture *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  $C7AD2F4C285567854F02E01F06575F34 *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  MTLTexture *v39;
  $C7AD2F4C285567854F02E01F06575F34 *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  MTLTexture *v45;
  MTLTexture *v46;
  $C7AD2F4C285567854F02E01F06575F34 *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  MTLTexture *v54;
  MTLTexture *v55;
  $C7AD2F4C285567854F02E01F06575F34 *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  MTLTexture *v63;
  MTLTexture *v64;
  $C7AD2F4C285567854F02E01F06575F34 *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  MTLTexture *v72;
  const char *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  MTLTexture *v78;
  MTLTexture *v79;
  MTLTexture *v80;
  MTLTexture *v81;
  MTLTexture *v82;
  MTLTexture *v83;
  MTLTexture *v84;
  id v85;

  filterDescriptor = self->_filterDescriptor;
  var1 = filterDescriptor->var1;
  self->_isSingleFgCube = (_DWORD)var1 == 1;
  v85 = 0;
  var0 = filterDescriptor->var0;
  objc_msgSend_device(self->_metal, a2, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v9, (uint64_t)&v85, var0, var1, 3, v8);
  v11 = (MTLTexture *)v85;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
LABEL_24:
    FigDebugAssert3();
    goto LABEL_25;
  }
  v12 = self->_fgCubesTexture[0];
  self->_fgCubesTexture[0] = v11;
  v13 = v11;

  v84 = v13;
  v14 = self->_filterDescriptor;
  v15 = v14->var0;
  v16 = v14->var1;
  objc_msgSend_device(self->_metal, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v20, (uint64_t)&v84, v15, v16, 3, v19);
  v21 = v84;
  v11 = v84;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_fgCubesTexture[1], v21);
  if (!self->_isSingleFgCube)
    goto LABEL_7;
  v83 = v11;
  v24 = self->_filterDescriptor;
  v25 = v24->var0;
  v26 = v24->var1;
  objc_msgSend_device(self->_metal, v22, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v28, (uint64_t)&v83, v25, v26, 7, v27);
  v29 = v83;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
LABEL_20:
    FigDebugAssert3();
    v11 = v29;
LABEL_25:
    objc_msgSend_releaseResources(self, v74, v75, v76, v77);
    goto LABEL_14;
  }
  v30 = self->_fgCubesTextureTemp[0];
  self->_fgCubesTextureTemp[0] = v29;
  v31 = v29;

  v82 = v31;
  v32 = self->_filterDescriptor;
  v33 = v32->var0;
  v34 = v32->var1;
  objc_msgSend_device(self->_metal, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v38, (uint64_t)&v82, v33, v34, 7, v37);
  v39 = v82;
  v11 = v82;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_fgCubesTextureTemp[1], v39);
LABEL_7:
  v40 = self->_filterDescriptor;
  if (!v40->var2)
  {
    CubeTexture_ofSize_cubesCount_textureType_withDevice = 0;
    goto LABEL_14;
  }
  v81 = v11;
  v41 = v40->var0;
  v42 = v40->var1;
  objc_msgSend_device(self->_metal, v22, v23);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v44, (uint64_t)&v81, v41, v42, 2, v43);
  v29 = v81;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
    goto LABEL_20;
  }
  v45 = self->_bgCubeTexture[0];
  self->_bgCubeTexture[0] = v29;
  v46 = v29;

  v80 = v46;
  v47 = self->_filterDescriptor;
  v48 = v47->var0;
  v49 = v47->var1;
  objc_msgSend_device(self->_metal, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v53, (uint64_t)&v80, v48, v49, 2, v52);
  v11 = v80;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
    goto LABEL_24;
  }
  v54 = self->_bgCubeTexture[1];
  self->_bgCubeTexture[1] = v11;
  v55 = v11;

  v79 = v55;
  v56 = self->_filterDescriptor;
  v57 = v56->var0;
  v58 = v56->var1;
  objc_msgSend_device(self->_metal, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v62, (uint64_t)&v79, v57, v58, 7, v61);
  v11 = v79;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
    goto LABEL_24;
  }
  v63 = self->_bgCubeTextureTemp[0];
  self->_bgCubeTextureTemp[0] = v11;
  v64 = v11;

  v78 = v64;
  v65 = self->_filterDescriptor;
  v66 = v65->var0;
  v67 = v65->var1;
  objc_msgSend_device(self->_metal, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  CubeTexture_ofSize_cubesCount_textureType_withDevice = objc_msgSend_createCubeTexture_ofSize_cubesCount_textureType_withDevice_(FigColorCubeMetalFilter, v71, (uint64_t)&v78, v66, v67, 7, v70);
  v72 = v78;
  v11 = v78;

  if (CubeTexture_ofSize_cubesCount_textureType_withDevice)
  {
    fig_log_get_emitter();
    v77 = v3;
    v76 = CubeTexture_ofSize_cubesCount_textureType_withDevice;
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_bgCubeTextureTemp[1], v72);
LABEL_14:

  return CubeTexture_ofSize_cubesCount_textureType_withDevice;
}

- (int)setForegroundCubesWithNames:(id)a3 data:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  int v18;
  const char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  const char *v25;
  int Cube_ofSize_intoTexture_toSliceIndex;
  const char *v27;
  uint64_t v28;
  Class *v29;
  int v30;
  _BOOL4 v32;

  v6 = a3;
  v9 = a4;
  if (v6)
  {
    v10 = (void *)MEMORY[0x24BDBF658];
    objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filterWithName_(v10, v12, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_cubeColorSpaceName(v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == (void *)*MEMORY[0x24BDBF228];

    }
    else
    {
      v17 = 1;
    }
    if (objc_msgSend_count(v6, v14, v15) == 1)
      v18 = v17 ^ (self->_filterDescriptor->var3 == 0);
    else
      v18 = 0;
    v32 = v17;

  }
  else
  {
    v32 = 0;
    v18 = 0;
  }
  if (objc_msgSend_count(v9, v7, v8))
  {
    v20 = 0;
    v21 = 0;
    v22 = 424;
    if (v18)
      v22 = 440;
    v23 = (char *)self + v22;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v9, v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      Cube_ofSize_intoTexture_toSliceIndex = objc_msgSend_loadCube_ofSize_intoTexture_toSliceIndex_(FigColorCubeMetalFilter, v25, (uint64_t)v24, self->_filterDescriptor->var0, *(_QWORD *)&v23[8 * (self->_fgCubeToUseIndex ^ 1)], v21);

      if (Cube_ofSize_intoTexture_toSliceIndex)
        break;
      v20 = (v21 + 1);
      v21 = v20;
      if (objc_msgSend_count(v9, v27, v28) <= v20)
        goto LABEL_16;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v30 = 1;
  }
  else
  {
LABEL_16:
    if (v18)
    {
      v29 = &self->super.isa + (self->_fgCubeToUseIndex ^ 1);
      objc_msgSend_convertCubeWithSrcTexture_dstTexture_isP3Cube_(self, v19, (uint64_t)v29[55], v29[53], v32);
    }
    os_unfair_lock_lock(&self->_fgCubesHaveBeenUpdatedLock);
    self->_fgCubesHaveBeenUpdated = 1;
    os_unfair_lock_unlock(&self->_fgCubesHaveBeenUpdatedLock);
    v30 = 0;
  }

  return v30;
}

- (int)setBackgroundCubeWithName:(id)a3 data:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  int v14;
  uint64_t var0;
  BOOL v16;
  int v17;
  uint64_t v18;
  const char *v19;
  Class *v20;

  v6 = a3;
  v8 = a4;
  if (!v8)
  {
    v14 = 0;
    self->_useBgCube = 0;
    goto LABEL_15;
  }
  if (v6)
  {
    objc_msgSend_filterWithName_(MEMORY[0x24BDBF658], v7, (uint64_t)v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_cubeColorSpaceName(v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == (void *)*MEMORY[0x24BDBF228];

    }
    else
    {
      v13 = 1;
    }
    v16 = v13 ^ (self->_filterDescriptor->var3 == 0);

    var0 = self->_filterDescriptor->var0;
    if (v16)
    {
      v17 = 1;
      v18 = 480;
      goto LABEL_11;
    }
  }
  else
  {
    v13 = 0;
    var0 = self->_filterDescriptor->var0;
  }
  v17 = 0;
  v18 = 464;
LABEL_11:
  if (objc_msgSend_loadCube_ofSize_intoTexture_toSliceIndex_(FigColorCubeMetalFilter, v7, (uint64_t)v8, var0, *(Class *)((char *)&self->super.isa + 8 * (self->_bgCubeToUseIndex ^ 1) + v18), 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = 1;
  }
  else
  {
    self->_useBgCube = 1;
    if (v17)
    {
      v20 = &self->super.isa + (self->_bgCubeToUseIndex ^ 1);
      objc_msgSend_convertCubeWithSrcTexture_dstTexture_isP3Cube_(self, v19, (uint64_t)v20[60], v20[58], v13);
    }
    os_unfair_lock_lock(&self->_bgCubesHaveBeenUpdatedLock);
    self->_bgCubesHaveBeenUpdated = 1;
    os_unfair_lock_unlock(&self->_bgCubesHaveBeenUpdatedLock);
    v14 = 0;
  }
LABEL_15:

  return v14;
}

- (void)convertCubeWithSrcTexture:(id)a3 dstTexture:(id)a4 isP3Cube:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BDDD690];
  v9 = a4;
  v10 = a3;
  objc_msgSend_renderPassDescriptor(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandQueue(self->_metal, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v16, v17, v18);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_colorAttachments(v13, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v21, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v23, v24, (uint64_t)v9);

  objc_msgSend_renderCommandEncoderWithDescriptor_(v40, v25, (uint64_t)v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRenderPipelineState_(v26, v27, (uint64_t)self->_cubeConvert[v5]);
  objc_msgSend_fullRangeVertexBuf(self->_metal, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVertexBuffer_offset_atIndex_(v26, v31, (uint64_t)v30, 0, 0);

  objc_msgSend_setFragmentTexture_atIndex_(v26, v32, (uint64_t)v10, 0);
  objc_msgSend_setFragmentBytes_length_atIndex_(v26, v33, (uint64_t)self->_filterDescriptor, 4, 0);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v26, v34, 4, 0, 4);
  objc_msgSend_endEncoding(v26, v35, v36);
  objc_msgSend_setLabel_(v40, v37, (uint64_t)CFSTR("FigColorCube::convert"));
  objc_msgSend_commit(v40, v38, v39);

}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_releaseResources(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)FigColorCubeMetalFilter;
  -[FigColorCubeMetalFilter dealloc](&v4, sel_dealloc);
}

- (int)purgeResources
{
  return 0;
}

- (int)releaseResources
{
  uint64_t v2;
  int v4;
  MTLTexture *v5;
  MTLTexture *v6;
  MTLTexture *v7;
  MTLTexture *v8;
  MTLTexture *v9;
  MTLTexture *v10;
  MTLTexture *v11;
  MTLTexture *v12;

  v4 = objc_msgSend_purgeResources(self, a2, v2);
  v5 = self->_fgCubesTexture[0];
  self->_fgCubesTexture[0] = 0;

  v6 = self->_fgCubesTexture[1];
  self->_fgCubesTexture[1] = 0;

  v7 = self->_fgCubesTextureTemp[0];
  self->_fgCubesTextureTemp[0] = 0;

  v8 = self->_fgCubesTextureTemp[1];
  self->_fgCubesTextureTemp[1] = 0;

  v9 = self->_bgCubeTexture[0];
  self->_bgCubeTexture[0] = 0;

  v10 = self->_bgCubeTexture[1];
  self->_bgCubeTexture[1] = 0;

  v11 = self->_bgCubeTextureTemp[0];
  self->_bgCubeTextureTemp[0] = 0;

  v12 = self->_bgCubeTextureTemp[1];
  self->_bgCubeTextureTemp[1] = 0;

  free(self->_filterDescriptor);
  self->_filterDescriptor = 0;
  return v4;
}

- (int)process
{
  int v2;

  v2 = objc_msgSend_runWithInputPixelBuffer_mattePixelBuffer_outputPixelBuffer_targetRectangle_(self, a2, (uint64_t)self->_inputPixelBuffer, self->_mattePixelbuffer, self->_outputPixelBuffer, self->_targetRectangle.origin.x, self->_targetRectangle.origin.y, self->_targetRectangle.size.width, self->_targetRectangle.size.height);
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2 != 0;
}

- (int)resetState
{
  return 0;
}

- (int)runWithInputPixelBuffer:(__CVBuffer *)a3 mattePixelBuffer:(__CVBuffer *)a4 outputPixelBuffer:(__CVBuffer *)a5 targetRectangle:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  os_unfair_lock_s *p_bgCubesHaveBeenUpdatedLock;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int v19;
  MTLTexture *v20;
  int64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  unint64_t yuvFormat;
  uint64_t v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  OSType PixelFormatType;
  FigMetalContext *metal;
  uint64_t v42;
  _BOOL8 v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  unsigned int v63;
  unsigned int v64;
  float v65;
  float v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  _BOOL8 v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  $C7AD2F4C285567854F02E01F06575F34 *filterDescriptor;
  uint64_t var3;
  _BOOL8 var4;
  uint64_t v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  unsigned int v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  const char *v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  const char *v123;
  void *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  unsigned int v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  int v140;
  MTLTexture **bgCubeTexture;
  void *v143;
  void *v144;
  MTLTexture **fgCubesTexture;
  void *v146;
  uint64_t v147;
  float32x4_t v148;
  unint64_t v149;
  float v150;
  unsigned int v151;
  unsigned int v152;
  float v153;
  float v154;
  float v155;
  uint64_t v156;
  CGRect v157;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v156 = *MEMORY[0x24BDAC8D0];
  p_bgCubesHaveBeenUpdatedLock = &self->_bgCubesHaveBeenUpdatedLock;
  os_unfair_lock_lock(&self->_bgCubesHaveBeenUpdatedLock);
  if (self->_bgCubesHaveBeenUpdated)
  {
    self->_bgCubeToUseIndex ^= 1u;
    self->_bgCubesHaveBeenUpdated = 0;
  }
  os_unfair_lock_unlock(p_bgCubesHaveBeenUpdatedLock);
  os_unfair_lock_lock(&self->_fgCubesHaveBeenUpdatedLock);
  if (self->_fgCubesHaveBeenUpdated)
  {
    self->_fgCubeToUseIndex ^= 1u;
    self->_fgCubesHaveBeenUpdated = 0;
  }
  os_unfair_lock_unlock(&self->_fgCubesHaveBeenUpdatedLock);
  fgCubesTexture = self->_fgCubesTexture;
  v19 = objc_msgSend_width(self->_fgCubesTexture[self->_fgCubeToUseIndex], v15, v16);
  bgCubeTexture = self->_bgCubeTexture;
  v20 = self->_bgCubeTexture[self->_bgCubeToUseIndex];
  if (!v20 || v19 == objc_msgSend_width(v20, v17, v18))
  {
    v21.i64[0] = v19;
    v21.i64[1] = v19 * v19;
    v22 = vcvtq_f64_s64(v21);
    v23.f64[0] = v22.f64[0] + -1.0;
    __asm { FMOV            V3.2D, #1.0 }
    v23.f64[1] = 1.0 / (v22.f64[0] + -1.0);
    v148 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v23), vdivq_f64(_Q3, v22));
    if (byte_253E50C30)
    {
      yuvFormat = 10;
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v17, (uint64_t)a3, 10, 17, 0);
    }
    else
    {
      yuvFormat = self->_yuvFormat;
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v17, (uint64_t)a3, yuvFormat, 17, 0);
    }
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v31 = (void *)v29;
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v30, (uint64_t)a5, yuvFormat, 22, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v140 = FigSignalErrorAt();
        goto LABEL_46;
      }
      v35 = (void *)v32;
      if (byte_253E50C30)
      {
        objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v33, (uint64_t)a3, 30, 17, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v140 = FigSignalErrorAt();
          goto LABEL_45;
        }
        v38 = (void *)v36;
        objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v37, (uint64_t)a5, 30, 22, 1);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v144)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v140 = FigSignalErrorAt();
LABEL_56:

          goto LABEL_45;
        }
        if (a4)
          goto LABEL_16;
      }
      else
      {
        v38 = 0;
        v144 = 0;
        if (a4)
        {
LABEL_16:
          PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
          metal = self->_metal;
          if (PixelFormatType == 1278226536)
          {
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metal, v39, (uint64_t)a4, 25, 17, 0);
            v42 = objc_claimAutoreleasedReturnValue();
            if (!v42)
              goto LABEL_55;
          }
          else
          {
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metal, v39, (uint64_t)a4, 10, 17, 0);
            v42 = objc_claimAutoreleasedReturnValue();
            if (!v42)
            {
LABEL_55:
              fig_log_get_emitter();
              FigDebugAssert3();
              v140 = FigSignalErrorAt();

              goto LABEL_56;
            }
          }
LABEL_22:
          v143 = v38;
          v146 = (void *)v42;
          v44 = self->_useBgCube && v42 != 0;
          v45 = objc_msgSend_height(v35, v33, v34);
          v48 = objc_msgSend_height(v31, v46, v47);
          objc_msgSend_renderPassDescriptor(MEMORY[0x24BDDD690], v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_commandQueue(self->_metal, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_commandBuffer(v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
          {
            v147 = (uint64_t)v35;
            objc_msgSend_fullRangeVertexBuf(self->_metal, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v157.origin.x = x;
            v157.origin.y = y;
            v157.size.width = width;
            v157.size.height = height;
            if (CGRectIsNull(v157))
            {
LABEL_32:
              v82 = v45 > v48;
              objc_msgSend_colorAttachments(v51, v61, v62);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v83, v84, 0);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setTexture_(v85, v86, v147);

              objc_msgSend_renderCommandEncoderWithDescriptor_(v57, v87, (uint64_t)v51);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v88;
              filterDescriptor = self->_filterDescriptor;
              var3 = filterDescriptor->var3;
              var4 = filterDescriptor->var4;
              v94 = 152;
              if (!byte_253E50C30)
                v94 = 24;
              objc_msgSend_setRenderPipelineState_(v88, v89, *(uint64_t *)((char *)&self->super.isa + 64 * v44 + 32 * v82 + 16 * var3 + 8 * var4 + v94));
              objc_msgSend_setVertexBuffer_offset_atIndex_(v90, v95, (uint64_t)v60, 0, 0);
              objc_msgSend_setFragmentTexture_atIndex_(v90, v96, (uint64_t)v31, 0);
              if (byte_253E50C30)
                objc_msgSend_setFragmentTexture_atIndex_(v90, v97, (uint64_t)v143, 1);
              objc_msgSend_setFragmentTexture_atIndex_(v90, v97, (uint64_t)fgCubesTexture[self->_fgCubeToUseIndex], 2);
              if (v44)
              {
                objc_msgSend_setFragmentTexture_atIndex_(v90, v98, (uint64_t)bgCubeTexture[self->_bgCubeToUseIndex], 3);
                objc_msgSend_setFragmentTexture_atIndex_(v90, v99, (uint64_t)v146, 4);
              }
              objc_msgSend_setFragmentBytes_length_atIndex_(v90, v98, (uint64_t)&v148, 16, 0);
              v102 = objc_msgSend_width(v31, v100, v101);
              v149 = __PAIR64__(objc_msgSend_height(v31, v103, v104), v102);
              objc_msgSend_setFragmentBytes_length_atIndex_(v90, v105, (uint64_t)&v149, 8, 1);
              objc_msgSend_setFragmentBytes_length_atIndex_(v90, v106, (uint64_t)&self->_matteToInputPixelBufferRotationDegrees, 4, 2);
              objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v90, v107, 4, 0, 4);
              objc_msgSend_endEncoding(v90, v108, v109);
              if (byte_253E50C30)
              {
                objc_msgSend_colorAttachments(v51, v110, v111);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v112, v113, 0);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setTexture_(v114, v115, (uint64_t)v144);

                objc_msgSend_renderCommandEncoderWithDescriptor_(v57, v116, (uint64_t)v51);
                v117 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_setRenderPipelineState_(v117, v118, (uint64_t)self->_colorCubePipelineStateUV[v44][v82][self->_filterDescriptor->var3][self->_filterDescriptor->var4]);
                objc_msgSend_fullRangeVertexBuf(self->_metal, v119, v120);
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setVertexBuffer_offset_atIndex_(v117, v122, (uint64_t)v121, 0, 0);

                objc_msgSend_setFragmentTexture_atIndex_(v117, v123, (uint64_t)v31, 0);
                v124 = v143;
                objc_msgSend_setFragmentTexture_atIndex_(v117, v125, (uint64_t)v143, 1);
                objc_msgSend_setFragmentTexture_atIndex_(v117, v126, (uint64_t)fgCubesTexture[self->_fgCubeToUseIndex], 2);
                if (v44)
                {
                  objc_msgSend_setFragmentTexture_atIndex_(v117, v127, (uint64_t)bgCubeTexture[self->_bgCubeToUseIndex], 3);
                  objc_msgSend_setFragmentTexture_atIndex_(v117, v128, (uint64_t)v146, 4);
                }
                objc_msgSend_setFragmentBytes_length_atIndex_(v117, v127, (uint64_t)&v148, 16, 0);
                v131 = objc_msgSend_width(v143, v129, v130);
                v149 = __PAIR64__(objc_msgSend_height(v143, v132, v133), v131);
                objc_msgSend_setFragmentBytes_length_atIndex_(v117, v134, (uint64_t)&v149, 8, 1);
                objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v117, v135, 4, 0, 4);
                objc_msgSend_endEncoding(v117, v136, v137);
                v35 = (void *)v147;
              }
              else
              {
                v117 = v90;
                v35 = (void *)v147;
                v124 = v143;
              }
              objc_msgSend_setLabel_(v57, v110, (uint64_t)CFSTR("FigColorCube::run"));
              objc_msgSend_commit(v57, v138, v139);

              v140 = 0;
              goto LABEL_44;
            }
            *(float *)&v63 = x * 2.0 + -1.0;
            *(float *)&v64 = y * -2.0 + 1.0;
            v149 = __PAIR64__(v64, v63);
            v65 = (x + width) * 2.0 + -1.0;
            v150 = v65;
            v151 = v64;
            v66 = (y + height) * -2.0 + 1.0;
            v152 = v63;
            v153 = v66;
            v154 = v65;
            v155 = v66;
            objc_msgSend_device(self->_metal, v61, v62);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend_newBufferWithBytes_length_options_(v67, v68, (uint64_t)&v149, 32, 0);

            if (v69)
            {
              objc_msgSend_colorAttachments(v51, v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v72, v73, 0);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setLoadAction_(v74, v75, 1);

              objc_msgSend_colorAttachments(v51, v76, v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v78, v79, 0);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setStoreAction_(v80, v81, 1);

              v60 = (void *)v69;
              goto LABEL_32;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
            v140 = FigSignalErrorAt();
            v35 = (void *)v147;
          }
          else
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v140 = FigSignalErrorAt();
          }
          v124 = v143;
LABEL_44:

LABEL_45:
LABEL_46:

          return v140;
        }
      }
      v42 = 0;
      goto LABEL_22;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (id)createPipelineStateWithVertexFunction:(id)a3 fragmentName:(id)a4 isLuma:(BOOL)a5 useBgCube:(BOOL)a6 manyFgCubes:(BOOL)a7 colorSpace:(int)a8 mixInGammaDomain:(BOOL)a9
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  _BOOL4 v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  unint64_t yuvFormat;
  const char *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  int v86;
  void *v87;
  id v88;
  BOOL v90;
  int v91;
  BOOL v92;
  BOOL v93;
  BOOL v94;

  v15 = a3;
  v16 = a4;
  v94 = a5;
  v93 = a6;
  v92 = a7;
  v91 = a8;
  v90 = a9;
  v19 = (void *)objc_opt_new();
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v86 = FigSignalErrorAt();
LABEL_21:
    v85 = 0;
    goto LABEL_13;
  }
  objc_msgSend_pipelineLibrary(self->_metal, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPipelineLibrary_(v19, v21, (uint64_t)v20);

  objc_msgSend_setVertexFunction_(v19, v22, (uint64_t)v15);
  v23 = (void *)objc_opt_new();
  v25 = v23;
  if (!v23)
  {
    fig_log_get_emitter();
LABEL_20:
    FigDebugAssert3();
    v86 = FigSignalErrorAt();

    goto LABEL_21;
  }
  objc_msgSend_setConstantValue_type_atIndex_(v23, v24, (uint64_t)&v94, 53, 1);
  objc_msgSend_setConstantValue_type_atIndex_(v25, v26, (uint64_t)&byte_253E50C30, 53, 2);
  objc_msgSend_setConstantValue_type_atIndex_(v25, v27, (uint64_t)&v93, 53, 3);
  objc_msgSend_setConstantValue_type_atIndex_(v25, v28, (uint64_t)&v92, 53, 4);
  objc_msgSend_setConstantValue_type_atIndex_(v25, v29, (uint64_t)&v91, 29, 5);
  objc_msgSend_setConstantValue_type_atIndex_(v25, v30, (uint64_t)&v90, 53, 7);
  objc_msgSend_library(self->_metal, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pipelineLibrary(self->_metal, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v33, v37, (uint64_t)v16, v25, v36, 0);
  objc_msgSend_setFragmentFunction_(v19, v39, (uint64_t)v38);

  objc_msgSend_fragmentFunction(v19, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    fig_log_get_emitter();
    goto LABEL_20;
  }

  v43 = (void *)objc_opt_new();
  v46 = v43;
  if (!v43)
    goto LABEL_22;
  objc_msgSend_attributes(v43, v44, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v49, v50, 29);

  objc_msgSend_attributes(v46, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v53, v54, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v55, v56, 0);

  objc_msgSend_attributes(v46, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v59, v60, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v61, v62, 0);

  objc_msgSend_layouts(v46, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v65, v66, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStride_(v67, v68, 8);

  objc_msgSend_setVertexDescriptor_(v19, v69, (uint64_t)v46);
  if (byte_253E50C30)
  {
    v72 = v94;
    objc_msgSend_colorAttachments(v19, v70, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v73, v74, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v75;
    if (v72)
      objc_msgSend_setPixelFormat_(v75, v76, 10);
    else
      objc_msgSend_setPixelFormat_(v75, v76, 30);
  }
  else
  {
    yuvFormat = self->_yuvFormat;
    objc_msgSend_colorAttachments(v19, v70, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v73, v79, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPixelFormat_(v77, v80, yuvFormat);
  }

  objc_msgSend_device(self->_metal, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v83, v84, (uint64_t)v19, 0);

  if (v85)
  {
    v86 = 0;
  }
  else
  {
LABEL_22:
    fig_log_get_emitter();
    FigDebugAssert3();
    v86 = FigSignalErrorAt();
    v85 = 0;
  }

LABEL_13:
  if (v86)
    v87 = 0;
  else
    v87 = v85;
  v88 = v87;

  return v88;
}

- (int)createPipelineStatesForCubeConversionWithVertexFunction:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  char v7;
  uint64_t v8;
  MTLRenderPipelineState **cubeConvert;
  char v10;
  char v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  MTLRenderPipelineState *v68;
  int v69;
  char v71;

  v4 = a3;
  v6 = (void *)objc_opt_new();
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    cubeConvert = self->_cubeConvert;
    v10 = 1;
    while (1)
    {
      v11 = v10;
      v71 = v7 & 1;
      objc_msgSend_setConstantValue_type_atIndex_(v6, v5, (uint64_t)&v71, 53, 6);
      v14 = (void *)objc_opt_new();
      if (!v14)
        goto LABEL_10;
      objc_msgSend_pipelineLibrary(self->_metal, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPipelineLibrary_(v14, v16, (uint64_t)v15);

      objc_msgSend_setVertexFunction_(v14, v17, (uint64_t)v4);
      objc_msgSend_library(self->_metal, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pipelineLibrary(self->_metal, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v20, v24, (uint64_t)CFSTR("cubeColorConvertFrag"), v6, v23, 0);
      objc_msgSend_setFragmentFunction_(v14, v26, (uint64_t)v25);

      objc_msgSend_fragmentFunction(v14, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
LABEL_10:
        fig_log_get_emitter();
        FigDebugAssert3();
        v69 = FigSignalErrorAt();
        goto LABEL_12;
      }
      v30 = (void *)objc_opt_new();
      v33 = v30;
      if (!v30)
        break;
      objc_msgSend_attributes(v30, v31, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v34, v35, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFormat_(v36, v37, 29);

      objc_msgSend_attributes(v33, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v40, v41, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBufferIndex_(v42, v43, 0);

      objc_msgSend_attributes(v33, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v46, v47, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOffset_(v48, v49, 0);

      objc_msgSend_layouts(v33, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v52, v53, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStride_(v54, v55, 8);

      objc_msgSend_setVertexDescriptor_(v14, v56, (uint64_t)v33);
      objc_msgSend_colorAttachments(v14, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v59, v60, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPixelFormat_(v61, v62, 70);

      objc_msgSend_device(self->_metal, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v65, v66, (uint64_t)v14, 0);
      v68 = cubeConvert[v8];
      cubeConvert[v8] = (MTLRenderPipelineState *)v67;

      if (!cubeConvert[v8])
        break;

      v10 = 0;
      v7 = 1;
      v8 = 1;
      if ((v11 & 1) == 0)
      {
        v69 = 0;
        goto LABEL_9;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v69 = FigSignalErrorAt();

LABEL_12:
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v69 = FigSignalErrorAt();
  }
LABEL_9:

  return v69;
}

- (int)createPipelineStatesWithFragmentName:(id)a3 vertexFunction:(id)a4
{
  char v6;
  uint64_t v7;
  const char *v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  int v19;
  uint64_t v20;
  MTLRenderPipelineState **v21;
  MTLRenderPipelineState *v22;
  const char *v23;
  uint64_t v24;
  MTLRenderPipelineState **v25;
  MTLRenderPipelineState *v26;
  MTLRenderPipelineState **v27;
  MTLRenderPipelineState *v28;
  int v29;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  id v35;
  id v36;

  v36 = a3;
  v6 = 0;
  v7 = 0;
  v35 = a4;
  v9 = 1;
  while (2)
  {
    v10 = 0;
    v11 = 0;
    v32 = v9;
    v12 = 1;
    do
    {
      v13 = 0;
      v33 = v12;
      v14 = 1;
      while (2)
      {
        v15 = 0;
        v16 = 0;
        v34 = v14;
        v17 = 1;
        do
        {
          v18 = v17;
          v19 = byte_253E50C30;
          LOBYTE(v31) = v15 & 1;
          objc_msgSend_createPipelineStateWithVertexFunction_fragmentName_isLuma_useBgCube_manyFgCubes_colorSpace_mixInGammaDomain_(self, v8, (uint64_t)v35, v36, 1, v10 & 1, v6 & 1, v13, v31);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v21 = self->_colorCubePipelineStateY[v11][v7][v13];
            v22 = v21[v16];
            v21[v16] = (MTLRenderPipelineState *)v20;

            if (!v21[v16]
              || (LOBYTE(v31) = v15,
                  objc_msgSend_createPipelineStateWithVertexFunction_fragmentName_isLuma_useBgCube_manyFgCubes_colorSpace_mixInGammaDomain_(self, v23, (uint64_t)v35, v36, 0, v10 & 1, v6 & 1, v13, v31), v24 = objc_claimAutoreleasedReturnValue(), v25 = self->_colorCubePipelineStateUV[v11][v7][v13], v26 = v25[v16], v25[v16] = (MTLRenderPipelineState *)v24, v26, !v25[v16]))
            {
LABEL_15:
              fig_log_get_emitter();
              FigDebugAssert3();
              v29 = FigSignalErrorAt();
              goto LABEL_16;
            }
          }
          else
          {
            v27 = self->_colorCubePipelineState[v11][v7][v13];
            v28 = v27[v16];
            v27[v16] = (MTLRenderPipelineState *)v20;

            if (!v27[v16])
              goto LABEL_15;
          }
          v17 = 0;
          v15 = 1;
          v16 = 1;
        }
        while ((v18 & 1) != 0);
        v14 = 0;
        v13 = 1;
        if ((v34 & 1) != 0)
          continue;
        break;
      }
      v12 = 0;
      v10 = 1;
      v11 = 1;
    }
    while ((v33 & 1) != 0);
    v9 = 0;
    v6 = 1;
    v7 = 1;
    if ((v32 & 1) != 0)
      continue;
    break;
  }
  v29 = 0;
LABEL_16:

  return v29;
}

- (void)prewarmMetalInternalShader
{
  uint64_t v2;
  FigColorCubeMetalFilter *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const __CFDictionary *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  IOSurfaceRef IOSurface;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  const __CFDictionary *v81;
  FigColorCubeMetalFilter *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CVPixelBufferRef pixelBufferOut;
  _BYTE v88[128];
  uint64_t v89;
  _QWORD v90[3];

  v3 = self;
  v90[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_commandQueue(self->_metal, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend_setWidth_(v9, v10, 2);
  objc_msgSend_setHeight_(v9, v11, 2);
  objc_msgSend_setDepth_(v9, v12, 1);
  objc_msgSend_setArrayLength_(v9, v13, 1);
  objc_msgSend_setUsage_(v9, v14, 7);
  if (!byte_253E50C30)
  {
    pixelBufferOut = 0;
    v89 = *MEMORY[0x24BDC5668];
    v90[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v90, &v89, 1);
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 8uLL, 8uLL, 0x34323066u, v16, &pixelBufferOut);
    if (!pixelBufferOut)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_13;
    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24DE13AA0, v17, (uint64_t)&v83, v88, 16);
    if (v18)
    {
      v20 = v18;
      v81 = v16;
      v82 = v3;
      v21 = v7;
      v22 = 0;
      v23 = 0;
      v24 = *(_QWORD *)v84;
      do
      {
        v25 = 0;
        v26 = v22;
        v27 = v23;
        do
        {
          if (*(_QWORD *)v84 != v24)
            objc_enumerationMutation(&unk_24DE13AA0);
          v28 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v25);
          objc_msgSend_setTextureType_(v9, v19, 2);
          v31 = objc_msgSend_intValue(v28, v29, v30);
          objc_msgSend_setPixelFormat_(v9, v32, v31);
          objc_msgSend_device(v82->_metal, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut);
          v22 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v35, v37, (uint64_t)v9, IOSurface, 0);

          objc_msgSend_colorAttachments(v8, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v40, v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTexture_(v42, v43, (uint64_t)v22);

          objc_msgSend_renderCommandEncoderWithDescriptor_(v21, v44, (uint64_t)v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_endEncoding(v23, v45, v46);
          ++v25;
          v26 = v22;
          v27 = v23;
        }
        while (v20 != v25);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24DE13AA0, v19, (uint64_t)&v83, v88, 16);
      }
      while (v20);

      v7 = v21;
      v3 = v82;
      v16 = v81;
    }
    CFRelease(pixelBufferOut);

  }
  objc_msgSend_setTextureType_(v9, v15, 3);
  objc_msgSend_setPixelFormat_(v9, v47, 70);
  objc_msgSend_device(v3->_metal, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend_newTextureWithDescriptor_(v50, v51, (uint64_t)v9);
  objc_msgSend_colorAttachments(v8, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v55, v56, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v57, v58, (uint64_t)v52);

  objc_msgSend_renderCommandEncoderWithDescriptor_(v7, v59, (uint64_t)v8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endEncoding(v60, v61, v62);
  objc_msgSend_setTextureType_(v9, v63, 7);
  objc_msgSend_setPixelFormat_(v9, v64, 70);
  objc_msgSend_device(v3->_metal, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend_newTextureWithDescriptor_(v67, v68, (uint64_t)v9);
  objc_msgSend_colorAttachments(v8, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v72, v73, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v74, v75, (uint64_t)v69);

  objc_msgSend_renderCommandEncoderWithDescriptor_(v7, v76, (uint64_t)v8);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_endEncoding(v77, v78, v79);
  objc_msgSend_prewarmInternalMetalShadersForFormatsList_(v3->_metal, v80, (uint64_t)&unk_24DE13B00);

LABEL_13:
}

- (int)createKernels
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  int PipelineStatesWithFragmentName_vertexFunction;
  const char *v9;
  int v10;
  _QWORD block[5];

  objc_msgSend_library(self->_metal, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_newFunctionWithName_(v4, v5, (uint64_t)CFSTR("colorCubeVertex"));

  if (v6)
  {
    PipelineStatesWithFragmentName_vertexFunction = objc_msgSend_createPipelineStatesWithFragmentName_vertexFunction_(self, v7, (uint64_t)CFSTR("colorCubeFragment2D"), v6);
    if (PipelineStatesWithFragmentName_vertexFunction
      || (PipelineStatesWithFragmentName_vertexFunction = objc_msgSend_createPipelineStatesForCubeConversionWithVertexFunction_(self, v9, (uint64_t)v6)) != 0)
    {
      v10 = PipelineStatesWithFragmentName_vertexFunction;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21ADDE94C;
      block[3] = &unk_24DE12BF8;
      block[4] = self;
      if (qword_253E50C28 != -1)
        dispatch_once(&qword_253E50C28, block);
      v10 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = FigSignalErrorAt();
  }

  return v10;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- ($C7AD2F4C285567854F02E01F06575F34)filterDescriptor
{
  return self->_filterDescriptor;
}

- (void)setFilterDescriptor:(id *)a3
{
  self->_filterDescriptor = a3;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  self->_outputPixelBuffer = a3;
}

- (__CVBuffer)mattePixelbuffer
{
  return self->_mattePixelbuffer;
}

- (void)setMattePixelbuffer:(__CVBuffer *)a3
{
  self->_mattePixelbuffer = a3;
}

- (CGRect)targetRectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRectangle.origin.x;
  y = self->_targetRectangle.origin.y;
  width = self->_targetRectangle.size.width;
  height = self->_targetRectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetRectangle:(CGRect)a3
{
  self->_targetRectangle = a3;
}

- (int)matteToInputPixelBufferRotationDegrees
{
  return self->_matteToInputPixelBufferRotationDegrees;
}

- (void)setMatteToInputPixelBufferRotationDegrees:(int)a3
{
  self->_matteToInputPixelBufferRotationDegrees = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;

  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_bgCubeTextureTemp[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_bgCubeTexture[j + 1], 0);
  for (k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_fgCubesTextureTemp[k + 1], 0);
  for (m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_fgCubesTexture[m + 1], 0);
  for (n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_cubeConvert[n + 1], 0);
  for (ii = 0; ii != -16; --ii)
    objc_storeStrong((id *)&self->_colorCubePipelineStateUV[1][1][1][ii + 1], 0);
  for (jj = 272; jj != 144; jj -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
    jj -= 8;
  }
  while (jj != 16);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
