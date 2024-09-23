@implementation CRLPKStrokePathCompactData

- (CRLPKStrokePathCompactData)initWithCapacity:(unint64_t)a3
{
  void *v5;
  CRLPKStrokePathCompactData *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = -[CRLPKStrokePathCompactData initWithCapacity:randomSeed:creationDate:](self, "initWithCapacity:randomSeed:creationDate:", a3, 0, v5);

  return v6;
}

- (CRLPKStrokePathCompactData)initWithCapacity:(unint64_t)a3 randomSeed:(unsigned int)a4 creationDate:(id)a5
{
  id v9;
  CRLPKStrokePathCompactData *v10;
  CRLPKStrokePathCompactData *v11;
  size_t v12;
  size_t v13;
  objc_super v20;

  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CRLPKStrokePathCompactData;
  v10 = -[CRLPKStrokePathCompactData init](&v20, "init");
  v11 = v10;
  if (v10)
  {
    v10->_capacity = a3;
    v12 = 2 * a3;
    v10->_azimuthData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v11->_altitudeData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v11->_forceData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v11->_opacityData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v13 = 4 * a3;
    v11->_sizeXData = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_sizeYData = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_timeOffsetData = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_radius2Data = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_edgeWidthData = (unsigned __int16 *)malloc_type_malloc(v12, 0x1000040BDFB0063uLL);
    v11->_randomSeed = a4;
    objc_storeStrong((id *)&v11->_creationDate, a5);
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v11->_renderScaleX = _D0;
    v11->_anchorPointForTexture = CGPointZero;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_azimuthData);
  free(self->_altitudeData);
  free(self->_forceData);
  free(self->_opacityData);
  free(self->_sizeXData);
  free(self->_sizeYData);
  free(self->_timeOffsetData);
  free(self->_radius2Data);
  free(self->_edgeWidthData);
  v3.receiver = self;
  v3.super_class = (Class)CRLPKStrokePathCompactData;
  -[CRLPKStrokePathCompactData dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLPKStrokePathCompactData *v4;
  NSDate *v5;
  NSDate *creationDate;

  v4 = -[CRLPKStrokePathCompactData initWithCapacity:]([CRLPKStrokePathCompactData alloc], "initWithCapacity:", self->_capacity);
  v4->_pointCount = self->_pointCount;
  memcpy(v4->_azimuthData, self->_azimuthData, 2 * self->_capacity);
  memcpy(v4->_altitudeData, self->_altitudeData, 2 * self->_capacity);
  memcpy(v4->_forceData, self->_forceData, 2 * self->_capacity);
  memcpy(v4->_opacityData, self->_opacityData, 2 * self->_capacity);
  memcpy(v4->_sizeXData, self->_sizeXData, 4 * self->_capacity);
  memcpy(v4->_sizeYData, self->_sizeYData, 4 * self->_capacity);
  memcpy(v4->_timeOffsetData, self->_timeOffsetData, 4 * self->_capacity);
  memcpy(v4->_radius2Data, self->_radius2Data, 4 * self->_capacity);
  memcpy(v4->_edgeWidthData, self->_edgeWidthData, 2 * self->_capacity);
  v4->_randomSeed = self->_randomSeed;
  v5 = (NSDate *)-[NSDate copy](self->_creationDate, "copy");
  creationDate = v4->_creationDate;
  v4->_creationDate = v5;

  v4->_renderScaleX = self->_renderScaleX;
  v4->_renderScaleY = self->_renderScaleY;
  v4->_anchorPointForTexture = self->_anchorPointForTexture;
  v4->_shouldSolveMath = self->_shouldSolveMath;
  return v4;
}

+ (id)strokePathCompactDataFrom:(id)a3
{
  id v3;
  CRLPKStrokePathCompactData *v4;
  id v5;
  id v6;
  void *v7;
  CRLPKStrokePathCompactData *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = [CRLPKStrokePathCompactData alloc];
  v5 = objc_msgSend(v3, "pointCount");
  v6 = objc_msgSend(v3, "randomSeed");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "creationDate"));
  v8 = -[CRLPKStrokePathCompactData initWithCapacity:randomSeed:creationDate:](v4, "initWithCapacity:randomSeed:creationDate:", v5, v6, v7);

  -[CRLPKStrokePathCompactData appendStrokePathCompactData:](v8, "appendStrokePathCompactData:", v3);
  objc_msgSend(v3, "renderScaleX");
  -[CRLPKStrokePathCompactData setRenderScaleX:](v8, "setRenderScaleX:");
  objc_msgSend(v3, "renderScaleY");
  -[CRLPKStrokePathCompactData setRenderScaleY:](v8, "setRenderScaleY:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderGroupID"));
  -[CRLPKStrokePathCompactData setRenderGroupID:](v8, "setRenderGroupID:", v9);

  objc_msgSend(v3, "anchorPointForTexture");
  -[CRLPKStrokePathCompactData setAnchorPointForTexture:](v8, "setAnchorPointForTexture:");
  v10 = objc_msgSend(v3, "shouldSolveMath");

  -[CRLPKStrokePathCompactData setShouldSolveMath:](v8, "setShouldSolveMath:", v10);
  return v8;
}

