@implementation PTRenderRequest

- (void)setFrameId:(unsigned int)a3
{
  self->_frameId = a3;
}

- (PTRenderRequest)init
{
  PTRenderRequest *v2;
  PTRenderRequest *v3;
  float v4;
  MTLTexture *integratedStyleCoefficientsTextureArray;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PTRenderRequest;
  v2 = -[PTRenderRequest init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_focusDisparity = 0x408000003F000000;
    v2->_alphaLowLight = 1.0;
    +[PTRaytracingUtils focalLength](PTRaytracingUtils, "focalLength");
    v3->_focalLenIn35mmFilm = v4 * 1000.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)v3->_visCropFactor = _D0;
    *(_QWORD *)v3->_visCropFactorPreview = _D0;
    v3->_networkBias = 0.0;
    v3->_totalSensorCropRectSize = (CGSize)xmmword_1C9322EE0;
    *(_OWORD *)&v3->_sensorID = xmmword_1C9322EF0;
    *(_QWORD *)&v3->_readNoise_8x = 118358;
    integratedStyleCoefficientsTextureArray = v3->_integratedStyleCoefficientsTextureArray;
    v3->_integratedStyleCoefficientsTextureArray = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  double v9;
  double v10;
  _OWORD v12[2];

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRenderState:", self->_renderState);
  objc_msgSend(v4, "setSourceColor:", self->_sourceColor);
  objc_msgSend(v4, "setSourceDisparity:", self->_sourceDisparity);
  objc_msgSend(v4, "setDestinationColor:", self->_destinationColor);
  *(float *)&v5 = self->_focusDisparity;
  objc_msgSend(v4, "setFocusDisparity:", v5);
  *(float *)&v6 = self->_fNumber;
  objc_msgSend(v4, "setFNumber:", v6);
  *(float *)&v7 = self->_focalLenIn35mmFilm;
  objc_msgSend(v4, "setFocalLenIn35mmFilm:", v7);
  objc_msgSend(v4, "setSensorID:", self->_sensorID);
  objc_msgSend(v4, "setTotalSensorCropRectSize:", self->_totalSensorCropRectSize.width, self->_totalSensorCropRectSize.height);
  objc_msgSend(v4, "setVisCropFactor:", *(double *)self->_visCropFactor);
  objc_msgSend(v4, "setAGC:", self->_AGC);
  objc_msgSend(v4, "setConversionGain:", self->_conversionGain);
  objc_msgSend(v4, "setReadNoise_1x:", self->_readNoise_1x);
  objc_msgSend(v4, "setReadNoise_8x:", self->_readNoise_8x);
  objc_msgSend(v4, "setFrameId:", self->_frameId);
  v8 = *(_OWORD *)&self->_scissorRect.width;
  v12[0] = *(_OWORD *)&self->_scissorRect.x;
  v12[1] = v8;
  objc_msgSend(v4, "setScissorRect:", v12);
  *(float *)&v9 = self->_alphaLowLight;
  objc_msgSend(v4, "setAlphaLowLight:", v9);
  *(float *)&v10 = self->_networkBias;
  objc_msgSend(v4, "setNetworkBias:", v10);
  objc_msgSend(v4, "setIntegratedStyleCoefficientsTextureArray:", self->_integratedStyleCoefficientsTextureArray);
  return v4;
}

- (float)aperture
{
  return self->_fNumber;
}

- (void)setAperture:(float)a3
{
  self->_fNumber = a3;
}

- (float)focusDistance
{
  return self->_focusDisparity;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDisparity = a3;
}

- (PTRenderState)renderState
{
  return self->_renderState;
}

- (void)setRenderState:(id)a3
{
  objc_storeStrong((id *)&self->_renderState, a3);
}

- (PTTexture)sourceColor
{
  return self->_sourceColor;
}

- (void)setSourceColor:(id)a3
{
  objc_storeStrong((id *)&self->_sourceColor, a3);
}

- (MTLTexture)sourceDisparity
{
  return self->_sourceDisparity;
}

- (void)setSourceDisparity:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDisparity, a3);
}

