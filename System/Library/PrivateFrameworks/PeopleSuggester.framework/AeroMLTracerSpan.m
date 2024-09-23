@implementation AeroMLTracerSpan

- (id)initSpanWithSpanName:(id)a3 traceSession:(id)a4 parentSpanId:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  AeroMLTracerSpan *v11;
  AeroMLTracerSpan *v12;
  uint64_t v13;
  AeroMLTracerSpanEvent *spanEvent;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v20.receiver = self;
  v20.super_class = (Class)AeroMLTracerSpan;
  v11 = -[AeroMLTracerSpan init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_traceSession, a4);
    v13 = objc_opt_new();
    spanEvent = v12->_spanEvent;
    v12->_spanEvent = (AeroMLTracerSpanEvent *)v13;

    -[AeroMLTracerSpanEvent setVersion:](v12->_spanEvent, "setVersion:", CFSTR("055366d53d9de83f5839aaa4511d5b5409bc1d12"));
    -[AeroMLTracerSpanEvent setName:](v12->_spanEvent, "setName:", v8);
    objc_msgSend(v9, "traceId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpanEvent setTraceId:](v12->_spanEvent, "setTraceId:", v15);

    if (v10)
      v16 = v10;
    else
      v16 = CFSTR("-1");
    -[AeroMLTracerSpanEvent setParentSpanId:](v12->_spanEvent, "setParentSpanId:", v16);
    -[AeroMLTracerSpan getProcessName](v12, "getProcessName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpanEvent setProcessName:](v12->_spanEvent, "setProcessName:", v17);

    -[AeroMLTracerSession projectName](v12->_traceSession, "projectName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpanEvent setProjectName:](v12->_spanEvent, "setProjectName:", v18);

    *(_WORD *)&v12->_isEnded = 0;
    v12->_intervalId = 0;
  }

  return v12;
}

- (id)createSubSpanWithName:(id)a3
{
  id v4;
  AeroMLTracerSpan *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = [AeroMLTracerSpan alloc];
  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spanId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AeroMLTracerSpan initSpanWithSpanName:traceSession:parentSpanId:](v5, "initSpanWithSpanName:traceSession:parentSpanId:", v4, v6, v8);

  return v9;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[AeroMLTracerSpan logSchedulingInformation](self, "logSchedulingInformation");
  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traceSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan setIntervalId:](self, "setIntervalId:", os_signpost_id_generate(v4));

  v5 = -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds");
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrivatizedStartTime:", v5);

  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentSpanId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("-1"));

  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traceSignpost");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = -[AeroMLTracerSpan intervalId](self, "intervalId");
  v13 = v12;
  if ((v9 & 1) != 0)
  {
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      -[AeroMLTracerSpan spanEvent](self, "spanEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "traceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AeroMLTracerSpan spanEvent](self, "spanEvent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v17;
      v18 = "RootSpanEvent";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, v18, " TraceId=%{signpost.telemetry:string1,public}@  SpanName=%{signpost.telemetry:string2,public}@ ", (uint8_t *)&v23, 0x16u);

    }
  }
  else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traceId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v15;
    v25 = 2114;
    v26 = v17;
    v18 = "SubSpanEvent";
    goto LABEL_8;
  }

  -[AeroMLTracerSpan getSpanIdFromIntervalId:](self, "getSpanIdFromIntervalId:", -[AeroMLTracerSpan intervalId](self, "intervalId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSpanId:", v19);

  -[AeroMLTracerSpan setIsStarted:](self, "setIsStarted:", 1);
  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v22;
    _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "start span with spanEvent: %@", (uint8_t *)&v23, 0xCu);

  }
}

- (void)end
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "spanEvent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "spanId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1A07F4000, v3, v4, "Try to end the span which is not started: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)logInfoEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[AeroMLTracerSpan createSubEventWithName:details:attributes:](self, "createSubEventWithName:details:attributes:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrivatizedTimeStamp:", -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds"));
  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traceSignpost");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_signpost_enabled(v12))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpan serializeAttributes:](self, "serializeAttributes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v14;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InfoEvent", " TraceId=%{signpost.telemetry:string1,public}@  EventName=%{signpost.telemetry:string2,public}@  EventDetails=%{public, signpost.description:attribute}@  Attributes=%{public}@ ", (uint8_t *)&v20, 0x2Au);

  }
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addInfoEvents:", v10);

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "log info event with spanEvent: %@", (uint8_t *)&v20, 0xCu);

  }
}

- (void)logErrorEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[AeroMLTracerSpan createSubEventWithName:details:attributes:](self, "createSubEventWithName:details:attributes:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrivatizedTimeStamp:", -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds"));
  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traceSignpost");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_signpost_enabled(v12))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpan serializeAttributes:](self, "serializeAttributes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v14;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ErrorEvent", " TraceId=%{signpost.telemetry:string1,public}@  EventName=%{signpost.telemetry:string2,public}@  EventDetails=%{public, signpost.description:attribute}@  Attributes=%{public}@ ", (uint8_t *)&v20, 0x2Au);

  }
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addErrorEvents:", v10);

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "log error event with spanEvent: %@", (uint8_t *)&v20, 0xCu);

  }
}

