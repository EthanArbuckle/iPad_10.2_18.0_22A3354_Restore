@implementation CRLWPFontList

+ (id)sharedInstance
{
  if (qword_101415A88 != -1)
    dispatch_once(&qword_101415A88, &stru_10125EE30);
  return (id)qword_101415A80;
}

+ (id)excludedFamilyNames
{
  if (qword_101415A98 != -1)
    dispatch_once(&qword_101415A98, &stru_10125EE50);
  return (id)qword_101415A90;
}

- (CRLWPFontList)init
{
  CRLWPFontList *v2;
  uint64_t v3;
  NSDictionary *knownFonts;
  uint64_t v5;
  NSDictionary *knownFontFamilyFaces;
  id fontPropertyResolver;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLWPFontList;
  v2 = -[CRLWPFontList init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    knownFonts = v2->_knownFonts;
    v2->_knownFonts = (NSDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    knownFontFamilyFaces = v2->_knownFontFamilyFaces;
    v2->_knownFontFamilyFaces = (NSDictionary *)v5;

    fontPropertyResolver = v2->_fontPropertyResolver;
    v2->_fontPropertyResolver = &stru_10125EE90;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "downloadableFontsChanged:", CFSTR("CRLWPFontDownloadDidFinishNotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "fontsChanged:", kCTFontManagerRegisteredFontsChangedNotification, 0);

    -[CRLWPFontList loadRecentFonts](v2, "loadRecentFonts");
  }
  return v2;
}

- (void)loadRecentFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayForKey:", CFSTR("CRLWPFontRecentFontNames")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_arrayByMappingObjectsUsingBlock:", &stru_10125EED0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_10125EF10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

  -[CRLWPFontList setRecentFontNames:](self, "setRecentFontNames:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList recentFontNames](self, "recentFontNames"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[CRLWPFontList setRecentFontNames:](self, "setRecentFontNames:", v8);

  }
}

- (id)familiesForFontsInCollection:(__CTFontCollection *)a3
{
  void *v5;
  const __CFArray *v6;
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

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = CTFontCollectionCreateMatchingFontDescriptors(a3);
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList familyNameFromFontDescriptor:](self, "familyNameFromFontDescriptor:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)availableFontDescriptorsForAllFamilies
{
  CTFontCollectionRef v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  const __CFDictionary *v15;
  const __CTFontDescriptor *v16;
  CTFontDescriptorRef MatchingFontDescriptor;
  CTFontDescriptorRef v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  CTFontCollectionRef cf;
  NSSet *mandatoryAttributes;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  CFStringRef v40;
  uint64_t v41;
  _BYTE v42[128];

  v3 = CTFontCollectionCreateFromAvailableFonts(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v3)
  {
    *(_QWORD *)&v6 = objc_opt_class(self, v4).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "excludedFamilyNames", v6));
    mandatoryAttributes = +[NSSet setWithObject:](NSSet, "setWithObject:", kCTFontFamilyNameAttribute);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cf = v3;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontList familiesForFontsInCollection:](self, "familiesForFontsInCollection:", v3));
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
          {
            v40 = kCTFontFamilyNameAttribute;
            v41 = v14;
            v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
            v16 = CTFontDescriptorCreateWithAttributes(v15);

            if (v16)
            {
              MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v16, (CFSetRef)mandatoryAttributes);
              if (MatchingFontDescriptor)
              {
                v18 = MatchingFontDescriptor;
                objc_msgSend(v9, "setObject:forKeyedSubscript:", MatchingFontDescriptor, v14);

              }
              CFRelease(v16);
            }
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v11);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingSelector:", "compare:"));

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j)));
          objc_msgSend(v5, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v23);
    }

    CFRelease(cf);
  }
  return v5;
}

- (id)sortedFontFamilies
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  unsigned int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList availableFontDescriptorsForAllFamilies](self, "availableFontDescriptorsForAllFamilies"));
  v5 = v3;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v3, "count")));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList familyNameFromFontDescriptor:](self, "familyNameFromFontDescriptor:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v11)));
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125EF30);
            v14 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v34 = v13;
              v35 = 2082;
              v36 = "-[CRLWPFontList sortedFontFamilies]";
              v37 = 2082;
              v38 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m";
              v39 = 1024;
              v40 = 190;
              v41 = 2082;
              v42 = "familyName";
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125EF50);
            v15 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v18 = v15;
              v19 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v34 = v13;
              v35 = 2114;
              v36 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList sortedFontFamilies]"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 190, 0, "invalid nil value for '%{public}s'", "familyName");

          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v9);
    }

    v5 = v26;
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)&v20 = objc_opt_class(self, v4).n128_u64[0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1004514EC;
  v27[3] = &unk_101246FA8;
  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "excludedFamilyNames", v20));
  v22 = v28;
  objc_msgSend(v6, "crl_removeObjectsPassingTest:", v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sortedArrayUsingSelector:", "compare:"));

  return v24;
}

