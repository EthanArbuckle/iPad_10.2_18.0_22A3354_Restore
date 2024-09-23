@implementation _PSContactSuggester

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:](self, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:", a3, v6, +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 lookBackDays:(int64_t)a5 interactions:(id)a6 modeAvocado:(BOOL)a7
{
  return -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:interactionHistoryCap:](self, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:interactionHistoryCap:", a3, a4, a5, a6, a7, 3000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->contactResolver, 0);
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a4;
  connection = self->_connection;
  if (connection)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_94;
    v12[3] = &unk_1E43FEC50;
    v12[4] = &v13;
    objc_msgSend(v8, "contactSuggestionsWithMaxSuggestions:excludedContactIds:reply:", v9, v6, v12);

    v10 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (_PSContactSuggester)init
{
  _PSContactSuggester *v2;
  _PSContactSuggester *v3;
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PSContactSuggester;
  v2 = -[_PSContactSuggester init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v5 = objc_msgSend(v4, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v5;

    _CDInteractionNSXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_connection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](v3->_connection, "resume");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_computeAndSaveContactPriorArchive, *MEMORY[0x1E0D15B28], 0);

  }
  return v3;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 lookBackDays:(int64_t)a5 interactions:(id)a6 modeAvocado:(BOOL)a7 interactionHistoryCap:(int64_t)a8
{
  _BOOL8 v9;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  _PSContactSuggestion *v46;
  uint64_t v47;
  _PSContactSuggestionHandleAndApp *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unint64_t v89;
  BOOL v90;
  uint64_t v92;
  uint64_t v94;
  uint64_t v95;
  id obj;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  uint8_t v128[128];
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v9 = a7;
  v133 = *MEMORY[0x1E0C80C00];
  v108 = a4;
  v13 = a6;
  if (!v13 && v9)
  {
    -[_PSContactSuggester interactionStore](self, "interactionStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a5));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442C6B8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v92) = 1;
    +[_PSInteractionStoreUtils interactionsFromStore:referenceDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:referenceDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v14, v15, 0, 0, 0, 0, v16, v92, a8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  v101 = v17;
  v109 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v130 = v21;
    v131 = 2112;
    v132 = v22;
    _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "_PSContactSuggester modeAvocado:%@ , interactions returned:%@", buf, 0x16u);

    v19 = v109;
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v13;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
  v102 = v18;
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v123;
    v26 = (float)a5;
    v94 = *(_QWORD *)v123;
    do
    {
      v27 = 0;
      v95 = v24;
      do
      {
        if (*(_QWORD *)v123 != v25)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v27);
        v29 = (void *)MEMORY[0x1A1AFCA24]();
        if (objc_msgSend(v28, "mechanism") != 13)
        {
          v97 = v29;
          v98 = v27;
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          objc_msgSend(v28, "recipients");
          v104 = (id)objc_claimAutoreleasedReturnValue();
          v112 = (id)objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
          if (v112)
          {
            v110 = v28;
            v111 = *(_QWORD *)v119;
            do
            {
              for (i = 0; i != v112; i = (char *)i + 1)
              {
                if (*(_QWORD *)v119 != v111)
                  objc_enumerationMutation(v104);
                v31 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v28, "startDate");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "startOfDayForDate:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v33);

                objc_msgSend(v31, "personId");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "identifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  objc_msgSend(v17, "objectForKeyedSubscript:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {

                  }
                  else if (objc_msgSend(v31, "personIdType") == 3 && v34 != 0)
                  {
                    objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, v35);
                  }
                }
                objc_msgSend(v17, "objectForKeyedSubscript:", v35);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38 && (objc_msgSend(v108, "containsObject:", v38) & 1) == 0)
                {
                  objc_msgSend(v103, "objectForKeyedSubscript:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v39)
                  {

                    v40 = 0x1E0CB3000;
                    v42 = v99;
                    v41 = v100;
                  }
                  else
                  {
                    objc_msgSend(v28, "domainIdentifier");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v43, "containsString:", CFSTR("iMessage"));

                    v40 = 0x1E0CB3000uLL;
                    v42 = v99;
                    v41 = v100;
                    if (v44)
                      objc_msgSend(v103, "setObject:forKeyedSubscript:", v35, v38);
                  }
                  v107 = v34;
                  objc_msgSend(v42, "objectForKeyedSubscript:", v38);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v45)
                  {
                    v46 = objc_alloc_init(_PSContactSuggestion);
                    objc_msgSend(v42, "setObject:forKeyedSubscript:", v46, v38);

                  }
                  objc_msgSend(v110, "bundleId");
                  v47 = objc_claimAutoreleasedReturnValue();
                  v48 = objc_alloc_init(_PSContactSuggestionHandleAndApp);
                  -[_PSContactSuggestionHandleAndApp setHandle:](v48, "setHandle:", v35);
                  v106 = (void *)v47;
                  -[_PSContactSuggestionHandleAndApp setAppBundleId:](v48, "setAppBundleId:", v47);
                  objc_msgSend(*(id *)(v40 + 2024), "numberWithInteger:", objc_msgSend(v110, "mechanism"));
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSContactSuggestionHandleAndApp setInteractionMechanism:](v48, "setInteractionMechanism:", v49);

                  objc_msgSend(v42, "objectForKeyedSubscript:", v38);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "handleAndAppFrequencies");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = (void *)objc_msgSend(v51, "mutableCopy");

                  if (!v52)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v53 = *(void **)(v40 + 2024);
                  objc_msgSend(v52, "objectForKeyedSubscript:", v48);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v54, "integerValue") + 1);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKeyedSubscript:", v55, v48);

                  objc_msgSend(v42, "objectForKeyedSubscript:", v38);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = v52;
                  objc_msgSend(v56, "setHandleAndAppFrequencies:", v52);

                  objc_msgSend(v41, "objectForKeyedSubscript:", v48);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v57)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "setObject:forKeyedSubscript:", v58, v48);

                  }
                  objc_msgSend(v41, "objectForKeyedSubscript:", v48);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "startDate");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "startOfDayForDate:", v60);
                  v61 = v41;
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "addObject:", v62);

                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = *(void **)(v40 + 2024);
                  objc_msgSend(v61, "objectForKeyedSubscript:", v48);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  *(float *)&v66 = (float)(unint64_t)objc_msgSend(v65, "count") / v26;
                  objc_msgSend(v64, "numberWithFloat:", v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "setObject:forKeyedSubscript:", v67, v48);

                  objc_msgSend(v42, "objectForKeyedSubscript:", v38);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "setHandleAndAppRegularityScores:", v63);

                  objc_msgSend(v42, "objectForKeyedSubscript:", v38);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "daysInteracted");
                  v70 = v42;
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v72 = (void *)objc_msgSend(v71, "mutableCopy");

                  if (!v72)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v28 = v110;
                  objc_msgSend(v110, "startDate");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "startOfDayForDate:", v73);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "addObject:", v74);

                  objc_msgSend(v70, "objectForKeyedSubscript:", v38);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "setDaysInteracted:", v72);

                  v17 = v101;
                  v18 = v102;
                  v19 = v109;
                  v34 = v107;
                }

              }
              v112 = (id)objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
            }
            while (v112);
          }

          v25 = v94;
          v24 = v95;
          v29 = v97;
          v27 = v98;
        }
        objc_autoreleasePoolPop(v29);
        ++v27;
      }
      while (v27 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
    }
    while (v24);
  }

  objc_msgSend(v99, "allKeys");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v113 = v76;
  v78 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v115;
    v18 = v102;
