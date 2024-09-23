@implementation LanguageAssetLoader

+ (id)sharedInstance
{
  if (qword_10000C5C0 != -1)
    dispatch_once(&qword_10000C5C0, &stru_1000084E0);
  return (id)qword_10000C5B8;
}

- (LanguageAssetLoader)init
{
  LanguageAssetLoader *v2;
  __CFString *v3;
  __CFString *v4;
  CFTypeID v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LanguageAssetLoader;
  v2 = -[LanguageAssetLoader init](&v7, "init");
  if (v2)
  {
    v2->_langugeAssetsInfoPlist = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/usr/share/com.apple.languageassetd/AssetInfo.plist"));
    v2->_productType = 0;
    *(_WORD *)&v2->_needRedownload = 0;
    v2->_reachabilityRef = 0;
    v3 = (__CFString *)MGCopyAnswer(CFSTR("ProductType"), 0);
    if (v3)
    {
      v4 = v3;
      v5 = CFGetTypeID(v3);
      if (v5 == CFStringGetTypeID())
        v2->_productType = v4;
      else
        CFRelease(v4);
    }
    v2->_reachabilityRef = SCNetworkReachabilityCreateWithName(0, "mesu.apple.com");
    v2->_compatibilityVersion = DCSDictionaryAssetGetCompatibilityVersion();
  }
  return v2;
}

- (void)dealloc
{
  __CFString *productType;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  objc_super v6;

  productType = self->_productType;
  if (productType)
    CFRelease(productType);
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
    CFRelease(self->_reachabilityRef);
  }
  v6.receiver = self;
  v6.super_class = (Class)LanguageAssetLoader;
  -[LanguageAssetLoader dealloc](&v6, "dealloc");
}

- (void)setIsKeyboardsChanged:(BOOL)a3
{
  self->_isKeyboardsChanged = a3;
}

- (id)assetServerWithAssetType:(id)a3
{
  return (id)ASServerURLForAssetType(a3, 0);
}

