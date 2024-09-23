@implementation PICinematicAudioAdjustmentController(Analytics)

- (uint64_t)analyticsKeysBlocklist
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (id)analyticsPayload
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a1, "adjustment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (v3 = (void *)v2, v4 = objc_msgSend(a1, "enabled"), v3, v4))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(a1, "renderingStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE71D88]);

    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("Original");
    }
    else
    {
      objc_msgSend(a1, "renderingStyle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE71D98]);

      if ((v10 & 1) != 0)
      {
        v8 = CFSTR("Voice");
      }
      else
      {
        objc_msgSend(a1, "renderingStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE71D90]);

        if ((v12 & 1) != 0)
        {
          v8 = CFSTR("Studio Voice");
        }
        else
        {
          objc_msgSend(a1, "renderingStyle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE71D80]);

          if (v14)
            v8 = CFSTR("Camera Voice");
          else
            v8 = CFSTR("Unknown");
        }
      }
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("audio_mix"));
    +[PEAnalyticsUtility adjustmentValueBucketizerFormatter](PEAnalyticsUtility, "adjustmentValueBucketizerFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "dialogMixBias");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromNumber:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("audio_mix_intensity"));

  }
  else
  {
    v5 = (id)MEMORY[0x24BDBD1B8];
  }
  return v5;
}

@end
