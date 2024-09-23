@implementation ATXUIFeedbackBiomeCorrelateHandler

- (void)receivePriorEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[BPSCorrelateHandler context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EEB98E38))
      {
        objc_msgSend(v5, "addContext:", v7);
        __atxlog_handle_blending_ecosystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[ATXUIFeedbackBiomeCorrelateHandler receivePriorEvent:].cold.1();
LABEL_13:

        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "addBlendingModelUICacheUpdate:", v7);
        __atxlog_handle_blending_ecosystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[ATXUIFeedbackBiomeCorrelateHandler receivePriorEvent:].cold.2((uint64_t)self, v7);
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "addClientModelCacheUpdate:", v7);
        __atxlog_handle_blending_ecosystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[ATXUIFeedbackBiomeCorrelateHandler receivePriorEvent:].cold.3((uint64_t)self, v7);
        goto LABEL_13;
      }
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_14:

}

+ (id)uiFeedbackCorrelateHandler
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v2, "initWithInitialContext:", v3);

  return v4;
}

- (void)updateMostRecentlySeenBlendingUICacheUpdateUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BPSCorrelateHandler context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePinnedBlendingModelUICacheUpdateUUID:", v4);

  -[BPSCorrelateHandler context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pruneContextStateOlderThanBlendingUUID:", v4);

}

- (void)receiveCurrentEvent:(id)a3
{
  NSObject *v3;

  __atxlog_handle_blending_ecosystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ATXUIFeedbackBiomeCorrelateHandler receiveCurrentEvent:].cold.1();

}

