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
  v2 = -[TSPSaveMeasurements init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr(&qword_100014400);
    while (__stlxr(v4 + 1, &qword_100014400));
    v2->_request_id = v4;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    timeSpentByPhases = v3->_timeSpentByPhases;
    v3->_timeSpentByPhases = (NSMutableDictionary *)v5;

    v3->_saveStandardChunksStartTimestampMCT = 0;
  }
  return v3;
}

- (void)startRecordingTimeForDumpRequestPhase:(const char *)a3 pid:(int)a4
{
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t request_id;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v7 = *__error();
  v8 = sub_10000407C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = "<unknown>";
    if (a3)
      v12 = a3;
    v13 = 136446466;
    v14 = v12;
    v15 = 1024;
    v16 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "DumpRequest", "Request from %{public}s [%d]", (uint8_t *)&v13, 0x12u);
  }

  *__error() = v7;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "DumpRequest");
}

- (void)stopRecordingTimeForDumpRequestPhase:(id)a3
{
  id v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t request_id;
  const char *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint32_t v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = *__error();
  v6 = sub_10000407C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  request_id = self->_request_id;
  if (v4)
  {
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v14 = 138543362;
      v15 = v4;
      v10 = "FAILED due to reason: %{public}@";
      v11 = v8;
      v12 = request_id;
      v13 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "DumpRequest", v10, (uint8_t *)&v14, v13);
    }
  }
  else if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v14) = 0;
    v10 = "SUCCEEDED";
    v11 = v8;
    v12 = request_id;
    v13 = 2;
    goto LABEL_8;
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "DumpRequest");

}

- (void)startRecordingTimeForSaveStandardChunksPhase:(const char *)a3 pid:(int)a4
{
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t request_id;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v7 = *__error();
  v8 = sub_10000407C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = "<unknown>";
    if (a3)
      v12 = a3;
    v13 = 136446466;
    v14 = v12;
    v15 = 1024;
    v16 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "SaveStandardChunks", "Save for '%{public}s [%d]", (uint8_t *)&v13, 0x12u);
  }

  *__error() = v7;
  self->_saveStandardChunksStartTimestampMCT = -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "SaveStandardChunks");
}

- (void)stopRecordingTimeForSaveStandardChunksPhase:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t request_id;
  const char *v10;
  int v11;
  const char *v12;

  v3 = a3;
  v5 = *__error();
  v6 = sub_10000407C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = "FAILED";
    if (v3)
      v10 = "SUCCEEDED";
    v11 = 136315138;
    v12 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, request_id, "SaveStandardChunks", "%s", (uint8_t *)&v11, 0xCu);
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "SaveStandardChunks");
}

- (void)recordTimeForSaveStandardChunksWithoutPostProcessing:(unint64_t)a3
{
  unint64_t saveStandardChunksStartTimestampMCT;
  BOOL v4;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t request_id;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;

  saveStandardChunksStartTimestampMCT = self->_saveStandardChunksStartTimestampMCT;
  if (saveStandardChunksStartTimestampMCT)
    v4 = saveStandardChunksStartTimestampMCT >= a3;
  else
    v4 = 1;
  if (!v4)
  {
    v7 = *__error();
    v8 = sub_10000407C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    request_id = self->_request_id;
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = self->_saveStandardChunksStartTimestampMCT;
      v15 = 134349312;
      v16 = v12;
      v17 = 2050;
      v18 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, request_id, "SaveStandardChunks_WithoutPostProcessing", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", (uint8_t *)&v15, 0x16u);
    }

    *__error() = v7;
    v13 = a3 - self->_saveStandardChunksStartTimestampMCT;
    if (qword_1000165B0 != -1)
      dispatch_once(&qword_1000165B0, &stru_100010708);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&qword_1000165A8 * (double)v13 * 0.000000001));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v14, CFSTR("SaveStandardChunks_WithoutPostProcessing"));

  }
}

- (void)startRecordingTimeForAugmentPhase:(const char *)a3 pid:(int)a4 originalFd:(int)a5 dupFd:(int)a6
{
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t request_id;
  const char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;

  v11 = *__error();
  v12 = sub_10000407C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v16 = "<unknown>";
    v17 = 136446978;
    if (a3)
      v16 = a3;
    v18 = v16;
    v19 = 1024;
    v20 = a4;
    v21 = 1024;
    v22 = a5;
    v23 = 1024;
    v24 = a6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment", "Augment for %{public}s [%d], fd: %d, dup fd: %d", (uint8_t *)&v17, 0x1Eu);
  }

  *__error() = v11;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment");
}

- (void)stopRecordingTimeForAugmentPhase:(BOOL)a3 finalSizeBytes:(int64_t)a4
{
  _BOOL4 v5;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t request_id;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;

  v5 = a3;
  v7 = *__error();
  v8 = sub_10000407C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = "FAILED";
    if (v5)
      v12 = "SUCCEEDED";
    v13 = 136315394;
    v14 = v12;
    v15 = 2048;
    v16 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, request_id, "Augment", "%s (final size: %{bytes}lld)", (uint8_t *)&v13, 0x16u);
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
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t request_id;
  _DWORD v14[2];
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = *__error();
  v10 = sub_10000407C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v14[0] = 67109632;
    v14[1] = v7;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment_LoggingData", "os_signpost: %{BOOL}d\nos_log: %{BOOL}d\nscrub_data: %{BOOL}d", (uint8_t *)v14, 0x14u);
  }

  *__error() = v9;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment_LoggingData");
}

- (void)stopRecordingTimeForAugmentLoggingPhase:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t request_id;
  const char *v10;
  int v11;
  const char *v12;

  v3 = a3;
  v5 = *__error();
  v6 = sub_10000407C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = "FAILED";
    if (v3)
      v10 = "SUCCEEDED";
    v11 = 136315138;
    v12 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, request_id, "Augment_LoggingData", "%s", (uint8_t *)&v11, 0xCu);
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment_LoggingData");
}

- (void)startRecordingTimeForAugmentSymbolicatePhase
{
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t request_id;
  uint8_t v8[16];

  v3 = *__error();
  v4 = sub_10000407C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment_Symbolicate", (const char *)&unk_10000DF32, v8, 2u);
  }

  *__error() = v3;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment_Symbolicate");
}

- (void)stopRecordingTimeForAugmentSymbolicatePhase
{
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t request_id;
  uint8_t v8[16];

  v3 = *__error();
  v4 = sub_10000407C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, request_id, "Augment_Symbolicate", (const char *)&unk_10000DF32, v8, 2u);
  }

  *__error() = v3;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment_Symbolicate");
}

- (void)recordTailspinDurationWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4
{
  if (qword_1000165B0 != -1)
    dispatch_once(&qword_1000165B0, &stru_100010708);
  self->_tailspinDurationSecs = *(double *)&qword_1000165A8 * (double)(a4 - a3) * 0.000000001;
}

- (unint64_t)_startRecordingTimeForPhase:(const char *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v5 = mach_continuous_time();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v6, v4);

  return v5;
}

- (void)_stopRecordingTimeForPhase:(const char *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v4 = mach_continuous_time();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_timeSpentByPhases, "objectForKeyedSubscript:", v9));
  if (!v5)
    sub_10000A854();
  v6 = v5;
  v7 = objc_msgSend(v5, "unsignedLongLongValue");
  if (qword_1000165B0 != -1)
    dispatch_once(&qword_1000165B0, &stru_100010708);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&qword_1000165A8 * (double)(v4 - (unint64_t)v7) * 0.000000001));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v8, v9);

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
