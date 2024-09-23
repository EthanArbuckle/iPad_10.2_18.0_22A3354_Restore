@implementation TSDMetalMotionBlurEffect

- (TSDMetalMotionBlurEffect)initWithFramebufferSize:(CGSize)a3 slideSize:(CGSize)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  double width;
  double height;
  double v10;
  id v12;
  id v13;
  TSDMetalMotionBlurEffect *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double motionBlurStrength;
  void *v21;
  void *v22;
  double framebufferScale;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v31;
  double v32;
  objc_super v33;

  width = a4.width;
  height = a3.height;
  v10 = a3.width;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)TSDMetalMotionBlurEffect;
  v14 = -[TSDMetalMotionBlurEffect init](&v33, sel_init);
  if (v14)
  {
    v15 = TSDMultiplySizeScalar(v10, height, 1.2);
    v14->_framebufferSize.width = TSDFlooredSize(v15);
    v14->_framebufferSize.height = v16;
    v14->_slideSize.width = TSDFlooredSize(width);
    v14->_slideSize.height = v17;
    v14->_isSingleObject = 1;
    v14->_motionBlurStrength = 1.0;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("MotionBlurStrength"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      v14->_motionBlurStrength = motionBlurStrength;
    }
    else
    {
      motionBlurStrength = v14->_motionBlurStrength;
    }
    if (motionBlurStrength != *(double *)&s_previousMotionBlurStrength)
    {
      s_previousMotionBlurStrength = *(_QWORD *)&motionBlurStrength;
      v32 = motionBlurStrength;
      v31 = CFSTR("MotionBlurStrength");
      TSULogErrorInFunction();
    }
    v14->_framebufferScale = 1.0;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v31, *(_QWORD *)&v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("TSDGLMotionBlurEffectFramebufferScale"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "doubleValue");
      v14->_framebufferScale = framebufferScale;
    }
    else
    {
      framebufferScale = v14->_framebufferScale;
    }
    if (framebufferScale != *(double *)&s_previousFramebufferScale)
    {
      s_previousFramebufferScale = *(_QWORD *)&framebufferScale;
      TSULogErrorInFunction();
    }
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalMotionBlurEffect initWithFramebufferSize:slideSize:randomGenerator:metalContext:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 152, CFSTR("invalid nil value for '%s'"), "randomGenerator");

    }
    objc_storeStrong((id *)&v14->_randomGenerator, a5);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalMotionBlurEffect initWithFramebufferSize:slideSize:randomGenerator:metalContext:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 155, CFSTR("invalid nil value for '%s'"), "metalContext");

    }
    objc_storeStrong((id *)&v14->_metalContext, a6);

  }
  return v14;
}

- (void)setMotionBlurStrength:(double)a3
{
  self->_motionBlurStrength = a3;
  -[TSDMetalMotionBlurEffect p_updateMaxVelocityInShadersWithScale:isColorFBO:](self, "p_updateMaxVelocityInShadersWithScale:isColorFBO:", 0, 1.0);
}

- (CGSize)velocityScaleForColorFBO:(BOOL)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.2;
  v4 = 0.2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)velocityScale
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[TSDMetalMotionBlurEffect velocityScaleForColorFBO:](self, "velocityScaleForColorFBO:", 0);
  v3 = 1.0 / v2;
  v5 = 1.0 / v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)p_updateMaxVelocityInShadersWithScale:(double)a3 isColorFBO:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[TSDMetalMotionBlurEffect velocityScaleForColorFBO:](self, "velocityScaleForColorFBO:", a4);
  v8 = TSDMultiplySizeScalar(v6, v7, a3);
  v10 = v9;
  -[TSDMetalMotionBlurEffect motionBlurStrength](self, "motionBlurStrength");
  v12 = TSDMultiplySizeScalar(v8, v10, v11);
  v14 = TSDMultiplySizeScalar(v12, v13, 0.5);
  v16 = TSDMultiplySizeScalar(v14, v15, 0.5);
  result.height = v17;
  result.width = v16;
  return result;
}

- (CATransform3D)adjustTransformForMotionBlurBuffer:(SEL)a3
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CATransform3D v11;
  CATransform3D a;
  CATransform3D v13;
  CATransform3D v14;
  CATransform3D v15;

  memset(&v15, 0, sizeof(v15));
  CATransform3DMakeTranslation(&v15, (self->_framebufferSize.width - self->_slideSize.width) * 0.5, (self->_framebufferSize.height - self->_slideSize.height) * 0.5, 0.0);
  memset(&v14, 0, sizeof(v14));
  CATransform3DMakeScale(&v14, 0.833333333, 0.833333333, 1.0);
  a = v15;
  v11 = v14;
  CATransform3DConcat(&v13, &a, &v11);
  v6 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&a.m33 = v6;
  v7 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&a.m43 = v7;
  v8 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&a.m13 = v8;
  v9 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&a.m23 = v9;
  return CATransform3DConcat(retstr, &v13, &a);
}

- (id)bindColorAndVelocityWithMetalContext:(id)a3 shouldFillBackground:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  MTLCommandBuffer *v9;
  MTLCommandBuffer *currentCommandBuffer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_metalContext, a3);
  -[TSDMetalContext commandQueue](self->_metalContext, "commandQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commandBuffer");
  v9 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = v9;

  -[TSDMetalMotionBlurEffect setupMotionBlurEffectIfNecessary](self, "setupMotionBlurEffectIfNecessary");
  if (v4)
  {
    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClearColor:", 1.0, 0.0, 0.0, 1.0);

  }
  -[MTLCommandBuffer renderCommandEncoderWithDescriptor:](self->_currentCommandBuffer, "renderCommandEncoderWithDescriptor:", self->_colorAndVelocityPassDescriptor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  }
  return v13;
}

