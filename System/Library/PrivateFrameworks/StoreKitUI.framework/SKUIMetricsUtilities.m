@implementation SKUIMetricsUtilities

+ (BOOL)showEventNotifications
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUIMetricsUtilities showEventNotifications].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (showEventNotifications_onceToken != -1)
    dispatch_once(&showEventNotifications_onceToken, &__block_literal_global_15);
  return showEventNotifications_showEventNotifications;
}

uint64_t __46__SKUIMetricsUtilities_showEventNotifications__block_invoke()
{
  int AppBooleanValue;
  uint64_t result;
  char v2;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SKUIMetricsShowEventNotifications"), (CFStringRef)*MEMORY[0x1E0DAFE10], 0);
  result = MGGetBoolAnswer();
  if (AppBooleanValue)
    v2 = result;
  else
    v2 = 0;
  showEventNotifications_showEventNotifications = v2;
  return result;
}

+ (BOOL)trackAllEvents
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUIMetricsUtilities trackAllEvents].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (trackAllEvents_onceToken != -1)
    dispatch_once(&trackAllEvents_onceToken, &__block_literal_global_7_0);
  return trackAllEvents_trackAllEvents;
}

uint64_t __38__SKUIMetricsUtilities_trackAllEvents__block_invoke()
{
  int AppBooleanValue;
  uint64_t result;
  char v2;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SKUIMetricsTrackAll"), (CFStringRef)*MEMORY[0x1E0DAFE10], 0);
  result = MGGetBoolAnswer();
  if (AppBooleanValue)
    v2 = result;
  else
    v2 = 0;
  trackAllEvents_trackAllEvents = v2;
  return result;
}

+ (BOOL)shouldLogTimingMetrics
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUIMetricsUtilities shouldLogTimingMetrics].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return SSDebugShouldLogNetworkTimingMetrics();
}

+ (double)timeIntervalFromJSTime:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        +[SKUIMetricsUtilities timeIntervalFromJSTime:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "doubleValue");
  v13 = v12 / 1000.0;

  return v13;
}

+ (id)jsTimeFromTimeInterval:(double)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        +[SKUIMetricsUtilities jsTimeFromTimeInterval:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(a3 * 1000.0));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newErrorPageEvent
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIMetricsUtilities newErrorPageEvent].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_alloc_init(MEMORY[0x1E0DAF5A8]);
  objc_msgSend(v10, "setPageDescription:", CFSTR("Error"));
  return v10;
}

+ (id)newErrorRetryClickEvent
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIMetricsUtilities newErrorRetryClickEvent].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_alloc_init(MEMORY[0x1E0DAF560]);
  objc_msgSend(v10, "setPageDescription:", CFSTR("Error"));
  objc_msgSend(v10, "setActionType:", CFSTR("retry"));
  objc_msgSend(v10, "setTargetType:", *MEMORY[0x1E0DAFC90]);
  return v10;
}

+ (void)showEventNotifications
{
  OUTLINED_FUNCTION_1();
}

+ (void)trackAllEvents
{
  OUTLINED_FUNCTION_1();
}

+ (void)shouldLogTimingMetrics
{
  OUTLINED_FUNCTION_1();
}

+ (void)timeIntervalFromJSTime:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)jsTimeFromTimeInterval:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)newErrorPageEvent
{
  OUTLINED_FUNCTION_1();
}

+ (void)newErrorRetryClickEvent
{
  OUTLINED_FUNCTION_1();
}

@end
