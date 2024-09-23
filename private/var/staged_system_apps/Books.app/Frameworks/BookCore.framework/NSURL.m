@implementation NSURL

- (BOOL)bc_hasLegacyBookStoreScheme
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("itms-books")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("itms-bookss"));

  }
  return v4;
}

- (BOOL)bc_isBookStoreAddToWantToReadURL
{
  _BOOL4 v3;

  v3 = -[NSURL bc_hasLegacyBookStoreScheme](self, "bc_hasLegacyBookStoreScheme");
  if (v3)
    LOBYTE(v3) = -[NSURL _actionMatchesString:](self, "_actionMatchesString:", CFSTR("add-to-want-to-read"));
  return v3;
}

- (BOOL)bc_isBookStoreBuyNowURL
{
  _BOOL4 v3;

  v3 = -[NSURL bc_hasLegacyBookStoreScheme](self, "bc_hasLegacyBookStoreScheme");
  if (v3)
    LOBYTE(v3) = -[NSURL _actionMatchesString:](self, "_actionMatchesString:", CFSTR("buy-now"));
  return v3;
}

- (BOOL)bc_isBookStoreViewInStoreURL
{
  _BOOL4 v3;

  v3 = -[NSURL bc_hasLegacyBookStoreScheme](self, "bc_hasLegacyBookStoreScheme");
  if (v3)
    LOBYTE(v3) = -[NSURL _actionMatchesString:](self, "_actionMatchesString:", CFSTR("view-in-store"));
  return v3;
}

- (BOOL)bc_isBookStoreStartReadingURL
{
  _BOOL4 v3;

  v3 = -[NSURL bc_hasLegacyBookStoreScheme](self, "bc_hasLegacyBookStoreScheme");
  if (v3)
    LOBYTE(v3) = -[NSURL _actionMatchesString:](self, "_actionMatchesString:", CFSTR("start-reading"));
  return v3;
}

- (BOOL)bc_isBookStoreStartListeningURL
{
  _BOOL4 v3;

  v3 = -[NSURL bc_hasLegacyBookStoreScheme](self, "bc_hasLegacyBookStoreScheme");
  if (v3)
    LOBYTE(v3) = -[NSURL _actionMatchesString:](self, "_actionMatchesString:", CFSTR("start-listening"));
  return v3;
}

+ (id)supportediBooksURLSchemes
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_30D560 != -1)
    dispatch_once(&qword_30D560, &stru_28CDB8);
  v3 = (void *)qword_30D558;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportediBooksStoreURLSchemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObjectsFromSet:", v4));

  return v5;
}

+ (id)supportediBooksInternalURLSchemes
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_30D570 != -1)
    dispatch_once(&qword_30D570, &stru_28CDD8);
  v3 = (void *)qword_30D568;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportediBooksStoreURLSchemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObjectsFromSet:", v4));

  return v5;
}

+ (id)supportediBooksStoreURLSchemes
{
  if (qword_30D580 != -1)
    dispatch_once(&qword_30D580, &stru_28CDF8);
  return (id)qword_30D578;
}

+ (id)assetIDFromURL:(id)a3
{
  return _objc_msgSend(a3, "bu_assetIDFromURL");
}

- (BOOL)_checkForBookStoreURLUsingRegularExpressions
{
  void *v3;
  void *v4;
  BOOL v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  if (qword_30D598 != -1)
    dispatch_once(&qword_30D598, &stru_28CE18);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
  v4 = v3;
  if (!qword_30D588
    || (objc_msgSend(v3, "bc_hasMatchInRegexPatterns:") ? (v5 = qword_30D590 == 0) : (v5 = 1), v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", self, 0);
    v8 = objc_msgSend(v7, "rangeOfPath");
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
    }
    else
    {
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", v10));

    }
    v6 = objc_msgSend(v9, "bc_hasMatchInRegexPatterns:", qword_30D590);

  }
  return v6;
}

- (void)bc_isBookStoreProductURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ixStoreSheetBooks"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_339AC;
  v8[3] = &unk_28CE40;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "jsa_valueWithCompletion:", v8);

}

