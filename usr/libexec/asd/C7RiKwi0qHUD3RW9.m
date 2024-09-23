@implementation C7RiKwi0qHUD3RW9

+ (id)sharedInstance
{
  if (qword_100511620 != -1)
    dispatch_once(&qword_100511620, &stru_1004CF2B0);
  return (id)qword_100511618;
}

- (int64_t)L2S3goqpYnHiXTRg:(int64_t)a3
{
  if ((unint64_t)(a3 + 2003) >= 4)
    return a3;
  else
    return 138000 - a3;
}

- (int64_t)LygrmXh7W0Hs2O8n:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  int64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authorEmailAddresses"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipientEmailAddresses"));

  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v9 = (void *)v8;
  if (v7)
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v11 = (void *)v10;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountHandles"));

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsObject:", v17) & 1) != 0)
        {
          v18 = 2;
          goto LABEL_20;
        }
        if ((objc_msgSend(v11, "containsObject:", v17) & 1) != 0)
        {
          v18 = 1;
          goto LABEL_20;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v18 = 0;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_20:

  return v18;
}

- (int64_t)N2XtGIRzgUKLkZMS:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  int64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authorAddresses"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipientAddresses"));

  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v9 = (void *)v8;
  if (v7)
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v11 = (void *)v10;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountHandles"));

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsObject:", v17) & 1) != 0)
        {
          v18 = 2;
          goto LABEL_20;
        }
        if ((objc_msgSend(v11, "containsObject:", v17) & 1) != 0)
        {
          v18 = 1;
          goto LABEL_20;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v18 = 0;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_20:

  return v18;
}

- (id)SvXmeMlpC8nbshta:(id)a3 name:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  _QWORD v37[2];

  v30 = a3;
  v29 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstName"));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastName")),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstName"));
    v37[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastName"));
    v37[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fullName"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fullName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastName"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastName"));
        v36 = v14;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));

      }
      else
      {
        v9 = 0;
      }
    }
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = v9;
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v28, "addObject:", v9);
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v15 = objc_msgSend(v9, "mutableCopy");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v16, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v17, 1);

    objc_msgSend(v28, "addObject:", v15);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v28;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "componentsJoinedByString:", CFSTR("*")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@='*%@*'cd"), v30, v23));

        objc_msgSend(v18, "addObject:", v24);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" || ")));
  return v25;
}

- (id)mF9a0iyS9JaiQAjp:(id)a3 pXKoPMsQI9AYa6US:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v21 = a4;
  if ((objc_msgSend(v5, "containsObject:", CFSTR("public.email-message")) & 1) != 0
    || objc_msgSend(v5, "containsObject:", CFSTR("public.message")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -2592000.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
    v8 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v7));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InRange(kMDItemContentCreationDate, $time.iso(%@), $time.iso(%@)) && "), v9, v10));

  }
  else
  {
    v11 = &stru_1004F2E38;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kMDItemContentType='%@'"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v16)));
        objc_msgSend(v12, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" || ")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@) && (%@)"), v11, v18, v21));

  return v19;
}

- (void)Iv2P4WxadRhQ5ldX:(id)a3 GymwzUEOAaggmTfe:(int)a4 Y16kne8dG6NtD3ma:(id)a5 completion:(id)a6 yVhet0BX5E1CDncz:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  CSSearchQueryContext *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  int v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  int v28;
  _QWORD v29[3];

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  v16 = objc_opt_new(CSSearchQueryContext);
  -[CSSearchQueryContext setFetchAttributes:](v16, "setFetchAttributes:", v14);
  -[CSSearchQueryContext setMaxCount:](v16, "setMaxCount:", 100);
  v29[0] = NSFileProtectionComplete;
  v29[1] = NSFileProtectionCompleteUnlessOpen;
  v29[2] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
  -[CSSearchQueryContext setProtectionClasses:](v16, "setProtectionClasses:", v17);

  -[CSSearchQueryContext setIncludeUserActivities:](v16, "setIncludeUserActivities:", 1);
  v18 = objc_msgSend(objc_alloc((Class)CSSearchQuery), "initWithQueryString:context:", v11, v16);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002E368;
  v25[3] = &unk_1004CF2D8;
  v19 = v12;
  v26 = v19;
  v27 = v15;
  v28 = a4;
  objc_msgSend(v18, "setFoundItemsHandler:", v25);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002E488;
  v21[3] = &unk_1004CF300;
  v20 = v13;
  v22 = v20;
  v23 = v15;
  v24 = a4;
  objc_msgSend(v18, "setCompletionHandler:", v21);
  objc_msgSend(v18, "start");

}

