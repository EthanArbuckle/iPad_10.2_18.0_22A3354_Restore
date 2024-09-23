uint64_t WLKIsRegulatedSKU()
{
  int v0;
  void *v1;
  void *v2;
  _BOOL4 v3;
  uint64_t v4;

  v0 = MGGetBoolAnswer();
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("CH")) == 0;
  else
    v3 = 0;
  v4 = v0 | v3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    WLKIsRegulatedSKU_cold_1(v4);

  return v4;
}

void WLKIsRegulatedSKU_cold_1(char a1)
{
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v1 = CFSTR("YES");
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1B515A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[WLKRegionUtilities]: Is regulated SKU: %@", (uint8_t *)&v2, 0xCu);
}

id fetchedApplicationsCompletion_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("Installed");
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a2, "copy");
  v18[0] = v11;
  v17[1] = CFSTR("Subscribed");
  v12 = (void *)objc_msgSend(v10, "copy");

  v18[1] = v12;
  v17[2] = CFSTR("Test");
  v13 = (void *)objc_msgSend(v9, "copy");

  v18[2] = v13;
  v17[3] = CFSTR("NonConforming");
  v14 = (void *)objc_msgSend(v8, "copy");

  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void _configureDemoBundles(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  WLKAppProxy *v20;
  void *v21;
  WLKAppProxy *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  WLKAppProxy *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  WLKAppProxy *v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t spid;
  unint64_t v48;
  id v49;
  id obj;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint8_t buf[16];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  WLKStartupSignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  WLKStartupSignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v48 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LibraryCore.configureDemoBundles", "", buf, 2u);
  }
  spid = v9;

  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)CFPreferencesCopyAppValue(CFSTR("DemoInstalledBundleIdentifiers"), CFSTR("com.apple.WatchListKit"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v12)
  {
    v13 = v12;
    v52 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v64 != v52)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v5, "count", spid))
        {
          v16 = 0;
          while (1)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "bundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v15);

            if ((v19 & 1) != 0)
              break;
            if (++v16 >= (unint64_t)objc_msgSend(v5, "count"))
              goto LABEL_15;
          }
          objc_msgSend(v5, "removeObjectAtIndex:", v16);
        }
LABEL_15:
        v20 = [WLKAppProxy alloc];
        WLKAppProxyDictionaryForDemoBundleID(v15, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[WLKAppProxy initWithDictionary:](v20, "initWithDictionary:", v21);

        objc_msgSend(v5, "addObject:", v22);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v13);
  }

  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v49 = (id)CFPreferencesCopyAppValue(CFSTR("DemoSubscribedBundleIdentifiers"), CFSTR("com.apple.WatchListKit"));
  v23 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v23)
  {
    v24 = v23;
    v53 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v60 != v53)
          objc_enumerationMutation(v49);
        v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        if (objc_msgSend(v6, "count", spid))
        {
          v27 = 0;
          while (1)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "bundleIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", v26);

            if ((v30 & 1) != 0)
              break;
            if (++v27 >= (unint64_t)objc_msgSend(v6, "count"))
              goto LABEL_28;
          }
          objc_msgSend(v6, "removeObjectAtIndex:", v27);
        }
LABEL_28:
        WLKAppProxyDictionaryForDemoBundleID(v26, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "mutableCopy");

        objc_msgSend(v32, "setObject:forKey:", CFSTR("Demo"), CFSTR("WLKAppProxy.subscriptionInfo"));
        v33 = -[WLKAppProxy initWithDictionary:]([WLKAppProxy alloc], "initWithDictionary:", v32);
        objc_msgSend(v6, "addObject:", v33);

      }
      v24 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v24);
  }

  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v51 = (id)CFPreferencesCopyAppValue(CFSTR("DemoTestBundleIdentifiers"), CFSTR("com.apple.WatchListKit"));
  v34 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v34)
  {
    v35 = v34;
    v54 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v56 != v54)
          objc_enumerationMutation(v51);
        v37 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        if (objc_msgSend(v7, "count", spid))
        {
          v38 = 0;
          while (1)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "bundleIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", v37);

            if ((v41 & 1) != 0)
              break;
            if (++v38 >= (unint64_t)objc_msgSend(v7, "count"))
              goto LABEL_41;
          }
          objc_msgSend(v7, "removeObjectAtIndex:", v38);
        }