- (void)logDebugEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[AeroMLTracerSpan createSubEventWithName:details:attributes:](self, "createSubEventWithName:details:attributes:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrivatizedTimeStamp:", -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds"));
  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traceSignpost");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_signpost_enabled(v12))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AeroMLTracerSpan serializeAttributes:](self, "serializeAttributes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v14;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DebugEvent", " TraceId=%{signpost.telemetry:string1,public}@  EventName=%{signpost.telemetry:string2,public}@  EventDetails=%{public, signpost.description:attribute}@  Attributes=%{public}@ ", (uint8_t *)&v20, 0x2Au);

  }
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addDebugEvents:", v10);

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "log debug event with spanEvent: %@", (uint8_t *)&v20, 0xCu);

  }
}

- (void)addTrialDeploymentId:(id)a3 trialExperimentId:(id)a4 trialTreatmentId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTrialDeploymentId:", v10);

  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTrialExperimentId:", v9);

  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTrialTreatmentId:", v8);

}

- (void)addDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceIdentifier:", v4);

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AeroMLTracerSpan addDeviceIdentifier:].cold.1((uint64_t)v4, v6);

}

- (id)getSpanId
{
  void *v2;
  void *v3;

  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spanId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)getMonotonicTimeInMilliseconds
{
  if (!dword_1EE5A7F8C)
    mach_timebase_info((mach_timebase_info_t)&getMonotonicTimeInMilliseconds_timebase);
  return mach_absolute_time()
       * getMonotonicTimeInMilliseconds_timebase
       / dword_1EE5A7F8C
       / 0xF4240;
}

- (void)addAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setName:", v9);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setStringValue:", v11);

        -[AeroMLTracerSpan spanEvent](self, "spanEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAttributes:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)logInfoMessageWithCA:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __41__AeroMLTracerSpan_logInfoMessageWithCA___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("TraceId");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("SpanId");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spanId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("projectName");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "projectName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("processName");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = CFSTR("infoMessage");
  v10 = *(_QWORD *)(a1 + 40);
  v14[3] = v9;
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)logErrorMessageWithCA:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __42__AeroMLTracerSpan_logErrorMessageWithCA___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("TraceId");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("SpanId");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spanId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("projectName");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "projectName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("processName");
  objc_msgSend(*(id *)(a1 + 32), "spanEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = CFSTR("errorMessage");
  v10 = *(_QWORD *)(a1 + 40);
  v14[3] = v9;
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getSpanIdFromIntervalId:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
}

- (void)emitPETEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan traceSession](self, "traceSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "projectName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:subGroup:", v4, v6);

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[AeroMLTracerSpan spanEvent](self, "spanEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "emitted PET message with spanEvent: %@", (uint8_t *)&v9, 0xCu);

  }
  -[AeroMLTracerSpan logInfoMessageWithCA:](self, "logInfoMessageWithCA:", CFSTR("PET_Message_Sent"));

}

- (id)createSubEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setName:", v7);
  objc_msgSend(v10, "setDetails:", v8);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "setName:", v16, (_QWORD)v20);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setStringValue:", v18);

        objc_msgSend(v10, "addAttributes:", v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)serializeAttributes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendFormat:", CFSTR(" %@:%@, "), v14, v15, (_QWORD)v17);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)getProcessName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)logSchedulingInformation
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[12];
  int relative_priority_ptr;
  uint8_t buf[16];

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_INFO, "start to record  logSchedulingInformation", buf, 2u);
  }

  dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dispatch_queue_get_label(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGcdQueueName:", v5);

  relative_priority_ptr = 0;
  dispatch_queue_get_qos_class(v4, &relative_priority_ptr);
  -[AeroMLTracerSpan stringForQoSClass:](self, "stringForQoSClass:", qos_class_self());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQosClassName:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), relative_priority_ptr);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpan spanEvent](self, "spanEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelativePriority:", v9);

  -[AeroMLTracerSession traceChannel](self->_traceSession, "traceChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A07F4000, v11, OS_LOG_TYPE_INFO, "finished recording  logSchedulingInformation", v12, 2u);
  }

}

- (id)stringForQoSClass:(unsigned int)a3
{
  unsigned int v3;
  unint64_t v4;

  HIDWORD(v4) = a3 - 9;
  LODWORD(v4) = a3 - 9;
  v3 = v4 >> 2;
  if (v3 > 6)
    return CFSTR("Unspecified");
  else
    return off_1E44009B0[v3];
}

- (AeroMLTracerSpanEvent)spanEvent
{
  return self->_spanEvent;
}

- (void)setSpanEvent:(id)a3
{
  objc_storeStrong((id *)&self->_spanEvent, a3);
}

- (AeroMLTracerSession)traceSession
{
  return self->_traceSession;
}

- (void)setTraceSession:(id)a3
{
  objc_storeStrong((id *)&self->_traceSession, a3);
}

- (BOOL)isEnded
{
  return self->_isEnded;
}

- (void)setIsEnded:(BOOL)a3
{
  self->_isEnded = a3;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void)setIntervalId:(unint64_t)a3
{
  self->_intervalId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceSession, 0);
  objc_storeStrong((id *)&self->_spanEvent, 0);
}

- (void)addDeviceIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "log device identifer: %@", (uint8_t *)&v2, 0xCu);
}

@end
