@implementation CACSignPostLog

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  return (id)sharedInstance_sSharedInstance;
}

void __32__CACSignPostLog_sharedInstance__block_invoke()
{
  CACSignPostLog *v0;
  void *v1;

  v0 = objc_alloc_init(CACSignPostLog);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

+ (id)sharedLog
{
  if (sharedLog_onceToken != -1)
    dispatch_once(&sharedLog_onceToken, &__block_literal_global_1);
  return (id)sharedLog_signpostLog;
}

void __27__CACSignPostLog_sharedLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "SignPosts");
  v1 = (void *)sharedLog_signpostLog;
  sharedLog_signpostLog = (uint64_t)v0;

}

+ (id)_sFetchElementsLog
{
  if (_sFetchElementsLog_onceToken != -1)
    dispatch_once(&_sFetchElementsLog_onceToken, &__block_literal_global_3);
  return (id)_sFetchElementsLog_signpostLog;
}

void __36__CACSignPostLog__sFetchElementsLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "FetchElements");
  v1 = (void *)_sFetchElementsLog_signpostLog;
  _sFetchElementsLog_signpostLog = (uint64_t)v0;

}

+ (void)FetchElementsEventBeganWithReason:(id)a3 expectedDelay:(double)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CACSignPostLog _sFetchElementsLog](CACSignPostLog, "_sFetchElementsLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  +[CACSignPostLog _sFetchElementsLog](CACSignPostLog, "_sFetchElementsLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2048;
    v14 = a4;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchElements", "Requesting elements refreshed with reason %@; expected delay: %f",
      (uint8_t *)&v11,
      0x16u);
  }

  CACLogElementCollection();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_229A40000, v10, OS_LOG_TYPE_INFO, "FetchElements: Requesting elements refreshed with reason %@; expected delay: %f",
      (uint8_t *)&v11,
      0x16u);
  }

}

+ (void)FetchElementsEventCompletedWithNumberOfElements:(unint64_t)a3 numberOfElementsAlreadyCached:(unint64_t)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[CACSignPostLog _sFetchElementsLog](CACSignPostLog, "_sFetchElementsLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  +[CACSignPostLog _sFetchElementsLog](CACSignPostLog, "_sFetchElementsLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v10 = 134218240;
    v11 = a3;
    v12 = 2048;
    v13 = a4;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v9, OS_SIGNPOST_INTERVAL_END, v7, "FetchElements", "%lu elements fetched; %lu elements already cached",
      (uint8_t *)&v10,
      0x16u);
  }

}

+ (void)CommandStringReceived:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CACSignPostLog sharedLog](CACSignPostLog, "sharedLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = 138412290;
    v6 = v3;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandStringReceived", "Starting to execute command with identifier %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)CommandStringExecuted:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  id v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CACSignPostLog sharedLog](CACSignPostLog, "sharedLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandStringExecuted", "Finished executing command with identifier %@; success: %@",
      (uint8_t *)&v8,
      0x16u);
  }

}

- (unint64_t)currentPerfID
{
  return self->_currentPerfID;
}

- (void)setCurrentPerfID:(unint64_t)a3
{
  self->_currentPerfID = a3;
}

@end
