@implementation PKLookupAppStoreApplicationPrivacyPolicy

void __PKLookupAppStoreApplicationPrivacyPolicy_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void (*v29)(void);
  uint64_t v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = (uint64_t)v8;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Received error: %@.", (uint8_t *)&v31, 0xCu);

    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "responseDataItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 134217984;
      v32 = v10;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Received %ld results from AppleMediaServices", (uint8_t *)&v31, 0xCu);
    }
  }

  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = PKIsPad();
    v13 = CFSTR("ios");
    if (v12)
      v13 = CFSTR("ipados");
    v14 = v13;
    objc_msgSend(v11, "PKDictionaryForKey:", CFSTR("attributes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    objc_msgSend(v15, "PKDictionaryOfKeyClass:valueClass:ForKey:", v16, objc_opt_class(), CFSTR("platformAttributes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    if (v19
      || (objc_msgSend(v17, "allValues"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "firstObject"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = (void *)objc_msgSend(v21, "mutableCopy"),
          v21,
          v20,
          v19))
    {
      objc_msgSend(v19, "addEntriesFromDictionary:", v15);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB00]), "initWithLookupDictionary:", v19);

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v22, "itemDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD8B0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v26)
    {
      v27 = *(_QWORD *)(a1 + 40);
      v31 = 138412546;
      v32 = (uint64_t)v24;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Received privacy policy string from AMS: %@ for bundle identifier: %@.", (uint8_t *)&v31, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138412290;
        v32 = (uint64_t)v24;
        _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Unable to convert received privacy policy string: %@ to URL.", (uint8_t *)&v31, 0xCu);
      }

      v29 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v29();

  }
  else
  {
    if (v26)
    {
      v30 = *(_QWORD *)(a1 + 40);
      v31 = 138412290;
      v32 = v30;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: No privacy policy string was returned from AppleMediaServices for bundle identifier: %@.", (uint8_t *)&v31, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
