@implementation PFVideoAdjustments

- (PFVideoAdjustments)initWithPropertyListDictionary:(id)a3
{
  id v4;
  __int128 v5;
  double v6;
  PFVideoAdjustments *v7;
  PFVideoAdjustments *v8;
  PFVideoAdjustments *v9;
  objc_super v11;
  _OWORD v12[3];
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v14 = *MEMORY[0x1E0CA2E40];
  v15 = v5;
  v16 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v13 = 1065353216;
  if (-[PFVideoAdjustments _parseLegacySLMDictionary:forSlowMotionTimeRange:rate:](self, "_parseLegacySLMDictionary:forSlowMotionTimeRange:rate:", v4, &v14, &v13))
  {
    LODWORD(v6) = v13;
    v12[0] = v14;
    v12[1] = v15;
    v12[2] = v16;
    v7 = -[PFVideoAdjustments initWithSlowMotionTimeRange:rate:](self, "initWithSlowMotionTimeRange:rate:", v12, v6);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PFVideoAdjustments;
    v8 = -[PFAssetAdjustments initWithPropertyListDictionary:](&v11, sel_initWithPropertyListDictionary_, v4);
    v7 = v8;
    if (v8)
      -[PFVideoAdjustments _updateDerivedPropertiesFromVersionedData](v8, "_updateDerivedPropertiesFromVersionedData");
  }
  v9 = v7;

  return v9;
}

- (id)description
{
  double Seconds;
  double v4;
  void *v5;
  float v6;
  void *v7;
  objc_super v9;
  objc_super v10;
  CMTime v11;
  CMTime v12;
  CMTime v13;
  CMTime time;

  if (-[PFVideoAdjustments isRecognizedFormat](self, "isRecognizedFormat"))
  {
    -[PFVideoAdjustments slowMotionTimeRange](self, "slowMotionTimeRange");
    time = v13;
    Seconds = CMTimeGetSeconds(&time);
    -[PFVideoAdjustments slowMotionTimeRange](self, "slowMotionTimeRange");
    v12 = v11;
    v4 = Seconds + CMTimeGetSeconds(&v12);
    v10.receiver = self;
    v10.super_class = (Class)PFVideoAdjustments;
    -[PFAssetAdjustments description](&v10, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFVideoAdjustments slowMotionRate](self, "slowMotionRate");
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" slowMotion (%.2fx from %.2fs to %.2fs)"), v6, *(_QWORD *)&Seconds, *(_QWORD *)&v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PFVideoAdjustments;
    -[PFAssetAdjustments description](&v9, sel_description);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)isRecognizedFormat
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PFAssetAdjustments adjustmentFormatIdentifier](self, "adjustmentFormatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssetAdjustments adjustmentFormatVersion](self, "adjustmentFormatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isRecognizedSlowMotionFormatWithIdentifier:version:", v4, v5);

  return (char)v3;
}

- (void)_updateDerivedPropertiesFromVersionedData
{
  double v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v6 = *MEMORY[0x1E0CA2E40];
  v9 = *MEMORY[0x1E0CA2E40];
  v10 = v5;
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v11 = v4;
  v8 = 1065353216;
  if (!-[PFVideoAdjustments _parseVersionedDataForSlowMotionTimeRange:rate:](self, "_parseVersionedDataForSlowMotionTimeRange:rate:", &v9, &v8))
  {
    v9 = v6;
    v10 = v5;
    v11 = v4;
    v8 = 1065353216;
  }
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  -[PFVideoAdjustments setSlowMotionTimeRange:](self, "setSlowMotionTimeRange:", v7);
  LODWORD(v3) = v8;
  -[PFVideoAdjustments setSlowMotionRate:](self, "setSlowMotionRate:", v3);
}

