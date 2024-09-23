@implementation PKDateFromRetryAfterHeader

void ___PKDateFromRetryAfterHeader_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_294;
  _MergedGlobals_294 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_294, "setLocale:", v4);
  objc_msgSend((id)_MergedGlobals_294, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"));
  v2 = (void *)_MergedGlobals_294;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

@end
