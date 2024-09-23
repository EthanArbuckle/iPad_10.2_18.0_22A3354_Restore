@implementation TSPSaveMeasurements

- (TSPSaveMeasurements)init
{
  TSPSaveMeasurements *v2;
  TSPSaveMeasurements *v3;
  unint64_t v4;
  uint64_t v5;
  NSMutableDictionary *timeSpentByPhases;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSPSaveMeasurements;
  v2 = -[TSPSaveMeasurements init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr(&qword_1EF718BF0);
    while (__stlxr(v4 + 1, &qword_1EF718BF0));
    v2->_request_id = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    timeSpentByPhases = v3->_timeSpentByPhases;
    v3->_timeSpentByPhases = (NSMutableDictionary *)v5;

    v3->_saveStandardChunksStartTimestampMCT = 0;
  }
  return v3;
}

- (void)startRecordingTimeForDumpRequestPhase:(const char *)a3 pid:(int)a4
{
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t request_id;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = *__error();
  sub_1C1CB1954();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = "<unknown>";
    if (a3)
      v11 = a3;
    v12 = 136446466;
    v13 = v11;
    v14 = 1024;
    v15 = a4;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "DumpRequest", "Request from %{public}s [%d]", (uint8_t *)&v12, 0x12u);
  }

  *__error() = v7;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "DumpRequest");
}

- (void)stopRecordingTimeForDumpRequestPhase:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t request_id;
  const char *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint32_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *__error();
  sub_1C1CB1954();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  request_id = self->_request_id;
  if (v4)
  {
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v13 = 138543362;
      v14 = v4;
      v9 = "FAILED due to reason: %{public}@";
      v10 = v7;
      v11 = request_id;
      v12 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v10, OS_SIGNPOST_INTERVAL_END, v11, "DumpRequest", v9, (uint8_t *)&v13, v12);
    }
  }
  else if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v13) = 0;
    v9 = "SUCCEEDED";
    v10 = v7;
    v11 = request_id;
    v12 = 2;
    goto LABEL_8;
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "DumpRequest");

}

- (void)startRecordingTimeForSaveStandardChunksPhase:(const char *)a3 pid:(int)a4
{
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t request_id;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = *__error();
  sub_1C1CB1954();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = "<unknown>";
    if (a3)
      v11 = a3;
    v12 = 136446466;
    v13 = v11;
    v14 = 1024;
    v15 = a4;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "SaveStandardChunks", "Save for '%{public}s [%d]", (uint8_t *)&v12, 0x12u);
  }

  *__error() = v7;
  self->_saveStandardChunksStartTimestampMCT = -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "SaveStandardChunks");
}

- (void)stopRecordingTimeForSaveStandardChunksPhase:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t request_id;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = *__error();
  sub_1C1CB1954();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = "FAILED";
    if (v3)
      v9 = "SUCCEEDED";
    v10 = 136315138;
    v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v7, OS_SIGNPOST_INTERVAL_END, request_id, "SaveStandardChunks", "%s", (uint8_t *)&v10, 0xCu);
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "SaveStandardChunks");
}

- (void)recordTimeForSaveStandardChunksWithoutPostProcessing:(unint64_t)a3
{
  unint64_t saveStandardChunksStartTimestampMCT;
  BOOL v4;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t request_id;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  saveStandardChunksStartTimestampMCT = self->_saveStandardChunksStartTimestampMCT;
  if (saveStandardChunksStartTimestampMCT)
    v4 = saveStandardChunksStartTimestampMCT >= a3;
  else
    v4 = 1;
  if (!v4)
  {
    v7 = *__error();
    sub_1C1CB1954();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    request_id = self->_request_id;
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v11 = self->_saveStandardChunksStartTimestampMCT;
      v15 = 134349312;
      v16 = v11;
      v17 = 2050;
      v18 = a3;
      _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v9, OS_SIGNPOST_EVENT, request_id, "SaveStandardChunks_WithoutPostProcessing", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", (uint8_t *)&v15, 0x16u);
    }

    *__error() = v7;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = a3 - self->_saveStandardChunksStartTimestampMCT;
    if (qword_1EF7190E8 != -1)
      dispatch_once(&qword_1EF7190E8, &unk_1E7B8EAD0);
    objc_msgSend(v12, "numberWithDouble:", *(double *)&qword_1EF7190E0 * (double)v13 * 0.000000001);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v14, CFSTR("SaveStandardChunks_WithoutPostProcessing"));

  }
}