LABEL_47:
    v81 = 0;
    while (1)
    {
      if (*(_QWORD *)v115 != v80)
        objc_enumerationMutation(v113);
      v82 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v81);
      objc_msgSend(v99, "objectForKeyedSubscript:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setContactIdentifier:", v82);
      objc_msgSend(v103, "objectForKeyedSubscript:", v82);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setSuggestedHandle:", v84);

      objc_msgSend(v83, "handleAndAppFrequencies");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "allValues");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "valueForKeyPath:", CFSTR("@sum.self"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setTotalFrequency:", objc_msgSend(v87, "integerValue"));

      objc_msgSend(v83, "daysInteracted");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setRegularityScore:", (double)(unint64_t)objc_msgSend(v88, "count") / (double)(unint64_t)objc_msgSend(v102, "count"));

      objc_msgSend(v77, "addObject:", v83);
      v89 = objc_msgSend(v77, "count");

      v90 = v89 >= a3;
      v19 = v109;
      if (v90)
        break;
      if (v79 == ++v81)
      {
        v79 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
        if (v79)
          goto LABEL_47;
        break;
      }
    }
  }

  return v77;
}

- (_CDInteractionStore)interactionStore
{
  os_unfair_lock_s *p_lock;
  _CDInteractionStore *interactionStore;
  void *v5;
  void *v6;
  _CDInteractionStore *v7;
  _CDInteractionStore *v8;
  _CDInteractionStore *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    v5 = (void *)MEMORY[0x1E0D158E0];
    objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeWithDirectory:readOnly:", v6, 1);
    v7 = (_CDInteractionStore *)objc_claimAutoreleasedReturnValue();
    v8 = self->_interactionStore;
    self->_interactionStore = v7;

    interactionStore = self->_interactionStore;
  }
  v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PSContactSuggester;
  -[_PSContactSuggester dealloc](&v3, sel_dealloc);
}

- (CNContactStore)contactStore
{
  os_unfair_lock_s *p_lock;
  CNContactStore *contactStore;
  CNContactStore *v5;
  CNContactStore *v6;
  CNContactStore *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v5 = (CNContactStore *)objc_alloc_init((Class)getCNContactStoreClass());
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  v7 = contactStore;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsByIdentifiers:(id)a4 interactionHistoryCap:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:interactionHistoryCap:](self, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:interactionHistoryCap:", a3, v8, +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays"), 0, 1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  _PSContactResolver *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _PSContactResolver *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  double v23;
  void *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  id v50;
  void *v51;
  void *v52;
  _BOOL4 v54;
  id v56;
  void *v57;
  void *v58;
  id obj;
  char v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _QWORD v76[3];
  _QWORD v77[3];

  v54 = a5;
  v77[1] = *MEMORY[0x1E0C80C00];
  v56 = a4;
  v5 = objc_alloc_init((Class)getCNContactStoreClass());
  getCNContactIdentifierKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, &v71);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v71;

  v50 = v9;
  if (v9)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:].cold.2();

  }
  else if (v8)
  {
    v12 = 1;
    goto LABEL_10;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v50);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:].cold.1();

  v12 = 0;
  v8 = 0;
LABEL_10:
  v13 = [_PSContactResolver alloc];
  getCNContactIdentifierKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v14;
  getCNContactGivenNameKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v15;
  getCNContactFamilyNameKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  v18 = -[_PSContactResolver initWithContactStore:keysToFetch:](v13, "initWithContactStore:keysToFetch:", v5, v17);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  v22 = a3;
  v58 = v19;
  if (objc_msgSend(v19, "count") < (unint64_t)a3)
  {
    v23 = (double)(-86400 * v21);
    v60 = v12 ^ 1;
    while (1)
    {
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:](self, "contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:", v22, v56, v20, v54, 0, v50);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "count"))
        break;
      v57 = (void *)v20;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      obj = v24;
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (v62)
      {
        v61 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v62; ++i)
          {
            if (*(_QWORD *)v68 != v61)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v26, "contactIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSContactResolver contactWithIdentifier:](v18, "contactWithIdentifier:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
            {
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              objc_msgSend(v26, "handleAndAppFrequencies");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
              if (v30)
              {
                v31 = v30;
                v32 = v8;
                v33 = *(_QWORD *)v64;
LABEL_21:
                v34 = 0;
                while (1)
                {
                  if (*(_QWORD *)v64 != v33)
                    objc_enumerationMutation(v29);
                  objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v34), "handle");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:](v18, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v35, 1);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v28)
                    break;
                  if (v31 == ++v34)
                  {
                    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
                    if (v31)
                      goto LABEL_21;
                    v28 = 0;
                    break;
                  }
                }
                v8 = v32;
                v19 = v58;
              }
              else
              {
                v28 = 0;
              }

            }
            if (v28)
              v36 = v60;
            else
              v36 = 1;
            if ((v36 & 1) != 0
              || (objc_msgSend(v8, "identifier"),
                  v37 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v28, "identifier"),
                  v38 = (void *)objc_claimAutoreleasedReturnValue(),
                  v39 = objc_msgSend(v37, "isEqualToString:", v38) ^ 1,
                  v38,
                  v37,
                  (v39 & 1) == 0))
            {
              if (v28)
              {
                objc_msgSend(v28, "givenName");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setGivenName:", v40);

                objc_msgSend(v28, "familyName");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setFamilyName:", v41);

                objc_msgSend(v19, "addObject:", v26);
              }
            }

          }
          v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        }
        while (v62);
      }

      objc_msgSend(v57, "dateByAddingTimeInterval:", v23);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (uint64_t)v42;
      v22 = a3;
      if (objc_msgSend(v19, "count") >= (unint64_t)a3)
        goto LABEL_44;
    }

  }
  v42 = (void *)v20;
LABEL_44:
  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v50);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v58, "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v73 = v44;
    _os_log_impl(&dword_1A07F4000, v43, OS_LOG_TYPE_INFO, "_PSContactSuggester contacts returned: %@ contacts", buf, 0xCu);

  }
  objc_msgSend(v58, "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v58, "count");
  if (v46 >= v22)
    v47 = v22;
  else
    v47 = v46;
  objc_msgSend(v45, "subarrayWithRange:", 0, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 contactKeysTofetch:(id)a4 interactionDomains:(id)a5 appleUsersOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  int64_t v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  if (objc_msgSend(v12, "count") < (unint64_t)a3)
  {
    v15 = (double)(-86400 * v14);
    while (1)
    {
      -[_PSContactSuggester contactsWithMaxSuggestions:contactKeysTofetch:interactionDomains:referenceDate:appleUsersOnly:](self, "contactsWithMaxSuggestions:contactKeysTofetch:interactionDomains:referenceDate:appleUsersOnly:", a3, v10, v11, v13, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "count"))
        break;
      objc_msgSend(v12, "addObjectsFromArray:", v16);
      objc_msgSend(v13, "dateByAddingTimeInterval:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v17;
      if (objc_msgSend(v12, "count") >= (unint64_t)a3)
        goto LABEL_8;
    }

  }
  v17 = v13;
LABEL_8:
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v19;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "_PSContactSuggester contacts returned: %@ contacts", (uint8_t *)&v25, 0xCu);

  }
  objc_msgSend(v12, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v12, "count");
  if (v21 >= a3)
    v22 = a3;
  else
    v22 = v21;
  objc_msgSend(v20, "subarrayWithRange:", 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)contactsWithMaxSuggestions:(int64_t)a3 contactKeysTofetch:(id)a4 interactionDomains:(id)a5 referenceDate:(id)a6 appleUsersOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  char v21;
  void *v22;
  _PSContactResolver *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  char v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[3];

  v7 = a7;
  v63[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:](self, "contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:", a3, a5, a6, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init((Class)getCNContactStoreClass());
  getCNContactIdentifierKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v14, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v16, &v60);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v60;

  v45 = v18;
  if (v18)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:].cold.2();

  }
  else if (v17)
  {
    v21 = 1;
    v22 = v17;
    goto LABEL_10;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:].cold.1();

  v21 = 0;
  v22 = 0;
