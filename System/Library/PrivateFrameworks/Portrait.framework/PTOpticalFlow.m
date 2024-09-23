@implementation PTOpticalFlow

- (PTOpticalFlow)initWithMetalContext:(id)a3 colorSize:(id *)a4 lktPreset:(int64_t)a5 allocateDisplacementFWD:(BOOL)a6 needConversionBGRA2YUVA:(BOOL)a7 inverseFlow:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v15;
  PTOpticalFlow *v16;
  int32x2_t *v17;
  uint64_t v18;
  void *v19;
  LKTFlowGPU *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PTOpticalFlow *v26;
  NSObject *v27;
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

  v9 = a7;
  v10 = a6;
  v15 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTOpticalFlow;
  v16 = -[PTOpticalFlow init](&v50, sel_init);
  v17 = (int32x2_t *)v16;
  if (!v16)
    goto LABEL_15;
  v16->_inverseFlow = a8;
  objc_storeStrong((id *)&v16->_metalContext, a3);
  v17[5] = vmovn_s64(vaddq_s64((int64x2_t)vandq_s8(*(int8x16_t *)&a4->var0, (int8x16_t)vdupq_n_s64(1uLL)), *(int64x2_t *)&a4->var0));
  objc_msgSend(v15, "computePipelineStateFor:withConstants:", CFSTR("warpTexture"), 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v17[2];
  v17[2] = (int32x2_t)v18;

  if (!*(_QWORD *)&v17[2])
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_14;
  }
  v20 = -[LKTFlowGPU initWithMetalContext:width:height:nscales:]([LKTFlowGPU alloc], "initWithMetalContext:width:height:nscales:", v15, v17[5].u32[0], v17[5].u32[1], 0xFFFFFFFFLL);
  v21 = (void *)v17[3];
  v17[3] = (int32x2_t)v20;

  v22 = (void *)v17[3];
  if (!v22)
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:].cold.2(v27, v35, v36, v37, v38, v39, v40, v41);
LABEL_14:

LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v22, "setIsInverse:", v17[6].u8[1]);
  objc_msgSend(*(id *)&v17[3], "setNeedConversionBGRA2YUVA:", v9);
  objc_msgSend(*(id *)&v17[3], "setUseNonLocalRegularization:", 1);
  objc_msgSend(*(id *)&v17[3], "setIsBidirectional:", 0);
  objc_msgSend(*(id *)&v17[3], "setPreset:", a5);
  if (v10)
  {
    objc_msgSend(v15, "textureUtil");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createWithWidth:height:pixelFormat:", v17[5].i32[0], v17[5].i32[1], 65);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v17[4];
    v17[4] = (int32x2_t)v24;

    if (v17[4])
    {
      objc_msgSend(*(id *)&v17[3], "setOutputTexUV:");
      goto LABEL_7;
    }
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:].cold.3(v27, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_14;
  }
LABEL_7:
  v26 = v17;
LABEL_16:

  return v26;
}

- (id)displacementFWD
{
  return self->_displacementFWD;
}

- (PTOpticalFlow)initWithMetalContext:(id)a3 colorSize:(id *)a4 lktPreset:(int64_t)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  v6 = *a4;
  return -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:](self, "initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:", a3, &v6, a5, 1, 0, 0);
}

- (signed)estimateDisplacementStream:(id)a3 index:(int)a4 doOpticalFlow:(BOOL)a5 destRGBA:(id)a6
{
  signed __int16 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = -[LKTFlowGPU estimateFlowStreamTex:index:doOpticalFlow:commandBuffer:](self->_lktflowgpuContext, "estimateFlowStreamTex:index:doOpticalFlow:commandBuffer:", a6, *(_QWORD *)&a4, a5, a3);
  if (v6)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow estimateDisplacementStream:index:doOpticalFlow:destRGBA:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6;
}

- (signed)estimateDisplacementStream:(id)a3 destRGBA:(id)a4 outDisplacement:(id)a5
{
  MTLTexture *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  signed __int16 v20;

  v9 = self->_displacementFWD;
  v10 = a4;
  v11 = a3;
  -[PTOpticalFlow setDisplacementFWD:](self, "setDisplacementFWD:", a5);
  LOWORD(a5) = -[LKTFlowGPU estimateFlowStreamTex:commandBuffer:](self->_lktflowgpuContext, "estimateFlowStreamTex:commandBuffer:", v10, v11);

  if ((_WORD)a5)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow estimateDisplacementStream:destRGBA:outDisplacement:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = -1;
  }
  else
  {
    v20 = -[PTOpticalFlow setDisplacementFWD:](self, "setDisplacementFWD:", v9);
  }

  return v20;
}