- (id)colorAndVelocityShader
{
  TSDMetalShader *colorAndVelocityShader;

  colorAndVelocityShader = self->_colorAndVelocityShader;
  if (!colorAndVelocityShader)
  {
    -[TSDMetalMotionBlurEffect setupMotionBlurEffectIfNecessary](self, "setupMotionBlurEffectIfNecessary");
    colorAndVelocityShader = self->_colorAndVelocityShader;
  }
  return colorAndVelocityShader;
}

- (id)colorAndVelocityBlendingShader
{
  TSDMetalShader *colorAndVelocityBlendingShader;

  colorAndVelocityBlendingShader = self->_colorAndVelocityBlendingShader;
  if (!colorAndVelocityBlendingShader)
  {
    -[TSDMetalMotionBlurEffect setupMotionBlurEffectIfNecessary](self, "setupMotionBlurEffectIfNecessary");
    colorAndVelocityBlendingShader = self->_colorAndVelocityBlendingShader;
  }
  return colorAndVelocityBlendingShader;
}

- (void)drawResultWithWorkingRenderEncoder:(id)a3 destinationRenderEncoder:(id)a4
{
  -[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:opacity:](self, "drawResultWithWorkingRenderEncoder:destinationRenderEncoder:opacity:", a3, a4, 1.0);
}

- (void)drawResultWithWorkingRenderEncoder:(id)a3 destinationRenderEncoder:(id)a4 opacity:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  MTLCommandBuffer *currentCommandBuffer;
  id v20;

  v20 = a3;
  v8 = a4;
  if (!self->_randomGenerator)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:opacity:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 251, CFSTR("invalid nil value for '%s'"), "_randomGenerator");

  }
  v12 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:opacity:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 252, CFSTR("invalid nil value for '%s'"), "workingRenderEncoder");

    v12 = 0;
  }
  objc_msgSend(v12, "endEncoding");
  v16 = -[MTLTexture width](self->_combinedTextureColor1, "width");
  if (v16 == -[MTLTexture width](self->_colorTexture1, "width"))
  {
    v17 = -[MTLTexture height](self->_combinedTextureColor1, "height");
    v18 = v17 == -[MTLTexture height](self->_colorTexture1, "height");
  }
  else
  {
    v18 = 0;
  }
  if (-[TSDMetalMotionBlurEffect debugDrawMode](self, "debugDrawMode") != 1)
    -[TSDMetalMotionBlurEffect p_blitIntoVelocityTexture](self, "p_blitIntoVelocityTexture");
  if (!v18)
    -[TSDMetalMotionBlurEffect p_blitIntoColorFramebuffer](self, "p_blitIntoColorFramebuffer");
  switch(-[TSDMetalMotionBlurEffect debugDrawMode](self, "debugDrawMode"))
  {
    case 0:
      -[TSDMetalMotionBlurEffect p_dilateVelocityTexture](self, "p_dilateVelocityTexture");
      goto LABEL_14;
    case 1:
      -[TSDMetalMotionBlurEffect p_debugDrawModeColorBufferWithEncoder:](self, "p_debugDrawModeColorBufferWithEncoder:", v8);
      break;
    case 2:
      -[TSDMetalMotionBlurEffect p_debugDrawModeVelocityBufferWithEncoder:](self, "p_debugDrawModeVelocityBufferWithEncoder:", v8);
      break;
    case 3:
      -[TSDMetalMotionBlurEffect p_dilateVelocityTexture](self, "p_dilateVelocityTexture");
      -[TSDMetalMotionBlurEffect p_debugDrawModeVelocityBufferDilatedWithEncoder:](self, "p_debugDrawModeVelocityBufferDilatedWithEncoder:", v8);
      break;
    case 4:
LABEL_14:
      -[TSDMetalMotionBlurEffect p_drawWithEncoder:opacity:](self, "p_drawWithEncoder:opacity:", v8, a5);
      break;
    default:
      break;
  }
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = 0;

}

- (CGSize)p_velocityFramebufferSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = TSDCeilSize(self->_framebufferSize.width * 0.03125);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)p_velocityFramebufferTextureScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[TSDMetalMotionBlurEffect p_velocityFramebufferSize](self, "p_velocityFramebufferSize");
  v6 = 1.0 / (TSDMultiplySizeScalar(v3, v4, 32.0) / self->_framebufferSize.width);
  v7 = 1.0 / (v5 / self->_framebufferSize.height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)p_squashedVelocityFramebufferSize
{
  double v3;
  double height;
  CGSize result;

  -[TSDMetalMotionBlurEffect p_velocityFramebufferSize](self, "p_velocityFramebufferSize");
  height = self->_framebufferSize.height;
  result.height = height;
  result.width = v3;
  return result;
}