- (void)f7RoJXIsBwkuxLd1:(id)a3 completionBlock:(id)a4 fNW5Ll4jBXJAcsCk:(unint64_t *)a5
{
  id v7;
  id v8;
  CSSearchQueryContext *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t *v17;
  _QWORD v18[3];

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_new(CSSearchQueryContext);
  -[CSSearchQueryContext setFetchAttributes:](v9, "setFetchAttributes:", &__NSArray0__struct);
  -[CSSearchQueryContext setMaxCount:](v9, "setMaxCount:", 100);
  v18[0] = NSFileProtectionComplete;
  v18[1] = NSFileProtectionCompleteUnlessOpen;
  v18[2] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  -[CSSearchQueryContext setProtectionClasses:](v9, "setProtectionClasses:", v10);

  -[CSSearchQueryContext setIncludeUserActivities:](v9, "setIncludeUserActivities:", 1);
  v11 = objc_msgSend(objc_alloc((Class)CSSearchQuery), "initWithQueryString:context:", v7, v9);
  objc_msgSend(v11, "setFoundItemsHandler:", 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002E6D0;
  v14[3] = &unk_1004CF328;
  v17 = a5;
  v12 = v11;
  v15 = v12;
  v13 = v8;
  v16 = v13;
  objc_msgSend(v12, "setCompletionHandler:", v14);
  objc_msgSend(v12, "start");

}

- (void)pRfmPXmMPeo7rsRf:(id)a3 N3UHg1ij3irF9uUu:(id)a4 QsX3tfdMvsGwvY0F:(unsigned int)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  CSSearchQueryContext *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void **v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  unsigned int v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[3];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_opt_new(CSSearchQueryContext);
  -[CSSearchQueryContext setFetchAttributes:](v12, "setFetchAttributes:", &__NSArray0__struct);
  -[CSSearchQueryContext setMaxCount:](v12, "setMaxCount:", a5);
  v33[0] = NSFileProtectionComplete;
  v33[1] = NSFileProtectionCompleteUnlessOpen;
  v33[2] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
  -[CSSearchQueryContext setProtectionClasses:](v12, "setProtectionClasses:", v13);

  -[CSSearchQueryContext setIncludeUserActivities:](v12, "setIncludeUserActivities:", 1);
  v14 = objc_msgSend(objc_alloc((Class)CSSearchQuery), "initWithQueryString:attributes:", v9, v10);
  v15 = objc_alloc_init((Class)NSMutableArray);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10002EA30;
  v31[4] = sub_10002EA40;
  v32 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002EA48;
  v26[3] = &unk_1004CF350;
  v29 = v31;
  v16 = v10;
  v27 = v16;
  v17 = v15;
  v28 = v17;
  v30 = a5;
  objc_msgSend(v14, "setFoundItemsHandler:", v26);
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_10002ED8C;
  v23 = &unk_1004CF378;
  v18 = v11;
  v25 = v18;
  v19 = v17;
  v24 = v19;
  objc_msgSend(v14, "setCompletionHandler:", &v20);
  objc_msgSend(v14, "start", v20, v21, v22, v23);

  _Block_object_dispose(v31, 8);
}

- (void)b8mzIZQ1GCTnhVAP:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstName"));
  if (v9 || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastName"))) != 0)
  {

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullName"));

    if (!v16)
      goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 SvXmeMlpC8nbshta:name:](self, "SvXmeMlpC8nbshta:name:", CFSTR("kMDItemAuthors"), v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v10));
  -[NSMutableArray addObject:](v8, "addObject:", v11);

