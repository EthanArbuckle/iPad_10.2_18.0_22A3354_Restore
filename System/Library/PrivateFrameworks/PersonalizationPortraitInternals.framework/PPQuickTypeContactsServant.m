@implementation PPQuickTypeContactsServant

- (PPQuickTypeContactsServant)init
{
  return -[PPQuickTypeContactsServant initWithOptions:](self, "initWithOptions:", 0);
}

- (PPQuickTypeContactsServant)initWithOptions:(unsigned __int8)a3
{
  PPQuickTypeContactsServant *v4;
  NSObject *v5;
  uint64_t v6;
  PPLocalContactStore *localContactStore;
  uint64_t v8;
  NSCache *meQuickTypeItemCache;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSCache *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSCache *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSCache *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  uint64_t v55;
  objc_super v56;
  id from;
  id location;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  uint8_t buf[8];
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  id v67[6];

  v67[4] = *(id *)MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)PPQuickTypeContactsServant;
  v4 = -[PPQuickTypeContactsServant init](&v56, sel_init);
  if (v4)
  {
    pp_quicktype_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPQuickTypeContactsServant initializing", buf, 2u);
    }

    +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
    v6 = objc_claimAutoreleasedReturnValue();
    localContactStore = v4->_localContactStore;
    v4->_localContactStore = (PPLocalContactStore *)v6;

    v8 = objc_opt_new();
    meQuickTypeItemCache = v4->_meQuickTypeItemCache;
    v4->_meQuickTypeItemCache = (NSCache *)v8;

    -[NSCache setCountLimit:](v4->_meQuickTypeItemCache, "setCountLimit:", 6);
    if ((a3 & 1) == 0)
    {
      location = 0;
      objc_initWeak(&location, v4->_cachedNameLookups);
      from = 0;
      objc_initWeak(&from, v4->_meQuickTypeItemCache);
      v10 = (void *)MEMORY[0x1E0D70BF0];
      v11 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v64 = 3221225472;
      v65 = __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke;
      v66 = &unk_1E7E1FCC0;
      objc_copyWeak(v67, &from);
      objc_msgSend(v10, "addMeCardObserverForLifetimeOfObject:block:", v4, buf);
      v12 = (void *)MEMORY[0x1E0D70BF0];
      v61[0] = v11;
      v61[1] = 3221225472;
      v61[2] = __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_14;
      v61[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v62, &location);
      objc_msgSend(v12, "addContactsObserverForLifetimeOfObject:block:", v4, v61);
      v13 = (void *)MEMORY[0x1E0D70BF0];
      v59[0] = v11;
      v59[1] = 3221225472;
      v59[2] = __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_15;
      v59[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v60, &location);
      objc_msgSend(v13, "addSuggestionsObserverForLifetimeOfObject:block:", v4, v59);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&v62);
      objc_destroyWeak(v67);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      v14 = (void *)objc_opt_new();
      v15 = v14;
      objc_storeStrong((id *)&v4->_cachedNameLookups, v14);

      v16 = +[PPLabelMatcher sharedInstance](PPLabelMatcher, "sharedInstance");
      v17 = (void *)MEMORY[0x1E0D70C20];
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "quickTypeQueryWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 0, 0, 0, 0, 0, 0, 0, 0, 0, v19, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (id)objc_msgSend(v21, "makeBirthdayFormatter");
      if (-[PPLocalContactStore chineseBirthdayFound](v4->_localContactStore, "chineseBirthdayFound"))
      {
        v23 = (id)objc_msgSend(v21, "makeChineseBirthdayFormatter");
        v24 = (id)objc_msgSend(v21, "makeYearlessChineseBirthdayFormatter");
      }
      v25 = *MEMORY[0x1E0C97070];
      *(_QWORD *)buf = *MEMORY[0x1E0C96FF8];
      v64 = v25;
      v26 = (void *)*MEMORY[0x1E0C96FF0];
      v65 = (void (*)(uint64_t))*MEMORY[0x1E0C97000];
      v66 = v26;
      v27 = (void *)*MEMORY[0x1E0C97058];
      v67[0] = *(id *)MEMORY[0x1E0C97020];
      v67[1] = v27;
      v67[2] = *(id *)MEMORY[0x1E0C97028];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v21, "formattedStringsForLabels:", v28);

      -[PPLocalContactStore meCard](v4->_localContactStore, "meCard");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        -[PPQuickTypeContactsServant _scoredMeContactWithMeContact:]((uint64_t)v4, v30);
        v55 = objc_claimAutoreleasedReturnValue();
        pp_quicktype_log_handle();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v55)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEFAULT, "Precalculating basic Me card predictions", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localeIdentifier");
          v32 = objc_claimAutoreleasedReturnValue();

          -[NSCache removeAllObjects](v4->_meQuickTypeItemCache, "removeAllObjects");
          objc_msgSend(MEMORY[0x1E0D70C20], "quickTypeQueryWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 1, 0, 1, 0, 0, 0, 0, 0, v32, 0, 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v4->_meQuickTypeItemCache;
          *(_QWORD *)buf = v55;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v54);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          PPQuickTypeItemsForContacts(v35, 0, 1u, v36, 0x14uLL, 1, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v54);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](v34, "setObject:forKey:", v37, v38);

          objc_msgSend(MEMORY[0x1E0D70C20], "quickTypeQueryWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 1, 0, 2, 0, 0, 0, 0, 0, v32, 0, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v4->_meQuickTypeItemCache;
          v61[0] = v55;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v53);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          PPQuickTypeItemsForContacts(v40, 0, 2u, v41, 0x14uLL, 1, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v53);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](v39, "setObject:forKey:", v42, v43);

          objc_msgSend(MEMORY[0x1E0D70C20], "quickTypeQueryWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 1, 0, 4, 0, 0, 0, 0, 0, v32, 0, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v4->_meQuickTypeItemCache;
          v59[0] = v55;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          PPQuickTypeItemsForContacts(v46, 0, 4u, v47, 0x14uLL, 1, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v44);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](v45, "setObject:forKey:", v48, v49);

        }
        else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C392E000, v32, OS_LOG_TYPE_ERROR, "failed to score me card so cannot preload me card item cache", buf, 2u);
        }

        v50 = v55;
      }
      else
      {
        pp_quicktype_log_handle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v50, OS_LOG_TYPE_DEFAULT, "No me card available during preloading in Contacts servant", buf, 2u);
        }
      }

    }
    pp_quicktype_log_handle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v51, OS_LOG_TYPE_INFO, "PPQuickTypeContactsServant initialization complete", buf, 2u);
    }

  }
  return v4;
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  int v16;
  id v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  int v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  PPLocalContactStore *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  _BOOL4 v53;
  id *v54;
  dispatch_semaphore_t v55;
  void *v56;
  PPLocalContactStore *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t j;
  void *v75;
  void *v76;
  int v77;
  double v78;
  NSObject *v79;
  void *v80;
  id v81;
  void *v82;
  NSObject *v83;
  _BOOL4 v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  unsigned int v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  NSObject *v100;
  PPLocalContactStore *localContactStore;
  void *v102;
  id v103;
  void *v104;
  unsigned int v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  unsigned int v115;
  void *v116;
  NSObject *v117;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  unint64_t v123;
  id v124;
  uint64_t v125;
  id obj;
  void *v127;
  id v128;
  uint64_t v129;
  id v130;
  PPQuickTypeContactsServant *v131;
  PPQuickTypeContactsServant *v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t v142[16];
  _BYTE buf[12];
  __int16 v144;
  void *v145;
  uint8_t v146[32];
  __int128 v147;
  __int128 v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[PPQuickTypeContactsServant _isSemanticTagEligible:]((uint64_t)self, objc_msgSend(v8, "semanticTag"));
  if (objc_msgSend(v8, "type") != 1 && !v10)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_132;
  }
  pp_quicktype_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "prediction request to PPQuickTypeContactsServant-quickTypeItemsForQuery", buf, 2u);
  }

  if ((objc_msgSend(v8, "fields") & 0x200000) == 0
    && !+[PPQuickTypeSettings servantShouldRespondToQuery:](PPQuickTypeSettings, "servantShouldRespondToQuery:", self))
  {
    pp_quicktype_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "ignoring prediction request for Contacts due to settings", buf, 2u);
    }

    objc_msgSend(v9, "push:", 47);
    v22 = 0;
    v23 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_133;
  }
  v13 = v8;
  v128 = v9;
  v122 = v9;
  if (!self)
  {
    v11 = 0;
    goto LABEL_131;
  }
  v120 = v13;
  v14 = v13;
  v121 = v8;
  v123 = a4;
  if (objc_msgSend(v14, "subtype") == 1)
  {

    goto LABEL_12;
  }
  v15 = -[PPQuickTypeContactsServant _isSemanticTagEligible:]((uint64_t)self, objc_msgSend(v14, "semanticTag"));

  if (v15)
  {
LABEL_12:
    v16 = objc_msgSend(v14, "subtype", v120);
    v17 = v14;
    v18 = v17;
    if (v16 != 1)
    {
      v19 = objc_msgSend(v17, "semanticTag") - 1;
      if (v19 > 0x10)
        v20 = 0;
      else
        v20 = dword_1C3AE52A4[v19];
      v80 = (void *)objc_msgSend(v18, "copy");

      objc_msgSend(v80, "setType:", 1);
      objc_msgSend(v80, "setSubtype:", 1);
      objc_msgSend(v80, "setFields:", v20);
      v18 = v80;
    }
    v66 = v18;
    v81 = v128;
    -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v66);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_meQuickTypeItemCache, "objectForKey:", v82);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    pp_quicktype_log_handle();
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v84)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v83, OS_LOG_TYPE_DEBUG, "Me card prediction cache HIT", buf, 2u);
      }
    }
    else
    {
      if (v84)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v83, OS_LOG_TYPE_DEBUG, "Me card prediction cache MISS", buf, 2u);
      }

      -[PPLocalContactStore meCard](self->_localContactStore, "meCard");
      v85 = objc_claimAutoreleasedReturnValue();
      if (!v85)
      {
        pp_quicktype_log_handle();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v100, OS_LOG_TYPE_DEFAULT, "No Me card available to make Me prediction", buf, 2u);
        }

        objc_msgSend(v81, "push:", 9);
        v11 = 0;
        goto LABEL_116;
      }
      v83 = v85;
      -[PPQuickTypeContactsServant _scoredMeContactWithMeContact:]((uint64_t)self, v85);
      v132 = self;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v138 = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "label");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v66, "fields");
      +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v66);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      PPQuickTypeItemsForContacts(v87, v88, v89, v90, 0x14uLL, 1, v81);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSCache setObject:forKey:](v132->_meQuickTypeItemCache, "setObject:forKey:", v11, v82);
    }

    if (v10 && (objc_msgSend(v66, "fields") & 4) != 0 && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v91 = (void *)objc_opt_new();
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      v137 = 0u;
      v92 = v11;
      v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, buf, 16);
      if (v93)
      {
        v94 = v93;
        v95 = *(_QWORD *)v135;
        do
        {
          for (i = 0; i != v94; ++i)
          {
            if (*(_QWORD *)v135 != v95)
              objc_enumerationMutation(v92);
            v97 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
            if ((objc_msgSend(v97, "fields") & 4) != 0)
              objc_msgSend(v91, "addObject:", v97);
          }
          v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, buf, 16);
        }
        while (v94);
      }

      v11 = (void *)objc_msgSend(v91, "copy");
    }
    if (objc_msgSend(v11, "count") > v123)
    {
      pp_quicktype_log_handle();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
      {
        v119 = objc_msgSend(v11, "count");
        *(_DWORD *)v146 = 134218240;
        *(_QWORD *)&v146[4] = v119;
        *(_WORD *)&v146[12] = 2048;
        *(_QWORD *)&v146[14] = v123;
        _os_log_debug_impl(&dword_1C392E000, v98, OS_LOG_TYPE_DEBUG, "Trimming down Me card prediction result from %lu to %lu", v146, 0x16u);
      }

      objc_msgSend(v11, "subarrayWithRange:", 0, v123);
      v99 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v99;
    }