- (void)p_debugDrawModeColorBufferWithEncoder:(id)a3
{
  id v4;
  int v5;
  _OWORD v6[4];
  float64x2_t v7;
  float64x2_t framebufferSize;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;

  v7 = 0uLL;
  framebufferSize = (float64x2_t)self->_framebufferSize;
  v9 = (float64x2_t)xmmword_217C2A2A0;
  v4 = a3;
  objc_msgSend(v4, "setViewport:", &v7);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  framebufferSize = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v7, 0.0, self->_framebufferSize.width, 0.0, self->_framebufferSize.height, -1.0, 1.0);
  v6[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v7), framebufferSize);
  v6[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
  v6[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
  v6[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
  v5 = 1065353216;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_defaultTextureShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v4, v6, &v5);
  objc_msgSend(v4, "setFragmentTexture:atIndex:", self->_combinedTextureColor1, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_FBODataBufferFlipped, "drawWithEncoder:atIndex:", v4, -[TSDMetalShader bufferIndex](self->_defaultTextureShader, "bufferIndex"));

}

- (void)p_debugDrawModeVelocityBufferWithEncoder:(id)a3
{
  double width;
  double height;
  id v6;
  _OWORD v7[4];
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  width = self->_framebufferSize.width;
  height = self->_framebufferSize.height;
  v6 = a3;
  TSDTransform3DMakeOrtho((uint64_t)&v8, 0.0, width, 0.0, height, -1.0, 1.0);
  v7[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9);
  v7[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v11);
  v7[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), v13);
  v7[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v15);
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_velocityVisualizerShader, "setPipelineStateWithEncoder:vertexBytes:", v6, v7);
  objc_msgSend(v6, "setFragmentTexture:atIndex:", self->_combinedTextureVelocity, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_FBODataBufferFlipped, "drawWithEncoder:atIndex:", v6, -[TSDMetalShader bufferIndex](self->_velocityVisualizerShader, "bufferIndex"));

}

- (void)p_debugDrawModeVelocityBufferDilatedWithEncoder:(id)a3
{
  double width;
  double height;
  id v6;
  _OWORD v7[4];
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  width = self->_framebufferSize.width;
  height = self->_framebufferSize.height;
  v6 = a3;
  TSDTransform3DMakeOrtho((uint64_t)&v8, 0.0, width, 0.0, height, -1.0, 1.0);
  v7[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9);
  v7[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v11);
  v7[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), v13);
  v7[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v15);
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_velocityVisualizerShader, "setPipelineStateWithEncoder:vertexBytes:", v6, v7);
  objc_msgSend(v6, "setFragmentTexture:atIndex:", self->_velocityTexture1, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_FBODataBuffer, "drawWithEncoder:atIndex:", v6, -[TSDMetalShader bufferIndex](self->_velocityVisualizerShader, "bufferIndex"));

}

- (void)p_blitIntoVelocityTexture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float32x2_t v23;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  int v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x2_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;

  if (!self->_velocityTextureSquashed)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalMotionBlurEffect p_blitIntoVelocityTexture]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 382, CFSTR("invalid nil value for '%s'"), "_velocityTextureSquashed");

  }
  if (!self->_velocitySquashedFBODataBuffer)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalMotionBlurEffect p_blitIntoVelocityTexture]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 383, CFSTR("invalid nil value for '%s'"), "_velocitySquashedFBODataBuffer");

  }
  -[TSDMetalMotionBlurEffect p_squashedVelocityFramebufferSize](self, "p_squashedVelocityFramebufferSize");
  v10 = v9;
  v12 = v11;
  -[MTLCommandBuffer renderCommandEncoderWithDescriptor:](self->_currentCommandBuffer, "renderCommandEncoderWithDescriptor:", self->_tileHorizontalPassDescriptor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0uLL;
  v50.f64[0] = v10;
  v50.f64[1] = v12;
  v51 = (float64x2_t)xmmword_217C2A2A0;
  objc_msgSend(v13, "setViewport:", &v49);
  -[TSDMetalMotionBlurEffect p_velocityFramebufferTextureScale](self, "p_velocityFramebufferTextureScale");
  v15 = v14;
  v17 = v16;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v49, 0.0, v10, 0.0, v12, -1.0, 1.0);
  v47 = 0;
  v48 = 0;
  v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v50);
  v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v52);
  v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v53), v54);
  v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v55), v56);
  __asm { FMOV            V1.2D, #1.0 }
  v23 = vcvt_f32_f64(vdivq_f64(_Q1, (float64x2_t)self->_framebufferSize));
  *(float *)_Q1.f64 = v15;
  __asm { FMOV            V2.2S, #1.0 }
  v31 = _D2;
  LODWORD(_D2) = LODWORD(_Q1.f64[0]);
  v45 = v23;
  v46 = _D2;
  LODWORD(v47) = 1107296256;
  WORD2(v47) = 8;
  BYTE6(v47) = 1;
  v40 = 8;
  BYTE2(v40) = self->_isSingleObject;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_velocityTileMaxHorizontalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v13, &v41, &v40);
  objc_msgSend(v13, "setFragmentTexture:atIndex:", self->_combinedTextureVelocity, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_velocitySquashedFBODataBuffer, "drawWithEncoder:atIndex:", v13, -[TSDMetalShader bufferIndex](self->_velocityTileMaxHorizontalShader, "bufferIndex"));
  objc_msgSend(v13, "endEncoding");
  -[TSDMetalMotionBlurEffect p_velocityFramebufferSize](self, "p_velocityFramebufferSize");
  v26 = v25;
  v28 = v27;
  -[MTLCommandBuffer renderCommandEncoderWithDescriptor:](self->_currentCommandBuffer, "renderCommandEncoderWithDescriptor:", self->_tileVerticalPassDescriptor);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0uLL;
  v33.f64[0] = v26;
  v33.f64[1] = v28;
  v34 = (float64x2_t)xmmword_217C2A2A0;
  objc_msgSend(v29, "setViewport:", &v32);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v32, 0.0, v26, 0.0, v28, -1.0, 1.0);
  v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
  v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v34), v35);
  v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v36), v37);
  v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v39);
  *(float *)&v30 = v17;
  v46 = __PAIR64__(v30, v31);
  BYTE6(v47) = 0;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_velocityTileMaxVerticalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v29, &v41, &v40);
  objc_msgSend(v29, "setFragmentTexture:atIndex:", self->_velocityTextureSquashed, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_velocityFBODataBuffer, "drawWithEncoder:atIndex:", v29, -[TSDMetalShader bufferIndex](self->_velocityTileMaxVerticalShader, "bufferIndex"));
  objc_msgSend(v29, "endEncoding");

}

