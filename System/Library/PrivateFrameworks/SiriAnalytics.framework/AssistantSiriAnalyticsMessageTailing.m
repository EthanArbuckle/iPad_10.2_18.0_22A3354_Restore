@implementation AssistantSiriAnalyticsMessageTailing

- (AssistantSiriAnalyticsMessageTailing)init
{

  return 0;
}

- (AssistantSiriAnalyticsMessageTailing)initWithPreferences:(id)a3
{
  id v5;
  AssistantSiriAnalyticsMessageTailing *v6;
  AssistantSiriAnalyticsMessageTailing *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *messageTailingQueue;
  AssistantSiriAnalyticsMessageTailing *v12;
  void *v13;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (SiriAnalyticsIsInternalInstall_onceToken != -1)
    dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_874);
  if (SiriAnalyticsIsInternalInstall_isInternal && (objc_msgSend(v5, "tailMessagesToOSLogEnabled") & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)AssistantSiriAnalyticsMessageTailing;
    v6 = -[AssistantSiriAnalyticsMessageTailing init](&v16, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_preferences, a3);
      if (SiriAnalyticsLoggingInit_once != -1)
        dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
      v8 = SiriAnalyticsLogContextMessageTailing;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[AssistantSiriAnalyticsMessageTailing initWithPreferences:]";
        _os_log_debug_impl(&dword_1A025F000, v8, OS_LOG_TYPE_DEBUG, "%s Adding message subscription for writing to syslog", buf, 0xCu);
      }
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("AssistantSiriAnalytics.message.tailing", v9);
      messageTailingQueue = v7->_messageTailingQueue;
      v7->_messageTailingQueue = (OS_dispatch_queue *)v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v13 = (void *)SiriAnalyticsLogContextMessageTailing;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
    {
      v15 = v13;
      if (SiriAnalyticsIsInternalInstall_onceToken != -1)
        dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_874);
      *(_DWORD *)buf = 136315650;
      v18 = "-[AssistantSiriAnalyticsMessageTailing initWithPreferences:]";
      v19 = 1024;
      v20 = SiriAnalyticsIsInternalInstall_isInternal;
      v21 = 1024;
      v22 = objc_msgSend(v5, "tailMessagesToOSLogEnabled");
      _os_log_debug_impl(&dword_1A025F000, v15, OS_LOG_TYPE_DEBUG, "%s Not tailing messages to syslog (internal image: %d, tailing preference enabled:%d)", buf, 0x18u);

    }
    v12 = 0;
  }

  return v12;
}

- (void)tailMessages:(id)a3
{
  id v4;
  NSObject *messageTailingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  messageTailingQueue = self->_messageTailingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AssistantSiriAnalyticsMessageTailing_tailMessages___block_invoke;
  v7[3] = &unk_1E4357A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(messageTailingQueue, v7);

}

- (void)_tailMessages:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "underlyingMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logicalTimestamp");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "nanoSecondsSinceBoot");
        objc_msgSend(v8, "messageUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logicalTimestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clockIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AssistantSiriAnalyticsMessageTailing _tailMessage:timestamp:messageUUID:clockIdentifier:](self, "_tailMessage:timestamp:messageUUID:clockIdentifier:", v9, v11, v12, v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (void)tailAnyEvents:(id)a3
{
  id v4;
  NSObject *messageTailingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AssistantSiriAnalyticsMessageTailing *v9;

  v4 = a3;
  messageTailingQueue = self->_messageTailingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AssistantSiriAnalyticsMessageTailing_tailAnyEvents___block_invoke;
  v7[3] = &unk_1E4357A90;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(messageTailingQueue, v7);

}

- (void)tailMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 clockIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *messageTailingQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  messageTailingQueue = self->_messageTailingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__AssistantSiriAnalyticsMessageTailing_tailMessage_timestamp_messageUUID_clockIdentifier___block_invoke;
  block[3] = &unk_1E4357B60;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(messageTailingQueue, block);

}

- (void)_tailMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 clockIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v12 = (void *)SiriAnalyticsLogContextMessageTailing;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = v12;
    objc_msgSend(v13, "numberWithUnsignedLongLong:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    v17 = v16;
    objc_msgSend(v9, "formattedJsonBody");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136316418;
    v20 = "-[AssistantSiriAnalyticsMessageTailing _tailMessage:timestamp:messageUUID:clockIdentifier:]";
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v18;
    _os_log_debug_impl(&dword_1A025F000, v14, OS_LOG_TYPE_DEBUG, "%s %@ <%@> : %@<%@> %@", (uint8_t *)&v19, 0x3Eu);

  }
}

- (void)tailMessage:(id)a3
{
  id v4;
  NSObject *messageTailingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  messageTailingQueue = self->_messageTailingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AssistantSiriAnalyticsMessageTailing_tailMessage___block_invoke;
  v7[3] = &unk_1E4357A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(messageTailingQueue, v7);

}

- (void)_tailMessage:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = (void *)SiriAnalyticsLogContextMessageTailing;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v3, "formattedJsonBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[AssistantSiriAnalyticsMessageTailing _tailMessage:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1A025F000, v5, OS_LOG_TYPE_DEBUG, "%s %@ %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTailingQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

uint64_t __52__AssistantSiriAnalyticsMessageTailing_tailMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tailMessage:", *(_QWORD *)(a1 + 40));
}

uint64_t __90__AssistantSiriAnalyticsMessageTailing_tailMessage_timestamp_messageUUID_clockIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tailMessage:timestamp:messageUUID:clockIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __54__AssistantSiriAnalyticsMessageTailing_tailAnyEvents___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "unwrap", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_tailMessage:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __53__AssistantSiriAnalyticsMessageTailing_tailMessages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tailMessages:", *(_QWORD *)(a1 + 40));
}

@end