LABEL_5:
  v20[0] = CFSTR("public.email-message");
  v20[1] = CFSTR("public.message");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v8, "componentsJoinedByString:", CFSTR(" || ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v12, v13));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002F02C;
  v19[3] = &unk_1004CF3A0;
  v19[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002F074;
  v17[3] = &unk_1004CF3C8;
  v15 = v7;
  v18 = v15;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v14, 2, v19, v17, &off_1004F4F98);

}

- (void)SKiIwgejuzELNOY0:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstName"));
  if (v9 || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastName"))) != 0)
  {

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullName"));

    if (!v16)
      goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 SvXmeMlpC8nbshta:name:](self, "SvXmeMlpC8nbshta:name:", CFSTR("kMDItemRecipients"), v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v10));
  -[NSMutableArray addObject:](v8, "addObject:", v11);

LABEL_5:
  v20[0] = CFSTR("public.email-message");
  v20[1] = CFSTR("public.message");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v8, "componentsJoinedByString:", CFSTR(" || ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v12, v13));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002F318;
  v19[3] = &unk_1004CF3A0;
  v19[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002F360;
  v17[3] = &unk_1004CF3C8;
  v15 = v7;
  v18 = v15;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v14, 2, v19, v17, &off_1004F4FB0);

}

- (void)U4k02bIWNYQCLSGK:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  const __CFString *v15;

  v6 = a3;
  v7 = a4;
  v15 = CFSTR("public.email-message");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kMDItemAuthorEmailAddresses='%@'"), v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v8, v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F524;
  v14[3] = &unk_1004CF3A0;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F56C;
  v12[3] = &unk_1004CF3C8;
  v11 = v7;
  v13 = v11;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v10, 2, v14, v12, &off_1004F4FC8);

}

- (void)E5J0OeRApCYQUXDZ:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  const __CFString *v15;

  v6 = a3;
  v7 = a4;
  v15 = CFSTR("public.email-message");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses='%@'"), v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v8, v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F730;
  v14[3] = &unk_1004CF3A0;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F778;
  v12[3] = &unk_1004CF3C8;
  v11 = v7;
  v13 = v11;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v10, 2, v14, v12, &off_1004F4FE0);

}

- (void)YMeSiVAJwqHb7P3U:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  const __CFString *v15;

  v6 = a3;
  v7 = a4;
  v15 = CFSTR("public.message");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kMDItemAuthorAddresses='%@'"), v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v8, v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F93C;
  v14[3] = &unk_1004CF3A0;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F984;
  v12[3] = &unk_1004CF3C8;
  v11 = v7;
  v13 = v11;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v10, 2, v14, v12, &off_1004F4FF8);

}

- (void)KqWH25SjlYcX4wo6:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  const __CFString *v15;

  v6 = a3;
  v7 = a4;
  v15 = CFSTR("public.message");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kMDItemRecipientAddresses='%@'"), v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v8, v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002FB48;
  v14[3] = &unk_1004CF3A0;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002FB90;
  v12[3] = &unk_1004CF3C8;
  v11 = v7;
  v13 = v11;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v10, 2, v14, v12, &off_1004F5010);

}