- (PTTexture)destinationColor
{
  return self->_destinationColor;
}

- (void)setDestinationColor:(id)a3
{
  objc_storeStrong((id *)&self->_destinationColor, a3);
}

- (MTLTexture)integratedStyleCoefficientsTextureArray
{
  return self->_integratedStyleCoefficientsTextureArray;
}

- (void)setIntegratedStyleCoefficientsTextureArray:(id)a3
{
  objc_storeStrong((id *)&self->_integratedStyleCoefficientsTextureArray, a3);
}

- (MTLTexture)colorCube
{
  return self->_colorCube;
}

- (void)setColorCube:(id)a3
{
  objc_storeStrong((id *)&self->_colorCube, a3);
}

- (float)focusDisparity
{
  return self->_focusDisparity;
}

- (void)setFocusDisparity:(float)a3
{
  self->_focusDisparity = a3;
}

- (float)fNumber
{
  return self->_fNumber;
}

- (void)setFNumber:(float)a3
{
  self->_fNumber = a3;
}

- (float)focalLenIn35mmFilm
{
  return self->_focalLenIn35mmFilm;
}

- (void)setFocalLenIn35mmFilm:(float)a3
{
  self->_focalLenIn35mmFilm = a3;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 120);
}

- (void)setVisCropFactor:(PTRenderRequest *)self
{
  uint64_t v2;

  *(_QWORD *)self->_visCropFactor = v2;
}

- (double)visCropFactorPreview
{
  return *(double *)(a1 + 128);
}

- (void)setVisCropFactorPreview:(PTRenderRequest *)self
{
  uint64_t v2;

  *(_QWORD *)self->_visCropFactorPreview = v2;
}

- (CGSize)totalSensorCropRectSize
{
  double width;
  double height;
  CGSize result;

  width = self->_totalSensorCropRectSize.width;
  height = self->_totalSensorCropRectSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTotalSensorCropRectSize:(CGSize)a3
{
  self->_totalSensorCropRectSize = a3;
}

- (int)AGC
{
  return self->_AGC;
}

- (void)setAGC:(int)a3
{
  self->_AGC = a3;
}

- (int)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(int)a3
{
  self->_conversionGain = a3;
}

- (int)readNoise_1x
{
  return self->_readNoise_1x;
}

- (void)setReadNoise_1x:(int)a3
{
  self->_readNoise_1x = a3;
}

- (int)readNoise_8x
{
  return self->_readNoise_8x;
}

- (void)setReadNoise_8x:(int)a3
{
  self->_readNoise_8x = a3;
}

- (unsigned)frameId
{
  return self->_frameId;
}

- (float)networkBias
{
  return self->_networkBias;
}

- (void)setNetworkBias:(float)a3
{
  self->_networkBias = a3;
}

- (float)alphaLowLight
{
  return self->_alphaLowLight;
}

- (void)setAlphaLowLight:(float)a3
{
  self->_alphaLowLight = a3;
}

- (float)disparityMin
{
  return self->_disparityMin;
}

- (void)setDisparityMin:(float)a3
{
  self->_disparityMin = a3;
}

- (float)disparityMax
{
  return self->_disparityMax;
}

- (void)setDisparityMax:(float)a3
{
  self->_disparityMax = a3;
}

- (float)highlightChromaFactor
{
  return self->_highlightChromaFactor;
}

- (void)setHighlightChromaFactor:(float)a3
{
  self->_highlightChromaFactor = a3;
}

- (float)highlightBoostFactor
{
  return self->_highlightBoostFactor;
}

- (void)setHighlightBoostFactor:(float)a3
{
  self->_highlightBoostFactor = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- ($3CC19D079FD0B010EE84973AA846B91B)scissorRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setScissorRect:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_scissorRect.x = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_scissorRect.width = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_colorCube, 0);
  objc_storeStrong((id *)&self->_integratedStyleCoefficientsTextureArray, 0);
  objc_storeStrong((id *)&self->_destinationColor, 0);
  objc_storeStrong((id *)&self->_sourceDisparity, 0);
  objc_storeStrong((id *)&self->_sourceColor, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
}

@end
