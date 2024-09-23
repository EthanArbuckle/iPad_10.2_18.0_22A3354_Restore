@implementation _PSMessagesPinningSuggester

- (id)chatGuidsForPinningHeuristicApproachWithMaxSuggestions:(int64_t)a3 forReferenceDate:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[_PSMessagesPinningSuggester chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:referenceDate:minimumDaysOfHistory:maxInteractionsForQuery:](self, "chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:referenceDate:minimumDaysOfHistory:maxInteractionsForQuery:", a3, v6, +[_PSPrivacyDataRetentionPeriod numberOfDaysInMonth](_PSPrivacyDataRetentionPeriod, "numberOfDaysInMonth"), 2500);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_psMessagesPinningConfig, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)chatGuidsForMessagesPinningWithMaxSuggestions:(int64_t)a3
{
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77___PSMessagesPinningSuggester_chatGuidsForMessagesPinningWithMaxSuggestions___block_invoke_112;
    v12[3] = &unk_1E43FEC50;
    v12[4] = &v13;
    objc_msgSend(v6, "rankedMessagesPinsWithMaxSuggestions:reply:", v7, v12);

    if (objc_msgSend((id)v14[5], "count"))
      v8 = (void *)v14[5];
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSMessagesPinningSuggester chatGuidsForPinningHeuristicApproachWithMaxSuggestions:forReferenceDate:](self, "chatGuidsForPinningHeuristicApproachWithMaxSuggestions:forReferenceDate:", a3, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (_PSMessagesPinningSuggester)initWithRegularityThreshold:(double)a3 intensityThreshold:(double)a4 regularityWeight:(double)a5 intensityWeight:(double)a6 minimalInteration:(int64_t)a7 minimalUniqueDaysInteracted:(int64_t)a8 interactionStore:(id)a9 lookbackWindow:(double)a10 outgoingOnly:(BOOL)a11
{
  id v21;
  _PSMessagesPinningSuggester *v22;
  _PSMessagesPinningSuggester *v23;
  id v24;
  uint64_t v25;
  NSXPCConnection *connection;
  void *v27;
  objc_super v29;

  v21 = a9;
  v29.receiver = self;
  v29.super_class = (Class)_PSMessagesPinningSuggester;
  v22 = -[_PSMessagesPinningSuggester init](&v29, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_regularityThreshold = a3;
    v22->_intensityThreshold = a4;
    v22->_regularityWeight = a5;
    v22->_intensityWeight = a6;
    v22->_minimalInteractions = a7;
    v22->_minimalUniqueDaysInteracted = a8;
    if (v21)
      objc_storeStrong((id *)&v22->_interactionStore, a9);
    v23->_lookbackWindow = a10;
    v23->_outgoingOnly = a11;
    v23->_lock._os_unfair_lock_opaque = 0;
    v24 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v25 = objc_msgSend(v24, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = v23->_connection;
    v23->_connection = (NSXPCConnection *)v25;

    _CDInteractionNSXPCInterface();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v23->_connection, "setRemoteObjectInterface:", v27);

    -[NSXPCConnection resume](v23->_connection, "resume");
    -[_PSMessagesPinningSuggester loadPSConfig](v23, "loadPSConfig");
  }

  return v23;
}

- (id)chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:(int64_t)a3 referenceDate:(id)a4 minimumDaysOfHistory:(int64_t)a5 maxInteractionsForQuery:(int64_t)a6
{
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  double v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  void *v76;
  void *v77;
  BOOL v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  uint64_t k;
  uint64_t v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  char v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  uint64_t m;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  unint64_t v133;
  int64_t v134;
  void *v135;
  void *v136;
  unint64_t v137;
  void *v138;
  void *v139;
  unint64_t v140;
  void *v141;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  NSObject *v149;
  unint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *context;
  void *v155;
  void *v156;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  _PSMessagesPinningSuggester *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  NSObject *obj;
  void *v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  id v190;
  id v191;
  _BYTE v192[128];
  _QWORD v193[2];
  _BYTE v194[128];
  _BYTE v195[128];
  uint8_t v196[128];
  uint8_t buf[4];
  id v198;
  uint64_t v199;
  _QWORD v200[2];
  _QWORD v201[2];
  _QWORD v202[2];
  _QWORD v203[4];

  v203[2] = *MEMORY[0x1E0C80C00];
  v148 = a4;
  if (objc_msgSend(MEMORY[0x1E0D15898], "isRunningOnInternalBuild"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PeopleSuggester.MessagesPinning"));
    if (objc_msgSend(v9, "integerForKey:", CFSTR("TestModeEnabled")) == 1)
    {
      -[_PSMessagesPinningSuggester setMinimalInteractions:](self, "setMinimalInteractions:", 0);
      -[_PSMessagesPinningSuggester setMinimalUniqueDaysInteracted:](self, "setMinimalUniqueDaysInteracted:", 0);
      a5 = 0;
    }

  }
  v163 = self;
  v10 = -[_PSMessagesPinningSuggester outgoingOnly](self, "outgoingOnly");
  v11 = (void *)MEMORY[0x1E0CB3880];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    v203[0] = v12;
    +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v203[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("(bundleId IN %@) AND (mechanism == %@) AND (direction IN %@)"), v15, &unk_1E442AB98, &unk_1E442C850);
  }
  else
  {
    v202[0] = v12;
    +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v202[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("(bundleId IN %@) AND (mechanism == %@)"), v15, &unk_1E442AB98, v143);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a5));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("startDate < %@"), v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3528];
  v201[0] = v16;
  v201[1] = v19;
  v151 = (void *)v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  -[_PSMessagesPinningSuggester interactionStore](v163, "interactionStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = 0;
  v146 = (void *)v22;
  objc_msgSend(v23, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v22, 0, 1, &v191);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v191;

  v147 = v25;
  if (v25)
  {
    +[_PSLogging messagePinningChannel](_PSLogging, "messagePinningChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_PSMessagesPinningSuggester chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:referenceDate:minimumDaysOfHistory:maxInteractionsForQuery:].cold.1();
LABEL_11:
    v27 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_141;
  }
  if (!objc_msgSend(v24, "count"))
  {
    +[_PSLogging messagePinningChannel](_PSLogging, "messagePinningChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v26, OS_LOG_TYPE_DEFAULT, "Minimum Days of History Check Failed", buf, 2u);
    }
    goto LABEL_11;
  }
  -[_PSMessagesPinningSuggester lookbackWindow](v163, "lookbackWindow");
  objc_msgSend(v148, "dateByAddingTimeInterval:", -v28);
  v149 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate >= %@"), v149);
  v29 = objc_claimAutoreleasedReturnValue();

  v162 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v167 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v160 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactResolver handlesForContactFavorites](_PSContactResolver, "handlesForContactFavorites");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = MEMORY[0x1E0C9AA60];
  v150 = a6;
  v151 = (void *)v29;
  v145 = v16;
  v170 = v31;
  v159 = v32;
  v164 = v30;
  while (2)
  {
    v33 = v24;
    context = (void *)MEMORY[0x1A1AFCA24]();
    v34 = (void *)MEMORY[0x1E0CB3528];
    v200[0] = v16;
    v200[1] = v151;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "andPredicateWithSubpredicates:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v37 = objc_claimAutoreleasedReturnValue();
    -[_PSMessagesPinningSuggester interactionStore](v163, "interactionStore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = (void *)v37;
    v199 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v199, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = 0;
    v153 = (void *)v36;
    objc_msgSend(v38, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v36, v39, a6, &v190);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v190;

    v155 = v41;
    v156 = v40;
    if (v41)
    {
      +[_PSLogging messagePinningChannel](_PSLogging, "messagePinningChannel");
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v198 = v41;
        _os_log_error_impl(&dword_1A07F4000, obj, OS_LOG_TYPE_ERROR, "Error while querying interation store %@", buf, 0xCu);
      }
      v24 = v40;
      v42 = v164;
LABEL_18:
      v43 = v160;
      goto LABEL_77;
    }
    objc_msgSend(v40, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "startDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceDate:](v149, "timeIntervalSinceDate:", v45);
    if (v46 < 0.0)
    {
      v47 = objc_msgSend(v40, "count");

      if (v47 != v150)
      {
        v16 = v145;
        v42 = v164;
        goto LABEL_24;
      }
      v48 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v40, "lastObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "startDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "predicateWithFormat:", CFSTR("((startDate >= %@) AND (startDate < %@))"), v149, v45);
      v49 = objc_claimAutoreleasedReturnValue();

      v151 = (void *)v49;
      v16 = v145;
    }
    v42 = v164;

LABEL_24:
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v24 = v156;
    obj = v156;
    v173 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v186, v196, 16);
    if (!v173)
      goto LABEL_18;
    v172 = *(_QWORD *)v187;
    do
    {
      for (i = 0; i != v173; ++i)
      {
        if (*(_QWORD *)v187 != v172)
          objc_enumerationMutation(obj);
        v51 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * i);
        v52 = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v51, "domainIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsSeparatedByString:", CFSTR(";"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "lastObject");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
          v56 = v55 == 0;
        else
          v56 = 1;
        if (v56)
          goto LABEL_74;
        objc_msgSend(v51, "recipients");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "count") != 1 || !objc_msgSend(v51, "direction"))
          goto LABEL_45;
        objc_msgSend(v51, "recipients");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "firstObject");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "personId");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(v51, "recipients");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "firstObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "identifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "recipients");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "firstObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "personId");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v159, "objectForKeyedSubscript:", v57);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend(v159, "objectForKeyedSubscript:", v57);
            v67 = objc_claimAutoreleasedReturnValue();

            v65 = (void *)v67;
          }
          else
          {
            objc_msgSend(v159, "setObject:forKeyedSubscript:", v65, v57);
          }
          objc_msgSend(v160, "objectForKeyedSubscript:", v65);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if (v68)
          {
            objc_msgSend(v160, "objectForKeyedSubscript:", v65);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v69, "componentsSeparatedByString:", CFSTR(";"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "lastObject");
            v71 = objc_claimAutoreleasedReturnValue();

            v55 = (void *)v71;
            v53 = v69;
          }
          else
          {
            objc_msgSend(v160, "setObject:forKeyedSubscript:", v53, v65);
          }
          if (objc_msgSend(v158, "containsObject:", v57))
            objc_msgSend(v161, "addObject:", v53);

