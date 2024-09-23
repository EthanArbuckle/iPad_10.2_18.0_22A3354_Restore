@implementation PXAudioPlayer

- (id)lcdStringForSize:(CGSize)a3
{
  void *v4;
  int64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  long double Seconds;
  void *v12;
  uint64_t v13;
  void *v14;
  void (**v15)(void *, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD aBlock[5];
  CMTime v35;
  CMTime v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  -[PXAudioPlayer currentAsset](self, "currentAsset", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXAudioPlayer state](self, "state");
  if (v5 == 1)
  {
    v9 = CFSTR("Idle…");
  }
  else
  {
    v6 = v5;
    if (v5 == 5)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[PXAudioPlayer error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (__CFString *)objc_msgSend(v7, "initWithFormat:", CFSTR("Error: %@"), v8);

    }
    else
    {
      v37 = 0;
      v38 = 0;
      v39 = 0;
      -[PXAudioPlayer currentAssetDuration](self, "currentAssetDuration");
      v10 = 0x1E0CB3000uLL;
      memset(&v36, 0, sizeof(v36));
      -[PXAudioPlayer currentTime](self, "currentTime");
      v35 = v36;
      Seconds = CMTimeGetSeconds(&v35);
      v12 = (void *)MEMORY[0x1E0CB3940];
      LODWORD(v10) = vcvtmd_s64_f64(Seconds / 60.0);
      LODWORD(v13) = vcvtmd_s64_f64(fmod(Seconds, 60.0));
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%d:%02d/%@"), v10, v13, CFSTR("?"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__PXAudioPlayer_PXAscii__lcdStringForSize___block_invoke;
      aBlock[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
      aBlock[4] = 43;
      v15 = (void (**)(void *, void *))_Block_copy(aBlock);
      v9 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
      PXAudioPlayerStateDescription(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("Status: %@\n"), v17);

      objc_msgSend(v4, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR(" Track: %@\n"), v19);

      objc_msgSend(v4, "artistName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("Artist: %@\n"), v21);

      objc_msgSend(v4, "albumTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR(" Album: %@\n"), v23);

      v24 = objc_msgSend(v4, "catalog");
      if (v24 > 4)
        v25 = CFSTR("Mock");
      else
        v25 = off_1E5133A28[v24];
      v26 = v25;
      v15[2](v15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("  Type: %@\n"), v27);

      objc_msgSend(v4, "assetTagsDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("  Tags: %@\n"), v29);

      objc_msgSend(v4, "pace");
      PFStoryRecipeSongPaceDescription();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("  Pace: %@\n"), v31);

      v15[2](v15, v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("  Time: %@\n"), v32);

    }
  }

  return v9;
}

__CFString *__43__PXAudioPlayer_PXAscii__lcdStringForSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if ((unint64_t)objc_msgSend(v3, "length") <= *(_QWORD *)(a1 + 32))
    {
      v8 = v4;
    }
    else
    {
      v5 = objc_msgSend(v4, "length");
      if (v5 - 2 >= (unint64_t)(*(_QWORD *)(a1 + 32) - 2))
        v6 = *(_QWORD *)(a1 + 32) - 2;
      else
        v6 = v5 - 2;
      objc_msgSend(v4, "substringToIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("…"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = CFSTR("--");
  }

  return v8;
}

- (PXAudioPlayer)initWithName:(id)a3
{
  id v4;
  PXAudioPlayer *v5;
  PXAudioPlayer *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *name;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *sessionsQueue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXAudioPlayer;
  v5 = -[PXAudioPlayer init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v5->_currentAssetDuration.value = *MEMORY[0x1E0CA2E18];
    v5->_currentAssetDuration.epoch = *(_QWORD *)(v7 + 16);
    v8 = objc_msgSend(v4, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v8;

    v6->_state = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.PhotosUICore.PXAudioPlayer.sessions", v10);
    sessionsQueue = v6->_sessionsQueue;
    v6->_sessionsQueue = (OS_dispatch_queue *)v11;

    v6->_volume = 1.0;
  }

  return v6;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  Float64 Seconds;
  Float64 v9;
  void *v10;
  void *v11;
  CMTime v13;
  CMTime time;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAudioPlayer name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioPlayerStateDescription(-[PXAudioPlayer state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAudioPlayer currentTime](self, "currentTime");
  Seconds = CMTimeGetSeconds(&time);
  -[PXAudioPlayer currentAssetDuration](self, "currentAssetDuration");
  v9 = CMTimeGetSeconds(&v13);
  -[PXAudioPlayer currentAsset](self, "currentAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; name: %@; state: %@; currentTime: %.1f/%.1fs; currentAsset: %@>"),
                  v5,
                  self,
                  v6,
                  v7,
                  *(_QWORD *)&Seconds,
                  *(_QWORD *)&v9,
                  v10);

  return (NSString *)v11;
}

- (PXAudioPlayer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioPlayer.m"), 101, CFSTR("%s is not available as initializer"), "-[PXAudioPlayer init]");

  abort();
}

- (void)setVolume:(float)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  float v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_volume != a3)
  {
    self->_volume = a3;
    -[PXAudioPlayer signalChange:](self, "signalChange:", 8);
    -[PXAudioPlayer log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_DWORD *)buf = 134217984;
        v20 = -[PXAudioPlayer logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXAudioPlayerChangedVolume", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXAudioPlayer logContext](self, "logContext");
        *(_DWORD *)buf = 134218240;
        v20 = v11;
        v21 = 2048;
        v22 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXAudioPlayerChangedVolume", "Context=%{signpost.telemetry:string2}lu %.2f", buf, 0x16u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXAudioPlayer logContext](self, "logContext");
        *(_DWORD *)buf = 134218240;
        v20 = v15;
        v21 = 2048;
        v22 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXAudioPlayerChangedVolume", "Context=%{signpost.telemetry:string2}lu %.2f", buf, 0x16u);
      }
    }

    -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __27__PXAudioPlayer_setVolume___block_invoke;
    v17[3] = &unk_1E5144680;
    v17[4] = self;
    v18 = a3;
    dispatch_async(v16, v17);

  }
}

- (void)setTargetLoudnessInLKFS:(float)a3
{
  NSObject *v5;
  _QWORD v6[5];
  float v7;

  if (self->_targetLoudnessInLKFS != a3)
  {
    self->_targetLoudnessInLKFS = a3;
    -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke;
    v6[3] = &unk_1E5144680;
    v6[4] = self;
    v7 = a3;
    dispatch_async(v5, v6);

  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  uint64_t v19;
  int v20;
  PXAudioPlayer *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    PLAudioPlaybackGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_desiredPlayState == 1)
        v6 = CFSTR("Playing");
      else
        v6 = CFSTR("Paused");
      v20 = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = (int64_t)v6;
      v7 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "%@ desired play state is now %@", (uint8_t *)&v20, 0x16u);

    }
    -[PXAudioPlayer signalChange:](self, "signalChange:", 16);
    -[PXAudioPlayer log](self, "log");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXAudioPlayer logContext](self, "logContext");
        v20 = 134217984;
        v21 = (PXAudioPlayer *)v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PXAudioPlayerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXAudioPlayer logContext](self, "logContext");
        v20 = 134218240;
        v21 = (PXAudioPlayer *)v15;
        v22 = 2048;
        v23 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_EVENT, v14, "PXAudioPlayerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v20, 0x16u);
      }
    }

    v16 = v12;
    v17 = os_signpost_id_make_with_pointer(v16, self);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v18 = v17;
      if (os_signpost_enabled(v16))
      {
        v19 = -[PXAudioPlayer logContext](self, "logContext");
        v20 = 134218240;
        v21 = (PXAudioPlayer *)v19;
        v22 = 2048;
        v23 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXAudioPlayerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v20, 0x16u);
      }
    }

    -[PXAudioPlayer _invalidateCurrentSessionState](self, "_invalidateCurrentSessionState");
  }
}