- (void)p_dilateVelocityTexture
{
  double v3;
  double v4;
  void *v5;
  float64x2_t v6;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  _QWORD v16[4];
  __int128 v17;
  _OWORD v18[4];
  float32x2_t v19;
  uint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;

  -[TSDMetalMotionBlurEffect p_velocityFramebufferSize](self, "p_velocityFramebufferSize");
  v14 = v3;
  v15 = v4;
  -[MTLCommandBuffer renderCommandEncoderWithDescriptor:](self->_currentCommandBuffer, "renderCommandEncoderWithDescriptor:", self->_neighborHorizontalPassDescriptor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0uLL;
  v26.f64[0] = v14;
  v26.f64[1] = v15;
  v27 = (float64x2_t)xmmword_217C2A2A0;
  objc_msgSend(v5, "setViewport:", &v25);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v25, 0.0, v14, 0.0, v15, -1.0, 1.0);
  v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v26);
  v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27), v28);
  v23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v30);
  v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v32);
  v18[0] = v21;
  v18[1] = v22;
  v6.f64[0] = v14;
  v6.f64[1] = v15;
  v18[2] = v23;
  v18[3] = v24;
  __asm { FMOV            V1.2D, #1.0 }
  v19 = vcvt_f32_f64(vdivq_f64(_Q1, v6));
  v20 = 65539;
  BYTE3(v20) = self->_isSingleObject;
  v12 = -[TSDMetalShader bufferIndex](self->_velocityNeighborMaxHorizontalShader, "bufferIndex");
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_velocityNeighborMaxHorizontalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v5, &v21, v18);
  objc_msgSend(v5, "setFragmentTexture:atIndex:", self->_velocityTexture1, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_velocityFBODataBuffer, "drawWithEncoder:atIndex:", v5, v12);
  objc_msgSend(v5, "endEncoding");
  -[MTLCommandBuffer renderCommandEncoderWithDescriptor:](self->_currentCommandBuffer, "renderCommandEncoderWithDescriptor:", self->_neighborVerticalPassDescriptor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = 0;
  v16[1] = 0;
  *(double *)&v16[2] = v14;
  *(double *)&v16[3] = v15;
  v17 = xmmword_217C2A2A0;
  objc_msgSend(v13, "setViewport:", v16);
  BYTE2(v20) = 0;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_velocityNeighborMaxVerticalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v13, &v21, v18);
  objc_msgSend(v13, "setFragmentTexture:atIndex:", self->_velocityTexture2, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_velocityFBODataBuffer, "drawWithEncoder:atIndex:", v13, v12);
  objc_msgSend(v13, "endEncoding");

}

