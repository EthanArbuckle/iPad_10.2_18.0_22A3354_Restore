@implementation PKSharedCacheSetObjectForKey

void __PKSharedCacheSetObjectForKey_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v7;
  uint8_t v8[16];

  _SharedCacheDictionary(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (_CanWriteToSharedCacheDirectory()
    && (_SharedCacheDictionary(0),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        _SharedCacheFilePath(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "writeToFile:atomically:", v4, 1),
        v4,
        v3,
        v5))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.passkit.sharedcachechanged"), 0, 0, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Write Access to PassKit Shared Cache denied. Please verify sandbox exceptions and/or file a Radar.", v8, 2u);
    }

  }
}

@end