- (void)playFromStartTime:(id *)a3
{
  NSObject *v5;
  __int128 v6;
  NSObject *v7;
  _QWORD v8[5];
  __int128 v9;
  int64_t var3;
  uint8_t buf[4];
  PXAudioPlayer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((a3->var2 & 1) == 0)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_fault_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "%@ received an invalid play start time.", buf, 0xCu);
    }

    v6 = *MEMORY[0x1E0CA2E68];
    a3->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a3->var0 = v6;
  }
  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PXAudioPlayer_playFromStartTime___block_invoke;
  v8[3] = &unk_1E51446C8;
  v8[4] = self;
  v9 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  dispatch_async(v7, v8);

  -[PXAudioPlayer setDesiredPlayState:](self, "setDesiredPlayState:", 1);
}

- (void)setCurrentAsset:(id)a3
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PXAudioPlayer setCurrentAsset:startTime:](self, "setCurrentAsset:startTime:", a3, &v3);
}

- (void)setCurrentAsset:(id)a3 startTime:(id *)a4
{
  __int128 v4;
  uint64_t v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a4;
  v4 = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PXAudioPlayer setCurrentAsset:startTime:hostTime:](self, "setCurrentAsset:startTime:hostTime:", a3, &v6, &v4);
}

- (void)setCurrentAsset:(id)a3 startTime:(id *)a4 hostTime:(id *)a5
{
  PXAudioAsset *v8;
  __int128 v9;
  NSObject *v10;
  Float64 Seconds;
  PXAudioAsset *v12;
  void *v13;
  PXAudioAsset *v14;
  PXAudioAsset *v15;
  char v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  uint64_t v24;
  NSObject *v25;
  os_signpost_id_t v26;
  os_signpost_id_t v27;
  uint64_t v28;
  PXCurrentTimeRecord *v29;
  double v30;
  PXCurrentTimeRecord *v31;
  NSObject *v32;
  PXAudioAsset *v33;
  _QWORD block[4];
  PXAudioAsset *v35;
  PXAudioPlayer *v36;
  __int128 v37;
  int64_t var3;
  CMTime v39;
  _BYTE buf[24];
  const __CFString *v41;
  PXAudioAsset *v42;
  CMTime time;
  Float64 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = (PXAudioAsset *)a3;
  if ((a4->var2 & 1) == 0)
  {
    v9 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v9;
  }
  PLAudioPlaybackGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    time = (CMTime)*a4;
    Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 138412802;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
    LOWORD(time.flags) = 2112;
    *(_QWORD *)((char *)&time.flags + 2) = v8;
    HIWORD(time.epoch) = 2048;
    v44 = Seconds;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "%@ asked to play asset %@ from start time %f", (uint8_t *)&time, 0x20u);
  }

  memset(&time, 0, sizeof(time));
  if (v8)
    -[PXAudioAsset duration](v8, "duration");
  v12 = self->_currentAsset;
  v13 = v8;
  if (v12 == v8)
    goto LABEL_22;
  v14 = v12;
  v15 = v8;
  v16 = -[PXAudioAsset isEqual:](v15, "isEqual:", v14);

  if ((v16 & 1) == 0)
  {
    if (v8)
    {
      v41 = CFSTR("PXAudioPlayerCurrentAssetDidChangeNotificationCurrentAssetKey");
      v42 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("PXAudioPlayerCurrentAssetDidChangeNotification"), self, v13);

    -[PXAudioPlayer signalChange:](self, "signalChange:", 1);
    -[PXAudioPlayer log](self, "log");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v18, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = -[PXAudioPlayer logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v20, "PXAudioPlayerChangedCurrentAsset", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    v21 = v18;
    v22 = os_signpost_id_make_with_pointer(v21, self);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v23 = v22;
      if (os_signpost_enabled(v21))
      {
        v24 = -[PXAudioPlayer logContext](self, "logContext");
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_EVENT, v23, "PXAudioPlayerChangedCurrentAsset", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
      }
    }

    v25 = v21;
    v26 = os_signpost_id_make_with_pointer(v25, self);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v27 = v26;
      if (os_signpost_enabled(v25))
      {
        v28 = -[PXAudioPlayer logContext](self, "logContext");
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PXAudioPlayerChangedCurrentAsset", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
      }
    }

    v39 = time;
    -[PXAudioPlayer setCurrentAssetDuration:](self, "setCurrentAssetDuration:", &v39);
    v29 = [PXCurrentTimeRecord alloc];
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    HIDWORD(v30) = *(_DWORD *)&buf[4];
    *(_QWORD *)&buf[16] = a4->var3;
    LODWORD(v30) = 0;
    v31 = -[PXCurrentTimeRecord initWithSampleTime:rate:](v29, "initWithSampleTime:rate:", buf, v30);
    -[PXAudioPlayer setMainQueue_currentTimeRecord:](self, "setMainQueue_currentTimeRecord:", v31);