LABEL_116:

    goto LABEL_130;
  }
  objc_msgSend(v14, "people");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    v66 = (id)objc_opt_new();
    localContactStore = self->_localContactStore;
    *(_QWORD *)&v134 = 0;
    -[PPLocalContactStore rankedContactsWithQuery:error:](localContactStore, "rankedContactsWithQuery:error:", v66, &v134);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (id)v134;
    if (v102)
    {
      objc_msgSend(v14, "label");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v14, "fields");
      +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v14);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      PPQuickTypeItemsForContacts(v102, v104, v105, v106, v123, 0, v128);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      pp_quicktype_log_handle();
      v117 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v103;
        _os_log_error_impl(&dword_1C392E000, v117, OS_LOG_TYPE_ERROR, "_predictionForPeopleQuery call to rankedContactsWithQuery with empty query returned nil and error = %@", buf, 0xCu);
      }

      objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }

    goto LABEL_129;
  }
  v127 = (void *)objc_opt_new();
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v26 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v14, "people");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithArray:", v27);

  obj = v28;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v138, &v134, 16);
  v124 = v14;
  if (!v29)
    goto LABEL_72;
  v30 = v29;
  v129 = *(_QWORD *)v139;
  v131 = self;
  do
  {
    v31 = 0;
    v125 = v30;
    do
    {
      if (*(_QWORD *)v139 != v129)
        objc_enumerationMutation(obj);
      v32 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v31);
      if (objc_msgSend(v32, "length", v120))
      {
        v33 = objc_msgSend(v14, "fields");
        if (!v33)
        {
          pp_quicktype_log_handle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v34, OS_LOG_TYPE_DEFAULT, "query.fields is PPQuickTypeFieldNone. Setting justPreloadCache to YES.", buf, 2u);
          }

        }
        v35 = objc_msgSend(v14, "subtype");
        objc_msgSend(v14, "timeoutSeconds");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v32;
        v38 = v128;
        v39 = v36;
        pp_quicktype_log_handle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v40, OS_LOG_TYPE_DEBUG, "PPQuickTypeContactsServant: lookupScoredPeopleWithNamePrefix", buf, 2u);
        }

        v133 = v38;
        if (v35 != 12)
        {
          v41 = (id)objc_opt_new();
          objc_msgSend(v41, "setOnlyQueryMostRelevantContacts:", 1);
          objc_msgSend(v41, "setMatchingName:", v37);
          v42 = self->_localContactStore;
          *(_QWORD *)v146 = 0;
          -[PPLocalContactStore rankedContactsWithQuery:error:](v42, "rankedContactsWithQuery:error:", v41, v146);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = *(id *)v146;
          if (v43)
          {
            if (!v33)
              goto LABEL_42;
LABEL_38:
            if (!objc_msgSend(v43, "count"))
              goto LABEL_42;
            pp_quicktype_log_handle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v47 = objc_msgSend(v43, "count");
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v47;
              _os_log_impl(&dword_1C392E000, v46, OS_LOG_TYPE_DEFAULT, "found and using %tu matches in most relevant contacts", buf, 0xCu);
            }

LABEL_66:
            objc_msgSend(v127, "addObjectsFromArray:", v43);

            self = v131;
            goto LABEL_67;
          }
          pp_quicktype_log_handle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v44;
            _os_log_error_impl(&dword_1C392E000, v45, OS_LOG_TYPE_ERROR, "error during most relevant contact lookup: %@", buf, 0xCu);
          }

          if (v33)
            goto LABEL_38;
