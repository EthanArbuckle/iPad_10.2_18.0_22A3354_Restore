@implementation PTGlobalRenderingMetadataVersion1

- (PTGlobalRenderingMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  PTGlobalRenderingMetadataVersion1 *v3;
  PTGlobalRenderingMetadataVersion1 *v4;
  PTGlobalRenderingMetadataVersion1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTGlobalRenderingMetadataVersion1;
  v3 = -[PTGlobalRenderingMetadata initWithMajorVersion:minorVersion:](&v7, sel_initWithMajorVersion_minorVersion_, 1, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    v3->_sourceColorBitDepth = 10;
    v3->_noiseScaleFactor = NAN;
    v3->_hwModelID = 0;
    v3->_renderingVersion = 2;
    v5 = v3;
  }

  return v4;
}

- (PTGlobalRenderingMetadataVersion1)initWithData:(id)a3
{
  id v4;
  unsigned int *v5;
  uint64_t v6;
  PTGlobalRenderingMetadataVersion1 *v7;
  uint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  int v20;
  float v21;
  int v22;
  int v23;
  int v24;
  int sensorID_low;
  int v26;
  PTGlobalRenderingMetadataVersion1 *v27;
  float v28;
  float v29;
  char v31;

  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned int *)objc_msgSend(v4, "bytes");
  v6 = bswap32(v5[3]);
  v7 = -[PTGlobalRenderingMetadataVersion1 initWithMinorVersion:](self, "initWithMinorVersion:", v6);
  if (v7
    && (v8 = bswap32(*v5), objc_msgSend(v4, "length") == v8)
    && (v8 & 7) == 0
    && -[PTGlobalRenderingMetadata majorVersion](v7, "majorVersion") == 1
    && -[PTGlobalRenderingMetadata majorVersion](v7, "majorVersion") == bswap32(v5[2]))
  {
    v9 = v5 + 4;
    v10 = (unint64_t)(v8 + 0x7FFFFFFF0) >> 3;
    v31 = 0;
    v7->_readSuccessAll = 1;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 1, v9, v10, &v31);
    v7->_defaultAperture = v11;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 2, v9, v10, &v31);
    v7->_minAperture = v12;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 3, v9, v10, &v31);
    v7->_maxAperture = v13;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 4, v9, v10, &v31);
    v7->_highlightBoostFactor = v14;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 5, v9, v10, &v31);
    v7->_highlightChromaFactor = v15;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 6, v9, v10, &v31);
    v7->_focalLength35mm = v16;
    v7->_readSuccessAll &= v31;
    v7->_conversionGain = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 7, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    v7->_readNoise1x = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 8, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    v7->_readNoise8x = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 9, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    v7->_rawSensorSize.width = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 10, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    v7->_rawSensorSize.height = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 11, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 12, v9, v10, &v31);
    v7->_sensorCropRect.origin.x = v17;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 13, v9, v10, &v31);
    v7->_sensorCropRect.origin.y = v18;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 14, v9, v10, &v31);
    v7->_sensorCropRect.size.width = v19;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 15, v9, v10, &v31);
    v20 = 0;
    v7->_sensorCropRect.size.height = v21;
    v7->_readSuccessAll &= v31;
    do
    {
      +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", (unsigned __int16)(v20 + 16), v9, v10, &v31);
      *((_DWORD *)&v7[1].super.super.isa + 4 * (v20 / 3u) + v20 % 3u) = v22;
      v7->_readSuccessAll &= v31;
      ++v20;
    }
    while (v20 != 12);
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 28, v9, v10, &v31);
    *(_DWORD *)v7->_visCropFactor = v23;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 29, v9, v10, &v31);
    *(_DWORD *)&v7->_visCropFactor[4] = v24;
    v7->_readSuccessAll &= v31;
    v7->_sensorID = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 30, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    v7->_renderingVersion = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 31, v9, v10, &v31);
    v7->_readSuccessAll &= v31;
    if (v6 > 3
      && (v7->_sourceColorBitDepth = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 32, v9, v10, &v31), v7->_readSuccessAll &= v31, v6 > 5))
    {
      +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 33, v9, v10, &v31);
      v7->_networkBias = v28;
      v7->_readSuccessAll &= v31;
      +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 34, v9, v10, &v31);
      v7->_noiseScaleFactor = v29;
      v7->_readSuccessAll &= v31;
      v7->_hwModelID = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 35, v9, v10, &v31);
      v7->_readSuccessAll &= v31;
    }
    else
    {
      sensorID_low = LOBYTE(v7->_sensorID);
      if (sensorID_low == 20)
      {
        v7->_networkBias = 0.0;
      }
      else
      {
        if (sensorID_low == 19)
          v26 = 1056964608;
        else
          v26 = 1061997773;
        LODWORD(v7->_networkBias) = v26;
      }
    }
    v27 = v7;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 296;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  _DWORD *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  int i;
  double v23;
  double v24;
  double v25;
  _DWORD *v26;
  uint64_t v27;
  BOOL v28;
  _DWORD *v30;

  v6 = a3;
  v7 = a4;
  v8 = -[PTGlobalRenderingMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") < (unint64_t)v8
    || -[PTGlobalRenderingMetadata majorVersion](self, "majorVersion") != 1)
  {
    goto LABEL_14;
  }
  v9 = objc_retainAutorelease(v6);
  v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
  *v10 = bswap32(-[PTGlobalRenderingMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
  v10[1] = 1684956530;
  v10[2] = bswap32(-[PTGlobalRenderingMetadata majorVersion](self, "majorVersion"));
  v10[3] = bswap32(-[PTGlobalRenderingMetadata minorVersion](self, "minorVersion"));
  v30 = v10 + 4;
  *(float *)&v11 = self->_defaultAperture;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 1, &v30, v11);
  *(float *)&v12 = self->_minAperture;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 2, &v30, v12);
  *(float *)&v13 = self->_maxAperture;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 3, &v30, v13);
  *(float *)&v14 = self->_highlightBoostFactor;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 4, &v30, v14);
  *(float *)&v15 = self->_highlightChromaFactor;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 5, &v30, v15);
  *(float *)&v16 = self->_focalLength35mm;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 6, &v30, v16);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 7, self->_conversionGain, &v30);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 8, self->_readNoise1x, &v30);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 9, self->_readNoise8x, &v30);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 10, self->_rawSensorSize.width, &v30);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 11, self->_rawSensorSize.height, &v30);
  x = self->_sensorCropRect.origin.x;
  *(float *)&x = x;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 12, &v30, x);
  y = self->_sensorCropRect.origin.y;
  *(float *)&y = y;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 13, &v30, y);
  width = self->_sensorCropRect.size.width;
  *(float *)&width = width;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 14, &v30, width);
  height = self->_sensorCropRect.size.height;
  *(float *)&height = height;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 15, &v30, height);
  for (i = 0; i != 12; ++i)
  {
    LODWORD(v21) = *((_DWORD *)&self[1].super.super.isa
                   + 4 * (i / 3u)
                   + (((_BYTE)i + i / 3u) & 3));
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", (unsigned __int16)(i + 16), &v30, v21);
  }
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 28, &v30, *(double *)self->_visCropFactor);
  LODWORD(v23) = *(_DWORD *)&self->_visCropFactor[4];
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 29, &v30, v23);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 30, self->_sensorID, &v30);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 31, self->_renderingVersion, &v30);
  if (-[PTGlobalRenderingMetadata minorVersion](self, "minorVersion") > 3)
    +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 32, self->_sourceColorBitDepth, &v30);
  if (-[PTGlobalRenderingMetadata minorVersion](self, "minorVersion") >= 5)
  {
    *(float *)&v24 = self->_networkBias;
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 33, &v30, v24);
  }
  if (-[PTGlobalRenderingMetadata minorVersion](self, "minorVersion") >= 6)
  {
    *(float *)&v25 = self->_noiseScaleFactor;
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 34, &v30, v25);
    +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 35, self->_hwModelID, &v30);
  }
  v26 = v30;
  v27 = (uint64_t)v26 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
  if (v27 == -[PTGlobalRenderingMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7))v28 = 1;
  else