- (BOOL)_parseLegacySLMDictionary:(id)a3 forSlowMotionTimeRange:(id *)a4 rate:(float *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v15;
  const __CFDictionary *v16;
  CMTimeFlags v18;
  CMTimeScale v19;
  CMTimeValue v20;
  CMTimeEpoch v21;
  CMTimeRange v22;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = MEMORY[0x1E0CA2E40];
  value = *MEMORY[0x1E0CA2E40];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && objc_msgSend(v9, "intValue") <= 1)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("regions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
    {
      v12 = *(_DWORD *)(v8 + 12);
      v20 = *(_QWORD *)(v8 + 24);
      v21 = *(_QWORD *)(v8 + 16);
      flags = *(_DWORD *)(v8 + 36);
      v19 = *(_DWORD *)(v8 + 32);
      epoch = *(_QWORD *)(v8 + 40);
      objc_msgSend(v11, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v12;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("timeRange"));
        v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v10 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0 && v16)
        {
          CMTimeRangeMakeFromDictionary(&v22, v16);
          value = v22.start.value;
          timescale = v22.start.timescale;
          flags = v22.duration.flags;
          v18 = v22.start.flags;
          v19 = v22.duration.timescale;
          epoch = v22.duration.epoch;
          v20 = v22.duration.value;
          v21 = v22.start.epoch;
          if ((v22.start.flags & 1) != 0)
          {
            if (v22.duration.value >= 0)
              v10 = v22.duration.flags & (v22.duration.epoch == 0);
            else
              v10 = 0;
          }
          else
          {
            v10 = 0;
          }
        }

        v12 = v18;
      }
      else
      {
        v10 = 0;
      }
      a4->var0.var0 = value;
      a4->var0.var1 = timescale;
      a4->var0.var2 = v12;
      a4->var0.var3 = v21;
      a4->var1.var0 = v20;
      a4->var1.var1 = v19;
      a4->var1.var2 = flags;
      a4->var1.var3 = epoch;
      *a5 = 0.25;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_parseVersionedDataForSlowMotionTimeRange:(id *)a3 rate:(float *)a4
{
  __int128 v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  float v16;
  void *v17;
  __int128 v18;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v21 = *MEMORY[0x1E0CA2E40];
  v22 = v7;
  v23 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v20 = 1065353216;
  -[PFAssetAdjustments adjustmentFormatVersion](self, "adjustmentFormatVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("1.1"));

  -[PFAssetAdjustments adjustmentFormatVersion](self, "adjustmentFormatVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("1.0"));

  -[PFAssetAdjustments adjustmentFormatIdentifier](self, "adjustmentFormatIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.video.slomo")))
  {

    goto LABEL_7;
  }

  if ((v9 | v11) != 1)
  {
LABEL_7:
    v15 = 0;
    v16 = 1.0;
    goto LABEL_16;
  }
  -[PFAssetAdjustments adjustmentData](self, "adjustmentData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_11;
  if (!v9)
  {
    if (v11)
    {
      -[PFVideoAdjustments _adjustmentsObjectFromNSKeyedArchiverData:](self, "_adjustmentsObjectFromNSKeyedArchiverData:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v17 = (void *)v14;
LABEL_12:
  objc_opt_class();
  v15 = (objc_opt_isKindOfClass() & 1) != 0
     && -[PFVideoAdjustments _parseAppleVideoDataBlobDictionary:forSlowMotionTimeRange:rate:](self, "_parseAppleVideoDataBlobDictionary:forSlowMotionTimeRange:rate:", v17, &v21, &v20);

  v16 = *(float *)&v20;
LABEL_16:
  v18 = v22;
  *(_OWORD *)&a3->var0.var0 = v21;
  *(_OWORD *)&a3->var0.var3 = v18;
  *(_OWORD *)&a3->var1.var1 = v23;
  *a4 = v16;
  return v15;
}

- (BOOL)_parseAppleVideoDataBlobDictionary:(id)a3 forSlowMotionTimeRange:(id *)a4 rate:(float *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  unsigned int v13;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v16;
  const __CFDictionary *v17;
  BOOL v18;
  CMTimeFlags v20;
  CMTimeScale v21;
  CMTimeValue v22;
  CMTimeEpoch v23;
  CMTimeRange v24;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0CA2E40];
  value = *MEMORY[0x1E0CA2E40];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("slowMotion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      v11 = v10;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "count"))
      {
        v13 = *(_DWORD *)(v7 + 12);
        v22 = *(_QWORD *)(v7 + 24);
        v23 = *(_QWORD *)(v7 + 16);
        flags = *(_DWORD *)(v7 + 36);
        v21 = *(_DWORD *)(v7 + 32);
        epoch = *(_QWORD *)(v7 + 40);
        objc_msgSend(v12, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v13;
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timeRange"));
          v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v18 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0 && v17)
          {
            CMTimeRangeMakeFromDictionary(&v24, v17);
            value = v24.start.value;
            timescale = v24.start.timescale;
            flags = v24.duration.flags;
            v20 = v24.start.flags;
            v21 = v24.duration.timescale;
            epoch = v24.duration.epoch;
            v22 = v24.duration.value;
            v23 = v24.start.epoch;
            if ((v24.start.flags & 1) != 0)
            {
              if (v24.duration.value >= 0)
                v18 = v24.duration.flags & (v24.duration.epoch == 0);
              else
                v18 = 0;
            }
            else
            {
              v18 = 0;
            }
          }

          v13 = v20;
        }
        else
        {
          v18 = 0;
        }
        a4->var0.var0 = value;
        a4->var0.var1 = timescale;
        a4->var0.var2 = v13;
        a4->var0.var3 = v23;
        a4->var1.var0 = v22;
        a4->var1.var1 = v21;
        a4->var1.var2 = flags;
        a4->var1.var3 = epoch;
        *(_DWORD *)a5 = v11;

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_dictionaryFromSlowMotionTimeRange:(id *)a3 rate:(float)a4
{
  const __CFAllocator *v5;
  __int128 v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  CMTimeRange v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v16.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v16.start.epoch = v6;
  *(_OWORD *)&v16.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = CMTimeRangeCopyAsDictionary(&v16, v5);
  v8 = v7;
  if (v7)
  {
    v22 = CFSTR("timeRange");
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("rate");
    v19[1] = CFSTR("regions");
    v20[0] = v12;
    v20[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("slowMotion");
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_adjustmentsObjectFromNSKeyedArchiverData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A1B0CDDC]();
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v11);
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0CB2CD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't unarchive data: error %@", buf, 0xCu);
    }
    v9 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (float)slowMotionRate
{
  return self->_slowMotionRate;
}

- (void)setSlowMotionRate:(float)a3
{
  self->_slowMotionRate = a3;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)&self->var1.var3 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)((char *)&self->var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var2;
  return self;
}

- (void)setSlowMotionTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(&self->_slowMotionRate + 1) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_slowMotionTimeRange.start.flags = v4;
  *(_OWORD *)((char *)&self->_slowMotionTimeRange.duration.value + 4) = v3;
}

+ (id)defaultVideoAdjustmentsURLForVideoURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("SLM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v3, "URLByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("plist"));
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }

  return v5;
}

- (PFVideoAdjustments)initWithSlowMotionTimeRange:(id *)a3 rate:(float)a4
{
  PFVideoAdjustments *v6;
  __int128 v7;
  int v8;
  __int128 v9;
  void *v10;
  void *v11;
  PFVideoAdjustments *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v6 = self;
  v7 = *(_OWORD *)&a3->var0.var3;
  v14 = *(_OWORD *)&a3->var0.var0;
  v15 = v7;
  v16 = *(_OWORD *)&a3->var1.var1;
  v8 = DWORD1(v16);
  if (-[PFVideoAdjustments _isValidSlowMotionTimeRange:rate:](self, "_isValidSlowMotionTimeRange:rate:", &v14, *(double *)&a4))
  {
    v9 = *(_OWORD *)&a3->var0.var3;
    v14 = *(_OWORD *)&a3->var0.var0;
    v15 = v9;
    v16 = *(_OWORD *)&a3->var1.var1;
    -[PFVideoAdjustments _dictionaryFromSlowMotionTimeRange:rate:](v6, "_dictionaryFromSlowMotionTimeRange:rate:", &v14, COERCE_DOUBLE(__PAIR64__(DWORD1(v16), LODWORD(a4))));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PFAssetAdjustments initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:](v6, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", CFSTR("com.apple.video.slomo"), CFSTR("1.1"), v11, 0, 0, 0);

    v12 = v6;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isValidSlowMotionTimeRange:(id *)a3 rate:(float)a4
{
  BOOL v4;

  v4 = (a3->var0.var2 & 1) != 0 && (a3->var1.var2 & 1) != 0 && !a3->var1.var3 && a3->var1.var0 >= 0;
  if (a4 > 1.0)
    v4 = 0;
  return a4 > 0.0 && v4;
}

- (BOOL)hasSlowMotionAdjustments
{
  uint64_t v4;

  -[PFVideoAdjustments slowMotionTimeRange](self, "slowMotionTimeRange");
  -[PFVideoAdjustments slowMotionRate](self, "slowMotionRate");
  return -[PFVideoAdjustments _isValidSlowMotionTimeRange:rate:](self, "_isValidSlowMotionTimeRange:rate:", &v4);
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampIn
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampOut
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToScaledTimeFromOriginalTime:(SEL)a3 forExport:(id *)a4
{
  *retstr = *a4;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToOriginalTimeFromScaledTime:(SEL)a3 forExport:(id *)a4
{
  *retstr = *a4;
  return self;
}

+ (id)defaultSlowMotionAdjustmentsForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  PFVideoAdjustments *v9;
  PFVideoAdjustments *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v3 = a3;
  v4 = v3;
  v18 = 0uLL;
  v19 = 0;
  if (v3)
    objc_msgSend(v3, "duration");
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v12 = v18;
  *(_QWORD *)&v13 = v19;
  +[PFVideoAdjustments defaultSlowMotionTimeRangeForDuration:](PFVideoAdjustments, "defaultSlowMotionTimeRangeForDuration:", &v12);
  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nominalFrameRate");
  +[PFVideoAdjustments defaultSlowMotionRateForNominalFrameRate:](PFVideoAdjustments, "defaultSlowMotionRateForNominalFrameRate:");
  v8 = v7;
  v9 = [PFVideoAdjustments alloc];
  v12 = v15;
  v13 = v16;
  v14 = v17;
  v10 = -[PFVideoAdjustments initWithSlowMotionTimeRange:rate:](v9, "initWithSlowMotionTimeRange:rate:", &v12, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), v8)));

  return v10;
}

+ ($9E16F6706E08E1DCF37CEDFAE5F41851)defaultSlowMotionTimeRangeForDuration:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  __int128 v8;
  CMTime v9;
  CMTime end;
  CMTimeRange time;
  CMTime v12;

  v5 = MEMORY[0x1E0CA2E50];
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  if ((a4->var2 & 0x1D) == 1 && a4->var0 >= 1 && a4->var1 >= 1)
  {
    memset(&v12, 0, sizeof(v12));
    time.start = (CMTime)*a4;
    CMTimeMultiplyByFloat64(&v12, &time.start, 0.15);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    v9 = v12;
    CMTimeSubtract(&end, &time.start, &v9);
    v9 = v12;
    result = ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeFromTimeToTime(&time, &v9, &end);
    v8 = *(_OWORD *)&time.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time.start.value;
    *(_OWORD *)&retstr->var0.var3 = v8;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time.duration.timescale;
  }
  return result;
}

+ (float)defaultSlowMotionRateForNominalFrameRate:(float)a3
{
  float v3;
  float v4;

  v3 = 0.125;
  if (a3 < 210.0)
  {
    v3 = 0.25;
    v4 = 1.0;
    if (a3 >= 85.0)
      v4 = 0.25;
    if (a3 < 105.0)
      return v4;
  }
  return v3;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDurationForNominalFrameRate:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v8;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 30);
  if (a4 >= 85.0 && a4 < 105.0)
  {
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v8, 1, 25);
    *(CMTime *)retstr = v8;
  }
  return result;
}

+ (BOOL)isRecognizedSlowMotionFormatWithIdentifier:(id)a3 version:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.video.slomo")))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1.0")) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("1.1"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