- (void)p_drawWithEncoder:(id)a3 opacity:(double)a4
{
  id v6;
  uint64_t v7;
  MTLTexture **p_colorTexture1;
  uint64_t v9;
  BOOL v10;
  MTLTexture *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64_t v16;
  float64x2_t v17;
  double v23;
  float64x2_t v24;
  float64_t v25;
  void *v26;
  CGFloat v27;
  unint64_t v28;
  unint64_t v29;
  MTLTexture *v30;
  float64_t v31;
  float64x2_t v32;
  double v33;
  float64x2_t v34;
  float64_t v35;
  float64_t v36;
  float64_t v37;
  float64_t v38;
  float64_t v39;
  float64_t v40;
  float64_t v41;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v44;
  CATransform3D v45;
  CATransform3D v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  uint64_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x2_t v55;
  uint64_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;

  v6 = a3;
  v7 = -[MTLTexture width](self->_combinedTextureColor1, "width");
  p_colorTexture1 = &self->_colorTexture1;
  if (v7 == -[MTLTexture width](self->_colorTexture1, "width"))
  {
    v9 = -[MTLTexture height](self->_combinedTextureColor1, "height");
    v10 = v9 == -[MTLTexture height](*p_colorTexture1, "height");
    if (v10)
      p_colorTexture1 = &self->_combinedTextureColor1;
  }
  else
  {
    v10 = 0;
  }
  v11 = *p_colorTexture1;
  -[TSDMetalMotionBlurEffect p_velocityFramebufferSize](self, "p_velocityFramebufferSize");
  v38 = v13;
  v39 = v12;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v57, 0.0, self->_framebufferSize.width, 0.0, self->_framebufferSize.height, -1.0, 1.0);
  -[TSDMetalMotionBlurEffect p_updateMaxVelocityInShadersWithScale:isColorFBO:](self, "p_updateMaxVelocityInShadersWithScale:isColorFBO:", 1, 0.4);
  v36 = v15;
  v37 = v14;
  -[TSDMetalMotionBlurEffect p_velocityFramebufferTextureScale](self, "p_velocityFramebufferTextureScale");
  v56 = 0;
  v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v58);
  v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v59), v60);
  v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v62);
  v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v63), v64);
  LOBYTE(v56) = self->_isSingleObject;
  v17.f64[1] = v16;
  __asm { FMOV            V1.2D, #1.0 }
  v55 = vcvt_f32_f64(vdivq_f64(_Q1, v17));
  v50 = 0;
  v49 = 0;
  v17.f64[0] = v39;
  v17.f64[1] = v38;
  _Q1.f64[0] = v37;
  _Q1.f64[1] = v36;
  v47 = vcvt_f32_f64(v17);
  v48 = vcvt_f32_f64(_Q1);
  if (!-[TSDMetalMotionBlurEffect isSingleObject](self, "isSingleObject"))
  {
    -[TSDAnimationRandomGenerator randomDouble](self->_randomGenerator, "randomDouble");
    v40 = v23;
    -[TSDAnimationRandomGenerator randomDouble](self->_randomGenerator, "randomDouble");
    v24.f64[0] = v40;
    v24.f64[1] = v25;
    v49 = vcvt_f32_f64(v24);
  }
  LODWORD(v50) = 1065353216;
  WORD2(v50) = 5;
  BYTE6(v50) = self->_isSingleObject;
  -[MTLCommandBuffer renderCommandEncoderWithDescriptor:](self->_currentCommandBuffer, "renderCommandEncoderWithDescriptor:", self->_combined1PassDescriptor);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_velocityCollectionShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v26, &v51, &v47);
  v27 = (double)(unint64_t)-[MTLTexture width](self->_colorTexture2, "width");
  v28 = -[MTLTexture height](self->_colorTexture2, "height");
  v46.m12 = 0.0;
  v46.m11 = 0.0;
  v46.m13 = v27;
  v46.m14 = (double)v28;
  *(_OWORD *)&v46.m21 = xmmword_217C2A2A0;
  objc_msgSend(v26, "setViewport:", &v46);
  v29 = -[TSDMetalShader bufferIndex](self->_velocityCollectionShader, "bufferIndex");
  objc_msgSend(v26, "setFragmentTexture:atIndex:", v11, 0);
  objc_msgSend(v26, "setFragmentTexture:atIndex:", self->_velocityTexture1, 1);
  objc_msgSend(v26, "setFragmentTexture:atIndex:", self->_combinedTextureVelocity, 2);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_colorFBODataBuffer, "drawWithEncoder:atIndex:", v26, v29);
  objc_msgSend(v26, "endEncoding");
  -[MTLCommandBuffer commit](self->_currentCommandBuffer, "commit");
  v30 = self->_colorTexture2;

  if (v10)
  {
    memset(&v46, 0, sizeof(v46));
    CATransform3DMakeTranslation(&v46, (self->_framebufferSize.width - self->_slideSize.width) * -0.5, (self->_framebufferSize.height - self->_slideSize.height) * -0.5, 0.0);
    memset(&v45, 0, sizeof(v45));
    TSDTransform3DMakeOrtho((uint64_t)&v45, 0.0, self->_slideSize.width, 0.0, self->_slideSize.height, -1.0, 1.0);
    a = v46;
    b = v45;
    CATransform3DConcat(&v44, &a, &b);
    v61 = *(float64x2_t *)&v44.m31;
    v62 = *(float64x2_t *)&v44.m33;
    v63 = *(float64x2_t *)&v44.m41;
    v64 = *(float64x2_t *)&v44.m43;
    v57 = *(float64x2_t *)&v44.m11;
    v58 = *(float64x2_t *)&v44.m13;
    v59 = *(float64x2_t *)&v44.m21;
    v60 = *(float64x2_t *)&v44.m23;
    v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m11), *(float64x2_t *)&v44.m13);
    v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m21), *(float64x2_t *)&v44.m23);
    v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m31), *(float64x2_t *)&v44.m33);
    v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m41), *(float64x2_t *)&v44.m43);
    v44.m11 = 0.0;
    v44.m12 = 0.0;
    *(CGSize *)&v44.m13 = self->_slideSize;
    *(_OWORD *)&v44.m21 = xmmword_217C2A2A0;
    objc_msgSend(v6, "setViewport:", &v44);
    -[TSDMetalMotionBlurEffect p_updateMaxVelocityInShadersWithScale:isColorFBO:](self, "p_updateMaxVelocityInShadersWithScale:isColorFBO:", 1, 1.0);
    v32.f64[1] = v31;
    v48 = vcvt_f32_f64(v32);
    *(float *)v32.f64 = a4;
    LODWORD(v50) = LODWORD(v32.f64[0]);
    if (!-[TSDMetalMotionBlurEffect isSingleObject](self, "isSingleObject"))
    {
      -[TSDAnimationRandomGenerator randomDouble](self->_randomGenerator, "randomDouble");
      v41 = v33;
      -[TSDAnimationRandomGenerator randomDouble](self->_randomGenerator, "randomDouble");
      v34.f64[0] = v41;
      v34.f64[1] = v35;
      v49 = vcvt_f32_f64(v34);
    }
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_velocityCollectionShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v6, &v51, &v47);
    objc_msgSend(v6, "setFragmentTexture:atIndex:", v30, 0);
    objc_msgSend(v6, "setFragmentTexture:atIndex:", self->_velocityTexture1, 1);
    objc_msgSend(v6, "setFragmentTexture:atIndex:", self->_combinedTextureVelocity, 2);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_FBODataBuffer, "drawWithEncoder:atIndex:", v6, v29);
  }

}

- (void)setupMotionBlurEffectIfNecessary
{
  -[TSDMetalMotionBlurEffect p_setupTextures](self, "p_setupTextures");
  -[TSDMetalMotionBlurEffect p_setupBuffers](self, "p_setupBuffers");
  -[TSDMetalMotionBlurEffect p_setupShaders](self, "p_setupShaders");
  -[TSDMetalMotionBlurEffect p_setupRenderPasses](self, "p_setupRenderPasses");
}