LABEL_14:
    v28 = 0;

  return v28;
}

- (void)applyToRenderState:(id)a3
{
  -[PTGlobalRenderingMetadataVersion1 applyToRenderState:error:](self, "applyToRenderState:error:", a3, 0);
}

- (BOOL)nanAwareEqual:(float)a3 with:(float)a4
{
  return a3 == a4;
}

- (BOOL)matchesRenderState:(id)a3
{
  id v4;
  unsigned int sourceColorBitDepth;
  uint64_t renderingVersion;
  float noiseScaleFactor;
  int v8;
  double v9;
  double v10;
  unsigned int hwModelID;
  BOOL v12;

  v4 = a3;
  sourceColorBitDepth = self->_sourceColorBitDepth;
  if (sourceColorBitDepth == objc_msgSend(v4, "sourceColorBitDepth")
    && (renderingVersion = self->_renderingVersion, objc_msgSend(v4, "renderingVersion") == renderingVersion)
    && (noiseScaleFactor = self->_noiseScaleFactor,
        objc_msgSend(v4, "noiseScaleFactor"),
        LODWORD(v9) = v8,
        *(float *)&v10 = noiseScaleFactor,
        -[PTGlobalRenderingMetadataVersion1 nanAwareEqual:with:](self, "nanAwareEqual:with:", v10, v9)))
  {
    hwModelID = self->_hwModelID;
    v12 = hwModelID == objc_msgSend(v4, "hwModelID");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)applyToRenderState:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  if (a4
    && !+[PTRenderPipeline isRenderVersionSupported:](PTRenderPipeline, "isRenderVersionSupported:", self->_renderingVersion))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.RenderingMetadata"), 2, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 1;
  }
  v8 = -[PTGlobalRenderingMetadataVersion1 matchesRenderState:](self, "matchesRenderState:", v6) ^ 1;
  objc_msgSend(v6, "setSourceColorBitDepth:", self->_sourceColorBitDepth);
  objc_msgSend(v6, "setRenderingVersion:", self->_renderingVersion);
  *(float *)&v9 = self->_noiseScaleFactor;
  objc_msgSend(v6, "setNoiseScaleFactor:", v9);
  objc_msgSend(v6, "setHwModelID:", self->_hwModelID);
  objc_msgSend(v6, "prepareForRendering:", v8);
  if (!self->_readSuccessAll)
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTGlobalRenderingMetadataVersion1 applyToRenderState:error:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v7 = 0;
  }

  return v7;
}

