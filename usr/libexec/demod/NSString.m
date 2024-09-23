@implementation NSString

- (BOOL)lowerVersionThan:(id)a3
{
  return -[NSString compare:options:](self, "compare:options:", a3, 64) == NSOrderedAscending;
}

- (BOOL)higherVersionThan:(id)a3
{
  return (id)-[NSString compare:options:](self, "compare:options:", a3, 64) == (id)1;
}

- (id)_stringForHMAC
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 1));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;

  return v4;
}

- (id)_dataUsingHexEncoding
{
  NSUInteger v3;
  unint64_t v4;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  unint64_t v7;
  id v8;
  _BYTE *v9;
  id v10;
  void *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  UniChar v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  char v27;
  int64_t v28;
  int64_t v29;
  const UniChar *v30;
  UniChar v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFStringRef theString;
  const UniChar *v44;
  const char *v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  CFRange v50;
  CFRange v51;

  v3 = -[NSString length](self, "length");
  if (!v3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v4 = v3;
  if ((v3 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0"), "stringByAppendingString:", self));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_dataUsingHexEncoding"));
    goto LABEL_9;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  theString = (CFStringRef)self;
  v46 = 0;
  v47 = v3;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v44 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  v7 = v4 >> 1;
  v48 = 0;
  v49 = 0;
  v45 = CStringPtr;
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v4 >> 1, v35, v36, v37, v38, v39, v40, v41, v42)));
  v9 = objc_msgSend(v8, "mutableBytes");
  if (v4 < 2)
  {
LABEL_6:
    v10 = objc_msgSend(v8, "copy");
LABEL_9:
    v12 = v10;
    goto LABEL_10;
  }
  v13 = v9;
  v14 = 0;
  v15 = 0;
  v16 = 64;
  while (1)
  {
    v17 = (unint64_t)v15 >= 4 ? 4 : v15;
    v18 = v47;
    if (v47 <= v15)
      break;
    if (v44)
    {
      v19 = v44[v15 + v46];
    }
    else if (v45)
    {
      v19 = v45[v46 + v15];
    }
    else
    {
      v20 = v48;
      if (v49 <= v15 || v48 > v15)
      {
        v22 = -v17;
        v23 = v17 + v14;
        v24 = v16 - v17;
        v25 = v15 + v22;
        v26 = v25 + 64;
        if (v25 + 64 >= v47)
          v26 = v47;
        v48 = v25;
        v49 = v26;
        if (v47 >= v24)
          v18 = v24;
        v50.length = v18 + v23;
        v50.location = v25 + v46;
        CFStringGetCharacters(theString, v50, (UniChar *)&v35);
        v20 = v48;
      }
      v19 = *((_WORD *)&v35 + v15 - v20);
    }
    if ((unsigned __int16)(v19 - 48) >= 0xAu)
    {
      if ((unsigned __int16)(v19 - 65) >= 6u)
      {
        if ((unsigned __int16)(v19 - 97) > 5u)
          break;
        v27 = -87;
      }
      else
      {
        v27 = -55;
      }
    }
    else
    {
      v27 = -48;
    }
    v28 = v15 + 1;
    v29 = v47;
    if (v47 <= v15 + 1)
      break;
    if (v44)
    {
      v30 = &v44[v15 + v46];
LABEL_39:
      v31 = v30[1];
      goto LABEL_42;
    }
    if (!v45)
    {
      if (v49 <= v28 || (v33 = v48, v48 > v28))
      {
        if ((unint64_t)v28 >= 4)
          v34 = v15 - 3;
        else
          v34 = 0;
        if (v34 + 64 < v47)
          v29 = v34 + 64;
        v48 = v34;
        v49 = v29;
        v51.location = v46 + v34;
        v51.length = v29 - v34;
        CFStringGetCharacters(theString, v51, (UniChar *)&v35);
        v33 = v48;
      }
      v30 = (const UniChar *)&v35 + v15 - v33;
      goto LABEL_39;
    }
    v31 = v45[v46 + 1 + v15];
LABEL_42:
    v32 = v31 - 48;
    if ((unsigned __int16)(v31 - 48) >= 0xAu)
    {
      if ((unsigned __int16)(v31 - 65) > 5u)
      {
        if ((unsigned __int16)(v31 - 97) > 5u)
          break;
        v32 = v31 - 87;
      }
      else
      {
        v32 = v31 - 55;
      }
    }
    *v13++ = v32 | (16 * (v19 + v27));
    v14 -= 2;
    v16 += 2;
    v15 += 2;
    if (!--v7)
      goto LABEL_6;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

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
          v14 = sub_1000604F0();
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
              v23 = sub_1000604F0();
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
