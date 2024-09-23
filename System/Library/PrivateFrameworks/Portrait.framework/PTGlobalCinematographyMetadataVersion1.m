@implementation PTGlobalCinematographyMetadataVersion1

- (PTGlobalCinematographyMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  char *v3;
  __int128 v4;
  __int128 v5;
  CMTime v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PTGlobalCinematographyMetadataVersion1;
  v3 = -[PTGlobalCinematographyMetadata initWithMajorVersion:minorVersion:](&v8, sel_initWithMajorVersion_minorVersion_, 1, *(_QWORD *)&a3);
  if (v3)
  {
    CMTimeMake(&v7, 1, 3);
    v4 = *(_OWORD *)&v7.value;
    *(_QWORD *)(v3 + 44) = v7.epoch;
    *(_OWORD *)(v3 + 28) = v4;
    CMTimeMake(&v7, 1, 3);
    v5 = *(_OWORD *)&v7.value;
    *(_QWORD *)(v3 + 68) = v7.epoch;
    *(_OWORD *)(v3 + 52) = v5;
    *((_DWORD *)v3 + 19) = 1056964608;
  }
  return (PTGlobalCinematographyMetadataVersion1 *)v3;
}

- (PTGlobalCinematographyMetadataVersion1)initWithData:(id)a3
{
  id v4;
  unsigned int *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  int v16;
  PTGlobalCinematographyMetadataVersion1 *v17;
  CMTime v19;
  CMTime v20;
  __int128 v21;
  uint64_t v22;
  objc_super v23;

  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned int *)objc_msgSend(v4, "bytes");
  v6 = bswap32(v5[3]);
  v23.receiver = self;
  v23.super_class = (Class)PTGlobalCinematographyMetadataVersion1;
  v7 = -[PTGlobalCinematographyMetadata initWithMajorVersion:minorVersion:](&v23, sel_initWithMajorVersion_minorVersion_, 1, v6);
  if (v7
    && (v8 = bswap32(*v5), objc_msgSend(v4, "length") == v8)
    && (v8 & 7) == 0
    && objc_msgSend(v7, "majorVersion") == 1
    && objc_msgSend(v7, "majorVersion") == bswap32(v5[2]))
  {
    v9 = v5 + 4;
    v10 = (unint64_t)(v8 + 0x7FFFFFFF0) >> 3;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 1, v9, v10, 0);
    *((_DWORD *)v7 + 4) = v11;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 2, v9, v10, 0);
    *((_DWORD *)v7 + 5) = v12;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", 3, v9, v10, 0);
    *((_DWORD *)v7 + 6) = v13;
    CMTimeMake(&v20, 1, 3);
    +[PTParameterPairSerialization getCMTimeParameter:scale:fromPairs:numPairs:withDefault:](PTParameterPairSerialization, "getCMTimeParameter:scale:fromPairs:numPairs:withDefault:", 4, 90000, v9, v10, &v20);
    v14 = v21;
    *(_QWORD *)(v7 + 44) = v22;
    *(_OWORD *)(v7 + 28) = v14;
    CMTimeMake(&v19, 1, 3);
    +[PTParameterPairSerialization getCMTimeParameter:scale:fromPairs:numPairs:withDefault:](PTParameterPairSerialization, "getCMTimeParameter:scale:fromPairs:numPairs:withDefault:", 5, 90000, v9, v10, &v19);
    v15 = v21;
    *(_QWORD *)(v7 + 68) = v22;
    *(_OWORD *)(v7 + 52) = v15;
    LODWORD(v15) = 0.5;
    +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:withDefault:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:withDefault:", 6, v9, v10, *(double *)&v15);
    *((_DWORD *)v7 + 19) = v16;
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
  return 64;
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
  _DWORD *v15;
  uint64_t v16;
  BOOL v17;
  __int128 v19;
  uint64_t v20;
  _DWORD *v21;

  v6 = a3;
  v7 = a4;
  v8 = -[PTGlobalCinematographyMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") >= (unint64_t)v8
    && -[PTGlobalCinematographyMetadata majorVersion](self, "majorVersion") == 1)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
    *v10 = bswap32(-[PTGlobalCinematographyMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
    v10[1] = 1735683683;
    v10[2] = bswap32(-[PTGlobalCinematographyMetadata majorVersion](self, "majorVersion"));
    v10[3] = bswap32(-[PTGlobalCinematographyMetadata minorVersion](self, "minorVersion"));
    v21 = v10 + 4;
    *(float *)&v11 = self->_focusPullerAlpha;
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 1, &v21, v11);
    *(float *)&v12 = self->_focusPullerMaxV;
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 2, &v21, v12);
    *(float *)&v13 = self->_focusPullerResistance;
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 3, &v21, v13);
    v19 = *(_OWORD *)(&self->_focusPullerResistance + 1);
    v20 = *(_QWORD *)&self->_minimumRackFocusPullTime.flags;
    +[PTParameterPairSerialization appendCMTimeParameter:value:scale:toOutput:](PTParameterPairSerialization, "appendCMTimeParameter:value:scale:toOutput:", 4, &v19, 90000, &v21);
    v19 = *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4);
    v20 = *(_QWORD *)&self->_maximumRackFocusPullTime.flags;
    +[PTParameterPairSerialization appendCMTimeParameter:value:scale:toOutput:](PTParameterPairSerialization, "appendCMTimeParameter:value:scale:toOutput:", 5, &v19, 90000, &v21);
    LODWORD(v14) = HIDWORD(self->_maximumRackFocusPullTime.epoch);
    +[PTParameterPairSerialization appendFloatParameter:value:toOutput:](PTParameterPairSerialization, "appendFloatParameter:value:toOutput:", 6, &v21, v14);
    v15 = v21;
    v16 = (uint64_t)v15 - objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v17 = v16 == -[PTGlobalCinematographyMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (float)focusPullerAlpha
{
  return self->_focusPullerAlpha;
}

- (void)setFocusPullerAlpha:(float)a3
{
  self->_focusPullerAlpha = a3;
}

- (float)focusPullerMaxV
{
  return self->_focusPullerMaxV;
}

- (void)setFocusPullerMaxV:(float)a3
{
  self->_focusPullerMaxV = a3;
}

- (float)focusPullerResistance
{
  return self->_focusPullerResistance;
}

- (void)setFocusPullerResistance:(float)a3
{
  self->_focusPullerResistance = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[1].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[1].var3 + 4);
  return self;
}

- (void)setMinimumRackFocusPullTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)(&self->_focusPullerResistance + 1) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_minimumRackFocusPullTime.flags = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- (void)setMaximumRackFocusPullTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_maximumRackFocusPullTime.flags = var3;
}

- (float)maximumDisparityPerSecond
{
  return *((float *)&self->_maximumRackFocusPullTime.epoch + 1);
}

- (void)setMaximumDisparityPerSecond:(float)a3
{
  *((float *)&self->_maximumRackFocusPullTime.epoch + 1) = a3;
}

@end
