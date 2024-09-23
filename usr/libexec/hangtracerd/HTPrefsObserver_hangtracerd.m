@implementation HTPrefsObserver_hangtracerd

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  _DWORD v20[2];
  __int16 v21;
  unsigned int v22;

  v8 = a5;
  if (off_10005F578 == a6)
  {
    v9 = a3;
    v10 = NSStringFromSelector("memoryLoggingIntervalSec");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
      v14 = objc_msgSend(v13, "unsignedIntValue");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
      v16 = objc_msgSend(v15, "unsignedIntValue");

      if (v14 != v16)
      {
        sub_10000A008();
        v17 = sub_100024FF4();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
          v20[0] = 67109376;
          v20[1] = v14;
          v21 = 1024;
          v22 = objc_msgSend(v19, "memoryLoggingIntervalSec");
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "memoryLoggingInterval changed %u -> %u", (uint8_t *)v20, 0xEu);

        }
      }
    }
  }

}

@end