LABEL_42:

          self = v131;
          v38 = v133;
        }
        v130 = v37;
        v48 = v37;
        v49 = v38;
        v50 = v39;
        -[NSCache objectForKey:](self->_cachedNameLookups, "objectForKey:", v48);
        v51 = objc_claimAutoreleasedReturnValue();
        pp_quicktype_log_handle();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
        if (v51)
        {
          if (v53)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v48;
            _os_log_debug_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEBUG, "cache HIT for name prefix: %@", buf, 0xCu);
          }

          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v51 + 8), 0xFFFFFFFFFFFFFFFFLL);
          v41 = *(id *)(v51 + 16);
          if (!objc_msgSend(v41, "count"))
            objc_msgSend(v49, "push:", 13);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v51 + 8));
        }
        else
        {
          if (v53)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v48;
            _os_log_debug_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEBUG, "cache MISS for name prefix: %@", buf, 0xCu);
          }

          v54 = (id *)objc_opt_new();
          v55 = dispatch_semaphore_create(0);
          if (v54)
            objc_storeStrong(v54 + 1, v55);

          -[NSCache setObject:forKey:](v131->_cachedNameLookups, "setObject:forKey:", v54, v48);
          v56 = (void *)objc_opt_new();
          objc_msgSend(v56, "setMatchingName:", v48);
          v57 = v131->_localContactStore;
          *(_QWORD *)buf = 0;
          if (v33)
            -[PPLocalContactStore contactsWithQuery:explanationSet:timeoutSeconds:error:](v57, "contactsWithQuery:explanationSet:timeoutSeconds:error:", v56, v49, v50, buf);
          else
            -[PPLocalContactStore contactsWithQuery:error:](v57, "contactsWithQuery:error:", v56, buf);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = *(id *)buf;
          if (v54)
          {
            objc_storeStrong(v54 + 2, v58);

            dispatch_semaphore_signal((dispatch_semaphore_t)v54[1]);
            v60 = v54[2];
          }
          else
          {

            dispatch_semaphore_signal(0);
            v60 = 0;
          }
          if (!objc_msgSend(v60, "count"))
            objc_msgSend(v49, "push:", 13);
          if (v54)
            v61 = v54[2];
          else
            v61 = 0;
          v41 = v61;

          self = v131;
        }

        -[PPLocalContactStore scoredContactsWithContacts:](self->_localContactStore, "scoredContactsWithContacts:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        pp_quicktype_log_handle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v62 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v62;
          v144 = 2112;
          v145 = v43;
          _os_log_debug_impl(&dword_1C392E000, v44, OS_LOG_TYPE_DEBUG, "Scored %tu name matches: %@", buf, 0x16u);
        }
        v14 = v124;
        v30 = v125;
        v37 = v130;
        goto LABEL_66;
      }