LABEL_10:
  v46 = v14;
  v47 = v12;
  v23 = -[_PSContactResolver initWithContactStore:keysToFetch:]([_PSContactResolver alloc], "initWithContactStore:keysToFetch:", v14, v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v25 = v13;
  v51 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v51)
  {
    v26 = *(_QWORD *)v57;
    v50 = v21 ^ 1;
    v48 = *(_QWORD *)v57;
    v49 = v24;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(v25);
        v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v28, "contactIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSContactResolver contactWithIdentifier:](v23, "contactWithIdentifier:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          objc_msgSend(v28, "handleAndAppFrequencies");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v32)
          {
            v33 = v32;
            v34 = v25;
            v35 = v22;
            v36 = *(_QWORD *)v53;
LABEL_18:
            v37 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v36)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v37), "handle");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:](v23, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v38, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
                break;
              if (v33 == ++v37)
              {
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
                if (v33)
                  goto LABEL_18;
                v30 = 0;
                break;
              }
            }
            v22 = v35;
            v25 = v34;
            v26 = v48;
            v24 = v49;
          }
          else
          {
            v30 = 0;
          }

        }
        if (v30)
          v39 = v50;
        else
          v39 = 1;
        if ((v39 & 1) != 0
          || (objc_msgSend(v22, "identifier"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v30, "identifier"),
              v41 = (void *)objc_claimAutoreleasedReturnValue(),
              v42 = objc_msgSend(v40, "isEqualToString:", v41),
              v41,
              v40,
              (v42 & 1) == 0))
        {
          if (v30)
            objc_msgSend(v24, "addObject:", v30);
        }

      }
      v51 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v51);
  }

  v43 = (void *)objc_msgSend(v24, "copy");
  return v43;
}

- (id)gameCenterSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5 includeGroupSuggestions:(BOOL)a6 excludeContactsByIdentifiers:(id)a7
{
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  _PSContactResolver *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _PSSuggestion *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  _PSRecipient *v46;
  void *v47;
  void *v48;
  void *v49;
  _PSRecipient *v50;
  _PSSuggestion *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  _PSRecipient *v57;
  void *v58;
  _PSRecipient *v59;
  void *v60;
  void *v61;
  _PSSuggestion *v62;
  void *v63;
  _PSSuggestion *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t m;
  void *v88;
  char v89;
  NSObject *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  int64_t v94;
  void *v95;
  void *v97;
  void *v98;
  id v99;
  id v100;
  id v102;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id obj;
  char v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  void *v115;
  void *v116;
  uint64_t i;
  void *v118;
  id v119;
  id v120;
  _PSContactResolver *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[4];
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[5];
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  id v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _PSRecipient *v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _QWORD v163[4];
  void *v164;
  __int128 buf;
  Class (*v166)(uint64_t);
  void *v167;
  uint64_t *v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v102 = a4;
  v114 = a7;
  v100 = objc_alloc_init((Class)getCNContactStoreClass());
  getCNContactIdentifierKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v164, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = 0;
  objc_msgSend(v100, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v9, &v152);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v152;

  if (v99)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:].cold.2();

    goto LABEL_5;
  }
  if (!v108)
  {
LABEL_5:
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:].cold.1();

    v12 = 0;
    v108 = 0;
    goto LABEL_10;
  }
  v12 = 1;
LABEL_10:
  v13 = [_PSContactResolver alloc];
  getCNContactIdentifierKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v14;
  getCNContactGivenNameKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v15;
  getCNContactFamilyNameKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v163[2] = v16;
  getCNContactPhoneNumbersKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v163[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = -[_PSContactResolver initWithContactStore:keysToFetch:](v13, "initWithContactStore:keysToFetch:", v100, v18);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  v146 = 0;
  v147 = &v146;
  v148 = 0x3032000000;
  v149 = __Block_byref_object_copy__0;
  v150 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v151 = (id)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "GameCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "SuggestionFeedback");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v98, "publisherWithUseCase:", CFSTR("GameCenterSuggestionFeedback"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = MEMORY[0x1E0C809B0];
  v145[1] = 3221225472;
  v145[2] = __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_119;
  v145[3] = &unk_1E43FECB8;
  v145[4] = &v146;
  v22 = (id)objc_msgSend(v97, "sinkWithCompletion:receiveInput:", &__block_literal_global_118, v145);
  v23 = (double)(-86400 * v19);
  v110 = v12 ^ 1;
  while (objc_msgSend(v111, "count") < (unint64_t)a3)
  {
    -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:excludeContactsByIdentifiers:](self, "contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:excludeContactsByIdentifiers:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "count"))
    {

      break;
    }
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    obj = v24;
    v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v162, 16);
    if (!v113)
      goto LABEL_66;
    v112 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v113; ++i)
      {
        if (*(_QWORD *)v142 != v112)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        objc_msgSend(v25, "contactIdentifier");
        v119 = (id)objc_claimAutoreleasedReturnValue();
        v116 = v25;
        objc_msgSend(v25, "groupIdentifier");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119)
        {
          objc_msgSend(v25, "suggestedHandle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSContactResolver contactWithIdentifier:](v121, "contactWithIdentifier:", v119);
          v27 = (_PSSuggestion *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            v139 = 0u;
            v140 = 0u;
            v137 = 0u;
            v138 = 0u;
            objc_msgSend(v25, "handleAndAppFrequencies");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v137, v161, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v138;
LABEL_22:
              v31 = 0;
              while (1)
              {
                if (*(_QWORD *)v138 != v30)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * v31), "handle");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:](v121, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v32, 1);
                v27 = (_PSSuggestion *)objc_claimAutoreleasedReturnValue();

                if (v27)
                  break;
                if (v29 == ++v31)
                {
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v137, v161, 16);
                  if (v29)
                    goto LABEL_22;
                  goto LABEL_28;
                }
              }
            }
            else
            {
LABEL_28:
              v27 = 0;
            }

          }
          if (v27)
            v33 = v110;
          else
            v33 = 1;
          if ((v33 & 1) != 0)
          {
            if (!v27)
            {
LABEL_63:

              goto LABEL_64;
            }
          }
          else
          {
            objc_msgSend(v108, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSSuggestion identifier](v27, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqualToString:", v35);

            if ((v36 & 1) != 0)
              goto LABEL_63;
          }
          v57 = [_PSRecipient alloc];
          -[_PSSuggestion identifier](v27, "identifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[_PSRecipient initWithIdentifier:handle:contact:](v57, "initWithIdentifier:handle:contact:", v58, v26, 0);

          -[_PSSuggestion givenName](v27, "givenName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSRecipient setGivenName:](v59, "setGivenName:", v60);

          -[_PSSuggestion familyName](v27, "familyName");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSRecipient setFamilyName:](v59, "setFamilyName:", v61);

          v62 = [_PSSuggestion alloc];
          v160 = v59;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v160, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v62, "initWithBundleID:conversationIdentifier:groupName:recipients:", 0, 0, 0, v63);

          v65 = v111;
          if (v26)
          {
            if (objc_msgSend((id)v147[5], "containsObject:", v26))
              v65 = v107;
            else
              v65 = v111;
          }
          objc_msgSend(v65, "addObject:", v64);

          goto LABEL_63;
        }
        if (v115)
        {
          objc_msgSend(v25, "groupRecipients");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count") == 0;

          if (!v38)
          {
            v39 = (void *)MEMORY[0x1E0C99DE8];
            objc_msgSend(v116, "groupRecipients");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "arrayWithCapacity:", objc_msgSend(v40, "count"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v135 = 0u;
            v136 = 0u;
            v133 = 0u;
            v134 = 0u;
            objc_msgSend(v116, "groupRecipients");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v133, v159, 16);
            if (v42)
            {
              v43 = *(_QWORD *)v134;
              do
              {
                for (j = 0; j != v42; ++j)
                {
                  if (*(_QWORD *)v134 != v43)
                    objc_enumerationMutation(v41);
                  v45 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
                  v46 = [_PSRecipient alloc];
                  objc_msgSend(v45, "personId");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "identifier");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "displayName");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v46, "initWithIdentifier:handle:displayName:contact:", v47, v48, v49, 0);

                  objc_msgSend(v26, "addObject:", v50);
                }
                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v133, v159, 16);
              }
              while (v42);
            }

            v51 = [_PSSuggestion alloc];
            objc_msgSend(v116, "groupName");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v51, "initWithBundleID:conversationIdentifier:groupName:recipients:", 0, v115, v52, v26);

            objc_msgSend(v116, "imageURL");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
            {
              v153 = 0;
              v154 = &v153;
              v155 = 0x2050000000;
              v54 = (void *)getINImageClass_softClass;
              v156 = getINImageClass_softClass;
              if (!getINImageClass_softClass)
              {
                *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                *((_QWORD *)&buf + 1) = 3221225472;
                v166 = __getINImageClass_block_invoke;
                v167 = &unk_1E43FEA00;
                v168 = &v153;
                __getINImageClass_block_invoke((uint64_t)&buf);
                v54 = (void *)v154[3];
              }
              v55 = objc_retainAutorelease(v54);
              _Block_object_dispose(&v153, 8);
              objc_msgSend(v116, "imageURL");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "imageWithURL:", v106);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v105;
            }
            else
            {
              v56 = 0;
            }
            -[_PSSuggestion setImage:](v27, "setImage:", v56);
            if (v53)
            {

            }
            objc_msgSend(v116, "messagesGroupIdentifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSSuggestion setMessagesGroupIdentifier:](v27, "setMessagesGroupIdentifier:", v66);

            v67 = objc_msgSend((id)v147[5], "containsObject:", v115);
            v68 = v111;
            if (v67)
            {
              +[_PSLogging generalChannel](_PSLogging, "generalChannel");
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v115;
                _os_log_impl(&dword_1A07F4000, v69, OS_LOG_TYPE_INFO, "Boosting Game Center suggestion with groupIdentifier: %@ due to previous feedback", (uint8_t *)&buf, 0xCu);
              }

              v68 = v107;
            }
            objc_msgSend(v68, "addObject:", v27);
            goto LABEL_63;
          }
        }
