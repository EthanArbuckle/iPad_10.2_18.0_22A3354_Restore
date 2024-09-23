@implementation MFMailDeviceStorage

- (int64_t)freeSpaceGuidanceForSpaceIncrease:(int64_t)a3 urgency:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  int64_t v9;

  v6 = MFMailDirectoryURL(self, a2);
  if ((unint64_t)(a4 - 1) < 3)
    a4 = a4;
  else
    a4 = 0xFFFFFFFFLL;
  v7 = (void *)CacheDeleteRequestCacheableSpaceGuidance(CFSTR("com.apple.mobilemail.CacheDelete"), v6, a4, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_GUIDANCE")));
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CACHE_DELETE_GUIDANCE_CAN_EXPAND_CACHE")) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CACHE_DELETE_GUIDANCE_WILL_EVICT_LOWER_PRIORITY")) & 1) != 0)
  {
    v9 = 1;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE")))
  {
    v9 = 2;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

@end