LABEL_22:
  }
  objc_storeStrong((id *)&self->_currentAsset, a3);
  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v32 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PXAudioPlayer_setCurrentAsset_startTime_hostTime___block_invoke;
  block[3] = &unk_1E51446F0;
  v35 = v8;
  v36 = self;
  v37 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v33 = v8;
  dispatch_async(v32, block);

}

- (void)replayFromTime:(id *)a3
{
  NSObject *v5;
  __int128 v6;
  NSObject *v7;
  _QWORD v8[5];
  __int128 v9;
  int64_t var3;
  uint8_t buf[4];
  PXAudioPlayer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((a3->var2 & 1) == 0)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_fault_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "%@ received an invalid replay start time.", buf, 0xCu);
    }

    v6 = *MEMORY[0x1E0CA2E68];
    a3->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a3->var0 = v6;
  }
  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__PXAudioPlayer_replayFromTime___block_invoke;
  v8[3] = &unk_1E51446C8;
  v8[4] = self;
  v9 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  dispatch_async(v7, v8);

}

- (void)pause
{
  NSObject *v3;
  _QWORD block[5];

  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__PXAudioPlayer_pause__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3810000000;
  v8 = &unk_1A7E74EE7;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  px_dispatch_on_main_queue_sync();
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v6 + 4);
  _Block_object_dispose(&v5, 8);
  return result;
}

