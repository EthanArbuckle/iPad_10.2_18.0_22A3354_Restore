@implementation SiriAnalyticsClientMessageStream

uint64_t __77__SiriAnalyticsClientMessageStream_emitMessage_timestamp_isolatedStreamUUID___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "emitMessage:timestamp:messageUUID:isolatedStreamUUID:completion:", a1[5], a1[8], a1[6], a1[7], 0);
}

- (void)emitMessage:(id)a3 isolatedStreamUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SiriAnalyticsClientMessageStream emitMessage:timestamp:isolatedStreamUUID:](self, "emitMessage:timestamp:isolatedStreamUUID:", v7, mach_absolute_time(), v6);

}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4 isolatedStreamUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  void *v17;
  NSObject *queue;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "qualifiedMessageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v11 = mach_continuous_time();
  v12 = mach_absolute_time();
  v13 = (id)SiriAnalyticsLogContextPerformance;
  v14 = os_signpost_id_generate((os_log_t)SiriAnalyticsLogContextPerformance);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 134349314;
      v26 = (const char *)(v11 + a4 - v12);
      v27 = 2112;
      v28 = v10;
      _os_signpost_emit_with_name_impl(&dword_1A025F000, v13, OS_SIGNPOST_EVENT, v15, "EventEmitted", "%{public, signpost.description:event_time}llu type=%@", buf, 0x16u);
    }
  }

  if (v9 || objc_msgSend(v8, "clockIsolationLevel") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SiriAnalyticsClientMessageStream_emitMessage_timestamp_isolatedStreamUUID___block_invoke;
    block[3] = &unk_1E4357B60;
    block[4] = self;
    v24 = a4;
    v21 = v8;
    v22 = v17;
    v23 = v9;
    v19 = v17;
    dispatch_async(queue, block);

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v16 = SiriAnalyticsLogContextStreaming;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[SiriAnalyticsClientMessageStream emitMessage:timestamp:isolatedStreamUUID:]";
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_1A025F000, v16, OS_LOG_TYPE_ERROR, "%s SELF Event is marked as ISOLATED but is emitted without isolatedStreamUUID. Not emitting event: %@", buf, 0x16u);
    }
  }

}

- (SiriAnalyticsClientMessageStream)initWithQueue:(id)a3 analyticsService:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SiriAnalyticsClientMessageStream *v12;
  SiriAnalyticsClientMessageStream *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsClientMessageStream;
  v12 = -[SiriAnalyticsClientMessageStream init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_service, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (id)analyticsService
{
  return self->_service;
}

- (void)setAnalyticsService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)emitMessage:(id)a3
{
  -[SiriAnalyticsClientMessageStream emitMessage:isolatedStreamUUID:](self, "emitMessage:isolatedStreamUUID:", a3, 0);
}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4
{
  -[SiriAnalyticsClientMessageStream emitMessage:timestamp:isolatedStreamUUID:](self, "emitMessage:timestamp:isolatedStreamUUID:", a3, a4, 0);
}

- (void)barrierWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SiriAnalyticsClientMessageStream_barrierWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)resolvePartialMessage:(id)a3
{
  -[SiriAnalyticsClientMessageStream resolvePartialMessage:isolatedStreamUUID:](self, "resolvePartialMessage:isolatedStreamUUID:", a3, 0);
}

- (void)resolvePartialMessage:(id)a3 isolatedStreamUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SiriAnalyticsClientMessageStream resolvePartialMessage:timestamp:isolatedStreamUUID:](self, "resolvePartialMessage:timestamp:isolatedStreamUUID:", v7, mach_absolute_time(), v6);

}

- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4
{
  -[SiriAnalyticsClientMessageStream resolvePartialMessage:timestamp:isolatedStreamUUID:](self, "resolvePartialMessage:timestamp:isolatedStreamUUID:", a3, a4, 0);
}

- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4 isolatedStreamUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *queue;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9 || objc_msgSend(v8, "clockIsolationLevel") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__SiriAnalyticsClientMessageStream_resolvePartialMessage_timestamp_isolatedStreamUUID___block_invoke;
    block[3] = &unk_1E4357B60;
    block[4] = self;
    v18 = a4;
    v15 = v8;
    v16 = v12;
    v17 = v9;
    v10 = v12;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(v8, "qualifiedMessageName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v11 = SiriAnalyticsLogContextStreaming;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SiriAnalyticsClientMessageStream resolvePartialMessage:timestamp:isolatedStreamUUID:]";
      v21 = 2112;
      v22 = v10;
      _os_log_error_impl(&dword_1A025F000, v11, OS_LOG_TYPE_ERROR, "%s SELF Event is marked as ISOLATED but is emitted without isolatedStreamUUID. Not emitting event: %@", buf, 0x16u);
    }
  }

}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 messageMetadata:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_alloc_init(MEMORY[0x1E0D995F8]);
  v15 = objc_alloc_init(MEMORY[0x1E0D99600]);
  objc_msgSend(v14, "setMetadata:", v15);

  objc_msgSend(v14, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v11);
  objc_msgSend(v16, "setAssetIdentifier:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0D995F0]);
  objc_msgSend(v14, "setContent:", v18);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v14, "setSpeechAudioRecord:", v12);
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __113__SiriAnalyticsClientMessageStream_enqueueLargeMessageObjectFromPath_assetIdentifier_messageMetadata_completion___block_invoke;
  v23[3] = &unk_1E4357B88;
  v23[4] = self;
  v24 = v10;
  v25 = v14;
  v26 = v13;
  v20 = v13;
  v21 = v14;
  v22 = v10;
  dispatch_async(queue, v23);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __113__SiriAnalyticsClientMessageStream_enqueueLargeMessageObjectFromPath_assetIdentifier_messageMetadata_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "enqueueLargeMessageObjectFromPath:dataUploadEvent:completion:", a1[5], a1[6], a1[7]);
}

uint64_t __87__SiriAnalyticsClientMessageStream_resolvePartialMessage_timestamp_isolatedStreamUUID___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "resolvePartialMessage:timestamp:messageUUID:isolatedStreamUUID:completion:", a1[5], a1[8], a1[6], a1[7], 0);
}

uint64_t __58__SiriAnalyticsClientMessageStream_barrierWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "barrierWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