- (id)familyNameFromFontDescriptor:(__CTFontDescriptor *)a3
{
  const __CFString *v3;
  __CFString *v4;

  v3 = (const __CFString *)CTFontDescriptorCopyAttribute(a3, kCTFontFamilyNameAttribute);
  v4 = (__CFString *)v3;
  if (v3 && CFStringHasPrefix(v3, CFSTR(".")))
  {
    CFRelease(v4);
    v4 = 0;
  }
  return v4;
}

- (id)availableFontFamilies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList sortedFontFamilies](self, "sortedFontFamilies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList downloadedFonts](self, "downloadedFonts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5));

  return v6;
}

- (void)downloadableFontsChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRLWPFontRegisteredByURLFamilyNames")));
  -[CRLWPFontList registerDownloadedFontPostScriptNames:](self, "registerDownloadedFontPostScriptNames:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRLWPFontDownloadMatchedNames")));
  -[CRLWPFontList dropFontsWithPSNamesInSet:](self, "dropFontsWithPSNamesInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRLWPFontDownloadUnmatchedNames")));
  -[CRLWPFontList dropFontsWithPSNamesInSet:](self, "dropFontsWithPSNamesInSet:", v6);

}

- (void)fontsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125EF70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35B0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125EF90);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList fontsChanged:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 282, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLWPFontList setCachedAvailableFamilyFonts:](self, "setCachedAvailableFamilyFonts:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList normalizeChangedFontUrlsToStrings:forKey:](self, "normalizeChangedFontUrlsToStrings:forKey:", v4, CFSTR("CTFontManagerAvailableFontURLsAdded")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList normalizeChangedFontUrlsToStrings:forKey:](self, "normalizeChangedFontUrlsToStrings:forKey:", v4, CFSTR("CTFontManagerAvailableFontURLsRemoved")));

  -[CRLWPFontList dropFontsWithPSNamesInSet:](self, "dropFontsWithPSNamesInSet:", v8);
  -[CRLWPFontList dropFontsWithPSNamesInSet:](self, "dropFontsWithPSNamesInSet:", v9);
  v12[0] = CFSTR("CRLWPFontsAdded");
  v12[1] = CFSTR("CRLWPFontsRemoved");
  v13[0] = v8;
  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("CRLWPAvailableFontsChanged"), 0, v10);

}

- (id)normalizeChangedFontUrlsToStrings:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  _BYTE *v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = a3;
  v6 = a4;
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v29 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        objc_opt_class(NSURL, v10);
        v16 = sub_100221D0C(v15, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (!v18)
        {
          objc_opt_class(NSString, v17);
          if ((objc_opt_isKindOfClass(v14, v19) & 1) != 0)
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
          else
            v18 = 0;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fragment"));
        v21 = v20;
        if (v20 && !objc_msgSend(v20, "rangeOfString:", CFSTR("postscript-name=")))
        {
          v23 = v22;
          v24 = objc_msgSend(v21, "length");
          if (v23 <= (unint64_t)v24)
            v25 = v24;
          else
            v25 = (_BYTE *)v23;
          if (v23 >= (unint64_t)v24)
            v26 = v24;
          else
            v26 = (_BYTE *)v23;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringWithRange:", v26, v25 - v26));
          objc_msgSend(v30, "addObject:", v27);

        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  return v30;
}

- (id)postScriptNameForFamilyName:(id)a3
{
  return +[CRLWPFont postScriptNameForFamilyName:](CRLWPFont, "postScriptNameForFamilyName:", a3);
}

- (id)fontFacesForFontFamily:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cachedFacesOfFontFamily:](self, "cachedFacesOfFontFamily:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont facesOfFontFamily:](CRLWPFont, "facesOfFontFamily:", v4));
    -[CRLWPFontList cacheFaces:forFontFamily:](self, "cacheFaces:forFontFamily:", v5, v4);
  }

  return v5;
}

- (id)cachedFacesOfFontFamily:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList knownFontFamilyFaces](self, "knownFontFamilyFaces"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)cacheFaces:(id)a3 forFontFamily:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList knownFontFamilyFaces](self, "knownFontFamilyFaces"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);
  -[CRLWPFontList setKnownFontFamilyFaces:](self, "setKnownFontFamilyFaces:", v9);

}