LABEL_64:

      }
      v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v162, 16);
    }
    while (v113);
LABEL_66:

    objc_msgSend(v104, "dateByAddingTimeInterval:", v23);
    v70 = objc_claimAutoreleasedReturnValue();

    v104 = (void *)v70;
  }
  objc_msgSend(v111, "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "addObjectsFromArray:", v71);

  v72 = (void *)objc_opt_new();
  v73 = (void *)objc_opt_new();
  objc_msgSend(v107, "reverseObjectEnumerator");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "allObjects");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_124;
  v130[3] = &unk_1E43FECE0;
  v76 = v72;
  v131 = v76;
  v77 = v73;
  v132 = v77;
  objc_msgSend(v75, "_pas_filteredArrayWithTest:", v130);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v120 = v78;
  v79 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v126, v158, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v127;
    do
    {
      for (k = 0; k != v79; ++k)
      {
        if (*(_QWORD *)v127 != v80)
          objc_enumerationMutation(v120);
        v82 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * k);
        objc_msgSend(v82, "recipients");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v84 = v83;
        v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v122, v157, 16);
        if (v85)
        {
          v86 = *(_QWORD *)v123;
          while (2)
          {
            for (m = 0; m != v85; ++m)
            {
              if (*(_QWORD *)v123 != v86)
                objc_enumerationMutation(v84);
              objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * m), "identifier");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v114, "containsObject:", v88);

              if ((v89 & 1) != 0)
              {

                goto LABEL_83;
              }
            }
            v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v122, v157, 16);
            if (v85)
              continue;
            break;
          }
        }

        objc_msgSend(v118, "addObject:", v82);
LABEL_83:

      }
      v79 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v126, v158, 16);
    }
    while (v79);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v90 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v118, "count"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v91;
    _os_log_impl(&dword_1A07F4000, v90, OS_LOG_TYPE_INFO, "_PSContactSuggester contacts returned: %@ contacts/groups", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v118, "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v118, "count");
  if (v93 >= a3)
    v94 = a3;
  else
    v94 = v93;
  objc_msgSend(v92, "subarrayWithRange:", 0, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v146, 8);
  return v95;
}

- (id)gameCenterSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 appleUsersOnly:(BOOL)a5
{
  return -[_PSContactSuggester gameCenterSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:includeGroupSuggestions:excludeContactsByIdentifiers:](self, "gameCenterSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:includeGroupSuggestions:excludeContactsByIdentifiers:", a3, a4, a5, 1, 0);
}

- (void)gameCenterSuggestionConsumedWithContactHandle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)getBMGameCenterSuggestionFeedbackClass()), "initWithIdentifier:", v3);
    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "GameCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SuggestionFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:", v4);

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester gameCenterSuggestionConsumedWithContactHandle:].cold.1();
  }

}

- (void)gameCenterSuggestionConsumedWithGroupIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)getBMGameCenterSuggestionFeedbackClass()), "initWithIdentifier:", v3);
    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "GameCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SuggestionFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:", v4);

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester gameCenterSuggestionConsumedWithGroupIdentifier:].cold.1();
  }

}

