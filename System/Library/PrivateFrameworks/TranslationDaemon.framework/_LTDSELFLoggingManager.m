@implementation _LTDSELFLoggingManager

+ (void)initialize
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v6[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_endpoints;
    _endpoints = v4;

  }
}

- (_LTDSELFLoggingManager)init
{
  _LTDSELFLoggingManager *v2;
  _LTDSELFLoggingSessionIdProvider *v3;
  _LTDSELFLoggingSessionIdProvider *sessionIdProvider;
  NSObject *v5;
  _LTDSELFLoggingManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LTDSELFLoggingManager;
  v2 = -[_LTDSELFLoggingManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_LTDSELFLoggingSessionIdProvider);
    sessionIdProvider = v2->_sessionIdProvider;
    v2->_sessionIdProvider = v3;

    v5 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_LTDSELFLoggingManager init].cold.1();
    v6 = v2;
  }

  return v2;
}

- (void)selfLoggingEventWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;

  v4 = a3;
  objc_msgSend(v4, "invocationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE95C78]);
    objc_msgSend(v4, "invocationId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithNSUUID:", v7);

    objc_msgSend(v4, "qssSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x24BE95C78]);
      objc_msgSend(v4, "qssSessionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "initWithNSUUID:", v11);

    }
    switch(objc_msgSend(v4, "type"))
    {
      case 1:
        objc_msgSend(v4, "startInvocationOptions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v32, "task");
        objc_msgSend(v4, "startInvocationOptions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "inputMode");
        objc_msgSend(v4, "startInvocationOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "invocationType");
        objc_msgSend(v4, "startInvocationOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "translateAppContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationStartWithInvocationId:task:inputMode:invocationType:translateAppContext:](self, "invocationStartWithInvocationId:task:inputMode:invocationType:translateAppContext:", v8, v31, v13, v15, v17);

        break;
      case 2:
        -[_LTDSELFLoggingManager invocationEndSuccessfullyWithInvocationId:qssSessionId:](self, "invocationEndSuccessfullyWithInvocationId:qssSessionId:", v8, v9);
        break;
      case 3:
        objc_msgSend(v4, "invocationEndedError");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationEndWithInvocationId:error:qssSessionId:](self, "invocationEndWithInvocationId:error:qssSessionId:", v8, v19, v9);
        goto LABEL_23;
      case 4:
        objc_msgSend(v4, "invocationCancelledReason");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationCancelWithInvocationId:reason:qssSessionId:](self, "invocationCancelWithInvocationId:reason:qssSessionId:", v8, v19, v9);
        goto LABEL_23;
      case 5:
        objc_msgSend(v4, "translationPayload");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translationLocalePair");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationUserEndedTypingReasonTextBoxDismissedWithInvocationId:payload:localePair:](self, "invocationUserEndedTypingReasonTextBoxDismissedWithInvocationId:payload:localePair:", v8, v19, v20);
        goto LABEL_22;
      case 6:
        objc_msgSend(v4, "translationPayload");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translationLocalePair");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationUserEndedTypingReasonNextButtonPressedWithInvocationId:payload:localePair:](self, "invocationUserEndedTypingReasonNextButtonPressedWithInvocationId:payload:localePair:", v8, v19, v20);
        goto LABEL_22;
      case 7:
        objc_msgSend(v4, "translationPayload");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translationLocalePair");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationUserEndedTypingEndedReasonTimeoutWithInvocationId:payload:localePair:](self, "invocationUserEndedTypingEndedReasonTimeoutWithInvocationId:payload:localePair:", v8, v19, v20);
        goto LABEL_22;
      case 8:
        objc_msgSend(v4, "translationPayload");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translationLocalePair");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationAppBackgroundedWithInvocationId:payload:localePair:](self, "invocationAppBackgroundedWithInvocationId:payload:localePair:", v8, v19, v20);
        goto LABEL_22;
      case 9:
        objc_msgSend(v4, "translationTTSData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v19, "sourceOrTargetLanguage");
        objc_msgSend(v4, "translationTTSData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isAutoplayTranslation");
        objc_msgSend(v4, "translationTTSData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "playbackSpeed");
        objc_msgSend(v4, "translationTTSData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTDSELFLoggingManager invocationTranslationTTSPlayedWithInvocationId:sourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:](self, "invocationTranslationTTSPlayedWithInvocationId:sourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:", v8, v33, v22, v24, objc_msgSend(v25, "audioChannel"));

        goto LABEL_23;
      case 10:
        v26 = objc_alloc(MEMORY[0x24BE95C78]);
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v26, "initWithNSUUID:", v27);

        objc_msgSend(v4, "trustedClientIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v30 = v28;
        }
        else
        {
          objc_msgSend(v4, "untrustedClientIdentifier");
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v20 = v30;

        if (arc4random_uniform(0xAu))
        {

          v20 = CFSTR("redacted-3rd-party-bundle-id");
        }
        -[_LTDSELFLoggingManager _invocationStartTier1WithInvocationId:linkId:appBundleId:](self, "_invocationStartTier1WithInvocationId:linkId:appBundleId:", v8, v19, v20);
LABEL_22:

LABEL_23:
        break;
      default:
        break;
    }

  }
  else
  {
    v18 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[_LTDSELFLoggingManager selfLoggingEventWithData:].cold.1();
  }

}

- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x24BE95C78];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "invocationId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v6, "initWithNSUUID:", v7);

  objc_msgSend(v5, "lowConfidenceLocales");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_ltCompactMap:", &__block_literal_global_13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "inputSource");
  objc_msgSend(v5, "topLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTDSELFLoggingManager invocationLanguageIdentificationCompletedWithInputSource:inputSource:topLocale:lowConfidenceLocales:](self, "invocationLanguageIdentificationCompletedWithInputSource:inputSource:topLocale:lowConfidenceLocales:", v12, v10, v11, v9);
}

- (void)invocationStartWithInvocationId:(id)a3 task:(int64_t)a4 inputMode:(int64_t)a5 invocationType:(int64_t)a6 translateAppContext:(id)a7
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v10 = a7;
  v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_LTDSELFLoggingManager invocationStartWithInvocationId:task:inputMode:invocationType:translateAppContext:].cold.1(v11, v23);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)_endpoints;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "lt_isOnDeviceOnly");
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startWithTask:inputMode:invocationType:interfaceMode:explicitLanguageFilterEnabled:onDevice:mtId:sessionId:translateAppContext:", a4, a5, a6, 0, 0, v18, v23, v19, v10);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

}