- (void)startRecordingTimeForAugmentPhase:(const char *)a3 pid:(int)a4 originalFd:(int)a5 dupFd:(int)a6
{
  int v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t request_id;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = *__error();
  sub_1C1CB1954();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = "<unknown>";
    v16 = 136446978;
    if (a3)
      v15 = a3;
    v17 = v15;
    v18 = 1024;
    v19 = a4;
    v20 = 1024;
    v21 = a5;
    v22 = 1024;
    v23 = a6;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment", "Augment for %{public}s [%d], fd: %d, dup fd: %d", (uint8_t *)&v16, 0x1Eu);
  }

  *__error() = v11;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment");
}

- (void)stopRecordingTimeForAugmentPhase:(BOOL)a3 finalSizeBytes:(int64_t)a4
{
  _BOOL4 v5;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t request_id;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v5 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = *__error();
  sub_1C1CB1954();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = "FAILED";
    if (v5)
      v11 = "SUCCEEDED";
    v12 = 136315394;
    v13 = v11;
    v14 = 2048;
    v15 = a4;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v9, OS_SIGNPOST_INTERVAL_END, request_id, "Augment", "%s (final size: %{bytes}lld)", (uint8_t *)&v12, 0x16u);
  }

  *__error() = v7;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment");
  self->_fileSizeBytes = a4;
}

- (void)startRecordingTimeForAugmentLoggingPhase:(BOOL)a3 collectOSLog:(BOOL)a4 scrubData:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t request_id;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v9 = *__error();
  sub_1C1CB1954();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13[0] = 67109632;
    v13[1] = v7;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v5;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment_LoggingData", "os_signpost: %{BOOL}d\nos_log: %{BOOL}d\nscrub_data: %{BOOL}d", (uint8_t *)v13, 0x14u);
  }

  *__error() = v9;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment_LoggingData");
}

- (void)stopRecordingTimeForAugmentLoggingPhase:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t request_id;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = *__error();
  sub_1C1CB1954();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = "FAILED";
    if (v3)
      v9 = "SUCCEEDED";
    v10 = 136315138;
    v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v7, OS_SIGNPOST_INTERVAL_END, request_id, "Augment_LoggingData", "%s", (uint8_t *)&v10, 0xCu);
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment_LoggingData");
}

- (void)startRecordingTimeForAugmentSymbolicatePhase
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t request_id;
  uint8_t v7[16];

  v3 = *__error();
  sub_1C1CB1954();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment_Symbolicate", ", v7, 2u);
  }

  *__error() = v3;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment_Symbolicate");
}

- (void)stopRecordingTimeForAugmentSymbolicatePhase
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t request_id;
  uint8_t v7[16];

  v3 = *__error();
  sub_1C1CB1954();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v5, OS_SIGNPOST_INTERVAL_END, request_id, "Augment_Symbolicate", ", v7, 2u);
  }

  *__error() = v3;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment_Symbolicate");
}

- (void)recordTailspinDurationWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4
{
  if (qword_1EF7190E8 != -1)
    dispatch_once(&qword_1EF7190E8, &unk_1E7B8EAD0);
  self->_tailspinDurationSecs = *(double *)&qword_1EF7190E0 * (double)(a4 - a3) * 0.000000001;
}

- (unint64_t)_startRecordingTimeForPhase:(const char *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = mach_continuous_time();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v6, v4);

  return v5;
}

- (void)_stopRecordingTimeForPhase:(const char *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = mach_continuous_time();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_timeSpentByPhases, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    sub_1C1CC8BC8();
  v6 = v5;
  v7 = objc_msgSend(v5, "unsignedLongLongValue");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (qword_1EF7190E8 != -1)
    dispatch_once(&qword_1EF7190E8, &unk_1E7B8EAD0);
  objc_msgSend(v8, "numberWithDouble:", *(double *)&qword_1EF7190E0 * (double)(v4 - v7) * 0.000000001);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v9, v10);

}

- (unint64_t)request_id
{
  return self->_request_id;
}

- (NSMutableDictionary)timeSpentByPhases
{
  return self->_timeSpentByPhases;
}

- (double)tailspinDurationSecs
{
  return self->_tailspinDurationSecs;
}

- (int64_t)fileSizeBytes
{
  return self->_fileSizeBytes;
}

- (void)setFileSizeBytes:(int64_t)a3
{
  self->_fileSizeBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSpentByPhases, 0);
}

@end