- (void)bc_isBookStoreURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  dispatch_queue_global_t v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD block[4];
  NSObject *v43;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        v8 = dispatch_group_create();
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = sub_33D9C;
        v40[4] = sub_33DAC;
        v41 = 0;
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x3032000000;
        v38[3] = sub_33D9C;
        v38[4] = sub_33DAC;
        v39 = 0;
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x3032000000;
        v36[3] = sub_33D9C;
        v36[4] = sub_33DAC;
        v37 = 0;
        dispatch_group_enter(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "p2LaunchEbookstoreHostPatterns"));
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_33DB4;
        v33[3] = &unk_28CE68;
        v35 = v40;
        v11 = v8;
        v34 = v11;
        objc_msgSend(v10, "jsa_valueWithCompletion:", v33);

        dispatch_group_enter(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "p2LaunchEbookstorePathPatterns"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_33E00;
        v30[3] = &unk_28CE68;
        v32 = v38;
        v14 = v11;
        v31 = v14;
        objc_msgSend(v13, "jsa_valueWithCompletion:", v30);

        dispatch_group_enter(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "p2LaunchAudioBookStorePathPatterns"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_33E4C;
        v27[3] = &unk_28CE68;
        v29 = v36;
        v17 = v14;
        v28 = v17;
        objc_msgSend(v16, "jsa_valueWithCompletion:", v27);

        global_queue = dispatch_get_global_queue(21, 0);
        v19 = objc_claimAutoreleasedReturnValue(global_queue);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_33E98;
        v22[3] = &unk_28CE90;
        v22[4] = self;
        v24 = v40;
        v25 = v38;
        v26 = v36;
        v23 = v4;
        dispatch_group_notify(v17, v19, v22);

        _Block_object_dispose(v36, 8);
        _Block_object_dispose(v38, 8);

        _Block_object_dispose(v40, 8);
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {

    }
    v20 = dispatch_get_global_queue(21, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_33D8C;
    block[3] = &unk_28BF90;
    v43 = v4;
    dispatch_async(v21, block);

    v17 = v43;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)bc_isStoreProductURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ixStoreSheet"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_34050;
  v8[3] = &unk_28CEB8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "jsa_valueWithCompletion:", v8);

}

- (void)bc_isStoreURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trustedDomains"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3419C;
  v8[3] = &unk_28CEE0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "jsa_valueWithCompletion:", v8);

}

- (BOOL)isStoreURL
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[NSURL _checkForBookStoreURLUsingRegularExpressions](self, "_checkForBookStoreURLUsingRegularExpressions"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
    if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("itunes.apple.com")))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
      if (objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("buy.itunes.apple.com")))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
        if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("finance-app.itunes.apple.com")))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
          if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("itun.es")))
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
            v3 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("storepreview.apple.com")) == 0;

          }
          else
          {
            v3 = 1;
          }

        }
        else
        {
          v3 = 1;
        }

      }
      else
      {
        v3 = 1;
      }

    }
    else
    {
      v3 = 1;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isStoreURL_29693365
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  if (-[NSURL _checkForBookStoreURLUsingRegularExpressions](self, "_checkForBookStoreURLUsingRegularExpressions"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  if (v5)
  {
    if ((objc_msgSend(v5, "hasSuffix:", CFSTR("itunes.apple.com")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("itun.es")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("itunes.com"));
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isStoreBook
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[NSURL isStoreURL](self, "isStoreURL"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  if ((objc_msgSend(v4, "containsSubstring:", CFSTR("/book/")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
    if ((objc_msgSend(v7, "containsSubstring:", CFSTR("/books/isbn")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
      v5 = objc_msgSend(v8, "hasPrefix:", CFSTR("itms-books"));

    }
  }

  return v5;
}

- (id)bc_pathWithoutPrecedingSlash
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("/")))
  {
    do
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("/"), "length")));

      v2 = v3;
    }
    while ((objc_msgSend(v3, "hasPrefix:", CFSTR("/")) & 1) != 0);
  }
  else
  {
    v3 = v2;
  }
  return v3;
}

- (id)_lastModDateFormatter
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "threadDictionary"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("_lastModDateFormatter")));

  if (!v4)
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v4, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"));
    v5 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v4, "setLocale:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("GMT")));
    objc_msgSend(v4, "setTimeZone:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "threadDictionary"));
    objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("_lastModDateFormatter"));

  }
  return v4;
}

- (BOOL)_actionMatchesString:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL _valueForQueryItemWithName:](self, "_valueForQueryItemWithName:", CFSTR("action")));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)_valueForQueryItemWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL bu_dictionaryForQueryItems](self, "bu_dictionaryForQueryItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (BOOL)_validateWithSheetInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("host-patterns")));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host")),
        v10 = objc_msgSend(v9, "bc_hasMatchInRegexPatterns:", v8),
        v9,
        !v10))
  {
    v21 = 0;
  }
  else
  {
    v11 = objc_opt_class(NSArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("path-patterns")));
    v13 = BUDynamicCast(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
      v16 = objc_msgSend(v15, "mutableCopy");

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self, "query"));
          objc_msgSend(v16, "appendFormat:", CFSTR("?%@"), v18);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL fragment](self, "fragment"));

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL fragment](self, "fragment"));
          objc_msgSend(v16, "appendFormat:", CFSTR("#%@"), v20);

        }
        v21 = objc_msgSend(v16, "bc_hasMatchInRegexPatterns:", v14);
      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 1;
    }

  }
  return v21;
}