LABEL_45:
        }
        if (objc_msgSend(v51, "direction") == 1 || objc_msgSend(v51, "direction") == 3)
        {
          objc_msgSend(v51, "recipients");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v171, "count") == 1)
          {
            objc_msgSend(v51, "recipients");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "firstObject");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "personId");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v165 = v73;
            v166 = v72;
            if (!v168)
            {

              v168 = 0;
              v31 = v170;
              v81 = v171;
              goto LABEL_73;
            }
            v74 = 1;
          }
          else
          {
            v74 = 0;
          }
          v75 = 1;
        }
        else
        {
          v74 = 0;
          v75 = 0;
        }
        objc_msgSend(v51, "sender");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "personId");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
          v78 = 0;
        else
          v78 = objc_msgSend(v51, "direction") == 0;

        if (v74)
        {

          v31 = v170;
          if ((v75 & 1) != 0)
            goto LABEL_62;
          goto LABEL_59;
        }
        v31 = v170;
        if (v75)
        {
LABEL_62:

          if (v78)
            goto LABEL_74;
LABEL_63:
          objc_msgSend(v167, "objectForKey:", v55);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v79)
            objc_msgSend(v167, "setObject:forKey:", v53, v55);
          objc_msgSend(v51, "startDate");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSMessagesPinningUtilities startOfDayForDate:](_PSMessagesPinningUtilities, "startOfDayForDate:", v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v164, "objectForKey:", v55);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          if (v82)
          {
            objc_msgSend(v164, "objectForKey:", v55);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v83, "intValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v84 + 1));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "setObject:forKey:", v85, v55);

          }
          else
          {
            objc_msgSend(v164, "setObject:forKey:", &unk_1E442ABE0, v55);
          }
          objc_msgSend(v31, "objectForKey:", v55);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (v86)
          {
            objc_msgSend(v31, "objectForKey:", v55);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "addObject:", v81);
          }
          else
          {
            v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v81, 0);
            objc_msgSend(v31, "setObject:forKey:", v87, v55);
          }

          objc_msgSend(v162, "addObject:", v81);
