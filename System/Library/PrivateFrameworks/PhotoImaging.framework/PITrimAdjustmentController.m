@implementation PITrimAdjustmentController

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
  +[PITrimAdjustmentController startKey](PITrimAdjustmentController, "startKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PITrimAdjustmentController startScaleKey](PITrimAdjustmentController, "startScaleKey");
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
  +[PITrimAdjustmentController endKey](PITrimAdjustmentController, "endKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PITrimAdjustmentController endScaleKey](PITrimAdjustmentController, "endScaleKey");
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
    +[PITrimAdjustmentController startKey](PITrimAdjustmentController, "startKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PITrimAdjustmentController startScaleKey](PITrimAdjustmentController, "startScaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PITrimAdjustmentController startKey](PITrimAdjustmentController, "startKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[PITrimAdjustmentController startScaleKey](PITrimAdjustmentController, "startScaleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);
  }

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
    +[PITrimAdjustmentController endKey](PITrimAdjustmentController, "endKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PITrimAdjustmentController endScaleKey](PITrimAdjustmentController, "endScaleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PITrimAdjustmentController endKey](PITrimAdjustmentController, "endKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

    -[PIAdjustmentController adjustment](self, "adjustment");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[PITrimAdjustmentController endScaleKey](PITrimAdjustmentController, "endScaleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);
  }

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

@end