- (void)logAssetsWithAssetType:(id)a3
{
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3 = (void *)objc_opt_new(MADownloadOptions, a2, a3);
  objc_msgSend(v3, "setDiscretionary:", 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002EFC;
  v4[3] = &unk_100008508;
  v4[4] = &v5;
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"), v3, v4);
  while (!*((_BYTE *)v6 + 24))
    -[NSRunLoop runUntilDate:](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "runUntilDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.1));

  _Block_object_dispose(&v5, 8);
}

- (void)reset
{
  if (qword_10000C5C8 != -1)
    dispatch_once(&qword_10000C5C8, &stru_100008528);
}

- (void)updatePreferenceWithAssetIdentifier:(__CFString *)a3
{
  __CFArray *Mutable;
  const __CFArray *v5;
  const __CFArray *v6;
  CFRange v7;

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v5 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AssetDownloadStarted"), CFSTR("com.apple.languageassetd"));
  if (v5)
  {
    v6 = v5;
    v7.length = CFArrayGetCount(v5);
    v7.location = 0;
    CFArrayAppendArray(Mutable, v6, v7);
    CFRelease(v6);
  }
  CFArrayAppendValue(Mutable, a3);
  CFPreferencesSetAppValue(CFSTR("AssetDownloadStarted"), Mutable, CFSTR("com.apple.languageassetd"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.languageassetd"));
  CFRelease(Mutable);
}

- (void)updatePreferenceWithLanguageOrID:(__CFString *)a3
{
  __CFArray *Mutable;
  const __CFArray *v5;
  const __CFArray *v6;
  CFRange v7;

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v5 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("HandledLanguages"), CFSTR("com.apple.languageassetd"));
  if (v5)
  {
    v6 = v5;
    v7.length = CFArrayGetCount(v5);
    v7.location = 0;
    CFArrayAppendArray(Mutable, v6, v7);
    CFRelease(v6);
  }
  CFArrayAppendValue(Mutable, a3);
  CFPreferencesSetAppValue(CFSTR("HandledLanguages"), Mutable, CFSTR("com.apple.languageassetd"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.languageassetd"));
  CFRelease(Mutable);
}

- (BOOL)alreadyHandledLanguageOrID:(__CFString *)a3
{
  const __CFArray *v4;
  const __CFArray *v5;
  BOOL v6;
  CFRange v8;

  v4 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("HandledLanguages"), CFSTR("com.apple.languageassetd"));
  if (!v4)
    return 0;
  v5 = v4;
  v8.length = CFArrayGetCount(v4);
  v8.location = 0;
  v6 = CFArrayContainsValue(v5, v8, a3) != 0;
  CFRelease(v5);
  return v6;
}

- (id)assetIdentifier:(id)a3 assetInfo:(id)a4
{
  id v6;
  id v8;
  id v9;
  void *v10;

  if (objc_msgSend(objc_msgSend(a3, "assetType"), "isEqualToString:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2")))
  {
    v6 = objc_msgSend(a3, "attributes");
    return objc_msgSend(v6, "objectForKey:", objc_msgSend(a4, "objectForKey:", CFSTR("IdentifierAttributeKey")));
  }
  v8 = objc_msgSend(a3, "assetType");
  if (objc_msgSend(v8, "isEqualToString:", kFSFontAssetType))
  {
    v9 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", objc_msgSend(a4, "objectForKey:", CFSTR("IdentifierContainerAttributeKey")));
    if (v9)
    {
      v10 = v9;
      if (objc_msgSend(v9, "count"))
      {
        v6 = objc_msgSend(v10, "objectAtIndex:", 0);
        return objc_msgSend(v6, "objectForKey:", objc_msgSend(a4, "objectForKey:", CFSTR("IdentifierAttributeKey")));
      }
    }
  }
  return 0;
}

- (BOOL)dictionaryAssetMatched:(id)a3 primaryLanguages:(id)a4 assetInfo:(id)a5
{
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("_CompatibilityVersion")), "integerValue") == (id)self->_compatibilityVersion&& DCSPreferredOrderOfDictionaryAssetAttributesForLanguages(objc_msgSend(a3, "attributes"), a4) != -1;
}

- (BOOL)fontAssetMatched:(id)a3 primaryLanguage:(id)a4 assetInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v8 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", objc_msgSend(a5, "objectForKey:", CFSTR("LanguageAttributeKey")));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12), "isEqualToString:", a4) & 1) != 0)
        {
          v9 = objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("LanguageAndFontFamilyNamesMapping")), "objectForKey:", a4);
          if (v9)
          {
            v13 = v9;
            v9 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", objc_msgSend(a5, "objectForKey:", CFSTR("IdentifierContainerAttributeKey")));
            if (v9)
            {
              v14 = v9;
              v9 = objc_msgSend(v9, "count");
              if (v9)
              {
                v21 = 0u;
                v22 = 0u;
                v19 = 0u;
                v20 = 0u;
                v9 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                if (v9)
                {
                  v15 = v9;
                  v16 = *(_QWORD *)v20;
                  while (2)
                  {
                    for (i = 0; i != v15; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v20 != v16)
                        objc_enumerationMutation(v14);
                      if ((objc_msgSend(v13, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "objectForKey:", objc_msgSend(a5, "objectForKey:", CFSTR("FontFamilyNameKey")))) & 1) != 0)
                      {
                        LOBYTE(v9) = 1;
                        return (char)v9;
                      }
                    }
                    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                    LOBYTE(v9) = 0;
                    if (v15)
                      continue;
                    break;
                  }
                }
              }
            }
          }
          return (char)v9;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v10 = v9;
      if (v9)
        continue;
      break;
    }
  }
  return (char)v9;
}

- (id)downloadOptions:(id)a3
{
  id v3;

  v3 = (id)objc_opt_new(MADownloadOptions, a2, a3);
  objc_msgSend(v3, "setAllowsCellularAccess:", 0);
  objc_msgSend(v3, "setDiscretionary:", 0);
  return v3;
}