LABEL_73:

          goto LABEL_74;
        }
LABEL_59:
        if (!v78)
          goto LABEL_63;
LABEL_74:

        objc_autoreleasePoolPop(v52);
      }
      v173 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v186, v196, 16);
    }
    while (v173);
    v16 = v145;
    v24 = v156;
    v42 = v164;
    v32 = v159;
    v43 = v160;
LABEL_77:

    objc_autoreleasePoolPop(context);
    if (!v155)
    {
      a6 = v150;
      if (objc_msgSend(v24, "count") < v150)
      {
        objc_msgSend(v42, "allKeys");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = 0u;
        v183 = 0u;
        v184 = 0u;
        v185 = 0u;
        v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
        if (v89)
        {
          v90 = v89;
          v91 = *(_QWORD *)v183;
          do
          {
            for (j = 0; j != v90; ++j)
            {
              if (*(_QWORD *)v183 != v91)
                objc_enumerationMutation(v88);
              v93 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * j);
              objc_msgSend(v164, "objectForKey:", v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKey:", v93);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend(v95, "count");

              LODWORD(v95) = objc_msgSend(v94, "intValue");
              if (-[_PSMessagesPinningSuggester minimalInteractions](v163, "minimalInteractions") > (int)v95
                || v96 < -[_PSMessagesPinningSuggester minimalUniqueDaysInteracted](v163, "minimalUniqueDaysInteracted"))
              {
                objc_msgSend(v164, "removeObjectForKey:", v93);
                objc_msgSend(v31, "removeObjectForKey:", v93);
              }

            }
            v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
          }
          while (v90);
        }
        v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
        v98 = objc_msgSend(v162, "count");
        v178 = 0u;
        v179 = 0u;
        v180 = 0u;
        v181 = 0u;
        v99 = v164;
        v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v178, v194, 16);
        if (v100)
        {
          v101 = v100;
          v102 = *(_QWORD *)v179;
          v103 = (double)v98;
          do
          {
            for (k = 0; k != v101; ++k)
            {
              if (*(_QWORD *)v179 != v102)
                objc_enumerationMutation(v99);
              v105 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * k);
              objc_msgSend(v170, "objectForKey:", v105);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = (double)(unint64_t)objc_msgSend(v106, "count") / v103;

              objc_msgSend(v99, "objectForKey:", v105);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = (double)(int)objc_msgSend(v108, "intValue") / v103;

              objc_msgSend(v167, "objectForKey:", v105);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = objc_msgSend(v161, "containsObject:", v110);
              if (-[_PSMessagesPinningSuggester boostIndividualFavorites](v163, "boostIndividualFavorites")
                && (v111 & 1) != 0
                || (-[_PSMessagesPinningSuggester regularityThreshold](v163, "regularityThreshold"), v107 >= v117)
                && (-[_PSMessagesPinningSuggester intensityThreshold](v163, "intensityThreshold"), v109 >= v118))
              {
                -[_PSMessagesPinningSuggester regularityWeight](v163, "regularityWeight");
                v113 = v112;
                -[_PSMessagesPinningSuggester intensityWeight](v163, "intensityWeight");
                v193[0] = v105;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v109 * v114 + v107 * v113);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v193[1] = v115;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 2);
                v116 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v97, "count"))
                  objc_msgSend(v97, "insertObject:atIndex:", v116, objc_msgSend(v97, "indexOfObject:inSortedRange:options:usingComparator:", v116, 0, objc_msgSend(v97, "count"), 1024, &__block_literal_global_148));
                else
                  objc_msgSend(v97, "addObject:", v116);

              }
            }
            v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v178, v194, 16);
          }
          while (v101);
        }

        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = 0u;
        v175 = 0u;
        v176 = 0u;
        v177 = 0u;
        v120 = v97;
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v174, v192, 16);
        if (v121)
        {
          v122 = v121;
          v123 = 0;
          v124 = *(_QWORD *)v175;
          do
          {
            for (m = 0; m != v122; ++m)
            {
              if (*(_QWORD *)v175 != v124)
                objc_enumerationMutation(v120);
              objc_msgSend(*(id *)(*((_QWORD *)&v174 + 1) + 8 * m), "firstObject");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v167, "objectForKey:", v126);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "addObject:", v127);
              if (objc_msgSend(v126, "containsString:", CFSTR("chat")))
                v123 |= objc_msgSend(v119, "count") <= (unint64_t)a3;

            }
            v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v174, v192, 16);
          }
          while (v122);
        }
        else
        {
          v123 = 0;
        }

        if (-[_PSMessagesPinningSuggester boostIndividualFavorites](v163, "boostIndividualFavorites"))
        {
          v128 = (void *)objc_msgSend(v119, "copy");
          v129 = objc_msgSend(v119, "count");
          if (v129 - 1 >= 0)
          {
            v130 = v129;
            do
            {
              objc_msgSend(v128, "objectAtIndexedSubscript:", --v130);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v161, "containsObject:", v131))
              {
                objc_msgSend(v119, "removeObject:", v131);
                objc_msgSend(v119, "insertObject:atIndex:", v131, 0);
              }

            }
            while (v130 > 0);
          }

        }
        objc_msgSend(v119, "array");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v119, "count");
        if (v133 >= a3)
          v134 = a3;
        else
          v134 = v133;
        objc_msgSend(v132, "subarrayWithRange:", 0, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = (void *)objc_msgSend(v135, "mutableCopy");

        if (-[_PSMessagesPinningSuggester boostGroups](v163, "boostGroups")
          && ((-[_PSMessagesPinningSuggester boostIndividualFavorites](v163, "boostIndividualFavorites") | v123) & 1) == 0
          && (unint64_t)objc_msgSend(v120, "count") >= 4
          && (unint64_t)objc_msgSend(v120, "count") >= 4)
        {
          v137 = 3;
          while (1)
          {
            objc_msgSend(v120, "objectAtIndexedSubscript:", v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "firstObject");
            v139 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v139, "containsString:", CFSTR("chat")))
              break;

            v140 = objc_msgSend(v120, "count");
            if (v137 <= 3 && ++v137 < v140)
              continue;
            goto LABEL_139;
          }
          objc_msgSend(v167, "objectForKey:", v139);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "removeLastObject");
          objc_msgSend(v136, "addObject:", v141);

        }
