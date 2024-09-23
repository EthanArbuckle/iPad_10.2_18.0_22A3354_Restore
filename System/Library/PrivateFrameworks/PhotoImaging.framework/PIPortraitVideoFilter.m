@implementation PIPortraitVideoFilter

- (id)outputImage
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PIPortraitVideoFilter inputGlobalRenderingMetadata](self, "inputGlobalRenderingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "renderingVersion");

  if (v4 == 1)
  {
    v5 = objc_opt_class();
LABEL_6:
    v26 = (void *)v5;
    v8 = 0;
    goto LABEL_10;
  }
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cinematicAllowRGB10Packed");

  v5 = objc_opt_class();
  if (!v7)
    goto LABEL_6;
  if (-[PIPortraitVideoFilter inputIsHDR](self, "inputIsHDR"))
    objc_msgSend(MEMORY[0x1E0D52068], "itur2100HLGColorSpace");
  else
    objc_msgSend(MEMORY[0x1E0D52068], "rec709ColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_class();
  if (outputImage_once != -1)
    dispatch_once(&outputImage_once, &__block_literal_global_78);
LABEL_10:
  -[PIPortraitVideoFilter inputImage](self, "inputImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  if (v8)
  {
    objc_msgSend(v9, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v8, "CGColorSpace"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[PIPortraitVideoFilter inputDisparityImage](self, "inputDisparityImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputColorPixelBuffer](self, "inputColorPixelBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputDisparityPixelBuffer](self, "inputDisparityPixelBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputGlobalRenderingMetadata](self, "inputGlobalRenderingMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputTimedRenderingMetadata](self, "inputTimedRenderingMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputAperture](self, "inputAperture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputFocusedDisparity](self, "inputFocusedDisparity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputRenderQuality](self, "inputRenderQuality");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitVideoFilter inputRenderDebugMode](self, "inputRenderDebugMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  LOBYTE(v23) = -[PIPortraitVideoFilter inputIsHDR](self, "inputIsHDR");
  objc_msgSend(v26, "applyWithInputImage:disparityImage:inputPixelBuffer:disparityPixelBuffer:globalMetadata:timedMetadata:aperture:focusedDisparity:quality:debugMode:isHDR:error:", v9, v11, v24, v12, v13, v14, v15, v16, v17, v18, v23, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v28;

  if (!v19)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_150_1974);
    v20 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v27;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Could not apply PIPortraitVideoProcessor: %@", buf, 0xCu);
      if (!v25)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  if (v25)
  {
LABEL_17:
    objc_msgSend(v19, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v25, "CGColorSpace"));
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
LABEL_18:

  return v19;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputDisparityImage
{
  return self->_inputDisparityImage;
}

- (void)setInputDisparityImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputDisparityImage, a3);
}

- (NUCVPixelBuffer)inputColorPixelBuffer
{
  return self->_inputColorPixelBuffer;
}

- (void)setInputColorPixelBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_inputColorPixelBuffer, a3);
}

- (NUCVPixelBuffer)inputDisparityPixelBuffer
{
  return self->_inputDisparityPixelBuffer;
}

- (void)setInputDisparityPixelBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_inputDisparityPixelBuffer, a3);
}

- (NSNumber)inputRenderQuality
{
  return self->_inputRenderQuality;
}

- (void)setInputRenderQuality:(id)a3
{
  objc_storeStrong((id *)&self->_inputRenderQuality, a3);
}

- (NSNumber)inputRenderDebugMode
{
  return self->_inputRenderDebugMode;
}

- (void)setInputRenderDebugMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputRenderDebugMode, a3);
}

- (BOOL)inputIsHDR
{
  return self->_inputIsHDR;
}

- (void)setInputIsHDR:(BOOL)a3
{
  self->_inputIsHDR = a3;
}

- (PTGlobalRenderingMetadata)inputGlobalRenderingMetadata
{
  return self->_inputGlobalRenderingMetadata;
}

- (void)setInputGlobalRenderingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_inputGlobalRenderingMetadata, a3);
}

- (PIPortraitVideoMetadataSample)inputTimedRenderingMetadata
{
  return self->_inputTimedRenderingMetadata;
}

- (void)setInputTimedRenderingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_inputTimedRenderingMetadata, a3);
}

- (NSNumber)inputAperture
{
  return self->_inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_storeStrong((id *)&self->_inputAperture, a3);
}

- (NSNumber)inputFocusedDisparity
{
  return self->_inputFocusedDisparity;
}

- (void)setInputFocusedDisparity:(id)a3
{
  objc_storeStrong((id *)&self->_inputFocusedDisparity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFocusedDisparity, 0);
  objc_storeStrong((id *)&self->_inputAperture, 0);
  objc_storeStrong((id *)&self->_inputTimedRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_inputGlobalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_inputRenderDebugMode, 0);
  objc_storeStrong((id *)&self->_inputRenderQuality, 0);
  objc_storeStrong((id *)&self->_inputDisparityPixelBuffer, 0);
  objc_storeStrong((id *)&self->_inputColorPixelBuffer, 0);
  objc_storeStrong((id *)&self->_inputDisparityImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

void __36__PIPortraitVideoFilter_outputImage__block_invoke()
{
  NSLog(CFSTR("PIPortrait: cinematic renderer supports RGB10Packed"));
}

@end
