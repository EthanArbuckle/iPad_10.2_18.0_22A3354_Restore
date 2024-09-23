@implementation RCWaveformSegment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[RCWaveformSegment setVersion:](RCWaveformSegment, "setVersion:", 1);
}

+ (id)emptySegmentWithTimeRange:(id)a3
{
  double var1;
  double var0;
  id v5;
  void *v6;
  void *v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithTimeRange:averagePowerLevelData:", v6, var0, var1);

  return v7;
}

- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4
{
  double var1;
  double var0;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  RCWaveformSegment *v14;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformSegment.mm");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("<Unknown File>");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 33, CFSTR("invalid segment data.  if this segment really has no data, use +emptySegmentWithTimeRange:"), 0, 0, 0, 0, 0);

  }
  v14 = -[RCWaveformSegment _initWithTimeRange:averagePowerLevelData:](self, "_initWithTimeRange:averagePowerLevelData:", v8, var0, var1);

  return v14;
}

- (id)_initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4
{
  double var1;
  double var0;
  id v8;
  RCWaveformSegment *v9;
  RCWaveformSegment *v10;
  objc_super v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RCWaveformSegment;
  v9 = -[RCWaveformSegment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_timeRange.beginTime = var0;
    v9->_timeRange.endTime = var1;
    objc_storeStrong((id *)&v9->_averagePowerLevelData, a4);
    v10->_isRendered = 0;
  }

  return v10;
}

- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelVector:(void *)a4
{
  double var1;
  double var0;
  id v8;
  RCWaveformSegment *v9;
  RCWaveformSegment *v10;

  var1 = a3.var1;
  var0 = a3.var0;
  if (*((_QWORD *)a4 + 1) == *(_QWORD *)a4)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", *(_QWORD *)a4, *((_QWORD *)a4 + 1) - *(_QWORD *)a4));
    memcpy((void *)objc_msgSend(v8, "mutableBytes"), *(const void **)a4, *((_QWORD *)a4 + 1) - *(_QWORD *)a4);
  }
  v9 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:](self, "initWithTimeRange:averagePowerLevelData:", v8, var0, var1);
  v10 = v9;
  if (v9)
  {
    v9->_timeRange.beginTime = var0;
    v9->_timeRange.endTime = var1;
  }

  return v10;
}