LABEL_67:
      ++v31;
    }
    while (v30 != v31);
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, &v134, 16);
    v30 = v63;
  }
  while (v63);
LABEL_72:

  v64 = v127;
  v65 = v128;
  memset(v146, 0, sizeof(v146));
  v147 = 0u;
  v148 = 0u;
  v66 = v64;
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v146, buf, 16);
  v68 = v66;
  v69 = v66;
  if (!v67)
    goto LABEL_123;
  v70 = v67;
  v71 = 0;
  v72 = **(_QWORD **)&v146[16];
  v73 = -1.0;
  while (2)
  {
    for (j = 0; j != v70; ++j)
    {
      if (**(_QWORD **)&v146[16] != v72)
        objc_enumerationMutation(v66);
      v75 = *(void **)(*(_QWORD *)&v146[8] + 8 * j);
      objc_msgSend(v75, "contact", v120);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "source");

      if (v77 == 1)
      {
        ++v71;
        objc_msgSend(v75, "score");
        if (v73 == -1.0)
        {
          v73 = v78;
        }
        else if (vabdd_f64(v73, v78) > 0.0001)
        {

          objc_msgSend(v66, "sortedArrayUsingComparator:", &__block_literal_global_21166);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "score");
          v109 = v108;
          objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "score");
          v112 = v111 + v111;

          if (v109 <= v112)
          {
            v69 = v66;
          }
          else
          {
            objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v142 = v113;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 1);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v14 = v124;
          goto LABEL_123;
        }
      }
    }
    v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v146, buf, 16);
    if (v70)
      continue;
    break;
  }

  v69 = v66;
  v14 = v124;
  if (v71 > 2 * v123)
  {
    pp_quicktype_log_handle();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v142 = 0;
      _os_log_debug_impl(&dword_1C392E000, v79, OS_LOG_TYPE_DEBUG, "too many ambiguous matches, not returning anything", v142, 2u);
    }

    objc_msgSend(v65, "push:", 14);
    v69 = (void *)objc_opt_new();
    v68 = v66;
