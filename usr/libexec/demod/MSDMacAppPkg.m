@implementation MSDMacAppPkg

+ (BOOL)isMacApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  BOOL v19;
  id v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];

  v3 = a3;
  v27 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v3));
  v5 = v4;
  if (!v4)
  {
    v20 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BBF90();
    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoDictionary"));

  if (!v6)
  {
    v21 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BC000();
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoDictionary"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("CFBundleSupportedPlatforms")));

  if (v8)
  {
    v10 = objc_opt_class(NSArray, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v8;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR("MacOSX"), (_QWORD)v23) & 1) != 0)
            {

              v19 = 1;
              v8 = v11;
              goto LABEL_23;
            }
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", (_QWORD)v23));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Contents/MacOS")));
  v18 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v17, &v27);
  if (v27)
    v19 = v18;
  else
    v19 = 0;

LABEL_23:
  return v19;
}

+ (id)codeSignaturePath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Contents")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("_CodeSignature")));

  return v4;
}

@end