- (void)_invocationStartTier1WithInvocationId:(id)a3 linkId:(id)a4 appBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_LTDSELFLoggingManager _invocationStartTier1WithInvocationId:linkId:appBundleId:].cold.1(v11, v8);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (id)_endpoints;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startTier1WithLinkId:appBundleId:mtId:sessionId:", v9, v10, v8, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)invocationEndSuccessfullyWithInvocationId:(id)a3 qssSessionId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LTDSELFLoggingManager invocationEndSuccessfullyWithInvocationId:qssSessionId:].cold.1(v8, v6);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)_endpoints;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endSuccessfullyWithExists:qssSessionId:mtId:sessionId:", 1, v7, v6, v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)invocationEndWithInvocationId:(id)a3 error:(id)a4 qssSessionId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_LTDSELFLoggingManager invocationEndWithInvocationId:error:qssSessionId:].cold.1((uint64_t)v9, v11, v8);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (id)_endpoints;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "endWithError:qssSessionId:mtId:sessionId:", v9, v10, v8, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)invocationCancelWithInvocationId:(id)a3 reason:(id)a4 qssSessionId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_LTDSELFLoggingManager invocationCancelWithInvocationId:reason:qssSessionId:].cold.1((uint64_t)v9, v11, v8);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (id)_endpoints;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cancelWithExists:reason:qssSessionId:mtId:sessionId:", 1, v9, v10, v8, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)invocationUserEndedTypingReasonTextBoxDismissedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly"))
    v12 = 0;
  else
    v12 = v9;
  v13 = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = (id)_endpoints;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userDismissedTextBoxWithPayload:localePair:mtId:sessionId:", v13, v10, v8, v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)invocationUserEndedTypingReasonNextButtonPressedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly"))
    v12 = 0;
  else
    v12 = v9;
  v13 = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = (id)_endpoints;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userPressedNextButtonWithPayload:localePair:mtId:sessionId:", v13, v10, v8, v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)invocationUserEndedTypingEndedReasonTimeoutWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly"))
    v12 = 0;
  else
    v12 = v9;
  v13 = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = (id)_endpoints;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userTimeoutWithPayload:localePair:mtId:sessionId:", v13, v10, v8, v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)invocationAppBackgroundedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly"))
    v12 = 0;
  else
    v12 = v9;
  v13 = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = (id)_endpoints;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appBackgroundedWithPayload:localePair:mtId:sessionId:", v13, v10, v8, v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)invocationTranslationTTSPlayedWithInvocationId:(id)a3 sourceOrTargetLanguage:(int64_t)a4 isAutoplayTranslation:(BOOL)a5 ttsPlaybackSpeed:(int64_t)a6 audioChannel:(int64_t)a7
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v17 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (id)_endpoints;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "translationTTSPlayed:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:mtId:sessionId:", a4, v17, a6, a7, v9, v16);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

}