- (id)contactAndGroupSuggestionsWithMaxSuggestions:(int64_t)a3 lookBackDays:(int64_t)a4 interactions:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  float v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  _PSContactSuggestion *v41;
  uint64_t v42;
  _PSContactSuggestionHandleAndApp *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _PSContactSuggestion *v75;
  uint64_t v76;
  _PSContactSuggestion *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  unint64_t v103;
  unint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id obj;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v105 = a3;
  v143 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v11 = v6;
  v115 = v9;
  v116 = v7;
  v109 = v11;
  v123 = v10;
  v112 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
  if (v112)
  {
    v111 = *(_QWORD *)v137;
    v12 = (float)a4;
    v13 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v112; ++i)
      {
        if (*(_QWORD *)v137 != v111)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1A1AFCA24]();
        if (objc_msgSend(v15, "mechanism") != 13)
        {
          v110 = v16;
          objc_msgSend(v15, "bundleId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v15;
          v113 = i;
          if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
          {
            objc_msgSend(v15, "recipients");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            i = v113;
            v21 = v20 == 1;
            v15 = v124;
            if (!v21)
            {
              objc_msgSend(v124, "startDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "startOfDayForDate:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "addObject:", v23);

              objc_msgSend(v124, "domainIdentifier");
              v24 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "bundleId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v25, "isEqualToString:", v26);

              if (v27)
              {
                objc_msgSend(v124, "account");
                v28 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v28 = 0;
              }
              v29 = (void *)v24;
              objc_msgSend(v108, "objectForKeyedSubscript:", v24, v105);
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v70)
              {
                objc_msgSend(v124, "recipients");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "setObject:forKeyedSubscript:", v71, v24);

                objc_msgSend(v124, "groupName");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "setObject:forKeyedSubscript:", v72, v24);

                objc_msgSend(v124, "contentURL");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "setObject:forKeyedSubscript:", v73, v24);

              }
              objc_msgSend(v8, "objectForKeyedSubscript:", v24);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              v11 = v109;
              v127 = (void *)v28;
              if (v74)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", v29);
                v75 = (_PSContactSuggestion *)objc_claimAutoreleasedReturnValue();
                v76 = -[_PSContactSuggestion totalFrequency](v75, "totalFrequency") + 1;
                v77 = v75;
              }
              else
              {
                v75 = objc_alloc_init(_PSContactSuggestion);
                -[_PSContactSuggestion setGroupIdentifier:](v75, "setGroupIdentifier:", v29);
                -[_PSContactSuggestion setMessagesGroupIdentifier:](v75, "setMessagesGroupIdentifier:", v28);
                objc_msgSend(v107, "objectForKeyedSubscript:", v29);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactSuggestion setGroupName:](v75, "setGroupName:", v78);

                objc_msgSend(v108, "objectForKeyedSubscript:", v29);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactSuggestion setGroupRecipients:](v75, "setGroupRecipients:", v79);

                objc_msgSend(v106, "objectForKeyedSubscript:", v29);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactSuggestion setImageURL:](v75, "setImageURL:", v80);

                v77 = v75;
                v76 = 1;
              }
              -[_PSContactSuggestion setTotalFrequency:](v77, "setTotalFrequency:", v76);
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v75, v29);

              objc_msgSend(v8, "objectForKeyedSubscript:", v29);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "daysInteracted");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = (void *)objc_msgSend(v82, "mutableCopy");

              if (!v83)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v124, "startDate");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "startOfDayForDate:", v84);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "addObject:", v85);

              objc_msgSend(v8, "objectForKeyedSubscript:", v29);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "setDaysInteracted:", v83);

              goto LABEL_48;
            }
          }
          else
          {

          }
          v134 = 0u;
          v135 = 0u;
          v132 = 0u;
          v133 = 0u;
          objc_msgSend(v15, "recipients", v105);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
          if (v120)
          {
            v119 = *(_QWORD *)v133;
            obj = v29;
            do
            {
              for (j = 0; j != v120; ++j)
              {
                if (*(_QWORD *)v133 != v119)
                  objc_enumerationMutation(obj);
                v31 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
                objc_msgSend(v15, "startDate");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "startOfDayForDate:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "addObject:", v33);

                objc_msgSend(v31, "personId");
                v34 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "identifier");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectForKeyedSubscript:");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35 || objc_msgSend(v31, "personIdType") != 3)
                {

                }
                else if (v34)
                {
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, v126);
                }
                v125 = (void *)v34;
                objc_msgSend(v7, "objectForKeyedSubscript:", v126);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (v36)
                {
                  objc_msgSend(v117, "objectForKeyedSubscript:", v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {

                  }
                  else
                  {
                    objc_msgSend(v15, "domainIdentifier");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = objc_msgSend(v38, "containsString:", CFSTR("iMessage"));

                    if (v39)
                      objc_msgSend(v117, "setObject:forKeyedSubscript:", v126, v36);
                  }
                  objc_msgSend(v8, "objectForKeyedSubscript:", v36);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v40)
                  {
                    v41 = objc_alloc_init(_PSContactSuggestion);
                    objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, v36);

                  }
                  objc_msgSend(v15, "bundleId");
                  v42 = objc_claimAutoreleasedReturnValue();
                  v43 = objc_alloc_init(_PSContactSuggestionHandleAndApp);
                  -[_PSContactSuggestionHandleAndApp setHandle:](v43, "setHandle:", v126);
                  v122 = (void *)v42;
                  -[_PSContactSuggestionHandleAndApp setAppBundleId:](v43, "setAppBundleId:", v42);
                  objc_msgSend(*(id *)(v13 + 2024), "numberWithInteger:", objc_msgSend(v15, "mechanism"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSContactSuggestionHandleAndApp setInteractionMechanism:](v43, "setInteractionMechanism:", v44);

                  objc_msgSend(v8, "objectForKeyedSubscript:", v36);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "handleAndAppFrequencies");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = (void *)objc_msgSend(v46, "mutableCopy");

                  if (!v47)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v48 = *(void **)(v13 + 2024);
                  objc_msgSend(v47, "objectForKeyedSubscript:", v43);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "numberWithInteger:", objc_msgSend(v49, "integerValue") + 1);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setObject:forKeyedSubscript:", v50, v43);

                  objc_msgSend(v8, "objectForKeyedSubscript:", v36);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v121 = v47;
                  objc_msgSend(v51, "setHandleAndAppFrequencies:", v47);

                  objc_msgSend(v9, "objectForKeyedSubscript:", v43);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v52)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v53, v43);

                  }
                  objc_msgSend(v9, "objectForKeyedSubscript:", v43);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v124, "startDate");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "startOfDayForDate:", v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "addObject:", v56);

                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = *(void **)(v13 + 2024);
                  objc_msgSend(v9, "objectForKeyedSubscript:", v43);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  *(float *)&v60 = (float)(unint64_t)objc_msgSend(v59, "count") / v12;
                  objc_msgSend(v58, "numberWithFloat:", v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "setObject:forKeyedSubscript:", v61, v43);

                  objc_msgSend(v8, "objectForKeyedSubscript:", v36);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "setHandleAndAppRegularityScores:", v57);

                  objc_msgSend(v8, "objectForKeyedSubscript:", v36);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "daysInteracted");
                  v64 = v8;
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = (void *)objc_msgSend(v65, "mutableCopy");

                  if (!v66)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v15 = v124;
                  objc_msgSend(v124, "startDate");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "startOfDayForDate:", v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "addObject:", v68);

                  objc_msgSend(v64, "objectForKeyedSubscript:", v36);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "setDaysInteracted:", v66);

                  v8 = v64;
                  v9 = v115;
                  v7 = v116;
                  v10 = v123;
                  v13 = 0x1E0CB3000;
                }

              }
              v29 = obj;
              v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
            }
            while (v120);
            v11 = v109;
