@implementation PSFTZKWSuggestionsTransformerFactory

void __120___PSFTZKWSuggestionsTransformerFactory_formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = (void *)MEMORY[0x1A1AFCA24]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  objc_autoreleasePoolPop(v1);
  v6 = (void *)formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasExprOnceResult;
  formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v0);
}

id __77___PSFTZKWSuggestionsTransformerFactory_formatWithBundleIdsForGroupMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
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
          objc_msgSend(*(id *)(a1 + 32), "formatWithSuggestion:bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), *(_QWORD *)(a1 + 40), 1, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

id __59___PSFTZKWSuggestionsTransformerFactory_filterIDSReachable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _PSSuggestion *v18;
  void *v19;
  void *v20;
  void *v21;
  _PSSuggestion *v22;
  id v24;
  id obj;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v26 = (id)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v3;
    obj = v3;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v36;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(obj);
          v30 = v4;
          v5 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v4);
          v6 = (void *)objc_opt_new();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v29 = v5;
          objc_msgSend(v5, "recipients");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v32 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                if ((objc_msgSend(*(id *)(a1 + 32), "isEligibleRecipient:", v12) & 1) != 0)
                {
                  objc_msgSend(v6, "addObject:", v12);
                }
                else
                {
                  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v12, "handle");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v40 = v14;
                    _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_DEFAULT, "Filtering recipient %@ since not IDS eligible", buf, 0xCu);

                  }
                }
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
            }
            while (v9);
          }

          if (objc_msgSend(v6, "count"))
          {
            v15 = objc_msgSend(v6, "count");
            objc_msgSend(v29, "recipients");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v15 == v17)
            {
              objc_msgSend(v26, "addObject:", v29);
            }
            else
            {
              v18 = [_PSSuggestion alloc];
              objc_msgSend(v29, "bundleID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "reason");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "reasonType");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v18, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v19, 0, 0, v6, v20, v21);
              objc_msgSend(v26, "addObject:", v22);

            }
          }

          v4 = v30 + 1;
        }
        while (v30 + 1 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v28);
    }

    v3 = v24;
  }
  else
  {
    v26 = (id)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

id __74___PSFTZKWSuggestionsTransformerFactory_getCraftedIdentfierForSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4;
  }
  else
  {
    objc_msgSend(v2, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithSeedRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "count") || !objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v20 = v3;
    goto LABEL_19;
  }
  v20 = (id)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v3;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (!v5)
    goto LABEL_17;
  v6 = v5;
  v7 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_msgSend(v9, "recipients");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        objc_msgSend(v9, "recipients");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13 > 1)
          continue;
        objc_msgSend(v9, "recipients");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();

        v16 = *(void **)(a1 + 32);
        -[NSObject handle](v15, "handle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v17);

        if ((v16 & 1) == 0)
          objc_msgSend(v20, "addObject:", v9);
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v9;
          _os_log_fault_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_FAULT, "Empty recipients list in suggestion: %@", buf, 0xCu);
        }
      }

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  }
  while (v6);
LABEL_17:

  v3 = v19;
LABEL_19:

  return v20;
}

id __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithMaxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  char v53;
  uint64_t k;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t m;
  uint64_t v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  NSObject *v68;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id obj;
  void *v77;
  NSObject *v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint8_t v108[128];
  uint8_t buf[4];
  NSObject *v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v70 = v3;
    obj = v3;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v102;
      v72 = a1;
      v73 = v4;
      v71 = v5;
      v74 = *(_QWORD *)v102;
LABEL_4:
      v10 = 0;
      v75 = v8;
      while (1)
      {
        if (*(_QWORD *)v102 != v9)
          objc_enumerationMutation(obj);
        v11 = *(NSObject **)(*((_QWORD *)&v101 + 1) + 8 * v10);
        if (objc_msgSend(v4, "count") == *(_QWORD *)(a1 + 32))
          goto LABEL_83;
        v84 = v11;
        -[NSObject recipients](v11, "recipients");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        v83 = v10;
        if (v13 == 1)
          break;
        if (v13)
        {
          -[NSObject conversationIdentifier](v84, "conversationIdentifier");
          v63 = objc_claimAutoreleasedReturnValue();
          if (!v63)
            goto LABEL_81;
          v64 = (void *)v63;
          -[NSObject conversationIdentifier](v84, "conversationIdentifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v5, "containsObject:", v65);

          v15 = v84;
          if ((v66 & 1) != 0)
            goto LABEL_81;
          -[NSObject conversationIdentifier](v84, "conversationIdentifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v67);

          +[_PSFTZKWSuggestionsTransformerFactory getCraftedIdentfierForSuggestion:](_PSFTZKWSuggestionsTransformerFactory, "getCraftedIdentfierForSuggestion:", v84);
          v14 = objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v14);
LABEL_80:

            objc_msgSend(v4, "addObject:", v15);
            goto LABEL_81;
          }
        }
        else
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v110 = v84;
            _os_log_error_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_ERROR, "No recipient filled in suggestion %@", buf, 0xCu);
          }
        }