- (PXAudioSession)currentAudioSession
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__280054;
  v11 = __Block_byref_object_dispose__280055;
  v12 = 0;
  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PXAudioPlayer_currentAudioSession__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PXAudioSession *)v4;
}

- (id)_createAudioSessionForAsset:(id)a3 startTime:(id *)a4
{
  id v6;
  objc_class *v7;
  NSObject *v8;
  CFStringRef v9;
  __int128 v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  CMTime time2;
  CMTime time1;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)objc_msgSend(v6, "audioSessionClass");
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = (CMTime)*a4;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    PLAudioPlaybackGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      time1 = (CMTime)*a4;
      v9 = CMTimeCopyDescription(0, &time1);
      LODWORD(time1.value) = 138412546;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v9;
      LOWORD(time1.flags) = 2112;
      *(_QWORD *)((char *)&time1.flags + 2) = v6;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Requested start time %@ is less than the asset duration of %@. Restarting at zero.", (uint8_t *)&time1, 0x16u);
    }

    v10 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  v11 = [v7 alloc];
  -[PXAudioPlayer volume](self, "volume");
  v13 = v12;
  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  time1 = (CMTime)*a4;
  v15 = (void *)objc_msgSend(v11, "initWithAsset:volume:startTime:queue:audioSessionDelegate:", v6, &time1, v14, self, COERCE_DOUBLE(__PAIR64__(HIDWORD(time1.value), v13)));

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__PXAudioPlayer__createAudioSessionForAsset_startTime___block_invoke;
  v17[3] = &unk_1E5144758;
  v17[4] = self;
  objc_msgSend(v15, "performChanges:", v17);

  return v15;
}

