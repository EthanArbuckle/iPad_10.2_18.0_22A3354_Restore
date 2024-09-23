@implementation DMDMDMUtilities

+ (id)iTunesAccountHashForUniqueIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = a3;
    v4 = MCUSEnglishNumberFormatter();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromNumber:", v3));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dmd_sha1Hash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (BOOL)setSkipBackupAttribute:(BOOL)a3 toItemAtPath:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v17;
  id v18;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")),
        v9 = objc_msgSend(v7, "fileExistsAtPath:", v8),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v18 = 0;
    v10 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v18, NSURLIsExcludedFromBackupKey, 0);
    v11 = v18;
    v12 = v11;
    if (v10 && objc_msgSend(v11, "BOOLValue") == v4)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
      v17 = 0;
      v14 = objc_msgSend(v6, "setResourceValue:forKey:error:", v13, NSURLIsExcludedFromBackupKey, &v17);
      v15 = v17;

      if ((!v14 || v15) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100077B50(v6, (uint64_t)v15);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100077AD4((uint64_t)v5);
    LOBYTE(v14) = 0;
  }

  return v14;
}

@end