LABEL_81:
        v10 = v83 + 1;
        if (v83 + 1 == v8)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_83;
        }
      }
      v15 = v84;
      -[NSObject recipients](v84, "recipients");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_opt_new();
      v19 = v17;
      v20 = (void *)objc_opt_new();
      -[NSObject identifier](v19, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v18, "addObject:", v21);
      v77 = (void *)v21;
      -[NSObject handle](v19, "handle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v18, "addObject:", v22);
      -[NSObject contact](v19, "contact");
      v78 = v19;
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        objc_msgSend(v80, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v23);

        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        objc_msgSend(v80, "emailAddresses");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v98;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v98 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
              objc_msgSend(v29, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v30);

              objc_msgSend(v29, "value");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v31);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
          }
          while (v26);
        }

        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v80, "phoneNumbers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v94;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v94 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
              objc_msgSend(v37, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v38);

              objc_msgSend(v37, "value");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v39);
              objc_msgSend(v39, "stringValue");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                objc_msgSend(v39, "stringValue");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v41);

              }
              objc_msgSend(v39, "digits");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                objc_msgSend(v39, "digits");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v43);

              }
              objc_msgSend(v39, "stringValue");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v39, "stringValue");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v45);

              }
              objc_msgSend(v39, "formattedStringValue");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                objc_msgSend(v39, "formattedStringValue");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v47);

              }
              objc_msgSend(v39, "formattedInternationalStringValue");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
              {
                objc_msgSend(v39, "formattedInternationalStringValue");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v49);

              }
              objc_msgSend(v39, "unformattedInternationalStringValue");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                objc_msgSend(v39, "unformattedInternationalStringValue");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v51);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
          }
          while (v34);
        }

        a1 = v72;
        v4 = v73;
        v5 = v71;
        v15 = v84;
      }
      if ((objc_msgSend(v5, "intersectsSet:", v18) & 1) != 0 || (objc_msgSend(v6, "intersectsSet:", v20) & 1) != 0)
      {
LABEL_74:
        objc_msgSend(v5, "unionSet:", v18);
        objc_msgSend(v6, "unionSet:", v20);
LABEL_75:
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v78;
          _os_log_impl(&dword_1A07F4000, v68, OS_LOG_TYPE_DEFAULT, "Recipient already added %@", buf, 0xCu);
        }

        v9 = v74;
        v8 = v75;
        goto LABEL_81;
      }
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v52 = v20;
      v82 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
      if (v82)
      {
        v79 = v52;
        v53 = 0;
        v81 = *(_QWORD *)v90;
        while (2)
        {
          for (k = 0; k != v82; ++k)
          {
            if (*(_QWORD *)v90 != v81)
              objc_enumerationMutation(v79);
            if ((v53 & 1) != 0)
            {

              a1 = v72;
              v4 = v73;
              v5 = v71;
              goto LABEL_74;
            }
            v55 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v56 = v6;
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
            if (v57)
            {
              v58 = v57;
              v59 = v22;
              v60 = v6;
              v61 = *(_QWORD *)v86;
              while (2)
              {
                for (m = 0; m != v58; ++m)
                {
                  if (*(_QWORD *)v86 != v61)
                    objc_enumerationMutation(v56);
                  if ((objc_msgSend(v55, "isLikePhoneNumber:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * m)) & 1) != 0)
                  {
                    v53 = 1;
                    goto LABEL_63;
                  }
                }
                v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
                if (v58)
                  continue;
                break;
              }
              v53 = 0;
LABEL_63:
              v6 = v60;
              v22 = v59;
            }
            else
            {
              v53 = 0;
            }

          }
          v82 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
          if (v82)
            continue;
          break;
        }
        v52 = v79;

        v5 = v71;
        objc_msgSend(v71, "unionSet:", v18);
        objc_msgSend(v56, "unionSet:", v79);
        a1 = v72;
        v4 = v73;
        v15 = v84;
        if ((v53 & 1) != 0)
          goto LABEL_75;
      }
      else
      {

        objc_msgSend(v5, "unionSet:", v18);
        objc_msgSend(v6, "unionSet:", v52);
      }

      v9 = v74;
      v8 = v75;
      v14 = v78;
      goto LABEL_80;
    }
LABEL_83:

    v3 = v70;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

id __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  char v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v4 = (void *)getCNContactFormatterClass_softClass_4;
    v19 = getCNContactFormatterClass_softClass_4;
    v5 = MEMORY[0x1E0C809B0];
    if (!getCNContactFormatterClass_softClass_4)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getCNContactFormatterClass_block_invoke_4;
      v15[3] = &unk_1E43FEA00;
      v15[4] = &v16;
      __getCNContactFormatterClass_block_invoke_4((uint64_t)v15);
      v4 = (void *)v17[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v16, 8);
    v7 = (void *)objc_opt_new();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2;
    v12[3] = &unk_1E4400DD8;
    v8 = *(_QWORD *)(a1 + 32);
    v14 = *(_BYTE *)(a1 + 40);
    v12[4] = v8;
    v13 = v7;
    v9 = v7;
    objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

_PSSuggestion *__77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _PSSuggestion *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _PSSuggestion *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  BOOL v44;
  char v45;

  v3 = a2;
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "groupName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(v3, "conversationIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v17 != 0;

      }
    }

    objc_msgSend(v3, "recipients");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_29;
    v41[3] = &unk_1E4400DB0;
    v41[4] = *(_QWORD *)(a1 + 32);
    v44 = v8;
    v45 = *(_BYTE *)(a1 + 48);
    v19 = v3;
    v42 = v19;
    v43 = *(id *)(a1 + 40);
    objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count"))
    {
      v38 = v3;
      if ((unint64_t)objc_msgSend(v20, "count") < 2)
      {
        v39 = 0;
        v40 = 0;
      }
      else
      {
        objc_msgSend(v19, "conversationIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "groupName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = [_PSSuggestion alloc];
      objc_msgSend(v19, "bundleID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "derivedIntentIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "image");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reason");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reasonType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "score");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v36) = objc_msgSend(v19, "familySuggestion");
      v16 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:](v28, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:", v37, v40, v39, v20, v29, v30, v31, v32, v33, v36);

      objc_msgSend(v19, "messagesGroupIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSSuggestion setMessagesGroupIdentifier:](v16, "setMessagesGroupIdentifier:", v34);

      v3 = v38;
    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_2((uint64_t)v19, v21, v22, v23, v24, v25, v26, v27);

      v16 = 0;
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

    v16 = 0;
  }

  return v16;
}

_PSRecipient *__77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _PSRecipient *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _PSRecipient *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  _PSRecipient *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "contact");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    || (v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8),
        objc_msgSend(v3, "handle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "getContactForHandle:handleType:", v6, objc_msgSend(v3, "handleType")),
        v4 = objc_claimAutoreleasedReturnValue(),
        v6,
        v4))
  {
    if (-[NSObject contactType](v4, "contactType") == 1)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_29_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

LABEL_7:
      v14 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v3, "handle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      objc_msgSend(v3, "handle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 8);
        v19 = *(_QWORD *)(v17 + 16);
        objc_msgSend(v3, "handle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "getFaceTimeableHandleForContact:interactionStore:seedRecipientHandle:", v4, v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v21;
      }
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "handle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412546;
      v39 = v23;
      v40 = 2112;
      v41 = v15;
      _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_DEFAULT, "Mapped handle %@ to handle %@ and to contact", (uint8_t *)&v38, 0x16u);

    }
    v24 = [_PSRecipient alloc];
    -[NSObject identifier](v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "senderHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "stringFromContact:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:](v24, "initWithIdentifier:senderHandle:handle:displayName:contact:", v25, v26, v15, v27, v4);

  }
  else
  {
    if (!*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "handle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138412290;
        v39 = v37;
        _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "Filtering %@ since no mapped contact found and unmapped suggestions are not allowed", (uint8_t *)&v38, 0xCu);

      }
      goto LABEL_7;
    }
    objc_msgSend(v3, "displayName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      v14 = (_PSRecipient *)v3;
    }
    else
    {
      v31 = [_PSRecipient alloc];
      objc_msgSend(v3, "handle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "senderHandle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contact");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:](v31, "initWithIdentifier:senderHandle:handle:displayName:contact:", v32, v33, v34, v35, v36);

    }
  }