LABEL_123:

  }
  v103 = v69;

  objc_msgSend(v14, "label");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v14, "fields");
  +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v14);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  PPQuickTypeItemsForContacts(v103, v114, v115, v116, v123, 0, v65);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_129:
LABEL_130:

  v13 = v120;
  v8 = v121;
LABEL_131:

  v9 = v122;
LABEL_132:
  v22 = v11;
  v23 = v22;
LABEL_133:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNameLookups, 0);
  objc_storeStrong((id *)&self->_meQuickTypeItemCache, 0);
  objc_storeStrong((id *)&self->_localContactStore, 0);
}

- (uint64_t)_isSemanticTagEligible:(uint64_t)result
{
  id v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    objc_opt_self();
    if (_supportedPeopleSemanticTypes_onceToken != -1)
      dispatch_once(&_supportedPeopleSemanticTypes_onceToken, &__block_literal_global_25_21185);
    v3 = (id)_supportedPeopleSemanticTypes_supportedPeopleSemanticTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v4);

    return v5;
  }
  return result;
}

uint64_t __89__PPQuickTypeContactsServant__applySmartLimitingToCandidates_clientLimit_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  v9 = v8;

  return objc_msgSend(v4, "compareDouble:withDouble:", v7, v9);
}

- (id)_mePredictionCacheKeyForQuery:(void *)a1
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (objc_class *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = [v1 alloc];
  v4 = objc_msgSend(v2, "fields");
  objc_msgSend(v2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%lu:%@:%@"), v4, v5, v6);
  return v7;
}

- (id)_scoredMeContactWithMeContact:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 8);
  v9 = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scoredContactsWithContacts:", v5, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __59__PPQuickTypeContactsServant__supportedPeopleSemanticTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E5A5D8, &unk_1E7E5A5F0, &unk_1E7E5A608, &unk_1E7E5A620, &unk_1E7E5A638, &unk_1E7E5A650, &unk_1E7E5A668, &unk_1E7E5A680, &unk_1E7E5A698, &unk_1E7E5A6B0, &unk_1E7E5A6C8, 0);
  objc_autoreleasePoolPop(v0);
  v2 = (void *)_supportedPeopleSemanticTypes_supportedPeopleSemanticTypes;
  _supportedPeopleSemanticTypes_supportedPeopleSemanticTypes = v1;

}

void __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "clearing Me card cache due to Me Card change", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeAllObjects");

}

void __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "clearing PQT name lookup cache due to Contacts change", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeAllObjects");

}

void __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Notification: FoD contacts did change", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeAllObjects");

}

- (void)clearCaches
{
  -[NSCache removeAllObjects](self->_cachedNameLookups, "removeAllObjects");
}

@end