- (BOOL)isEqualIgnoringShouldSolveMathFlag:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  double *v8;
  double *v9;
  unint64_t pointCount;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int randomSeed;
  NSDate *creationDate;
  void *v16;
  NSUUID *renderGroupID;
  BOOL v18;

  v4 = a3;
  v6 = objc_opt_class(CRLPKStrokePathCompactData, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (double *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v8)
    goto LABEL_24;
  pointCount = self->_pointCount;
  if (pointCount != *((_QWORD *)v8 + 13))
    goto LABEL_24;
  v11 = 0;
  while (pointCount != v11)
  {
    if (self->_azimuthData[v11] == *(unsigned __int16 *)(*((_QWORD *)v8 + 7) + 2 * v11)
      && self->_altitudeData[v11] == *(unsigned __int16 *)(*((_QWORD *)v8 + 6) + 2 * v11)
      && self->_forceData[v11] == *(unsigned __int16 *)(*((_QWORD *)v8 + 4) + 2 * v11)
      && self->_opacityData[v11] == *(unsigned __int16 *)(*((_QWORD *)v8 + 5) + 2 * v11)
      && self->_sizeXData[v11] == *(float *)(*((_QWORD *)v8 + 8) + 4 * v11)
      && self->_sizeYData[v11] == *(float *)(*((_QWORD *)v8 + 9) + 4 * v11)
      && self->_timeOffsetData[v11] == *(float *)(*((_QWORD *)v8 + 10) + 4 * v11)
      && self->_radius2Data[v11] == *(float *)(*((_QWORD *)v8 + 11) + 4 * v11))
    {
      v12 = self->_edgeWidthData[v11];
      v13 = *(unsigned __int16 *)(*((_QWORD *)v8 + 12) + 2 * v11++);
      if (v12 == v13)
        continue;
    }
    goto LABEL_24;
  }
  randomSeed = self->_randomSeed;
  if (randomSeed == objc_msgSend(v8, "randomSeed")
    && (creationDate = self->_creationDate,
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDate")),
        LODWORD(creationDate) = -[NSDate isEqual:](creationDate, "isEqual:", v16),
        v16,
        (_DWORD)creationDate)
    && self->_renderScaleX == *((float *)v9 + 4)
    && self->_renderScaleY == *((float *)v9 + 5)
    && ((renderGroupID = self->_renderGroupID, !((unint64_t)renderGroupID | *((_QWORD *)v9 + 15)))
     || -[NSUUID isEqual:](renderGroupID, "isEqual:")))
  {
    v18 = self->_anchorPointForTexture.y == v9[17] && self->_anchorPointForTexture.x == v9[16];
  }
  else
  {
LABEL_24:
    v18 = 0;
  }

  return v18;
}

