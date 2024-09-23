@implementation NSString

- (id)crl_filenameFromDisplayNameWithExtension:(id)a3
{
  return -[NSString crl_filenameFromDisplayNameWithExtension:characterLimit:](self, "crl_filenameFromDisplayNameWithExtension:characterLimit:", a3, 255);
}

- (id)crl_filenameFromDisplayNameWithExtension:(id)a3 characterLimit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_tolerantStringByAppendingPathExtension:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crl_filenameTruncatedToCharacterLimit:", a4));
  return v9;
}

- (id)crl_filenameTruncatedToCharacterLimit:(unint64_t)a3
{
  NSString *v4;
  id v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = objc_retainAutorelease(self);
  if (strlen(-[NSString fileSystemRepresentation](v4, "fileSystemRepresentation")) > a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingPathExtension](v4, "stringByDeletingPathExtension"));
    v6 = (char *)objc_msgSend(v5, "length");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v4, "substringFromIndex:", v6));
    v8 = v6 - 1;
    do
    {
      v9 = objc_msgSend(v5, "rangeOfComposedCharacterSequencesForRange:", 0, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v9, v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", v7));

      if (!v8)
        break;
      v5 = objc_retainAutorelease(v12);
      --v8;
    }
    while (strlen((const char *)objc_msgSend(v5, "fileSystemRepresentation")) > a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13));

    v4 = (NSString *)v14;
  }
  return v4;
}

- (id)crl_displayNameFromFilename
{
  return -[NSString crl_displayNameFromFilenameDeletingPathExtension:](self, "crl_displayNameFromFilenameDeletingPathExtension:", 1);
}

- (id)crl_displayNameFromFilenameDeletingPathExtension:(BOOL)a3
{
  NSString *v3;
  NSString *v4;
  void *v5;

  if (a3)
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingPathExtension](self, "stringByDeletingPathExtension"));
  else
    v3 = self;
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/")));

  return v5;
}

- (id)crl_initialsWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD v16[4];

  if (!-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", 5))
    return 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString crl_stringByRemovingCharactersInSet:](self, "crl_stringByRemovingCharactersInSet:", v6));

  v8 = objc_msgSend(v7, "length");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000508C;
  v12[3] = &unk_1000716B0;
  v9 = v5;
  v13 = v9;
  v14 = v16;
  v15 = a3;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 1027, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uppercaseString"));

  _Block_object_dispose(v16, 8);
  return v10;
}

- (id)crl_nameByConvertingFirstNameToInitials
{
  void *v3;
  NSUInteger v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  NSString *v10;

  if (!-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", 5))
    return self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = -[NSString length](self, "length");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000051DC;
  v8[3] = &unk_1000716D8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 1027, v8);
  v6 = v5;

  return v6;
}

+ (id)crl_stringWithUUID
{
  const __CFUUID *v2;
  const __CFUUID *v3;
  __CFString *v4;

  v2 = CFUUIDCreate(0);
  if (v2)
  {
    v3 = v2;
    v4 = (__CFString *)CFUUIDCreateString(0, v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)crl_stringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v5, a4);

  return v6;
}

+ (id)crl_stringByIndentingString:(id)a3 times:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (a4 && v6)
  {
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  ")));

      if (objc_msgSend(v7, "hasSuffix:", CFSTR("\n  ")))
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 2));

        v7 = (void *)v8;
      }
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("  "), "stringByAppendingString:", v7));

      --a4;
    }
    while (a4);
  }
  v9 = v5;

  return v9;
}

+ (id)crl_stringByIndentingString:(id)a3
{
  return _objc_msgSend(a1, "crl_stringByIndentingString:times:", a3, 1);
}

- (id)crl_pathExceptPrivate
{
  uint64_t v3;
  NSString *v4;

  if (-[NSString rangeOfString:](self, "rangeOfString:", CFSTR("/private")))
    v4 = self;
  else
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", v3));
  return v4;
}

- (id)crl_stringByExpandingTableFormatting
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  unsigned int v22;
  __CFString *v23;
  void *v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  unint64_t v33;
  id v34;
  unint64_t v35;
  id v36;
  unint64_t v37;
  int v38;
  void *v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  unsigned int v43;
  __CFString *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  id v49;
  id v51;
  void *v52;
  int v53;
  int v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  int v59;
  _QWORD *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", CFSTR("$")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v10)
          objc_enumerationMutation(v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("|")));
        objc_msgSend(v5, "addObject:", v12);
        v13 = objc_msgSend(v12, "count");
        if (v9 <= v13)
          v9 = v13;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  if (objc_msgSend(v14, "count") == (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    v17 = objc_msgSend(v16, "length");

    if (!v17)
      objc_msgSend(v5, "removeLastObject");
  }
  else
  {

  }
  if (v9)
  {
    v51 = v6;
    v52 = v3;
    v18 = malloc_type_calloc(8uLL, (size_t)v9, 0xE9192C6EuLL);
    v60 = malloc_type_calloc(8uLL, (size_t)objc_msgSend(v5, "count"), 0x549B2A7CuLL);
    v55 = v5;
    if (objc_msgSend(v5, "count"))
    {
      v19 = 0;
      v20 = 0;
      do
      {
        v53 = v20;
        v56 = v19;
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v19));
        v21 = 0;
        v22 = 0;
        do
        {
          v23 = &stru_100075570;
          if ((unint64_t)objc_msgSend(v58, "count") > v21)
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v21));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsSeparatedByString:](v23, "componentsSeparatedByString:", CFSTR("\n")));
          v25 = v60[v19];
          v26 = objc_msgSend(v24, "count");
          if (v25 <= (unint64_t)v26)
            v27 = (unint64_t)v26;
          else
            v27 = v25;
          v60[v19] = v27;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v28 = v24;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v30; j = (char *)j + 1)
              {
                if (*(_QWORD *)v62 != v31)
                  objc_enumerationMutation(v28);
                v33 = v18[v21];
                v34 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j), "length");
                if (v33 <= (unint64_t)v34)
                  v35 = (unint64_t)v34;
                else
                  v35 = v33;
                v18[v21] = v35;
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
            }
            while (v30);
          }

          v21 = ++v22;
          v19 = v56;
        }
        while ((unint64_t)v9 > v22);

        v19 = (v53 + 1);
        v5 = v55;
        v36 = objc_msgSend(v55, "count");
        v20 = v53 + 1;
      }
      while ((unint64_t)v36 > v19);
    }
    v9 = objc_alloc_init((Class)NSMutableString);
    if (objc_msgSend(v5, "count"))
    {
      v37 = 0;
      v38 = 0;
      do
      {
        v54 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v37));
        if (v60[v37])
        {
          v40 = 0;
          v41 = 0;
          v57 = v37;
          do
          {
            v59 = v41;
            if (objc_msgSend(v39, "count"))
            {
              v42 = 0;
              v43 = 1;
              do
              {
                v44 = &stru_100075570;
                if ((unint64_t)objc_msgSend(v39, "count") > v42)
                  v44 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v42));
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsSeparatedByString:](v44, "componentsSeparatedByString:", CFSTR("\n")));
                v46 = &stru_100075570;
                if ((unint64_t)objc_msgSend(v45, "count") > v40)
                  v46 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v40));
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByPaddingToLength:withString:startingAtIndex:](v46, "stringByPaddingToLength:withString:startingAtIndex:", v18[v42] + 1, CFSTR(" "), 0));
                objc_msgSend(v9, "appendString:", v47);

                v42 = v43;
              }
              while ((unint64_t)objc_msgSend(v39, "count") > v43++);
            }
            objc_msgSend(v9, "appendString:", CFSTR("\n"));
            v40 = (v59 + 1);
            v41 = v59 + 1;
          }
          while (v60[v57] > v40);
        }

        v37 = (v54 + 1);
        v5 = v55;
        v49 = objc_msgSend(v55, "count");
        v38 = v54 + 1;
      }
      while ((unint64_t)v49 > v37);
    }
    free(v60);
    free(v18);
    v6 = v51;
    v3 = v52;
  }

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (id)crl_stringQuotedIfContainsCharacterSet:(id)a3
{
  NSString *v4;
  id v5;

  v4 = self;
  if (-[NSString rangeOfCharacterFromSet:](v4, "rangeOfCharacterFromSet:", a3) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = -[NSString mutableCopy](v4, "mutableCopy");
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\"\"), 0, 0, -[NSString length](v4, "length"));
    objc_msgSend(v5, "appendString:", CFSTR("\"));
    objc_msgSend(v5, "insertString:atIndex:", CFSTR("\"), 0);

    v4 = (NSString *)v5;
  }
  return v4;
}

- (id)crl_stringByAppendingSeparator:(id)a3 format:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString crl_stringWithFormat:arguments:](NSString, "crl_stringWithFormat:arguments:", a4, &v10));
  if (-[NSString length](self, "length"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingFormat:](self, "stringByAppendingFormat:", CFSTR("%@%@"), v6, v7));

    v7 = (void *)v8;
  }

  return v7;
}

