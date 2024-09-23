@implementation PTMetalTextureUtil

- (PTMetalTextureUtil)initWithMetalContext:(id)a3
{
  id v4;
  PTMetalTextureUtil *v5;
  uint64_t v6;
  MTLDevice *device;
  int v8;
  uint64_t v9;
  MTLComputePipelineState *copy;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  MTLComputePipelineState *v20;
  uint64_t v21;
  MTLComputePipelineState *multiply;
  uint64_t v23;
  MTLComputePipelineState *mix;
  uint64_t v25;
  MTLComputePipelineState *resample420To444;
  PTMetalTextureUtil *v27;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTMetalTextureUtil;
  v5 = -[PTMetalTextureUtil init](&v50, sel_init);
  if (!v5)
    goto LABEL_20;
  objc_msgSend(v4, "device");
  v6 = objc_claimAutoreleasedReturnValue();
  device = v5->_device;
  v5->_device = (MTLDevice *)v6;

  v8 = objc_msgSend(v4, "imageblocksSupported");
  v5->_imageblocksSupported = v8;
  if (v8)
  {
    objc_msgSend(v4, "computePipelineStateFor:withConstants:", CFSTR("copy"), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    copy = v5->_copy;
    v5->_copy = (MTLComputePipelineState *)v9;

    if (!v5->_copy)
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

LABEL_20:
        v27 = 0;
        goto LABEL_21;
      }
LABEL_5:
      -[PTMetalTextureUtil initWithMetalContext:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(v4, "computePipelineStateFor:withConstants:", CFSTR("copyNoImageblocks"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v5->_copy;
    v5->_copy = (MTLComputePipelineState *)v19;

    if (!v5->_copy)
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      goto LABEL_5;
    }
  }
  objc_msgSend(v4, "computePipelineStateFor:withConstants:", CFSTR("multiply"), 0);
  v21 = objc_claimAutoreleasedReturnValue();
  multiply = v5->_multiply;
  v5->_multiply = (MTLComputePipelineState *)v21;

  if (!v5->_multiply)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTMetalTextureUtil initWithMetalContext:].cold.2(v11, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_19;
  }
  objc_msgSend(v4, "computePipelineStateFor:withConstants:", CFSTR("mix"), 0);
  v23 = objc_claimAutoreleasedReturnValue();
  mix = v5->_mix;
  v5->_mix = (MTLComputePipelineState *)v23;

  if (!v5->_mix)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTMetalTextureUtil initWithMetalContext:].cold.3(v11, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_19;
  }
  objc_msgSend(v4, "computePipelineStateFor:withConstants:", CFSTR("resample420To444"), 0);
  v25 = objc_claimAutoreleasedReturnValue();
  resample420To444 = v5->_resample420To444;
  v5->_resample420To444 = (MTLComputePipelineState *)v25;

  if (!v5->_resample420To444)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTMetalTextureUtil initWithMetalContext:].cold.4(v11, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_19;
  }
  v27 = v5;
LABEL_21:

  return v27;
}

- (id)createWithSize:(CGSize)a3 pixelFormat:(unint64_t)a4
{
  return -[PTMetalTextureUtil createWithWidth:height:pixelFormat:mipmapLevelCount:](self, "createWithWidth:height:pixelFormat:mipmapLevelCount:", (unint64_t)a3.width, (unint64_t)a3.height, a4, 0);
}

- (id)createWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5
{
  return -[PTMetalTextureUtil createWithWidth:height:pixelFormat:mipmapLevelCount:](self, "createWithWidth:height:pixelFormat:mipmapLevelCount:", a3, a4, a5, 0);
}

- (id)createWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 mipmapLevelCount:(unint64_t)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a5, a3, a4, a6 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsage:", 19);
  if (-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1007))
    v9 = 0;
  else
    v9 = 32;
  objc_msgSend(v8, "setResourceOptions:", v9);
  if (a6 != -1)
  {
    if (a6 <= 1)
      v10 = 1;
    else
      v10 = a6;
    objc_msgSend(v8, "setMipmapLevelCount:", v10);
  }
  v11 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v8);

  return v11;
}