- (id)alreadyInstalledAssetsWithPrimaryLanguages:(id)a3 results:(id)a4 assetInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  id v19;
  id v20;
  uint64_t v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a4;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v24 = *(_QWORD *)v30;
    v22 = kFSFontAssetType;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v12);
        if (objc_msgSend(v13, "state") != (id)1)
        {
          if (objc_msgSend(objc_msgSend(v13, "assetType"), "isEqualToString:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2")))
          {
            if (-[LanguageAssetLoader dictionaryAssetMatched:primaryLanguages:assetInfo:](self, "dictionaryAssetMatched:primaryLanguages:assetInfo:", v13, a3, a5))
            {
              v14 = -[LanguageAssetLoader assetIdentifier:assetInfo:](self, "assetIdentifier:assetInfo:", v13, a5);
              if (v14)
                objc_msgSend(v9, "addObject:", v14);
            }
          }
          else if (objc_msgSend(objc_msgSend(v13, "assetType"), "isEqualToString:", v22))
          {
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v26;
              do
              {
                for (i = 0; i != v16; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v26 != v17)
                    objc_enumerationMutation(a3);
                  if (-[LanguageAssetLoader fontAssetMatched:primaryLanguage:assetInfo:](self, "fontAssetMatched:primaryLanguage:assetInfo:", v13, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), a5))
                  {
                    v19 = -[LanguageAssetLoader assetIdentifier:assetInfo:](self, "assetIdentifier:assetInfo:", v13, a5);
                    if (v19)
                      objc_msgSend(v9, "addObject:", v19);
                  }
                }
                v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              }
              while (v16);
            }
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v12 != v11);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v11 = v20;
    }
    while (v20);
  }
  return v9;
}

- (BOOL)primaryLanguageIsInBlackList:(id)a3 assetType:(id)a4 assetInfo:(id)a5
{
  return !objc_msgSend(a4, "isEqualToString:", kFSFontAssetType)
      || objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("LanguageAndFontFamilyNamesMapping")), "objectForKey:", a3) != 0;
}

- (id)notificationStringWithPrimaryLanguage:(id)a3 assetInfo:(id)a4
{
  return objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("NotificationBaseKey")), "stringByAppendingString:", a3);
}

- (id)localAssetsWithType:(id)a3 assetInfo:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "state") != (id)1)
        {
          v13 = -[LanguageAssetLoader assetIdentifier:assetInfo:](self, "assetIdentifier:assetInfo:", v12, a4);
          if (v13)
          {
            v14 = v13;
            if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
              objc_msgSend(v7, "addObject:", v14);
          }
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  return v7;
}

- (id)filterIncompatibleFontAssets:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  void *v28;
  id v29;
  id obj;
  uint64_t v32;
  unsigned int v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v33 = FSGetMaxSupportedFontAssetCompatibilityVersion(self, a2);
  v6 = (void *)objc_opt_new(NSMutableDictionary, v4, v5);
  v36 = (id)objc_opt_new(NSMutableArray, v7, v8);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = a3;
  v34 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "attributes");
        v14 = objc_msgSend(v13, "objectForKey:", CFSTR("_CompatibilityVersion"));
        v15 = objc_msgSend(v14, "unsignedIntValue");
        if (v15 <= v33)
        {
          v16 = v15;
          objc_msgSend(v36, "addObject:", v12);
          v17 = objc_msgSend(v13, "objectForKey:", CFSTR("FontInfo4"));
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(_QWORD *)v42 != v20)
                  objc_enumerationMutation(v17);
                v22 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "objectForKey:", CFSTR("PostScriptFontName"));
                v23 = objc_msgSend(v6, "objectForKey:", v22);
                if (!v23 || objc_msgSend(v23, "intValue") < v16)
                  objc_msgSend(v6, "setValue:forKey:", v14, v22);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v19);
          }
        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v34);
  }
  v35 = (id)objc_opt_new(NSMutableArray, v9, v10);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v36);
        v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
        v29 = objc_msgSend(v28, "attributes");
        if (objc_msgSend(objc_msgSend(v6, "objectForKey:", objc_msgSend(objc_msgSend(objc_msgSend(v29, "objectForKey:", CFSTR("FontInfo4")), "objectAtIndexedSubscript:", 0), "objectForKey:", CFSTR("PostScriptFontName"))), "isEqualToNumber:", objc_msgSend(v29, "objectForKey:", CFSTR("_CompatibilityVersion"))))objc_msgSend(v35, "addObject:", v28);
      }
      v25 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v25);
  }

  return v35;
}