LABEL_48:
            i = v113;
          }

          v16 = v110;
        }
        objc_autoreleasePoolPop(v16);
      }
      v112 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
    }
    while (v112);
  }

  objc_msgSend(v8, "allKeys");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v105);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v89 = v87;
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v129;
LABEL_54:
    v93 = 0;
    while (1)
    {
      if (*(_QWORD *)v129 != v92)
        objc_enumerationMutation(v89);
      v94 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * v93);
      objc_msgSend(v8, "objectForKeyedSubscript:", v94, v105);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "groupIdentifier");
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v96)
      {
        objc_msgSend(v95, "setContactIdentifier:", v94);
        objc_msgSend(v117, "objectForKeyedSubscript:", v94);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setSuggestedHandle:", v97);

        objc_msgSend(v95, "handleAndAppFrequencies");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "allValues");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "valueForKeyPath:", CFSTR("@sum.self"));
        v100 = v8;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setTotalFrequency:", objc_msgSend(v101, "integerValue"));

        v8 = v100;
      }
      objc_msgSend(v95, "daysInteracted");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setRegularityScore:", (double)(unint64_t)objc_msgSend(v102, "count") / (double)(unint64_t)objc_msgSend(v118, "count"));

      objc_msgSend(v88, "addObject:", v95);
      v103 = objc_msgSend(v88, "count");

      if (v103 >= v105)
        break;
      if (v91 == ++v93)
      {
        v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
        if (v91)
          goto LABEL_54;
        break;
      }
    }
  }

  return v88;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 referenceDate:(id)a5 appleUsersOnly:(BOOL)a6 includeGroups:(BOOL)a7 excludeContactsByIdentifiers:(id)a8
{
  _BOOL4 v9;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __objc2_class **v34;
  NSObject *v35;
  char **__ptr32 *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  void *context;
  int64_t v77;
  _PSContactSuggester *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id obja;
  id obj;
  id v87;
  _BOOL4 v88;
  uint64_t v89;
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
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  _QWORD v106[7];
  _BYTE v107[128];
  uint64_t v108;

  v74 = a7;
  v9 = a6;
  v108 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v80 = a5;
  v87 = a8;
  context = (void *)MEMORY[0x1A1AFCA24]();
  v13 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = self;
  v79 = v12;
  v81 = v14;
  v88 = v9;
  v77 = v13;
  if (!v9)
  {
    if (!objc_msgSend(v12, "count"))
    {
      objc_msgSend(v14, "addObject:", &unk_1E442A688);
      objc_msgSend(v14, "addObject:", &unk_1E442A6A0);
      objc_msgSend(v14, "addObject:", &unk_1E442A6B8);
      objc_msgSend(v14, "addObject:", &unk_1E442A6D0);
      objc_msgSend(v14, "addObject:", &unk_1E442A6E8);
      v15 = &unk_1E442A658;
      goto LABEL_21;
    }
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    if (!v17)
    {
LABEL_17:

      v14 = v81;
LABEL_19:
      v13 = v77;
      goto LABEL_22;
    }
    v18 = v17;
    v19 = *(_QWORD *)v99;
LABEL_6:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v99 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v20);
      if (!objc_msgSend(v21, "integerValue"))
      {
        v14 = v81;
        objc_msgSend(v81, "addObject:", &unk_1E442A688);
        objc_msgSend(v81, "addObject:", &unk_1E442A6A0);
        objc_msgSend(v81, "addObject:", &unk_1E442A6B8);
        objc_msgSend(v81, "addObject:", &unk_1E442A6D0);
        objc_msgSend(v81, "addObject:", &unk_1E442A6E8);
        objc_msgSend(v81, "addObject:", &unk_1E442A658);

        goto LABEL_19;
      }
      v22 = objc_msgSend(v21, "integerValue");
      v23 = &unk_1E442A688;
      if (v22 == 1)
        goto LABEL_14;
      if (objc_msgSend(v21, "integerValue", &unk_1E442A688) == 2)
        break;
      v24 = objc_msgSend(v21, "integerValue");
      v23 = &unk_1E442A658;
      if (v24 == 3)
        goto LABEL_14;
LABEL_15:
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
        if (v18)
          goto LABEL_6;
        goto LABEL_17;
      }
    }
    objc_msgSend(v81, "addObject:", &unk_1E442A6A0);
    objc_msgSend(v81, "addObject:", &unk_1E442A6B8);
    objc_msgSend(v81, "addObject:", &unk_1E442A6D0);
    v23 = &unk_1E442A6E8;
LABEL_14:
    objc_msgSend(v81, "addObject:", v23);
    goto LABEL_15;
  }
  v15 = &unk_1E442A688;
LABEL_21:
  objc_msgSend(v14, "addObject:", v15);
LABEL_22:
  -[_PSContactSuggester interactionStore](self, "interactionStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "dateByAddingTimeInterval:", (double)(-86400 * v13));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v14, "copy");
  v26 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v106[0] = obja;
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v82;
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v72;
  +[_PSConstants macMailBundleId](_PSConstants, "macMailBundleId");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v70;
  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v106[4] = v27;
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v106[5] = v28;
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v106[6] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442C6D0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v68) = 0;
  +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v25, v71, v80, v69, 0, v31, 0, v32, v68, 3000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = off_1E43FD000;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = &off_1A08F9000;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v105 = v37;
    _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "_PSContactSuggester: interactions returned: %@", buf, 0xCu);

    v34 = off_1E43FD000;
  }

  v38 = (void *)0x1E0C99000;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v79;
  v41 = v87;
  if (!v88)
  {
    v52 = objc_msgSend(v33, "copy");
    v51 = v39;
    v39 = (void *)v52;
    goto LABEL_43;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v33;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
  if (!v42)
    goto LABEL_41;
  v43 = v42;
  v83 = v39;
  v73 = v33;
  v89 = *(_QWORD *)v95;
  do
  {
    for (i = 0; i != v43; ++i)
    {
      if (*(_QWORD *)v95 != v89)
        objc_enumerationMutation(obj);
      v45 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
      objc_msgSend(v45, "bundleId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqualToString:", v47);
      if ((v48 & 1) == 0)
      {
        objc_msgSend(v45, "bundleId");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v38, "isEqualToString:", v40))
        {
          LOBYTE(v50) = 0;
LABEL_36:

          if ((v50 & 1) == 0)
            continue;
LABEL_37:
          objc_msgSend(v83, "addObject:", v45);
          continue;
        }
      }
      objc_msgSend(v45, "domainIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "containsString:", CFSTR("iMessage"));

      if ((v48 & 1) == 0)
        goto LABEL_36;

      if (v50)
        goto LABEL_37;
    }
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
  }
  while (v43);
  v40 = v79;
  v41 = v87;
  v33 = v73;
  v39 = v83;
  v36 = &off_1A08F9000;
  v34 = off_1E43FD000;
LABEL_41:
  v51 = obj;
LABEL_43:

  -[__objc2_class generalChannel](v34[8], "generalChannel");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = *((_QWORD *)v36 + 36);
    v105 = v54;
    _os_log_impl(&dword_1A07F4000, v53, OS_LOG_TYPE_INFO, "_PSContactSuggester: Filtered interactions returned: %@", buf, 0xCu);

  }
  if (v74)
  {
    v55 = (id)objc_opt_new();
    -[_PSContactSuggester contactAndGroupSuggestionsWithMaxSuggestions:lookBackDays:interactions:](v78, "contactAndGroupSuggestionsWithMaxSuggestions:lookBackDays:interactions:", a3, v77, v39);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "count"))
    {
      v84 = v39;
      v57 = v33;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v58 = v55;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v91;
        do
        {
          for (j = 0; j != v60; ++j)
          {
            if (*(_QWORD *)v91 != v61)
              objc_enumerationMutation(v58);
            v63 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
            objc_msgSend(v63, "contactIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v87, "containsObject:", v64);

            if ((v65 & 1) == 0)
              objc_msgSend(v58, "addObject:", v63);
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
        }
        while (v60);
      }

      v55 = v58;
      v56 = v55;
      v41 = v87;
      v33 = v57;
      v39 = v84;
    }
  }
  else
  {
    v55 = (id)objc_msgSend(v39, "copy");
    -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:](v78, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:lookBackDays:interactions:modeAvocado:", a3, v41, v77, v55, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v56, "sortedArrayUsingComparator:", &__block_literal_global_135);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v66;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 interactionDomains:(id)a4 referenceDate:(id)a5 appleUsersOnly:(BOOL)a6 includeGroups:(BOOL)a7
{
  return -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:excludeContactsByIdentifiers:](self, "contactSuggestionsWithMaxSuggestions:interactionDomains:referenceDate:appleUsersOnly:includeGroups:excludeContactsByIdentifiers:", a3, a4, a5, a6, a7, 0);
}

