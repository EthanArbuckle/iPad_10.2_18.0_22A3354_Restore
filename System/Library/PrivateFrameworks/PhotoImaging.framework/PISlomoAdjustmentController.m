@implementation PISlomoAdjustmentController

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
  +[PISlomoAdjustmentController startKey](PISlomoAdjustmentController, "startKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISlomoAdjustmentController startScaleKey](PISlomoAdjustmentController, "startScaleKey");
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
    +[PISlomoAdjustmentController startKey](PISlomoAdjustmentController, "startKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISlomoAdjustmentController startScaleKey](PISlomoAdjustmentController, "startScaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISlomoAdjustmentController startKey](PISlomoAdjustmentController, "startKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[PISlomoAdjustmentController startScaleKey](PISlomoAdjustmentController, "startScaleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
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
  +[PISlomoAdjustmentController endKey](PISlomoAdjustmentController, "endKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISlomoAdjustmentController endScaleKey](PISlomoAdjustmentController, "endScaleKey");
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

- (void)setEndTime:(id *)a3
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
    +[PISlomoAdjustmentController endKey](PISlomoAdjustmentController, "endKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISlomoAdjustmentController endScaleKey](PISlomoAdjustmentController, "endScaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISlomoAdjustmentController endKey](PISlomoAdjustmentController, "endKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[PISlomoAdjustmentController endScaleKey](PISlomoAdjustmentController, "endScaleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);
  }

}

- (double)rate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISlomoAdjustmentController rateKey](PISlomoAdjustmentController, "rateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.25;
  }

  return v6;
}

- (void)setRate:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISlomoAdjustmentController rateKey](PISlomoAdjustmentController, "rateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  PISlomoAdjustmentController *v8;
  BOOL v9;
  CMTime duration;
  CMTime rhs;
  CMTime lhs;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTimeRange v17;
  CMTime end;
  CMTime start;
  CMTimeRange v20;

  v5 = a3;
  +[PISlomoAdjustmentController rateKey](PISlomoAdjustmentController, "rateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PIAdjustmentController isSettingEqual:forKey:](self, "isSettingEqual:forKey:", v5, v6);

  if (v7)
  {
    v8 = -[PIAdjustmentController initWithAdjustment:]([PISlomoAdjustmentController alloc], "initWithAdjustment:", v5);
    memset(&v20, 0, sizeof(v20));
    -[PISlomoAdjustmentController startTime](self, "startTime");
    -[PISlomoAdjustmentController endTime](self, "endTime");
    CMTimeRangeFromTimeToTime(&v20, &start, &end);
    memset(&v17, 0, sizeof(v17));
    if (v8)
    {
      -[PISlomoAdjustmentController startTime](v8, "startTime");
      -[PISlomoAdjustmentController endTime](v8, "endTime");
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
      memset(&v15, 0, sizeof(v15));
    }
    CMTimeRangeFromTimeToTime(&v17, &v16, &v15);
    memset(&v14, 0, sizeof(v14));
    lhs = v20.start;
    rhs = v17.start;
    CMTimeSubtract(&v14, &lhs, &rhs);
    lhs = v14;
    if (fabs(CMTimeGetSeconds(&lhs)) >= 0.002)
    {
      v9 = 0;
    }
    else
    {
      memset(&lhs, 0, sizeof(lhs));
      rhs = v20.duration;
      duration = v17.duration;
      CMTimeSubtract(&lhs, &rhs, &duration);
      rhs = lhs;
      v9 = fabs(CMTimeGetSeconds(&rhs)) < 0.002;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)startKey
{
  return CFSTR("start");
}

+ (id)startScaleKey
{
  return CFSTR("startScale");
}

+ (id)endKey
{
  return CFSTR("end");
}

+ (id)endScaleKey
{
  return CFSTR("endScale");
}

+ (id)rateKey
{
  return CFSTR("rate");
}

@end
