@implementation PPHarvestingUtils

+ (id)appBlocklist
{
  if (appBlocklist_onceToken != -1)
    dispatch_once(&appBlocklist_onceToken, &__block_literal_global_4009);
  return (id)appBlocklist_blocklist;
}

+ (id)contactHandlesForSearchableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1C3BD6630]();
        v13 = (void *)MEMORY[0x1E0D80FB0];
        objc_msgSend(v11, "handles");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sanitizeHandles:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v15);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v8);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v3, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryRecipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
        v23 = (void *)MEMORY[0x1C3BD6630]();
        v24 = (void *)MEMORY[0x1E0D80FB0];
        objc_msgSend(v22, "handles");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sanitizeHandles:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v26);

        objc_autoreleasePoolPop(v23);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v19);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v3, "attributeSet", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "additionalRecipients");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v40;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v32);
        v34 = (void *)MEMORY[0x1C3BD6630]();
        v35 = (void *)MEMORY[0x1E0D80FB0];
        objc_msgSend(v33, "handles");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "sanitizeHandles:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v37);

        objc_autoreleasePoolPop(v34);
        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v30);
  }

  return v4;
}

+ (id)textContentFromSearchableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *context;

  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v5 = (void *)*MEMORY[0x1E0D70E68];
  objc_msgSend(v3, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = (void *)*MEMORY[0x1E0D81010];
    objc_msgSend(v3, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textContentDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v9);

    if ((_DWORD)v7)
    {
      objc_msgSend(v3, "attributeSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
  }
  else
  {

  }
  v12 = (void *)*MEMORY[0x1E0D70E60];
  objc_msgSend(v3, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "isEqualToString:", v13);

  if ((_DWORD)v12)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "comment");
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v26 = (void *)v18;
    v11 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@\n\n%@"), v16, v18);

    goto LABEL_25;
  }
  v19 = (void *)*MEMORY[0x1E0D70E28];
  objc_msgSend(v3, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v19, "isEqualToString:", v20);

  if (!(_DWORD)v19)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textContentNoCopy");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v21 = MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "attributeSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "attributeForKey:", CFSTR("com_apple_mobilesms_lpTitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "firstObject");
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v25 = v23;
  else
    v25 = &stru_1E7E221D0;
  objc_msgSend(v3, "attributeSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "attributeForKey:", CFSTR("com_apple_mobilesms_lpDescription"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v28, "firstObject");
    v29 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v29;
  }
  context = (void *)v21;
  if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v30 = v28;
  else
    v30 = &stru_1E7E221D0;
  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "attributeSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "textContentNoCopy");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("%@\n\n%@\n\n%@\n\n%@"), v33, v35, v25, v30);

  objc_autoreleasePoolPop(context);
LABEL_25:

  return v11;
}

+ (id)scoredEntitiesFromMapsIntent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v4;
    -[NSObject parameters](v5, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSObject parameters](v5, "parameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v83 = objc_msgSend(v8, "count");
        _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPNamedEntityPlugin: Maps intent parameter count: %tu", buf, 0xCu);
      }
      v67 = v5;
      v68 = v4;
      v69 = v3;

      v75 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "languageCode");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v11 = v8;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      if (!v12)
      {
        v73 = 0;
        v74 = 0;
        v71 = 0;
        v72 = 0;
        v70 = 0;
        goto LABEL_48;
      }
      v13 = v12;
      v73 = 0;
      v74 = 0;
      v71 = 0;
      v72 = 0;
      v70 = 0;
      v14 = *(_QWORD *)v78;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v78 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
          {
            pp_default_log_handle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPNamedEntityPlugin: ignoring Maps intent property since it is missing role and/or payload", buf, 2u);
            }
            goto LABEL_21;
          }
          objc_msgSend(v16, "role");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("title"));

          if (v18)
            goto LABEL_19;
          objc_msgSend(v16, "role");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Street"));

          if (v20)
          {
            objc_msgSend(v16, "payload");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "payloadStringValues");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "value");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v24, "length"))
            {
              v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v24, 8, v76);
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v25, 0.5);
              objc_msgSend(v75, "addObject:", v26);

              v74 = v24;