LABEL_41:
        WLKAppProxyDictionaryForDemoBundleID(v37, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "mutableCopy");

        v44 = -[WLKAppProxy initWithDictionary:]([WLKAppProxy alloc], "initWithDictionary:", v43);
        objc_msgSend(v7, "addObject:", v44);

      }
      v35 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v35);
  }

  WLKStartupSignpostLogObject();
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v46, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.configureDemoBundles", "", buf, 2u);
  }

}

id WLKStartupSignpostLogObject()
{
  if (WLKStartupSignpostLogObject_onceToken != -1)
    dispatch_once(&WLKStartupSignpostLogObject_onceToken, &__block_literal_global_11);
  return (id)WLKStartupSignpostLogObject_logger;
}

WLKAppProxy *WLKAppProxyForLSApplicationRecord(void *a1)
{
  id v1;
  WLKAppProxy *v2;
  void *v3;
  WLKAppProxy *v4;

  v1 = a1;
  v2 = [WLKAppProxy alloc];
  WLKAppProxyDictionaryForLSApplicationRecord(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[WLKAppProxy initWithDictionary:](v2, "initWithDictionary:", v3);
  return v4;
}

const __CFString *WLKTVAppBundleID()
{
  return CFSTR("com.apple.tv");
}

WLKSortedKeyDictionary *WLKSortDictionaries(void *a1)
{
  id v1;
  void *v2;
  id v3;
  WLKSortedKeyDictionary *v4;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __WLKSortDictionaries_block_invoke;
    v17[3] = &unk_1E68A8548;
    v18 = v2;
    v3 = v2;
    objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v17);
    v4 = -[WLKSortedKeyDictionary initWithDictionary:]([WLKSortedKeyDictionary alloc], "initWithDictionary:", v3);

    return v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v1;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            WLKSortDictionaries(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12, (_QWORD)v13);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        }
        while (v9);
      }

      v1 = (id)objc_msgSend(v6, "copy");
    }
    return (WLKSortedKeyDictionary *)v1;
  }
}

uint64_t WLKIsTVApp()
{
  if (WLKIsTVApp_onceToken != -1)
    dispatch_once(&WLKIsTVApp_onceToken, &__block_literal_global_36);
  return WLKIsTVApp_retVal;
}

id WLKSystemLogObject()
{
  if (WLKSystemLogObject_onceToken != -1)
    dispatch_once(&WLKSystemLogObject_onceToken, &__block_literal_global_19);
  return (id)WLKSystemLogObject_logger;
}

