@implementation PTTimedStabilizationMetadataVersion1

- (__n128)stabilizationHomography
{
  id v2;

  if (!a1[4].n128_u8[0])
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("stabilizationHomography is optional metadata and hasn't been found."), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  return a1[1];
}

- (__n128)setStabilizationHomography:(__n128)a3
{
  result[4].n128_u8[0] = 1;
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

- (double)estimatedMotionBlur
{
  id v2;

  if (!*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("estimatedMotionBlur is optional metadata and hasn't been found."), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  return *(double *)(a1 + 72);
}

- (void)setEstimatedMotionBlur:(PTTimedStabilizationMetadataVersion1 *)self
{
  uint64_t v2;

  LOBYTE(self[1].super.super.isa) = 1;
  *(_QWORD *)&self->_estimatedMotionBlur[7] = v2;
}

- (PTTimedStabilizationMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  PTTimedStabilizationMetadataVersion1 *v3;
  PTTimedStabilizationMetadataVersion1 *v4;
  PTTimedStabilizationMetadataVersion1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTTimedStabilizationMetadataVersion1;
  v3 = -[PTTimedStabilizationMetadata initWithMajorVersion:minorVersion:](&v7, sel_initWithMajorVersion_minorVersion_, 1, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (PTTimedStabilizationMetadataVersion1)initWithData:(id)a3 minorVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  PTTimedStabilizationMetadataVersion1 *v7;
  id v8;
  unsigned int *v9;
  uint64_t v10;
  BOOL v11;
  unsigned int *v12;
  unint64_t v13;
  int v14;
  char v15;
  int v16;
  __int128 v17;
  __int128 v18;
  unsigned int v19;
  unsigned int v20;
  PTTimedStabilizationMetadataVersion1 *v21;
  unsigned int v23;
  char v24;
  char v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[PTTimedStabilizationMetadataVersion1 initWithMinorVersion:](self, "initWithMinorVersion:", v4);
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
    v28 = 0u;
    v29 = 0u;
    v14 = 1;
    v27 = 0u;
    v15 = 1;
    do
    {
      v26 = 0;
      +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", (unsigned __int16)v14, v12, v13, &v26);
      *((_DWORD *)&v27 + 4 * ((v14 - 1) / 3u) + (v14 - 1) % 3u) = v16;
      v15 &= v26 != 0;
      ++v14;
    }
    while (v14 != 10);
    if ((v15 & 1) != 0)
    {
      v7->_hasStabilizationHomography = 1;
      v17 = v29;
      v18 = v27;
      *(_OWORD *)&v7->_anon_10[16] = v28;
      *(_OWORD *)&v7->_anon_10[32] = v17;
      *(_OWORD *)v7->_anon_10 = v18;
    }
    v25 = 0;
    v24 = 0;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 10, v12, v13, &v25);
    v23 = v19;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 11, v12, v13, &v24);
    if (v25 && v24)
    {
      LOBYTE(v7[1].super.super.isa) = 1;
      *(_QWORD *)&v7->_estimatedMotionBlur[7] = __PAIR64__(v20, v23);
    }
    v21 = v7;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  unsigned int v3;

  if (self->_hasStabilizationHomography)
    v3 = 80;
  else
    v3 = 8;
  if (LOBYTE(self[1].super.super.isa))
    return v3 + 16;
  else
    return v3;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  _DWORD *v10;
  double v11;
  int i;
  double v13;
  _DWORD *v14;
  uint64_t v15;
  BOOL v16;
  _DWORD *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[PTTimedStabilizationMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") >= (unint64_t)v8
    && -[PTTimedStabilizationMetadata majorVersion](self, "majorVersion") == 1)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
    *v10 = bswap32(-[PTTimedStabilizationMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
    v10[1] = 1650553971;
    v18 = v10 + 2;
    if (self->_hasStabilizationHomography)
    {
      for (i = 1; i != 10; ++i)
      {
        LODWORD(v11) = *(_DWORD *)&self->_anon_10[16 * ((i - 1) / 3u)
                                                + 4 * (((_BYTE)i - 1 + (i - 1) / 3u) & 3)];
        +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", (unsigned __int16)i, &v18, v11);
      }
    }
    if (LOBYTE(self[1].super.super.isa))
    {
      +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 10, &v18, *(double *)&self->_estimatedMotionBlur[7]);
      LODWORD(v13) = *(_DWORD *)(&self->_hasEstimatedMotionBlur + 3);
      +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 11, &v18, v13);
    }
    v14 = v18;
    v15 = (uint64_t)v14 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v16 = v15 == -[PTTimedStabilizationMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)hasStabilizationHomography
{
  return self->_hasStabilizationHomography;
}

- (BOOL)hasEstimatedMotionBlur
{
  return (uint64_t)self[1].super.super.isa & 1;
}

@end
