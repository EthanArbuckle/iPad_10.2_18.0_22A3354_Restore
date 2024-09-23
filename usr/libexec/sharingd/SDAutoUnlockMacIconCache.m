@implementation SDAutoUnlockMacIconCache

- (id)iconImageDataForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  int v12;
  CFTypeID v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  int v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockMacIconCache _userDefaultsKeyForHash:](self, "_userDefaultsKeyForHash:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));
  if (v7)
  {
    v8 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v19 = 0;
      TypeID = CFDataGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("AutoUnlockImageData"), TypeID, &v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
      v12 = v19;
      if (v19)
      {
        if (dword_1007B36B8 <= 90)
        {
          if (dword_1007B36B8 == -1)
          {
            if (!_LogCategory_Initialize(&dword_1007B36B8, 90))
              goto LABEL_26;
            v12 = v19;
          }
          LogPrintF(&dword_1007B36B8, "-[SDAutoUnlockMacIconCache iconImageDataForHash:]", 90, "### Error getting image data: %x", v12);
        }
LABEL_26:
        v17 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v13 = CFStringGetTypeID();
      v14 = CFDictionaryGetTypedValue(v7, CFSTR("AutoUnlockAppName"), v13, &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = v19;
      if (!v19)
      {
        if (dword_1007B36B8 <= 50
          && (dword_1007B36B8 != -1 || _LogCategory_Initialize(&dword_1007B36B8, 50)))
        {
          LogPrintF(&dword_1007B36B8, "-[SDAutoUnlockMacIconCache iconImageDataForHash:]", 50, "Found cached image: %ld bytes, hash: %@, app: %@", objc_msgSend(v11, "length"), v4, v15);
        }
        v17 = v11;
        goto LABEL_31;
      }
      if (dword_1007B36B8 <= 90)
      {
        if (dword_1007B36B8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_1007B36B8, 90))
            goto LABEL_28;
          v16 = v19;
        }
        LogPrintF(&dword_1007B36B8, "-[SDAutoUnlockMacIconCache iconImageDataForHash:]", 90, "### Error getting image data: %x", v16);
      }
LABEL_28:
      v17 = 0;
LABEL_31:

      goto LABEL_32;
    }
    if (dword_1007B36B8 <= 90
      && (dword_1007B36B8 != -1 || _LogCategory_Initialize(&dword_1007B36B8, 90)))
    {
      LogPrintF(&dword_1007B36B8, "-[SDAutoUnlockMacIconCache iconImageDataForHash:]", 90, "### Icon cache isn't a dictionary");
    }
  }
  else if (dword_1007B36B8 <= 50
         && (dword_1007B36B8 != -1 || _LogCategory_Initialize(&dword_1007B36B8, 50)))
  {
    LogPrintF(&dword_1007B36B8, "-[SDAutoUnlockMacIconCache iconImageDataForHash:]", 50, "No icon cache for hash: %@", v4);
  }
  v17 = 0;
LABEL_33:

  return v17;
}

- (void)cacheIconImageData:(id)a3 hash:(id)a4 appName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockMacIconCache _userDefaultsKeyForHash:](self, "_userDefaultsKeyForHash:", v9));
  v14[0] = CFSTR("AutoUnlockImageData");
  v14[1] = CFSTR("AutoUnlockAppName");
  v15[0] = v8;
  v15[1] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v13, "setObject:forKey:", v12, v11);
  objc_msgSend(v13, "synchronize");
  if (dword_1007B36B8 <= 90 && (dword_1007B36B8 != -1 || _LogCategory_Initialize(&dword_1007B36B8, 90)))
    LogPrintF(&dword_1007B36B8, "-[SDAutoUnlockMacIconCache cacheIconImageData:hash:appName:]", 90, "Cached image: %ld bytes, hash: %@, app: %@", objc_msgSend(v8, "length"), v9, v10);

}

- (id)_userDefaultsKeyForHash:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = SFHexStringForData(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AUIconCacheItem"), v4));

  return v5;
}

@end
