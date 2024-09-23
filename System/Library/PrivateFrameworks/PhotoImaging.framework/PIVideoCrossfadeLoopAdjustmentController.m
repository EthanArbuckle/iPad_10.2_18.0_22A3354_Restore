@implementation PIVideoCrossfadeLoopAdjustmentController

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v13;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController crossfadeDurationValueKey](PIVideoCrossfadeLoopAdjustmentController, "crossfadeDurationValueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController crossfadeDurationTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "crossfadeDurationTimescaleKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v11 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, objc_msgSend(v13, "longLongValue"), objc_msgSend(v9, "intValue"));
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v13;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController startTimeValueKey](PIVideoCrossfadeLoopAdjustmentController, "startTimeValueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController startTimeTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "startTimeTimescaleKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v11 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, objc_msgSend(v13, "longLongValue"), objc_msgSend(v9, "intValue"));
  }

  return result;
}

- ($105C7F46451D331BD7843CF46B2B4F94)loopTimeRange
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  $105C7F46451D331BD7843CF46B2B4F94 *result;
  CMTime v20;
  CMTime start;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeStartValueKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeStartValueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeStartTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeStartTimescaleKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeDurationValueKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeDurationValueKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeDurationTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeDurationTimescaleKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10 && v13 && v16)
  {
    CMTimeMake(&start, objc_msgSend(v7, "longLongValue"), objc_msgSend(v10, "intValue"));
    CMTimeMake(&v20, objc_msgSend(v13, "longLongValue"), objc_msgSend(v16, "intValue"));
    CMTimeRangeMake((CMTimeRange *)retstr, &start, &v20);
  }
  else
  {
    v17 = MEMORY[0x1E0CA2E40];
    v18 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v18;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v17 + 32);
  }

  return result;
}

- (void)setLoopTimeRange:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeStartValueKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeStartValueKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeStartTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeStartTimescaleKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeDurationValueKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeDurationValueKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeDurationTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeDurationTimescaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->var0.var0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeStartValueKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeStartValueKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var0.var1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeStartTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeStartTimescaleKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->var1.var0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeDurationValueKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeDurationValueKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1.var1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController loopTimeRangeDurationTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "loopTimeRangeDurationTimescaleKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v21);

  }
}

- (void)setCrossfadeDuration:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((a3->var2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->var0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController crossfadeDurationValueKey](PIVideoCrossfadeLoopAdjustmentController, "crossfadeDurationValueKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController crossfadeDurationTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "crossfadeDurationTimescaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController crossfadeDurationValueKey](PIVideoCrossfadeLoopAdjustmentController, "crossfadeDurationValueKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController crossfadeDurationTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "crossfadeDurationTimescaleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);
  }

}

- (void)setStartTime:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((a3->var2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->var0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController startTimeValueKey](PIVideoCrossfadeLoopAdjustmentController, "startTimeValueKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController startTimeTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "startTimeTimescaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController startTimeValueKey](PIVideoCrossfadeLoopAdjustmentController, "startTimeValueKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[PIVideoCrossfadeLoopAdjustmentController startTimeTimescaleKey](PIVideoCrossfadeLoopAdjustmentController, "startTimeTimescaleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);
  }

}

+ (NSString)crossfadeDurationValueKey
{
  return (NSString *)CFSTR("crossfadeDurationValue");
}

+ (NSString)crossfadeDurationTimescaleKey
{
  return (NSString *)CFSTR("crossfadeDurationTimescale");
}

+ (NSString)startTimeValueKey
{
  return (NSString *)CFSTR("startTimeValue");
}

+ (NSString)startTimeTimescaleKey
{
  return (NSString *)CFSTR("startTimeTimescale");
}

+ (NSString)loopTimeRangeStartValueKey
{
  return (NSString *)CFSTR("timeRangeStartValue");
}

+ (NSString)loopTimeRangeStartTimescaleKey
{
  return (NSString *)CFSTR("timeRangeStartTimescale");
}

+ (NSString)loopTimeRangeDurationValueKey
{
  return (NSString *)CFSTR("timeRangeDurationValue");
}

+ (NSString)loopTimeRangeDurationTimescaleKey
{
  return (NSString *)CFSTR("timeRangeDurationTimescale");
}

@end
