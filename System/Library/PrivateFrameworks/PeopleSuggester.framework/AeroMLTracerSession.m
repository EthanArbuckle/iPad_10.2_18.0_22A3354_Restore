@implementation AeroMLTracerSession

+ (id)generateTraceId
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)logChannelWithSubsystem:(const char *)a3 category:(const char *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%s"), a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (logChannelWithSubsystem_category___pasOnceToken2 != -1)
    dispatch_once(&logChannelWithSubsystem_category___pasOnceToken2, &__block_literal_global_19);
  v7 = (id)logChannelWithSubsystem_category___pasExprOnceResult;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5;
  v11[3] = &unk_1E4400690;
  v13 = &v16;
  v8 = v6;
  v12 = v8;
  v14 = a3;
  v15 = a4;
  objc_msgSend(v7, "runWithLockAcquired:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)logChannelWithSubsystem_category___pasExprOnceResult;
  logChannelWithSubsystem_category___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  const char *v8;
  os_log_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[4]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v8 = (const char *)a1[6];
    v7 = a1 + 6;
    v9 = os_log_create(v8, (const char *)v7[1]);
    v10 = *(_QWORD *)(*(v7 - 1) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(v7 - 1) + 8) + 40), *(v7 - 2));
    if (*(_QWORD *)(*(_QWORD *)(*(v7 - 1) + 8) + 40))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v12 = *v7;
        v13 = v7[1];
        v14 = 136315394;
        v15 = v12;
        v16 = 2080;
        v17 = v13;
        _os_log_impl(&dword_1A07F4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Successfully created os_log_t for subsystem: %s, category: %s", (uint8_t *)&v14, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5_cold_1(v7, v7 + 1);
    }
  }

}

- (AeroMLTracerSession)initWithTraceId:(id)a3 projectName:(id)a4
{
  id v6;
  id v7;
  AeroMLTracerSession *v8;
  uint64_t v9;
  NSString *traceId;
  uint64_t v11;
  NSString *projectName;
  void *v13;
  id v14;
  uint64_t v15;
  OS_os_log *traceSignpost;
  uint64_t v17;
  OS_os_log *traceChannel;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AeroMLTracerSession;
  v8 = -[AeroMLTracerSession init](&v20, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    traceId = v8->_traceId;
    v8->_traceId = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    projectName = v8->_projectName;
    v8->_projectName = (NSString *)v11;

    v13 = (void *)objc_opt_class();
    v14 = objc_retainAutorelease(v7);
    objc_msgSend(v13, "logChannelWithSubsystem:category:", objc_msgSend(v14, "UTF8String"), "signpost");
    v15 = objc_claimAutoreleasedReturnValue();
    traceSignpost = v8->_traceSignpost;
    v8->_traceSignpost = (OS_os_log *)v15;

    objc_msgSend((id)objc_opt_class(), "logChannelWithSubsystem:category:", objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), "AMLTracer");
    v17 = objc_claimAutoreleasedReturnValue();
    traceChannel = v8->_traceChannel;
    v8->_traceChannel = (OS_os_log *)v17;

  }
  return v8;
}

- (AeroMLTracerSession)initWithProjectName:(id)a3
{
  id v4;
  void *v5;
  AeroMLTracerSession *v6;

  v4 = a3;
  +[AeroMLTracerSession generateTraceId](AeroMLTracerSession, "generateTraceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AeroMLTracerSession initWithTraceId:projectName:](self, "initWithTraceId:projectName:", v5, v4);

  return v6;
}

- (id)createRootSpanWithName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AeroMLTracerSpan initSpanWithSpanName:traceSession:parentSpanId:]([AeroMLTracerSpan alloc], "initSpanWithSpanName:traceSession:parentSpanId:", v4, self, 0);

  return v5;
}

- (id)createSubSpanWithName:(id)a3 parentSpanId:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[AeroMLTracerSpan initSpanWithSpanName:traceSession:parentSpanId:]([AeroMLTracerSpan alloc], "initSpanWithSpanName:traceSession:parentSpanId:", v7, self, v6);

  return v8;
}

- (NSString)traceId
{
  return self->_traceId;
}

- (NSString)projectName
{
  return self->_projectName;
}

- (OS_os_log)traceSignpost
{
  return self->_traceSignpost;
}

- (void)setTraceSignpost:(id)a3
{
  objc_storeStrong((id *)&self->_traceSignpost, a3);
}

- (OS_os_log)traceChannel
{
  return self->_traceChannel;
}

- (void)setTraceChannel:(id)a3
{
  objc_storeStrong((id *)&self->_traceChannel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceChannel, 0);
  objc_storeStrong((id *)&self->_traceSignpost, 0);
  objc_storeStrong((id *)&self->_projectName, 0);
  objc_storeStrong((id *)&self->_traceId, 0);
}

void __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = *a2;
  v4 = 136315394;
  v5 = v2;
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl(&dword_1A07F4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t for subsystem: %s, category: %s", (uint8_t *)&v4, 0x16u);
}

@end