LABEL_139:
        v144 = objc_msgSend(v136, "copy");

        v16 = v145;
        v24 = v156;
        v42 = v164;
        v31 = v170;
        v32 = v159;
        v43 = v160;
        break;
      }
      continue;
    }
    break;
  }

  v26 = v149;
  v27 = (void *)v144;
LABEL_141:

  return v27;
}

- (BOOL)outgoingOnly
{
  return self->_outgoingOnly;
}

- (BOOL)loadPSConfig
{
  NSDictionary *v3;
  NSDictionary *psMessagesPinningConfig;
  NSDictionary *v5;
  NSObject *v6;
  uint8_t v8[16];

  +[_PSConfig messagesPinningConfig](_PSConfig, "messagesPinningConfig");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  psMessagesPinningConfig = self->_psMessagesPinningConfig;
  self->_psMessagesPinningConfig = v3;

  v5 = self->_psMessagesPinningConfig;
  if (v5)
  {
    -[_PSMessagesPinningSuggester updateModelProperties:](self, "updateModelProperties:", self->_psMessagesPinningConfig);
    +[_PSLogging messagePinningChannel](_PSLogging, "messagePinningChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_INFO, "Loaded psConfig", v8, 2u);
    }

  }
  return v5 != 0;
}

- (void)updateModelProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_PSMessagesPinningSuggester setConfigVersion:](self, "setConfigVersion:", CFSTR("2"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("2"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_PSMessagesPinningBoostGroups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMessagesPinningSuggester setBoostGroups:](self, "setBoostGroups:", objc_msgSend(v5, "integerValue") != 0);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_PSMessagesPinningOutgoingOnly"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMessagesPinningSuggester setOutgoingOnly:](self, "setOutgoingOnly:", objc_msgSend(v6, "integerValue") != 0);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_PSMessagesPinningBoostIndividualFavorites"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMessagesPinningSuggester setBoostIndividualFavorites:](self, "setBoostIndividualFavorites:", objc_msgSend(v7, "integerValue") != 0);

}

