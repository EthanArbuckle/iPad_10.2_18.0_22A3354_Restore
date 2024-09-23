@implementation RCPCoreAnalyticsBackedAnalyticsEventSender

- (void)sendEvent:(int64_t)a3
{
  NSObject *v3;
  uint8_t buf[16];

  RCPLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5E84000, v3, OS_LOG_TYPE_DEFAULT, "sent analytics event", buf, 2u);
  }

  AnalyticsSendEventLazy();
}

id __56__RCPCoreAnalyticsBackedAnalyticsEventSender_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const __CFString **v3;
  const __CFString **v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 == 1)
  {
    v7 = CFSTR("state");
    v8 = CFSTR("playbackFinished");
    v2 = (void *)MEMORY[0x1E0C99D80];
    v3 = &v8;
    v4 = &v7;
  }
  else
  {
    if (v1)
    {
      v5 = 0;
      return v5;
    }
    v9 = CFSTR("state");
    v10[0] = CFSTR("recordingFinished");
    v2 = (void *)MEMORY[0x1E0C99D80];
    v3 = (const __CFString **)v10;
    v4 = &v9;
  }
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end