- (id)crl_stringByUniquingPathInsideDirectory:(id)a3
{
  return -[NSString crl_stringByUniquingPathInsideDirectory:withFormat:](self, "crl_stringByUniquingPathInsideDirectory:withFormat:", a3, CFSTR("%@-%d%@"));
}

- (id)crl_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 v24;
  void *context;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_1000716F8);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DF78();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071718);
    v8 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 268, 0, "invalid nil value for '%{public}s'", "directoryPath");

  }
  v11 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v11));
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if (v14)
  {
    v15 = objc_autoreleasePoolPush();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString pathExtension](v11, "pathExtension"));
    context = v15;
    if (v16)
    {
      v17 = v16;
      if (-[__CFString length](v16, "length"))
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("."), "stringByAppendingString:", v17));

        v17 = (__CFString *)v18;
      }
    }
    else
    {
      v17 = &stru_100075570;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingPathExtension](v11, "stringByDeletingPathExtension"));
    v20 = 2;
    do
    {
      v21 = v11;
      v22 = (v20 + 1);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v19, v20, v17));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v11));
      v24 = objc_msgSend(v12, "fileExistsAtPath:", v23);

      v20 = v22;
    }
    while ((v24 & 1) != 0);

    objc_autoreleasePoolPop(context);
  }

  return v11;
}

- (id)crl_stringByFixingBrokenSurrogatePairs
{
  __CFString *v2;
  uint64_t v3;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v6;
  __CFString *v7;
  int64_t v8;
  int64_t v9;
  UniChar v10;
  int64_t v11;
  int v12;
  int64_t v13;
  int64_t v14;
  UniChar v15;
  int64_t v16;
  const UniChar *v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CFStringRef theString;
  const UniChar *v29;
  const char *v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  CFRange v35;
  CFRange v36;

  v2 = self;
  v3 = (uint64_t)-[__CFString length](v2, "length");
  theString = v2;
  v31 = 0;
  v32 = v3;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  v29 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v33 = 0;
  v34 = 0;
  v30 = CStringPtr;
  if (v3 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      if ((v8 & 0x8000000000000000) == 0)
      {
        v9 = v32;
        if (v32 > v8)
        {
          if (v29)
          {
            v10 = v29[v31 + v8];
          }
          else if (v30)
          {
            v10 = v30[v31 + v8];
          }
          else
          {
            if (v34 <= v8 || v6 > v8)
            {
              v11 = v8 - 4;
              if ((unint64_t)v8 < 4)
                v11 = 0;
              if (v11 + 64 < v32)
                v9 = v11 + 64;
              v33 = v11;
              v34 = v9;
              v35.location = v31 + v11;
              v35.length = v9 - v11;
              CFStringGetCharacters(theString, v35, (UniChar *)&v20);
              v6 = v33;
            }
            v10 = *((_WORD *)&v20 + v8 - v6);
          }
          v12 = v10 & 0xFC00;
          if (v12 == 56320)
          {
LABEL_37:
            if (!v7)
            {
              v7 = (__CFString *)-[__CFString mutableCopyWithZone:](v2, "mutableCopyWithZone:", 0, v20, v21, v22, v23, v24, v25, v26, v27);

              v2 = v7;
            }
            -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", v8, 1, CFSTR("\uFFFD"), v20, v21, v22, v23, v24, v25, v26, v27);
            v3 = (uint64_t)-[__CFString length](v2, "length");
            theString = v2;
            v31 = 0;
            v32 = v3;
            v17 = CFStringGetCharactersPtr(v2);
            v18 = 0;
            v29 = v17;
            if (!v17)
              v18 = CFStringGetCStringPtr(v2, 0x600u);
            v6 = 0;
            v30 = v18;
            v33 = 0;
            v34 = 0;
            goto LABEL_42;
          }
          if (v12 == 55296)
          {
            v13 = v8 + 1;
            if (v8 + 1 >= v3)
              goto LABEL_37;
            v14 = v32;
            if (v32 <= v13)
              goto LABEL_37;
            if (v29)
            {
              v15 = v29[v31 + v13];
            }
            else if (v30)
            {
              v15 = v30[v31 + v13];
            }
            else
            {
              if (v34 <= v13 || v6 > v13)
              {
                v16 = v8 - 3;
                if ((unint64_t)v8 < 3)
                  v16 = 0;
                if (v16 + 64 < v32)
                  v14 = v16 + 64;
                v33 = v16;
                v34 = v14;
                v36.location = v31 + v16;
                v36.length = v14 - v16;
                CFStringGetCharacters(theString, v36, (UniChar *)&v20);
                v6 = v33;
              }
              v15 = *((_WORD *)&v20 + v13 - v6);
            }
            if (v15 >> 10 != 55)
              goto LABEL_37;
            ++v8;
          }
        }
      }
LABEL_42:
      if (++v8 >= v3)
      {

        return v2;
      }
    }
  }
  return v2;
}