- (void)setOutgoingOnly:(BOOL)a3
{
  self->_outgoingOnly = a3;
}

- (void)setConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configVersion, a3);
}

- (void)setBoostIndividualFavorites:(BOOL)a3
{
  self->_boostIndividualFavorites = a3;
}

- (void)setBoostGroups:(BOOL)a3
{
  self->_boostGroups = a3;
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
  v3.super_class = (Class)_PSMessagesPinningSuggester;
  -[_PSMessagesPinningSuggester dealloc](&v3, sel_dealloc);
}

- (_PSMessagesPinningSuggester)init
{
  return -[_PSMessagesPinningSuggester initWithRegularityThreshold:intensityThreshold:regularityWeight:intensityWeight:minimalInteration:minimalUniqueDaysInteracted:interactionStore:lookbackWindow:outgoingOnly:](self, "initWithRegularityThreshold:intensityThreshold:regularityWeight:intensityWeight:minimalInteration:minimalUniqueDaysInteracted:interactionStore:lookbackWindow:outgoingOnly:", 2, 2, 0, 1, 0.1, 0.0, 0.95, 0.1, 5184000.0);
}

- (_PSMessagesPinningSuggester)initWithRegularityThreshold:(double)a3 intensityThreshold:(double)a4 regularityWeight:(double)a5 intensityWeight:(double)a6 minimalInteration:(int64_t)a7 minimalUniqueDaysInteracted:(int64_t)a8 interactionStore:(id)a9 lookbackWindow:(double)a10
{
  return -[_PSMessagesPinningSuggester initWithRegularityThreshold:intensityThreshold:regularityWeight:intensityWeight:minimalInteration:minimalUniqueDaysInteracted:interactionStore:lookbackWindow:outgoingOnly:](self, "initWithRegularityThreshold:intensityThreshold:regularityWeight:intensityWeight:minimalInteration:minimalUniqueDaysInteracted:interactionStore:lookbackWindow:outgoingOnly:", a7, a8, a9, 1, a3, a4, a5, a6, a10);
}