- (id)wQx5zziHtNxqlbwU:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const void *v10;
  void *String;
  id v12;
  const void *v13;
  uint64_t ITUCountryCodeForISOCountryCode;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[3];
  _QWORD v38[2];

  v3 = a3;
  if (v3)
  {
    v36 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("@"), 1, &v36));
    v5 = v36;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
    if (objc_msgSend(v6, "count"))
    {
      v7 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v35 = v5;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("[0-9\\-\\+\\*\\(\\)\\#\\s]"), 1, &v35));
    v8 = v35;

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
    if (!objc_msgSend(v31, "count"))
    {
      v7 = 0;
LABEL_27:

      v6 = v31;
      v5 = v8;
      goto LABEL_28;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCode"));

    v10 = (const void *)CFPhoneNumberCreate(kCFAllocatorDefault, v3, v29);
    String = (void *)CFPhoneNumberCreateString(kCFAllocatorDefault, v10, 3);
    v26 = (void *)CFPhoneNumberCreateString(kCFAllocatorDefault, v10, 1);
    v12 = String;
    v30 = v12;
    if (!v12)
      v30 = v3;
    v13 = (const void *)CFPhoneNumberCopyISOCountryCode(kCFAllocatorDefault, v10);
    ITUCountryCodeForISOCountryCode = CFPhoneNumberGetITUCountryCodeForISOCountryCode();
    if (v13)
      CFRelease(v13);
    if (v10)
      CFRelease(v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("+%ld "), ITUCountryCodeForISOCountryCode));
    if (objc_msgSend(v12, "hasPrefix:"))
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v27, "length")));

      v12 = (id)v15;
    }
    if (ITUCountryCodeForISOCountryCode == 1)
    {
      if (v12)
      {
        v34 = v8;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^\\([0-9]{3}\\)\\s"), 1, &v34));
        v17 = v34;

        if (!v17)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingMatchesInString:options:range:withTemplate:", v12, 0, 0, objc_msgSend(v12, "length"), &stru_1004F2E38));

          v12 = (id)v18;
        }

        v8 = v17;
LABEL_22:
        v33 = v8;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("[^0-9]"), 1, &v33));
        v19 = v33;

        if (!v19)
        {
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByReplacingMatchesInString:options:range:withTemplate:", v12, 0, 0, objc_msgSend(v12, "length"), &stru_1004F2E38));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByReplacingMatchesInString:options:range:withTemplate:", v30, 0, 0, objc_msgSend(v30, "length"), &stru_1004F2E38));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("+"), "stringByAppendingString:", v23));

          if (v22)
          {
            v37[0] = v12;
            v37[1] = v22;
            v37[2] = v24;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
            v20 = (void *)v22;
            v30 = (id)v24;
            goto LABEL_26;
          }
          v30 = (id)v24;
        }
        v20 = 0;
        v38[0] = v12;
        v38[1] = v30;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
LABEL_26:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));

        v8 = v19;
        goto LABEL_27;
      }
    }
    else if (v12)
    {
      goto LABEL_22;
    }
    v12 = v26;
    goto LABEL_22;
  }
  v7 = 0;
LABEL_29:

  return v7;
}

- (void)tfrVhQidRAUlTy5Y:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  _BYTE v26[128];

  v6 = a3;
  v18 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 wQx5zziHtNxqlbwU:](self, "wQx5zziHtNxqlbwU:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_kMDItemBundleID='com.apple.MobileAddressBook' && (kMDItemEmailAddress='%@' "), v6));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      v13 = v8;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("|| kMDItemAccountHandles='*%@' "), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12)));

        v12 = (char *)v12 + 1;
        v13 = v8;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR(")")));
  v25 = CFSTR("public.contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v15, v14));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100030458;
  v19[3] = &unk_1004CF3C8;
  v17 = v18;
  v20 = v17;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v16, 1, &stru_1004CF408, v19, 0);

}

- (void)MbPRHtYjEv98WrKf:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;

  v6 = a3;
  v7 = a4;
  v14 = CFSTR("public.contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_kMDItemBundleID='com.apple.MobileAddressBook' && kMDItemEmailAddresses='%@'"), v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:](self, "mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:", v8, v9));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100030610;
  v12[3] = &unk_1004CF3C8;
  v11 = v7;
  v13 = v11;
  -[C7RiKwi0qHUD3RW9 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:](self, "Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:", v10, 1, &stru_1004CF428, v12, 0);

}

- (void)A6B42kYrDuXnlUJs:(int *)a3 IaS2bByRUGdVAKHz:(int *)a4
{
  -[C7RiKwi0qHUD3RW9 A6B42kYrDuXnlUJs:IaS2bByRUGdVAKHz:QqUmN4hrxAoSYB5g:](self, "A6B42kYrDuXnlUJs:IaS2bByRUGdVAKHz:QqUmN4hrxAoSYB5g:", a3, a4, 0);
}

- (void)enableCHShowProtectedAppsForManager:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "setShowsProtectedApps:") & 1) != 0)
    ((void (*)(id, const char *, uint64_t))objc_msgSend(v3, "methodForSelector:", "setShowsProtectedApps:"))(v3, "setShowsProtectedApps:", 1);

}

