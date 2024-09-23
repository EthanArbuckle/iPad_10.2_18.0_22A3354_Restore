@implementation _PSAppUsageUtilities

+ (id)mostUsedAppBundleIdsUsingPredicate:(id)a3 knowledgeStore:(id)a4
{
  id v5;
  id v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t j;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  void *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v5;
  objc_msgSend(v7, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v5, v9, 0, 5000, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSAppUsageUtilities.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(":%d"), 39);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientName:", v14);

  objc_msgSend(v12, "setTracker:", &__block_literal_global_22);
  objc_msgSend(v12, "setExecuteConcurrently:", 1);
  objc_msgSend(v12, "setResultType:", 5);
  objc_msgSend(v12, "setGroupByProperties:", &unk_1E442CB68);
  v49 = 0;
  v34 = v12;
  v35 = v6;
  objc_msgSend(v6, "executeQuery:error:", v12, &v49);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v49;
  v40 = v15;
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.valueString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v17)
  {
    v18 = v17;
    v38 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("valueString == %@"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "filteredArrayUsingPredicate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v42;
          v26 = 0.0;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v42 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("duration"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "doubleValue");
              v26 = v26 + v29;

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v24);
        }
        else
        {
          v26 = 0.0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKey:", v30, v20);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v18);
  }

  objc_msgSend(v39, "keysSortedByValueUsingComparator:", &__block_literal_global_25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)shareExtensionsUsedAndInstalledDaysAgo:(int64_t)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4 knowledgeStore:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  _PSSuggestion *v64;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  void *v100;
  void *v101;
  _BYTE v102[128];
  void *v103;
  _QWORD v104[4];

  v104[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForEventsWithStartInDateRangeFrom:to:", v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(v7, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForEventsWithStringValueInValues:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D15A08];
  v17 = (void *)MEMORY[0x1E0CB3528];
  v70 = (void *)v15;
  v71 = (void *)v12;
  v104[0] = v12;
  v104[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appInstallStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v19, v21, 0, 8, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSAppUsageUtilities.m");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingFormat:", CFSTR(":%d"), 83);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClientName:", v24);

  objc_msgSend(v22, "setTracker:", &__block_literal_global_29);
  objc_msgSend(v22, "setExecuteConcurrently:", 1);
  v96 = 0;
  v77 = v8;
  v69 = v22;
  objc_msgSend(v8, "executeQuery:error:", v22, &v96);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v96;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v25;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v93 != v29)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i), "value");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v7, "objectForKey:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v26, "addObject:", v32);
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
    }
    while (v28);
  }

  if (objc_msgSend(v26, "count") && (unint64_t)objc_msgSend(v26, "count") <= 2)
  {
    objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x1E0D15A08];
    objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)v36;
    objc_msgSend(v37, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v39, 0, 1, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSAppUsageUtilities.m");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingFormat:", CFSTR(":%d"), 112);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setClientName:", v42);

    objc_msgSend(v40, "setTracker:", &__block_literal_global_31);
    objc_msgSend(v40, "setExecuteConcurrently:", 1);
    v76 = v40;
    objc_msgSend(v40, "setResultType:", 2);
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v26, "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v74 = v26;
    v43 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    v67 = v26;
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v89 != v45)
            objc_enumerationMutation(v74);
          v47 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setPredicate:", v48);
          v87 = 0;
          objc_msgSend(v77, "executeQuery:error:", v76, &v87);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v87;
          objc_msgSend(v49, "firstObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (v51)
          {
            objc_msgSend(v51, "startDate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v53, v47);

          }
        }
        v44 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v44);
    }

    objc_msgSend(v73, "keysSortedByValueUsingComparator:", &__block_literal_global_32);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v72 = v54;
    v55 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    if (v55)
    {
      v56 = v55;
      v75 = *(id *)v84;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(id *)v84 != v75)
            objc_enumerationMutation(v72);
          v58 = v7;
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v80;
            do
            {
              for (m = 0; m != v61; ++m)
              {
                if (*(_QWORD *)v80 != v62)
                  objc_enumerationMutation(v59);
                v64 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:]([_PSSuggestion alloc], "initWithBundleID:conversationIdentifier:groupName:recipients:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * m), 0, 0, 0);
                if (v64)
                  objc_msgSend(v34, "addObject:", v64);

              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
            }
            while (v61);
          }

          v7 = v58;
        }
        v56 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
      }
      while (v56);
    }

    v26 = v67;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v34;
}