- (id)_defaultIXStoreSheetDictionary
{
  return &off_2AF960;
}

- (BOOL)bc_isUbiquitous
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v9;
  id v10;

  v10 = 0;
  v9 = 0;
  -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v10, NSURLIsUbiquitousItemKey, &v9);
  v3 = v10;
  v4 = v9;
  if (v4)
  {
    v5 = BCIMLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1B72BC();

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "bc_BOOLFromResourceValue:", v3);
  }

  return v7;
}

- (BOOL)hasUnresolvedConflicts
{
  id v3;

  v3 = 0;
  -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v3, NSURLUbiquitousItemHasUnresolvedConflictsKey, 0);
  return objc_msgSend(v3, "BOOLValue");
}

- (BOOL)bc_isDownloaded
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v9;
  id v10;

  v10 = 0;
  v9 = 0;
  -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v10, NSURLUbiquitousItemDownloadingStatusKey, &v9);
  v3 = v10;
  v4 = v9;
  if (v4)
  {
    v5 = BCIMLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1B731C();

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "bc_isDownloadedWithResourceValue:", v3);
  }

  return v7;
}

- (BOOL)bc_isDownloading
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v9;
  id v10;

  v10 = 0;
  v9 = 0;
  -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v10, NSURLUbiquitousItemIsDownloadingKey, &v9);
  v3 = v10;
  v4 = v9;
  if (v4)
  {
    v5 = BCIMLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1B737C();

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "bc_BOOLFromResourceValue:", v3);
  }

  return v7;
}

- (BOOL)isUploaded
{
  id v3;

  v3 = 0;
  -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v3, NSURLUbiquitousItemIsUploadedKey, 0);
  return objc_msgSend(v3, "BOOLValue");
}

- (BOOL)isUploading
{
  id v3;

  v3 = 0;
  -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v3, NSURLUbiquitousItemIsUploadingKey, 0);
  return objc_msgSend(v3, "BOOLValue");
}

- (BOOL)bc_isUbiquitousPromise
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  id v10;
  _QWORD v11[3];

  v11[0] = NSURLIsUbiquitousItemKey;
  v11[1] = NSURLUbiquitousItemDownloadingStatusKey;
  v11[2] = NSURLUbiquitousItemIsDownloadingKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));
  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL resourceValuesForKeys:error:](self, "resourceValuesForKeys:error:", v3, &v10));
  v5 = v10;

  if (v5)
  {
    v6 = BCIMLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1B73DC();

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "bc_isUbiquitousPromiseFromResourceDictionary:", v4);
  }

  return v8;
}

+ (BOOL)bc_isUbiquitousPromiseFromResourceDictionary:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSURLIsUbiquitousItemKey));
  v6 = objc_msgSend(a1, "bc_BOOLFromResourceValue:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSURLUbiquitousItemIsDownloadingKey));
  v8 = objc_msgSend(a1, "bc_BOOLFromResourceValue:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSURLUbiquitousItemDownloadingStatusKey));
  LOBYTE(a1) = objc_msgSend(a1, "bc_isDownloadedWithResourceValue:", v9);

  return v6 & ((v8 | a1) ^ 1);
}

+ (BOOL)bc_BOOLFromResourceValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  LOBYTE(v3) = objc_msgSend(v6, "BOOLValue");
  return (char)v3;
}

+ (BOOL)bc_isDownloadedWithResourceValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ((objc_msgSend(v6, "isEqualToString:", NSURLUbiquitousItemDownloadingStatusCurrent) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "isEqualToString:", NSURLUbiquitousItemDownloadingStatusDownloaded);

  return v7;
}

+ (void)coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  char *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSFileCoordinator *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v9 = (char *)a3;
  v10 = a6;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = BCIMLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 136315650;
      v17 = "+[NSURL(IMCoordinated) coordinateReadingItemAtURL:options:error:byAccessor:]";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/NSURL+BCCoordinated.m";
      v20 = 1024;
      v21 = 24;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v16, 0x1Cu);
    }

    v13 = BCIMLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "@\"This should not be called from the foreground thread. [URL: %@]\", (uint8_t *)&v16, 0xCu);
    }

  }
  v15 = objc_opt_new(NSFileCoordinator);
  -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](v15, "coordinateReadingItemAtURL:options:error:byAccessor:", v9, a4, a5, v10);

}

+ (void)coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  id v9;
  id v10;
  NSFileCoordinator *v11;

  v9 = a6;
  v10 = a3;
  v11 = objc_opt_new(NSFileCoordinator);
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v11, "coordinateWritingItemAtURL:options:error:byAccessor:", v10, a4, a5, v9);

}

@end
