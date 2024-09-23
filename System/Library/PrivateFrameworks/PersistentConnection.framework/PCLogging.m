@implementation PCLogging

+ (id)logFileDirectory
{
  if (logFileDirectory_pred != -1)
    dispatch_once(&logFileDirectory_pred, &__block_literal_global_17);
  return (id)logFileDirectory_directory;
}

void __29__PCLogging_logFileDirectory__block_invoke()
{
  const __CFBoolean *v0;
  int Value;
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  Value = CFBooleanGetValue(v0);
  CFRelease(v0);
  if (Value)
    v2 = CFSTR("Logs/PersistentConnection");
  else
    v2 = CFSTR("Logs/CrashReporter/PersistentConnection");
  objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", CFSTR("Library"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)logFileDirectory_directory;
  logFileDirectory_directory = v3;

}

@end
