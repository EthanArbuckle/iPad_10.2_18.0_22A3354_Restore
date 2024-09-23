@implementation NSDictionary

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  NSDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v18 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FM.key.%ld"), (char *)v10 + v9));
        v20 = 0;
        objc_msgSend(v5, "encodeObject:forKey:error:", v11, v12, &v20);
        v13 = v20;

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v6, "objectForKey:", v11));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FM.object.%ld"), (char *)v10 + v9));
        v19 = v13;
        objc_msgSend(v5, "encodeObject:forKey:error:", v14, v15, &v19);
        v16 = v19;

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v9 += (uint64_t)v10;
    }
    while (v8);
  }

  return 1;
}

- (NSDictionary)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSDictionary *v27;
  void *v31;
  id v32;
  id v33;
  NSErrorUserInfoKey v34;
  void *v35;
  NSErrorUserInfoKey v36;
  void *v37;
  NSErrorUserInfoKey v38;
  void *v39;

  v4 = a3;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = 0;
  v6 = 0;
  while (1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &OBJC_PROTOCOL___FMDCodable));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FM.key.%ld"), v5));
    v33 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfProtocols:forKey:error:", v7, v8, &v33));
    v10 = v33;

    if (v10)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

      v38 = NSLocalizedFailureReasonErrorKey;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected object nil for key FM.key.%lu"), v5));
      v39 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDictionaryError"), -1, v17));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, NSUnderlyingErrorKey);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v10, "code"), v15));

      goto LABEL_11;
    }
    if (!v9)
    {
      v20 = 0;
      goto LABEL_12;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &OBJC_PROTOCOL___FMDCodable));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FM.object.%ld"), v5));
    v32 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfProtocols:forKey:error:", v11, v12, &v32));
    v6 = v32;

    if (!v13)
      break;
    objc_msgSend(v31, "setObject:forKey:", v13, v9);

    ++v5;
  }
  if (v6)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v21));

    v36 = NSLocalizedFailureReasonErrorKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected object nil for key FM.object.%lu"), v5));
    v37 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDictionaryError"), -1, v23));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, NSUnderlyingErrorKey);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v6, "code"), v15));

  }
  else
  {
    v34 = NSLocalizedFailureReasonErrorKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected object nil for key FM.object.%lu"), v5));
    v35 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDictionaryError"), -1, v19));
  }
LABEL_11:

LABEL_12:
  if (v20)
  {
    v25 = sub_10005303C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100227094((uint64_t)v20, v26);

    if (a4)
      *a4 = objc_retainAutorelease(v20);
  }
  v27 = -[NSDictionary initWithDictionary:](self, "initWithDictionary:", v31);

  return v27;
}

+ (id)objectType
{
  return CFSTR("FM.dictionary");
}

+ (id)objectTypeKey
{
  return CFSTR("dictionaryType");
}

- (id)stringForCaseInsensitiveStringKey:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForCaseInsensitiveStringKey:](self, "objectForCaseInsensitiveStringKey:", a3));
  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)BOOLForCaseInsensitiveStringKey:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForCaseInsensitiveStringKey:](self, "objectForCaseInsensitiveStringKey:", a3));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)objectForCaseInsensitiveStringKey:(id)a3
{
  id v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v9, "compare:options:", v4, 1, (_QWORD)v11))
        {
          v6 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v9));
          goto LABEL_11;
        }
      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)fm_flattenedArrayWithParentIndices:(id)a3
{
  return -[NSDictionary flattenedArrayFromObject:parentIndices:](self, "flattenedArrayFromObject:parentIndices:", self, a3);
}

- (id)flattenedArrayFromObject:(id)a3 parentIndices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void **v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10006FAE0;
  v30 = sub_10006FAF0;
  v9 = &__NSArray0__struct;
  if (v7)
    v9 = v7;
  v31 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = objc_opt_class(NSDictionary, v11);
  v14 = objc_opt_class(NSArray, v13);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v15 = v6;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006FAF8;
    v24[3] = &unk_1002C3E90;
    v25[3] = v12;
    v25[4] = v14;
    v25[0] = v10;
    v25[1] = self;
    v25[2] = &v26;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v24);
    v16 = (void **)v25;
  }
  else
  {
    if ((objc_opt_isKindOfClass(v6, v14) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "componentsJoinedByString:", CFSTR("_")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v19, v6));
      objc_msgSend(v10, "addObject:", v18);
      goto LABEL_9;
    }
    v17 = v6;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006FC1C;
    v22[3] = &unk_1002C3EB8;
    v23[2] = &v26;
    v23[0] = v10;
    v23[1] = self;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v22);
    v16 = (void **)v23;
  }
  v18 = *v16;
  v19 = v6;
LABEL_9:

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:"));
  _Block_object_dispose(&v26, 8);

  return v20;
}

@end