- (id)effectiveAssetFlagArrayForAssetInfo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  int v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _BOOL8 v28;
  int v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  uint64_t v39;
  id v40;
  void *context;
  id v43;
  NSMutableArray *v44;
  id v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("AssetType"));
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
  context = objc_autoreleasePoolPush();
  v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("MinCompatibilityVersion")), "integerValue");
  v7 = (char *)objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("MaxCompatibilityVersion")), "integerValue");
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  v11 = !v10 && v6 <= (uint64_t)v7;
  v12 = !v11;
  if (v12)
    v13 = 0;
  else
    v13 = v7;
  if (v12)
    v6 = 0;
  v14 = (void *)objc_opt_new(NSMutableArray, v8, v9);
  if (v6 > (uint64_t)v13)
  {
LABEL_20:
    if (objc_msgSend(v4, "isEqualToString:", kFSFontAssetType))
    {
      v16 = -[LanguageAssetLoader filterIncompatibleFontAssets:](self, "filterIncompatibleFontAssets:", v14);

    }
    else
    {
      v16 = v14;
    }
    v17 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (!v18)
    {
LABEL_50:
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v34 = -[NSMutableDictionary allKeys](v17, "allKeys");
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
            v40 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v39), "objectForKeyedSubscript:", CFSTR("asset"));
            if (objc_msgSend(v40, "state") == (id)3
              || objc_msgSend(v40, "state") != (id)1
              && objc_msgSend(objc_msgSend(objc_msgSend(v40, "attributes"), "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")), "integerValue") != (id)self->_compatibilityVersion)
            {
              objc_msgSend(v40, "purgeSync");
              objc_msgSend(v40, "refreshState");
              -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v39);
            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v36);
      }
      -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", -[NSMutableDictionary allValues](v17, "allValues"));
      goto LABEL_63;
    }
    v19 = v18;
    v20 = *(_QWORD *)v52;
    v44 = v5;
    v45 = v16;
    v43 = v4;
LABEL_25:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v20)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v21);
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2")) & 1) != 0)
      {
        v23 = objc_msgSend(objc_msgSend(v22, "attributes"), "objectForKeyedSubscript:", CFSTR("DictionaryPackageName"));
        if (v23)
        {
          v24 = v23;
          v25 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", CFSTR("asset"));
          if (!v25)
            goto LABEL_37;
          v26 = v25;
          if (objc_msgSend(objc_msgSend(objc_msgSend(v22, "attributes"), "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")), "integerValue") == (id)self->_compatibilityVersion)
          {
            if (objc_msgSend(objc_msgSend(objc_msgSend(v26, "attributes"), "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")), "integerValue") != (id)self->_compatibilityVersion|| (v27 = objc_msgSend(objc_msgSend(objc_msgSend(v22, "attributes"), "objectForKeyedSubscript:", CFSTR("_ContentVersion")), "integerValue"), v4 = v43, v11 = (uint64_t)v27 <= (uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v26, "attributes"), "objectForKeyedSubscript:", CFSTR("_ContentVersion")), "integerValue"), v16 = v45,
                  !v11)
              || objc_msgSend(v26, "state") == (id)3)
            {
              if (objc_msgSend(v26, "state") == (id)1)
              {
LABEL_37:
                v28 = 0;
LABEL_44:
                v56[0] = CFSTR("asset");
                v56[1] = CFSTR("downloadNeeded");
                v57[0] = v22;
                v57[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v28);
                v32 = -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2), "mutableCopy");
                -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v32, v24);

                goto LABEL_45;
              }
              v29 = 1;
              v30 = v26;
              v26 = v22;