- (void)A6B42kYrDuXnlUJs:(int *)a3 IaS2bByRUGdVAKHz:(int *)a4 QqUmN4hrxAoSYB5g:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  int *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  id obj;
  int v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v6 = a5;
  v22 = (void *)objc_opt_new(CHManager);
  -[C7RiKwi0qHUD3RW9 enableCHShowProtectedAppsForManager:](self, "enableCHShowProtectedAppsForManager:");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -2592000.0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("date > %@ AND date <= %@"), v23, v20));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recentCallsWithPredicate:"));
  *a3 = 0;
  *a4 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v8)
  {
    v29 = *(_QWORD *)v35;
    v28 = kCHCallStatusIncoming;
    v25 = kCHCallStatusOutgoing;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if (v6)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "remoteParticipantHandles"));
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v31;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v31 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v16, "type") == (id)2)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
                  v18 = objc_msgSend(v6, "isEqualToString:", v17);

                  if ((v18 & 1) != 0)
                  {

                    goto LABEL_18;
                  }
                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v13)
                continue;
              break;
            }
          }

        }
        else
        {
LABEL_18:
          if ((v28 & objc_msgSend(v10, "callStatus")) != 0)
          {
            v19 = a3;
          }
          else
          {
            if ((v25 & objc_msgSend(v10, "callStatus")) == 0)
              continue;
            v19 = a4;
          }
          ++*v19;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v8);
  }

}

- (void)hSmO2OC6etXclsKP:(id)a3 edrv2qHmtbt1iEyf:(id)a4 QsX3tfdMvsGwvY0F:(unsigned int)a5 completion:(id)a6
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(id, _QWORD, void *);
  id v33;
  id v34;
  id obj;
  int v36;
  uint64_t v37;
  id v38;
  id v39;
  NSMutableArray *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  _QWORD v51[4];
  _BYTE v52[128];
  _BYTE v53[128];

  v33 = a3;
  v34 = a4;
  v32 = (void (**)(id, _QWORD, void *))a6;
  v41 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_opt_new(CHManager);
  -[C7RiKwi0qHUD3RW9 enableCHShowProtectedAppsForManager:](self, "enableCHShowProtectedAppsForManager:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v33));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recentCallsWithPredicate:", v10));

  v11 = objc_msgSend(v34, "length");
  if (v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[C7RiKwi0qHUD3RW9 wQx5zziHtNxqlbwU:](self, "wQx5zziHtNxqlbwU:", v34, v31));
  else
    v12 = 0;
  v39 = v11;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v31;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v13)
  {
    v37 = *(_QWORD *)v47;
    v36 = kCHCallStatusIncoming;
    while (2)
    {
      v38 = v13;
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteParticipantHandles", v31));
        v17 = objc_msgSend(v15, "callStatus");
        if (v39)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v18 = v16;
          v19 = (uint64_t)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v43;
            while (2)
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v43 != v20)
                  objc_enumerationMutation(v18);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "normalizedValue"));
                if (v22 && (objc_msgSend(v12, "containsObject:", v22) & 1) != 0)
                {

                  v19 = 1;
                  goto LABEL_22;
                }

              }
              v19 = (uint64_t)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
              if (v19)
                continue;
              break;
            }
          }
LABEL_22:

        }
        else
        {
          v19 = 1;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));

        if (v24)
        {
          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));

          v23 = (void *)v25;
        }
        v50[0] = CFSTR("d");
        objc_msgSend(v15, "duration");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v51[0] = v26;
        v51[1] = v23;
        v50[1] = CFSTR("cd");
        v50[2] = CFSTR("di");
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v36 & v17) == 0));
        v51[2] = v27;
        v50[3] = CFSTR("mp");
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
        v51[3] = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 4));

        -[NSMutableArray addObject:](v41, "addObject:", v29);
        if (a5 && (unint64_t)-[NSMutableArray count](v41, "count") >= a5)
        {

          goto LABEL_31;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_31:

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v41));
  v32[2](v32, 0, v30);

}

@end