- (id)computeContactPriorsForContactIdentifiers:(id)a3 withTimeConstant:(int64_t)a4 withInteractionMechanisms:(id)a5 asOf:(id)a6 overLookbackOf:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  float v46;
  double v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v70;
  void *v71;
  id v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *context;
  uint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
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
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v12 = a5;
  v13 = a6;
  -[_PSContactSuggester interactionStore](self, "interactionStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(-86400 * a7));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v12;
  v16 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442C6E8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v70) = 0;
  v80 = v13;
  +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v14, v15, v13, v16, 0, 0, 0, v17, v70, 3000);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v102 = v20;
    _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "_PSContactSuggester: interactions returned: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v18;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
  if (v75)
  {
    v74 = *(_QWORD *)v94;
    v22 = (double)a4;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v94 != v74)
          objc_enumerationMutation(obj);
        v79 = v23;
        v24 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v23);
        context = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v24, "sender");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "personId");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            -[_PSContactSuggester getDefaultContactPriorForContactId:withModelName:withModelVersion:](self, "getDefaultContactPriorForContactId:withModelName:withModelVersion:", v25, CFSTR("PSContactSuggester"), CFSTR("0"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, v25);

          }
          objc_msgSend(v21, "objectForKeyedSubscript:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSContactSuggester decayForReferenceDate:relativeTo:withTimeConstant:](self, "decayForReferenceDate:relativeTo:withTimeConstant:", v29, v80, v22);
          v31 = v30;
          objc_msgSend(v28, "priorScore");
          *(float *)&v33 = v31 + v32;
          objc_msgSend(v28, "setPriorScore:", v33);

        }
        v76 = (void *)v25;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_msgSend(v24, "recipients");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v90 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "personId");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v40)
                {
                  -[_PSContactSuggester getDefaultContactPriorForContactId:withModelName:withModelVersion:](self, "getDefaultContactPriorForContactId:withModelName:withModelVersion:", v39, CFSTR("PSContactSuggester"), CFSTR("0"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v41, v39);

                }
                objc_msgSend(v21, "objectForKeyedSubscript:", v39);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "startDate");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactSuggester decayForReferenceDate:relativeTo:withTimeConstant:](self, "decayForReferenceDate:relativeTo:withTimeConstant:", v43, v80, v22);
                v45 = v44;
                objc_msgSend(v42, "priorScore");
                *(float *)&v47 = v45 + v46;
                objc_msgSend(v42, "setPriorScore:", v47);

              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
          }
          while (v36);
        }

        objc_autoreleasePoolPop(context);
        v23 = v79 + 1;
      }
      while (v79 + 1 != v75);
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    }
    while (v75);
  }

  objc_msgSend(v21, "keysSortedByValueUsingComparator:", &__block_literal_global_144);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v86;
    v52 = 1;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v86 != v51)
          objc_enumerationMutation(v48);
        v54 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "priorScore");
        v57 = v56;

        if (v57 != 0.0)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v54);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setRank:", v52);

          v52 = (v52 + 1);
        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
    }
    while (v50);
  }
  v59 = v72;
  if (objc_msgSend(v72, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v61 = v72;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v82;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v82 != v64)
            objc_enumerationMutation(v61);
          v66 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k);
          objc_msgSend(v21, "objectForKeyedSubscript:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v67)
          {
            -[_PSContactSuggester getDefaultContactPriorForContactId:withModelName:withModelVersion:](self, "getDefaultContactPriorForContactId:withModelName:withModelVersion:", v66, CFSTR("PSContactSuggester"), CFSTR("0"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v67, v66);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
      }
      while (v63);
    }

    v68 = (void *)objc_msgSend(v60, "copy");
    v59 = v72;
  }
  else
  {
    v68 = (void *)objc_msgSend(v21, "copy");
  }

  return v68;
}

- (void)computeAndSaveContactPriorArchive
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D15B00], "standardInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56___PSContactSuggester_computeAndSaveContactPriorArchive__block_invoke;
  v4[3] = &unk_1E43FEB68;
  v4[4] = self;
  objc_msgSend(v3, "performNoMoreOftenInSecondsThan:name:activityBlock:", CFSTR("com.apple.coreduetd.contactPriorGeneration"), v4, 21600.0);

}

- (id)computeContactPriorsForContactIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", &unk_1E442A688);
  objc_msgSend(v6, "addObject:", &unk_1E442A6A0);
  objc_msgSend(v6, "addObject:", &unk_1E442A6B8);
  objc_msgSend(v6, "addObject:", &unk_1E442A6D0);
  objc_msgSend(v6, "addObject:", &unk_1E442A6E8);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggester computeContactPriorsForContactIdentifiers:withTimeConstant:withInteractionMechanisms:asOf:overLookbackOf:](self, "computeContactPriorsForContactIdentifiers:withTimeConstant:withInteractionMechanisms:asOf:overLookbackOf:", v5, 43200, v6, v7, +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contactPriorsForContactIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  float v36;
  float v37;
  float v38;
  double v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  os_activity_scope_state_s state;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A07F4000, "Duet: _PSContactSuggester Prior Generation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  objc_msgSend(MEMORY[0x1E0D158F0], "interactionSignpost");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSContactPriorsForContactIdentifiers", " enableTelemetry=YES ", (uint8_t *)&state, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend((id)objc_opt_class(), "defaultCorrelationsSessionFileForContactPriors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:options:error:", v8, 1, &v54);
  v10 = v54;

  if (v10)
  {
    v11 = 0;
    v12 = 0;
LABEL_5:
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester contactPriorsForContactIdentifiers:].cold.1();

    if (objc_msgSend(v4, "count"))
      v14 = v4;
    else
      v14 = 0;
    -[_PSContactSuggester computeContactPriorsForContactIdentifiers:](self, "computeContactPriorsForContactIdentifiers:", v14);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v53);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v53;
  objc_msgSend(v16, "contactPriorDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "archiveDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || !v12)
    goto LABEL_5;
  v43 = v10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v51 = 0uLL;
    v52 = 0uLL;
    v49 = 0uLL;
    v50 = 0uLL;
    v18 = v4;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v19)
    {
      v20 = v19;
      v41 = v9;
      v42 = v4;
      v21 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v23, v41, v42);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "priorScore");
            v27 = v26;
            -[_PSContactSuggester decayForReferenceDate:relativeTo:withTimeConstant:](self, "decayForReferenceDate:relativeTo:withTimeConstant:", v12, v17, 43200.0);
            *(float *)&v29 = v27 * v28;
            -[_PSContactSuggester sigmoid:](self, "sigmoid:", v29);
            objc_msgSend(v25, "setPriorScore:");
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v25, v23);
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v20);
LABEL_32:
      v9 = v41;
      v4 = v42;
    }
  }
  else
  {
    v47 = 0uLL;
    v48 = 0uLL;
    v45 = 0uLL;
    v46 = 0uLL;
    objc_msgSend(v11, "allKeys");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v30)
    {
      v31 = v30;
      v41 = v9;
      v42 = v4;
      v32 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v18);
          v34 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v11, "objectForKeyedSubscript:", v34, v41, v42);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "priorScore");
          v37 = v36;
          -[_PSContactSuggester decayForReferenceDate:relativeTo:withTimeConstant:](self, "decayForReferenceDate:relativeTo:withTimeConstant:", v12, v17, 43200.0);
          *(float *)&v39 = v37 * v38;
          -[_PSContactSuggester sigmoid:](self, "sigmoid:", v39);
          objc_msgSend(v35, "setPriorScore:");
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v35, v34);

        }
        v31 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      }
      while (v31);
      goto LABEL_32;
    }
  }

  objc_msgSend(MEMORY[0x1E0D158F0], "interactionSignpost");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v40))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSContactPriorsForContactIdentifiers", (const char *)&unk_1A0908603, (uint8_t *)&state, 2u);
  }

  v10 = v43;