- (void)p_setupShaders
{
  id v3;
  TSDMetalShader *v4;
  TSDMetalShader *defaultTextureShader;
  TSDMetalShader *v6;
  TSDMetalShader *velocityCollectionShader;
  TSDMetalShader *v8;
  TSDMetalShader *velocityTileMaxHorizontalShader;
  TSDMetalShader *v10;
  TSDMetalShader *velocityTileMaxVerticalShader;
  TSDMetalShader *v12;
  TSDMetalShader *velocityNeighborMaxHorizontalShader;
  TSDMetalShader *v14;
  TSDMetalShader *velocityNeighborMaxVerticalShader;
  id v16;
  TSDMetalShader *v17;
  TSDMetalShader *colorAndVelocityShader;
  TSDMetalShader *v19;
  TSDMetalShader *colorAndVelocityBlendingShader;
  id v21;

  if (!self->_velocityTileMaxHorizontalShader)
  {
    -[TSDMetalContext device](self->_metalContext, "device");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v3, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    objc_msgSend(v3, "setBlendingEnabled:", 1);
    objc_msgSend(v3, "setRgbBlendOperation:", 0);
    objc_msgSend(v3, "setAlphaBlendOperation:", 0);
    objc_msgSend(v3, "setSourceRGBBlendFactor:", 1);
    objc_msgSend(v3, "setSourceAlphaBlendFactor:", 1);
    objc_msgSend(v3, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v3, "setDestinationAlphaBlendFactor:", 5);
    v4 = -[TSDMetalShader initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v21, v3);
    defaultTextureShader = self->_defaultTextureShader;
    self->_defaultTextureShader = v4;

    v6 = -[TSDMetalShader initDefaultVelocityCollectionShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultVelocityCollectionShaderWithDevice:colorAttachment:", v21, v3);
    velocityCollectionShader = self->_velocityCollectionShader;
    self->_velocityCollectionShader = v6;

    objc_msgSend(v3, "setBlendingEnabled:", 0);
    v8 = -[TSDMetalShader initDefaultTileMaxBlurShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultTileMaxBlurShaderWithDevice:colorAttachment:", v21, v3);
    velocityTileMaxHorizontalShader = self->_velocityTileMaxHorizontalShader;
    self->_velocityTileMaxHorizontalShader = v8;

    v10 = -[TSDMetalShader initDefaultTileMaxBlurShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultTileMaxBlurShaderWithDevice:colorAttachment:", v21, v3);
    velocityTileMaxVerticalShader = self->_velocityTileMaxVerticalShader;
    self->_velocityTileMaxVerticalShader = v10;

    v12 = -[TSDMetalShader initDefaultNeighborMaxBlurShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultNeighborMaxBlurShaderWithDevice:colorAttachment:", v21, v3);
    velocityNeighborMaxHorizontalShader = self->_velocityNeighborMaxHorizontalShader;
    self->_velocityNeighborMaxHorizontalShader = v12;

    v14 = -[TSDMetalShader initDefaultNeighborMaxBlurShaderWithDevice:colorAttachment:]([TSDMetalShader alloc], "initDefaultNeighborMaxBlurShaderWithDevice:colorAttachment:", v21, v3);
    velocityNeighborMaxVerticalShader = self->_velocityNeighborMaxVerticalShader;
    self->_velocityNeighborMaxVerticalShader = v14;

    objc_msgSend(v3, "setBlendingEnabled:", 1);
    v16 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v16, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    v17 = -[TSDMetalShader initDefaultTextureAndOpacityMotionBlurShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:]([TSDMetalShader alloc], "initDefaultTextureAndOpacityMotionBlurShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:", v21, v3, v16, 1);
    colorAndVelocityShader = self->_colorAndVelocityShader;
    self->_colorAndVelocityShader = v17;

    v19 = -[TSDMetalShader initDefaultBlendShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:]([TSDMetalShader alloc], "initDefaultBlendShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:", v21, v3, v16, 1);
    colorAndVelocityBlendingShader = self->_colorAndVelocityBlendingShader;
    self->_colorAndVelocityBlendingShader = v19;

  }
}

- (void)p_setupTextures
{
  unint64_t v3;
  void *v4;
  MTLTexture *v5;
  MTLTexture *combinedTextureColor1;
  MTLTexture *v7;
  MTLTexture *combinedTextureColor2;
  MTLTexture *v9;
  MTLTexture *combinedTextureVelocity;
  double v11;
  double v12;
  double v13;
  void *v14;
  MTLTexture *v15;
  MTLTexture *colorTexture1;
  MTLTexture *v17;
  MTLTexture *colorTexture2;
  double v19;
  double v20;
  double v21;
  double v22;
  MTLTexture *velocityTexture1;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  MTLTexture *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  MTLTexture *velocityTexture2;
  void *v33;
  MTLTexture *v34;
  MTLTexture *velocityTextureSquashed;
  TSDMTLDataBuffer *v36;
  TSDMTLDataBuffer *velocityFBODataBuffer;
  TSDMTLDataBuffer *v38;
  TSDMTLDataBuffer *velocitySquashedFBODataBuffer;
  id v40;

  -[TSDMetalContext device](self->_metalContext, "device");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat");
  if (!self->_combinedTextureColor1)
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v3, (unint64_t)self->_framebufferSize.width, (unint64_t)self->_framebufferSize.height, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsage:", 5);
    objc_msgSend(v4, "setStorageMode:", 2);
    v5 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v4);
    combinedTextureColor1 = self->_combinedTextureColor1;
    self->_combinedTextureColor1 = v5;

    v7 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v4);
    combinedTextureColor2 = self->_combinedTextureColor2;
    self->_combinedTextureColor2 = v7;

    v9 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v4);
    combinedTextureVelocity = self->_combinedTextureVelocity;
    self->_combinedTextureVelocity = v9;

  }
  if (!self->_colorTexture1)
  {
    v11 = TSDMultiplySizeScalar(self->_framebufferSize.width, self->_framebufferSize.height, self->_framebufferScale);
    v12 = TSDCeilSize(v11);
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v3, (unint64_t)v12, (unint64_t)v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUsage:", 5);
    objc_msgSend(v14, "setStorageMode:", 2);
    v15 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v14);
    colorTexture1 = self->_colorTexture1;
    self->_colorTexture1 = v15;

    v17 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v14);
    colorTexture2 = self->_colorTexture2;
    self->_colorTexture2 = v17;

  }
  -[TSDMetalMotionBlurEffect p_velocityFramebufferSize](self, "p_velocityFramebufferSize");
  v20 = v19;
  v22 = v21;
  velocityTexture1 = self->_velocityTexture1;
  if (!velocityTexture1
    || v19 != (double)(unint64_t)-[MTLTexture width](velocityTexture1, "width")
    || v22 != (double)(unint64_t)-[MTLTexture height](self->_velocityTexture1, "height"))
  {
    -[TSDMetalMotionBlurEffect p_squashedVelocityFramebufferSize](self, "p_squashedVelocityFramebufferSize");
    v25 = v24;
    v27 = v26;
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v3, (unint64_t)v20, (unint64_t)v22, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUsage:", 5);
    objc_msgSend(v28, "setStorageMode:", 2);
    v29 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v28);
    v30 = self->_velocityTexture1;
    self->_velocityTexture1 = v29;

    v31 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v28);
    velocityTexture2 = self->_velocityTexture2;
    self->_velocityTexture2 = v31;

    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"), (unint64_t)v25, (unint64_t)v27, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "setUsage:", 5);
    objc_msgSend(v33, "setStorageMode:", 2);
    v34 = (MTLTexture *)objc_msgSend(v40, "newTextureWithDescriptor:", v33);
    velocityTextureSquashed = self->_velocityTextureSquashed;
    self->_velocityTextureSquashed = v34;

    v36 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 0, v40, TSDRectWithSize());
    velocityFBODataBuffer = self->_velocityFBODataBuffer;
    self->_velocityFBODataBuffer = v36;

    v38 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 1, v40, TSDRectWithSize());
    velocitySquashedFBODataBuffer = self->_velocitySquashedFBODataBuffer;
    self->_velocitySquashedFBODataBuffer = v38;

  }
}