void sub_1B51602CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1B5161404(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id WLKAppProxyDictionaryForLSApplicationRecord(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_setObjectUnlessNil:forKey:", v3, CFSTR("WLKAppProxy.bundleIdentifier"));

  objc_msgSend(v1, "shortVersionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wlk_setObjectUnlessNil:forKey:", v4, CFSTR("WLKAppProxy.version"));

  objc_msgSend(v1, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("com.apple.smoot.subscriptionservice"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("WLKAppProxy.isEntitled"));

  if (objc_msgSend(v1, "isBeta"))
    objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WLKAppProxy.isBeta"));
  if (objc_msgSend(v1, "isAppStoreVendable"))
    objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WLKAppProxy.isAppStoreVendable"));
  if (objc_msgSend(v1, "developerType") == 1)
    objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WLKAppProxy.isSystem"));
  objc_msgSend(v1, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("UISupportsTVApp"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "wlk_setObjectUnlessNil:forKey:", v9, CFSTR("WLKAppProxy.supportsTVApp"));
  objc_msgSend(v1, "iTunesMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "storeItemIdentifier");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("WLKAppProxy.itemID"));

  }
  v13 = (void *)objc_msgSend(v2, "copy");

  return v13;
}

void sub_1B5161A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;
  uint64_t v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

void WLKFetchNotificationCategories(void *a1)
{
  void (**v1)(id, uint64_t, _QWORD);
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", kBagKeyUVSearchEnabledNotificationTypes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7 = 0;
    if (!v1)
      goto LABEL_21;
    goto LABEL_20;
  }
  v11 = v3;
  v4 = v3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", CFSTR("Explicit")))
        {
          v7 |= 1uLL;
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("Implicit")))
        {
          v7 |= 2uLL;
        }
        else if (objc_msgSend(v10, "isEqual:", CFSTR("Marketing")))
        {
          v7 |= 4uLL;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v3 = v11;
  if (v1)
LABEL_20:
    v1[2](v1, v7, 0);
LABEL_21:

}

void sub_1B5161F7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id WLKPushNotificationsLogObject()
{
  if (WLKPushNotificationsLogObject_onceToken != -1)
    dispatch_once(&WLKPushNotificationsLogObject_onceToken, &__block_literal_global_3);
  return (id)WLKPushNotificationsLogObject_logger;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1B516272C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKDefaultSupportPath()
{
  if (WLKDefaultSupportPath_onceToken != -1)
    dispatch_once(&WLKDefaultSupportPath_onceToken, &__block_literal_global_49);
  return (id)WLKDefaultSupportPath__path;
}

void sub_1B5163EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKRestrictionsMaximumEffectiveMovieRanking()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectiveValueForSetting:", *MEMORY[0x1E0D470C0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "intValue");
  if (v2 == *MEMORY[0x1E0CFA958])
    v3 = 0;
  else
    v3 = v1;

  return v3;
}

id WLKRestrictionsMaximumEffectiveTVShowRanking()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectiveValueForSetting:", *MEMORY[0x1E0D470C8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "intValue");
  if (v2 == *MEMORY[0x1E0CFA958])
    v3 = 0;
  else
    v3 = v1;

  return v3;
}

void sub_1B51649DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WLKCurrentProtocolVersion()
{
  if (WLKCurrentProtocolVersion_onceToken != -1)
    dispatch_once(&WLKCurrentProtocolVersion_onceToken, &__block_literal_global);
  if (WLKCurrentProtocolVersion_overrideValue
    && (unint64_t)objc_msgSend((id)WLKCurrentProtocolVersion_overrideValue, "unsignedIntegerValue") >= 0x51)
  {
    return objc_msgSend((id)WLKCurrentProtocolVersion_overrideValue, "unsignedIntegerValue");
  }
  else
  {
    return 80;
  }
}

id WLKRestrictionsCountryCode()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)CRCopyRestrictionsDictionary();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0CFA948]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
    v2 = v1;
  else
    v2 = (void *)*MEMORY[0x1E0CFA950];
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1B51653C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1B5165574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B5166150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKSubscriptionSyncLogObject()
{
  if (WLKSubscriptionSyncLogObject_onceToken != -1)
    dispatch_once(&WLKSubscriptionSyncLogObject_onceToken, &__block_literal_global_17);
  return (id)WLKSubscriptionSyncLogObject_logger;
}

void sub_1B51664C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1B51667F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t WLKIsDaemon()
{
  if (WLKIsDaemon_onceToken != -1)
    dispatch_once(&WLKIsDaemon_onceToken, &__block_literal_global_31);
  return WLKIsDaemon_retVal;
}

void sub_1B5166B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5166FCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t WLKShouldRunInProcess()
{
  if (WLKShouldRunInProcess_onceToken != -1)
    dispatch_once(&WLKShouldRunInProcess_onceToken, &__block_literal_global_35);
  return WLKShouldRunInProcess_retVal;
}

