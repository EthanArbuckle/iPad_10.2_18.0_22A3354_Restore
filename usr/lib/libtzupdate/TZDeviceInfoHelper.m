@implementation TZDeviceInfoHelper

+ (id)icuVersion
{
  uint64_t v2;
  const char *v3;
  UErrorCode v5;

  v5 = U_ZERO_ERROR;
  v2 = MEMORY[0x1DF0B9DE8](&v5, a2);
  if (v5 < U_ILLEGAL_ARGUMENT_ERROR)
  {
    if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 1))
      NSLog(CFSTR("%s  TZ version as reported by ICU: %s"), "+[TZDeviceInfoHelper icuVersion]", v2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    {
      v3 = u_errorName(v5);
      NSLog(CFSTR("%s  Encountered error: %s"), "+[TZDeviceInfoHelper icuVersion]", v3);
    }
    return &stru_1EA3F4C88;
  }
}

+ (id)zoneinfoVersion
{
  void *v2;
  void *v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/db/timezone/zoneinfo/+VERSION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  +[TZUtilities stringWithContentsOfFileAtURL:error:](TZUtilities, "stringWithContentsOfFileAtURL:error:", v2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    NSLog(CFSTR("%s  Cannot get zoneinfo version: %@"), "+[TZDeviceInfoHelper zoneinfoVersion]", 0);

  return v3;
}

@end