- (void)reset
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CRLWPFontList setKnownFonts:](self, "setKnownFonts:", v3);

  -[CRLWPFontList setCachedAvailableFamilyFonts:](self, "setCachedAvailableFamilyFonts:", 0);
}

- (id)fontForPostscriptName:(id)a3
{
  id v4;
  void *v5;
  CRLWPFont *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cacheKeyForFontWithPostScriptName:atSize:bold:italic:](self, "cacheKeyForFontWithPostScriptName:atSize:bold:italic:", v4, 0, 0, 0.0));
  v6 = (CRLWPFont *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForKey:](self, "fontForKey:", v5));
  if (!v6)
  {
    v6 = -[CRLWPFont initWithDesiredPostScriptName:size:]([CRLWPFont alloc], "initWithDesiredPostScriptName:size:", v4, 0.0);
    -[CRLWPFontList cacheFont:withKey:](self, "cacheFont:withKey:", v6, v5);
  }

  return v6;
}

- (id)fontForPostscriptName:(id)a3 atSize:(double)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForPostscriptName:](self, "fontForPostscriptName:", a3));
  v6 = objc_msgSend(v5, "copyWithSize:", a4);

  return v6;
}

- (id)fontForPostscriptName:(id)a3 atSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cacheKeyForFontWithPostScriptName:atSize:bold:italic:](self, "cacheKeyForFontWithPostScriptName:atSize:bold:italic:", v10, v7, v6, a4));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForKey:](self, "fontForKey:", v11));
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForPostscriptName:](self, "fontForPostscriptName:", v10));
    v12 = objc_msgSend(v13, "copyWithSize:bold:italic:", v7, v6, a4);
    -[CRLWPFontList cacheFont:withKey:](self, "cacheFont:withKey:", v12, v11);

  }
  return v12;
}

- (void)cacheFont:(id)a3 forPostScriptName:(id)a4 atSize:(double)a5 bold:(BOOL)a6 italic:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cacheKeyForFontWithPostScriptName:atSize:bold:italic:](self, "cacheKeyForFontWithPostScriptName:atSize:bold:italic:", a4, v8, v7, a5));
  -[CRLWPFontList cacheFont:withKey:](self, "cacheFont:withKey:", v12, v13);

}

- (void)cacheFont:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList knownFonts](self, "knownFonts"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);
  -[CRLWPFontList setKnownFonts:](self, "setKnownFonts:", v9);

}

- (id)fontForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList knownFonts](self, "knownFonts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)cacheKeyForFontWithPostScriptName:(id)a3 atSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%f|%d|%d"), a3, *(_QWORD *)&a4, a5, a6);
}

- (id)cacheKeyForFontDescriptor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "postscriptName"));
  objc_msgSend(v3, "pointSize");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%f|%d|%d"), v4, v6, 0, 0));
  return v7;
}

- (void)dropFontsWithPSNamesInSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList knownFonts](self, "knownFonts"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004521BC;
  v10[3] = &unk_10125EFB8;
  v11 = v4;
  v8 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_arrayByTransformingWithBlock:", v10));
  objc_msgSend(v6, "removeObjectsForKeys:", v9);
  -[CRLWPFontList setKnownFonts:](self, "setKnownFonts:", v6);

}

- (id)fontFromStyle:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(NSString, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", 7, v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11
    || (*(_QWORD *)&v13 = objc_opt_class(NSString, v12).n128_u64[0],
        v15 = v14,
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", 9, v13)),
        v17 = sub_100221D0C(v15, v16),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v17),
        v16,
        v11))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForPostscriptName:](self, "fontForPostscriptName:", v11));

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)fontsForAvailableFamilies
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cachedAvailableFamilyFonts](self, "cachedAvailableFamilyFonts"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList availableFontDescriptorsForAllFamilies](self, "availableFontDescriptorsForAllFamilies", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList baseFontWithDescriptor:](self, "baseFontWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9)));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[CRLWPFontList setCachedAvailableFamilyFonts:](self, "setCachedAvailableFamilyFonts:", v4);
  }
  return (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cachedAvailableFamilyFonts](self, "cachedAvailableFamilyFonts"));
}

- (id)baseFontWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList cacheKeyForFontDescriptor:](self, "cacheKeyForFontDescriptor:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForKey:](self, "fontForKey:", v5));
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont baseFontWithDescriptor:](CRLWPFont, "baseFontWithDescriptor:", v4));
    -[CRLWPFontList cacheFont:withKey:](self, "cacheFont:withKey:", v6, v5);
  }

  return v6;
}

