@implementation IPASloMoOperation

- (BOOL)isMigratable
{
  return 1;
}

- (IPASloMoOperation)initWithTimeRange:(id *)a3 rate:(float)a4
{
  __int128 v8;
  IPASloMoOperation *result;
  __int128 v10;
  __int128 v11;
  __CFString *v12;
  objc_super v13;
  CMTimeRange range;

  if (a4 <= 0.0 || a4 > 1.0)
  {
    _PFAssertContinueHandler();
LABEL_11:

    return 0;
  }
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    v8 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    v12 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
    _PFAssertContinueHandler();

    goto LABEL_11;
  }
  v13.receiver = self;
  v13.super_class = (Class)IPASloMoOperation;
  result = -[IPAEditOperation init](&v13, sel_init);
  if (result)
  {
    v11 = *(_OWORD *)&a3->var0.var3;
    v10 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&result->_timeRange.start.epoch = v11;
    *(_OWORD *)&result->_timeRange.duration.timescale = v10;
    result->_rate = a4;
  }
  return result;
}

- (IPASloMoOperation)initWithOperation:(id)a3
{
  char *v4;
  char *v5;
  IPASloMoOperation *v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;

  v4 = (char *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IPASloMoOperation;
  v5 = -[IPAEditOperation initWithOperation:](&v10, sel_initWithOperation_, v4);
  v6 = (IPASloMoOperation *)v5;
  if (v5)
  {
    v8 = *(_OWORD *)(v4 + 24);
    v7 = *(_OWORD *)(v4 + 40);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *(_OWORD *)(v5 + 24) = v8;
    *(_OWORD *)(v5 + 40) = v7;
    *((_DWORD *)v5 + 14) = *((_DWORD *)v4 + 14);
  }

  return v6;
}

- (IPASloMoOperation)initWithSettingsDictionary:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  int v12;
  NSObject *v13;
  id v15;
  objc_super v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IPASloMoOperation;
  v5 = -[IPAEditOperation init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slowMotion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v15 = 0;
      +[IPAAdjustmentStackSerializer dataFromPropertyList:error:](IPAAdjustmentStackSerializer, "dataFromPropertyList:error:", v4, &v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      if (v7)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", CFSTR("com.apple.video.slomo"), CFSTR("1.1"), v7, 0, 0, 0);

        if (v9)
        {
          objc_msgSend(v9, "slowMotionTimeRange");
          v10 = *(_OWORD *)buf;
          v11 = v19;
          *(_OWORD *)(v5 + 24) = v18;
          *(_OWORD *)(v5 + 40) = v11;
          *(_OWORD *)(v5 + 8) = v10;
          objc_msgSend(v9, "slowMotionRate");
          *((_DWORD *)v5 + 14) = v12;
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        IPAAdjustmentGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v4;
          _os_log_impl(&dword_1D4CAA000, v13, OS_LOG_TYPE_DEFAULT, "unable to serialize %@ to data", buf, 0xCu);
        }

      }
    }
    v9 = v5;
    v5 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return (IPASloMoOperation *)v5;
}

- (id)settingsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[IPASloMoOperation internalRepresentation](self, "internalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyListDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adjustmentData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v10 = 0;
      +[IPAAdjustmentStackSerializer propertyListFromData:error:](IPAAdjustmentStackSerializer, "propertyListFromData:error:", v5, &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (!v6)
      {
        IPAAdjustmentGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v7;
          _os_log_impl(&dword_1D4CAA000, v8, OS_LOG_TYPE_DEFAULT, "got back nil settings plist from PFVideoAdustments, error:%@", buf, 0xCu);
        }

      }
    }
    else
    {
      _PFAssertContinueHandler();
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToOperation:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;
  BOOL v11;
  CMTimeEpoch v12;
  BOOL v13;
  BOOL v14;
  __int128 v16;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v19[2];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IPASloMoOperation timeRange](self, "timeRange");
    -[IPASloMoOperation rate](self, "rate");
    v7 = v6;
    memset(v19, 0, sizeof(v19));
    if (v5)
      objc_msgSend(v5, "timeRange");
    objc_msgSend(v5, "rate");
    v9 = v8;
    range = v19[1];
    otherRange = v19[0];
    if (CMTimeRangeContainsTimeRange(&range, &otherRange))
    {
      range = v19[0];
      otherRange = v19[1];
      v10 = CMTimeRangeContainsTimeRange(&range, &otherRange) != 0;
    }
    else
    {
      v10 = 0;
    }
    range.start = v19[1].duration;
    v16 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&otherRange.start.value = *MEMORY[0x1E0CA2E68];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    otherRange.start.epoch = v12;
    if (CMTimeCompare(&range.start, &otherRange.start))
    {
      v13 = 0;
    }
    else
    {
      range.start = v19[0].duration;
      *(_OWORD *)&otherRange.start.value = v16;
      otherRange.start.epoch = v12;
      v13 = CMTimeCompare(&range.start, &otherRange.start) == 0;
    }
    v14 = v10 || v13;
    v11 = v7 == v9 && v14;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;

  result = -[IPAEditOperation init](+[IPASloMoOperation allocWithZone:](IPASloMoOperation, "allocWithZone:", a3), "init");
  v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v5 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)((char *)result + 24) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  *((_DWORD *)result + 14) = LODWORD(self->_rate);
  return result;
}

- (float)rate
{
  return self->_rate;
}

- ($222789CE95D16A76D31543149FD45E96)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (id)identifier
{
  __CFString *v2;

  v2 = CFSTR("SloMo");
  return CFSTR("SloMo");
}

- (id)debugDescription
{
  float v3;
  float v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  CMTimeRange range;

  -[IPASloMoOperation timeRange](self, "timeRange");
  -[IPASloMoOperation rate](self, "rate");
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  memset(&range, 0, sizeof(range));
  v7 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &range);
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p timeRange=%@ rate=%f>"), v6, self, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)operationFromFileURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  IPASloMoOperation *v6;
  IPASloMoOperation *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0D75308];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:", v4);

  if (v5)
  {
    v6 = [IPASloMoOperation alloc];
    objc_msgSend(v5, "slowMotionTimeRange");
    objc_msgSend(v5, "slowMotionRate");
    v7 = -[IPASloMoOperation initWithTimeRange:rate:](v6, "initWithTimeRange:rate:", &v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)internalRepresentation
{
  id v3;
  double v4;
  __int128 v5;
  _OWORD v7[3];

  v3 = objc_alloc(MEMORY[0x1E0D75308]);
  *(float *)&v4 = self->_rate;
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  return (id)objc_msgSend(v3, "initWithSlowMotionTimeRange:rate:", v7, v4);
}

@end
