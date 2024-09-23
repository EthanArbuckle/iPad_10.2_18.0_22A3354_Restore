@implementation PTEffectPersonSegmentation

- (PTEffectPersonSegmentation)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 msrColorPyramid:(id)a5 cvmNetwork:(id)a6 effectQuality:(int64_t)a7 prewarmOnly:(BOOL)a8 sharedResources:(id)a9
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  PTEffectPersonSegmentation *v19;
  PTEffectPersonSegmentation *v20;
  unint64_t v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  PTEffectPersonSegmentationVision *v25;
  PTEffectPersonSegmentation *personSegmentation;
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
  PTEffectPersonSegmentation *v37;
  PTEffectPersonSegmentationViSegHQVisionCore *v38;
  PTEffectPersonSegmentation *v39;
  PTGuidedFilter *v40;
  PTMetalContext *metalContext;
  double v42;
  uint64_t v43;
  PTGuidedFilter *guidedFilterSegmentation;
  void *v45;
  uint64_t v46;
  MTLTexture *guideRGBAUpscaleSegmentation;
  void *v48;
  uint64_t v49;
  MTLTexture *guideRGBACoefficientsSegmentation;
  PTEffectPersonSegmentation *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64x2_t v60;
  uint64_t v61;
  _QWORD v62[4];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CGSize v68;
  uint64_t v69;
  objc_super v70;

  height = a4.height;
  width = a4.width;
  v16 = a3;
  v17 = a5;
  v18 = a9;
  v70.receiver = self;
  v70.super_class = (Class)PTEffectPersonSegmentation;
  v19 = -[PTEffectPersonSegmentation init](&v70, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_27;
  objc_storeStrong((id *)&v19->_metalContext, a3);
  +[PTEffectPersonSegmentation upscaledSegmentationMatteFormatForColorSize:](PTEffectPersonSegmentation, "upscaledSegmentationMatteFormatForColorSize:", width, height);
  v20->_outputDescriptor.size = v68;
  *(_QWORD *)&v20->_outputDescriptor.pixelFormatType = v69;
  objc_storeStrong((id *)&v20->_msrColorPyramid, a5);
  v21 = +[PTEffectPersonSegmentation segmentationType](PTEffectPersonSegmentation, "segmentationType");
  if (v21 == 2)
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:].cold.4(v27);
    goto LABEL_26;
  }
  if (v21 != 1)
  {
    if (v21)
    {
      v22 = 0.0;
      v23 = 0.0;
      v24 = 0;
    }
    else
    {
      +[PTEffectPersonSegmentationVision segmentationSizeForColorSize:](PTEffectPersonSegmentationVision, "segmentationSizeForColorSize:", width, height);
      v23 = v68.height;
      v22 = v68.width;
      v24 = v69;
      if (!a8)
      {
        v25 = -[PTEffectPersonSegmentationVision initWithMetalContext:colorSize:]([PTEffectPersonSegmentationVision alloc], "initWithMetalContext:colorSize:", v20->_metalContext, width, height);
        personSegmentation = v20->_personSegmentation;
        v20->_personSegmentation = (PTEffectPersonSegmentation *)v25;

        if (!v20->_personSegmentation)
        {
          _PTLogSystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
LABEL_26:

LABEL_27:
            v51 = 0;
            goto LABEL_28;
          }
LABEL_8:
          -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
          goto LABEL_26;
        }
      }
    }
    goto LABEL_22;
  }
  +[PTEffectPersonSegmentationViSegHQVisionCore segmentationSizeForColorSize:](PTEffectPersonSegmentationViSegHQVisionCore, "segmentationSizeForColorSize:", width, height);
  v23 = v68.height;
  v22 = v68.width;
  v24 = v69;
  if (v18)
  {
    objc_msgSend(v18, "segmentationSize");
    if (v65 == *(_QWORD *)&v68.width)
    {
      objc_msgSend(v18, "segmentationSize");
      v35 = v63;
      goto LABEL_17;
    }
  }
  else
  {
    v65 = 0;
    v66 = 0;
    v67 = 0;
    if (!*(_QWORD *)&v68.width)
    {
      v35 = 0;
      v62[3] = 0;
      v63 = 0;
      v64 = 0;
LABEL_17:
      if (v35 == *(_QWORD *)&v68.height)
      {
        objc_msgSend(v18, "personSegmentationProvider");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v20->_personSegmentation;
        v20->_personSegmentation = (PTEffectPersonSegmentation *)v36;

        -[PTEffectPersonSegmentation reset](v20->_personSegmentation, "reset");
        goto LABEL_22;
      }
    }
  }
  if (!a8)
  {
    v38 = -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:]([PTEffectPersonSegmentationViSegHQVisionCore alloc], "initWithMetalContext:colorSize:", v20->_metalContext, width, height);
    v39 = v20->_personSegmentation;
    v20->_personSegmentation = (PTEffectPersonSegmentation *)v38;

    if (!v20->_personSegmentation)
    {
      _PTLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      goto LABEL_8;
    }
    *(CGFloat *)v62 = v22;
    *(CGFloat *)&v62[1] = v23;
    v62[2] = v24;
    objc_msgSend(v18, "setSegmentationSize:", v62);
    objc_msgSend(v18, "setPersonSegmentationProvider:", v20->_personSegmentation);
  }