- (id)mipmapLevelsUsingTextureView:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "mipmapLevelCount"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(v3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v3, "pixelFormat"), objc_msgSend(v3, "textureType"), v5, 1, 0, 1);
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (objc_msgSend(v3, "mipmapLevelCount") > v5);
  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (int)copy:(id)a3 inTex:(id)a4 outTex:(id)a5
{
  id v8;
  id v9;
  id v10;
  PTImageblockConfig *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PTImageblockConfig initWithTexture:]([PTImageblockConfig alloc], "initWithTexture:", v8);
  objc_msgSend(v10, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  if (self->_imageblocksSupported)
    objc_msgSend(v12, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v11, "imageblockSize"), -[PTImageblockConfig imageblockSize](v11, "imageblockSize"));
  objc_msgSend(v12, "setComputePipelineState:", self->_copy);
  objc_msgSend(v12, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v12, "setTexture:atIndex:", v8, 1);
  if (v11)
  {
    -[PTImageblockConfig threads](v11, "threads");
    -[PTImageblockConfig threadsPerGroup](v11, "threadsPerGroup");
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    memset(v22, 0, sizeof(v22));
  }
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v23, v22);
  objc_msgSend(v12, "endEncoding");

  return 0;
}

- (int)multiply:(id)a3 inTex:(id)a4 outTex:(id)a5 multiplier:(float)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  float v26;

  v26 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  objc_msgSend(v11, "setComputePipelineState:", self->_multiply);
  objc_msgSend(v11, "setTexture:atIndex:", v10, 0);

  objc_msgSend(v11, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v11, "setBytes:length:atIndex:", &v26, 4, 0);
  v20 = objc_msgSend(v9, "width");
  v21 = objc_msgSend(v9, "height");

  v25[0] = v20;
  v25[1] = v21;
  v25[2] = 1;
  v23 = xmmword_1C9322A40;
  v24 = 1;
  objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v11, "endEncoding");

  return 0;
}

- (int)mix:(id)a3 inTexX:(id)a4 inTexY:(id)a5 outTex:(id)a6 alpha:(float)a7
{
  id v11;
  id v12;
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
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  float v29;

  v29 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  objc_msgSend(v14, "setComputePipelineState:", self->_mix);
  objc_msgSend(v14, "setTexture:atIndex:", v13, 0);

  objc_msgSend(v14, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v14, "setTexture:atIndex:", v11, 2);
  objc_msgSend(v14, "setBytes:length:atIndex:", &v29, 4, 0);
  v23 = objc_msgSend(v11, "width");
  v24 = objc_msgSend(v11, "height");

  v28[0] = v23;
  v28[1] = v24;
  v28[2] = 1;
  v26 = xmmword_1C9322A40;
  v27 = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", v28, &v26);
  objc_msgSend(v14, "endEncoding");

  return 0;
}

- (int)resample420To444:(id)a3 inLuma:(id)a4 inChroma:(id)a5 outYUV:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v12, v11);
  v22 = v14;
  objc_msgSend(v13, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setComputePipelineState:", self->_resample420To444);
  objc_msgSend(v15, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v15, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v15, "setTexture:atIndex:", v10, 2);
  objc_msgSend(v15, "setBytes:length:atIndex:", &v22, 8, 0);
  v16 = objc_msgSend(v10, "width");
  v17 = objc_msgSend(v10, "height");

  v21[0] = v16;
  v21[1] = v17;
  v21[2] = 1;
  v19 = xmmword_1C9322A40;
  v20 = 1;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v21, &v19);
  objc_msgSend(v15, "endEncoding");

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resample420To444, 0);
  objc_storeStrong((id *)&self->_mix, 0);
  objc_storeStrong((id *)&self->_multiply, 0);
  objc_storeStrong((id *)&self->_copy, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
