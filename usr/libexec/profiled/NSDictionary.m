@implementation NSDictionary

- (id)MCMutableDeepCopy
{
  return -[NSDictionary MCMutableDeepCopyWithZone:](self, "MCMutableDeepCopyWithZone:", 0);
}

- (BOOL)MCWriteToBinaryFile:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MCDictionaryWriter), "initWithDictionary:path:", self, v4);

  v6 = objc_msgSend(v5, "write");
  return v6;
}

- (id)MCMutableDeepCopyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSDictionary count](self, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary keyEnumerator](self, "keyEnumerator"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9);
        v11 = v10;
        if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___NSMutableCopying))
        {
          v11 = objc_msgSend(v10, "mutableCopyWithZone:", a3);

        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v10));
        v13 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = objc_msgSend(v12, "MCMutableDeepCopyWithZone:", a3);
LABEL_13:
          v16 = v14;
          objc_msgSend(v5, "setObject:forKey:", v14, v11);

          goto LABEL_14;
        }
        v15 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0
          || objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___NSMutableCopying))
        {
          v14 = objc_msgSend(v12, "mutableCopyWithZone:", a3);
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___NSCopying))
        {
          v14 = objc_msgSend(v12, "copyWithZone:", a3);
          goto LABEL_13;
        }
        objc_msgSend(v5, "setObject:forKey:", v12, v11);
LABEL_14:

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = v17;
    }
    while (v17);
  }

  return v5;
}

- (BOOL)MCWriteToBinaryFile:(id)a3 atomically:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v4 = a4;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", self, 200, 0, &v17));
  v9 = v17;
  if (v8)
  {
    v16 = 0;
    v10 = objc_msgSend(v8, "writeToFile:options:error:", v6, v4, &v16);
    v11 = v16;
    if ((v10 & 1) != 0)
    {
      v12 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not serialize data for %{public}@: %{public}@", buf, 0x16u);
    }
    v11 = 0;
  }
  v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v6;
    v20 = 2114;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not write data to path %{public}@: %{public}@", buf, 0x16u);
  }
  v12 = 0;
LABEL_10:

  objc_autoreleasePoolPop(v7);
  return v12;
}

+ (id)MCDictionaryFromFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v4, &v9));
  v6 = v9;
  if (!v5)
  {
    v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to make dictionary from file at path: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

- (id)MCDeepCopy
{
  return -[NSDictionary MCDeepCopyWithZone:](self, "MCDeepCopyWithZone:", 0);
}

- (id)MCRetainRequiredObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  int64_t v27;
  uint64_t v28;
  id v30;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  v20 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v16));
  v21 = (void *)v20;
  if (!v20)
  {
    if (a10)
    {
      v30 = v16;
      v23 = MCErrorArray(v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = MCErrorTypeFatal;
      v26 = v17;
      v27 = a6;
LABEL_8:
      *a10 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, v27, v24, v25, v30, 0));

    }
LABEL_9:
    v22 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass(v20, a4) & 1) == 0)
  {
    if (a10)
    {
      v30 = v16;
      v28 = MCErrorArray(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v25 = MCErrorTypeFatal;
      v26 = v17;
      v27 = a8;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v22 = v21;
LABEL_10:

  return v22;
}

- (id)MCRetainOptionalObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v14));
  v18 = (void *)v17;
  if (v17 && (objc_opt_isKindOfClass(v17, a4) & 1) == 0)
  {
    if (a8)
    {
      v19 = MCErrorArray(v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, a6, v20, MCErrorTypeFatal, v14, 0));

      a8 = 0;
    }
  }
  else
  {
    a8 = v18;
  }

  return a8;
}

- (id)MCRetainRequiredNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 missingDataCode:(int64_t)a5 missingDataErrorString:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  int64_t v26;
  uint64_t v27;
  id v29;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v15));
  if (v19)
  {
    v20 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
    {
      if (a9)
      {
        v29 = v15;
        v22 = MCErrorArray(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = MCErrorTypeFatal;
        v25 = v16;
        v26 = a7;
LABEL_9:
        *a9 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v25, v26, v23, v24, v29, 0));

      }
LABEL_10:
      v21 = 0;
      goto LABEL_11;
    }
  }
  if (!objc_msgSend(v19, "length"))
  {
    if (a9)
    {
      v29 = v15;
      v27 = MCErrorArray(v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v24 = MCErrorTypeFatal;
      v25 = v16;
      v26 = a5;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v21 = v19;
LABEL_11:

  return v21;
}

- (id)MCRetainOptionalNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 invalidDataCode:(int64_t)a5 invalidDataErrorString:(id)a6 outError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v12));
  if (!v15)
    goto LABEL_4;
  v16 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
    if (!a7)
      goto LABEL_8;
    v17 = MCErrorArray(v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v13, a5, v18, MCErrorTypeFatal, v12, 0));

LABEL_7:
    a7 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v15, "length"))
    goto LABEL_7;
LABEL_4:
  a7 = v15;
LABEL_8:

  return a7;
}

- (id)MCShortenedPlistDescription
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(self), "MCShortenedDictionary:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  return v4;
}

+ (id)MCShortenedObject:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MCShortenedArray:", v4));
  }
  else
  {
    v7 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MCShortenedDictionary:", v4));
    }
    else
    {
      v8 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
        v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MCShortenedData:", v4));
      else
        v6 = v4;
    }
  }
  v9 = v6;

  return v9;
}

