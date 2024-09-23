@implementation PTGlobalRenderingMetadataVersion2

- (PTGlobalRenderingMetadataVersion2)initWithMinorVersion:(unsigned int)a3
{
  PTGlobalRenderingMetadataVersion2 *v3;
  PTGlobalRenderingMetadataVersion2 *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTGlobalRenderingMetadataVersion2;
  v3 = -[PTGlobalRenderingMetadata initWithMajorVersion:minorVersion:](&v6, sel_initWithMajorVersion_minorVersion_, 2, *(_QWORD *)&a3);
  if (v3)
  {
    *(&v3->super._renderingVersion + 1) = +[PTRenderPipeline latestVersion](PTRenderPipeline, "latestVersion");
    v4 = v3;
  }

  return v3;
}

- (PTGlobalRenderingMetadataVersion2)initWithData:(id)a3
{
  id v4;
  unsigned int *v5;
  PTGlobalRenderingMetadataVersion2 *v6;
  uint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  int v13;
  __CFString *v14;
  PTGlobalRenderingMetadataVersion2 *v15;
  unsigned __int8 v17;
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned int *)objc_msgSend(v4, "bytes");
  v6 = -[PTGlobalRenderingMetadataVersion2 initWithMinorVersion:](self, "initWithMinorVersion:", bswap32(v5[3]));
  if (v6
    && (v7 = bswap32(*v5), objc_msgSend(v4, "length") == v7)
    && (v7 & 7) == 0
    && -[PTGlobalRenderingMetadata majorVersion](v6, "majorVersion") == 2
    && -[PTGlobalRenderingMetadata majorVersion](v6, "majorVersion") == bswap32(v5[2]))
  {
    v8 = v5 + 4;
    v9 = (unint64_t)(v7 + 0x7FFFFFFF0) >> 3;
    v17 = 0;
    LOBYTE(v6->_renderingVersion) = 1;
    *(&v6->super._renderingVersion + 1) = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 1, v8, v9, &v17);
    LOBYTE(v6->_renderingVersion) &= v17;
    *(_DWORD *)&v6->_readSuccessAll = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 2, v8, v9, &v17);
    LOBYTE(v6->_renderingVersion) &= v17;
    v6->_hwModelID = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 3, v8, v9, &v17);
    LOBYTE(v6->_renderingVersion) &= v17;
    v6->_sensorID = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 4, v8, v9, &v17);
    LOBYTE(v6->_renderingVersion) &= v17;
    if (!+[PTRenderPipeline isRenderVersionSupported:](PTRenderPipeline, "isRenderVersionSupported:", *(&v6->super._renderingVersion + 1)))
    {
      _PTLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(&v6->super._renderingVersion + 1);
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = v11;
        _os_log_impl(&dword_1C9281000, v10, OS_LOG_TYPE_INFO, "Render version not supported: %i", buf, 8u);
      }

      *(&v6->super._renderingVersion + 1) = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:withDefault:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:withDefault:didFindValue:", 5, v8, v9, *(&v6->super._renderingVersion + 1), &v17);
      _PTLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = v17;
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("found: %i"), *(&v6->super._renderingVersion + 1));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = CFSTR("not found");
        }
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl(&dword_1C9281000, v12, OS_LOG_TYPE_INFO, "Fallback version %@", buf, 0xCu);
        if (v13)

      }
    }
    v15 = v6;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 56;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  _DWORD *v10;
  BOOL v11;
  _DWORD *v12;
  uint64_t v13;
  _DWORD *v15;

  v6 = a3;
  v7 = a4;
  v8 = -[PTGlobalRenderingMetadataVersion2 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") < (unint64_t)v8)
    goto LABEL_5;
  if (-[PTGlobalRenderingMetadata majorVersion](self, "majorVersion") != 2)
    goto LABEL_5;
  v9 = objc_retainAutorelease(v6);
  v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
  *v10 = bswap32(-[PTGlobalRenderingMetadataVersion2 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
  v10[1] = 1684956530;
  v10[2] = bswap32(-[PTGlobalRenderingMetadata majorVersion](self, "majorVersion"));
  v10[3] = bswap32(-[PTGlobalRenderingMetadata minorVersion](self, "minorVersion"));
  v15 = v10 + 4;
  v11 = 1;
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 1, *(&self->super._renderingVersion + 1), &v15);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 2, *(unsigned int *)&self->_readSuccessAll, &v15);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 3, self->_hwModelID, &v15);
  +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 4, self->_sensorID, &v15);
  v12 = v15;
  v13 = (uint64_t)v12 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
  if (v13 != -[PTGlobalRenderingMetadataVersion2 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7))LABEL_5:v11 = 0;

  return v11;
}

- (void)applyToRenderState:(id)a3
{
  -[PTGlobalRenderingMetadataVersion2 applyToRenderState:error:](self, "applyToRenderState:error:", a3, 0);
}

- (BOOL)matchesRenderState:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unsigned int sensorID;
  BOOL v8;

  v4 = a3;
  v5 = *(&self->super._renderingVersion + 1);
  if (objc_msgSend(v4, "renderingVersion") == v5
    && (v6 = *(_DWORD *)&self->_readSuccessAll, v6 == objc_msgSend(v4, "hwModelID")))
  {
    sensorID = self->_sensorID;
    v8 = sensorID == objc_msgSend(v4, "sourceColorBitDepth");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)applyToRenderState:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  int renderingVersion_low;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (a4
    && !+[PTRenderPipeline isRenderVersionSupported:](PTRenderPipeline, "isRenderVersionSupported:", *(&self->super._renderingVersion + 1)))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.RenderingMetadata"), 2, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[PTGlobalRenderingMetadataVersion2 matchesRenderState:](self, "matchesRenderState:", v6) ^ 1;
  objc_msgSend(v6, "setSourceColorBitDepth:", self->_sensorID);
  objc_msgSend(v6, "setRenderingVersion:", *(&self->super._renderingVersion + 1));
  objc_msgSend(v6, "setHwModelID:", *(unsigned int *)&self->_readSuccessAll);
  objc_msgSend(v6, "prepareForRendering:", v7);
  renderingVersion_low = LOBYTE(self->_renderingVersion);
  if (!LOBYTE(self->_renderingVersion))
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTGlobalRenderingMetadataVersion1 applyToRenderState:error:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  return renderingVersion_low != 0;
}

- (void)applyToRenderRequest:(id)a3
{
  uint64_t hwModelID;
  id v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  hwModelID = self->_hwModelID;
  v5 = a3;
  objc_msgSend(v5, "setSensorID:", hwModelID);
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setNetworkBias:", v6);

  if (!LOBYTE(self->_renderingVersion))
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTGlobalRenderingMetadataVersion1 applyToRenderState:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (unsigned)renderingVersion
{
  return *(&self->super._renderingVersion + 1);
}

- (void)setRenderingVersion:(unsigned int)a3
{
  *(&self->super._renderingVersion + 1) = a3;
}

- (unsigned)hwModelID
{
  return *(_DWORD *)&self->_readSuccessAll;
}

- (void)setHwModelID:(unsigned int)a3
{
  *(_DWORD *)&self->_readSuccessAll = a3;
}

- (unsigned)sensorID
{
  return self->_hwModelID;
}

- (void)setSensorID:(unsigned int)a3
{
  self->_hwModelID = a3;
}

- (unsigned)sourceColorBitDepth
{
  return self->_sensorID;
}

- (void)setSourceColorBitDepth:(unsigned int)a3
{
  self->_sensorID = a3;
}

@end