- (id)correlateWithCurrentEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t jj;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t kk;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t mm;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  ATXProactiveSuggestionUIFeedbackResult *v85;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  ATXProactiveSuggestionUIFeedbackResult *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *context;
  void *contexta;
  id obj;
  id obja;
  uint64_t v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
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
  __int128 v126;
  __int128 v127;
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
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v92 = (id)objc_opt_new();
  v5 = v4;
  -[BPSCorrelateHandler context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateTimeContextWithDate:", v8);

  v100 = (void *)objc_opt_new();
  v99 = (void *)objc_opt_new();
  v98 = (void *)objc_opt_new();
  objc_msgSend(v5, "blendingUICacheUpdateUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelCacheUpdatesForUICacheUpdateUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = v5;
  objc_msgSend(v5, "blendingUICacheUpdateUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v6;
  objc_msgSend(v6, "blendingModelUICacheUpdateForUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") && v12)
  {
    v90 = v12;
    v88 = v7;
    v13 = objc_opt_new();
    context = (void *)MEMORY[0x1AF421DC4]();
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v87 = v10;
    obj = v10;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v158, 16);
    if (v14)
    {
      v15 = v14;
      v107 = *(_QWORD *)v146;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v146 != v107)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
          v141 = 0u;
          v142 = 0u;
          v143 = 0u;
          v144 = 0u;
          objc_msgSend(v17, "suggestions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v141, v157, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v142;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v142 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * j);
                objc_msgSend(v23, "uuid");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v23, v24);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v141, v157, 16);
            }
            while (v20);
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v158, 16);
      }
      while (v15);
    }

    objc_autoreleasePoolPop(context);
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    objc_msgSend(v93, "engagedUUIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v137, v156, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v138;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v138 != v28)
            objc_enumerationMutation(v25);
          -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * k));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v99, "addObject:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v137, v156, 16);
      }
      while (v27);
    }

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    objc_msgSend(v93, "shownUUIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v133, v155, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v134;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v134 != v34)
            objc_enumerationMutation(v31);
          -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * m));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            objc_msgSend(v100, "addObject:", v36);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v133, v155, 16);
      }
      while (v33);
    }

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    objc_msgSend(v93, "rejectedUUIDs");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v129, v154, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v130;
      do
      {
        for (n = 0; n != v39; ++n)
        {
          if (*(_QWORD *)v130 != v40)
            objc_enumerationMutation(v37);
          -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * n));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v98, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v129, v154, 16);
      }
      while (v39);
    }

    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v89 = obj;
    v95 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v125, v153, 16);
    if (v95)
    {
      v94 = *(_QWORD *)v126;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v126 != v94)
            objc_enumerationMutation(v89);
          v102 = v43;
          v44 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v43);
          v101 = (void *)MEMORY[0x1AF421DC4]();
          contexta = (void *)objc_opt_new();
          v45 = objc_opt_new();
          obja = (id)objc_opt_new();
          v46 = (void *)objc_opt_new();
          v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          v124 = 0u;
          v97 = v44;
          objc_msgSend(v44, "suggestions");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v121, v152, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v122;
            do
            {
              for (ii = 0; ii != v49; ++ii)
              {
                if (*(_QWORD *)v122 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * ii);
                -[ATXUIFeedbackBiomeCorrelateHandler boxedExecutableHashForProactiveSuggestion:](self, "boxedExecutableHashForProactiveSuggestion:", v52);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKey:", v52, v53);

              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v121, v152, 16);
            }
            while (v49);
          }
          v108 = (void *)v45;

          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v54 = v100;
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v117, v151, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v118;
            do
            {
              for (jj = 0; jj != v56; ++jj)
              {
                if (*(_QWORD *)v118 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * jj);
                -[ATXUIFeedbackBiomeCorrelateHandler boxedExecutableHashForProactiveSuggestion:](self, "boxedExecutableHashForProactiveSuggestion:", v59);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectForKey:", v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                if (v61
                  && -[ATXUIFeedbackBiomeCorrelateHandler _proactiveSuggestionsContainEqualExecutablesWithSuggestion1:suggestion2:](self, "_proactiveSuggestionsContainEqualExecutablesWithSuggestion1:suggestion2:", v59, v61))
                {
                  objc_msgSend(contexta, "addObject:", v61);
                }

              }
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v117, v151, 16);
            }
            while (v56);
          }

          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v62 = v99;
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v113, v150, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v114;
            do
            {
              for (kk = 0; kk != v64; ++kk)
              {
                if (*(_QWORD *)v114 != v65)
                  objc_enumerationMutation(v62);
                v67 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * kk);
                -[ATXUIFeedbackBiomeCorrelateHandler boxedExecutableHashForProactiveSuggestion:](self, "boxedExecutableHashForProactiveSuggestion:", v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectForKey:", v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                if (v69
                  && -[ATXUIFeedbackBiomeCorrelateHandler _proactiveSuggestionsContainEqualExecutablesWithSuggestion1:suggestion2:](self, "_proactiveSuggestionsContainEqualExecutablesWithSuggestion1:suggestion2:", v67, v69))
                {
                  objc_msgSend(v108, "addObject:", v69);
                }

              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v113, v150, 16);
            }
            while (v64);
          }

          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v70 = v98;
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v109, v149, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v110;
            do
            {
              for (mm = 0; mm != v72; ++mm)
              {
                if (*(_QWORD *)v110 != v73)
                  objc_enumerationMutation(v70);
                v75 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * mm);
                -[ATXUIFeedbackBiomeCorrelateHandler boxedExecutableHashForProactiveSuggestion:](self, "boxedExecutableHashForProactiveSuggestion:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectForKey:", v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                if (v77
                  && -[ATXUIFeedbackBiomeCorrelateHandler _proactiveSuggestionsContainEqualExecutablesWithSuggestion1:suggestion2:](self, "_proactiveSuggestionsContainEqualExecutablesWithSuggestion1:suggestion2:", v75, v77))
                {
                  objc_msgSend(obja, "addObject:", v77);
                }

              }
              v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v109, v149, 16);
            }
            while (v72);
          }

          v79 = obja;
          v78 = v108;
          if (objc_msgSend(contexta, "count"))
          {
            v96 = [ATXProactiveSuggestionUIFeedbackResult alloc];
            objc_msgSend(contexta, "array");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "array");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "array");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v93, "consumerSubType");
            objc_msgSend(v91, "context");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = obja;
            v85 = -[ATXProactiveSuggestionUIFeedbackResult initWithShownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:](v96, "initWithShownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:", v80, v81, v82, v93, v83, v97, v90, v84);

            v78 = v108;
            objc_msgSend(v92, "addObject:", v85);

          }
          objc_autoreleasePoolPop(v101);
          v43 = v102 + 1;
        }
        while (v102 + 1 != v95);
        v95 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v125, v153, 16);
      }
      while (v95);
    }

    v10 = v87;
    v7 = v88;
    v12 = v90;
  }
  else
  {
    __atxlog_handle_blending_ecosystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXUIFeedbackBiomeCorrelateHandler correlateWithCurrentEvent:].cold.1((uint64_t)self, v93, v13);
  }

  return v92;
}

- (id)boxedExecutableHashForProactiveSuggestion:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "executableObjectHash");

  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v4);
}

- (BOOL)_proactiveSuggestionsContainEqualExecutablesWithSuggestion1:(id)a3 suggestion2:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "fuzzyIsEqualToExecutableSpecification:", v7);
  return (char)v5;
}

- (void)receivePriorEvent:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2(&dword_1AA841000, v2, v3, "%@ - received new prior context event", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivePriorEvent:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_0(&dword_1AA841000, v6, v7, "%@ - received new prior context event with blending ui cache uuid: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_3();
}

- (void)receivePriorEvent:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_0(&dword_1AA841000, v6, v7, "%@ - received new prior context event for clientModelId: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_3();
}

- (void)receiveCurrentEvent:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2(&dword_1AA841000, v2, v3, "%@ - received new current (feedback session) event", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)correlateWithCurrentEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint8_t v8[24];

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(a2, "consumerSubType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  _os_log_fault_impl(&dword_1AA841000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find any client caches for session with consumerSubType: %@", v8, 0x16u);

  OUTLINED_FUNCTION_2_3();
}

@end