- (void)invocationLanguageIdentificationCompletedWithInputSource:(id)a3 inputSource:(int64_t)a4 topLocale:(id)a5 lowConfidenceLocales:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)_endpoints;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "languageIdentificationCompletedWithInputSource:topLocale:lowConfidenceLocales:mtId:sessionId:", a4, v11, v12, v10, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

}

- (id)sendFrameworkRequestWithInvocationId:(id)a3 qssSessionId:(id)a4 requestType:(int64_t)a5 requestRoute:(int64_t)a6 requestSize:(unint64_t)a7
{
  id v12;
  id v13;
  _LTDSELFLoggingFrameworkRequest *v14;
  _LTDSELFLoggingFrameworkRequest *v15;
  NSObject *v16;

  v12 = a3;
  v13 = a4;
  if (v12)
  {
    v14 = [_LTDSELFLoggingFrameworkRequest alloc];
    v15 = -[_LTDSELFLoggingFrameworkRequest initWithInvocationId:endpoints:sessionIdProvider:qssSessionId:requestType:requestRoute:requestSize:](v14, "initWithInvocationId:endpoints:sessionIdProvider:qssSessionId:requestType:requestRoute:requestSize:", v12, _endpoints, self->_sessionIdProvider, v13, a5, a6, a7);
  }
  else
  {
    v16 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_LTDSELFLoggingManager sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (void)sendSpeechTranslationFrameworkRequestSentWithInvocationId:(id)a3 qssSessionId:(id)a4 requestRoute:(int64_t)a5 payloadSizeInBytes:(unint64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v21 = v10;
  if (v10)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)_endpoints;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v21);
          -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "frameworkRequestSentWithFrameworkRequestId:qssSessionId:requestType:requestRoute:requestSize:mtId:sessionId:", 0, v11, 2, a5, a6, v17, v18);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

  }
  else
  {
    v19 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_LTDSELFLoggingManager sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:].cold.1();
  }

}

- (_LTDSELFLoggingSessionIdProvider)sessionIdProvider
{
  return self->_sessionIdProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdProvider, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "LTDSELFLoggingManager initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)selfLoggingEventWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Attempt to send SELF logging event without invocation id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)invocationStartWithInvocationId:(void *)a1 task:(void *)a2 inputMode:invocationType:translateAppContext:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4(&dword_2491B9000, v5, v6, "Invocation start with type: %ld and invocationId %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_3();
}

- (void)_invocationStartTier1WithInvocationId:(void *)a1 linkId:(void *)a2 appBundleId:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v5, v6, "Invocation start tier 1 with invocationId: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)invocationEndSuccessfullyWithInvocationId:(void *)a1 qssSessionId:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v5, v6, "Invocation end successfully for invocationId %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)invocationEndWithInvocationId:(uint64_t)a1 error:(void *)a2 qssSessionId:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(a3, "formattedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4(&dword_2491B9000, v6, v7, "Invocation end with error (%@) for invocationId %{public}@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_3();
}

- (void)invocationCancelWithInvocationId:(uint64_t)a1 reason:(void *)a2 qssSessionId:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(a3, "formattedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4(&dword_2491B9000, v6, v7, "Invocation cancelled with reason (%@) for invocationId %{public}@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_3();
}

- (void)sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Attempt to send SELF logging framework request events without invocation id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Attempt to send SELF logging framework request sent event without invocation id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