LABEL_42:
              objc_msgSend(v30, "purgeSync");
              objc_msgSend(v30, "refreshState");
              v31 = objc_msgSend(v26, "state");
              v28 = v31 == (id)1;
              if (!v29)
              {
                v5 = v44;
                v16 = v45;
                if (v31 == (id)1)
                  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v24), "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("downloadNeeded"));
                goto LABEL_45;
              }
              v5 = v44;
              v16 = v45;
              goto LABEL_44;
            }
          }
          if (objc_msgSend(v22, "state") != (id)1)
          {
            v29 = 0;
            v30 = v22;
            goto LABEL_42;
          }
        }
      }
      else
      {
        -[NSMutableArray addObject:](v5, "addObject:", +[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v22, CFSTR("asset")));
      }
LABEL_45:
      if (v19 == (id)++v21)
      {
        v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        v19 = v33;
        if (!v33)
          goto LABEL_50;
        goto LABEL_25;
      }
    }
  }
  while (1)
  {
    v15 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", v4);
    objc_msgSend(v15, "returnTypes:", 2);
    objc_msgSend(v15, "setDoNotBlockBeforeFirstUnlock:", 1);
    if (v6 >= 1)
      objc_msgSend(v15, "addKeyValuePair:with:", CFSTR("_CompatibilityVersion"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v6));
    if (objc_msgSend(v15, "queryMetaDataSync"))
      break;
    objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v15, "results"));

    if (v13 + 1 == (char *)++v6)
      goto LABEL_20;
  }

  v5 = 0;
  self->_needRedownload = 1;
LABEL_63:
  objc_autoreleasePoolPop(context);
  return v5;
}

