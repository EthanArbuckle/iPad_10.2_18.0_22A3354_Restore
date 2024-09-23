uint64_t start()
{
  void *v0;

  v0 = objc_autoreleasePoolPush();
  -[LanguageAssetLoaderDaemon run](+[LanguageAssetLoaderDaemon sharedInstance](LanguageAssetLoaderDaemon, "sharedInstance"), "run");
  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_10000286C(id a1)
{
  qword_10000C5A8 = objc_alloc_init(LanguageAssetLoaderDaemon);
}

void sub_100002964(id a1, OS_xpc_object *a2)
{
  const char *string;
  NSString *v3;
  _BOOL4 v4;
  int64_t v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v9;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string);
    CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy"));
    if (CFPreferencesGetAppBooleanValue(CFSTR("ForceNoBuddy"), CFSTR("com.apple.purplebuddy"), 0))
      v4 = 0;
    else
      v4 = CFPreferencesGetAppBooleanValue(CFSTR("SetupDone"), CFSTR("com.apple.purplebuddy"), 0) == 0;
    if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.purplebuddy.setupdone"))
      && (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("AppleLanguagePreferencesChangedNotification"))
       || v4)
      && (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("AppleKeyboardsPreferencesChangedNotification"))
       || v4))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[_setupXPCEventHandler] needn't handle event: %@", buf, 0xCu);
      }
    }
    else
    {
      -[LanguageAssetLoader setIsKeyboardsChanged:](+[LanguageAssetLoader sharedInstance](LanguageAssetLoader, "sharedInstance"), "setIsKeyboardsChanged:", -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("AppleKeyboardsPreferencesChangedNotification")));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100002B6C;
      block[3] = &unk_100008388;
      block[4] = v3;
      if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.purplebuddy.setupdone")))
        v5 = 60000000000;
      else
        v5 = 1000000000;
      v6 = dispatch_time(0, v5);
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

id sub_100002B6C(uint64_t a1)
{
  NSLog(CFSTR("downloadLanguageAssets: eventString=[%@]"), *(_QWORD *)(a1 + 32));
  return -[LanguageAssetLoader downloadLanguageAssets](+[LanguageAssetLoader sharedInstance](LanguageAssetLoader, "sharedInstance"), "downloadLanguageAssets");
}

void sub_100002BE4(id a1, OS_xpc_object *a2)
{
  xpc_connection_set_event_handler(a2, &stru_1000083C8);
  xpc_connection_resume(a2);
}

void sub_100002C58(id a1)
{
  qword_10000C5B8 = objc_alloc_init(LanguageAssetLoader);
}

