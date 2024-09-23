@implementation ICQError

+ (id)retryErrorWithRetryAfter:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:retryAfter:", 16, a3);
}

+ (id)serviceUnavailableWithRetryAfter:(id)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:retryAfter:", 17, a3);
}

+ (id)clientErrorWithStatusCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:statusCode:", 21, a3);
}

+ (id)_errorWithCode:(int64_t)a3 retryAfter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a1, "_retryAfterDelayFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_retryAfterDateFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("retryAfterDelay"));
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("retryAfterDate"));
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.quota"), a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_retryAfterDelayFromString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB37F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNumberStyle:", 1);
  objc_msgSend(v5, "numberFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_retryAfterDateFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_formatterForHTTPDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_formatterForHTTPDate
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(v2, "setDateFormat:", CFSTR("E, dd MMM yyyy HH:mm:ss 'GMT'"));
  return v2;
}

+ (id)_errorWithCode:(int64_t)a3 statusCode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("statusCode"));

  }
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.quota"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