+ (id)suggestionsFromAppBundleIds:(id)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _PSSuggestion *v20;
  uint64_t v22;
  uint64_t v23;
  id obj;
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
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v22 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      v23 = v9;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && objc_msgSend(v12, "count"))
        {
          v14 = v6;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v15);
                v20 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:]([_PSSuggestion alloc], "initWithBundleID:conversationIdentifier:groupName:recipients:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19), 0, 0, 0);
                if (v20)
                  objc_msgSend(v7, "addObject:", v20);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v17);
          }

          v6 = v14;
          v10 = v22;
          v9 = v23;
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)suggestionsFromShareBundleIds:(id)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  _PSSuggestion *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        if (objc_msgSend(v8, "containsObject:", v20, (_QWORD)v23))
        {
          v21 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:]([_PSSuggestion alloc], "initWithBundleID:conversationIdentifier:groupName:recipients:", v20, 0, 0, 0);
          if (v21)
            objc_msgSend(v7, "addObject:", v21);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  return v7;
}

+ (id)boostAppsForSourceBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AFCA24]();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobilePhotosBundleId](_PSConstants, "mobilePhotosBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants appleNewsBundleId](_PSConstants, "appleNewsBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, 0);

  objc_autoreleasePoolPop(v4);
  LODWORD(v6) = objc_msgSend(v8, "containsObject:", v3);
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((_DWORD)v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Rank default (Journal > Reminders) apps for source bundleId: %@", buf, 0xCu);
    }

    +[_PSConstants notesBundleId](_PSConstants, "notesBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    +[_PSConstants journalBundleId](_PSConstants, "journalBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    +[_PSConstants remindersBundleId](_PSConstants, "remindersBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    +[_PSConstants freeformBundleId](_PSConstants, "freeformBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v14;
    +[_PSConstants booksBundleId](_PSConstants, "booksBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v15;
    v16 = v20;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Rank default (Reminders > Journal) apps for source bundleId: %@", buf, 0xCu);
    }

    +[_PSConstants notesBundleId](_PSConstants, "notesBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    +[_PSConstants remindersBundleId](_PSConstants, "remindersBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    +[_PSConstants journalBundleId](_PSConstants, "journalBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    +[_PSConstants booksBundleId](_PSConstants, "booksBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v14;
    +[_PSConstants freeformBundleId](_PSConstants, "freeformBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v15;
    v16 = v19;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:(id)a3 sourceBundleId:(id)a4 sharesFromSourceToTargetBundle:(id)a5 appUsageDurations:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keysSortedByValueUsingComparator:", &__block_literal_global_38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "suggestionsFromShareBundleIds:appBundleIdsToShareExtensionBundleIdsMapping:", v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
LABEL_3:
      v36 = v12;
      objc_msgSend(v13, "keysSortedByValueUsingComparator:", &__block_literal_global_40);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "suggestionsFromAppBundleIds:appBundleIdsToShareExtensionBundleIdsMapping:", v18, v10);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "boostAppsForSourceBundleId:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v10;
      objc_msgSend(a1, "suggestionsFromAppBundleIds:appBundleIdsToShareExtensionBundleIdsMapping:");
      v20 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v19;
      v35 = v17;
      v45[0] = v17;
      v45[1] = v20;
      v32 = (void *)v20;
      v45[2] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v39;
        v25 = (void *)MEMORY[0x1E0C9AA60];
        do
        {
          v26 = 0;
          v27 = v25;
          do
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(a1, "suggestionArrayWithArray:appendingUniqueElementsByBundleIdFromArray:", v27, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            ++v26;
            v27 = v25;
          }
          while (v23 != v26);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v23);
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0C9AA60];
      }

      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v30;
        _os_log_impl(&dword_1A07F4000, v29, OS_LOG_TYPE_INFO, "Returning %@ share extension suggestions based on sharing app usage and most shared apps", buf, 0xCu);

      }
      v12 = v36;
      v10 = v37;
      v17 = v35;
      goto LABEL_21;
    }
  }
  else
  {
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v28, OS_LOG_TYPE_INFO, "No value for app shares found, returning no share extension suggestions based on app share values.", buf, 2u);
    }

    v17 = (void *)MEMORY[0x1E0C9AA60];
    if (v13)
      goto LABEL_3;
  }
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "No value for app usage durations found, returning no share extension suggestions based on app usage.", buf, 2u);
  }
  v25 = (void *)MEMORY[0x1E0C9AA60];