- (id)crl_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4
{
  id v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  char *v14;
  uint64_t v15;
  NSUInteger v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;

  v6 = a3;
  if (v6)
  {
    v7 = self;
    if (-[NSString rangeOfCharacterFromSet:](v7, "rangeOfCharacterFromSet:", v6) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
    }
    else
    {
      v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      v12 = -[NSString length](v7, "length");
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = a4 & 0xFFFFFFFB;
        v16 = v12;
        do
        {
          v17 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v6, v15, v14, v16);
          if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
            v19 = 0;
          else
            v19 = v18;
          if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
            v20 = (char *)v13;
          else
            v20 = v17;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](v7, "substringWithRange:", v14, v20 - v14));
          -[NSString appendString:](v8, "appendString:", v21);

          v14 = &v20[v19];
          v16 = v13 - (_QWORD)&v20[v19];
        }
        while ((char *)v13 != &v20[v19]);
      }

    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071738);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004E00C();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071758);
    v9 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_stringByRemovingCharactersInSet:options:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 342, 0, "invalid nil value for '%{public}s'", "charSet");

    v8 = self;
  }

  return v8;
}

- (id)crl_stringByRemovingCharactersInSet:(id)a3
{
  return -[NSString crl_stringByRemovingCharactersInSet:options:](self, "crl_stringByRemovingCharactersInSet:options:", a3, 0);
}

- (id)crl_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  id v13;
  char *i;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NSString rangeOfCharacterFromSet:options:](self, "rangeOfCharacterFromSet:options:", v6, 2) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = self;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", -[NSString length](self, "length")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", self));
    objc_msgSend(v10, "setCharactersToBeSkipped:", 0);
    if ((objc_msgSend(v10, "isAtEnd") & 1) == 0)
    {
      v11 = 0;
      while (1)
      {
        v17 = v11;
        v12 = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v6, &v17);
        v13 = v17;

        if (v12)
          objc_msgSend(v9, "appendString:", v13);
        if ((objc_msgSend(v10, "isAtEnd") & 1) != 0)
          break;
        v16 = v13;
        objc_msgSend(v10, "scanCharactersFromSet:intoString:", v6, &v16);
        v11 = v16;

        for (i = (char *)objc_msgSend(v11, "length"); i; --i)
          objc_msgSend(v9, "appendString:", v7);
        if ((objc_msgSend(v10, "isAtEnd") & 1) != 0)
          goto LABEL_13;
      }
      v11 = v13;
LABEL_13:

    }
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v9));

  }
  return v8;
}

- (unint64_t)crl_countInstancesOfString:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSUInteger v7;
  char *v8;
  id v9;
  unint64_t v10;
  char *v11;
  char *v12;

  v6 = a3;
  v7 = -[NSString length](self, "length");
  v8 = (char *)objc_msgSend(v6, "length");
  v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v6, a4, 0, v7);
  v10 = 0;
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
    v10 = 0;
    do
    {
      ++v10;
      v12 = &v8[(_QWORD)v9];
      v7 = (NSUInteger)&v11[v7 - (unint64_t)&v8[(_QWORD)v9]];
      v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v6, a4, &v8[(_QWORD)v9], v7);
      v11 = v12;
    }
    while (v9 != (id)0x7FFFFFFFFFFFFFFFLL);
  }

  return v10;
}

- (id)crl_escapeForIcuRegex
{
  NSString *v3;
  char *v4;
  NSString *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  if (qword_100085A38 != -1)
    dispatch_once(&qword_100085A38, &stru_100071778);
  v3 = self;
  v4 = -[NSString length](v3, "length");
  *(_QWORD *)&v13 = -[NSString rangeOfCharacterFromSet:](v3, "rangeOfCharacterFromSet:", qword_100085A30);
  if ((_QWORD)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_alloc((Class)NSMutableString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v3, "substringToIndex:", (_QWORD)v13));
    v5 = (NSString *)objc_msgSend(v6, "initWithString:", v7);

    if (v4 != (char *)v13)
    {
      do
      {
        -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\\%C"), -[NSString characterAtIndex:](v3, "characterAtIndex:", (_QWORD)v13));
        *(_QWORD *)&v13 = v13 + 1;
        *((_QWORD *)&v13 + 1) = &v4[-v13];
        v8 = v13;
        if (v4 != (char *)v13)
        {
          *(_QWORD *)&v12 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", qword_100085A30, 0, (_QWORD)v13);
          *((_QWORD *)&v12 + 1) = v9;
          v13 = v12;
          if ((_QWORD)v12 == 0x7FFFFFFFFFFFFFFFLL)
            v13 = (unint64_t)v4;
          if ((_QWORD)v13 != v8)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](v3, "substringWithRange:", v8, (_QWORD)v13 - v8));
            -[NSString appendString:](v5, "appendString:", v10);

          }
        }
      }
      while (*((_QWORD *)&v13 + 1));
    }

  }
  return v5;
}

- (BOOL)crl_isDescendantOfPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  unsigned int v10;
  char *v11;
  unsigned __int8 v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathComponents"));
  v7 = (char *)objc_msgSend(v6, "count");
  if (v7)
  {
    do
    {
      v8 = v7 - 1;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7 - 1));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("/"));

      if (!v10)
        break;
      --v7;
    }
    while (v8);
  }
  v11 = (char *)objc_msgSend(v5, "count");
  v12 = v7 <= v11;
  if (v7 - 1 < v11)
  {
    v13 = 0;
    v14 = 1;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v13));
      v12 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((unint64_t)v7 <= v14)
        break;
      v13 = v14++;
    }
    while ((v12 & 1) != 0);
  }

  return v12;
}

- (BOOL)crl_isChildOfPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  char *v13;
  char *v14;
  unsigned __int8 v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathComponents"));
  v8 = objc_msgSend(v7, "mutableCopy");

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("/"));

      if (!v10)
        break;
      objc_msgSend(v6, "removeObjectAtIndex:", (char *)objc_msgSend(v6, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v6, "count") > 1);
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/"));

      if (!v12)
        break;
      objc_msgSend(v8, "removeObjectAtIndex:", (char *)objc_msgSend(v8, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v8, "count") > 1);
  }
  v13 = (char *)objc_msgSend(v8, "count") + 1;
  v14 = (char *)objc_msgSend(v6, "count");
  v15 = v13 == v14;
  v16 = objc_msgSend(v8, "count");
  if (v16 && v13 == v14)
  {
    v17 = (unint64_t)v16;
    v18 = 0;
    v19 = 1;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v18));
      v15 = objc_msgSend(v20, "isEqualToString:", v21);

      if (v17 <= v19)
        break;
      v18 = v19++;
    }
    while ((v15 & 1) != 0);
  }

  return v15;
}

- (id)crl_stringWithRealpath
{
  char *v2;
  char *v3;
  void *v4;

  v2 = realpath_DARWIN_EXTSN(-[NSString fileSystemRepresentation](objc_retainAutorelease(self), "fileSystemRepresentation"), 0);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v2, 4));
    free(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)crl_stringWithTrimmedWhitespace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](self, "componentsSeparatedByCharactersInSet:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" ")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v3));
  return v6;
}

- (id)crl_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3
{
  NSString *v5;

  if (-[NSString length](self, "length") <= a3)
    v5 = self;
  else
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", -[NSString rangeOfComposedCharacterSequenceAtIndex:](self, "rangeOfComposedCharacterSequenceAtIndex:", a3)));
  return v5;
}

- (id)crl_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3
{
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  NSString *v13;

  v5 = -[NSString length](self, "length");
  v6 = 0;
  if (v5)
  {
    v7 = 0;
    do
    {
      v8 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self, "rangeOfComposedCharacterSequenceAtIndex:", v6);
      v10 = v9;
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self, "substringWithRange:", v8, v9)));
      v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

      v7 += strlen(v12);
      if (v7 > a3)
        break;
      v6 += v10;
    }
    while (v6 < v5);
  }
  if (v6 == v5)
    v13 = self;
  else
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", v6));
  return v13;
}