- (id)_sessionsQueue_generateCurrentTimeRecord
{
  void *v2;
  uint64_t v3;
  PXCurrentTimeRecord *v4;
  double v5;
  PXCurrentTimeRecord *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  -[PXAudioPlayer sessionsQueue_currentSession](self, "sessionsQueue_currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");
  v10 = 0uLL;
  v11 = 0;
  if (v2)
    objc_msgSend(v2, "currentTime");
  v4 = [PXCurrentTimeRecord alloc];
  LODWORD(v5) = 0;
  if (v3 == 3)
    *(float *)&v5 = 1.0;
  v8 = v10;
  v9 = v11;
  v6 = -[PXCurrentTimeRecord initWithSampleTime:rate:](v4, "initWithSampleTime:rate:", &v8, v5);

  return v6;
}

- (void)sessionsQueue_setCurrentSession:(id)a3
{
  PXAudioSession *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = (PXAudioSession *)a3;
  if (self->_sessionsQueue_currentSession != v5)
  {
    -[PXAudioPlayer _sessionsQueue_handleOutgoingSession:](self, "_sessionsQueue_handleOutgoingSession:");
    objc_storeStrong((id *)&self->_sessionsQueue_currentSession, a3);
    -[PXAudioSession registerChangeObserver:context:](v5, "registerChangeObserver:context:", self, CurrentSessionContext);
    -[PXAudioPlayer _sessionsQueue_generateCurrentTimeRecord](self, "_sessionsQueue_generateCurrentTimeRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke;
    v8[3] = &unk_1E5148D08;
    v8[4] = self;
    v9 = v6;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

- (void)_sessionsQueue_handleOutgoingSession:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "performChanges:", &__block_literal_global_35_280051);
  objc_msgSend(v4, "unregisterChangeObserver:context:", self, CurrentSessionContext);

}

- (void)_handleCurrentTimeRecordUpdateTimer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__PXAudioPlayer__handleCurrentTimeRecordUpdateTimer__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXAudioPlayer performChanges:](self, "performChanges:", v2);
}

- (void)setState:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("PXAudioPlayerStateDidChangeNotification"), self);

    -[PXAudioPlayer _invalidateCurrentTimeRecordUpdateTimer](self, "_invalidateCurrentTimeRecordUpdateTimer");
    -[PXAudioPlayer signalChange:](self, "signalChange:", 4);
    -[PXAudioPlayer log](self, "log");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        v17 = 134217984;
        v18 = -[PXAudioPlayer logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXAudioPlayerChangedState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v9 = v6;
    v10 = os_signpost_id_make_with_pointer(v9, self);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        v12 = -[PXAudioPlayer logContext](self, "logContext");
        v17 = 134218240;
        v18 = v12;
        v19 = 2048;
        v20 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_EVENT, v11, "PXAudioPlayerChangedState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    v13 = v9;
    v14 = os_signpost_id_make_with_pointer(v13, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        v16 = -[PXAudioPlayer logContext](self, "logContext");
        v17 = 134218240;
        v18 = v16;
        v19 = 2048;
        v20 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXAudioPlayerChangedState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

  }
}

- (void)setCurrentAssetDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentAssetDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 currentAssetDuration;
  CMTime time1;

  p_currentAssetDuration = &self->_currentAssetDuration;
  time1 = *(CMTime *)a3;
  currentAssetDuration = self->_currentAssetDuration;
  if (CMTimeCompare(&time1, (CMTime *)&currentAssetDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_currentAssetDuration->epoch = a3->var3;
    *(_OWORD *)&p_currentAssetDuration->value = v6;
    -[PXAudioPlayer signalChange:](self, "signalChange:", 2);
  }
}

- (void)setError:(id)a3
{
  NSError *v5;
  char v6;
  NSError *v7;

  v7 = (NSError *)a3;
  v5 = self->_error;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSError isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      -[PXAudioPlayer signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)_update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXAudioPlayer.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 8;
    if ((needsUpdate & 8) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
      -[PXAudioPlayer _updateCurrentSessionState](self, "_updateCurrentSessionState");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _update]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXAudioPlayer.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXAudioPlayer _updateCurrentTimeRecordUpdateTimer](self, "_updateCurrentTimeRecordUpdateTimer");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXAudioPlayer.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXAudioPlayer _updateCurrentTimeRecord](self, "_updateCurrentTimeRecord");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXAudioPlayer.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v7 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFELL;
      -[PXAudioPlayer _updateState](self, "_updateState");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXAudioPlayer.m"), 329, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
}