- (id)fontForStyles:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  uint64_t (**v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontPropertyResolver](self, "fontPropertyResolver"));
  v6 = ((uint64_t (**)(_QWORD, id, uint64_t))v5)[2](v5, v4, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = v7;
LABEL_4:
    v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontPropertyResolver](self, "fontPropertyResolver"));
    v12 = ((uint64_t (**)(_QWORD, id, uint64_t))v11)[2](v11, v4, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontPropertyResolver](self, "fontPropertyResolver"));
    v15 = ((uint64_t (**)(_QWORD, id, uint64_t))v14)[2](v14, v4, 13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontPropertyResolver](self, "fontPropertyResolver"));
    v18 = ((uint64_t (**)(_QWORD, id, uint64_t))v17)[2](v17, v4, 11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForPostscriptName:](self, "fontForPostscriptName:", v8));
    objc_msgSend(v19, "doubleValue");
    v22 = objc_msgSend(v20, "copyWithSize:bold:italic:", objc_msgSend(v13, "BOOLValue"), objc_msgSend(v16, "BOOLValue"), v21);

    goto LABEL_5;
  }
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontPropertyResolver](self, "fontPropertyResolver"));
  v10 = ((uint64_t (**)(_QWORD, id, uint64_t))v9)[2](v9, v4, 9);
  v8 = (id)objc_claimAutoreleasedReturnValue(v10);

  if (v8)
    goto LABEL_4;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125EFD8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E35C14();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125EFF8);
  v24 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList fontForStyles:]"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 482, 0, "invalid nil value for '%{public}s'", "currentFontName");

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125F018);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E35B90();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125F038);
  v27 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList fontForStyles:]"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 491, 0, "Failed to resolve font name");

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CRLWPFont missingFontPostScriptName](CRLWPFont, "missingFontPostScriptName"));
  v22 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontList fontForPostscriptName:](self, "fontForPostscriptName:", v8));
LABEL_5:

  return v22;
}

- (void)registerRecentFont:(id)a3
{
  id v4;
  void *v5;
  CRLWPOpaqueFontID *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F058);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35CB4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F078);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v6 = (CRLWPOpaqueFontID *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList registerRecentFont:]"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v8, 499, 0, "invalid nil value for '%{public}s'", "recentFont");
    goto LABEL_14;
  }
  if ((objc_msgSend(v4, "isFallbackFont") & 1) == 0)
  {
    v6 = -[CRLWPOpaqueFontID initWithFont:]([CRLWPOpaqueFontID alloc], "initWithFont:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList recentFontNames](self, "recentFontNames"));
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObject:", v6);
    objc_msgSend(v8, "insertObject:atIndex:", v6, 0);
    objc_msgSend(v8, "crl_trimObjectsFromIndex:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList recentFontNames](self, "recentFontNames"));
    v10 = objc_msgSend(v9, "isEqualToArray:", v8);

    if ((v10 & 1) == 0)
    {
      -[CRLWPFontList setRecentFontNames:](self, "setRecentFontNames:", v8);
      -[CRLWPFontList saveRecentFontNames:](self, "saveRecentFontNames:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("CRLWPRecentsFontsChangedNotification"), v5);

    }
LABEL_14:

  }
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@: <%p> Known Fonts: \n"), v5, self));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList knownFonts](self, "knownFonts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v6;
}

- (NSArray)recentBaseFonts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontList recentFontNames](self, "recentFontNames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crl_arrayByMappingObjectsUsingBlock:", &stru_10125F0B8));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_10125F0D8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return (NSArray *)v5;
}

- (void)saveRecentFontNames:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_arrayByMappingObjectsUsingBlock:", &stru_10125F118));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("CRLWPFontRecentFontNames"));

}

- (NSDictionary)knownFonts
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKnownFonts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)fontPropertyResolver
{
  return self->_fontPropertyResolver;
}

- (void)setFontPropertyResolver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)downloadedFonts
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDownloadedFonts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)knownFontFamilyFaces
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKnownFontFamilyFaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)recentFontNames
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecentFontNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)cachedAvailableFamilyFonts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedAvailableFamilyFonts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableFamilyFonts, 0);
  objc_storeStrong((id *)&self->_recentFontNames, 0);
  objc_storeStrong((id *)&self->_knownFontFamilyFaces, 0);
  objc_storeStrong((id *)&self->_downloadedFonts, 0);
  objc_storeStrong(&self->_fontPropertyResolver, 0);
  objc_storeStrong((id *)&self->_knownFonts, 0);
}

@end