- (void)provideMessagesPinningFeedback:(id)a3
{
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  id v7;

  connection = self->_connection;
  v7 = a3;
  if (connection)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_152);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "provideMessagesPinningFeedback:", v7);

    v6 = v5;
  }
  else
  {
    -[_PSMessagesPinningSuggester submitMessagesPinningFeedback:](self, "submitMessagesPinningFeedback:", v7);
    v6 = v7;
  }

}

- (void)submitMessagesPinningFeedback:(id)a3
{
  id v4;
  _PS_TPSDiscoverabilitySignal *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id v9;
  void *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[_PS_TPSDiscoverabilitySignal initWithIdentifier:]([_PS_TPSDiscoverabilitySignal alloc], "initWithIdentifier:", CFSTR("com.apple.messages.pinningUIShown"));
  -[_PS_TPSDiscoverabilitySignal donateSignalWithCompletion:](v5, "donateSignalWithCompletion:", &__block_literal_global_156);
  v6 = objc_msgSend(v4, "actionType");
  if (v6 == 1)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "Feedback for messages pinning onboarding: Acceptance";
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "Feedback for messages pinning onboarding: unknown action type";
      goto LABEL_9;
    }
  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "Feedback for messages pinning onboarding: Skip";
LABEL_9:
      _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
  }

  -[_PSMessagesPinningSuggester getPayloadOfFeedback:](self, "getPayloadOfFeedback:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  AnalyticsSendEventLazy();

}

