@implementation RCWaveform

- (RCWaveform)init
{
  RCWaveform *v2;
  NSArray *v3;
  NSArray *segments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCWaveform;
  v2 = -[RCWaveform init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    segments = v2->_segments;
    v2->_segments = v3;

  }
  return v2;
}

- (RCWaveform)initWithSegments:(id)a3
{
  id v4;
  RCWaveform *v5;
  uint64_t v6;
  NSArray *segments;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCWaveform;
  v5 = -[RCWaveform init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    segments = v5->_segments;
    v5->_segments = (NSArray *)v6;

  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[RCWaveform setVersion:](RCWaveform, "setVersion:", 2);
}

- (BOOL)hasUniformPowerLevel:(float)a3
{
  RCWaveform *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  -[RCWaveform segments](v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[RCWaveform segments](v4, "segments", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          *(float *)&v9 = a3;
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasUniformPowerLevel:", v9) & 1) == 0)
          {
            LODWORD(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LODWORD(v8) = 1;
  }
  objc_sync_exit(v4);

  return (_DWORD)v8 == 0;
}

- (BOOL)isWaveformDataEqualToDataInWaveform:(id)a3
{
  return -[RCWaveform _isWaveformDataEqualToDataInWaveform:useAlmostEqual:](self, "_isWaveformDataEqualToDataInWaveform:useAlmostEqual:", a3, 0);
}

- (BOOL)isWaveformDataAlmostEqualToDataInWaveform:(id)a3
{
  return -[RCWaveform _isWaveformDataEqualToDataInWaveform:useAlmostEqual:](self, "_isWaveformDataEqualToDataInWaveform:useAlmostEqual:", a3, 1);
}

- (BOOL)_isWaveformDataEqualToDataInWaveform:(id)a3 useAlmostEqual:(BOOL)a4
{
  _BOOL4 v4;
  RCWaveform *v6;
  RCWaveform *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  v4 = a4;
  v6 = (RCWaveform *)a3;
  if (v6 == self)
  {
    v15 = 1;
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    -[RCWaveform segments](v6, "segments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    -[RCWaveform segments](v7, "segments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 == v11)
    {
      for (i = 0; ; ++i)
      {
        -[RCWaveform segments](v7, "segments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        v15 = i >= v14;
        if (i >= v14)
          break;
        if (v4)
        {
          -[RCWaveform segments](v6, "segments");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[RCWaveform segments](v7, "segments");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "isWaveformDataAlmostEqualToDataInSegment:", v19);

          if ((v20 & 1) == 0)
            break;
        }
        else
        {
          -[RCWaveform segments](v6, "segments");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", i);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RCWaveform segments](v7, "segments");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", i);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v22, "isWaveformDataEqualToDataInSegment:", v24);

          if (!v25)
            break;
        }
      }
    }
    else
    {
      v15 = 0;
    }
    objc_sync_exit(v7);

  }
  return v15;
}

- (NSArray)segmentsCopy
{
  RCWaveform *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[RCWaveform segments](v2, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (unint64_t)segmentCount
{
  RCWaveform *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  -[RCWaveform segments](v2, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)averagePowerLevelsRate
{
  RCWaveform *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[RCWaveform segments](v2, "segments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v16;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "averagePowerLevelsCount");
        objc_msgSend(v9, "timeRange");
        v5 += v10;
        v7 = v7 + RCTimeRangeDeltaWithExactPrecision(v11, v12);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
    v13 = (double)v5;
  }
  else
  {
    v7 = 0.0;
    v13 = 0.0;
  }

  objc_sync_exit(v2);
  if (v7 >= 0.00000011920929)
    return (unint64_t)fmax(v13 / v7, 1.0);
  else
    return 1;
}

+ (id)waveformURLForAVURL:(id)a3
{
  objc_msgSend(a3, "rc_URLByReplacingPathExtensionWithExtension:", CFSTR("waveform"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (RCWaveform)waveformWithContentsOfURL:(id)a3 minimumRequiredVersion:(unint64_t)a4
{
  void *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v6)
  {
    if (v6[1] < a4)
    {
      v8 = 0;
LABEL_6:

      v6 = (_QWORD *)v8;
      goto LABEL_7;
    }
    v9 = objc_opt_class();
    if (v9 != objc_opt_class())
    {
      v10 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v6, "segments");
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "initWithSegments:", v11);

      v6 = (_QWORD *)v11;
      goto LABEL_6;
    }
  }
LABEL_7:

  return (RCWaveform *)v6;
}

- (BOOL)saveContentsToURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    v9 = objc_msgSend(v7, "writeToURL:atomically:", v4, 1);
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RCWaveform saveContentsToURL:].cold.1((uint64_t)v8, v10);

    v9 = 0;
  }

  return v9;
}

- (id)segmentsByClippingToTimeRange:(id)a3
{
  double var1;
  double var0;
  RCWaveform *v5;
  void *v6;
  void *v7;
  void *v8;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_class();
  -[RCWaveform segments](v5, "segments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mutableSegmentsByClippingToTimeRange:withSegments:", v7, var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (id)segmentsIntersectingTimeRange:(id)a3
{
  double var1;
  double var0;
  RCWaveform *v5;
  void *v6;
  void *v7;
  void *v8;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_class();
  -[RCWaveform segments](v5, "segments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mutableSegmentsIntersectingTimeRange:intersectionRange:withSegments:", 0, v7, var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

+ (_NSRange)rangeOfSegmentsIntersectingTimeRange:(id)a3 withSegments:(id)a4
{
  double var1;
  double var0;
  id v6;
  RCWaveformSegment *v7;
  void *v8;
  RCWaveformSegment *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = [RCWaveformSegment alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:](v7, "initWithTimeRange:averagePowerLevelData:", v8, var0, var1);

    v10 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v6, "count"), 256, &__block_literal_global_11);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (v10 == objc_msgSend(v6, "count") - 1)
    {
      v11 = 1;
    }
    else
    {
      v12 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v9, v10, objc_msgSend(v6, "count") - v10, 512, &__block_literal_global_11);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = objc_msgSend(v6, "count") - 1;
      v11 = v12 - v10 + 1;
    }

  }
  else
  {
    v11 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v10;
  v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

uint64_t __64__RCWaveform_rangeOfSegmentsIntersectingTimeRange_withSegments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "timeRange");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "timeRange");
  if (v10 < v8)
    v11 = 0;
  else
    v11 = -1;
  if (v9 <= v6)
    v12 = 1;
  else
    v12 = v11;

  return v12;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange
{
  RCWaveform *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  __n128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = self;
  objc_sync_enter(v2);
  -[RCWaveform segments](v2, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeRange");
  v6 = v5;
  -[RCWaveform segments](v2, "segments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeRange");
  v9.n128_u64[0] = v6;
  v11 = RCTimeRangeMake(v9, v10);
  v13 = v12;

  objc_sync_exit(v2);
  v14 = v11;
  v15 = v13;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCWaveform)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *segments;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("RCSegments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSArray *)objc_msgSend(v8, "mutableCopy");
  segments = self->_segments;
  self->_segments = v9;

  self->_decodedVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RCWaveformEncodingVersion"));
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[RCWaveformSegment segmentsByReparingDiscontinuitiesInSegments:](RCWaveformSegment, "segmentsByReparingDiscontinuitiesInSegments:", self->_segments);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("RCSegments"));
  objc_msgSend(v5, "encodeInteger:forKey:", +[RCWaveform version](RCWaveform, "version"), CFSTR("RCWaveformEncodingVersion"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  RCWaveform *v3;
  RCMutableWaveform *v4;
  void *v5;
  RCMutableWaveform *v6;

  v3 = self;
  objc_sync_enter(v3);
  v4 = [RCMutableWaveform alloc];
  -[RCWaveform segments](v3, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RCWaveform initWithSegments:](v4, "initWithSegments:", v5);

  objc_sync_exit(v3);
  return v6;
}

+ (id)_mutableSegmentsByClippingToTimeRange:(id)a3 withSegments:(id)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  _QWORD v13[4];
  id v14;
  double v15;
  double v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  objc_msgSend(a1, "_mutableSegmentsIntersectingTimeRange:intersectionRange:withSegments:", 0, v7, var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__RCWaveform__mutableSegmentsByClippingToTimeRange_withSegments___block_invoke;
    v13[3] = &unk_1E769CD30;
    v9 = v8;
    v14 = v9;
    v15 = var0;
    v16 = var1;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3B76918](v13);
    if (objc_msgSend(v9, "count"))
      v10[2](v10, 0);
    if (objc_msgSend(v9, "count"))
      v10[2](v10, objc_msgSend(v9, "count") - 1);
    objc_msgSend(a1, "_mergeBoundarySegmentsInArray:", v9);
    v11 = v9;

  }
  else
  {
    v11 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  }

  return v11;
}

void __65__RCWaveform__mutableSegmentsByClippingToTimeRange_withSegments___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "segmentByClippingToTimeRange:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v5, "replaceObjectAtIndex:withObject:", a2, v4);
  else
    objc_msgSend(v5, "removeObjectAtIndex:", a2);

}

+ (id)_mutableSegmentsIntersectingTimeRange:(id)a3 intersectionRange:(_NSRange *)a4 withSegments:(id)a5
{
  double var1;
  double var0;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v10 = objc_msgSend(a1, "rangeOfSegmentsIntersectingTimeRange:withSegments:", v9, var0, var1);
  v12 = v10;
  v13 = v11;
  if (a4)
  {
    a4->location = v10;
    a4->length = v11;
  }
  if (v11 && objc_msgSend(v9, "count"))
  {
    v14 = objc_msgSend(v9, "count");
    if (v12 >= v14 - 1)
      v12 = v14 - 1;
    v15 = objc_msgSend(v9, "count");
    v16 = objc_msgSend(v9, "count") - v12;
    if (v13 < v16)
      v16 = v13;
    if (v16 <= (v15 != 0))
      v17 = v15 != 0;
    else
      v17 = v16;
    objc_msgSend(v9, "subarrayWithRange:", v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (void)_mergeBoundarySegmentsInArray:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "segmentsByJoiningIfSmallSegment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceObjectsInRange:withObjectsFromArray:", 0, 2, v5);
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      v7 = v4;
      v6 = v3;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v9, "count") - 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v9, "count") - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "segmentsByJoiningIfSmallSegment:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replaceObjectsInRange:withObjectsFromArray:", objc_msgSend(v9, "count") - 2, 2, v8);

    }
  }

}

- (NSArray)segments
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

- (void)saveContentsToURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[RCWaveform saveContentsToURL:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR:  archiving waveform:  %@", (uint8_t *)&v2, 0x16u);
}

@end