void sub_1B5167274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKIsRunningTest()
{
  if (WLKIsRunningTest_onceToken != -1)
    dispatch_once(&WLKIsRunningTest_onceToken, &__block_literal_global_44);
  return WLKIsRunningTest_retVal;
}

void sub_1B5167444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKConnectionServerInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10C7D8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_fetchApplications_, 0, 1);
  v6 = (void *)MEMORY[0x1E0C99E20];
  WLKPlistClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", objc_opt_class());
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_readSettingsStore_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_writeSettingsStore_replyHandler_, 0, 0);
  WLKPlistClasses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchSettings_, 0, 1);

  WLKPlistClasses();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_postSettings_replyHandler_, 0, 0);

  v11 = (void *)MEMORY[0x1E0C99E20];
  WLKPlistClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", objc_opt_class());
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_requestDecoratedNowPlayingSummaries_, 0, 1);
  v14 = (void *)MEMORY[0x1E0C99E20];
  WLKPlistClasses();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObject:", objc_opt_class());
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_requestNowPlayingSummaries_, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_fetchSubscriptionData_callerProcessID_completion_, 0, 1);
  v18 = (void *)MEMORY[0x1E0C99E60];
  WLKPlistClasses();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_performSportsFavoritesAction_ids_caller_completion_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_performSportsFavoritesAction_ids_caller_completion_, 0, 1);
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_vppaConsentedBundleIDsWithCompletion_, 0, 1);

  return v0;
}

id WLKPlistClasses()
{
  if (WLKPlistClasses_onceToken != -1)
    dispatch_once(&WLKPlistClasses_onceToken, &__block_literal_global_16);
  return (id)WLKPlistClasses___plistClasses;
}

uint64_t WLKConnectionClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10C778);
}

void sub_1B51679EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKTVAppEnabledOverride()
{
  int AppBooleanValue;
  void *v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("TVAppEnabledOverride"), CFSTR("com.apple.tv"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AppBooleanValue != 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_1B5168BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

id WLKNetworkingLogObject()
{
  if (WLKNetworkingLogObject_onceToken != -1)
    dispatch_once(&WLKNetworkingLogObject_onceToken, &__block_literal_global_7);
  return (id)WLKNetworkingLogObject_logger;
}

void sub_1B5169474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B51697EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WLKProtocolVersionOverride()
{
  CFIndex AppIntegerValue;
  void *v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("WLKProtocolVersion"), CFSTR("com.apple.WatchListKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", AppIntegerValue);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_1B516A5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B516A9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B516AB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKSiriActionsLogObject()
{
  if (WLKSiriActionsLogObject_onceToken != -1)
    dispatch_once(&WLKSiriActionsLogObject_onceToken, &__block_literal_global_15);
  return (id)WLKSiriActionsLogObject_logger;
}

id WLKNetworkSignpostLogObject()
{
  if (WLKNetworkSignpostLogObject_onceToken != -1)
    dispatch_once(&WLKNetworkSignpostLogObject_onceToken, &__block_literal_global_13);
  return (id)WLKNetworkSignpostLogObject_logger;
}

id WLKIgnoreHTTPCacheOverride()
{
  if (WLKIgnoreHTTPCacheOverride_onceToken != -1)
    dispatch_once(&WLKIgnoreHTTPCacheOverride_onceToken, &__block_literal_global_42);
  return (id)WLKIgnoreHTTPCacheOverride_retVal;
}

id WLKBaseURLReturningError()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;

  WLKBaseURLOverride();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1840], "app");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedURLForKey:", kBagKeyUVSearchUtsApiBaseURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "absoluteString");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id WLKBaseURLOverride()
{
  void *v0;
  id v1;
  _QWORD block[4];
  id v4;

  if (os_variant_has_internal_content())
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("APIBaseURL"), CFSTR("com.apple.WatchListKit"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __WLKBaseURLOverride_block_invoke;
    block[3] = &unk_1E68A80F8;
    v1 = v0;
    v4 = v1;
    if (WLKBaseURLOverride_onceToken != -1)
      dispatch_once(&WLKBaseURLOverride_onceToken, block);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_1B516C128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B516CB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B516CDDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B516DB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B516DDD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B516E644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B516E870(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B51719E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKRequireNonNilParameter(uint64_t result)
{
  if (!result)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), 0);
  return result;
}

void WLKRequireParameterIsKindOfClass(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must be an instance of %@"), v4, v3);

}

void sub_1B51734C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B517383C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKCurrentAPIVersion()
{
  if (WLKCurrentAPIVersion_onceToken != -1)
    dispatch_once(&WLKCurrentAPIVersion_onceToken, &__block_literal_global_2);
  if (WLKCurrentAPIVersion_overrideValue
    && (unint64_t)objc_msgSend((id)WLKCurrentAPIVersion_overrideValue, "unsignedIntegerValue") >= 4)
  {
    return objc_msgSend((id)WLKCurrentAPIVersion_overrideValue, "unsignedIntegerValue");
  }
  else
  {
    return 3;
  }
}

void WLKFetchIsSportsEnabled(void *a1)
{
  void (**v1)(id, uint64_t, _QWORD);
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  void (**v6)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  WLKSportsEnabledOverride();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = objc_msgSend(v2, "BOOLValue");
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports enabled *override*: %d", buf, 8u);
    }

    v1[2](v1, objc_msgSend(v2, "BOOLValue"), 0);
  }
  else
  {
    +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __WLKFetchIsSportsEnabled_block_invoke;
    v5[3] = &unk_1E68A7C90;
    v6 = v1;
    objc_msgSend(v4, "fetchConfigurationWithCompletionHandler:", v5);

  }
}