- (id)verboseDescription
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  const float *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[RCWaveformSegment simpleDescription](self, "simpleDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = RCTimeRangeDeltaWithExactPrecision(self->_timeRange.beginTime, self->_timeRange.endTime);
  v5 = -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = v4 / (double)v5;
  while (v7 < -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount"))
  {
    v9 = -[RCWaveformSegment averagePowerLevels](self, "averagePowerLevels");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%.3fs] %.2f"), v8 * (double)v7, v9[v7]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    ++v7;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)simpleDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)RCWaveformSegment;
  -[RCWaveformSegment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRCTimeRange(self->_timeRange.beginTime, self->_timeRange.endTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: timeRange=%@, levelCount=%d"), v4, v5, -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCWaveformSegment)initWithCoder:(id)a3
{
  id v4;
  double v5;
  NSData *v6;
  NSData *averagePowerLevelData;

  v4 = a3;
  self->_timeRange.beginTime = RCTimeRangeDecodeWithKey(v4, CFSTR("RCTimeRange"));
  self->_timeRange.endTime = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RCAveragePowerLevelVectorData"));
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  averagePowerLevelData = self->_averagePowerLevelData;
  self->_averagePowerLevelData = v6;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  RCTimeRangeEncodeWithKey(v4, CFSTR("RCTimeRange"), self->_timeRange.beginTime, self->_timeRange.endTime);
  objc_msgSend(v4, "encodeObject:forKey:", self->_averagePowerLevelData, CFSTR("RCAveragePowerLevelVectorData"));

}

- (const)averagePowerLevels
{
  return (const float *)-[NSData bytes](self->_averagePowerLevelData, "bytes");
}

- (int64_t)averagePowerLevelsCount
{
  return -[NSData length](self->_averagePowerLevelData, "length") >> 2;
}

- (BOOL)hasUniformPowerLevel:(float)a3
{
  unint64_t v5;
  float v6;
  BOOL v7;

  if (!-[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount"))
    return 0;
  if (!-[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount"))
    return 1;
  v5 = 0;
  do
  {
    v6 = -[RCWaveformSegment averagePowerLevels](self, "averagePowerLevels")[4 * v5];
    v7 = v6 == a3;
    if (v6 != a3)
      break;
    ++v5;
  }
  while (v5 < -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount"));
  return v7;
}

- (BOOL)isWaveformDataEqualToDataInSegment:(id)a3
{
  if (a3 == self)
    return 1;
  else
    return -[NSData isEqual:](self->_averagePowerLevelData, "isEqual:", *((_QWORD *)a3 + 1));
}

- (BOOL)isWaveformDataAlmostEqualToDataInSegment:(id)a3
{
  RCWaveformSegment *v4;
  RCWaveformSegment *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  BOOL v10;
  BOOL v11;

  v4 = (RCWaveformSegment *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_10;
  v6 = -[RCWaveformSegment averagePowerLevelsCount](v4, "averagePowerLevelsCount");
  if (v6 != -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount"))
  {
    v11 = 0;
    goto LABEL_12;
  }
  v7 = -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount");
  if (!v7)
  {
LABEL_10:
    v11 = 1;
  }
  else
  {
    v8 = 0;
    v9 = v7 - 1;
    do
    {
      v10 = RCEqualFloatsWithTolerance(-[RCWaveformSegment averagePowerLevels](self, "averagePowerLevels")[4 * v8], -[RCWaveformSegment averagePowerLevels](v5, "averagePowerLevels")[4 * v8], 0.1);
      v11 = v10;
    }
    while (v9 != v8++ && v10);
  }
LABEL_12:

  return v11;
}

- (id)copyWithTimeRangeOffsetByTimeOffset:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimeRange:averagePowerLevelData:", self->_averagePowerLevelData, self->_timeRange.beginTime + a3, self->_timeRange.endTime + a3);
}

- (id)copyWithAdjustedTimeRange:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimeRange:averagePowerLevelData:", self->_averagePowerLevelData, a3.var0, a3.var1);
}

+ (id)segmentsByReparingDiscontinuitiesInSegments:(id)a3
{
  objc_msgSend(a1, "_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)segmentsByShiftingSegments:(id)a3 byTimeOffset:(double)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithTimeRangeOffsetByTimeOffset:", a4, (_QWORD)v13);
          objc_msgSend(v6, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
  }

  return v6;
}

+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4 beforeTime:(double)a5 andThenUsePreferredSegmentDuration:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((unint64_t)objc_msgSend(v10, "count") > 1)
  {
    v44 = v10;
    v45 = (void *)objc_msgSend(v10, "mutableCopy");
    if (v45)
    {
      v12 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v15 = v45;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v51;
        v18 = 0.0;
        v19 = a4;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v51 != v17)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v21, "timeRange");
            v23 = v22;
            v25 = v24;
            if (v22 >= a5 && v19 == a4)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v27);

              v19 = a6;
            }
            objc_msgSend(v14, "lastObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v28, "count"))
              v18 = v23;
            objc_msgSend(v28, "addObject:", v21);
            if (v25 - v18 >= v19)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array", v25 - v18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v29);

            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v16);
      }

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v30 = v14;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v47 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
            if (objc_msgSend(v34, "count") == 1)
            {
              objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v35);
            }
            else
            {
              if ((unint64_t)objc_msgSend(v34, "count") < 2)
                continue;
              objc_msgSend(v34, "firstObject");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "lastObject");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "timeRange");
              v38 = v37;
              objc_msgSend(v36, "timeRange");
              v40 = v39 - v38;
              if (v38 >= a5)
                v41 = a6;
              else
                v41 = a4;
              if (v40 >= v41)
              {
                objc_msgSend(a1, "_segmentByMergingMergableSegments:", v34);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v42);

              }
              else
              {
                objc_msgSend(v11, "addObjectsFromArray:", v34);
              }

            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v31);
      }

    }
    else
    {
      v11 = v10;
    }

    v10 = v44;
    goto LABEL_42;
  }
  v11 = v10;
LABEL_42:

  return v11;
}

