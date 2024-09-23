@implementation PTEffectRenderRequest

- (void)setTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_transform, a3, 48, 1, 0);
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setOutColorBufferWriteSkipped:(BOOL)a3
{
  self->_outColorBufferWriteSkipped = a3;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (NSArray)reactions
{
  return self->_reactions;
}

- (double)frameTimeSeconds
{
  return self->_frameTimeSeconds;
}

- (__CVBuffer)outColorBuffer
{
  return self->_outColorBuffer;
}

- (__CVBuffer)inColorBuffer
{
  return self->_inColorBuffer;
}

- (PTEffectRenderRequest)init
{
  PTEffectRenderRequest *v2;
  float v3;
  double v4;
  uint64_t v5;
  __int128 v6;
  PTEffectRenderRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTEffectRenderRequest;
  v2 = -[PTEffectRenderRequest init](&v9, sel_init);
  if (v2)
  {
    -[PTEffectRenderRequest setFrameTimeSeconds:](v2, "setFrameTimeSeconds:", CACurrentMediaTime());
    -[PTEffectRenderRequest setEffectType:](v2, "setEffectType:", -1);
    -[PTEffectRenderRequest setEffectQuality:](v2, "setEffectQuality:", -1);
    v2->_apertureSDOF = 0.5;
    +[PTEffectRenderRequest relightStrengthStudioLightDefault](PTEffectRenderRequest, "relightStrengthStudioLightDefault");
    v2->_relightStrengthStudioLight = v3;
    -[PTEffectRenderRequest setFocusOnAll:](v2, "setFocusOnAll:", 0);
    -[PTEffectRenderRequest setInScreenCaptureRect:](v2, "setInScreenCaptureRect:", 0.028125, 0.05, 0.6, 0.666666667);
    -[PTEffectRenderRequest setInReactionVideoRect:](v2, "setInReactionVideoRect:", 0.0, 0.0, 1.0, 1.0);
    -[PTEffectRenderRequest setOutColorROI:](v2, "setOutColorROI:", 0.0, 0.0, 1.0, 1.0);
    LODWORD(v4) = 2143289344;
    -[PTEffectRenderRequest setLuxLevel:](v2, "setLuxLevel:", v4);
    v2->_detectedObjects = 0;
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v2->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_transform.c = v6;
    *(_OWORD *)&v2->_transform.tx = *(_OWORD *)(v5 + 32);
    v7 = v2;
  }

  return v2;
}

- (void)setFrameTimeSeconds:(double)a3
{
  self->_frameTimeSeconds = a3;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_effectType = a3;
}

- (void)setLuxLevel:(float)a3
{
  self->_luxLevel = a3;
}

- (void)setInScreenCaptureRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_inScreenCaptureRect, &v3, 32, 1, 0);
}

- (void)setFocusOnAll:(BOOL)a3
{
  self->_focusOnAll = a3;
}

+ (float)relightStrengthStudioLightDefault
{
  return 0.5;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->_effectQuality = a3;
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

- (void)setRelightStrengthStudioLight:(float)a3
{
  double v3;
  float v4;

  v3 = a3;
  if (v3 > 1.0)
    v3 = 1.0;
  v4 = fmax(v3, 0.0);
  self->_relightStrengthStudioLight = v4;
}

- (void)setReactions:(id)a3
{
  objc_storeStrong((id *)&self->_reactions, a3);
}

- (void)setOutColorBuffer:(__CVBuffer *)a3
{
  self->_outColorBuffer = a3;
}

- (void)setInColorBuffer:(__CVBuffer *)a3
{
  self->_inColorBuffer = a3;
}

- (void)setDetectedObjects:(__CFDictionary *)a3
{
  __CFDictionary *detectedObjects;

  detectedObjects = self->_detectedObjects;
  if (detectedObjects)
  {
    CFRelease(detectedObjects);
    self->_detectedObjects = 0;
  }
  if (a3)
    self->_detectedObjects = (__CFDictionary *)CFRetain(a3);
}

- (void)setBilbyFloatingMode:(BOOL)a3
{
  unint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_presenterOverlayMode = v3;
}

- (void)setApertureSDOF:(float)a3
{
  self->_apertureSDOF = a3;
}

- (__CVBuffer)outPersonSegmentationMatteBuffer
{
  return self->_outPersonSegmentationMatteBuffer;
}

- (BOOL)outColorBufferWriteSkipped
{
  return self->_outColorBufferWriteSkipped;
}

- (CGRect)inScreenCaptureRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_inScreenCaptureRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (__CFDictionary)detectedObjects
{
  return self->_detectedObjects;
}

- (BOOL)bilbyFloatingMode
{
  return self->_presenterOverlayMode > 2;
}

- (float)apertureSDOF
{
  return self->_apertureSDOF;
}

+ (double)apertureSDOFRange
{
  return 512.000122;
}

- (void)dealloc
{
  __CFDictionary *detectedObjects;
  objc_super v4;

  detectedObjects = self->_detectedObjects;
  if (detectedObjects)
  {
    CFRelease(detectedObjects);
    self->_detectedObjects = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PTEffectRenderRequest;
  -[PTEffectRenderRequest dealloc](&v4, sel_dealloc);
}

- (float)relightStrengthStudioLight
{
  return self->_relightStrengthStudioLight;
}

+ (float)apertureSDOFDefault
{
  return 0.5;
}

- (__CVBuffer)inExternalDisparityBuffer
{
  return self->_inExternalDisparityBuffer;
}

- (void)setInExternalDisparityBuffer:(__CVBuffer *)a3
{
  self->_inExternalDisparityBuffer = a3;
}

- (__CVBuffer)inScreenCaptureBuffer
{
  return self->_inScreenCaptureBuffer;
}

- (void)setInScreenCaptureBuffer:(__CVBuffer *)a3
{
  self->_inScreenCaptureBuffer = a3;
}

- (CGRect)inReactionVideoRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_inReactionVideoRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setInReactionVideoRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_inReactionVideoRect, &v3, 32, 1, 0);
}

