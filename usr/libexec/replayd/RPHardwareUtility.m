@implementation RPHardwareUtility

+ (BOOL)isNativeScreenOrientationPortrait
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  float valuePtr;

  v2 = (const __CFNumber *)MGCopyAnswer(CFSTR("main-screen-orientation"), 0);
  valuePtr = 0.0;
  if (!v2)
    return 1;
  v3 = v2;
  CFNumberGetValue(v2, kCFNumberFloat32Type, &valuePtr);
  CFRelease(v3);
  return valuePtr == 0.0;
}

+ (BOOL)isIPad
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  int Value;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("ipad"), 0);
  if (v2)
  {
    v3 = v2;
    Value = CFBooleanGetValue(v2);
    CFRelease(v3);
    LOBYTE(v2) = Value == 1;
  }
  return (char)v2;
}

+ (unint64_t)chipId
{
  return MGGetSInt64Answer(CFSTR("ChipID"), 0);
}

+ (BOOL)supportsShutterSound
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("RegionalBehaviorShutterClick"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFBooleanGetValue(v2) != 0;
  CFRelease(v3);
  return v4;
}

+ (BOOL)isVoiceOverRunning
{
  return _AXSVoiceOverTouchEnabled(a1, a2) != 0;
}

+ (CGSize)limitRecordingWindowSizeFromSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446978;
    v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
    v15 = 1024;
    v16 = 83;
    v17 = 2048;
    v18 = width;
    v19 = 2048;
    v20 = height;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Requested window size width:%lf x height:%lf", (uint8_t *)&v13, 0x26u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("RPFullResCapture")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136446978;
      v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
      v15 = 1024;
      v16 = 90;
      v17 = 2048;
      v18 = width;
      v19 = 2048;
      v20 = height;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d full window size enabled with width %.1f x height:%.1f", (uint8_t *)&v13, 0x26u);
    }
  }
  else
  {
    v9 = 1920;
    if (+[RPHardwareUtility isIPad](RPHardwareUtility, "isIPad"))
    {
      if (objc_msgSend(a1, "chipId") == (id)35168)
        v9 = 1600;
      else
        v9 = 1920;
    }
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136447234;
      v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
      v15 = 1024;
      v16 = 101;
      v17 = 2048;
      v18 = width;
      v19 = 2048;
      v20 = height;
      v21 = 1024;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d checking window size width %.1f x height:%.1f against max size %d", (uint8_t *)&v13, 0x2Cu);
    }
    v10 = (double)v9;
    if (height > (double)v9)
    {
      width = width * (v10 / height);
      height = (double)v9;
    }
    if (width <= v10)
      v10 = width;
    else
      height = height * (v10 / width);
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136446978;
      v14 = "+[RPHardwareUtility limitRecordingWindowSizeFromSize:]";
      v15 = 1024;
      v16 = 110;
      v17 = 2048;
      v18 = v10;
      v19 = 2048;
      v20 = height;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d limit window size to width %.1f x height:%.1f", (uint8_t *)&v13, 0x26u);
    }
    width = v10;
  }

  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (BOOL)isCompositionAvailable
{
  return +[RPHardwareUtility isAppleSiliconMac](RPHardwareUtility, "isAppleSiliconMac");
}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

@end
