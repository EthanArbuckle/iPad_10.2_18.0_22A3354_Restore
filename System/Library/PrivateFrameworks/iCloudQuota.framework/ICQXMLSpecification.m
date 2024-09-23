@implementation ICQXMLSpecification

void __62___ICQXMLSpecification_placeholderReplacementsWithDeviceInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("replacementStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.quota.photoLibrary"));

  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("placeholderKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("default"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQOfferManager stringWithPlaceholderFormat:alternateString:](ICQOfferManager, "stringWithPlaceholderFormat:alternateString:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v5);

    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v5;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "photos substitution used for placeholdeer string %@, replacement: %@", buf, 0x16u);

    }
    goto LABEL_17;
  }
  v13 = *(id *)(a1 + 40);
  if (v13)
    goto LABEL_7;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appId"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    +[_ICQDeviceInfo getInfoWithBundleId:](_ICQDeviceInfo, "getInfoWithBundleId:", v15);
    v13 = objc_claimAutoreleasedReturnValue();

LABEL_7:
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject key](v13, "key");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject wordsToReplace](v13, "wordsToReplace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v18;
      v42 = 2112;
      v43 = v19;
      _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "key = %@  wordsToReplace = %@", buf, 0x16u);

    }
    -[NSObject key](v13, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v7;
    +[_ICQHelperFunctions stringFromTemplates:key:](_ICQHelperFunctions, "stringFromTemplates:key:", v7, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    -[NSObject wordsToReplace](v13, "wordsToReplace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v21;
    +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, v5);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSObject wordsToReplace](v13, "wordsToReplace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        v29 = 0;
        v30 = v5;
        do
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v5 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v29);

          -[NSObject wordsToReplace](v13, "wordsToReplace");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v5);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v32, v5);

          ++v29;
          v30 = v5;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v27);
    }

    v5 = 0;
    v7 = v34;
    goto LABEL_17;
  }
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "placeHolderDict is missing 'appID'", buf, 2u);
  }
LABEL_17:

}

@end