- (CGSize)inReactionColorSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_inReactionColorSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setInReactionColorSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_inReactionColorSize, &v3, 16, 1, 0);
}

- (CGRect)outColorROI
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_outColorROI, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setOutColorROI:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_outColorROI, &v3, 32, 1, 0);
}

- (void)setOutPersonSegmentationMatteBuffer:(__CVBuffer *)a3
{
  self->_outPersonSegmentationMatteBuffer = a3;
}

- (__CVBuffer)inBackgroundReplacementBuffer
{
  return self->_inBackgroundReplacementBuffer;
}

- (void)setInBackgroundReplacementBuffer:(__CVBuffer *)a3
{
  self->_inBackgroundReplacementBuffer = a3;
}

- (__CVBuffer)outBackgroundReplacementPostProcessingBuffer
{
  return self->_outBackgroundReplacementPostProcessingBuffer;
}

- (void)setOutBackgroundReplacementPostProcessingBuffer:(__CVBuffer *)a3
{
  self->_outBackgroundReplacementPostProcessingBuffer = a3;
}

- (BOOL)outBackgroundReplacementPostProcessingBufferUpdated
{
  return self->_outBackgroundReplacementPostProcessingBufferUpdated;
}

- (void)setOutBackgroundReplacementPostProcessingBufferUpdated:(BOOL)a3
{
  self->_outBackgroundReplacementPostProcessingBufferUpdated = a3;
}

- (BOOL)focusOnAll
{
  return self->_focusOnAll;
}

- (float)luxLevel
{
  return self->_luxLevel;
}

- (float)focalLength
{
  return self->_focalLength;
}

- (void)setFocalLength:(float)a3
{
  self->_focalLength = a3;
}

- (MTLTexture)inBilbyAlphaMaskTexture
{
  return self->_inBilbyAlphaMaskTexture;
}

- (void)setInBilbyAlphaMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inBilbyAlphaMaskTexture, a3);
}

- (unint64_t)presenterOverlayMode
{
  return self->_presenterOverlayMode;
}

- (void)setPresenterOverlayMode:(unint64_t)a3
{
  self->_presenterOverlayMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inBilbyAlphaMaskTexture, 0);
  objc_storeStrong((id *)&self->_reactions, 0);
}

- (uint64_t)reactionsCombinedCropRect
{
  float64_t v2;
  float64x2_t v3;
  float64_t v4;
  float64x2_t v5;
  float64_t v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  double v11;

  objc_msgSend(a1, "outColorROI");
  v3.f64[1] = v2;
  v5.f64[1] = v4;
  *(_QWORD *)&v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v3).u64[0];
  objc_msgSend(a1, "inReactionVideoRect");
  v7.f64[1] = v6;
  v9.f64[1] = v8;
  return (uint64_t)+[PTEffectUtil multiplyRectTransform:withRectTransform:](PTEffectUtil, "multiplyRectTransform:withRectTransform:", v11, *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7).i64);
}

- (float)remappedAperture
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  -[PTEffectRenderRequest apertureSDOF](self, "apertureSDOF");
  v3 = v2;
  if (v2 > 1.1)
  {
    +[PTEffectRenderRequest apertureSDOFRange](PTEffectRenderRequest, "apertureSDOFRange");
    if (v5 >= v3)
      v6 = v3;
    else
      v6 = v5;
    if (v4 >= v6)
      v6 = v4;
    v3 = (float)(v6 - v4) / (float)(v5 - v4);
  }
  if (v3 <= 0.5)
    return (float)(v3 * 3.2) + 1.4;
  v7 = v3 + -0.5 + v3 + -0.5;
  return (float)((float)(v3 * 3.2) + 1.4) + (float)(powf(v7, 4.0) * 5.4);
}

- (id)detectedObjectsAsString
{
  return &stru_1E822B200;
}

@end
