@implementation NSHTTPURLResponse(ISAdditions)

- (uint64_t)_getCacheControlMaxAge:()ISAdditions
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  result = objc_msgSend(a1, "_iTunesStore_valueForHTTPHeader:", CFSTR("Cache-Control"));
  if (result)
  {
    v5 = (void *)result;
    v6 = objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v11), "stringByTrimmingCharactersInSet:", v6), "componentsSeparatedByString:", CFSTR("="));
        if (objc_msgSend(v13, "count") == 2)
        {
          if (objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 0), "hasPrefix:", CFSTR("max-age")))
          {
            v10 = 1;
            objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "doubleValue");
            v12 = v14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
    }
    else
    {
      v10 = 0;
      v12 = 0;
    }
    result = v10 & 1;
    if (a3)
      goto LABEL_13;
  }
  else
  {
    v12 = 0;
    if (a3)
LABEL_13:
      *a3 = v12;
  }
  return result;
}

- (uint64_t)_iTunesStore_valueForHTTPHeader:()ISAdditions
{
  void *v4;
  uint64_t result;

  v4 = (void *)objc_msgSend(a1, "allHeaderFields");
  result = objc_msgSend(v4, "objectForKey:", a3);
  if (!result)
    return objc_msgSend(v4, "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  return result;
}

- (uint64_t)_dateFromExpires
{
  uint64_t result;

  result = objc_msgSend(a1, "_iTunesStore_valueForHTTPHeader:", CFSTR("Expires"));
  if (result)
    return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithNaturalLanguageString:", result);
  return result;
}

- (uint64_t)itunes_expirationDate
{
  double v1;

  objc_msgSend(a1, "itunes_expirationInterval");
  if (v1 <= 0.00000011920929)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:");
}

- (double)expirationInterval
{
  NSObject *v2;
  double result;
  void *v4;
  double v5;

  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig"), "OSLogObject");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[NSHTTPURLResponse(ISAdditions) expirationInterval].cold.1(v2);
  v5 = -1.0;
  if (objc_msgSend(a1, "_getCacheControlMaxAge:", &v5))
    return v5;
  v4 = (void *)objc_msgSend(a1, "_dateFromExpires");
  if (!v4)
    return -1.0;
  objc_msgSend(v4, "timeIntervalSinceNow");
  return result;
}

- (double)itunes_expirationInterval
{
  double result;
  void *v3;
  double v4;

  v4 = -1.0;
  if (objc_msgSend(a1, "_getCacheControlMaxAge:", &v4))
    return v4;
  v3 = (void *)objc_msgSend(a1, "_dateFromExpires");
  if (!v3)
    return -1.0;
  objc_msgSend(v3, "timeIntervalSinceNow");
  return result;
}

- (unint64_t)itunes_maxExpectedContentLength
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "expectedContentLength");
  if (objc_msgSend(a1, "statusCode") == 206
    && (v3 = (void *)objc_msgSend(a1, "_iTunesStore_valueForHTTPHeader:", CFSTR("Content-Range"))) != 0)
  {
    return strtoull((const char *)objc_msgSend((id)objc_msgSend(v3, "lastPathComponent"), "UTF8String"), 0, 10);
  }
  else
  {
    return v2;
  }
}

- (void)expirationInterval
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B729000, log, OS_LOG_TYPE_FAULT, "Detected call to deprecated method for NSHTTPURLResponse_ISAdditions.m expirationInterval", v1, 2u);
}

@end
