@implementation _ICQXMLSpecification

- (_ICQXMLSpecification)initWithPlaceholderInfo:(id)a3
{
  id v5;
  _ICQXMLSpecification *v6;
  _ICQXMLSpecification *v7;

  v5 = a3;
  v6 = -[_ICQXMLSpecification init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_placeholderInfo, a3);

  return v7;
}

- (id)stringForPlaceholder:(id)a3
{
  return -[_ICQXMLSpecification stringForPlaceholder:withDeviceInfo:](self, "stringForPlaceholder:withDeviceInfo:", a3, 0);
}

- (id)stringForPlaceholder:(id)a3 withDeviceInfo:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSDictionary *placeholderInfo;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  NSObject *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)-[NSObject length](v6, "length") > 2)
  {
    placeholderInfo = self->_placeholderInfo;
    -[NSObject substringFromIndex:](v6, "substringFromIndex:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](placeholderInfo, "objectForKeyedSubscript:", v11);
    v8 = objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v8;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "placeholderDict = %@", (uint8_t *)&v30, 0xCu);
    }

    if (!v8
      || (-[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("appId")),
          (v13 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v14 = (void *)v13,
          -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("replacementStrings")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          !v15))
    {
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138412290;
        v31 = v6;
        _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "No placeholder info found for %@ in offer", (uint8_t *)&v30, 0xCu);
      }
      v9 = 0;
      goto LABEL_22;
    }
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("replacementStrings"));
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("appId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.quota.photoLibrary"));

    if (v18)
    {
      -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("placeholderKey"));
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("default"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICQOfferManager stringWithPlaceholderFormat:alternateString:](ICQOfferManager, "stringWithPlaceholderFormat:alternateString:", v19, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v7;
      if (!v19)
      {
        -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("appId"));
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          _ICQGetLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v30) = 0;
            _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "placeHolderDict is missing 'appID'", (uint8_t *)&v30, 2u);
          }
          v9 = 0;
          goto LABEL_21;
        }
        v22 = (void *)v21;
        +[_ICQDeviceInfo getInfoWithBundleId:](_ICQDeviceInfo, "getInfoWithBundleId:", v21);
        v19 = objc_claimAutoreleasedReturnValue();

      }
      _ICQGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject key](v19, "key");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject wordsToReplace](v19, "wordsToReplace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412546;
        v31 = v24;
        v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "key = %@  wordsToReplace = %@", (uint8_t *)&v30, 0x16u);

      }
      -[NSObject key](v19, "key");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ICQHelperFunctions stringFromTemplates:key:](_ICQHelperFunctions, "stringFromTemplates:key:", v16, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject wordsToReplace](v19, "wordsToReplace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v27, v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_ICQXMLSpecification stringForPlaceholder:withDeviceInfo:].cold.1((uint64_t)v6, v8);
  v9 = 0;
LABEL_23:

  return v9;
}

- (id)placeholderReplacementsWithDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *placeholderInfo;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  placeholderInfo = self->_placeholderInfo;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __62___ICQXMLSpecification_placeholderReplacementsWithDeviceInfo___block_invoke;
  v14 = &unk_1E8B39D48;
  v15 = v5;
  v16 = v4;
  v7 = v4;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](placeholderInfo, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderInfo, 0);
}

- (void)stringForPlaceholder:(uint64_t)a1 withDeviceInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "Unable to look up placeholder for key %@, becuase it is too short", (uint8_t *)&v2, 0xCu);
}

@end