uint64_t WLKIsSportsEnabled(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __WLKIsSportsEnabled_block_invoke;
  v6[3] = &unk_1E68A7CB8;
  v8 = &v16;
  v9 = &v10;
  v3 = v2;
  v7 = v3;
  WLKFetchIsSportsEnabled(v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (a1)
    *a1 = objc_retainAutorelease((id)v11[5]);
  v4 = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v4;
}

void sub_1B517440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t WLKIsSportsFavoritesEnabled(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v10[8];
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v2 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __WLKIsSportsFavoritesEnabled_block_invoke;
  v11[3] = &unk_1E68A7CB8;
  v13 = &v21;
  v14 = &v15;
  v3 = v2;
  v12 = v3;
  WLKFetchIsSportsFavoritesEnabled(v11);
  v4 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKFeatureEnablerHelperDomain"), 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v16[5];
    v16[5] = v5;

    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Timed out getting the config.", v10, 2u);
    }

  }
  if (a1)
    *a1 = objc_retainAutorelease((id)v16[5]);
  v8 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1B5174628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void WLKFetchIsSportsFavoritesEnabled(void *a1)
{
  void (**v1)(id, uint64_t, _QWORD);
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  void (**v6)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  WLKSportsFavoritesEnabledOverride();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = objc_msgSend(v2, "BOOLValue");
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports favorites enabled *override*: %d", buf, 8u);
    }

    v1[2](v1, objc_msgSend(v2, "BOOLValue"), 0);
  }
  else
  {
    +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __WLKFetchIsSportsFavoritesEnabled_block_invoke;
    v5[3] = &unk_1E68A7C90;
    v6 = v1;
    objc_msgSend(v4, "fetchConfigurationWithCompletionHandler:", v5);

  }
}

