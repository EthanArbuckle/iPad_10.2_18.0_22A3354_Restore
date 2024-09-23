@implementation PTDisparityUpscale

- (PTDisparityUpscale)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 disparitySize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v11;
  PTDisparityUpscale *v12;
  PTDisparityUpscale *v13;
  char Bool;
  float upscaleFactor;
  double v16;
  double v17;
  PTUtil *v18;
  PTUtil *portraitUtil;
  void *v20;
  uint64_t v21;
  MTLTexture *disparityUpscaled;
  double v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  MPSImageSpatioTemporalGuidedFilter *guidedFilter;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSArray *coefficientsTextureArray;
  PTDisparityUpscale *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  objc_super v63;
  void *v64;
  _QWORD v65[2];

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v65[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v63.receiver = self;
  v63.super_class = (Class)PTDisparityUpscale;
  v12 = -[PTDisparityUpscale init](&v63, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_28;
  objc_storeStrong((id *)&v12->_metalContext, a3);
  v13->_width = (unint64_t)width;
  v13->_height = (unint64_t)height;
  v13->_upscaleFactor = 2.0;
  Bool = PTDefaultsPublicGetBool(CFSTR("harvesting.enabled"), 0);
  v13->_isShaderHarvesting = Bool;
  upscaleFactor = v13->_upscaleFactor;
  v16 = width * upscaleFactor;
  if (v8 < v16)
    v16 = v8;
  v17 = height * upscaleFactor;
  if (v7 < v17)
    v17 = v7;
  v13->_width = (unint64_t)v16;
  v13->_height = (unint64_t)v17;
  if (upscaleFactor <= 1.0 || (Bool & 1) != 0)
    goto LABEL_19;
  v18 = -[PTUtil initWithMetalContext:]([PTUtil alloc], "initWithMetalContext:", v13->_metalContext);
  portraitUtil = v13->_portraitUtil;
  v13->_portraitUtil = v18;

  if (!v13->_portraitUtil)
  {
    _PTLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:].cold.1(v24, v46, v47, v48, v49, v50, v51, v52);
    goto LABEL_27;
  }
  -[PTMetalContext textureUtil](v13->_metalContext, "textureUtil");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createWithWidth:height:pixelFormat:", v13->_width, v13->_height, 25);
  v21 = objc_claimAutoreleasedReturnValue();
  disparityUpscaled = v13->_disparityUpscaled;
  v13->_disparityUpscaled = (MTLTexture *)v21;

  if (!v13->_disparityUpscaled)
  {
    _PTLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:].cold.2(v24);
    goto LABEL_27;
  }
  LOBYTE(v62) = 0;
  LODWORD(v23) = 1000593162;
  objc_msgSend(MEMORY[0x1E0CC6E98], "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:", (int)width, (int)height, 1, 3, 1, 1, v23, 3, v62);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    _PTLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:].cold.4(v25, v26, v27, v28, v29, v30, v31, v32);

  }
  v33 = objc_alloc(MEMORY[0x1E0CC6E90]);
  -[PTMetalContext device](v13->_metalContext, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "initWithDevice:filterDescriptor:", v34, v24);
  guidedFilter = v13->_guidedFilter;
  v13->_guidedFilter = (MPSImageSpatioTemporalGuidedFilter *)v35;

  if (!v13->_guidedFilter)
  {
    _PTLogSystem();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.12(v53, v54, v55, v56, v57, v58, v59, v60);

LABEL_27:
LABEL_28:
    v45 = 0;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, (unint64_t)width, (unint64_t)height, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setUsage:", 19);
  -[PTMetalContext device](v13->_metalContext, "device");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "supportsFamily:", 1007))
    v39 = 0;
  else
    v39 = 32;
  objc_msgSend(v37, "setResourceOptions:", v39);

  objc_msgSend(v37, "setTextureType:", 3);
  -[PTMetalContext device](v13->_metalContext, "device");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "newTextureWithDescriptor:", v37);
  v64 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
  v43 = objc_claimAutoreleasedReturnValue();
  coefficientsTextureArray = v13->_coefficientsTextureArray;
  v13->_coefficientsTextureArray = (NSArray *)v43;

LABEL_19:
  v45 = v13;
LABEL_29:

  return v45;
}

- (id)guidedUpsampling:(id)a3 inDisparity:(id)a4 inRGBA:(id)a5 colorDepth:(int64_t)a6
{
  id v10;
  MTLTexture *v11;
  id v12;
  MTLTexture *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MTLTexture *v18;
  MTLTexture *guideConversionTexture;
  void *v20;
  void *v21;
  double v22;
  MPSImageSpatioTemporalGuidedFilter *guidedFilter;
  void *v24;
  MTLTexture *v25;
  NSArray *coefficientsTextureArray;
  MPSImageSpatioTemporalGuidedFilter *v27;
  void *v28;
  MTLTexture *v29;
  MTLTexture *disparityUpscaled;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (MTLTexture *)a4;
  v12 = a5;
  v13 = v11;
  if (self->_upscaleFactor > 1.0)
  {
    if (!self->_guideConversionTexture)
    {
      v14 = objc_msgSend(v12, "pixelFormat");
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 == 555)
        v17 = 71;
      else
        v17 = 115;
      objc_msgSend(v15, "createWithWidth:height:pixelFormat:", self->_width, self->_height, v17);
      v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      guideConversionTexture = self->_guideConversionTexture;
      self->_guideConversionTexture = v18;

    }
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    LODWORD(v22) = 1042983595;
    if (a6 == 8)
      *(float *)&v22 = 1.0;
    objc_msgSend(v20, "multiply:inTex:outTex:multiplier:", v10, v12, self->_guideConversionTexture, v22);

    guidedFilter = self->_guidedFilter;
    v32[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSImageSpatioTemporalGuidedFilter encodeRegressionToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationCoefficientsTextureArray:](guidedFilter, "encodeRegressionToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationCoefficientsTextureArray:", v10, v24, self->_guideConversionTexture, 0, 1, self->_coefficientsTextureArray);

    v25 = self->_guideConversionTexture;
    coefficientsTextureArray = self->_coefficientsTextureArray;
    v27 = self->_guidedFilter;
    disparityUpscaled = self->_disparityUpscaled;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &disparityUpscaled, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSImageSpatioTemporalGuidedFilter encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTextureArray:destinationTextureArray:](v27, "encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTextureArray:destinationTextureArray:", v10, v25, coefficientsTextureArray, v28);

    v13 = self->_disparityUpscaled;
  }
  v29 = v13;

  return v29;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (id)upscaledTexture
{
  return self->_disparityUpscaled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coefficientsTextureArray, 0);
  objc_storeStrong((id *)&self->_guideConversionTexture, 0);
  objc_storeStrong((id *)&self->_portraitUtil, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_disparityUpscaled, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(os_log_t)log colorSize:disparitySize:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "PTDisparityUpscale Cannot allocate texture", v1, 2u);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