void sub_100002EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002EFC(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (a2)
  {
    NSLog(CFSTR("Catelog download failed. Error=%ld"), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v3 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"));
    objc_msgSend(v3, "returnTypes:", 2);
    objc_msgSend(v3, "setDoNotBlockBeforeFirstUnlock:", 1);
    v4 = objc_msgSend(v3, "queryMetaDataSync");
    if (v4)
    {
      NSLog(CFSTR("Query meta data failed. Error=%ld"), v4);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = objc_msgSend(v3, "results");
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
            v11 = objc_msgSend(objc_msgSend(v10, "attributes"), "objectForKey:", CFSTR("DictionaryPackageName"));
            if (objc_msgSend(v10, "state") == (id)2)
              NSLog(CFSTR("Local asset: %@"), v11);
            else
              NSLog(CFSTR("Remote asset: %@"), v11);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

  }
}

void sub_1000030F0(id a1)
{
  const __CFDictionary *v1;
  const __CFString *v2;
  const __CFString *Value;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v1 = (const __CFDictionary *)_CFCopySystemVersionDictionary(a1);
  if (v1)
  {
    v2 = (const __CFString *)v1;
    Value = (const __CFString *)CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
    if (Value)
    {
      v4 = Value;
      CFRetain(Value);
      CFRelease(v2);
      v5 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("LastSystemVersion"), CFSTR("com.apple.languageassetd"));
      if (v5)
      {
        v6 = v5;
        if (CFStringCompare(v4, v5, 1uLL))
        {
          CFPreferencesSetAppValue(CFSTR("AssetDownloadStarted"), 0, CFSTR("com.apple.languageassetd"));
          CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), v4, CFSTR("com.apple.languageassetd"));
          CFPreferencesSetAppValue(CFSTR("HandledLanguages"), 0, CFSTR("com.apple.languageassetd"));
          CFPreferencesAppSynchronize(CFSTR("com.apple.languageassetd"));
          ASSetAssetServerURLForAssetType(0, CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"));
        }
        CFRelease(v6);
      }
      else
      {
        CFPreferencesSetAppValue(CFSTR("AssetDownloadStarted"), 0, CFSTR("com.apple.languageassetd"));
        CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), v4, CFSTR("com.apple.languageassetd"));
        CFPreferencesSetAppValue(CFSTR("HandledLanguages"), 0, CFSTR("com.apple.languageassetd"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.languageassetd"));
        ASSetAssetServerURLForAssetType(0, CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"));
      }
    }
    else
    {
      v4 = v2;
    }
    CFRelease(v4);
  }
}

void sub_10000525C(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  NSMutableArray *v18;
  NSArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  id v24;
  id v25;
  void *m;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *n;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *ii;
  void *v38;
  id v39;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  id v44;
  _QWORD v45[7];
  __int128 v46;
  __int128 v47;
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
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];

  NSLog(CFSTR("startCatalogDownload completed: assetType=[%@] result=%ld"), *(_QWORD *)(a1 + 32), a2);
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
  }
  else if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", kFSFontAssetType)
         || objc_msgSend(*(id *)(a1 + 40), "checkFontAssetsSanityWithLanguageAssetInfo:", *(_QWORD *)(a1 + 48)))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "effectiveAssetFlagArrayForAssetInfo:", *(_QWORD *)(a1 + 48));
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24))
    {
      v5 = v4;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v67 != v9)
              objc_enumerationMutation(v5);
            v8 += objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("downloadNeeded")), "BOOLValue");
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        }
        while (v7);
      }
      else
      {
        v8 = 0;
      }
      v11 = objc_msgSend(+[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController"), "enabledInputModeIdentifiers");
      v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v63 != v15)
              objc_enumerationMutation(v11);
            v17 = objc_msgSend(*(id *)(a1 + 40), "normalizedLanguage:", TIInputModeGetLanguageWithRegion(*(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j)));
            if (v17)
              -[NSMutableArray addObject:](v12, "addObject:", v17);
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        }
        while (v14);
      }
      objc_msgSend(*(id *)(a1 + 40), "setDownloadFlagToAssetFlagArray:primaryLanguages:assetInfo:", v5, v12, *(_QWORD *)(a1 + 48));
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 25))
      {
        v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
        v19 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v59;
          do
          {
            for (k = 0; k != v21; k = (char *)k + 1)
            {
              if (*(_QWORD *)v59 != v22)
                objc_enumerationMutation(v19);
              v24 = objc_msgSend(*(id *)(a1 + 40), "normalizedLanguage:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k));
              if (v24)
                -[NSMutableArray addObject:](v18, "addObject:", v24);
            }
            v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
          }
          while (v21);
        }
        objc_msgSend(*(id *)(a1 + 40), "setDownloadFlagToAssetFlagArray:primaryLanguages:assetInfo:", v5, v18, *(_QWORD *)(a1 + 48));
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2")))
      {
        v25 = objc_msgSend(*(id *)(a1 + 40), "oldDictionaryAssetsWithLanguageAssetInfo:", *(_QWORD *)(a1 + 48));
        if (!((char *)objc_msgSend(v25, "count") + v8))
          v25 = (id)DCSDictionaryAssetCopyDownloadedDictionaryIdentifiers();
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v44 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
        if (v44)
        {
          obj = v25;
          v43 = *(_QWORD *)v55;
          do
          {
            for (m = 0; m != v44; m = (char *)m + 1)
            {
              if (*(_QWORD *)v55 != v43)
                objc_enumerationMutation(obj);
              v27 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)m);
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v53 = 0u;
              v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v51;
                while (2)
                {
                  for (n = 0; n != v29; n = (char *)n + 1)
                  {
                    if (*(_QWORD *)v51 != v30)
                      objc_enumerationMutation(v5);
                    v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)n);
                    v33 = objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("asset"));
                    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "assetIdentifier:assetInfo:", v33, *(_QWORD *)(a1 + 48)), "isEqualToString:", v27))
                    {
                      if (objc_msgSend(v33, "state") == (id)1)
                        objc_msgSend(v32, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("downloadNeeded"));
                      goto LABEL_54;
                    }
                  }
                  v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
                  if (v29)
                    continue;
                  break;
                }
              }