LABEL_21:

  return v25;
}

+ (id)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(int64_t)a4 knowledgeStore:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  void *v25;
  void *v26;
  unint64_t v27;
  double v28;
  uint64_t i;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t j;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id obj;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  void *v82;
  void *v83;
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v9 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForEventsWithStartInDateRangeFrom:to:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v60 = v7;
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValueInValues:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3528];
    v57 = (void *)v13;
    v58 = (void *)v12;
    v84[0] = v12;
    v84[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D15A08];
    objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)v16;
    objc_msgSend(v17, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v16, v19, 0, 5000, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSAppUsageUtilities.m");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingFormat:", CFSTR(":%d"), 287);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClientName:", v24);

    objc_msgSend(v22, "setTracker:", &__block_literal_global_41);
    objc_msgSend(v22, "setResultType:", 5);
    objc_msgSend(v22, "setGroupByProperties:", &unk_1E442CB80);
    objc_msgSend(v22, "setExecuteConcurrently:", 1);
    v78 = 0;
    v59 = v8;
    v55 = v22;
    objc_msgSend(v8, "executeQuery:error:", v22, &v78);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v78;
    v64 = v25;
    objc_msgSend(v25, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.valueString"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = v26;
    v27 = 0x1E0CB3000uLL;
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    if (v65)
    {
      v62 = *(_QWORD *)v75;
      v28 = 0.0;
      do
      {
        for (i = 0; i != v65; ++i)
        {
          if (*(_QWORD *)v75 != v62)
            objc_enumerationMutation(obj);
          v30 = v27;
          v31 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("valueString == %@"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "filteredArrayUsingPredicate:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v71;
            v37 = 0.0;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v71 != v36)
                  objc_enumerationMutation(v33);
                objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("duration"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "doubleValue");
                v37 = v37 + v40;

              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
            }
            while (v35);
          }
          else
          {
            v37 = 0.0;
          }
          v28 = v28 + v37;
          v27 = v30;
          objc_msgSend(*(id *)(v30 + 2024), "numberWithDouble:", v37);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setObject:forKey:", v41, v31);

        }
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
      }
      while (v65);
    }
    else
    {
      v28 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v63, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v43 = v63;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v67 != v46)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
          v49 = *(void **)(v27 + 2024);
          objc_msgSend(v43, "objectForKeyedSubscript:", v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "doubleValue");
          objc_msgSend(v49, "numberWithDouble:", v51 / v28);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v52, v48);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v45);
    }

    v8 = v59;
    v7 = v60;
  }
  else
  {
    v42 = 0;
  }

  return v42;
}