uint64_t WLKIsNLSBubbleTipEnabled(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v10[8];
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v2 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __WLKIsNLSBubbleTipEnabled_block_invoke;
  v11[3] = &unk_1E68A7CB8;
  v13 = &v21;
  v14 = &v15;
  v3 = v2;
  v12 = v3;
  WLKFetchIsBubbleTipEnabled(0, v11);
  v4 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKFeatureEnablerHelperDomain"), 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v16[5];
    v16[5] = v5;

    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Timed out getting the config for feature enablement for bubble tip.", v10, 2u);
    }

  }
  if (a1)
    *a1 = objc_retainAutorelease((id)v16[5]);
  v8 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1B5174B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void WLKFetchIsBubbleTipEnabled(int a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
    v5 = 2;
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __WLKFetchIsBubbleTipEnabled_block_invoke;
  v7[3] = &unk_1E68A7C90;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, v5, 0, v7);

}

uint64_t WLKIsNLSBubbleTipEnabledInCache(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v10[8];
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v2 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __WLKIsNLSBubbleTipEnabledInCache_block_invoke;
  v11[3] = &unk_1E68A7CB8;
  v13 = &v21;
  v14 = &v15;
  v3 = v2;
  v12 = v3;
  WLKFetchIsBubbleTipEnabled(1, v11);
  v4 = dispatch_time(0, 500000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKFeatureEnablerHelperDomain"), 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v16[5];
    v16[5] = v5;

    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Timed out accessing cached config for feature enablement for bubble tip.", v10, 2u);
    }

  }
  if (a1)
    *a1 = objc_retainAutorelease((id)v16[5]);
  v8 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1B5174E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id WLKLaunchOptionsForPlayback(int a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  if (a1)
  {
    objc_msgSend(v2, "addEntriesFromDictionary:", &unk_1E68CA028);
    objc_msgSend(v2, "setObject:forKey:", &unk_1E68CA028, *MEMORY[0x1E0D22D60]);
  }
  return v2;
}

void sub_1B5176A44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B5177E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1B51789A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5178B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WLKIsTVAppEnabled()
{
  dispatch_semaphore_t v0;
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[4];
  NSObject *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v0 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __WLKIsTVAppEnabled_block_invoke;
  v4[3] = &unk_1E68A7D90;
  v6 = &v7;
  v1 = v0;
  v5 = v1;
  WLKFetchNowPlayingEnabled(v4);
  dispatch_semaphore_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
  v2 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v2;
}

void sub_1B5178C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void WLKFetchNowPlayingEnabled(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __WLKFetchNowPlayingEnabled_block_invoke;
  v3[3] = &unk_1E68A7DB8;
  v4 = v1;
  v2 = v1;
  WLKFetchNowPlayingEnabledReturningError(v3);

}

uint64_t WLKIsLocationEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  WLKLocationEnabledOverride();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    NSLog(CFSTR("WLKIsLocationEnabled - Location enabled *override*: %d"), objc_msgSend(v0, "BOOLValue"));
    v2 = objc_msgSend(v1, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1840], "app");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "BOOLeanForKey:", kBagKeyUVSearchLocationEnabled);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_msgSend(v4, "BOOLValue");
  }

  return v2;
}

void WLKFetchNowPlayingEnabledReturningError(void *a1)
{
  void (**v1)(id, uint64_t, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  void (**v7)(id, uint64_t, _QWORD);

  v1 = a1;
  WLKTVAppEnabledOverride();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    NSLog(CFSTR("WLKIsNowPlayingEnabledWithOptions - TV app enabled *override*: %d"), objc_msgSend(v2, "BOOLValue"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "BOOLValue"), CFSTR("lastKnownTVAppEnabledValue"));

    if (v1)
      v1[2](v1, objc_msgSend(v3, "BOOLValue"), 0);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __WLKFetchNowPlayingEnabledReturningError_block_invoke;
    block[3] = &unk_1E68A7DE0;
    v7 = v1;
    dispatch_async(v5, block);

  }
}

void WLKFetchPrivacyAcknowledgementURLWithCompletionHandler(void *a1)
{
  void *v1;
  void *v2;
  void (**v3)(id, void *, _QWORD);

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "urlForKey:", kBagAcknowledgePrivacyLink);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v3[2](v3, v2, 0);

}

