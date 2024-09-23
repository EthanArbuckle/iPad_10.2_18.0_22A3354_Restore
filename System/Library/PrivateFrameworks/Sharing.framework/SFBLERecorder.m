@implementation SFBLERecorder

- (SFBLERecorder)initWithPayloadType:(int64_t)a3
{
  SFBLERecorder *v4;
  SFBLERecorder *v5;
  NSMutableArray *v6;
  NSMutableArray *recordings;
  SFBLERecorder *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFBLERecorder;
  v4 = -[SFBLERecorder init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_payloadType = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recordings = v5->_recordings;
    v5->_recordings = v6;

    v8 = v5;
  }

  return v5;
}

- (SFBLERecorder)initWithRecordingURL:(id)a3
{
  id v4;
  SFBLERecorder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *recordings;
  SFBLERecorder *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFBLERecorder;
  v5 = -[SFBLERecorder init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v4);
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("payloadType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recordings"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v5->_payloadType = objc_msgSend(v8, "integerValue");
          v10 = objc_msgSend(v9, "mutableCopy");
          recordings = v5->_recordings;
          v5->_recordings = (NSMutableArray *)v10;

          v12 = v5;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)recordDevice:(id)a3 data:(id)a4 rssi:(id)a5 info:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *recordings;
  void *v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v16 = 0;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v13)
  {
    v19 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("data"));

  }
  if (v12)
  {
    objc_msgSend(v12, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("device"));

  }
  if (v16)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("infoData"));
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("rssi"));
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("timestamp"));

  recordings = self->_recordings;
  v24 = (void *)objc_msgSend(v18, "copy");
  -[NSMutableArray addObject:](recordings, "addObject:", v24);

  v17 = 1;
LABEL_14:

  return v17;
}

- (BOOL)replayNextRecording
{
  unint64_t replayIndex;
  unint64_t v4;
  NSMutableArray *recordings;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  unint64_t v15;

  replayIndex = self->_replayIndex;
  v4 = -[NSMutableArray count](self->_recordings, "count");
  v15 = replayIndex;
  if (replayIndex < v4)
  {
    recordings = self->_recordings;
    ++self->_replayIndex;
    -[NSMutableArray objectAtIndexedSubscript:](recordings, "objectAtIndexedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("device"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    else
      v8 = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("infoData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_replayDelegate);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rssi"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "recorder:replayDevice:data:rssi:info:", self, v8, v12, v13, v10);

  }
  return v15 < v4;
}

- (BOOL)saveToDirectory:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isFileURL") && -[NSMutableArray count](self->_recordings, "count"))
  {
    v28 = 0;
    v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v28, *MEMORY[0x1E0C999D0], 0);
    v6 = v28;
    v7 = v6;
    if (v5 && objc_msgSend(v6, "BOOLValue"))
    {
      -[NSMutableArray firstObject](self->_recordings, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLocale:", v11);

        objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
        v12 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "stringFromDate:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("SFBLERecording_%@.xml"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "URLByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v29[0] = CFSTR("payloadType");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_payloadType);
          v27 = v16;
          v18 = v13;
          v19 = v9;
          v20 = v4;
          v21 = v7;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v29[1] = CFSTR("recordings");
          v30[0] = v22;
          v23 = (void *)-[NSMutableArray copy](self->_recordings, "copy");
          v30[1] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "writeToURL:atomically:", v17, 1);

          v7 = v21;
          v4 = v20;
          v9 = v19;
          v13 = v18;
          v16 = v27;
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (int64_t)payloadType
{
  return self->_payloadType;
}

- (SFBLERecorderReplayDelegate)replayDelegate
{
  return (SFBLERecorderReplayDelegate *)objc_loadWeakRetained((id *)&self->_replayDelegate);
}

- (void)setReplayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_replayDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_replayDelegate);
  objc_storeStrong((id *)&self->_recordings, 0);
}

@end
