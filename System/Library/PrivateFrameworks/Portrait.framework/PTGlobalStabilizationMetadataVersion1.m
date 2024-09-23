@implementation PTGlobalStabilizationMetadataVersion1

- ($2825F4736939C4A6D3AD43837233062D)originalVideoDimensions
{
  id v3;

  if (!self->_hasOriginalVideoDimensions)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("originalVideoDimensions is optional metadata and hasn't been found."), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return ($2825F4736939C4A6D3AD43837233062D)self->_originalVideoDimensions;
}

- (void)setOriginalVideoDimensions:(id)a3
{
  self->_originalVideoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
  self->_hasOriginalVideoDimensions = 1;
}

- (PTGlobalStabilizationMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  PTGlobalStabilizationMetadataVersion1 *v3;
  PTGlobalStabilizationMetadataVersion1 *v4;
  PTGlobalStabilizationMetadataVersion1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTGlobalStabilizationMetadataVersion1;
  v3 = -[PTGlobalStabilizationMetadata initWithMajorVersion:minorVersion:](&v7, sel_initWithMajorVersion_minorVersion_, 1, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (PTGlobalStabilizationMetadataVersion1)initWithData:(id)a3
{
  id v4;
  unsigned int *v5;
  uint64_t v6;
  PTGlobalStabilizationMetadataVersion1 *v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int *v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  PTGlobalStabilizationMetadataVersion1 *v14;
  __int16 v16;
  objc_super v17;

  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned int *)objc_msgSend(v4, "bytes");
  v6 = bswap32(v5[3]);
  v17.receiver = self;
  v17.super_class = (Class)PTGlobalStabilizationMetadataVersion1;
  v7 = -[PTGlobalStabilizationMetadata initWithMajorVersion:minorVersion:](&v17, sel_initWithMajorVersion_minorVersion_, 1, v6);
  if (v7
    && (v8 = bswap32(*v5), objc_msgSend(v4, "length") == v8)
    && (v8 & 7) == 0
    && -[PTGlobalStabilizationMetadata majorVersion](v7, "majorVersion") == 1
    && -[PTGlobalStabilizationMetadata majorVersion](v7, "majorVersion") == bswap32(v5[2]))
  {
    v9 = v8 + 0x7FFFFFFF0;
    v10 = v5 + 4;
    v11 = v9 >> 3;
    v16 = 0;
    v12 = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 1, v5 + 4, v9 >> 3, (char *)&v16 + 1);
    v13 = +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", 2, v10, v11, &v16);
    if (HIBYTE(v16) && (_BYTE)v16)
    {
      v7->_hasOriginalVideoDimensions = 1;
      v7->_originalVideoDimensions.width = v12;
      v7->_originalVideoDimensions.height = v13;
    }
    v14 = v7;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  if (self->_hasOriginalVideoDimensions)
    return 32;
  else
    return 16;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  _DWORD *v10;
  _DWORD *v11;
  char *v12;
  BOOL v13;
  _DWORD *v15;

  v6 = a3;
  v7 = a4;
  v8 = -[PTGlobalStabilizationMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") >= (unint64_t)v8
    && -[PTGlobalStabilizationMetadata majorVersion](self, "majorVersion") == 1)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
    *v10 = bswap32(-[PTGlobalStabilizationMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
    v10[1] = 1650553971;
    v10[2] = bswap32(-[PTGlobalStabilizationMetadata majorVersion](self, "majorVersion"));
    v10[3] = bswap32(-[PTGlobalStabilizationMetadata minorVersion](self, "minorVersion"));
    v11 = v10 + 4;
    v15 = v11;
    if (self->_hasOriginalVideoDimensions)
    {
      +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 1, self->_originalVideoDimensions.width, &v15);
      +[PTParameterPairSerialization appendUIntParameter:value:toOutput:](PTParameterPairSerialization, "appendUIntParameter:value:toOutput:", 2, self->_originalVideoDimensions.height, &v15);
      v11 = v15;
    }
    v12 = (char *)v11 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v13 = v12 == (char *)-[PTGlobalStabilizationMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hasOriginalVideoDimensions
{
  return self->_hasOriginalVideoDimensions;
}

@end