- (void)_invalidateCurrentTimeRecordUpdateTimer
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _invalidateCurrentTimeRecordUpdateTimer]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXAudioPlayer.m"), 334, CFSTR("invalidating %lu after it already has been updated"), 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
}

- (void)_updateCurrentTimeRecordUpdateTimer
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = -[PXAudioPlayer state](self, "state");
  -[PXAudioPlayer currentTimeRecordUpdateTimer](self, "currentTimeRecordUpdateTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 3)
  {
    if (!v4)
    {
      objc_initWeak(&location, self);
      v5 = (void *)MEMORY[0x1E0C99E88];
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __52__PXAudioPlayer__updateCurrentTimeRecordUpdateTimer__block_invoke;
      v11 = &unk_1E5148D30;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v5, "px_scheduledTimerWithTimeInterval:repeats:block:", 1, &v8, 0.5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAudioPlayer setCurrentTimeRecordUpdateTimer:](self, "setCurrentTimeRecordUpdateTimer:", v6, v8, v9, v10, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else if (v4)
  {
    -[PXAudioPlayer currentTimeRecordUpdateTimer](self, "currentTimeRecordUpdateTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[PXAudioPlayer setCurrentTimeRecordUpdateTimer:](self, "setCurrentTimeRecordUpdateTimer:", 0);
  }
}

- (void)_invalidateCurrentTimeRecord
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _invalidateCurrentTimeRecord]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXAudioPlayer.m"), 354, CFSTR("invalidating %lu after it already has been updated"), 4);

    abort();
  }
  self->_updateFlags.needsUpdate |= 4uLL;
}

- (void)_updateCurrentTimeRecord
{
  NSObject *v3;
  _QWORD block[5];

  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXAudioPlayer__updateCurrentTimeRecord__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_sessionsQueue_updateCurrentTimeRecord
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  -[PXAudioPlayer _sessionsQueue_generateCurrentTimeRecord](self, "_sessionsQueue_generateCurrentTimeRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXAudioPlayer__sessionsQueue_updateCurrentTimeRecord__block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v7, &location);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_invalidateState
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _invalidateState]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXAudioPlayer.m"), 373, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
}

- (void)_updateState
{
  NSObject *v3;
  _QWORD block[5];

  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PXAudioPlayer__updateState__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_invalidateCurrentSessionState
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAudioPlayer _invalidateCurrentSessionState]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXAudioPlayer.m"), 385, CFSTR("invalidating %lu after it already has been updated"), 8);

    abort();
  }
  self->_updateFlags.needsUpdate |= 8uLL;
}

- (void)_updateCurrentSessionState
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6[2];
  id location;

  v3 = -[PXAudioPlayer desiredPlayState](self, "desiredPlayState");
  objc_initWeak(&location, self);
  -[PXAudioPlayer sessionsQueue](self, "sessionsQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXAudioPlayer__updateCurrentSessionState__block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v6, &location);
  v6[1] = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)_sessionsQueue_updateCurrentSessionStateWithDesiredPlayState:(int64_t)a3
{
  void *v4;
  _QWORD v5[5];

  -[PXAudioPlayer sessionsQueue_currentSession](self, "sessionsQueue_currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__PXAudioPlayer__sessionsQueue_updateCurrentSessionStateWithDesiredPlayState___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0___PXMutableAudioSession__8l;
  v5[4] = a3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)_sessionsQueue_updateState
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[24];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PXAudioPlayer sessionsQueue_currentSession](self, "sessionsQueue_currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAudioPlayer currentAsset](self, "currentAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v3, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    memset(buf, 0, sizeof(buf));
    if (v3)
    {
      objc_msgSend(v3, "duration");
      if ((buf[12] & 1) != 0)
        goto LABEL_10;
    }
    -[PXAudioPlayer currentAsset](self, "currentAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "duration");
    }
    else
    {
      v15 = 0uLL;
      v16 = 0;
    }
    *(_OWORD *)buf = v15;
    *(_QWORD *)&buf[16] = v16;

    if (v3)
LABEL_10:
      objc_msgSend(v3, "status");
    -[PXAudioPlayer _sessionsQueue_generateCurrentTimeRecord](self, "_sessionsQueue_generateCurrentTimeRecord");
    v13 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v6 = v9;
    px_dispatch_on_main_queue();

  }
  else
  {
    PLAudioPlaybackGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAudioPlayer currentAsset](self, "currentAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v18 = v8;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%@ skipping state update because we are awaiting a new audio session for the current asset.\n\tCurrent asset: %@\n\tExisting asset: %@", buf, 0x20u);

    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  if ((void *)CurrentSessionContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioPlayer.m"), 469, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = v8;
  px_dispatch_on_main_queue();

}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayer;
  -[PXAudioPlayer didPerformChanges](&v3, sel_didPerformChanges);
  -[PXAudioPlayer _update](self, "_update");
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayer;
  -[PXAudioPlayer performChanges:](&v3, sel_performChanges_, a3);
}