- (id)crl_stringWithPathRelativeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  __CFString *v19;
  void *v21;
  void *v22;

  v4 = a3;
  if (v4)
  {
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathComponents"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByStandardizingPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathComponents"));

    v10 = (char *)objc_msgSend(v7, "count");
    v11 = (char *)objc_msgSend(v9, "count");
    if (v10 < v11)
      goto LABEL_10;
    v12 = (unint64_t)v11;
    if (!v11)
      goto LABEL_8;
    v22 = v5;
    v13 = 0;
    v14 = 1;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v13));
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v17 & 1) == 0)
        break;
      v13 = v14;
    }
    while (v12 > v14++);
    v5 = v22;
    if (v12 != v13)
    {
LABEL_10:
      v19 = 0;
    }
    else
    {
LABEL_8:
      if (v10 == (char *)v12)
      {
        v19 = &stru_100075570;
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subarrayWithRange:", v12, &v10[-v12]));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v21));

      }
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)crl_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  __CFString *v20;
  int64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByStandardizingPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathComponents"));

    v11 = (char *)objc_msgSend(v8, "count");
    v12 = (char *)objc_msgSend(v10, "count");
    v13 = v12;
    if (v12 >= v11)
      v14 = (unint64_t)v11;
    else
      v14 = (unint64_t)v12;
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v15));
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

        if (!v19)
          break;
        v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      v16 = 0;
    }
    v21 = v13 - v16;
    if (v13 <= v16)
    {
      v23 = &stru_100075570;
    }
    else
    {
      v22 = &stru_100075570;
      do
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v22, "stringByAppendingPathComponent:", CFSTR("..")));

        v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      v20 = v23;
    }
    else
    {
      do
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v16));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v23, "stringByAppendingPathComponent:", v24));

        ++v16;
        v23 = v20;
      }
      while (v11 != v16);
    }

  }
  else
  {
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString crl_stringWithPathRelativeTo:](self, "crl_stringWithPathRelativeTo:", v6));
  }

  return v20;
}

- (id)crl_stringByTrimmingCharactersInSetFromFront:(id)a3
{
  NSString *p_isa;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  p_isa = self;
  v5 = -[NSString rangeOfCharacterFromSet:options:](p_isa, "rangeOfCharacterFromSet:options:", a3, 8);
  v7 = v6;
  if (v6 == (void *)-[NSString length](p_isa, "length"))
  {
    v8 = &stru_100075570;
LABEL_5:

    p_isa = &v8->isa;
    return p_isa;
  }
  if (!v5)
  {
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](p_isa, "substringFromIndex:", v7));
    goto LABEL_5;
  }
  return p_isa;
}

+ (id)crl_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unsigned int v9;

  v4 = a4;
  v6 = 2 * a4;
  v7 = malloc_type_malloc(2 * a4, 0x7BD5F295uLL);
  if (v4)
  {
    v8 = v7;
    do
    {
      v9 = *(unsigned __int8 *)a3++;
      *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  return objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v6, 1, 1);
}

+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4
{
  return +[NSString crl_stringByBase64EncodingBytes:length:breakLines:](NSString, "crl_stringByBase64EncodingBytes:length:breakLines:", a3, a4, 0);
}

+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v16;

  v5 = a5;
  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 4 * a4 / 3));
  if (v6 < 3)
  {
    v13 = 0;
  }
  else
  {
    v9 = 0;
    v10 = a3 + 2;
    v11 = -4;
    v12 = 4;
    do
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("%c%c%c%c"), aAbcdefghijklmn[*(v10 - 2) >> 2], aAbcdefghijklmn[((unint64_t)((*((unsigned __int8 *)v10 - 1) << 8) | (*((unsigned __int8 *)v10 - 2) << 16)) >> 12) & 0x3F], aAbcdefghijklmn[((unint64_t)(*(unsigned __int8 *)v10 | (*((unsigned __int8 *)v10 - 1) << 8)) >> 6) & 0x3F], aAbcdefghijklmn[*v10 & 0x3F]);
      if (v5 && !(v11 + 76 * (v12 / 0x4C)))
        objc_msgSend(v8, "appendString:", CFSTR("\n"));
      v10 += 3;
      v11 -= 4;
      v12 += 4;
      v9 -= 3;
    }
    while (v6 + v9 > 2);
    v13 = -v9;
    v6 += v9;
  }
  if (v6 == 1)
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("%c%c=="), aAbcdefghijklmn[(unint64_t)a3[v13] >> 2], aAbcdefghijklmn[16 * (a3[v13] & 3)], v16);
  }
  else if (v6 == 2)
  {
    v14 = &a3[v13];
    objc_msgSend(v8, "appendFormat:", CFSTR("%c%c%c="), aAbcdefghijklmn[*v14 >> 2], aAbcdefghijklmn[((unint64_t)((*(unsigned __int8 *)v14 << 16) | (*((unsigned __int8 *)v14 + 1) << 8)) >> 12) & 0x3F], aAbcdefghijklmn[4 * (v14[1] & 0xF)]);
  }
  return v8;
}

- (id)crl_encodeStringBase64
{
  const char *v2;
  size_t v3;

  v2 = -[NSString UTF8String](objc_retainAutorelease(self), "UTF8String");
  v3 = strlen(v2);
  return +[NSString crl_stringByBase64EncodingBytes:length:](NSString, "crl_stringByBase64EncodingBytes:length:", v2, v3);
}

- (id)crl_stringByMakingFirstCharacterLowercase
{
  NSString *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = self;
  if (-[NSString length](v2, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v2, "substringToIndex:", 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v2, "substringFromIndex:", 1));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", v5));

      v2 = (NSString *)v6;
    }

  }
  return v2;
}

- (id)crl_stringByMakingFirstCharacterUppercase
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[NSString mutableCopy](self, "mutableCopy");
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));
    objc_msgSend(v3, "replaceCharactersInRange:withString:", 0, 1, v5);

  }
  return v3;
}

- (id)crl_stringTrimByLimitingFirstCharacterToSet:(id)a3
{
  id v4;
  NSString *v5;
  unsigned __int16 v6;
  NSString *v7;

  v4 = a3;
  v5 = self;
  if (-[NSString length](v5, "length"))
  {
    v6 = -[NSString characterAtIndex:](v5, "characterAtIndex:", 0);
    if (-[NSString length](v5, "length"))
    {
      while ((objc_msgSend(v4, "characterIsMember:", v6) & 1) == 0)
      {
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v5, "substringFromIndex:", 1));

        if (-[NSString length](v7, "length"))
          v6 = -[NSString characterAtIndex:](v7, "characterAtIndex:", 0);
        v5 = v7;
        if (!-[NSString length](v7, "length"))
          goto LABEL_9;
      }
    }
  }
  v7 = v5;
LABEL_9:

  return v7;
}

+ (id)crl_stringWithXMLString:(const char *)a3
{
  return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a3, 4);
}

- (id)crl_escapeXML
{
  id v2;

  v2 = -[NSString mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v2, "length"));
  return v2;
}