LABEL_21:

              goto LABEL_22;
            }
            v74 = v24;
          }
          else
          {
            objc_msgSend(v16, "role");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Name"));

            if (v28)
            {
LABEL_19:
              objc_msgSend(v16, "payload", v67);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "payloadStringValues");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "firstObject");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "value");
              v25 = objc_claimAutoreleasedReturnValue();

              if (-[NSObject length](v25, "length"))
              {
                v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v25, 3, v76);
                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v32, 0.5);
                objc_msgSend(v75, "addObject:", v33);

              }
              goto LABEL_21;
            }
            objc_msgSend(v16, "role");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("City"));

            if (v35)
            {
              objc_msgSend(v16, "payload");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "payloadStringValues");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "firstObject");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "value");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v39, "length"))
              {
                v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v39, 9, v76);
                v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v25, 0.5);
                objc_msgSend(v75, "addObject:", v40);

                v73 = v39;
                goto LABEL_21;
              }
              v73 = v39;
            }
            else
            {
              objc_msgSend(v16, "role");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("ZIP"));

              if (v42)
              {
                objc_msgSend(v16, "payload");
                v25 = objc_claimAutoreleasedReturnValue();
                -[NSObject payloadStringValues](v25, "payloadStringValues");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "firstObject");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "value");
                v45 = objc_claimAutoreleasedReturnValue();

                v72 = (void *)v45;
                goto LABEL_21;
              }
              objc_msgSend(v16, "role");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("State"));

              if (v47)
              {
                objc_msgSend(v16, "payload");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "payloadStringValues");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "firstObject");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "value");
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v51, "length"))
                {
                  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v51, 10, v76);
                  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v25, 0.5);
                  objc_msgSend(v75, "addObject:", v52);

                  v71 = v51;
                  goto LABEL_21;
                }
                v71 = v51;
              }
              else
              {
                objc_msgSend(v16, "role");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("Country"));

                if (v54)
                {
                  objc_msgSend(v16, "payload");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "payloadStringValues");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "firstObject");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "value");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v58, "length"))
                  {
                    v59 = v58;
                    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v58, 11, v76);
                    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v25, 0.5);
                    objc_msgSend(v75, "addObject:", v60);

                    v70 = v59;
                    goto LABEL_21;
                  }
                  v70 = v58;
                }
              }
            }
          }
LABEL_22:
          ++v15;
        }
        while (v13 != v15);
        v61 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
        v13 = v61;
        if (!v61)
        {
LABEL_48:

          +[PPNamedEntitySupport fullAddressForStreetAddress:city:state:postalCode:country:](PPNamedEntitySupport, "fullAddressForStreetAddress:city:state:postalCode:country:", v74, v73, v71, v72, v70);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v68;
          if (objc_msgSend(v63, "length"))
          {
            v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v63, 12, v76);
            v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v64, 0.5);
            objc_msgSend(v75, "addObject:", v65);

          }
          v62 = v75;

          v3 = v69;
          v5 = v67;
          goto LABEL_51;
        }
      }
    }
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPNamedEntityPlugin: ignoring Maps intent since the parameters do not look like an array", buf, 2u);
    }
    v62 = (id)MEMORY[0x1E0C9AA60];
LABEL_51:

  }
  else
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPNamedEntityPlugin: ignoring Maps intent since it isn't a generic intent with parameters", buf, 2u);
    }
    v62 = (id)MEMORY[0x1E0C9AA60];
  }

  return v62;
}

void __33__PPHarvestingUtils_appBlocklist__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "donationBlockedApps");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = (void *)MEMORY[0x1E0C9AA60];
  if (v1)
    v3 = (void *)v1;
  v4 = v3;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
  v6 = (void *)appBlocklist_blocklist;
  appBlocklist_blocklist = v5;

}

@end