+ (id)sharesFromSourceToTargetBundleValues
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/appShares/value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)appUsageDurations
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/appUsage/durations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)cacheAppUsageDurations:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t j;
  void *v34;
  double v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  NSObject *obj;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  void *v67;
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  v48 = a3;
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/appUsage/durations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModifiedDateForContextualKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  if (v7 <= 0.0 || v7 >= 72000.0)
  {
    v41 = v6;
    v42 = v5;
    v43 = v4;
    v44 = v3;
    v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0x1E0D15000uLL;
    do
    {
      v49 = MEMORY[0x1A1AFCA24]();
      v12 = (void *)MEMORY[0x1E0D15A08];
      objc_msgSend(*(id *)(v11 + 2808), "appUsageStream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v14, v9, 500, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSAppUsageUtilities.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(":%d"), 379);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setClientName:", v19);

      objc_msgSend(v17, "setTracker:", &__block_literal_global_50);
      objc_msgSend(v17, "setResultType:", 5);
      objc_msgSend(v17, "setGroupByProperties:", &unk_1E442CB98);
      objc_msgSend(v17, "setExecuteConcurrently:", 1);
      v62 = 0;
      objc_msgSend(v48, "executeQuery:error:", v17, &v62);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v62;
      if (v21)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v66 = (uint64_t)v21;
          _os_log_error_impl(&dword_1A07F4000, obj, OS_LOG_TYPE_ERROR, "_PSAppUsageUtilities: Error fetching app usage %@", buf, 0xCu);
        }
        v22 = (void *)v49;
      }
      else
      {
        v45 = v17;
        v47 = v9;
        v46 = objc_msgSend(v20, "count");
        objc_msgSend(v20, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.valueString"));
        v23 = objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        obj = v23;
        v53 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        if (v53)
        {
          v52 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v59 != v52)
                objc_enumerationMutation(obj);
              v25 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("valueString == %@"), v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v20;
              objc_msgSend(v20, "filteredArrayUsingPredicate:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = 0u;
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v55;
                v32 = 0.0;
                do
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v55 != v31)
                      objc_enumerationMutation(v28);
                    objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("duration"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "doubleValue");
                    v32 = v32 + v35;

                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
                }
                while (v30);
              }
              else
              {
                v32 = 0.0;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKey:](v51, "setObject:forKey:", v36, v25);

              v20 = v27;
            }
            v53 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
          }
          while (v53);
        }
        v10 = v46;
        v9 = v47 + 500;
        v11 = 0x1E0D15000;
        v22 = (void *)v49;
        v21 = 0;
        v17 = v45;
      }

      objc_autoreleasePoolPop(v22);
      if (v21)
        break;
      v37 = v10 == 500;
      v10 = 500;
    }
    while (v37);
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v38 = objc_claimAutoreleasedReturnValue();
    v8 = v51;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = -[NSObject count](v51, "count");
      *(_DWORD *)buf = 134217984;
      v66 = v39;
      _os_log_impl(&dword_1A07F4000, v38, OS_LOG_TYPE_DEFAULT, "Caching sharing app usage durations for %tu apps", buf, 0xCu);
    }

    v40 = -[NSObject copy](v51, "copy");
    v4 = v43;
    v3 = v44;
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v40, v43);

    v6 = v41;
    v5 = v42;
  }
  else
  {
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "Sharing app usage is still fresh, skipping refresh.", buf, 2u);
    }
  }

}

+ (id)addBiomeDataToCache:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceNow");
      v13 = v12 / -86400.0;
      v14 = (void *)objc_msgSend(v5, "mutableCopy");
      v15 = v14;
      if (v13 <= 32.0)
        v16 = v13 * 0.03125;
      else
        v16 = 1.0;
      objc_msgSend(v14, "objectForKeyedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v8);

      }
      else
      {
        v18 = (void *)objc_opt_new();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, v8);
      }

      objc_msgSend(v15, "objectForKeyedSubscript:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "doubleValue");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 * -0.5 + 1.0 + v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v10);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 * -0.5 + 1.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, v10);
      }

    }
    else
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[_PSAppUsageUtilities addBiomeDataToCache:event:].cold.2(v6);

      v15 = v5;
    }

  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[_PSAppUsageUtilities addBiomeDataToCache:event:].cold.1(v6);

    v15 = v5;
  }

  return v15;
}

+ (void)cacheSharesForEachApp
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[6];
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "Caching share extension counts for each share extension", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/appShares/value"));
  v5 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ShareSheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Feedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v9, "setMonth:", -1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v10;
  objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v11, v12, -1, 0, 1);
  objc_msgSend(v8, "publisherWithOptions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_58;
  v31[3] = &unk_1E4400970;
  v31[4] = buf;
  v31[5] = a1;
  v15 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", &__block_literal_global_57, v31);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", *((_QWORD *)v33 + 5), v5);
  v26 = v8;
  v27 = (void *)v5;
  v16 = a1;
  v28 = v4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = dispatch_queue_create("com.apple.coreduetd.shareSheetFeedback.biomeQueue", v17);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.coreduetd.ShareSheetFeedBackSubscription"), v18);
  BiomeLibrary();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ShareSheet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "Feedback");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "DSLPublisher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subscribeOn:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_66;
  v30[3] = &__block_descriptor_40_e22_v16__0__BMStoreEvent_8l;
  v30[4] = v16;
  objc_msgSend(v24, "sinkWithCompletion:receiveInput:", &__block_literal_global_65, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
}

+ (id)suggestionArrayWithArray:(id)a3 appendingUniqueElementsByBundleIdFromArray:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "bundleID", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v12, "bundleID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v5;
}

+ (void)addBiomeDataToCache:(void *)a1 event:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventBody");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1A07F4000, v2, v3, "Event was missing sourceBundleID: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

+ (void)addBiomeDataToCache:(void *)a1 event:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "eventBody");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1A07F4000, v2, v3, "Event was missing targetBundleID: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

@end