- (id)crl_unescapeXML
{
  id v2;

  v2 = -[NSString mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&amp;"),
    CFSTR("&"),
    0,
    0,
    objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&lt;"),
    CFSTR("<"),
    0,
    0,
    objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&gt;"),
    CFSTR(">"),
    0,
    0,
    objc_msgSend(v2, "length"));
  return v2;
}

- (BOOL)crl_containsOnlyCharactersFromSet:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "invertedSet"));
  v5 = -[NSString rangeOfCharacterFromSet:](self, "rangeOfCharacterFromSet:", v4);

  return v5 == (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)crl_stringByDeletingPathExtensionIfEqualTo:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathExtension](self, "pathExtension"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingPathExtension](self, "stringByDeletingPathExtension"));
  else
    v7 = self;
  v8 = v7;

  return v8;
}

- (id)crl_tolerantStringByAppendingPathExtension:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (!-[NSString isEqualToString:](self, "isEqualToString:", &stru_100075570)
    && !objc_msgSend(v4, "isEqualToString:", &stru_100075570))
  {
    if (-[NSString isEqualToString:](self, "isEqualToString:", CFSTR("\\\\")))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\\"), "stringByAppendingPathExtension:", v4));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\\"), "stringByAppendingString:", v8));
    }
    else
    {
      if (!-[NSString length](self, "length") || -[NSString characterAtIndex:](self, "characterAtIndex:", 0) != 126)
      {
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathExtension:](self, "stringByAppendingPathExtension:", v4));
        goto LABEL_4;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("X"), "stringByAppendingString:", self));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", v4));

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", 1));
    }
    v6 = (void *)v9;

    goto LABEL_5;
  }
  v5 = self;
LABEL_4:
  v6 = v5;
LABEL_5:

  return v6;
}

+ (id)crl_stringByHexEncodingData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unsigned __int8 *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = (char *)objc_msgSend(v5, "length");
  if (v7)
  {
    v8 = v7;
    do
    {
      v9 = *v6++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v9);
      --v8;
    }
    while (v8);
  }
  v10 = objc_msgSend(v4, "copy");

  return v10;
}

- (_NSRange)crl_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
{
  id v8;
  void *v9;
  NSUInteger location;
  NSUInteger length;
  id v12;
  NSUInteger v13;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v8 = a3;
  v9 = v8;
  if (a5)
  {
    location = a5->location;
    length = a5->length;
    v12 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v8, a4, a5->location, length);
    v14 = v12;
    v15 = v13;
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      *a5 = (_NSRange)NSInvalidRange;
    }
    else if ((a4 & 4) != 0)
    {
      a5->location = location;
      a5->length = (NSUInteger)v12 - location;
    }
    else
    {
      a5->location = (NSUInteger)v12 + v13;
      a5->length = length + location - ((_QWORD)v12 + v13);
    }
  }
  else
  {
    v14 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v8, a4, 0, objc_msgSend(v8, "length"));
    v15 = v16;
  }

  v17 = (NSUInteger)v14;
  v18 = v15;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)crl_range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSString length](self, "length");
  v3 = 0;
  result.length = v2;
  result.location = v3;
  return result;
}

- (void)crl_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _BYTE *, int64_t, char *);
  id v8;
  _BYTE *v9;
  _BYTE *v10;
  char v11;

  v6 = a3;
  v7 = (void (**)(id, _BYTE *, int64_t, char *))a4;
  v8 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", self);
  objc_msgSend(v8, "setCaseSensitive:", 1);
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
  {
    do
    {
      v9 = objc_msgSend(v8, "scanLocation");
      if (objc_msgSend(v8, "scanCharactersFromSet:intoString:", v6, 0))
      {
        v10 = objc_msgSend(v8, "scanLocation");
        v11 = 0;
        v7[2](v7, v9, v10 - v9, &v11);
        if (v11)
          break;
      }
      if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
        objc_msgSend(v8, "scanUpToCharactersFromSet:intoString:", v6, 0);
    }
    while (!objc_msgSend(v8, "isAtEnd"));
  }

}

- (BOOL)crl_containsSubstring:(id)a3
{
  return -[NSString rangeOfString:](self, "rangeOfString:", a3) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)crl_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  CFIndex v6;
  const __CFLocale *v7;
  __CFStringTokenizer *v8;
  CFStringTokenizerTokenType v9;
  uint64_t v10;
  CFRange CurrentTokenRange;
  CFIndex location;
  CFIndex length;
  CFIndex v14;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  CFRange v18;
  CFIndex v19;
  CFIndex v20;
  int v21;
  CFRange v22;
  CFIndex v23;
  CFIndex v25;
  CFIndex v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  CFIndex v32;
  NSString *v33;
  CFIndex v34;
  _BOOL4 v35;
  void *v36;
  _QWORD v37[4];
  BOOL v38;
  CFRange v39;

  v3 = a3;
  v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100007F80;
  v37[3] = &unk_1000717D8;
  v35 = v3;
  v38 = v3;
  v5 = objc_retainBlock(v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = -[NSString length](self, "length");
  v7 = CFLocaleCopyCurrent();
  v32 = v6;
  v33 = self;
  v39.location = 0;
  v39.length = v6;
  v8 = CFStringTokenizerCreate(kCFAllocatorDefault, (CFStringRef)self, v39, 4uLL, v7);
  CFRelease(v7);
  v9 = CFStringTokenizerGoToTokenAtIndex(v8, 0);
  LODWORD(v10) = v9;
  if (!v9)
    ((void (*)(_QWORD *, __CFStringTokenizer *))v5[2])(v5, v8);
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
  if (CurrentTokenRange.location != -1)
  {
    location = CurrentTokenRange.location;
    length = CurrentTokenRange.length;
    v14 = 0;
    v15 = CurrentTokenRange.length;
    do
    {
      if (location >= v14)
        v16 = v14;
      else
        v16 = location;
      v34 = v16;
      v17 = ((uint64_t (*)(_QWORD *, __CFStringTokenizer *))v5[2])(v5, v8);
      v18 = CFStringTokenizerGetCurrentTokenRange(v8);
      v19 = v18.location;
      v20 = v18.length;
      if (v35)
      {
        while (1)
        {
          v21 = v10;
          v10 = v17;
          if (((v21 | v17) & 0x20) != 0)
          {
            if ((v17 & 0x10) == 0)
              goto LABEL_20;
          }
          else if ((v17 & 0x10) != 0 && v20 == 1)
          {
            if ((objc_msgSend(v36, "characterIsMember:", -[NSString characterAtIndex:](v33, "characterAtIndex:", v19)) & 1) != 0)
            {
              v29 = 1;
              goto LABEL_21;
            }
          }
          else if (!v17 || (v17 & 0x10) != 0)
          {
            goto LABEL_20;
          }
          v17 = ((uint64_t (*)(_QWORD *, __CFStringTokenizer *))v5[2])(v5, v8);
          v22 = CFStringTokenizerGetCurrentTokenRange(v8);
          v19 = v22.location;
          v20 = v22.length;
        }
      }
      v10 = v17;
LABEL_20:
      v29 = v20;
LABEL_21:
      v23 = location + v15;
      if (location + v15 <= v32)
        v23 = v32;
      if (v19 > v32 || v10 == 0)
        v14 = v23;
      else
        v14 = v19;
      if (v35)
        v25 = v34;
      else
        v25 = location;
      if (v35)
        v26 = v14 - v34;
      else
        v26 = length;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](v33, "substringWithRange:", v25, v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v36));

      if (objc_msgSend(v28, "length"))
        objc_msgSend(v31, "addObject:", v28);

      location = v19;
      length = v20;
      v15 = v29;
    }
    while (v19 != -1);
  }
  if (v8)
    CFRelease(v8);

  return v31;
}

