@implementation PPMapsSupport

+ (void)importMapsDataWithShouldContinueBlock:(id)a3
{
  unsigned int (**v3)(_QWORD);
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v15;
  uint8_t buf[2];

  v3 = (unsigned int (**)(_QWORD))a3;
  if (((unsigned int (*)(void))v3[2])())
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "bundleIdentifierIsEnabledForDonation:", *MEMORY[0x1E0D70E20]);

    if ((v5 & 1) == 0)
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "skipping Maps import due to settings";
        v14 = buf;
        goto LABEL_9;
      }
LABEL_10:

      goto LABEL_11;
    }
    if (v3[2](v3))
    {
      v6 = (void *)objc_opt_new();
      +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPMapsSupport importMapsDataWithCollectionRequest:localNamedEntityStore:localLocationStore:shouldContinueBlock:](PPMapsSupport, "importMapsDataWithCollectionRequest:localNamedEntityStore:localLocationStore:shouldContinueBlock:", v6, v7, v8, v3);

      if (v3[2](v3))
      {
        v9 = (void *)objc_opt_new();
        +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPMapsSupport importMapsDataWithFavoriteRequest:localNamedEntityStore:localLocationStore:shouldContinueBlock:](PPMapsSupport, "importMapsDataWithFavoriteRequest:localNamedEntityStore:localLocationStore:shouldContinueBlock:", v9, v10, v11, v3);

        pp_default_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 0;
          v13 = "PPMapsSupport: Maps import complete";
          v14 = (uint8_t *)&v15;
LABEL_9:
          _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_11:

}

+ (void)importMapsDataWithCollectionRequest:(id)a3 localNamedEntityStore:(id)a4 localLocationStore:(id)a5 shouldContinueBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  dispatch_semaphore_t v25;
  id v26;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  pp_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvesting Maps Collections", buf, 2u);
  }

  v14 = dispatch_semaphore_create(0);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __114__PPMapsSupport_importMapsDataWithCollectionRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke;
  v22 = &unk_1E7E1C898;
  v23 = v9;
  v24 = v10;
  v25 = v14;
  v26 = v11;
  v15 = v14;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  objc_msgSend(v12, "fetchWithCompletionHandler:", &v19);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v15, v19, v20, v21, v22);
}

+ (void)importMapsDataWithFavoriteRequest:(id)a3 localNamedEntityStore:(id)a4 localLocationStore:(id)a5 shouldContinueBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  dispatch_semaphore_t v25;
  id v26;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  pp_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvesting Maps Favorite Items", buf, 2u);
  }

  v14 = dispatch_semaphore_create(0);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __112__PPMapsSupport_importMapsDataWithFavoriteRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke;
  v22 = &unk_1E7E1C898;
  v23 = v9;
  v24 = v10;
  v25 = v14;
  v26 = v11;
  v15 = v14;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  objc_msgSend(v12, "fetchWithCompletionHandler:", &v19);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v15, v19, v20, v21, v22);
}