LABEL_22:
  v40 = [PTGuidedFilter alloc];
  metalContext = v20->_metalContext;
  v68.width = v22;
  v68.height = v23;
  v69 = v24;
  LODWORD(v42) = 1008981770;
  v43 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v40, "initWithMetalContext:inputSize:epsilon:", metalContext, &v68, v42);
  guidedFilterSegmentation = v20->_guidedFilterSegmentation;
  v20->_guidedFilterSegmentation = (PTGuidedFilter *)v43;

  if (!v20->_guidedFilterSegmentation)
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:].cold.1(v27, v52, v53, v54, v55, v56, v57, v58);
    goto LABEL_26;
  }
  objc_msgSend(v17, "pyramidRGBA");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = vcvtq_u64_f64((float64x2_t)v20->_outputDescriptor.size);
  v61 = 1;
  +[PTUtil findMipmapLevel:largerThan:](PTUtil, "findMipmapLevel:largerThan:", v45, &v60);
  v46 = objc_claimAutoreleasedReturnValue();
  guideRGBAUpscaleSegmentation = v20->_guideRGBAUpscaleSegmentation;
  v20->_guideRGBAUpscaleSegmentation = (MTLTexture *)v46;

  objc_msgSend(v17, "pyramidRGBA");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68.width = v22;
  v68.height = v23;
  v69 = v24;
  +[PTUtil findMipmapLevel:largerThan:](PTUtil, "findMipmapLevel:largerThan:", v48, &v68);
  v49 = objc_claimAutoreleasedReturnValue();
  guideRGBACoefficientsSegmentation = v20->_guideRGBACoefficientsSegmentation;
  v20->_guideRGBACoefficientsSegmentation = (MTLTexture *)v49;

  v51 = v20;
LABEL_28:

  return v51;
}

- (int)runPersonSegmentationToOutPersonSegmentationMatteBuffer:(id)a3 inRGBA:(__CVBuffer *)a4 outUpscaledSegmentation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  -[PTEffectPersonSegmentation runPersonSegmentationForPixelBuffer:](self->_personSegmentation, "runPersonSegmentationForPixelBuffer:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "width");
  if (v11 <= objc_msgSend(v10, "width") && (v12 = objc_msgSend(v9, "height"), v12 <= objc_msgSend(v10, "height")))
  {
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "copy:inTex:outTex:", v15, v10, v9);

  }
  else
  {
    v13 = -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:](self->_guidedFilterSegmentation, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:", v8, v10, self->_guideRGBACoefficientsSegmentation, self->_guideRGBAUpscaleSegmentation, v9, 8, 0);
  }

  return v13;
}

- (unsigned)reset
{
  return -[PTEffectPersonSegmentation reset](self->_personSegmentation, "reset");
}

+ (PTEffectPixelBufferDescriptor)upscaledSegmentationMatteFormatForColorSize:(SEL)a3
{
  double height;
  double width;
  PTEffectPixelBufferDescriptor *result;
  double v8;
  double v9;

  height = a4.height;
  width = a4.width;
  retstr->size.width = 0.0;
  retstr->size.height = 0.0;
  *(_QWORD *)&retstr->pixelFormatType = 0;
  result = (PTEffectPixelBufferDescriptor *)objc_msgSend(a2, "segmentationSizeForColorSize:");
  if (v8 < width)
    v8 = width;
  if (v9 < height)
    v9 = height;
  retstr->size.width = v8;
  retstr->size.height = v9;
  retstr->pixelFormatType = 1278226488;
  return result;
}

+ (unint64_t)segmentationType
{
  return 1;
}

+ (CGSize)segmentationSizeForColorSize:(CGSize)a3
{
  double height;
  double width;
  unint64_t v5;
  __objc2_class *v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = +[PTEffectPersonSegmentation segmentationType](PTEffectPersonSegmentation, "segmentationType");
  if (v5 == 1)
  {
    v6 = PTEffectPersonSegmentationViSegHQVisionCore;
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = PTEffectPersonSegmentationVision;
LABEL_5:
    -[__objc2_class segmentationSizeForColorSize:](v6, "segmentationSizeForColorSize:", width, height);
    v7 = v12;
    v8 = v13;
    goto LABEL_9;
  }
  _PTLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[PTEffectPersonSegmentation segmentationSizeForColorSize:].cold.1(v9);

  v8 = 0;
  v7 = 0;
LABEL_9:
  v10 = (double)v7;
  v11 = (double)v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)debugTextures
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", self->_guideRGBAUpscaleSegmentation);
  objc_msgSend(v3, "addObject:", self->_guideRGBACoefficientsSegmentation);
  -[PTEffectPersonSegmentation debugTextures](self->_personSegmentation, "debugTextures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_personSegmentation, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficientsSegmentation, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscaleSegmentation, 0);
  objc_storeStrong((id *)&self->_guidedFilterSegmentation, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 msrColorPyramid:(uint64_t)a5 cvmNetwork:(uint64_t)a6 effectQuality:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 msrColorPyramid:(uint64_t)a5 cvmNetwork:(uint64_t)a6 effectQuality:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(os_log_t)log colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Unsupported person segmentation", v1, 2u);
}

+ (void)segmentationSizeForColorSize:(NSObject *)a1 .cold.1(NSObject *a1)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = +[PTEffectPersonSegmentation segmentationType](PTEffectPersonSegmentation, "segmentationType");
  _os_log_error_impl(&dword_1C9281000, a1, OS_LOG_TYPE_ERROR, "Invalid type %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

@end