- (id)crl_stringWithoutAttachmentCharacters
{
  if (qword_100085A48 != -1)
    dispatch_once(&qword_100085A48, &stru_1000717F8);
  return -[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", qword_100085A40, &stru_100075570);
}

- (id)crl_middleTruncateToLength:(unint64_t)a3
{
  NSString *v4;
  NSString *v5;

  v4 = self;
  if (-[NSString length](v4, "length") <= a3)
  {
    v5 = v4;
  }
  else
  {
    v5 = (NSString *)-[NSString mutableCopy](v4, "mutableCopy");
    do
      -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", (-[NSString length](v5, "length") >> 1) - 1, 3, CFSTR("…"));
    while (-[NSString length](v5, "length") > a3);

  }
  return v5;
}

- (BOOL)crl_isEqualToString:(id)a3
{
  if (a3)
    return -[NSString isEqualToString:](self, "isEqualToString:");
  else
    return 0;
}

- (id)crl_stringWithNormalizedHyphensAndQuotationMarks
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString crl_stringWithNormalizedHyphens](self, "crl_stringWithNormalizedHyphens"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crl_stringWithNormalizedQuotationMarks"));

  return v3;
}

- (id)crl_stringWithNormalizedHyphens
{
  if (qword_100085A50 != -1)
    dispatch_once(&qword_100085A50, &stru_100071818);
  return -[NSString crl_stringByReplacingInstancesOfCharactersInSet:withString:](self, "crl_stringByReplacingInstancesOfCharactersInSet:withString:", qword_100085A58, CFSTR("-"));
}

- (id)crl_stringWithNormalizedQuotationMarks
{
  if (qword_100085A60 != -1)
    dispatch_once(&qword_100085A60, &stru_100071838);
  return -[NSString crl_stringByReplacingInstancesOfCharactersInSet:withString:](self, "crl_stringByReplacingInstancesOfCharactersInSet:withString:", qword_100085A68, CFSTR("'"));
}

- (id)crl_stringWithoutBidiControls
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("\u200E\u200F\u202A\u202B\u202C\u202D\u202E⁦⁧⁨⁩")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString crl_stringByReplacingInstancesOfCharactersInSet:withString:](self, "crl_stringByReplacingInstancesOfCharactersInSet:withString:", v3, &stru_100075570));

  return v4;
}

- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("copy"), 0, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%1$@ %2$@"), 0, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%1$@ %2$@ %3$@"), 0, 0));

  v11 = objc_alloc_init((Class)NSNumberFormatter);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSString crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:numberFormatter:uniquenessTest:](self, "crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:numberFormatter:uniquenessTest:", v6, v8, v10, v11, v4));

  return v12;
}

- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t (**v16)(id, id);
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (uint64_t (**)(id, id))a7;
  v32 = 0;
  v17 = objc_claimAutoreleasedReturnValue(-[NSString crl_parseBaseTitleWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:outNumber:](self, "crl_parseBaseTitleWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:outNumber:", v12, v13, v14, &v32));
  v18 = (void *)v17;
  if (v17)
  {
    v33[0] = CFSTR("%1$@");
    v33[1] = CFSTR("%2$@");
    v30 = (void *)v17;
    v31 = v12;
    v34[0] = v17;
    v34[1] = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
    v20 = objc_msgSend(v19, "mutableCopy");

    for (i = -[NSString copy](self, "copy");
          -[NSString isEqualToString:](self, "isEqualToString:", i) || (v16[2](v16, i) & 1) == 0;
          i = (id)v28)
    {
      v22 = v32;
      v23 = ++v32;
      if (v22)
        v24 = v14;
      else
        v24 = v13;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringFromNumber:", v26));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("%3$@"));

      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "crl_stringByApplyingSubstitutions:", v20));
    }

    v18 = v30;
    v12 = v31;
  }
  else
  {
    i = -[NSString copy](self, "copy");
  }

  return i;
}

- (id)crl_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  unsigned int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  _BOOL4 v31;

  v4 = a4;
  v6 = a3;
  if ((id)-[NSString crl_countInstancesOfString:options:](self, "crl_countInstancesOfString:options:", CFSTR("%1$@"), 0) == (id)1&& (id)-[NSString crl_countInstancesOfString:options:](self, "crl_countInstancesOfString:options:", CFSTR("%2$@"), 0) == (id)1&& (v4|| (id)-[NSString crl_countInstancesOfString:options:](self, "crl_countInstancesOfString:options:", CFSTR("%3$@"), 0) == (id)1))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", CFSTR("%1$@")));
    v18[0] = v8;
    v19[0] = CFSTR("(.*)");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", CFSTR("%2$@")));
    v18[1] = v9;
    v19[1] = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", CFSTR("%3$@")));
    v18[2] = v10;
    v19[2] = CFSTR("(\\d+)");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_stringByApplyingSubstitutions:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v12, 0, 0));

  }
  else
  {
    v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071858);
    v15 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v21 = v14;
      v22 = 2082;
      v23 = "-[NSString(CRLAdditions) crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]";
      v24 = 2082;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
      v26 = 1024;
      v27 = 1137;
      v28 = 2114;
      v29 = self;
      v30 = 1024;
      v31 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid format string: %{public}@, isFirstCopyFormatString: %d", buf, 0x32u);
    }
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071878);
    v16 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v11, 1137, 0, "Invalid format string: %{public}@, isFirstCopyFormatString: %d", self, v4);
    v13 = 0;
  }

  return v13;
}

- (id)crl_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSString *v21;
  id v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:", v10, 0));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstMatchInString:options:range:", self, 0, 0, -[NSString length](self, "length")));
    if (v14)
    {
      v15 = objc_msgSend(v12, "rangeOfString:", CFSTR("%1$@"));
      v16 = objc_msgSend(v12, "rangeOfString:", CFSTR("%3$@"));
      if (v15 < v16)
        v17 = 1;
      else
        v17 = 2;
      if (v15 >= v16)
        v18 = 1;
      else
        v18 = 2;
      v19 = objc_msgSend(v14, "rangeAtIndex:", v17);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self, "substringWithRange:", v19, v20));
      v22 = objc_msgSend(v14, "rangeAtIndex:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self, "substringWithRange:", v22, v23));
      v25 = (unint64_t)objc_msgSend(v24, "integerValue");
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:", v10, 1));
      if (!v26)
      {
        v21 = self;
LABEL_22:

        goto LABEL_23;
      }
      v24 = v26;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstMatchInString:options:range:", self, 0, 0, -[NSString length](self, "length")));
      if (v32)
      {
        v27 = objc_msgSend(v11, "rangeOfString:", CFSTR("%1$@"));
        v25 = 1;
        if (v27 < objc_msgSend(v11, "rangeOfString:", CFSTR("%3$@")))
          v28 = 1;
        else
          v28 = 2;
        v29 = objc_msgSend(v32, "rangeAtIndex:", v28);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self, "substringWithRange:", v29, v30));
      }
      else
      {
        v21 = (NSString *)-[NSString copy](self, "copy");
        v25 = 0;
      }

    }
    if (a6)
      *a6 = v25;
    goto LABEL_22;
  }
  v21 = self;
