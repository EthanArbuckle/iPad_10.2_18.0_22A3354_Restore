@implementation PTTimedRenderingMetadataVersion2

- (PTTimedRenderingMetadataVersion2)initWithMinorVersion:(unsigned int)a3
{
  PTTimedRenderingMetadataVersion2 *v3;
  PTTimedRenderingMetadataVersion2 *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTTimedRenderingMetadataVersion2;
  v3 = -[PTTimedRenderingMetadata initWithMajorVersion:minorVersion:](&v6, sel_initWithMajorVersion_minorVersion_, 2, *(_QWORD *)&a3);
  if (v3)
  {
    v3->_frameId = arc4random();
    v3->_alphaLowLight = 1.0;
    v4 = v3;
  }

  return v3;
}

- (PTTimedRenderingMetadataVersion2)initWithData:(id)a3 minorVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  PTTimedRenderingMetadataVersion2 *v7;
  id v8;
  unsigned int *v9;
  uint64_t v10;
  BOOL v11;
  unsigned int *v12;
  unint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  int v20;
  float v21;
  PTTimedRenderingMetadataVersion2 *v22;
  char v24;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[PTTimedRenderingMetadataVersion2 initWithMinorVersion:](self, "initWithMinorVersion:", v4);
  if (v7
    && ((v8 = objc_retainAutorelease(v6),
         v9 = (unsigned int *)objc_msgSend(v8, "bytes"),
         v10 = bswap32(*v9),
         objc_msgSend(v8, "length") == v10)
      ? (v11 = (v10 & 7) == 0)
      : (v11 = 0),
        v11))
  {
    v12 = v9 + 2;
    v13 = (unint64_t)(v10 + 0x7FFFFFFF8) >> 3;
    v24 = 0;
    v7->_readSuccessAll = 1;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 1, v12, v13, &v24);
    v7->_focusDisparity = v14;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 2, v12, v13, &v24);
    v7->_fNumber = v15;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 3, v12, v13, &v24);
    v7->_focalLenIn35mmFilm = v16;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 4, v12, v13, &v24);
    v7->_totalSensorCropRectSize.width = v17;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 5, v12, v13, &v24);
    v7->_totalSensorCropRectSize.height = v18;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 6, v12, v13, &v24);
    *(_DWORD *)v7->_visCropFactor = v19;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 7, v12, v13, &v24);
    *(_DWORD *)&v7->_visCropFactor[4] = v20;
    v7->_readSuccessAll &= v24;
    v7->_AGC = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 8, v12, v13, &v24);
    v7->_readSuccessAll &= v24;
    v7->_conversionGain = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 9, v12, v13, &v24);
    v7->_readSuccessAll &= v24;
    v7->_readNoise_1x = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 10, v12, v13, &v24);
    v7->_readSuccessAll &= v24;
    v7->_readNoise_8x = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 11, v12, v13, &v24);
    v7->_readSuccessAll &= v24;
    v7->_frameId = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 12, v12, v13, &v24);
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 13, v12, v13, &v24);
    v7->_alphaLowLight = v21;
    v7->_readSuccessAll &= v24;
    v22 = v7;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 112;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  _DWORD *v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  _DWORD *v19;
  uint64_t v20;
  _DWORD *v22;

  v6 = a3;
  v7 = a4;
  v8 = -[PTTimedRenderingMetadataVersion2 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") < (unint64_t)v8)
    goto LABEL_5;
  if (-[PTTimedRenderingMetadata majorVersion](self, "majorVersion") != 2)
    goto LABEL_5;
  v9 = objc_retainAutorelease(v6);
  v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
  *v10 = bswap32(-[PTTimedRenderingMetadataVersion2 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
  v10[1] = 1684956530;
  v22 = v10 + 2;
  *(float *)&v11 = self->_focusDisparity;
  v12 = 1;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 1, &v22, v11);
  *(float *)&v13 = self->_fNumber;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 2, &v22, v13);
  *(float *)&v14 = self->_focalLenIn35mmFilm;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 3, &v22, v14);
  width = self->_totalSensorCropRectSize.width;
  *(float *)&width = width;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 4, &v22, width);
  height = self->_totalSensorCropRectSize.height;
  *(float *)&height = height;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 5, &v22, height);
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 6, &v22, *(double *)self->_visCropFactor);
  LODWORD(v17) = *(_DWORD *)&self->_visCropFactor[4];
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 7, &v22, v17);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 8, self->_AGC, &v22);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 9, self->_conversionGain, &v22);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 10, self->_readNoise_1x, &v22);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 11, self->_readNoise_8x, &v22);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 12, self->_frameId, &v22);
  *(float *)&v18 = self->_alphaLowLight;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 13, &v22, v18);
  v19 = v22;
  v20 = (uint64_t)v19 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
  if (v20 != -[PTTimedRenderingMetadataVersion2 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7))LABEL_5:v12 = 0;

  return v12;
}

- (void)applyToRenderRequest:(id)a3
{
  float focusDisparity;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;

  focusDisparity = self->_focusDisparity;
  v5 = a3;
  *(float *)&v6 = focusDisparity;
  objc_msgSend(v5, "setFocusDisparity:", v6);
  *(float *)&v7 = self->_fNumber;
  objc_msgSend(v5, "setFNumber:", v7);
  *(float *)&v8 = self->_focalLenIn35mmFilm;
  objc_msgSend(v5, "setFocalLenIn35mmFilm:", v8);
  objc_msgSend(v5, "setTotalSensorCropRectSize:", self->_totalSensorCropRectSize.width, self->_totalSensorCropRectSize.height);
  objc_msgSend(v5, "setVisCropFactor:", *(double *)self->_visCropFactor);
  objc_msgSend(v5, "setAGC:", self->_AGC);
  objc_msgSend(v5, "setConversionGain:", self->_conversionGain);
  objc_msgSend(v5, "setReadNoise_1x:", self->_readNoise_1x);
  objc_msgSend(v5, "setReadNoise_8x:", self->_readNoise_8x);
  objc_msgSend(v5, "setFrameId:", self->_frameId);
  *(float *)&v9 = self->_alphaLowLight;
  objc_msgSend(v5, "setAlphaLowLight:", v9);

  if (!self->_readSuccessAll)
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:].cold.1(v10);

  }
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

- (double)visCropFactor
{
  return *(double *)(a1 + 56);
}

- (void)setVisCropFactor:(PTTimedRenderingMetadataVersion2 *)self
{
  uint64_t v2;

  *(_QWORD *)self->_visCropFactor = v2;
}

- (unsigned)AGC
{
  return self->_AGC;
}

- (void)setAGC:(unsigned int)a3
{
  self->_AGC = a3;
}

- (unsigned)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(unsigned int)a3
{
  self->_conversionGain = a3;
}

- (unsigned)readNoise_1x
{
  return self->_readNoise_1x;
}

- (void)setReadNoise_1x:(unsigned int)a3
{
  self->_readNoise_1x = a3;
}

- (unsigned)readNoise_8x
{
  return self->_readNoise_8x;
}

- (void)setReadNoise_8x:(unsigned int)a3
{
  self->_readNoise_8x = a3;
}

- (unsigned)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unsigned int)a3
{
  self->_frameId = a3;
}

- (float)alphaLowLight
{
  return self->_alphaLowLight;
}

- (void)setAlphaLowLight:(float)a3
{
  self->_alphaLowLight = a3;
}

@end