- (CRLPKStrokePointCompactData)strokePointCompactDataAtIndex:(SEL)a3
{
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  uint64_t v8;
  float v9;
  float v10;
  CRLPKStrokePointCompactData *v11;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  CKRecordID v26;
  Swift::String v27;
  uint64_t v28;
  uint8_t buf[4];
  unsigned int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  uint64_t v40;

  if (*(_QWORD *)&self[3].var7 <= a4)
  {
    v11 = self;
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237F50);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)&v11[3].var7;
      *(_DWORD *)buf = 67110402;
      v30 = v13;
      v31 = 2082;
      v32 = "-[CRLPKStrokePathCompactData strokePointCompactDataAtIndex:]";
      v33 = 2082;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m";
      v35 = 1024;
      v36 = 199;
      v37 = 2048;
      v38 = a4;
      v39 = 2048;
      v40 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out of bounds error. The given index (%zd) must be within [0, %zd).", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237F70);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v28 = *(_QWORD *)&v11[3].var7;
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Out of bounds error. The given index (%zd) must be within [0, %zd).", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[CRLPKStrokePathCompactData strokePointCompactDataAtIndex:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStrokePathCompactData strokePointCompactDataAtIndex:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 199, 1, "Out of bounds error. The given index (%zd) must be within [0, %zd).", a4, *(_QWORD *)&v11[3].var7, 199, a4, v28);

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v26, v27);
    abort();
  }
  v4 = *(_QWORD *)&self[1].var5;
  retstr->var0 = *(_WORD *)(*(_QWORD *)&self[1].var2 + 2 * a4);
  retstr->var1 = *(_WORD *)(v4 + 2 * a4);
  v5 = *(_QWORD *)&self[2].var0;
  retstr->var2 = *(_WORD *)(*(_QWORD *)&self[1].var7 + 2 * a4);
  retstr->var3 = *(_WORD *)(v5 + 2 * a4);
  v6 = *(float *)(*(_QWORD *)&self[2].var4 + 4 * a4);
  v7 = *(float *)(*(_QWORD *)&self[2].var6 + 4 * a4);
  v8 = *(_QWORD *)&self[3].var2;
  v9 = *(float *)(*(_QWORD *)&self[2].var8 + 4 * a4);
  *(_DWORD *)&retstr->var8 = 0;
  retstr->var4 = v6;
  retstr->var5 = v7;
  v10 = *(float *)(v8 + 4 * a4);
  retstr->var6 = v9;
  retstr->var7 = v10;
  retstr->var8 = *(_WORD *)(*(_QWORD *)&self[3].var5 + 2 * a4);
  return self;
}