void WLKFetchBaseURLWithCompletion(void *a1)
{
  void (**v1)(id, void *, _QWORD);
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  void (**v5)(id, void *, _QWORD);

  v1 = a1;
  WLKBaseURLOverride();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (v1)
      v1[2](v1, v2, 0);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __WLKFetchBaseURLWithCompletion_block_invoke;
    block[3] = &unk_1E68A7DE0;
    v5 = v1;
    dispatch_async(v3, block);

  }
}

void sub_1B51799BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B517A430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B517B568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKIsSandboxed()
{
  if (WLKIsSandboxed_onceToken != -1)
    dispatch_once(&WLKIsSandboxed_onceToken, &__block_literal_global_30);
  return WLKIsSandboxed_retVal;
}

uint64_t WLKIsTool()
{
  if (WLKIsTool_onceToken != -1)
    dispatch_once(&WLKIsTool_onceToken, &__block_literal_global_37);
  return WLKIsTool_retVal;
}

const __CFString *WLKNewsAppBundleID()
{
  return CFSTR("com.apple.news");
}

uint64_t WLKIsWatchlisttool()
{
  if (WLKIsWatchlisttool_onceToken != -1)
    dispatch_once(&WLKIsWatchlisttool_onceToken, &__block_literal_global_48);
  return WLKIsWatchlisttool_retVal;
}

uint64_t WLKIsNewsApp()
{
  if (WLKIsNewsApp_onceToken != -1)
    dispatch_once(&WLKIsNewsApp_onceToken, &__block_literal_global_51);
  return WLKIsNewsApp_retVal;
}

void sub_1B5180180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5180830(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B5180B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKError(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v5)
  {
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);

  }
  if (v6)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKErrorDomain"), a1, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id WLKCancelledError()
{
  return WLKError(-1, 0, CFSTR("cancelled"));
}

id WLKCancelledErrorWithUnderlyingError(void *a1)
{
  return WLKError(-1, a1, CFSTR("cancelled"));
}

uint64_t WLKHTTPStatusCodeForAMSError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0CFD808];

  if (v2 == v3)
  {
    objc_msgSend(v1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD828]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1B5183A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1B518737C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKAppVisibilityLogObject()
{
  if (WLKAppVisibilityLogObject_onceToken != -1)
    dispatch_once(&WLKAppVisibilityLogObject_onceToken, &__block_literal_global_5);
  return (id)WLKAppVisibilityLogObject_logger;
}

id WLKPlaybackTrackingLogObject()
{
  if (WLKPlaybackTrackingLogObject_onceToken != -1)
    dispatch_once(&WLKPlaybackTrackingLogObject_onceToken, &__block_literal_global_9);
  return (id)WLKPlaybackTrackingLogObject_logger;
}

void sub_1B518899C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id WLKSubscriptionIdentifierForBundleID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v1 = a1;
  +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionInfoForBundle:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("account"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v7;
}

id WLKAppProxyDictionaryForDemoBundleID(void *a1, int a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a1;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("WLKAppProxy.bundleIdentifier"));

  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WLKAppProxy.isEntitled"));
  if (a2)
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WLKAppProxy.isBeta"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void sub_1B518B050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B518B3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B518B704(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B518CBC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1B518D674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B518E580(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1B518EF28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1B518F5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51918C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5191AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKEqualObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "isEqual:", v4);
  }

  return v6;
}

void sub_1B5193470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51942CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5195F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

