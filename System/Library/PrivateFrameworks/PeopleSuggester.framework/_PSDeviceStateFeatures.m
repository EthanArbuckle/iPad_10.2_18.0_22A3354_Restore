@implementation _PSDeviceStateFeatures

+ (id)isInCallWithCandidates:(id)a3 facetimeRequest:(BOOL)a4 caches:(id)a5 store:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __objc2_class **v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  _PSFeatureDictionary *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _PSCandidate *v45;
  _BOOL4 v46;
  void *v47;
  _PSFeatureDictionary *v48;
  id v49;
  void *v50;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  BOOL v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  void *v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v62 = a6;
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForActiveCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v21;
    v22 = objc_alloc(MEMORY[0x1E0D020D0]);
    v13 = (void *)objc_msgSend(v22, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, MEMORY[0x1E0C9AAA0], 0);
    v84[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
    v23 = (_PSFeatureDictionary *)objc_claimAutoreleasedReturnValue();
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "calleeContactIDsKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "calleeHandlesKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "bundleIDKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v82 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);

  }
  v56 = (void *)v17;
  v18 = off_1E43FD000;
  if (v13 && objc_msgSend(v13, "count") == 1)
  {
    +[_PSLogging featureGenerationChannel](_PSLogging, "featureGenerationChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "Found a donation in the context store on an active call where calleeContactIDsKey is set", buf, 2u);
    }

    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
  }
  else
  {
    v61 = 0;
  }
  if (objc_msgSend(v15, "count") == 1)
    v20 = v15;
  else
    v20 = 0;
  v59 = v15;
  v60 = v20;
  v57 = v13;
  v58 = v8;
  if (__PAIR128__((unint64_t)v61, (unint64_t)v20) != 0)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v24 = v8;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    if (v25)
    {
      v52 = v10;
      v26 = 0;
      v27 = *(_QWORD *)v71;
      while (2)
      {
        v28 = 0;
        v29 = v26;
        do
        {
          if (*(_QWORD *)v71 != v27)
            objc_enumerationMutation(v24);
          +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v60, v61, 0, &unk_1E442C880, &unk_1E442C898, 0, v62, 1, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v28));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 && objc_msgSend(v26, "count"))
          {

            goto LABEL_28;
          }
          ++v28;
          v29 = v26;
        }
        while (v25 != v28);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
        if (v25)
          continue;
        break;
      }

      if (!v26)
      {
        v8 = v58;
        v10 = v52;
        goto LABEL_35;
      }
LABEL_28:
      v8 = v58;
      if (!objc_msgSend(v26, "count"))
      {
        v10 = v52;
        goto LABEL_35;
      }
      +[_PSLogging featureGenerationChannel](_PSLogging, "featureGenerationChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      v10 = v52;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_INFO, "Could not find matching interaction in caches, falling back to interaction store", buf, 2u);
      }

      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v60, v61, 0, &unk_1E442C8B0, &unk_1E442C8C8, 0, v62, 1, 0);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = v24;
    }

    v26 = (void *)v25;