LABEL_11:

  return v44;
}

- (id)contactSuggestionsForPeopleWidgetWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4
{
  id v5;
  _PSContactSuggesterForPeopleWidget *v6;
  void *v7;

  v5 = a4;
  v6 = objc_alloc_init(_PSContactSuggesterForPeopleWidget);
  -[_PSContactSuggesterForPeopleWidget contactSuggestionsWithMaxSuggestions:excludeContactsWithIdentifiers:](v6, "contactSuggestionsWithMaxSuggestions:excludeContactsWithIdentifiers:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contactPriorSuggestionsForText:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t v34[128];
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v3 = (void *)getCKVocabularySearcherClass_softClass;
  v33 = getCKVocabularySearcherClass_softClass;
  if (!getCKVocabularySearcherClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCKVocabularySearcherClass_block_invoke;
    v36 = &unk_1E43FEA00;
    v37 = &v30;
    __getCKVocabularySearcherClass_block_invoke((uint64_t)buf);
    v3 = (void *)v31[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v30, 8);
  objc_msgSend(v4, "makeSearcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "matchSpansOfString:", v23);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v24;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "For text %@ found spans %@", buf, 0x16u);
  }

  v6 = v24;
  if (!v24)
  {
    v20 = 0;
    goto LABEL_28;
  }
  if (!objc_msgSend(v24, "count"))
  {
    v20 = 0;
    goto LABEL_27;
  }
  v25 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v24;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v8)
    goto LABEL_21;
  v9 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v11, "ontologyLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", CFSTR("personFullName")))
        goto LABEL_18;
      objc_msgSend(v11, "originAppId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v14 = (_QWORD *)getCKVAppIdContactsSymbolLoc_ptr;
      v33 = getCKVAppIdContactsSymbolLoc_ptr;
      if (!getCKVAppIdContactsSymbolLoc_ptr)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCKVAppIdContactsSymbolLoc_block_invoke;
        v36 = &unk_1E43FEA00;
        v37 = &v30;
        __getCKVAppIdContactsSymbolLoc_block_invoke((uint64_t)buf);
        v14 = (_QWORD *)v31[3];
      }
      _Block_object_dispose(&v30, 8);
      if (!v14)
      {
        -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
        __break(1u);
      }
      v15 = objc_msgSend(v13, "isEqual:", *v14);

      if (v15)
      {
        objc_msgSend(v11, "metadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "priorInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_opt_new();
        objc_msgSend(v11, "itemId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setContactIdentifier:", v18);

        objc_msgSend(v12, "score");
        objc_msgSend(v17, "setPriorScore:");
        objc_msgSend(v17, "setRank:", objc_msgSend(v12, "ordinality"));
        objc_msgSend(v25, "addObject:", v17);

LABEL_18:
        continue;
      }
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  }
  while (v8);
LABEL_21:

  if (objc_msgSend(v25, "count"))
  {
    v19 = v25;
    v20 = v25;
  }
  else
  {
    v20 = 0;
    v19 = v25;
  }

LABEL_27:
  v6 = v24;
LABEL_28:

  return v20;
}

- (float)sigmoid:(float)a3
{
  float v3;
  double v4;
  double v5;

  if (a3 >= 0.0)
  {
    v4 = exp((float)-a3);
    v5 = 1.0;
  }
  else
  {
    v3 = exp(a3);
    v4 = v3;
    v5 = v4;
  }
  return v5 / (v4 + 1.0);
}

+ (id)defaultCorrelationsSessionFileForContactPriors
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PeopleSuggester/contactpriors.archive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)writeArchive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultCorrelationsSessionFileForContactPriors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    if (!v6)
    {
      objc_msgSend(v4, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v12);
      v6 = v12;

      if (!v6)
      {
        v11 = 0;
        objc_msgSend(v5, "writeToFile:options:error:", v4, 1, &v11);
        v6 = v11;
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v6)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[_PSContactSuggester writeArchive:].cold.2();
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v15 = v4;
            _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Successfully persisted contact prior scores to file: %@", buf, 0xCu);
          }
          v6 = 0;
        }

      }
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggester writeArchive:].cold.1();
  }

}

- (float)decayForReferenceDate:(id)a3 relativeTo:(id)a4 withTimeConstant:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v7 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v11 = v10;

  return exp((v11 - v9) * -0.693147181 / a5);
}

- (id)getDefaultContactPriorForContactId:(id)a3 withModelName:(id)a4 withModelVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _PSContactPrior *v10;
  double v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_PSContactPrior);
  -[_PSContactPrior setContactIdentifier:](v10, "setContactIdentifier:", v9);

  LODWORD(v11) = 0;
  -[_PSContactPrior setPriorScore:](v10, "setPriorScore:", v11);
  -[_PSContactPrior setRank:](v10, "setRank:", 0xFFFFFFFFLL);
  -[_PSContactPrior setModelName:](v10, "setModelName:", v8);

  -[_PSContactPrior setModelVersion:](v10, "setModelVersion:", v7);
  return v10;
}

- (id)contactKeysToFetch
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  getCNContactIdentifierKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = (id *)getCNContactRelationsKeySymbolLoc_ptr;
  v24 = getCNContactRelationsKeySymbolLoc_ptr;
  if (!getCNContactRelationsKeySymbolLoc_ptr)
  {
    v4 = (void *)ContactsLibrary();
    v3 = (id *)dlsym(v4, "CNContactRelationsKey");
    v22[3] = (uint64_t)v3;
    getCNContactRelationsKeySymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
    goto LABEL_14;
  v5 = *v3;
  v25[1] = v5;
  getCNContactGivenNameKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v7 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr;
  v24 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    v8 = (void *)ContactsLibrary();
    v7 = (id *)dlsym(v8, "CNContactMiddleNameKey");
    v22[3] = (uint64_t)v7;
    getCNContactMiddleNameKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v21, 8);
  if (!v7)
    goto LABEL_14;
  v9 = *v7;
  v25[3] = v9;
  getCNContactFamilyNameKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v10;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v11 = (id *)getCNContactNicknameKeySymbolLoc_ptr;
  v24 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    v12 = (void *)ContactsLibrary();
    v11 = (id *)dlsym(v12, "CNContactNicknameKey");
    v22[3] = (uint64_t)v11;
    getCNContactNicknameKeySymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v21, 8);
  if (!v11)
    goto LABEL_14;
  v13 = *v11;
  v25[5] = v13;
  getCNContactPhoneNumbersKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v14;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v15 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr;
  v24 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    v16 = (void *)ContactsLibrary();
    v15 = (id *)dlsym(v16, "CNContactEmailAddressesKey");
    v22[3] = (uint64_t)v15;
    getCNContactEmailAddressesKeySymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v21, 8);
  if (!v15)
  {
LABEL_14:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v26 = *v15;
  v17 = (void *)MEMORY[0x1E0C99D20];
  v18 = v26;
  objc_msgSend(v17, "arrayWithObjects:count:", v25, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to resolve \"Me\" contact id in _PSContactSuggester", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)contactSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error fetching me contact from store in _PSContactSuggester: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)gameCenterSuggestionConsumedWithContactHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Nil handle passed to Game Center Feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)gameCenterSuggestionConsumedWithGroupIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Nil groupIdentifier passed to Game Center Feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)contactPriorsForContactIdentifiers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Persisted file corrupt, or does not exist. Using on-demand compute instead: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeArchive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Empty archive or filePath when trying to persist contact priors", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeArchive:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error when trying to persist contact prior scores: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
