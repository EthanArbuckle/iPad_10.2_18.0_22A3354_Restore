@implementation PNPersonSuggester

+ (id)_logger
{
  if (_logger_onceToken != -1)
    dispatch_once(&_logger_onceToken, &__block_literal_global_507);
  return (id)_logger__log;
}

+ (id)fetchAutonamingSuggestionForPerson:(id)a3 checkIsMe:(BOOL)a4 withError:(id *)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  os_signpost_id_t spid;
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "fetchAutonamingSuggestionForPerson", ", buf, 2u);
  }
  spid = v10;

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v8, "localIdentifier", spid);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v17 = objc_msgSend(a1, "_isMePersonWithLocalIdentifier:inPhotoLibrary:error:", v15, v16, &v37);
  v18 = v37;

  if (v18)
    objc_msgSend(v14, "addObject:", v18);

  if (!v17)
  {
LABEL_10:
    objc_msgSend(getGDViewServiceClass(), "clientService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    getGDAutonamingViewPhotosAutonamingViewName();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v22, "autonamingViewWithViewName:error:", v23, &v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v35;

    if (v19)
    {
      objc_msgSend(v8, "localIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personForIdentifier:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v8, "localIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[PNPersonSuggestion suggestionWithPersonLocalIdentifier:personView:](PNPersonSuggestion, "suggestionWithPersonLocalIdentifier:personView:", v26, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
    }
    else
    {
      if (v21)
      {
        objc_msgSend(v14, "addObject:", v21);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("Autonaming view is nil"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v28);

      }
      v19 = 0;
    }
    goto LABEL_17;
  }
  v36 = 0;
  objc_msgSend(a1, "_meContactIdentifierWithError:", &v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v36;
  if (v20)
  {
    v21 = v20;
    objc_msgSend(v14, "addObject:", v20);
LABEL_17:
    v27 = 0;
    goto LABEL_18;
  }
  if (!v19)
  {
    v21 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "localIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPersonSuggestion suggestionWithPersonLocalIdentifier:meContactIdentifier:](PNPersonSuggestion, "suggestionWithPersonLocalIdentifier:meContactIdentifier:", v33, v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
LABEL_18:

  if (a5)
  {
    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      *a5 = v29;
      goto LABEL_24;
    }
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithMultipleUnderlyingErrors:localizedDescription:", v14, CFSTR("Multiple errors occured during autonaming suggestion"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
LABEL_24:
  v30 = v12;
  v31 = v30;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v31, OS_SIGNPOST_INTERVAL_END, spid, "fetchAutonamingSuggestionForPerson", ", buf, 2u);
  }

  return v27;
}

+ (BOOL)_isMePersonWithLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a3;
  objc_msgSend(a4, "suggestedMePersonIdentifierWithError:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "isEqualToString:", v7);
  else
    v10 = 0;

  return v10;
}

+ (id)_meContactIdentifierWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  objc_msgSend(MEMORY[0x24BDE35F0], "sharedContactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__493;
  v22 = __Block_byref_object_dispose__494;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__493;
  v16 = __Block_byref_object_dispose__494;
  v17 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__PNPersonSuggester__meContactIdentifierWithError___block_invoke;
  v8[3] = &unk_25147FBC8;
  v5 = v4;
  v9 = v5;
  v10 = &v18;
  v11 = &v12;
  objc_msgSend(v5, "requestAccessForEntityType:completionHandler:", 0, v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v6 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

+ (void)logUserFeedback:(int64_t)a3 forSuggestion:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  int64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = a3;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_243C3E000, v7, OS_LOG_TYPE_DEFAULT, "Logging feedback %ld for suggestion %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (objc_msgSend(v6, "suggestionSource") == 1)
    objc_msgSend(a1, "_logIntelligencePlatformUserFeedback:forSuggestion:", a3, v6);

}

+ (void)_logIntelligencePlatformUserFeedback:(int64_t)a3 forSuggestion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "_logger");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(getGDViewServiceClass(), "clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getGDAutonamingViewPhotosAutonamingViewName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "autonamingViewWithViewName:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (v10)
  {
    objc_msgSend(v6, "personLocalIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "personForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (a3 == 1)
      {
        objc_msgSend(v6, "personLocalIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rejectWithIdentifier:person:confirmationType:", v14, v13, 1);
      }
      else
      {
        if (a3)
        {
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(v6, "personLocalIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "confirmWithIdentifier:person:confirmationType:", v14, v13, 1);
      }
    }
    else
    {
      v14 = v7;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "personLocalIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_error_impl(&dword_243C3E000, v14, OS_LOG_TYPE_ERROR, "Failed to get graph person view for logging user action on suggestion for person %{public}@", buf, 0xCu);

      }
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_error_impl(&dword_243C3E000, v7, OS_LOG_TYPE_ERROR, "Failed to get autonaming view with error %@", buf, 0xCu);
  }
LABEL_13:

}

void __51__PNPersonSuggester__meContactIdentifierWithError___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a2)
  {
    v7 = (void *)a1[4];
    v17[0] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v8, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (v9)
    {
      objc_msgSend(v9, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1[5] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
    }
    else
    {
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
      v14 = *(_QWORD *)(a1[6] + 8);
      v15 = v10;
      v13 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v15;
    }

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
LABEL_9:

}

void __28__PNPersonSuggester__logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE72308], "PersonSuggester");
  v1 = (void *)_logger__log;
  _logger__log = (uint64_t)v0;

}

@end