- (id)AVAudioSessionForAudioSession:(id)a3
{
  void *v4;
  void *v5;

  -[PXAudioPlayer audioSessionDelegate](self, "audioSessionDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AVAudioSessionForPlayer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)windowSceneID
{
  void *v2;
  void *v3;

  -[PXAudioPlayer audioSessionDelegate](self, "audioSessionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowSceneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXAudioPlayerDelegate)audioSessionDelegate
{
  return (PXAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_audioSessionDelegate);
}

- (void)setAudioSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioSessionDelegate, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentAssetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 208);
  return self;
}

- (PXAudioAsset)currentAsset
{
  return self->_currentAsset;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)name
{
  return self->_name;
}

- (float)volume
{
  return self->_volume;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (float)targetLoudnessInLKFS
{
  return self->_targetLoudnessInLKFS;
}

- (OS_dispatch_queue)sessionsQueue
{
  return self->_sessionsQueue;
}

- (PXAudioSession)sessionsQueue_currentSession
{
  return self->_sessionsQueue_currentSession;
}

- (PXCurrentTimeRecord)mainQueue_currentTimeRecord
{
  return self->_mainQueue_currentTimeRecord;
}

- (void)setMainQueue_currentTimeRecord:(id)a3
{
  objc_storeStrong((id *)&self->_mainQueue_currentTimeRecord, a3);
}

- (NSTimer)currentTimeRecordUpdateTimer
{
  return self->_currentTimeRecordUpdateTimer;
}

- (void)setCurrentTimeRecordUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimeRecordUpdateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeRecordUpdateTimer, 0);
  objc_storeStrong((id *)&self->_mainQueue_currentTimeRecord, 0);
  objc_storeStrong((id *)&self->_sessionsQueue_currentSession, 0);
  objc_storeStrong((id *)&self->_sessionsQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_destroyWeak((id *)&self->_audioSessionDelegate);
}

uint64_t __46__PXAudioPlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PXAudioPlayer_observable_didChange_context___block_invoke_2;
  v3[3] = &unk_1E5144FE8;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "performChanges:", v3);
}

void __46__PXAudioPlayer_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 7) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateState");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 0xA) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSessionState");

}

void __43__PXAudioPlayer__sessionsQueue_updateState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __43__PXAudioPlayer__sessionsQueue_updateState__block_invoke_2;
  v4[3] = &unk_1E51447E8;
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v8 = v2;
  v10 = *(_QWORD *)(a1 + 80);
  v4[1] = 3221225472;
  v9 = *(_OWORD *)(a1 + 64);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "performChanges:", v4);

}

uint64_t __43__PXAudioPlayer__sessionsQueue_updateState__block_invoke_2(uint64_t a1)
{
  __int128 v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 56));
  v3 = *(_OWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetDuration:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setMainQueue_currentTimeRecord:", *(_QWORD *)(a1 + 48));
}