LABEL_23:

  return v21;
}

- (id)crl_stringByApplyingSubstitutions:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  _BYTE v26[128];

  v4 = a3;
  v5 = -[NSString mutableCopy](self, "mutableCopy");
  v6 = objc_opt_new(NSMutableDictionary);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100008D98;
  v25[3] = &unk_1000718A0;
  v25[4] = v5;
  v25[5] = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_1000718E0));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v14, (_QWORD)v21));
        v16 = objc_msgSend(v14, "rangeValue");
        if (v15)
          v18 = v16 == (id)0x7FFFFFFFFFFFFFFFLL;
        else
          v18 = 1;
        if (!v18)
          objc_msgSend(v5, "replaceCharactersInRange:withString:", v16, v17, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  v19 = objc_msgSend(v5, "copy");
  return v19;
}

+ (id)crl_JSONStringFromString:(id)a3
{
  id v3;
  __CFString *v4;

  if (a3)
  {
    v3 = a3;
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    objc_msgSend(v3, "crl_appendJSONStringToString:", v4);

  }
  else
  {
    v4 = CFSTR("null");
  }
  return v4;
}

- (void)crl_appendJSONStringToString:(id)a3
{
  id v4;
  NSUInteger v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  int v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;

  v4 = a3;
  if (qword_100085A78 != -1)
    dispatch_once(&qword_100085A78, &stru_100071900);
  objc_msgSend(v4, "appendString:", CFSTR("\"));
  if (-[NSString rangeOfCharacterFromSet:](self, "rangeOfCharacterFromSet:", qword_100085A70) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = -[NSString length](self, "length");
    v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    -[NSString getCharacters:](self, "getCharacters:", v6);
    if (!v5)
    {
LABEL_30:
      free(v6);
      goto LABEL_31;
    }
    v7 = v6;
    while (1)
    {
      v9 = *v7++;
      v8 = v9;
      v14 = v9;
      if (v9 <= 33)
      {
        switch((int)v8)
        {
          case 8:
            v10 = v4;
            v11 = CFSTR("\\b");
            goto LABEL_23;
          case 9:
            v10 = v4;
            v11 = CFSTR("\\t");
            goto LABEL_23;
          case 10:
            v10 = v4;
            v11 = CFSTR("\\n");
            goto LABEL_23;
          case 12:
            v10 = v4;
            v11 = CFSTR("\\f");
            goto LABEL_23;
          case 13:
            v10 = v4;
            v11 = CFSTR("\\r");
            goto LABEL_23;
          default:
            goto LABEL_26;
        }
      }
      if ((int)v8 > 8231)
      {
        if ((_DWORD)v8 == 8232)
        {
          v10 = v4;
          v11 = CFSTR("\\u2028");
        }
        else
        {
          if ((_DWORD)v8 != 8233)
          {
LABEL_26:
            if (v8 < 0x20)
              v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\\u%.4x"), v8));
            else
              v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v14, 1));
            v13 = (void *)v12;
            objc_msgSend(v4, "appendString:", v12);

            goto LABEL_24;
          }
          v10 = v4;
          v11 = CFSTR("\\u2029");
        }
      }
      else if ((_DWORD)v8 == 34)
      {
        v10 = v4;
        v11 = CFSTR("\\\");
      }
      else
      {
        if ((_DWORD)v8 != 92)
          goto LABEL_26;
        v10 = v4;
        v11 = CFSTR("\\\\");
      }
LABEL_23:
      objc_msgSend(v10, "appendString:", v11);
LABEL_24:
      if (!--v5)
        goto LABEL_30;
    }
  }
  objc_msgSend(v4, "appendString:", self);
LABEL_31:
  objc_msgSend(v4, "appendString:", CFSTR("\"));

}

+ (id)crl_stringWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString objectWithItemProviderData:typeIdentifier:error:](NSString, "objectWithItemProviderData:typeIdentifier:error:", a3, v7, a5));
  if (!v8)
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071920);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004E134((uint64_t)v7, v9);
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071940);
    v10 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSString(CRLAdditions) crl_stringWithItemProviderData:typeIdentifier:error:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1331, 0, "Unable to make a string out of data with UTI %@", v7);

  }
  return v8;
}

- (id)crl_uncommentedAddress
{
  unint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  unint64_t v7;
  int v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  __uint32_t v16;
  id v17;
  char v19;
  char v20;

  v3 = -[NSString length](self, "length");
  v4 = (char *)NSZoneMalloc(0, 2 * v3 + 2);
  v5 = v4;
  v6 = v4;
  if (v3)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v19 = 0;
    v20 = 1;
    v6 = v4;
    do
    {
      v10 = -[NSString characterAtIndex:](self, "characterAtIndex:", v7);
      v11 = v10;
      if (v10 == 92)
      {
        if (v7 + 1 >= v3)
        {
          if ((v9 & 1) == 0)
          {
            if (v8 < 1)
              goto LABEL_18;
LABEL_15:
            v9 = 0;
            v8 -= v10 == 41;
            goto LABEL_24;
          }
LABEL_10:
          *(_WORD *)v6 = v10;
          v6 += 2;
          v9 &= v10 != 34;
          goto LABEL_24;
        }
        *(_WORD *)v6 = 92;
        *((_WORD *)v6 + 1) = -[NSString characterAtIndex:](self, "characterAtIndex:", v7 + 1);
        v6 += 4;
        ++v7;
      }
      else
      {
        if ((v9 & 1) != 0)
          goto LABEL_10;
        if (v10 == 40)
        {
          v9 = 0;
          ++v8;
        }
        else
        {
          if (v8 > 0)
            goto LABEL_15;
          if (v10 != 60)
          {
            if ((v19 & (v10 == 62)) != 0)
              break;
            if (v10 > 0x7F)
            {
              if (__maskrune(v10, 0x4000uLL))
              {
LABEL_19:
                v9 = 0;
                if ((v20 & 1) == 0)
                {
                  *(_WORD *)v6 = 32;
                  v6 += 2;
                }
                v20 = 1;
                goto LABEL_24;
              }
            }
            else
            {
LABEL_18:
              if ((_DefaultRuneLocale.__runetype[v10] & 0x4000) != 0)
                goto LABEL_19;
            }
            v20 = 0;
            *(_WORD *)v6 = v11;
            v6 += 2;
            v9 |= v11 == 34;
            goto LABEL_24;
          }
          v9 = 0;
          v19 = 1;
          v6 = v5;
        }
      }
LABEL_24:
      ++v7;
    }
    while (v7 < v3);
  }
  v12 = v6 - v5;
  do
  {
    v13 = v6;
    v14 = v12;
    if (v6 <= v5)
      break;
    v6 -= 2;
    v15 = *((unsigned __int16 *)v13 - 1);
    v16 = v15 > 0x7F ? __maskrune(v15, 0x4000uLL) : _DefaultRuneLocale.__runetype[v15] & 0x4000;
    v12 = v14 - 2;
  }
  while (v16);
  *(_WORD *)v13 = 0;
  v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithCharacters:length:", v5, v14 >> 1);
  NSZoneFree(0, v5);
  return v17;
}

