@implementation NSDate(ICQDaemon)

- (id)icq_serverFriendlyString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  objc_msgSend(v3, "setLocale:", v2);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(v3, "stringFromDate:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
