@implementation NSString

+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v30 = v3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v32;
    *(_QWORD *)&v7 = 138543618;
    v28 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isSystemContainerPath", v28))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getSystemContainerKeyword"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v12));

          if (v13)
            goto LABEL_12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lookupSystemContainerPathUUID"));
          v14 = sub_100024A40();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getSystemContainerKeyword"));
              *(_DWORD *)buf = v28;
              v36 = v17;
              v37 = 2114;
              v38 = v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "System container path mapping created: %{public}@ -> %{public}@", buf, 0x16u);

            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getSystemContainerKeyword"));
            objc_msgSend(v4, "setObject:forKey:", v13, v18);

LABEL_12:
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getSystemContainerKeyword"));
            v20 = objc_msgSend(v11, "rangeOfString:", v19);
            v22 = v21;

            if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v23 = sub_100024A40();
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v36 = v11;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Cannot locate system container path identifier in path '%{public}@'. Skipping...", buf, 0xCu);
              }

            }
            else
            {
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", v20, v22, v13));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v11));
              objc_msgSend(v29, "setObject:forKey:", v26, v25);

              v13 = (void *)v25;
            }
          }
          else
          {
            if (v16)
            {
              *(_DWORD *)buf = 138543362;
              v36 = v11;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cannot lookup system container path UUID from path '%{public}@'. Skipping...", buf, 0xCu);
            }
            v13 = v15;
          }

          continue;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v8);
  }

  return v29;
}

- (NSString)getSystemContainerKeyword
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", 5));

  return (NSString *)v3;
}

- (BOOL)isSystemContainerPath
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
  v5 = 0;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("/var/containers/Data/System")) & 1) != 0
    || objc_msgSend(v2, "hasPrefix:", CFSTR("/var/containers/Shared/SystemGroup")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathComponents"));
    v4 = objc_msgSend(v3, "count");

    if ((unint64_t)v4 > 5)
      v5 = 1;
  }

  return v5;
}

- (BOOL)isSystemContainerShared
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", 3));

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("Shared"));
  return (char)v2;
}

- (id)getSystemContainerRootPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subarrayWithRange:", 0, 6));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v3));
  return v4;
}

- (id)lookupSystemContainerPathUUID
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v9;
  uint64_t v10;

  if (-[NSString isSystemContainerShared](self, "isSystemContainerShared"))
    v3 = 13;
  else
    v3 = 12;
  v10 = 1;
  v9 = 0;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString getSystemContainerKeyword](self, "getSystemContainerKeyword")));
  v5 = (void *)container_create_or_lookup_path_for_current_user(v3, objc_msgSend(v4, "UTF8String"), 0, 0, &v9, &v10);

  v6 = 0;
  if (v5 && v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));

    free(v5);
  }
  return v6;
}

@end