- (id)getPayloadOfFeedback:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
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
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[_PSMessagesPinningUtilities actionTypeToString:](_PSMessagesPinningUtilities, "actionTypeToString:", objc_msgSend(v3, "actionType"));
  v5 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("actionType"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("actionType"));

  }
  objc_msgSend(v3, "actualPinnings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSMessagesPinningUtilities suggestionsToString:](_PSMessagesPinningUtilities, "suggestionsToString:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v8;
  if (v8)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("actualPinnings"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("actualPinnings"));

  }
  objc_msgSend(v3, "onboardingSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSMessagesPinningUtilities suggestionsToString:](_PSMessagesPinningUtilities, "suggestionsToString:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v11;
  if (v11)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("onboardingSuggestions"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("onboardingSuggestions"));

  }
  objc_msgSend(v3, "actualPinnings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("numOfActualPinnings"));

  objc_msgSend(v3, "onboardingSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("numOfSuggestions"));

  objc_msgSend(v3, "actualPinnings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSMessagesPinningUtilities chatGuidsFromSuggestions:](_PSMessagesPinningUtilities, "chatGuidsFromSuggestions:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "onboardingSuggestions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSMessagesPinningUtilities chatGuidsFromSuggestions:](_PSMessagesPinningUtilities, "chatGuidsFromSuggestions:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSMessagesPinningUtilities intersectionsOfActualPinnings:fromTopN:suggestions:](_PSMessagesPinningUtilities, "intersectionsOfActualPinnings:fromTopN:suggestions:", v20, 3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("numOfGoodSuggestionsInTop3"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("numOfGoodSuggestionsInTop3"));

  }
  +[_PSMessagesPinningUtilities intersectionsOfActualPinnings:fromTopN:suggestions:](_PSMessagesPinningUtilities, "intersectionsOfActualPinnings:fromTopN:suggestions:", v20, 9, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("numOfGoodSuggestionsInTop9"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("numOfGoodSuggestionsInTop9"));

  }
  objc_msgSend(v3, "eventDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSMessagesPinningUtilities dateToString:](_PSMessagesPinningUtilities, "dateToString:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("eventDate"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("eventDate"));

  }
  +[_PSMessagesPinningUtilities interactionMethodToString:](_PSMessagesPinningUtilities, "interactionMethodToString:", objc_msgSend(v3, "interactionMethod"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("trialId"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("trialId"));

  }
  return v4;
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (NSDictionary)psMessagesPinningConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPsMessagesPinningConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)regularityThreshold
{
  return self->_regularityThreshold;
}

- (void)setRegularityThreshold:(double)a3
{
  self->_regularityThreshold = a3;
}

- (double)intensityThreshold
{
  return self->_intensityThreshold;
}

- (void)setIntensityThreshold:(double)a3
{
  self->_intensityThreshold = a3;
}

- (double)regularityWeight
{
  return self->_regularityWeight;
}

- (void)setRegularityWeight:(double)a3
{
  self->_regularityWeight = a3;
}

- (double)intensityWeight
{
  return self->_intensityWeight;
}

- (void)setIntensityWeight:(double)a3
{
  self->_intensityWeight = a3;
}

- (int64_t)minimalInteractions
{
  return self->_minimalInteractions;
}

- (void)setMinimalInteractions:(int64_t)a3
{
  self->_minimalInteractions = a3;
}

- (int64_t)minimalUniqueDaysInteracted
{
  return self->_minimalUniqueDaysInteracted;
}

- (void)setMinimalUniqueDaysInteracted:(int64_t)a3
{
  self->_minimalUniqueDaysInteracted = a3;
}

- (double)lookbackWindow
{
  return self->_lookbackWindow;
}

- (void)setLookbackWindow:(double)a3
{
  self->_lookbackWindow = a3;
}

- (BOOL)boostGroups
{
  return self->_boostGroups;
}

- (BOOL)boostIndividualFavorites
{
  return self->_boostIndividualFavorites;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions:referenceDate:minimumDaysOfHistory:maxInteractionsForQuery:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error while querying interation store for minimumDaysOfHistoryCheck %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