- (id)crl_uncommentedAddressRespectingGroups
{
  id v3;
  id v4;
  NSString *v6;

  v3 = -[NSString rangeOfString:](self, "rangeOfString:", CFSTR("@"));
  v4 = -[NSString rangeOfString:](self, "rangeOfString:", CFSTR("<"));
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL && v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    v6 = self;
  else
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString crl_uncommentedAddress](self, "crl_uncommentedAddress"));
  return v6;
}

- (BOOL)crl_isCJKString
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  char *v8;
  BOOL v9;
  unint64_t i;
  unsigned int v11;
  int16x8_t v12;
  int16x4_t v13;
  char v14;
  BOOL v16;
  uint64_t v18;

  if (!-[NSString length](self, "length"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v3));

  v5 = objc_msgSend(v4, "length");
  if (!v5)
  {

    return 0;
  }
  v6 = v5;
  __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getCharacters:range:", v8, 0, v6);
  v9 = 0;
  for (i = 0; (id)i != v6; v9 = i >= (unint64_t)v6)
  {
    v11 = *(unsigned __int16 *)&v8[2 * i];
    v12 = vdupq_n_s16(v11);
    v13 = (int16x4_t)vand_s8(*(int8x8_t *)v12.i8, (int8x8_t)0xFFF0FFC0FF00FF80);
    v14 = vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)xmmword_100060A00, (uint16x8_t)vaddq_s16(v12, (int16x8_t)xmmword_1000609F0)))) | vmaxv_u16((uint16x4_t)vceq_s16(v13, (int16x4_t)0x3190300011002E80));
    v16 = (unsigned __int16)v11 >> 5 == 397 || (v13.i16[1] & 0xFF00) == 12800;
    if (!(v14 & 1 | ((unsigned __int16)(v11 + 464) < 0x20u || v16)) && v13.u16[1] != 13056)
      break;
    ++i;
  }

  return v9;
}

+ (id)crl_localizedDisplayNameWithPersonNameComponents:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v3, 0, 0));
    if (!v4)
    {
      if (CRLDefaultCat_init_token != -1)
        dispatch_once(&CRLDefaultCat_init_token, &stru_100071960);
      v5 = CRLDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR))
        sub_10004E1DC(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "givenName"));
      v7 = objc_msgSend(v6, "length");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "familyName"));
      v9 = objc_msgSend(v8, "length");
      if (v7 && v9)
      {
        if ((objc_msgSend(v6, "crl_isCJKString") & 1) != 0
          || objc_msgSend(v8, "crl_isCJKString"))
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v6));
        }
        else
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, v8));
        }
      }
      else if (v7)
      {
        v10 = v6;
      }
      else
      {
        if (!v9)
        {
          v4 = 0;
          goto LABEL_19;
        }
        v10 = v8;
      }
      v4 = v10;
LABEL_19:

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)crl_keyPathByRemovingLastKey
{
  id v3;
  __CFString *v4;

  v3 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("."), 6);
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    v4 = &stru_100075570;
  else
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", v3));
  return v4;
}

- (id)crl_keyPathByRemovingFirstKey
{
  char *v3;
  __CFString *v4;

  v3 = (char *)-[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("."), 2);
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
    v4 = &stru_100075570;
  else
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", v3 + 1));
  return v4;
}

- (id)crl_keyPathByPrependingKey:(id)a3
{
  NSString *v4;
  uint64_t v5;
  NSString *v6;
  void *v7;

  v4 = (NSString *)a3;
  if (!-[NSString length](self, "length"))
  {
    v6 = v4;
LABEL_6:
    v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v6));
    goto LABEL_7;
  }
  if (!-[NSString length](v4, "length"))
  {
    v6 = self;
    goto LABEL_6;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v4, self));
LABEL_7:
  v7 = (void *)v5;

  return v7;
}

- (id)crl_keyPathByAppendingKey:(id)a3
{
  NSString *v4;
  uint64_t v5;
  NSString *v6;
  void *v7;

  v4 = (NSString *)a3;
  if (!-[NSString length](self, "length"))
  {
    v6 = v4;
LABEL_6:
    v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v6));
    goto LABEL_7;
  }
  if (!-[NSString length](v4, "length"))
  {
    v6 = self;
    goto LABEL_6;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), self, v4));
LABEL_7:
  v7 = (void *)v5;

  return v7;
}

- (id)crl_firstKey
{
  NSString *v2;
  id v3;
  uint64_t v4;

  v2 = self;
  v3 = -[NSString rangeOfString:options:](v2, "rangeOfString:options:", CFSTR("."), 2);
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v2, "substringToIndex:", v3));

    v2 = (NSString *)v4;
  }
  return v2;
}

- (id)crl_lastKey
{
  NSString *v2;
  char *v3;
  uint64_t v4;

  v2 = self;
  v3 = (char *)-[NSString rangeOfString:options:](v2, "rangeOfString:options:", CFSTR("."), 6);
  if (v3 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v2, "substringFromIndex:", v3 + 1));

    v2 = (NSString *)v4;
  }
  return v2;
}

- (unint64_t)crl_numberOfKeysInKeyPath
{
  NSUInteger v3;
  char *v4;
  unint64_t v5;
  NSUInteger v6;
  char *v7;
  uint64_t v8;

  v3 = -[NSString length](self, "length");
  v4 = 0;
  v5 = 0;
  v6 = v3;
  do
  {
    v7 = (char *)-[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("."), 2, v4, v6);
    ++v5;
    v4 = &v7[v8];
    v6 = v3 - (_QWORD)&v7[v8];
  }
  while (&v7[v8] != (char *)0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

- (id)crl_initRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%s"), CFSTR("<REDACT %s REDACT>"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%@"), CFSTR("<REDACT %@ REDACT>"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{public}"), CFSTR("%"), 0, 0, objc_msgSend(v5, "length"));
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v5, a4);
  if (qword_100085A88 != -1)
    dispatch_once(&qword_100085A88, &stru_100071980);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100085A80, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), CFSTR("<redacted>")));

  return v7;
}

- (id)crl_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  NSString *v6;

  v5 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{public}"), CFSTR("%"), 0, 0, objc_msgSend(v5, "length"));
  v6 = -[NSString initWithFormat:arguments:](self, "initWithFormat:arguments:", v5, a4);

  return v6;
}

- (id)crl_initRedactedWithFormat:(id)a3
{
  uint64_t v4;

  return -[NSString crl_initRedactedWithFormat:arguments:](self, "crl_initRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

- (id)crl_initUnRedactedWithFormat:(id)a3
{
  uint64_t v4;

  return -[NSString crl_initUnRedactedWithFormat:arguments:](self, "crl_initUnRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

+ (id)crl_redactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "crl_initRedactedWithFormat:arguments:", v5, a4);

  return v6;
}

+ (id)crl_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "crl_initUnRedactedWithFormat:arguments:", v5, a4);

  return v6;
}

@end