Class __getASDPurchaseClass_block_invoke(uint64_t a1)
{
  Class result;

  AppStoreDaemonLibrary();
  result = objc_getClass("ASDPurchase");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getASDPurchaseClass_block_invoke_cold_1();
  getASDPurchaseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AppStoreDaemonLibrary()
{
  void *v0;

  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getASDPurchaseManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AppStoreDaemonLibrary();
  result = objc_getClass("ASDPurchaseManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getASDPurchaseManagerClass_block_invoke_cold_1();
  getASDPurchaseManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B5197710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1B5197B94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5197D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1B51994C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5199DE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B519A734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B519B11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1B519C57C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B519C77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1B519D47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  void *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  objc_sync_exit(v23);
  _Unwind_Resume(a1);
}

void sub_1B519D934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B519DAB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B519ED9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1B519F6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1B51A0C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1B51A1B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B51A2628(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B51A2DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B51A2EC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B51A3158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B51A348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WLKSportsEnabledOverride()
{
  __CFString *v0;
  int AppBooleanValue;
  void *v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  WLKTVAppBundleID();
  v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WLKSportsEnabledOverride"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AppBooleanValue != 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id WLKSportsFavoritesEnabledOverride()
{
  __CFString *v0;
  int AppBooleanValue;
  void *v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  WLKTVAppBundleID();
  v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WLKSportsFavoritesEnabledOverride"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AppBooleanValue != 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id WLKLocationEnabledOverride()
{
  __CFString *v0;
  int AppBooleanValue;
  void *v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  WLKTVAppBundleID();
  v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WLKLocationEnabledOverride"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AppBooleanValue != 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id WLKAPIVersionOverride()
{
  CFIndex AppIntegerValue;
  void *v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("APIVersionOverride"), CFSTR("com.apple.WatchListKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", AppIntegerValue);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id WLKBulletinTimeoutOverride()
{
  const __CFString *v0;
  CFIndex AppIntegerValue;
  void *v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v0 = WLKTVAppBundleID();
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("BulletinTimeout"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", AppIntegerValue);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t WLKRetryOnBackgroundTimeOutJSOverride()
{
  if (WLKRetryOnBackgroundTimeOutJSOverride_onceToken != -1)
    dispatch_once(&WLKRetryOnBackgroundTimeOutJSOverride_onceToken, &__block_literal_global_30_0);
  return objc_msgSend((id)WLKRetryOnBackgroundTimeOutJSOverride_retVal, "BOOLValue");
}

void sub_1B51A7960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t WLKCheckAuthentication(_QWORD *a1)
{
  void *v2;
  void *v3;
  char v4;

  +[WLKAccountMonitor sharedInstance](WLKAccountMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated");

  if (a1 && (v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKSportsFavoriteErrorDomain"), -3, 0);
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v4 & 1) != 0)
    return 1;
  else
    return WLKIsRunningTest();
}

id WLKXPCSafeErrorFromError(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB35C8];
    v2 = a1;
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "code");

    objc_msgSend(v1, "errorWithDomain:code:userInfo:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_1B51AA43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51AB394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B51AB8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B51AC7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51ACB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51AE840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _WLKDeepReplacement(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = ___WLKDeepReplacement_block_invoke;
    v26[3] = &unk_1E68A9F58;
    v9 = v8;
    v27 = v9;
    v10 = v6;
    v28 = v10;
    v11 = v7;
    v29 = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v9, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v9, "setObject:forKey:", v11, v10);
    v13 = objc_msgSend(v9, "copy");

    v5 = (id)v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            _WLKDeepReplacement(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19), v6, v7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v20, (_QWORD)v22);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v17);
      }

      v5 = (id)objc_msgSend(v14, "copy");
    }
  }

  return v5;
}

void sub_1B51AF810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51B0D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B51B1C7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getASDPurchaseClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getASDPurchaseManagerClass_block_invoke_cold_1(v0);
}

void __getASDPurchaseManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  +[WLKConfigurationRequest _fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:].cold.1(v0);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1E0C98760]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t CRCopyRestrictionsDictionary()
{
  return MEMORY[0x1E0CFA940]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLStorageSessionCopyCache()
{
  return MEMORY[0x1E0C92F88]();
}

uint64_t _CFURLStorageSessionCreate()
{
  return MEMORY[0x1E0C92F98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