- (void)setDownloadFlagToAssetFlagArray:(id)a3 primaryLanguages:(id)a4 assetInfo:(id)a5
{
  void *v9;
  id v10;
  _UNKNOWN **v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  NSString *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  id v24;
  id v25;
  id v26;
  id v27;
  void *k;
  void *v29;
  id v30;
  id v31;
  id v32;
  NSString *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  id obj;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];

  v9 = objc_autoreleasePoolPush();
  v10 = objc_msgSend(a5, "objectForKey:", CFSTR("AssetType"));
  obj = a4;
  if (a4)
  {
    v39 = v9;
    v47 = v10;
    v42 = kFSFontAssetType;
    v11 = &ASServerURLForAssetType_ptr;
    v44 = a3;
    if (objc_msgSend(v10, "isEqualToString:"))
    {
      v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a4, "count"));
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v61 != v15)
              objc_enumerationMutation(a4);
            v17 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
            v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v47, v17);
            if (!-[LanguageAssetLoader alreadyHandledLanguageOrID:](self, "alreadyHandledLanguageOrID:", v18))
            {
              -[NSMutableArray addObject:](v12, "addObject:", v17);
              -[LanguageAssetLoader updatePreferenceWithLanguageOrID:](self, "updatePreferenceWithLanguageOrID:", v18);
            }
          }
          v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        }
        while (v14);
        obj = v12;
        a3 = v44;
        v11 = &ASServerURLForAssetType_ptr;
      }
      else
      {
        obj = v12;
      }
    }
    v19 = objc_msgSend(v11[38], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v57 != v22)
            objc_enumerationMutation(a3);
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j), "objectForKeyedSubscript:", CFSTR("asset")));
        }
        v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v21);
    }
    v24 = -[LanguageAssetLoader alreadyInstalledAssetsWithPrimaryLanguages:results:assetInfo:](self, "alreadyInstalledAssetsWithPrimaryLanguages:results:assetInfo:", obj, v19, a5);
    v25 = -[LanguageAssetLoader localAssetsWithType:assetInfo:](self, "localAssetsWithType:assetInfo:", v19, a5);
    v43 = (void *)DCSDictionaryAssetCopyRemovedDictionaryIdentifiers();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    if (v26)
    {
      v27 = v26;
      v46 = *(_QWORD *)v53;
      v40 = v25;
      v41 = v24;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(_QWORD *)v53 != v46)
            objc_enumerationMutation(v44);
          v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)k);
          v30 = objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("asset"));
          v31 = -[LanguageAssetLoader assetIdentifier:assetInfo:](self, "assetIdentifier:assetInfo:", v30, a5);
          if (v31)
          {
            v32 = v31;
            if ((objc_msgSend(v25, "containsObject:", v31) & 1) == 0
              && objc_msgSend(v30, "state") == (id)1
              && (objc_msgSend(v24, "containsObject:", v32) & 1) == 0)
            {
              if (objc_msgSend(objc_msgSend(v30, "assetType"), "isEqualToString:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2")))
              {
                if ((objc_msgSend(v43, "containsObject:", v32) & 1) == 0)
                {
                  v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v47, v32);
                  if (!-[LanguageAssetLoader alreadyHandledLanguageOrID:](self, "alreadyHandledLanguageOrID:", v33))
                  {
                    if (-[LanguageAssetLoader dictionaryAssetMatched:primaryLanguages:assetInfo:](self, "dictionaryAssetMatched:primaryLanguages:assetInfo:", v30, obj, a5))
                    {
                      -[LanguageAssetLoader updatePreferenceWithLanguageOrID:](self, "updatePreferenceWithLanguageOrID:", v33);
LABEL_37:
                      objc_msgSend(v29, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("downloadNeeded"));
                      v25 = v40;
                      v24 = v41;
                      continue;
                    }
                  }
                }
              }
              else if (objc_msgSend(objc_msgSend(v30, "assetType"), "isEqualToString:", v42))
              {
                v50 = 0u;
                v51 = 0u;
                v48 = 0u;
                v49 = 0u;
                v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                if (v34)
                {
                  v35 = v34;
                  v36 = *(_QWORD *)v49;
LABEL_41:
                  v37 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v49 != v36)
                      objc_enumerationMutation(obj);
                    v38 = *(__CFString **)(*((_QWORD *)&v48 + 1) + 8 * v37);
                    if (-[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("zh-HK")))
                      v38 = CFSTR("zh-Hant");
                    if (-[LanguageAssetLoader primaryLanguageIsInBlackList:assetType:assetInfo:](self, "primaryLanguageIsInBlackList:assetType:assetInfo:", v38, v47, a5)&& -[LanguageAssetLoader fontAssetMatched:primaryLanguage:assetInfo:](self, "fontAssetMatched:primaryLanguage:assetInfo:", v30, v38, a5))
                    {
                      goto LABEL_37;
                    }
                    if (v35 == (id)++v37)
                    {
                      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                      v25 = v40;
                      v24 = v41;
                      if (v35)
                        goto LABEL_41;
                      break;
                    }
                  }
                }
              }
            }
          }
        }
        v27 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      }
      while (v27);
    }

    v9 = v39;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100005C4C();
  }
  objc_autoreleasePoolPop(v9);
}

- (BOOL)isPowerRequestSatisfied
{
  int v3;

  if ((IOPSDrawingUnlimitedPower(self, a2) & 1) != 0)
    return 1;
  v3 = 0;
  IOPSGetPercentRemaining(&v3, 0, 0);
  return v3 > 30;
}