LABEL_35:
    objc_msgSend(v26, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      +[_PSInteractionStoreUtils conversationIdFromInteraction:bundleIds:](_PSInteractionStoreUtils, "conversationIdFromInteraction:bundleIds:", v31, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

    v13 = v57;
    v18 = off_1E43FD000;
    goto LABEL_39;
  }
  v21 = 0;
LABEL_39:
  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    v54 = a4;
    v55 = v11;
    v53 = v10;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v15);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v33 = v8;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v34)
    {
      v35 = v34;
      v36 = v9;
      v37 = 0;
      v38 = *(_QWORD *)v67;
LABEL_42:
      v39 = 0;
      v40 = v37;
      while (1)
      {
        if (*(_QWORD *)v67 != v38)
          objc_enumerationMutation(v33);
        +[_PSInteractionStoreUtils conversationIdWithExactMatchWithContactHandles:store:bundleIds:messageInteractionCache:](_PSInteractionStoreUtils, "conversationIdWithExactMatchWithContactHandles:store:bundleIds:messageInteractionCache:", v32, v62, 0, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v39));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "count"))
          break;
        ++v39;
        v40 = v37;
        if (v35 == v39)
        {
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
          if (v35)
            goto LABEL_42;
          break;
        }
      }
    }
    else
    {
      v36 = v9;
      v37 = 0;
    }

    v9 = v36;
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v37, "allValues");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v53;
      v11 = v55;
      v13 = v57;
      if (objc_msgSend(v42, "length"))
      {
        v43 = v42;

        v21 = v43;
      }
      v15 = v59;

    }
    else
    {
      v10 = v53;
      v11 = v55;
      v13 = v57;
      v15 = v59;
    }

    a4 = v54;
    v18 = off_1E43FD000;
  }
  v44 = (void *)objc_opt_new();
  -[__objc2_class featureGenerationChannel](v18[8], "featureGenerationChannel");
  v45 = (_PSCandidate *)objc_claimAutoreleasedReturnValue();
  v46 = os_log_type_enabled(&v45->super, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v46)
    {
      *(_DWORD *)buf = 138478339;
      v75 = v15;
      v76 = 2113;
      v77 = v13;
      v78 = 2113;
      v79 = v21;
      _os_log_impl(&dword_1A07F4000, &v45->super, OS_LOG_TYPE_INFO, "Resolved %{private}@ and %{private}@ to %{private}@", buf, 0x20u);
    }

    v47 = v56;
    v45 = -[_PSCandidate initWithDomainId:derivedIntentId:bundleId:recipientsId:]([_PSCandidate alloc], "initWithDomainId:derivedIntentId:bundleId:recipientsId:", v21, v21, v56, 0);
    objc_msgSend(v44, "addObject:", v45);
  }
  else
  {
    if (v46)
    {
      *(_DWORD *)buf = 138478083;
      v75 = v15;
      v76 = 2113;
      v77 = v13;
      _os_log_impl(&dword_1A07F4000, &v45->super, OS_LOG_TYPE_INFO, "Could not resolve %{private}@ and %{private}@ to candidate identifier", buf, 0x16u);
    }
    v47 = v56;
  }

  v48 = [_PSFeatureDictionary alloc];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __78___PSDeviceStateFeatures_isInCallWithCandidates_facetimeRequest_caches_store___block_invoke;
  v63[3] = &unk_1E44003F8;
  v65 = a4;
  v64 = v47;
  v49 = v47;
  objc_msgSend(v44, "_pas_mappedArrayWithTransform:", v63);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_PSFeatureDictionary initWithObjects:forKeys:](v48, "initWithObjects:forKeys:", v50, v44);

  v8 = v58;
LABEL_64:

  return v23;
}

+ (id)isInMeetingWithCandidates:(id)a3 caches:(id)a4
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v26)
  {
    v24 = 0;
    v25 = *(_QWORD *)v33;
    while (1)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v7, "interactions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (!v9)
          goto LABEL_24;
        v10 = v9;
        v27 = i;
        v11 = *(_QWORD *)v29;
        while (2)
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "mechanism"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqualToNumber:", &unk_1E442AC58))
              goto LABEL_17;
            objc_msgSend(v13, "dateInterval");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "containsDate:", v5) & 1) == 0)
            {

LABEL_17:
              continue;
            }
            if (objc_msgSend(v13, "selfParticipantStatus") == 2)
            {

LABEL_22:
              v24 = 1;
              goto LABEL_23;
            }
            v16 = objc_msgSend(v13, "selfParticipantStatus");

            if (v16 == 7)
              goto LABEL_22;
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v10)
            continue;
          break;
        }
LABEL_23:
        i = v27;
LABEL_24:

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (!v26)
        goto LABEL_28;
    }
  }
  v24 = 0;
LABEL_28:

  +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v17;
  v18 = objc_alloc(MEMORY[0x1E0D020D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24 & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, v19, 0);
  v37 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