- (signed)estimateDisplacementFWD:(id)a3 sourceRGBA:(id)a4 destRGBA:(id)a5
{
  int v5;
  int v6;
  NSObject *v7;

  v5 = -[LKTFlowGPU estimateFlowFromTexReference:target:commandBuffer:](self->_lktflowgpuContext, "estimateFlowFromTexReference:target:commandBuffer:", a4, a5, a3);
  v6 = (__int16)v5;
  if (v5 << 16)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow estimateDisplacementFWD:sourceRGBA:destRGBA:].cold.1(v6, v7);

  }
  return v6;
}

- (id)toTextureArray:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "textureType") == 3)
    v4 = v3;
  else
    v4 = (id)objc_msgSend(v3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v3, "pixelFormat"), 3, 0, 1, 0, 1);
  v5 = v4;

  return v5;
}

- (signed)warp:(id)a3 inTexture:(id)a4 inDisplacement:(id)a5 outTextureWarped:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64x2_t v18;
  uint64_t v19;
  uint64_t v20;
  int32x2_t v22;
  int64x2_t v23;
  uint64_t v24;
  _QWORD v25[3];
  float32x2_t v26;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_warpTexture);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v10, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 2);

  LODWORD(v15) = 1.0;
  if (!self->_inverseFlow)
    *(float *)&v15 = -1.0;
  v16 = objc_msgSend(v10, "width", v15, v14);
  v17 = objc_msgSend(v10, "height");
  v18.i64[0] = v16;
  v18.i64[1] = v17;
  v26 = vdiv_f32((float32x2_t)vdup_lane_s32(v22, 0), vcvt_f32_f64(vcvtq_f64_u64(v18)));
  objc_msgSend(v13, "setBytes:length:atIndex:", &v26, 8, 0);
  v19 = objc_msgSend(v10, "width");
  v20 = objc_msgSend(v10, "height");

  v25[0] = v19;
  v25[1] = v20;
  v25[2] = 1;
  v23 = vdupq_n_s64(8uLL);
  v24 = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v13, "endEncoding");

  return 0;
}

- (signed)setDisplacementFWD:(id)a3
{
  MTLTexture *v5;
  MTLTexture *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  signed __int16 v15;

  v5 = (MTLTexture *)a3;
  v6 = v5;
  if (!self->_allocateDisplacementFWD || self->_displacementFWD == v5)
  {
    objc_storeStrong((id *)&self->_displacementFWD, a3);
    -[LKTFlowGPU setOutputTexUV:](self->_lktflowgpuContext, "setOutputTexUV:", self->_displacementFWD);
    v15 = 0;
  }
  else
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTOpticalFlow setDisplacementFWD:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = -1;
  }

  return v15;
}

- (void)reset
{
  -[LKTFlowGPU reset](self->_lktflowgpuContext, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displacementFWD, 0);
  objc_storeStrong((id *)&self->_lktflowgpuContext, 0);
  objc_storeStrong((id *)&self->_warpTexture, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 lktPreset:(uint64_t)a5 allocateDisplacementFWD:(uint64_t)a6 needConversionBGRA2YUVA:(uint64_t)a7 inverseFlow:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 lktPreset:(uint64_t)a5 allocateDisplacementFWD:(uint64_t)a6 needConversionBGRA2YUVA:(uint64_t)a7 inverseFlow:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 lktPreset:(uint64_t)a5 allocateDisplacementFWD:(uint64_t)a6 needConversionBGRA2YUVA:(uint64_t)a7 inverseFlow:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)estimateDisplacementStream:(uint64_t)a3 index:(uint64_t)a4 doOpticalFlow:(uint64_t)a5 destRGBA:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Err estimateFlowStreamTex", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)estimateDisplacementStream:(uint64_t)a3 destRGBA:(uint64_t)a4 outDisplacement:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Err", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)estimateDisplacementFWD:(int)a1 sourceRGBA:(NSObject *)a2 destRGBA:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "lktflowgpuContext estimateFlowFromTexReference returned %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_12();
}

- (void)setDisplacementFWD:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Changing displacement textures is only valid when allocateDisplacementFWD is false", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

@end