void __78__PXAudioPlayer__sessionsQueue_updateCurrentSessionStateWithDesiredPlayState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 == 1)
  {
    v5 = v3;
    objc_msgSend(v3, "play");
    goto LABEL_5;
  }
  if (!v4)
  {
    v5 = v3;
    objc_msgSend(v3, "pause");
LABEL_5:
    v3 = v5;
  }

}

void __43__PXAudioPlayer__updateCurrentSessionState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sessionsQueue_updateCurrentSessionStateWithDesiredPlayState:", *(_QWORD *)(a1 + 40));

}

uint64_t __29__PXAudioPlayer__updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionsQueue_updateState");
}

void __55__PXAudioPlayer__sessionsQueue_updateCurrentTimeRecord__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMainQueue_currentTimeRecord:", v1);

}

uint64_t __41__PXAudioPlayer__updateCurrentTimeRecord__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionsQueue_updateCurrentTimeRecord");
}

void __52__PXAudioPlayer__updateCurrentTimeRecordUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCurrentTimeRecordUpdateTimer");

}

uint64_t __52__PXAudioPlayer__handleCurrentTimeRecordUpdateTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentTimeRecord");
}

uint64_t __54__PXAudioPlayer__sessionsQueue_handleOutgoingSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performFinalCleanup");
}

void __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke_2;
  v2[3] = &unk_1E5144868;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "performChanges:", v2);

}

uint64_t __49__PXAudioPlayer_sessionsQueue_setCurrentSession___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSessionState");
  return objc_msgSend(*(id *)(a1 + 32), "setMainQueue_currentTimeRecord:", *(_QWORD *)(a1 + 40));
}

void __55__PXAudioPlayer__createAudioSessionForAsset_startTime___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "targetLoudnessInLKFS");
  objc_msgSend(v3, "setTargetLoudnessInLKFS:");
  objc_msgSend(v3, "prepareToPlay");

}

void __36__PXAudioPlayer_currentAudioSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

void __28__PXAudioPlayer_currentTime__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "mainQueue_currentTimeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentTime");
  }
  else
  {
    v5 = 0uLL;
    v6 = 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = v6;

}

void __22__PXAudioPlayer_pause__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performChanges:", &__block_literal_global_280057);

}

uint64_t __22__PXAudioPlayer_pause__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pause");
}

void __32__PXAudioPlayer_replayFromTime___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PXAudioPlayer_replayFromTime___block_invoke_2;
  v3[3] = &__block_descriptor_56_e33_v16__0___PXMutableAudioSession__8l;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "performChanges:", v3);

}

uint64_t __32__PXAudioPlayer_replayFromTime___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "playFromTime:", &v3);
}

void __52__PXAudioPlayer_setCurrentAsset_startTime_hostTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    PLAudioPlaybackGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      LODWORD(v7) = 138412290;
      *(_QWORD *)((char *)&v7 + 4) = v3;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%@ creating new session.", (uint8_t *)&v7, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v4, "_createAudioSessionForAsset:startTime:", v5, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "sessionsQueue_setCurrentSession:", v6);

}

void __35__PXAudioPlayer_playFromStartTime___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PXAudioPlayer_playFromStartTime___block_invoke_2;
  v3[3] = &__block_descriptor_56_e33_v16__0___PXMutableAudioSession__8l;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "performChanges:", v3);

}

uint64_t __35__PXAudioPlayer_playFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "playFromTime:", &v3);
}

void __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke_2;
  v3[3] = &__block_descriptor_36_e33_v16__0___PXMutableAudioSession__8l;
  v4 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v2, "performChanges:", v3);

}

uint64_t __41__PXAudioPlayer_setTargetLoudnessInLKFS___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setTargetLoudnessInLKFS:", a3);
}

void __27__PXAudioPlayer_setVolume___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionsQueue_currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__PXAudioPlayer_setVolume___block_invoke_2;
  v3[3] = &__block_descriptor_36_e33_v16__0___PXMutableAudioSession__8l;
  v4 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v2, "performChanges:", v3);

}

uint64_t __27__PXAudioPlayer_setVolume___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setVolume:", a3);
}

@end
