@implementation _LTDSELFLoggingProduction

+ (void)_sendEventWithContext:(id)a3 mtId:(id)a4 sessionId:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v7 = (objc_class *)MEMORY[0x24BE95208];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setEventMetadata:", v12);
  objc_msgSend(v11, "setInvocationContext:", v10);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultMessageStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ltd_safeUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "emitMessage:isolatedStreamUUID:", v11, v15);
  v16 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction _sendEventWithContext:mtId:sessionId:].cold.1(v16);

}

+ (void)startWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 interfaceMode:(int64_t)a6 explicitLanguageFilterEnabled:(BOOL)a7 onDevice:(BOOL)a8 mtId:(id)a9 sessionId:(id)a10 translateAppContext:(id)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v11 = a8;
  v12 = a7;
  v17 = (objc_class *)MEMORY[0x24BE95230];
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v22 = objc_alloc_init(v17);
  objc_msgSend(MEMORY[0x24BE95248], "lt_initWithTask:inputMode:invocationType:explicitLanguageFilterEnabled:onDevice:translateAppContext:", a3, a4, a5, v12, v11, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setStartedOrChanged:", v21);
  objc_msgSend(a1, "_sendEventWithContext:mtId:sessionId:", v22, v20, v19);

}

+ (void)startTier1WithLinkId:(id)a3 appBundleId:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v9 = (objc_class *)MEMORY[0x24BE95208];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(MEMORY[0x24BE95250], "lt_initWithLinkId:appBundleId:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setInvocationStartedTier1:", v16);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultMessageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ltd_safeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "emitMessage:isolatedStreamUUID:", v14, v19);
  v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction startTier1WithLinkId:appBundleId:mtId:sessionId:].cold.1(v20);

}

+ (void)endSuccessfullyWithExists:(BOOL)a3 qssSessionId:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  _BOOL8 v8;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = a3;
  v10 = (objc_class *)MEMORY[0x24BE95230];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v15 = objc_alloc_init(v10);
  objc_msgSend(MEMORY[0x24BE95238], "lt_initWithExists:qssSessionId:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setEnded:", v14);
  objc_msgSend(a1, "_sendEventWithContext:mtId:sessionId:", v15, v12, v11);

}

+ (void)endWithError:(id)a3 qssSessionId:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v10 = (objc_class *)MEMORY[0x24BE95230];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v16 = objc_alloc_init(v10);
  objc_msgSend(MEMORY[0x24BE95240], "lt_initWithWithError:qssSessionId:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFailed:", v15);
  objc_msgSend(a1, "_sendEventWithContext:mtId:sessionId:", v16, v12, v11);

}

+ (void)cancelWithExists:(BOOL)a3 reason:(id)a4 qssSessionId:(id)a5 mtId:(id)a6 sessionId:(id)a7
{
  _BOOL8 v10;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v10 = a3;
  v12 = (objc_class *)MEMORY[0x24BE95230];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v18 = objc_alloc_init(v12);
  objc_msgSend(MEMORY[0x24BE95228], "lt_initWithExists:reason:qssSessionId:", v10, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setCancelled:", v17);
  objc_msgSend(a1, "_sendEventWithContext:mtId:sessionId:", v18, v14, v13);

}

+ (void)userDismissedTextBoxWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v9 = (objc_class *)MEMORY[0x24BE95208];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(MEMORY[0x24BE951F0], "lt_initWithPayload:localePair:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAppTextBoxDismissed:", v16);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultMessageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ltd_safeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "emitMessage:isolatedStreamUUID:", v14, v19);
  v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction userDismissedTextBoxWithPayload:localePair:mtId:sessionId:].cold.1(v20);

}

+ (void)userPressedNextButtonWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v9 = (objc_class *)MEMORY[0x24BE95208];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(MEMORY[0x24BE951E8], "lt_initWithPayload:localePair:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAppNextButtonTapped:", v16);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultMessageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ltd_safeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "emitMessage:isolatedStreamUUID:", v14, v19);
  v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction userPressedNextButtonWithPayload:localePair:mtId:sessionId:].cold.1(v20);

}

+ (void)userTimeoutWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v9 = (objc_class *)MEMORY[0x24BE95208];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(MEMORY[0x24BE951F8], "lt_initWithPayload:localePair:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAppTimedOut:", v16);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultMessageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ltd_safeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "emitMessage:isolatedStreamUUID:", v14, v19);
  v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction userTimeoutWithPayload:localePair:mtId:sessionId:].cold.1(v20);

}

+ (void)appBackgroundedWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v9 = (objc_class *)MEMORY[0x24BE95208];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(MEMORY[0x24BE951D8], "lt_initWithPayload:localePair:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAppBackgrounded:", v16);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultMessageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ltd_safeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "emitMessage:isolatedStreamUUID:", v14, v19);
  v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction appBackgroundedWithPayload:localePair:mtId:sessionId:].cold.1(v20);

}