- (void)purgeLocalFontAssetsWithType:(id)a3 mobileAssetVersionV2:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[128];

  if (a4)
  {
    v4 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", a3);
    objc_msgSend(v4, "returnTypes:", 1);
    objc_msgSend(v4, "setDoNotBlockBeforeFirstUnlock:", 1);
    if (!objc_msgSend(v4, "queryMetaDataSync"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = objc_msgSend(v4, "results", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v10, "state") != (id)1)
              objc_msgSend(v10, "purgeSync");
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        }
        while (v7);
      }
    }
  }
  else
  {
    v4 = objc_msgSend(objc_alloc((Class)ASAssetQuery), "initWithAssetType:", a3);
    objc_msgSend(v4, "setQueriesLocalAssetInformationOnly:", 1);
    v27 = 0;
    v11 = objc_msgSend(v4, "runQueryAndReturnError:", &v27);
    v12 = v27;
    if (v27)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_100005C90(v12);
    }
    else
    {
      v13 = v11;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v18, "state"))
              objc_msgSend(v18, "purgeAndReturnError:", 0);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v15);
      }
    }
  }

}

- (BOOL)checkFontAssetsSanityWithLanguageAssetInfo:(id)a3
{
  -[LanguageAssetLoader purgeLocalFontAssetsWithType:mobileAssetVersionV2:](self, "purgeLocalFontAssetsWithType:mobileAssetVersionV2:", CFSTR("com.apple.MobileAsset.Font"), 0);
  -[LanguageAssetLoader purgeLocalFontAssetsWithType:mobileAssetVersionV2:](self, "purgeLocalFontAssetsWithType:mobileAssetVersionV2:", CFSTR("com.apple.MobileAsset.Font2"), 0);
  -[LanguageAssetLoader purgeLocalFontAssetsWithType:mobileAssetVersionV2:](self, "purgeLocalFontAssetsWithType:mobileAssetVersionV2:", CFSTR("com.apple.MobileAsset.Font3"), 0);
  -[LanguageAssetLoader purgeLocalFontAssetsWithType:mobileAssetVersionV2:](self, "purgeLocalFontAssetsWithType:mobileAssetVersionV2:", CFSTR("com.apple.MobileAsset.Font4"), 0);
  -[LanguageAssetLoader purgeLocalFontAssetsWithType:mobileAssetVersionV2:](self, "purgeLocalFontAssetsWithType:mobileAssetVersionV2:", CFSTR("com.apple.MobileAsset.Font5"), 0);
  return 1;
}

- (BOOL)shouldExcludeProductWithLanguageAssetInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->_productType)
  {
    v4 = objc_msgSend(a3, "objectForKey:", CFSTR("ExclusionProductTypesKey"));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          if ((-[__CFString hasPrefix:](self->_productType, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v5) = 0;
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (id)normalizedLanguage:(id)a3
{
  NSDictionary *v3;
  __CFString *v4;
  __CFString *v5;
  id v6;
  unsigned int v8;
  const __CFString *v9;

  v3 = +[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", a3);
  v4 = -[NSDictionary objectForKey:](v3, "objectForKey:", NSLocaleLanguageCode);
  if (v4)
  {
    v5 = -[NSDictionary objectForKey:](v3, "objectForKey:", NSLocaleCountryCode);
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("zh")))
    {
      v6 = -[NSDictionary objectForKey:](v3, "objectForKey:", NSLocaleScriptCode);
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Hans")) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", CFSTR("Hant")))
      {
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
      }
      if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("HK")) & 1) != 0)
      {
        return CFSTR("zh-Hant");
      }
      else
      {
        v4 = CFSTR("zh-Hant");
        if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("MO")) & 1) == 0
          && !-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("TW")))
        {
          return 0;
        }
      }
    }
    else if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("en")))
    {
      v8 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("SG"));
      v9 = CFSTR("GB");
      if (!v8)
        v9 = v5;
      if (v9)
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v4, v9);
    }
  }
  return v4;
}

