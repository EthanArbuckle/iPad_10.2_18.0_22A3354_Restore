@implementation UIAnalyticsTouchesSession

id __43___UIAnalyticsTouchesSession_processEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD v12[3];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _uiMultitouchAnalyticsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218498;
    v14 = v8;
    v15 = 2080;
    v16 = v9;
    v17 = 2048;
    v18 = v10;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Analytics session %p: Sending combined data point: type: %s, duration: %llu ms", buf, 0x20u);
  }

  v11[0] = CFSTR("bundleID");
  _UIMainBundleIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64), CFSTR("bundleID"), CFSTR("touchDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