+ (void)translationTTSPlayed:(int64_t)a3 isAutoplayTranslation:(BOOL)a4 ttsPlaybackSpeed:(int64_t)a5 audioChannel:(int64_t)a6 mtId:(id)a7 sessionId:(id)a8
{
  _BOOL8 v11;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;

  v11 = a4;
  v13 = (objc_class *)MEMORY[0x24BE95208];
  v14 = a8;
  v15 = a7;
  v16 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v15, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setEventMetadata:", v17);
  objc_msgSend(MEMORY[0x24BE95270], "lt_initWithSourceOrTargetLanguage:isAutoplayTranslation:playbackSpeed:audioChannel:", a3, v11, a5, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslationTTSPlayed:", v18);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultMessageStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ltd_safeUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "emitMessage:isolatedStreamUUID:", v16, v21);
  v22 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction translationTTSPlayed:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:mtId:sessionId:].cold.1(v22);

}

+ (void)languageIdentificationCompletedWithInputSource:(int64_t)a3 topLocale:(id)a4 lowConfidenceLocales:(id)a5 mtId:(id)a6 sessionId:(id)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;

  v11 = (objc_class *)MEMORY[0x24BE95208];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setEventMetadata:", v17);
  objc_msgSend(MEMORY[0x24BE95258], "lt_initWithInputSource:topLocale:lowConfidenceLocales:", a3, v15, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setLanguageIdentificationCompleted:", v18);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultMessageStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ltd_safeUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "emitMessage:isolatedStreamUUID:", v16, v21);
  v22 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction languageIdentificationCompletedWithInputSource:topLocale:lowConfidenceLocales:mtId:sessionId:].cold.1(v22);

}

+ (void)frameworkRequestSentWithFrameworkRequestId:(id)a3 qssSessionId:(id)a4 requestType:(int64_t)a5 requestRoute:(int64_t)a6 requestSize:(unint64_t)a7 mtId:(id)a8 sessionId:(id)a9
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;

  v15 = (objc_class *)MEMORY[0x24BE95208];
  v16 = a9;
  v17 = a8;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(v15);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v17, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setEventMetadata:", v21);
  objc_msgSend(MEMORY[0x24BE95220], "lt_initWithFrameworkRequestId:qssSessionId:requestType:requestRoute:requestSize:", v19, v18, a5, a6, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setFrameworkRequestSent:", v22);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "defaultMessageStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ltd_safeUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "emitMessage:isolatedStreamUUID:", v20, v25);
  v26 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction frameworkRequestSentWithFrameworkRequestId:qssSessionId:requestType:requestRoute:requestSize:mtId:sessionId:].cold.1(v26);

}

+ (void)frameworkRequestResponseReceivedWithFrameworkRequestId:(id)a3 requestRoute:(int64_t)a4 mtId:(id)a5 sessionId:(id)a6 numberOfSentences:(unint64_t)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v11 = (objc_class *)MEMORY[0x24BE95208];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x24BE95200], "lt_initWithMtId:sessionId:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setEventMetadata:", v16);
  objc_msgSend(MEMORY[0x24BE95218], "lt_initWithFrameworkRequestId:requestRoute:numberOfSentences:", v14, a4, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFrameworkRequestResponseReceived:", v17);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultMessageStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ltd_safeUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "emitMessage:isolatedStreamUUID:", v15, v20);
  v21 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    +[_LTDSELFLoggingProduction frameworkRequestResponseReceivedWithFrameworkRequestId:requestRoute:mtId:sessionId:numberOfSentences:].cold.1(v21);

}

+ (void)_sendEventWithContext:(void *)a1 mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation context event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)startTier1WithLinkId:(void *)a1 appBundleId:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation startedTier1 event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)userDismissedTextBoxWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation appTextBoxDismissed event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)userPressedNextButtonWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation appNextButtonTapped event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)userTimeoutWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation appTimedOut event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)appBackgroundedWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation appBackgrounded event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)translationTTSPlayed:(void *)a1 isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation translationTTSPlayed request sent event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)languageIdentificationCompletedWithInputSource:(void *)a1 topLocale:lowConfidenceLocales:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation languageIdentificationCompleted event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)frameworkRequestSentWithFrameworkRequestId:(void *)a1 qssSessionId:requestType:requestRoute:requestSize:mtId:sessionId:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation framework request sent event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

+ (void)frameworkRequestResponseReceivedWithFrameworkRequestId:(void *)a1 requestRoute:mtId:sessionId:numberOfSentences:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "[Production] Invocation framework request response received event sent %{sensitive}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

@end
