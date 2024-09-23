@implementation NSSet

+ (id)crl_setWithSelectors:(SEL)a3
{
  id v4;
  NSString *v5;
  void *v6;
  SEL *v7;
  id v8;
  SEL *v10;
  uint64_t v11;

  v4 = objc_alloc_init((Class)NSMutableSet);
  v10 = (SEL *)&v11;
  if (a3)
  {
    do
    {
      v5 = NSStringFromSelector(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v4, "addObject:", v6);

      v7 = v10++;
      a3 = *v7;
    }
    while (*v7);
  }
  v8 = objc_msgSend(v4, "copy");

  return v8;
}

+ (BOOL)crl_set:(id)a3 isEqualToSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v8 = 1;
    v7 = v5;
    goto LABEL_6;
  }
  v7 = v6;
  if (!v5)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    if (v7)
      goto LABEL_4;
LABEL_8:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    goto LABEL_4;
  }
  if (!v6)
    goto LABEL_8;
LABEL_4:
  v8 = objc_msgSend(v5, "isEqualToSet:", v7);
LABEL_6:

  return v8;
}

+ (id)crl_intersectionOfSets:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    goto LABEL_12;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
      if (v6)
        objc_msgSend(v6, "intersectSet:", v9);
      else
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v9));
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);
  if (!v6)
LABEL_12:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));

  return v6;
}

- (BOOL)crl_containsObjectIdenticalTo:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)crl_containsKindOfClass:(Class)a3
{
  NSSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), a3) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)crl_sortedArray
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self, "allObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "compare:"));

  return v3;
}

- (id)crl_setByMappingObjectsUsingBlock:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  unsigned int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];

  v4 = (uint64_t (**)(id, _QWORD))a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D488);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A12C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D4A8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(CRLAdditions) crl_setByMappingObjectsUsingBlock:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 95, 0, "Invalid parameter not satisfying: %{public}s", "block != nil");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", -[NSSet count](self, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = v4[2](v4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          objc_msgSend(v8, "addObject:", v15);
        }
        else
        {
          v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124D4C8);
          v17 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v30 = v16;
            v31 = 2082;
            v32 = "-[NSSet(CRLAdditions) crl_setByMappingObjectsUsingBlock:]";
            v33 = 2082;
            v34 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m";
            v35 = 1024;
            v36 = 105;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Block returned a nil object.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124D4E8);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v21 = v18;
            v22 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v30 = v16;
            v31 = 2114;
            v32 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(CRLAdditions) crl_setByMappingObjectsUsingBlock:]"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 105, 0, "Block returned a nil object.");

        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v11);
  }

  v23 = objc_msgSend(v8, "copy");
  return v23;
}

- (BOOL)crl_isHomogeneousForClass:(Class)a3
{
  NSSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), a3) & 1) == 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)crl_onlyObject
{
  void *v3;
  void *v4;
  void *v5;

  if (-[NSSet count](self, "count") >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D508);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A1D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D528);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(CRLAdditions) crl_onlyObject]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 126, 0, "As this method returns the only object in the set, it only makes sense if the set has at most one object.");

  }
  return (id)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self, "anyObject"));
}

- (id)crl_setByIntersectingSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", self));
  objc_msgSend(v5, "intersectSet:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v6;
}

- (id)crl_setBySubtractingSet:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", self));
    objc_msgSend(v5, "minusSet:", v4);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));

  }
  else
  {
    v6 = self;
  }

  return v6;
}

@end