LABEL_14:

  return v14;
}

id __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  _QWORD v16[4];
  __CFString *v17;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "experimentId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "deploymentId");
      objc_msgSend(*(id *)(a1 + 32), "treatmentId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Experiment:%@/%u/%@"), v6, v7, v8);
    }
    else
    {
      v10 = *(void **)(a1 + 40);
      if (!v10)
      {
        v13 = CFSTR("Default");
        goto LABEL_8;
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "rolloutId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 40), "deploymentId");
      objc_msgSend(*(id *)(a1 + 40), "factorPackId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Rollout:%@/%u/%@"), v6, v12, v8);
    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke_2;
    v16[3] = &unk_1E4400E28;
    v17 = v13;
    v14 = v13;
    objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_9:

  return v9;
}

id __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTrialID:", *(_QWORD *)(a1 + 32));
  return v3;
}

void __80___PSFTZKWSuggestionsTransformerFactory_getResultsFromTransformers_suggestions___block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("ps_ft_zkw_transformer", v1);

  v3 = (void *)getResultsFromTransformers_suggestions___pasExprOnceResult;
  getResultsFromTransformers_suggestions___pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __80___PSFTZKWSuggestionsTransformerFactory_getResultsFromTransformers_suggestions___block_invoke_41(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
      if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count", (_QWORD)v11))
        break;
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A07F4000, a2, a3, "Filtering %@ since no recipients provided in suggestion", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A07F4000, a2, a3, "Filtering %@ since no recipients in suggestion after contact mapping", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_29_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A07F4000, a2, a3, "Skipping suggestion %@ since mapped contact is an organization", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