+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4
{
  objc_msgSend(a1, "segmentsByMergingSegments:preferredSegmentDuration:beforeTime:andThenUsePreferredSegmentDuration:", a3, a4, 1.79769313e308, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)segmentsByJoiningIfSmallSegment:(id)a3
{
  -[RCWaveformSegment _segmentsByJoiningIfNecessaryGreaterSegment:averagePowerLevelJoinLimit:](self, "_segmentsByJoiningIfNecessaryGreaterSegment:averagePowerLevelJoinLimit:", a3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)segmentsByJoiningIfSmallSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  RCWaveformSegment **v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  RCWaveformSegment *v18;
  id v19;
  RCWaveformSegment *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    v20 = self;
    v11 = &v20;
    v12 = 1;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, v12, v18, v19, v20, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[RCWaveformSegment timeRange](self, "timeRange");
  v8 = v7;
  objc_msgSend(v6, "timeRange");
  if (v8 != v9)
  {
    objc_msgSend(v6, "timeRange");
    v14 = v13;
    -[RCWaveformSegment timeRange](self, "timeRange");
    if (v14 == v15)
    {
      objc_msgSend(v6, "_segmentsByJoiningIfNecessaryGreaterSegment:averagePowerLevelJoinLimit:", self, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v18 = self;
    v19 = v6;
    v11 = &v18;
    v12 = 2;
    goto LABEL_5;
  }
  -[RCWaveformSegment _segmentsByJoiningIfNecessaryGreaterSegment:averagePowerLevelJoinLimit:](self, "_segmentsByJoiningIfNecessaryGreaterSegment:averagePowerLevelJoinLimit:", v6, a4);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v16 = (void *)v10;

  return v16;
}

- (id)segmentByClippingToTimeRange:(id)a3
{
  double var1;
  double var0;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  RCWaveformSegment *v12;
  double v14;
  double v15;
  double v16;
  __n128 v17;
  double v18;

  var1 = a3.var1;
  var0 = a3.var0;
  -[RCWaveformSegment timeRange](self, "timeRange");
  if (RCTimeRangeEqualToTimeRange(var0, var1, v6, v7)
    || (-[RCWaveformSegment timeRange](self, "timeRange"), RCTimeRangeContainsRange(var0, var1, v8, v9))
    || (-[RCWaveformSegment timeRange](self, "timeRange"), RCTimeRangeContainsRange(var0, var1, v10, v11)))
  {
    v12 = self;
  }
  else
  {
    -[RCWaveformSegment timeRange](self, "timeRange");
    if (v14 > var1)
    {
      -[RCWaveformSegment timeRange](self, "timeRange");
      if (v15 <= var1)
        goto LABEL_14;
    }
    -[RCWaveformSegment timeRange](self, "timeRange");
    if (var0 < v16)
      var0 = v16;
    -[RCWaveformSegment timeRange](self, "timeRange");
    if (var1 < v18)
      v18 = var1;
    if (var0 >= v18)
    {
LABEL_14:
      v12 = 0;
    }
    else
    {
      v17.n128_f64[0] = var0;
      -[RCWaveformSegment _segmentWithValuesInContainedTimeRange:](self, "_segmentWithValuesInContainedTimeRange:", RCTimeRangeMake(v17, v18));
      v12 = (RCWaveformSegment *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

+ (id)_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:(id)a3
{
  id v3;
  id v4;
  unint64_t i;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    for (i = 1; i < objc_msgSend(v3, "count"); i = v8 + 1)
    {
      v6 = i - 1;
      objc_msgSend(v3, "objectAtIndexedSubscript:", i - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 + 1;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6 + 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeRange");
      v11 = v10;
      objc_msgSend(v7, "timeRange");
      if (vabdd_f64(v11, v12) > 0.01)
      {
        objc_msgSend(v7, "timeRange");
        v13 = objc_msgSend(v7, "copyWithAdjustedTimeRange:");

        v7 = (void *)v13;
      }
      objc_msgSend(v4, "addObject:", v7);

    }
    objc_msgSend(v3, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (id)_segmentWithValuesInContainedTimeRange:(id)a3
{
  double var1;
  double var0;
  int64_t v7;
  int64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  double v16;
  float v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  const float *v26;
  id v27;
  RCWaveformSegment *v28;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount");
  if (v7)
  {
    v8 = v7;
    -[RCWaveformSegment timeRange](self, "timeRange");
    if (!RCTimeRangeContainsRange(v9, v10, var0, var1))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformSegment.mm");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("<Unknown File>");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 348, CFSTR("Invalid argment"), 0, 0, 0, 0, 0);

    }
    v16 = RCTimeRangeDeltaWithExactPrecision(self->_timeRange.beginTime, self->_timeRange.endTime);
    v17 = v16 / (float)-[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount");
    -[RCWaveformSegment timeRange](self, "timeRange");
    v19 = (var0 - v18) / v17;
    if (v8 - 1 >= (unint64_t)v19)
      v20 = (unint64_t)v19;
    else
      v20 = v8 - 1;
    -[RCWaveformSegment timeRange](self, "timeRange");
    v22 = v21 + (float)(v17 * (float)v20);
    v23 = vcvtpd_u64_f64(RCTimeRangeDeltaWithExactPrecision(v22, var1) / v17);
    if (v23 <= 1)
      v23 = 1;
    if (v8 - v20 >= v23)
      v24 = v23;
    else
      v24 = v8 - v20;
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[RCWaveformSegment averagePowerLevels](self, "averagePowerLevels");
      v27 = objc_retainAutorelease(v25);
      memmove((void *)objc_msgSend(v27, "mutableBytes"), &v26[v20], 4 * v24);
      v28 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v27, v22, v22 + (float)(v17 * (float)v24));

    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "emptySegmentWithTimeRange:", var0, var1);
    v28 = (RCWaveformSegment *)objc_claimAutoreleasedReturnValue();
  }
  return v28;
}

- (id)_segmentsByJoiningIfNecessaryGreaterSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    v14[0] = self;
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RCWaveformSegment _segmentsByJoiningSegment:toSegmentIfNecessaryWithGreaterSegment:averagePowerLevelJoinLimit:](RCWaveformSegment, "_segmentsByJoiningSegment:toSegmentIfNecessaryWithGreaterSegment:averagePowerLevelJoinLimit:", v10, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_segmentsByJoiningSegment:(id)a3 toSegmentIfNecessaryWithGreaterSegment:(id)a4 averagePowerLevelJoinLimit:(unint64_t)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  __n128 v17;
  double v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __n128 v23;
  double v24;
  void *v25;
  uint64_t v27;
  float v28;
  float v29;
  unint64_t v30;
  unint64_t v31;
  __n128 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t i;
  float v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  RCWaveformSegment *v58;
  _QWORD v59[2];
  RCWaveformSegment *v60;
  id v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "timeRange");
  v11 = RCTimeRangeDeltaWithExactPrecision(v9, v10);
  objc_msgSend(v8, "timeRange");
  v14 = RCTimeRangeDeltaWithExactPrecision(v12, v13);
  if (objc_msgSend(v7, "averagePowerLevelsCount") <= 1)
  {
    objc_msgSend(v7, "timeRange");
    v16 = v15;
    objc_msgSend(v8, "timeRange");
    v17.n128_u64[0] = v16;
    v19 = (id)objc_msgSend(v8, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v17, v18));
    v62[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v25 = (void *)v20;
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "averagePowerLevelsCount") <= 1)
  {
    objc_msgSend(v7, "timeRange");
    v22 = v21;
    objc_msgSend(v8, "timeRange");
    v23.n128_u64[0] = v22;
    v19 = (id)objc_msgSend(v7, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v23, v24));
    v61 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v27 = objc_msgSend(v7, "averagePowerLevelsCount");
  if (objc_msgSend(v8, "averagePowerLevelsCount") + v27 >= a5 || (v28 = v11, v29 = v14, (float)(v28 + v29) <= 0.0))
  {
    v59[0] = v7;
    v59[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v7, "timeRange");
  v31 = v30;
  objc_msgSend(v8, "timeRange");
  v32.n128_u64[0] = v31;
  v34 = RCTimeRangeMake(v32, v33);
  v36 = v35;
  objc_msgSend(v7, "timeRange");
  v39 = RCTimeRangeDeltaWithExactPrecision(v37, v38);
  v40 = objc_msgSend(v7, "averagePowerLevelsCount");
  objc_msgSend(v8, "timeRange");
  v43 = RCTimeRangeDeltaWithExactPrecision(v41, v42);
  v44 = objc_msgSend(v8, "averagePowerLevelsCount");
  v45 = v39;
  v46 = v45 / (float)v40;
  v47 = v43;
  v48 = v47 / (float)v44;
  if (v46 > 0.0)
  {
    if (v48 <= 0.0)
    {
      v48 = v45 / (float)v40;
    }
    else if (v46 < v48)
    {
      v48 = v45 / (float)v40;
    }
  }
  v49 = (uint64_t)(RCTimeRangeDeltaWithExactPrecision(v34, v36) / v48);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v49);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v50 = objc_msgSend(v19, "mutableBytes");
  if (v49)
  {
    v51 = v50;
    for (i = 0; i != v49; ++i)
    {
      objc_msgSend(v7, "timeRange");
      v53 = v48 * (float)i;
      if (v54 <= v53)
      {
        v55 = objc_msgSend(v8, "averagePowerLevels");
        v56 = (uint64_t)(v53 - v45);
        v57 = v47;
      }
      else
      {
        v55 = objc_msgSend(v7, "averagePowerLevels");
        v56 = (uint64_t)v53;
        v57 = v45;
      }
      *(_DWORD *)(v51 + 4 * i) = *(_DWORD *)(v55 + 4 * (uint64_t)(float)((float)v56 / v57));
    }
  }
  v58 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v19, v34, v36);
  v60 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_7:

  return v25;
}

+ (id)_segmentByMergingMergableSegments:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (v5)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(0, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformSegment.mm");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("<Unknown File>");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v10, 434, CFSTR("Invalid paremeter"), 0, 0, 0, 0, 0);

  if (!v5)
    goto LABEL_8;
LABEL_3:
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v22 = (void *)v6;
    goto LABEL_21;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "timeRange");
        v20 = RCTimeRangeDeltaWithExactPrecision(v18, v19);
        v15 = v15 + v20 / (double)objc_msgSend(v17, "averagePowerLevelsCount");
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  v21 = v15 / (double)(unint64_t)objc_msgSend(v12, "count");
  objc_msgSend(a1, "_mergedSegmentByFastMergingWithMergeableSegments:mergedLevelsDuration:", v12, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(a1, "_mergedSegmentByResamplingWithMergeableSegments:mergedLevelsDuration:", v12, v21);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:

  return v22;
}

+ (id)_mergedSegmentByFastMergingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4
{
  return 0;
}

+ (id)_mergedSegmentByResamplingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  __n128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t i;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  BOOL v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float v39;
  RCWaveformSegment *v40;
  void *v42;
  uint64_t v43;
  void *v44;

  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "timeRange");
  v7 = v6;
  objc_msgSend(v42, "timeRange");
  v8.n128_u64[0] = v7;
  v10 = RCTimeRangeMake(v8, v9);
  v12 = v11;
  v13 = (unint64_t)(RCTimeRangeDeltaWithExactPrecision(v10, v11) / a4);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v43 = objc_msgSend(v14, "mutableBytes");
  if (v13)
  {
    v15 = 0;
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v44, "timeRange");
      v18 = v17 + (double)i * a4;
      v19 = v15;
      do
      {
        v15 = v19;
        if (v19 >= objc_msgSend(v5, "count"))
          break;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeRange");
        v23 = RCTimeRangeContainsTime(v21, v22, v18);
        ++v19;

      }
      while (!v23);
      if (objc_msgSend(v5, "count") == v15)
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeRange");
      v27 = RCTimeRangeDeltaWithExactPrecision(v25, v26);
      v28 = objc_msgSend(v24, "averagePowerLevelsCount");
      objc_msgSend(v24, "timeRange");
      v30 = v29;
      v31 = objc_msgSend(v24, "averagePowerLevelsCount");
      v32 = (v18 - v30) / (v27 / (double)v28);
      if (v31 - 1 >= (uint64_t)v32)
        v33 = (uint64_t)v32;
      else
        v33 = v31 - 1;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v14;
      v36 = v33 + 1;
      if (v33 + 1 >= (unint64_t)(objc_msgSend(v24, "averagePowerLevelsCount") - 1))
      {
        if (v15 + 1 >= objc_msgSend(v5, "count"))
        {
          v36 = v33;
        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:");
          v37 = objc_claimAutoreleasedReturnValue();

          v36 = 0;
          v34 = (void *)v37;
        }
      }
      v38 = *(float *)(objc_msgSend(v24, "averagePowerLevels") + 4 * v33);
      v39 = *(float *)(objc_msgSend(v34, "averagePowerLevels") + 4 * v36);
      if (v38 >= v39)
        v39 = v38;
      *(float *)(v43 + 4 * i) = v39;

      v14 = v35;
    }
  }
  v40 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v14, v10, v12);

  return v40;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_timeRange.beginTime;
  endTime = self->_timeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (BOOL)isRendered
{
  return self->_isRendered;
}

- (void)setIsRendered:(BOOL)a3
{
  self->_isRendered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averagePowerLevelData, 0);
}

@end