LABEL_54:
              ;
            }
            v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
          }
          while (v44);
        }
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v34 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v47;
        do
        {
          for (ii = 0; ii != v35; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v47 != v36)
              objc_enumerationMutation(v5);
            v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)ii);
            if (objc_msgSend(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("downloadNeeded")), "BOOLValue"))
            {
              v39 = objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("asset"));
              v40 = objc_msgSend(*(id *)(a1 + 40), "assetIdentifier:assetInfo:", v39, *(_QWORD *)(a1 + 48));
              objc_msgSend(*(id *)(a1 + 40), "updatePreferenceWithAssetIdentifier:", v40);
              NSLog(CFSTR("AssetType:%@: start downloading asset \"%@\""), *(_QWORD *)(a1 + 32), v40);
              v41 = objc_msgSend(*(id *)(a1 + 40), "downloadOptions:", *(_QWORD *)(a1 + 32));
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_100005858;
              v45[3] = &unk_100008550;
              v45[4] = *(_QWORD *)(a1 + 32);
              v45[5] = v40;
              v45[6] = v39;
              objc_msgSend(v39, "startDownload:then:", v41, v45);
            }
          }
          v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
        }
        while (v35);
      }
    }
  }
}

id sub_100005858(uint64_t a1, uint64_t a2)
{
  id result;

  NSLog(CFSTR("AssetType:%@: download completed: asset \"%@\", result=%ld"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.MobileAsset.DictionaryServices.dictionary2"));
  if ((_DWORD)result)
    return (id)DCSDictionaryAssetAttributesDownloaded(objc_msgSend(*(id *)(a1 + 48), "attributes"));
  return result;
}

id sub_100005964(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "reachabilityChanged");
}

void sub_100005B48(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("V1 dictionary (%@) was installed and purged with error=%@"), *(_QWORD *)(a1 + 32), a2);
}

void sub_100005BF8()
{
  if (qword_10000C5D0 != -1)
    dispatch_once(&qword_10000C5D0, &stru_100008598);
}

void sub_100005C20(id a1)
{
  qword_10000C5D8 = (uint64_t)os_log_create("com.apple.LanguageAssetLoader", "LanguageAssetLoaderLog");
}

void sub_100005C4C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\t primaryLanguage is nil. Return.", v0, 2u);
}

void sub_100005C90(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\t Error running language asset query: error %@.", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend__daemonDidLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_daemonDidLaunch");
}

id objc_msgSend_actualDownloadLanguageAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actualDownloadLanguageAssets");
}

id objc_msgSend_addKeyValuePair_with_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addKeyValuePair:with:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_alreadyHandledLanguageOrID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alreadyHandledLanguageOrID:");
}

id objc_msgSend_alreadyInstalledAssetsWithPrimaryLanguages_results_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alreadyInstalledAssetsWithPrimaryLanguages:results:assetInfo:");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_assetIdentifier_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetIdentifier:assetInfo:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetType");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_checkFontAssetsSanityWithLanguageAssetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkFontAssetsSanityWithLanguageAssetInfo:");
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsFromLocaleIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dictionaryAssetMatched_primaryLanguages_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryAssetMatched:primaryLanguages:assetInfo:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_downloadOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadOptions:");
}

id objc_msgSend_effectiveAssetFlagArrayForAssetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveAssetFlagArrayForAssetInfo:");
}

id objc_msgSend_enabledInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledInputModeIdentifiers");
}

id objc_msgSend_filterIncompatibleFontAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterIncompatibleFontAssets:");
}

id objc_msgSend_fontAssetMatched_primaryLanguage_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontAssetMatched:primaryLanguage:assetInfo:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initWithAssetType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetType:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPowerRequestSatisfied(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPowerRequestSatisfied");
}

id objc_msgSend_localAssetsWithType_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localAssetsWithType:assetInfo:");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_normalizedLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "normalizedLanguage:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldDictionaryAssetsWithLanguageAssetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldDictionaryAssetsWithLanguageAssetInfo:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_primaryLanguageIsInBlackList_assetType_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryLanguageIsInBlackList:assetType:assetInfo:");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purge:");
}

id objc_msgSend_purgeAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeAndReturnError:");
}

id objc_msgSend_purgeLocalFontAssetsWithType_mobileAssetVersionV2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeLocalFontAssetsWithType:mobileAssetVersionV2:");
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeSync");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryMetaDataSync");
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshState");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runQueryAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runQueryAndReturnError:");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDownloadFlagToAssetFlagArray_primaryLanguages_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadFlagToAssetFlagArray:primaryLanguages:assetInfo:");
}

id objc_msgSend_setIsKeyboardsChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsKeyboardsChanged:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setQueriesLocalAssetInformationOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueriesLocalAssetInformationOnly:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInputModeController");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldExcludeProductWithLanguageAssetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldExcludeProductWithLanguageAssetInfo:");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updatePreferenceWithAssetIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePreferenceWithAssetIdentifier:");
}

id objc_msgSend_updatePreferenceWithLanguageOrID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePreferenceWithLanguageOrID:");
}