- (void)actualDownloadLanguageAssets
{
  id v3;
  NSDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  _QWORD v16[7];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  self->_needRedownload = 0;
  if (-[LanguageAssetLoader isPowerRequestSatisfied](self, "isPowerRequestSatisfied"))
  {
    v3 = -[NSDictionary objectForKey:](self->_langugeAssetsInfoPlist, "objectForKey:", CFSTR("LanguageAssets"));
    v4 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/System/Library/PrivateFrameworks/FontServices.framework/FontAssetInfo.plist"));
    if (v4)
      v3 = objc_msgSend(v3, "arrayByAddingObject:", v4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      v15 = (void *)kFSFontAssetType;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v3);
          v9 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v10 = objc_msgSend(v9, "objectForKey:", CFSTR("AssetType"));
          if (objc_msgSend(objc_msgSend(v9, "objectForKey:", CFSTR("Download")), "BOOLValue")
            && !-[LanguageAssetLoader shouldExcludeProductWithLanguageAssetInfo:](self, "shouldExcludeProductWithLanguageAssetInfo:", v9))
          {
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileAsset.Font")))
            {
              v9 = objc_msgSend(v9, "mutableCopy");
              v10 = v15;
              objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("AssetType"));
            }
            v13 = (void *)objc_opt_new(MADownloadOptions, v11, v12);
            objc_msgSend(v13, "setAllowsCellularAccess:", 0);
            objc_msgSend(v13, "setDiscretionary:", 0);
            NSLog(CFSTR("startCatalogDownload: assetType=[%@]"), v10);
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_10000525C;
            v16[3] = &unk_100008550;
            v16[4] = v10;
            v16[5] = self;
            v16[6] = v9;
            +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", v10, v13, v16);

          }
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  self->_needRedownload = v14;
}

- (void)downloadLanguageAssets
{
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  __SCNetworkReachability *v5;
  __SCNetworkReachability *v6;
  __CFRunLoop *v7;
  SCNetworkReachabilityContext v8;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
  -[LanguageAssetLoader actualDownloadLanguageAssets](self, "actualDownloadLanguageAssets");
  if (self->_needRedownload)
  {
    v5 = self->_reachabilityRef;
    if (v5)
    {
      v8.version = 0;
      memset(&v8.retain, 0, 24);
      v8.info = self;
      if (SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)sub_100005964, &v8))
      {
        v6 = self->_reachabilityRef;
        v7 = CFRunLoopGetCurrent();
        SCNetworkReachabilityScheduleWithRunLoop(v6, v7, kCFRunLoopDefaultMode);
      }
    }
  }
}

- (id)oldDictionaryAssetsWithLanguageAssetInfo:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = objc_msgSend(objc_alloc((Class)ASAssetQuery), "initWithAssetType:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"));
  objc_msgSend(v4, "setQueriesLocalAssetInformationOnly:", 1);
  v5 = objc_msgSend(v4, "runQueryAndReturnError:", 0);
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "state") == (id)1)
        {
          v12 = objc_msgSend(objc_msgSend(v11, "attributes"), "objectForKey:", objc_msgSend(a3, "objectForKey:", CFSTR("IdentifierAttributeKey")));
          -[NSMutableArray addObject:](v6, "addObject:", v12);
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100005B48;
          v14[3] = &unk_100008578;
          v14[4] = v12;
          objc_msgSend(v11, "purge:", v14);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (-[NSMutableArray count](v6, "count"))
    return v6;
  else
    return 0;
}

- (void)reachabilityChanged
{
  __SCNetworkReachability *reachabilityRef;
  BOOL v4;
  __SCNetworkReachability *v5;
  __CFRunLoop *Current;
  SCNetworkReachabilityFlags flags;

  if (self->_needRedownload)
  {
    reachabilityRef = self->_reachabilityRef;
    if (reachabilityRef)
    {
      flags = 0;
      if (SCNetworkReachabilityGetFlags(reachabilityRef, &flags))
        v4 = (flags & 2) == 0;
      else
        v4 = 1;
      if (!v4)
      {
        -[LanguageAssetLoader actualDownloadLanguageAssets](self, "actualDownloadLanguageAssets");
        if (!self->_needRedownload)
        {
          v5 = self->_reachabilityRef;
          Current = CFRunLoopGetCurrent();
          SCNetworkReachabilityUnscheduleFromRunLoop(v5, Current, kCFRunLoopDefaultMode);
        }
      }
    }
  }
}

@end