- (void)applyToRenderRequest:(id)a3
{
  float focalLength35mm;
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  focalLength35mm = self->_focalLength35mm;
  v5 = a3;
  *(float *)&v6 = focalLength35mm;
  objc_msgSend(v5, "setFocalLenIn35mmFilm:", v6);
  objc_msgSend(v5, "setConversionGain:", self->_conversionGain);
  objc_msgSend(v5, "setReadNoise_1x:", self->_readNoise1x);
  objc_msgSend(v5, "setReadNoise_8x:", self->_readNoise8x);
  objc_msgSend(v5, "setTotalSensorCropRectSize:", self->_sensorCropRect.size.width, self->_sensorCropRect.size.height);
  objc_msgSend(v5, "setVisCropFactor:", *(double *)self->_visCropFactor);
  *(float *)&v7 = self->_networkBias;
  objc_msgSend(v5, "setNetworkBias:", v7);
  objc_msgSend(v5, "setSensorID:", self->_sensorID);

  if (!self->_readSuccessAll)
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTGlobalRenderingMetadataVersion1 applyToRenderState:error:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (unsigned)renderingVersion
{
  return self->_renderingVersion;
}

- (void)setRenderingVersion:(unsigned int)a3
{
  self->_renderingVersion = a3;
}

- (float)defaultAperture
{
  return self->_defaultAperture;
}

- (void)setDefaultAperture:(float)a3
{
  self->_defaultAperture = a3;
}

- (float)minAperture
{
  return self->_minAperture;
}

- (void)setMinAperture:(float)a3
{
  self->_minAperture = a3;
}

- (float)maxAperture
{
  return self->_maxAperture;
}

- (void)setMaxAperture:(float)a3
{
  self->_maxAperture = a3;
}

- (float)highlightBoostFactor
{
  return self->_highlightBoostFactor;
}

- (void)setHighlightBoostFactor:(float)a3
{
  self->_highlightBoostFactor = a3;
}

- (float)highlightChromaFactor
{
  return self->_highlightChromaFactor;
}

- (void)setHighlightChromaFactor:(float)a3
{
  self->_highlightChromaFactor = a3;
}

- (CGRect)sensorCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sensorCropRect.origin.x;
  y = self->_sensorCropRect.origin.y;
  width = self->_sensorCropRect.size.width;
  height = self->_sensorCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSensorCropRect:(CGRect)a3
{
  self->_sensorCropRect = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorSize
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorSize;
}

- (void)setRawSensorSize:(id)a3
{
  self->_rawSensorSize = ($470D365275581EF16070F5A11344F73E)a3;
}

- (float)focalLength35mm
{
  return self->_focalLength35mm;
}

- (void)setFocalLength35mm:(float)a3
{
  self->_focalLength35mm = a3;
}

- (__n128)extrinsicsMatrix
{
  return a1[9];
}

- (__n128)setExtrinsicsMatrix:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (unsigned)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(unsigned int)a3
{
  self->_conversionGain = a3;
}

- (unsigned)readNoise1x
{
  return self->_readNoise1x;
}

- (void)setReadNoise1x:(unsigned int)a3
{
  self->_readNoise1x = a3;
}

- (unsigned)readNoise8x
{
  return self->_readNoise8x;
}

- (void)setReadNoise8x:(unsigned int)a3
{
  self->_readNoise8x = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 96);
}

- (void)setVisCropFactor:(PTGlobalRenderingMetadataVersion1 *)self
{
  uint64_t v2;

  *(_QWORD *)self->_visCropFactor = v2;
}

- (unsigned)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(unsigned int)a3
{
  self->_sensorID = a3;
}

- (unsigned)sourceColorBitDepth
{
  return self->_sourceColorBitDepth;
}

- (void)setSourceColorBitDepth:(unsigned int)a3
{
  self->_sourceColorBitDepth = a3;
}

- (float)networkBias
{
  return self->_networkBias;
}

- (void)setNetworkBias:(float)a3
{
  self->_networkBias = a3;
}

- (float)noiseScaleFactor
{
  return self->_noiseScaleFactor;
}

- (void)setNoiseScaleFactor:(float)a3
{
  self->_noiseScaleFactor = a3;
}

- (unsigned)hwModelID
{
  return self->_hwModelID;
}

- (void)setHwModelID:(unsigned int)a3
{
  self->_hwModelID = a3;
}

- (void)applyToRenderState:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Not all parameters found in metadata", a5, a6, a7, a8, 0);
}

@end