- (void)p_setupBuffers
{
  TSDMTLDataBuffer *v3;
  TSDMTLDataBuffer *FBODataBuffer;
  TSDMTLDataBuffer *v5;
  TSDMTLDataBuffer *FBODataBufferFlipped;
  TSDMTLDataBuffer *v7;
  TSDMTLDataBuffer *colorFBODataBuffer;
  id v9;

  if (!self->_FBODataBuffer)
  {
    -[TSDMetalContext device](self->_metalContext, "device");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 0, v9, TSDRectWithSize());
    FBODataBuffer = self->_FBODataBuffer;
    self->_FBODataBuffer = v3;

    v5 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 1, v9, TSDRectWithSize());
    FBODataBufferFlipped = self->_FBODataBufferFlipped;
    self->_FBODataBufferFlipped = v5;

    -[MTLTexture width](self->_colorTexture1, "width");
    -[MTLTexture height](self->_colorTexture1, "height");
    v7 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 0, v9, TSDRectWithSize());
    colorFBODataBuffer = self->_colorFBODataBuffer;
    self->_colorFBODataBuffer = v7;

  }
}

- (void)p_setupRenderPasses
{
  MTLRenderPassDescriptor *v3;
  MTLRenderPassDescriptor *colorAndVelocityPassDescriptor;
  MTLTexture *combinedTextureColor1;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTLTexture *combinedTextureVelocity;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MTLRenderPassDescriptor *v23;
  MTLRenderPassDescriptor *tileHorizontalPassDescriptor;
  MTLTexture *velocityTextureSquashed;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MTLRenderPassDescriptor *v34;
  MTLRenderPassDescriptor *tileVerticalPassDescriptor;
  MTLTexture *velocityTexture1;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MTLRenderPassDescriptor *v45;
  MTLRenderPassDescriptor *neighborHorizontalPassDescriptor;
  MTLTexture *velocityTexture2;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  MTLRenderPassDescriptor *v56;
  MTLRenderPassDescriptor *neighborVerticalPassDescriptor;
  MTLTexture *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  MTLRenderPassDescriptor *v67;
  MTLRenderPassDescriptor *combined1PassDescriptor;
  MTLTexture *colorTexture2;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;

  if (!self->_colorAndVelocityPassDescriptor)
  {
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v3 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    colorAndVelocityPassDescriptor = self->_colorAndVelocityPassDescriptor;
    self->_colorAndVelocityPassDescriptor = v3;

    combinedTextureColor1 = self->_combinedTextureColor1;
    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTexture:", combinedTextureColor1);

    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    combinedTextureVelocity = self->_combinedTextureVelocity;
    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:", combinedTextureVelocity);

    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_colorAndVelocityPassDescriptor, "colorAttachments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v23 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    tileHorizontalPassDescriptor = self->_tileHorizontalPassDescriptor;
    self->_tileHorizontalPassDescriptor = v23;

    velocityTextureSquashed = self->_velocityTextureSquashed;
    -[MTLRenderPassDescriptor colorAttachments](self->_tileHorizontalPassDescriptor, "colorAttachments");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTexture:", velocityTextureSquashed);

    -[MTLRenderPassDescriptor colorAttachments](self->_tileHorizontalPassDescriptor, "colorAttachments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_tileHorizontalPassDescriptor, "colorAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_tileHorizontalPassDescriptor, "colorAttachments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v34 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    tileVerticalPassDescriptor = self->_tileVerticalPassDescriptor;
    self->_tileVerticalPassDescriptor = v34;

    velocityTexture1 = self->_velocityTexture1;
    -[MTLRenderPassDescriptor colorAttachments](self->_tileVerticalPassDescriptor, "colorAttachments");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTexture:", velocityTexture1);

    -[MTLRenderPassDescriptor colorAttachments](self->_tileVerticalPassDescriptor, "colorAttachments");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_tileVerticalPassDescriptor, "colorAttachments");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_tileVerticalPassDescriptor, "colorAttachments");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v45 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    neighborHorizontalPassDescriptor = self->_neighborHorizontalPassDescriptor;
    self->_neighborHorizontalPassDescriptor = v45;

    velocityTexture2 = self->_velocityTexture2;
    -[MTLRenderPassDescriptor colorAttachments](self->_neighborHorizontalPassDescriptor, "colorAttachments");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTexture:", velocityTexture2);

    -[MTLRenderPassDescriptor colorAttachments](self->_neighborHorizontalPassDescriptor, "colorAttachments");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_neighborHorizontalPassDescriptor, "colorAttachments");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_neighborHorizontalPassDescriptor, "colorAttachments");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v56 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    neighborVerticalPassDescriptor = self->_neighborVerticalPassDescriptor;
    self->_neighborVerticalPassDescriptor = v56;

    v58 = self->_velocityTexture1;
    -[MTLRenderPassDescriptor colorAttachments](self->_neighborVerticalPassDescriptor, "colorAttachments");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTexture:", v58);

    -[MTLRenderPassDescriptor colorAttachments](self->_neighborVerticalPassDescriptor, "colorAttachments");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_neighborVerticalPassDescriptor, "colorAttachments");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_neighborVerticalPassDescriptor, "colorAttachments");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v67 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    combined1PassDescriptor = self->_combined1PassDescriptor;
    self->_combined1PassDescriptor = v67;

    colorTexture2 = self->_colorTexture2;
    -[MTLRenderPassDescriptor colorAttachments](self->_combined1PassDescriptor, "colorAttachments");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setTexture:", colorTexture2);

    -[MTLRenderPassDescriptor colorAttachments](self->_combined1PassDescriptor, "colorAttachments");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor colorAttachments](self->_combined1PassDescriptor, "colorAttachments");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setStoreAction:", 1);

    -[MTLRenderPassDescriptor colorAttachments](self->_combined1PassDescriptor, "colorAttachments");
    v77 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  }
}