+ (BOOL)harvestMapItem:(id)a3 documentIdentifier:(id)a4 groupIdentifier:(id)a5 includingPostalAddress:(BOOL)a6 localNamedEntityStore:(id)a7 localLocationStore:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  BOOL v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  char v58;
  id v59;
  id v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  char v66;
  char v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  int v73;
  NSObject *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  _BOOL4 v93;
  _QWORD v94[3];

  v81 = a6;
  v94[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  pp_default_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v87 = (uint64_t)v14;
    v88 = 2112;
    v89 = v15;
    v90 = 1024;
    LODWORD(v91) = v81;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvesting map item for document: %@ group: %@ includingPostalAddress:%d", buf, 0x1Cu);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0D70E20];
  objc_msgSend(v19, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", *MEMORY[0x1E0D70E20], 0, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v20, 0, 0, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v21;
  v24 = objc_msgSend(v21, "containsObject:", &unk_1E7E59DE0);
  v25 = objc_msgSend(v23, "containsObject:", &unk_1E7E59DF8);
  v82 = v13;
  if ((v24 & 1) != 0 || (v25 & 1) != 0)
  {
    v73 = v25;
    objc_msgSend(v13, "geoAddress");
    v74 = objc_claimAutoreleasedReturnValue();
    -[NSObject structuredAddress](v74, "structuredAddress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_opt_new();
    v76 = v14;
    v77 = v16;
    v75 = v17;
    v78 = v29;
    if (v81)
    {
      if (objc_msgSend(v29, "hasThoroughfare"))
      {
        v30 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v78, "thoroughfare");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "languageCode");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v30, "initWithName:category:language:", v31, 8, v33);

        v14 = v76;
        v16 = v77;
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v34, 0.5);
        objc_msgSend(v80, "addObject:", v35);

        v29 = v78;
      }
      if (objc_msgSend(v29, "hasLocality"))
      {
        v36 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v78, "locality");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "languageCode");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v36, "initWithName:category:language:", v37, 9, v39);

        v14 = v76;
        v16 = v77;

        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v40, 0.5);
        objc_msgSend(v80, "addObject:", v41);

        v29 = v78;
      }
    }
    if (objc_msgSend(v29, "hasAdministrativeArea"))
    {
      v42 = objc_alloc(MEMORY[0x1E0D70BC0]);
      objc_msgSend(v78, "administrativeArea");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "languageCode");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v42, "initWithName:category:language:", v43, 10, v45);

      v14 = v76;
      v16 = v77;

      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v46, 0.5);
      objc_msgSend(v80, "addObject:", v47);

    }
    objc_msgSend(v13, "name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_alloc(MEMORY[0x1E0D70BC0]);
      objc_msgSend(v13, "name");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "languageCode");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v49, "initWithName:category:language:", v50, 3, v52);

      v14 = v76;
      v16 = v77;

      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v53, 0.5);
      objc_msgSend(v80, "addObject:", v54);

    }
    if (!objc_msgSend(v80, "count"))
    {
      pp_default_log_handle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v87 = (uint64_t)v14;
        v88 = 2112;
        v89 = v15;
        v90 = 1024;
        LODWORD(v91) = v81;
        _os_log_impl(&dword_1C392E000, v57, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvested 0 entities from map item for document: %@ group: %@ includingPostalAddress:%d", buf, 0x1Cu);
      }
      v27 = 1;
      v17 = v75;
      v28 = v79;
      v26 = v74;
      goto LABEL_48;
    }
    v55 = objc_alloc(MEMORY[0x1E0D70C78]);
    v56 = (void *)objc_opt_new();
    v57 = objc_msgSend(v55, "initWithBundleId:groupId:documentId:date:", v20, v15, v14, v56);

    if (v24)
    {
      v85 = 0;
      v58 = objc_msgSend(v16, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v80, v57, 7, 1, &v85, 0.0);
      v59 = v85;
      v60 = v59;
      v17 = v75;
      if ((v58 & 1) == 0)
      {
        pp_default_log_handle();
        v63 = objc_claimAutoreleasedReturnValue();
        v26 = v74;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v87 = (uint64_t)v60;
          _os_log_error_impl(&dword_1C392E000, v63, OS_LOG_TYPE_ERROR, "PPMapsSupport failed to donate Maps interaction structured location to PPLocalNamedEntityStore: %@", buf, 0xCu);
        }
        v27 = 0;
        goto LABEL_47;
      }
      v61 = v59;
    }
    else
    {
      pp_default_log_handle();
      v62 = objc_claimAutoreleasedReturnValue();
      v17 = v75;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v62, OS_LOG_TYPE_DEBUG, "PPMapsSupport: Not donating events from maps interaction because it is disabled.", buf, 2u);
      }

      v61 = 0;
    }
    if (v73)
    {
      +[PPLocalLocationStore locationFromMapItem:](PPLocalLocationStore, "locationFromMapItem:", v82);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v63, 1.0, 0.0);
      v94[0] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v61;
      v66 = objc_msgSend(v17, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v65, v57, 0, 7, 1, &v84);
      v60 = v84;

      if ((v66 & 1) == 0)
      {
        pp_default_log_handle();
        v71 = objc_claimAutoreleasedReturnValue();
        v16 = v77;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v87 = (uint64_t)v60;
          _os_log_error_impl(&dword_1C392E000, v71, OS_LOG_TYPE_ERROR, "PPMapsSupport failed to donate Maps interaction structured location to PPLocalLocationStore: %@", buf, 0xCu);
        }

        v27 = 0;
        v17 = v75;
        goto LABEL_46;
      }

      v16 = v77;
      v17 = v75;
    }
    else
    {
      pp_default_log_handle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v63, OS_LOG_TYPE_DEBUG, "PPMapsSupport: not donating locations from maps interaction because it is disabled.", buf, 2u);
      }
      v60 = v61;
      v16 = v77;
    }

    v83 = 0;
    v67 = objc_msgSend(v16, "flushDonationsWithError:", &v83);
    v63 = v83;
    if ((v67 & 1) == 0)
    {
      pp_default_log_handle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = (uint64_t)v63;
        _os_log_impl(&dword_1C392E000, v68, OS_LOG_TYPE_DEFAULT, "PPMapsSupport warning: failed to flush named entities: %@", buf, 0xCu);
      }

    }
    pp_default_log_handle();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = objc_msgSend(v80, "count");
      *(_DWORD *)buf = 134218754;
      v87 = v70;
      v88 = 2112;
      v89 = v14;
      v90 = 2112;
      v91 = v15;
      v92 = 1024;
      v93 = v81;
      _os_log_impl(&dword_1C392E000, v69, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: completed harvesting %lu entities from map item for document: %@ group: %@ includingPostalAddress:%d", buf, 0x26u);
    }

    v27 = 1;
