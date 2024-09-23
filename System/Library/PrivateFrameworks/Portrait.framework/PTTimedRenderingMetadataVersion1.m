@implementation PTTimedRenderingMetadataVersion1

- (PTTimedRenderingMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  PTTimedRenderingMetadataVersion1 *v3;
  double v4;
  PTTimedRenderingMetadataVersion1 *v5;
  PTTimedRenderingMetadataVersion1 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PTTimedRenderingMetadataVersion1;
  v3 = -[PTTimedRenderingMetadata initWithMajorVersion:minorVersion:](&v8, sel_initWithMajorVersion_minorVersion_, 1, *(_QWORD *)&a3);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1.0;
    -[PTTimedRenderingMetadataVersion1 setAlphaLowLight:](v3, "setAlphaLowLight:", v4);
    v5->_frameId = arc4random();
    v6 = v5;
  }

  return v5;
}

- (PTTimedRenderingMetadataVersion1)initWithData:(id)a3 minorVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  PTTimedRenderingMetadataVersion1 *v7;
  id v8;
  unsigned int *v9;
  uint64_t v10;
  BOOL v11;
  unsigned int *v12;
  unint64_t v13;
  float v14;
  float v15;
  float v16;
  PTTimedRenderingMetadataVersion1 *v17;
  char v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[PTTimedRenderingMetadataVersion1 initWithMinorVersion:](self, "initWithMinorVersion:", v4);
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
    v19 = 0;
    v7->_readSuccessAll = 1;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 1, v12, v13, &v19);
    v7->_focusDistance = v14;
    v7->_readSuccessAll &= v19;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 2, v12, v13, &v19);
    v7->_aperture = v15;
    v7->_readSuccessAll &= v19;
    v7->_agc = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 3, v12, v13, &v19);
    v7->_readSuccessAll &= v19;
    if (v4 >= 2)
    {
      +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 4, v12, v13, &v19);
      v7->_alphaLowLight = v16;
      v7->_readSuccessAll &= v19;
      if (v4 >= 5)
      {
        v7->_frameId = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:withDefault:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:withDefault:didFindValue:", 5, v12, v13, v7->_frameId, &v19);
        v7->_readSuccessAll &= v19;
      }
    }
    v17 = v7;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 48;
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
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[PTTimedRenderingMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") < (unint64_t)v8)
    goto LABEL_5;
  if (-[PTTimedRenderingMetadata majorVersion](self, "majorVersion") != 1)
    goto LABEL_5;
  v9 = objc_retainAutorelease(v6);
  v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
  *v10 = bswap32(-[PTTimedRenderingMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
  v10[1] = 1684956530;
  v18 = v10 + 2;
  *(float *)&v11 = self->_focusDistance;
  v12 = 1;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 1, &v18, v11);
  *(float *)&v13 = self->_aperture;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 2, &v18, v13);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 3, self->_agc, &v18);
  *(float *)&v14 = self->_alphaLowLight;
  +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 4, &v18, v14);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 5, self->_frameId, &v18);
  v15 = v18;
  v16 = (uint64_t)v15 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
  if (v16 != -[PTTimedRenderingMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7))LABEL_5:v12 = 0;

  return v12;
}

- (void)applyToRenderRequest:(id)a3
{
  float aperture;
  id v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;

  aperture = self->_aperture;
  v5 = a3;
  *(float *)&v6 = aperture;
  objc_msgSend(v5, "setFNumber:", v6);
  *(float *)&v7 = self->_focusDistance;
  objc_msgSend(v5, "setFocusDisparity:", v7);
  objc_msgSend(v5, "setAGC:", self->_agc);
  *(float *)&v8 = self->_alphaLowLight;
  objc_msgSend(v5, "setAlphaLowLight:", v8);
  objc_msgSend(v5, "setFrameId:", self->_frameId);

  if (!self->_readSuccessAll)
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:].cold.1(v9);

  }
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (float)aperture
{
  return self->_aperture;
}

- (void)setAperture:(float)a3
{
  self->_aperture = a3;
}

- (unsigned)agc
{
  return self->_agc;
}

- (void)setAgc:(unsigned int)a3
{
  self->_agc = a3;
}

- (float)alphaLowLight
{
  return self->_alphaLowLight;
}

- (void)setAlphaLowLight:(float)a3
{
  self->_alphaLowLight = a3;
}

- (unsigned)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unsigned int)a3
{
  self->_frameId = a3;
}

- (void)applyToRenderRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Not all parameters found in metadata", v1, 2u);
}

@end