- (void)increaseCapacityBy:(unint64_t)a3
{
  unint64_t v4;

  v4 = self->_capacity + a3;
  self->_capacity = v4;
  self->_forceData = (unsigned __int16 *)malloc_type_realloc(self->_forceData, 2 * v4, 0x1000040BDFB0063uLL);
  self->_altitudeData = (unsigned __int16 *)malloc_type_realloc(self->_altitudeData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
  self->_azimuthData = (unsigned __int16 *)malloc_type_realloc(self->_azimuthData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
  self->_opacityData = (unsigned __int16 *)malloc_type_realloc(self->_opacityData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
  self->_sizeXData = (float *)malloc_type_realloc(self->_sizeXData, 4 * self->_capacity, 0x100004052888210uLL);
  self->_sizeYData = (float *)malloc_type_realloc(self->_sizeYData, 4 * self->_capacity, 0x100004052888210uLL);
  self->_timeOffsetData = (float *)malloc_type_realloc(self->_timeOffsetData, 4 * self->_capacity, 0x100004052888210uLL);
  self->_radius2Data = (float *)malloc_type_realloc(self->_radius2Data, 4 * self->_capacity, 0x100004052888210uLL);
  self->_edgeWidthData = (unsigned __int16 *)malloc_type_realloc(self->_edgeWidthData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
}

- (void)appendStrokePathCompactData:(id)a3
{
  id v4;
  id v5;
  unint64_t pointCount;
  unint64_t capacity;
  unint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "pointCount");
  pointCount = self->_pointCount;
  capacity = self->_capacity;
  v8 = (unint64_t)v5 + pointCount;
  v9 = (char *)v5 + pointCount - capacity;
  if ((char *)v5 + pointCount != (id)capacity)
  {
    -[CRLPKStrokePathCompactData increaseCapacityBy:](self, "increaseCapacityBy:", v9);
    pointCount = self->_pointCount;
    v8 = self->_capacity;
  }
  if (pointCount >= v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v9);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237F90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA850();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237FB0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStrokePathCompactData appendStrokePathCompactData:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 233, 0, "Out of bounds error when appending a strokePointData object.");

    pointCount = self->_pointCount;
    v8 = self->_capacity;
  }
  if (pointCount < v8)
  {
    memcpy(&self->_forceData[pointCount], objc_msgSend(v4, "forceData"), 2 * (_QWORD)v5);
    memcpy(&self->_altitudeData[self->_pointCount], objc_msgSend(v4, "altitudeData"), 2 * (_QWORD)v5);
    memcpy(&self->_azimuthData[self->_pointCount], objc_msgSend(v4, "azimuthData"), 2 * (_QWORD)v5);
    memcpy(&self->_opacityData[self->_pointCount], objc_msgSend(v4, "opacityData"), 2 * (_QWORD)v5);
    memcpy(&self->_sizeXData[self->_pointCount], objc_msgSend(v4, "sizeXData"), 4 * (_QWORD)v5);
    memcpy(&self->_sizeYData[self->_pointCount], objc_msgSend(v4, "sizeYData"), 4 * (_QWORD)v5);
    memcpy(&self->_timeOffsetData[self->_pointCount], objc_msgSend(v4, "timeOffsetData"), 4 * (_QWORD)v5);
    memcpy(&self->_radius2Data[self->_pointCount], objc_msgSend(v4, "radius2Data"), 4 * (_QWORD)v5);
    memcpy(&self->_edgeWidthData[self->_pointCount], objc_msgSend(v4, "edgeWidthData"), 2 * (_QWORD)v5);
    self->_pointCount += (unint64_t)v5;
  }

}

- (void)appendStrokePointCompactData:(CRLPKStrokePointCompactData *)a3
{
  unint64_t pointCount;
  unint64_t capacity;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 *opacityData;
  unsigned __int16 *azimuthData;
  float *sizeYData;
  float *radius2Data;

  pointCount = self->_pointCount;
  capacity = self->_capacity;
  if (pointCount >= capacity)
  {
    -[CRLPKStrokePathCompactData increaseCapacityBy:](self, "increaseCapacityBy:", (unint64_t)fmax((double)capacity * 0.5, 1.0));
    pointCount = self->_pointCount;
    capacity = self->_capacity;
  }
  if (pointCount >= capacity)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237FD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA8D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237FF0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStrokePathCompactData appendStrokePointCompactData:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 253, 0, "Out of bounds error when appending a strokePointData object.");

    pointCount = self->_pointCount;
    capacity = self->_capacity;
  }
  if (pointCount < capacity)
  {
    opacityData = self->_opacityData;
    self->_forceData[pointCount] = a3->var0;
    azimuthData = self->_azimuthData;
    self->_altitudeData[pointCount] = a3->var2;
    azimuthData[pointCount] = a3->var3;
    opacityData[pointCount] = a3->var1;
    sizeYData = self->_sizeYData;
    self->_sizeXData[pointCount] = a3->var4;
    sizeYData[pointCount] = a3->var5;
    radius2Data = self->_radius2Data;
    self->_timeOffsetData[pointCount] = a3->var6;
    radius2Data[pointCount] = a3->var7;
    self->_edgeWidthData[pointCount] = a3->var8;
    self->_pointCount = pointCount + 1;
  }
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unsigned)forceData
{
  return self->_forceData;
}

- (unsigned)opacityData
{
  return self->_opacityData;
}

- (unsigned)altitudeData
{
  return self->_altitudeData;
}

- (unsigned)azimuthData
{
  return self->_azimuthData;
}

- (float)sizeXData
{
  return self->_sizeXData;
}

- (float)sizeYData
{
  return self->_sizeYData;
}

- (float)timeOffsetData
{
  return self->_timeOffsetData;
}

- (float)radius2Data
{
  return self->_radius2Data;
}

- (unsigned)edgeWidthData
{
  return self->_edgeWidthData;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (void)setPointCount:(unint64_t)a3
{
  self->_pointCount = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unsigned)randomSeed
{
  return self->_randomSeed;
}

- (float)renderScaleX
{
  return self->_renderScaleX;
}

- (void)setRenderScaleX:(float)a3
{
  self->_renderScaleX = a3;
}

- (float)renderScaleY
{
  return self->_renderScaleY;
}

- (void)setRenderScaleY:(float)a3
{
  self->_renderScaleY = a3;
}

- (NSUUID)renderGroupID
{
  return self->_renderGroupID;
}

- (void)setRenderGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_renderGroupID, a3);
}

- (CGPoint)anchorPointForTexture
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPointForTexture.x;
  y = self->_anchorPointForTexture.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPointForTexture:(CGPoint)a3
{
  self->_anchorPointForTexture = a3;
}

- (BOOL)shouldSolveMath
{
  return self->_shouldSolveMath;
}

- (void)setShouldSolveMath:(BOOL)a3
{
  self->_shouldSolveMath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderGroupID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