- (BOOL)isSingleObject
{
  return self->_isSingleObject;
}

- (void)setIsSingleObject:(BOOL)a3
{
  self->_isSingleObject = a3;
}

- (double)motionBlurStrength
{
  return self->_motionBlurStrength;
}

- (int64_t)debugDrawMode
{
  return self->_debugDrawMode;
}

- (void)setDebugDrawMode:(int64_t)a3
{
  self->_debugDrawMode = a3;
}

- (double)framebufferScale
{
  return self->_framebufferScale;
}

- (void)setFramebufferScale:(double)a3
{
  self->_framebufferScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_currentCommandBuffer, 0);
  objc_storeStrong((id *)&self->_randomGenerator, 0);
  objc_storeStrong((id *)&self->_combined1PassDescriptor, 0);
  objc_storeStrong((id *)&self->_neighborVerticalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_neighborHorizontalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_tileVerticalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_tileHorizontalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_colorAndVelocityPassDescriptor, 0);
  objc_storeStrong((id *)&self->_FBODataBufferFlipped, 0);
  objc_storeStrong((id *)&self->_FBODataBuffer, 0);
  objc_storeStrong((id *)&self->_velocitySquashedFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_velocityFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_velocityTextureSquashed, 0);
  objc_storeStrong((id *)&self->_velocityTexture2, 0);
  objc_storeStrong((id *)&self->_velocityTexture1, 0);
  objc_storeStrong((id *)&self->_colorFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_colorTexture2, 0);
  objc_storeStrong((id *)&self->_colorTexture1, 0);
  objc_storeStrong((id *)&self->_velocityNeighborMaxVerticalShader, 0);
  objc_storeStrong((id *)&self->_velocityNeighborMaxHorizontalShader, 0);
  objc_storeStrong((id *)&self->_velocityTileMaxHorizontalShader, 0);
  objc_storeStrong((id *)&self->_velocityTileMaxVerticalShader, 0);
  objc_storeStrong((id *)&self->_velocityCollectionShader, 0);
  objc_storeStrong((id *)&self->_velocityVisualizerShader, 0);
  objc_storeStrong((id *)&self->_colorAndVelocityBlendingShader, 0);
  objc_storeStrong((id *)&self->_colorAndVelocityShader, 0);
  objc_storeStrong((id *)&self->_defaultTextureShader, 0);
  objc_storeStrong((id *)&self->_combinedTextureVelocity, 0);
  objc_storeStrong((id *)&self->_combinedTextureColor2, 0);
  objc_storeStrong((id *)&self->_combinedTextureColor1, 0);
}

@end