+ (id)MCShortenedData:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if ((unint64_t)objc_msgSend(v3, "length") > 0x10)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 0, 8));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MCHexString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", (char *)objc_msgSend(v3, "length") - 8, 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHexString"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%@ ... 0x%@"), v6, v8));

    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MCHexString"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%@"), v4));
    }

  }
  else
  {
    v5 = CFSTR("<empty>");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Data { length = %lu, bytes = %@ }"), objc_msgSend(v3, "length"), v5));

  return v9;
}

+ (id)MCShortenedArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MCShortenedObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)MCShortenedDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016484;
  v7[3] = &unk_1000E34B0;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v8 = v5;
  v9 = a1;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (BOOL)MCValidateRestrictions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *m;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultRestrictions"));

  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        if (!-[NSDictionary MCValidateBoolRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), v5, v4))
        {
          v25 = 0;
          v10 = v5;
          goto LABEL_41;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (v7)
        continue;
      break;
    }
  }

  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedValueKey));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    while (2)
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        if (!-[NSDictionary MCValidateValueRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateValueRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), v10, v4))
        {
          v25 = 0;
          v15 = v10;
          goto LABEL_40;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v12)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    while (2)
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        if (!-[NSDictionary MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)k), v15, v4))
        {
          v25 = 0;
          v20 = v15;
          goto LABEL_39;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      if (v17)
        continue;
      break;
    }
  }

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCUnionKey));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    while (2)
    {
      for (m = 0; m != v22; m = (char *)m + 1)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        if (!-[NSDictionary MCValidateUnionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)m), v20, v4, (_QWORD)v27))
        {
          v25 = 0;
          goto LABEL_38;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      if (v22)
        continue;
      break;
    }
  }
  v25 = 1;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v25;
}

- (BOOL)MCValidateBoolRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCRestrictedBoolPreferenceKey));

    v13 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "objectForKeyedSubscript:", MCRestrictedBoolValueKey));

      v15 = objc_opt_class(NSNumber);
      LOBYTE(v10) = objc_opt_isKindOfClass(v14, v15);

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10 & 1;
}

- (BOOL)MCValidateValueRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", MCRestrictedValueKey));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCRestrictedValuePreferSmallerValuesKey));

    v13 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "objectForKeyedSubscript:", MCRestrictedValueValueKey));

      v15 = objc_opt_class(NSNumber);
      LOBYTE(v10) = objc_opt_isKindOfClass(v14, v15);

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10 & 1;
}

- (BOOL)MCValidateIntersectionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", MCIntersectionKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCIntersectionValuesKey));

    v13 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)MCValidateUnionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", MCUnionKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCUnionValuesKey));

    v13 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)MCDictionaryAdditiveDeltaToCreateDictionary:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v12, (_QWORD)v19));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
        if (!v13)
          goto LABEL_11;
        v15 = objc_opt_class(v13);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
          goto LABEL_11;
        if ((objc_msgSend(v14, "isEqual:", v13) & 1) != 0)
          goto LABEL_12;
        v16 = objc_opt_class(v10[199]);
        if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "MCDictionaryAdditiveDeltaToCreateDictionary:", v14));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, v12);

          v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
        }
        else
        {
LABEL_11:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, v12);
        }
LABEL_12:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)MCDictionarySubtractiveDeltaToCreateDictionary:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v12, (_QWORD)v19));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12));
        if (v14)
        {
          v15 = objc_opt_class(v13);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0
            && (objc_msgSend(v14, "isEqual:", v13) & 1) == 0)
          {
            v16 = objc_opt_class(v10[199]);
            if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "MCDictionarySubtractiveDeltaToCreateDictionary:", v14));
              if (objc_msgSend(v17, "count"))
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, v12);

              v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
            }
          }
        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);
        }

      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)MCRemovedKeysFromDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    v21 = self;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
        if (v13)
        {
          v15 = objc_opt_class(v10[199]);
          if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0
            && (v16 = objc_opt_class(v10[199]), (objc_opt_isKindOfClass(v14, v16) & 1) != 0))
          {
            v17 = v5;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "MCRemovedKeysFromDictionary:", v14));

            v5 = v17;
            if (objc_msgSend(v19, "count"))
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v12);
            else
              objc_msgSend(v17, "removeObjectForKey:", v12);

            self = v21;
            v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
          }
          else
          {
            objc_msgSend(v5, "removeObjectForKey:", v12);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)MCInsertedKeysFromDictionary:(id)a3 withNewLeafValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v23;
  NSDictionary *v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v27)
  {
    v24 = self;
    v25 = *(_QWORD *)v29;
    v23 = v8;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v8);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10));
        v13 = (void *)v12;
        if (v7)
          v14 = v7;
        else
          v14 = (void *)v12;
        v15 = v14;
        v16 = v13;
        if (v7)
        {
          v17 = objc_opt_class(NSDictionary);
          v16 = v7;
          if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "MCDictionaryWithLeafValuesSetToValue:", v7));

          }
        }
        if (v11
          && (v18 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v13, v18) & 1) != 0)
          && (v19 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v11, v19) & 1) != 0))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "MCInsertedKeysFromDictionary:withNewLeafValue:", v13, v7));

          v8 = v23;
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, v10);

          self = v24;
        }
        else
        {
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, v10);
        }

      }
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v27);
  }

  return v26;
}

- (id)MCDictionaryWithLeafValuesSetToValue:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11, (_QWORD)v16));
        v13 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCDictionaryWithLeafValuesSetToValue:", v4));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        }
        else
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v11);
        }

      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

@end