LABEL_46:
    v26 = v74;
LABEL_47:

    v28 = v79;
LABEL_48:

    goto LABEL_49;
  }
  pp_default_log_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: Maps Interaction blocked for both named entities and locations, skipping.", buf, 2u);
  }
  v27 = 1;
  v28 = v79;
LABEL_49:

  return v27;
}

void __112__PPMapsSupport_importMapsDataWithFavoriteRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = a3;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSFavoriteItemRequest fetchContents called with %tu places", buf, 0xCu);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    v10 = *MEMORY[0x1E0D70EC8];
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
        break;
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (v15)
      {
        pp_default_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSFavoriteItemRequest item missing storage identifier", buf, 2u);
        }
      }
      else
      {
        objc_msgSend(v12, "mapItemStorage");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v12, "identifier");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject UUIDString](v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPMapsSupport harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:](PPMapsSupport, "harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:", v16, v18, v10, 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, v19, (_QWORD)v20);

        }
        else
        {
          pp_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSFavoriteItemRequest item missing map item", buf, 2u);
          }
        }

      }
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __114__PPMapsSupport_importMapsDataWithCollectionRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = a3;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSCollectionPlaceItemRequest fetchContents called with %tu locations", buf, 0xCu);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    v10 = *MEMORY[0x1E0D70EC0];
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
        break;
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (v15)
      {
        pp_default_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSCollectionPlaceItemRequest item missing storage identifier", buf, 2u);
        }
      }
      else
      {
        objc_msgSend(v12, "mapItemStorage");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v12, "identifier");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject UUIDString](v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPMapsSupport harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:](PPMapsSupport, "harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:", v16, v18, v10, 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, v19, (_QWORD)v20);

        }
        else
        {
          pp_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSCollectionPlaceItemRequest item missing map item", buf, 2u);
          }
        }

      }
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
