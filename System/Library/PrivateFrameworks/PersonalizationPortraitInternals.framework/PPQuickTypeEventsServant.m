@implementation PPQuickTypeEventsServant

- (PPQuickTypeEventsServant)init
{
  PPQuickTypeEventsServant *v2;
  NSObject *v3;
  uint64_t v4;
  PPLocalEventStore *localEventStore;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t buf[16];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PPQuickTypeEventsServant;
  v2 = -[PPQuickTypeEventsServant init](&v16, sel_init);
  if (v2)
  {
    pp_quicktype_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPQuickTypeEventsServant initializing", buf, 2u);
    }

    +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
    v4 = objc_claimAutoreleasedReturnValue();
    localEventStore = v2->_localEventStore;
    v2->_localEventStore = (PPLocalEventStore *)v4;

    v6 = (void *)MEMORY[0x1E0D70C20];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quickTypeQueryWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 0, 0, 0, 0, 0, 0, 0, 0, 0, v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id)objc_msgSend(v10, "makeShortEventFormatter");
    v12 = (id)objc_msgSend(v10, "makeLongEventFormatter");

    pp_quicktype_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_INFO, "PPQuickTypeEventsServant initialization complete", buf, 2u);
    }

  }
  return v2;
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  void *v13;
  PPLocalEventStore *localEventStore;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  PPLocalEventStore *v19;
  uint64_t v20;
  PPLocalEventStore *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  unsigned int v48;
  int v49;
  id v50;
  id v51;
  NSObject *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  int v72;
  void *v73;
  id v74;
  id v75;
  unint64_t v76;
  unint64_t v77;
  id v78;
  void *v79;
  unsigned int v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  uint64_t j;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  char v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  void *v130;
  NSObject *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  unint64_t v144;
  void *v145;
  uint64_t v146;
  id v147;
  id v148;
  int v149;
  void *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  void *v154;
  unint64_t v155;
  id obj;
  void *v157;
  id v158;
  uint64_t v159;
  id v160;
  PPQuickTypeEventsServant *v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _QWORD v167[4];
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[128];
  void *v182;
  _BYTE v183[128];
  uint8_t v184[128];
  _BYTE buf[24];
  void *v186;
  id v187;
  id v188;
  uint64_t v189;
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v143 = a5;
  v145 = v8;
  LODWORD(v8) = objc_msgSend(v8, "type");
  pp_quicktype_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v8 == 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "prediction request to PPQuickTypeEventsServant", buf, 2u);
    }

    if (+[PPQuickTypeSettings servantShouldRespondToQuery:](PPQuickTypeSettings, "servantShouldRespondToQuery:", self))
    {
      v11 = objc_msgSend(v145, "subtype");
      pp_quicktype_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11 == 3;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "looking for busy times? %d", buf, 8u);
      }

      v13 = (void *)objc_opt_new();
      if (objc_msgSend(v145, "time") == 1)
      {
        localEventStore = self->_localEventStore;
        objc_msgSend(v13, "dateByAddingTimeInterval:", -600.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", 345600.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPLocalEventStore eventsFromDate:toDate:](localEventStore, "eventsFromDate:toDate:", v15, v16);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        goto LABEL_23;
      }
      if (objc_msgSend(v145, "time") == 2)
      {
        v19 = self->_localEventStore;
        PPNextMidnight();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v145, "time") == 3)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 172800.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = self->_localEventStore;
          PPNextMidnight();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "startOfDayForDate:", v15);
          v23 = v13;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPLocalEventStore eventsFromDate:toDate:](v21, "eventsFromDate:toDate:", v16, v24);
          v141 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v23;
          goto LABEL_9;
        }
        v19 = self->_localEventStore;
        objc_msgSend(v13, "dateByAddingTimeInterval:", 604800.0);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v20;
      -[PPLocalEventStore eventsFromDate:toDate:](v19, "eventsFromDate:toDate:", v13, v20);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      pp_quicktype_log_handle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v141, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "%tu events matching predicate", buf, 0xCu);
      }

      if (!objc_msgSend(v141, "count"))
      {
        objc_msgSend(v143, "push:", 19);
        v18 = 0;
LABEL_156:

        goto LABEL_157;
      }
      objc_msgSend(v145, "people");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v142 = v28;
        }
        else
        {
          v182 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v182, 1);
          v29 = objc_claimAutoreleasedReturnValue();

          v142 = (id)v29;
        }
      }
      else
      {
        v142 = 0;
      }
      objc_msgSend(v145, "recipients");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v157 = (void *)objc_opt_new();
      v140 = v13;
      if (objc_msgSend(v145, "time") == 1 && v11 == 3 && (objc_msgSend(v145, "fields") & 0x30000) != 0)
      {
        if ((!obj || !objc_msgSend(obj, "count")) && (!v142 || !objc_msgSend(v142, "count")))
        {
          pp_quicktype_log_handle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v66, OS_LOG_TYPE_DEFAULT, "shouldAddRecipientToPeopleOfInterest but no recipients", buf, 2u);
          }

          objc_msgSend(v143, "push:", 20);
          v18 = 0;
          goto LABEL_155;
        }
        v161 = self;
        pp_quicktype_log_handle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_INFO, "recipient is person of interest", buf, 2u);
        }

        v31 = (void *)objc_opt_new();
        v167[0] = MEMORY[0x1E0C809B0];
        v167[1] = 3221225472;
        v167[2] = __73__PPQuickTypeEventsServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke;
        v167[3] = &unk_1E7E1C258;
        v32 = v31;
        v168 = v32;
        objc_msgSend(obj, "enumerateObjectsUsingBlock:", v167);
        v33 = v32;

        v165 = 0u;
        v166 = 0u;
        v163 = 0u;
        v164 = 0u;
        obj = v33;
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v181, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v164;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v164 != v36)
                objc_enumerationMutation(obj);
              v38 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
              v39 = (void *)objc_opt_new();
              if (objc_msgSend(v38, "containsString:", CFSTR("@")))
                objc_msgSend(v39, "setMatchingEmail:", v38);
              else
                objc_msgSend(v39, "setMatchingPhone:", v38);
              +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "rankedContactsWithQuery:error:", v39, 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "firstObject");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
                v43 = v42;
              else
                v43 = v38;
              objc_msgSend(v157, "addObject:", v43);

            }
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v181, 16);
          }
          while (v35);
        }

        self = v161;
        v11 = 3;
      }
      if (objc_msgSend(v157, "count"))
      {
        if (v142 && objc_msgSend(v142, "count"))
          objc_msgSend(v157, "addObjectsFromArray:", v142);
        v44 = v157;

        v142 = v44;
      }
      pp_quicktype_log_handle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = objc_msgSend(v142, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v46;
        _os_log_impl(&dword_1C392E000, v45, OS_LOG_TYPE_INFO, "%ld people of interest", buf, 0xCu);
      }

      pp_private_log_handle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v142;
        _os_log_debug_impl(&dword_1C392E000, v47, OS_LOG_TYPE_DEBUG, "people of interest: %@", buf, 0xCu);
      }

      v48 = objc_msgSend(v145, "time");
      v49 = objc_msgSend(v145, "fields");
      v50 = v141;
      v142 = v142;
      v51 = v143;
      if (self)
      {
        pp_quicktype_log_handle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v142;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v186) = v11 == 3;
          _os_log_debug_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEBUG, "filtering events for time: %lu: people: %@ busy: %d", buf, 0x1Cu);
        }

        if ((v48 & 0xFFFFFFFD) == 1)
        {
          if (v11 == 3)
          {
            v53 = v51;
            v54 = v142;
            v55 = v142;
            objc_msgSend(v50, "objectEnumerator");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_73:
            v57 = v56;
            -[PPQuickTypeEventsServant _busyEventsFromEvents:people:explanationSet:](v56, v55, v53);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_86;
          }
          -[PPQuickTypeEventsServant _freeEventsAndGapsFromEvents:explanationSet:]((uint64_t)self, v50, v51);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v59;
          if ((v49 & 0x40000) != 0)
          {
            objc_msgSend(v59, "lastObject");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "endDate");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            PPNextMidnight();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v61, "isEqualToDate:", v62);

            if (v63)
            {
              objc_msgSend(v58, "subarrayWithRange:", 0, objc_msgSend(v58, "count") - 1);
              v64 = objc_claimAutoreleasedReturnValue();

              v58 = (void *)v64;
            }
          }
          goto LABEL_85;
        }
        if (v48 == 2)
        {
          if (v11 == 3)
          {
            v53 = v51;
            v54 = v142;
            v55 = v142;
            objc_msgSend(v50, "reverseObjectEnumerator");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_73;
          }
          -[PPQuickTypeEventsServant _freeEventsAndGapsFromEvents:explanationSet:]((uint64_t)self, v50, v51);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "reverseObjectEnumerator");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "allObjects");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_85:
          v54 = v142;
LABEL_86:

          pp_quicktype_log_handle();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            v70 = objc_msgSend(v58, "count");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v70;
            _os_log_impl(&dword_1C392E000, v69, OS_LOG_TYPE_INFO, "%ld events after filtering", buf, 0xCu);
          }

          pp_private_log_handle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v58;
            _os_log_debug_impl(&dword_1C392E000, v71, OS_LOG_TYPE_DEBUG, "predicted events after filter: %@", buf, 0xCu);
          }

          +[PPQuickTypeMetrics eventsMatches:](PPQuickTypeMetrics, "eventsMatches:", objc_msgSend(v58, "count"));
          v72 = objc_msgSend(v145, "fields");
          +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v145);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v58;
          v152 = v73;
          v138 = v51;
          v139 = v74;
          if (self)
          {
            v75 = objc_alloc(MEMORY[0x1E0C99DE8]);
            v76 = objc_msgSend(v74, "count");
            if (v76 >= a4)
              v77 = a4;
            else
              v77 = v76;
            v18 = (void *)objc_msgSend(v75, "initWithCapacity:", v77);
            v173 = 0u;
            v174 = 0u;
            v175 = 0u;
            v176 = 0u;
            v78 = v74;
            +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v79, "nextEventsFuzzMinutes");

            objc_msgSend(v78, "firstObject");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "startDate");
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v78, "count") <= a4)
            {
              v88 = v78;
            }
            else
            {
              v83 = 60 * v80;
              objc_msgSend(v78, "subarrayWithRange:", 0, a4);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = (void *)objc_msgSend(v84, "mutableCopy");

              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __58__PPQuickTypeEventsServant__fuzzyNextEvents_minimumCount___block_invoke;
              v186 = &unk_1E7E17D50;
              v187 = v82;
              v189 = v83;
              v86 = v85;
              v188 = v86;
              objc_msgSend(v78, "enumerateObjectsUsingBlock:", buf);
              v87 = v188;
              v88 = v86;

            }
            v151 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v173, v184, 16);
            if (v151)
            {
              v89 = 0;
              v146 = *(_QWORD *)v174;
              v144 = a4;
              v150 = v18;
              v149 = v72;
              v147 = v88;
              v148 = v78;
              do
              {
                v90 = 0;
                do
                {
                  v155 = v89;
                  if (*(_QWORD *)v174 != v146)
                    objc_enumerationMutation(v88);
                  v153 = v90;
                  v91 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v90);
                  v169 = 0u;
                  v170 = 0u;
                  v171 = 0u;
                  v172 = 0u;
                  v92 = v91;
                  v93 = v152;
                  v160 = (id)objc_opt_new();
                  v94 = v92;
                  v95 = v93;
                  v96 = (void *)objc_opt_new();
                  if ((v72 & 0x20000) != 0)
                  {
                    objc_msgSend(v94, "startDate");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v95, "formattedEventTime:", v97);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PPQuickTypeLabeledValue labeledValueWithLabel:value:scoreBoost:fields:](PPQuickTypeLabeledValue, "labeledValueWithLabel:value:scoreBoost:fields:", 0, v98, 0x20000, 0.0);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "addObject:", v99);

                    if ((v72 & 0x40000) != 0)
                    {
LABEL_107:
                      objc_msgSend(v94, "endDate");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "formattedEventTime:", v100);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      +[PPQuickTypeLabeledValue labeledValueWithLabel:value:scoreBoost:fields:](PPQuickTypeLabeledValue, "labeledValueWithLabel:value:scoreBoost:fields:", 0, v101, 0x40000, 0.0);
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v96, "addObject:", v102);

                      if ((v72 & 0x8000) == 0)
                        goto LABEL_112;
                      goto LABEL_108;
                    }
                  }
                  else if ((v72 & 0x40000) != 0)
                  {
                    goto LABEL_107;
                  }
                  if ((v72 & 0x8000) == 0)
                    goto LABEL_112;
LABEL_108:
                  objc_msgSend(v94, "title");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v103, "length"))
                    goto LABEL_111;
                  v104 = objc_msgSend(v94, "representsUnscheduledFreeTime");

                  if ((v104 & 1) == 0)
                  {
                    objc_msgSend(v94, "title");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PPQuickTypeLabeledValue labeledValueWithLabel:value:scoreBoost:fields:](PPQuickTypeLabeledValue, "labeledValueWithLabel:value:scoreBoost:fields:", 0, v103, 0x8000, 0.0);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "addObject:", v105);

LABEL_111:
                  }
LABEL_112:
                  if ((v72 & 0x10000) != 0)
                  {
                    objc_msgSend(v94, "location");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    v107 = objc_msgSend(v106, "length");

                    if (v107)
                    {
                      objc_msgSend(v94, "location");
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      +[PPQuickTypeLabeledValue labeledValueWithLabel:value:scoreBoost:fields:](PPQuickTypeLabeledValue, "labeledValueWithLabel:value:scoreBoost:fields:", 0, v108, 0x10000, 0.0);
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v96, "addObject:", v109);

                    }
                  }
                  v154 = v95;

                  pp_quicktype_log_handle();
                  v110 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v94;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v96;
                    _os_log_debug_impl(&dword_1C392E000, v110, OS_LOG_TYPE_DEBUG, "valuesForPrediction event: %@: values: %@", buf, 0x16u);
                  }

                  v179 = 0u;
                  v180 = 0u;
                  v177 = 0u;
                  v178 = 0u;
                  v158 = v96;
                  v111 = v160;
                  v162 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v177, buf, 16);
                  if (v162)
                  {
                    v159 = *(_QWORD *)v178;
                    do
                    {
                      for (j = 0; j != v162; ++j)
                      {
                        if (*(_QWORD *)v178 != v159)
                          objc_enumerationMutation(v158);
                        v113 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * j);
                        v114 = (void *)MEMORY[0x1E0D70C18];
                        objc_msgSend(v113, "value");
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v113, "fields");
                        objc_msgSend(v113, "value");
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v94, "title");
                        v117 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v94, "startDate");
                        v118 = (void *)objc_claimAutoreleasedReturnValue();
                        v119 = objc_msgSend(v113, "fields");
                        if (objc_msgSend(v94, "representsUnscheduledFreeTime"))
                          v120 = 2;
                        else
                          v120 = 0;
                        objc_msgSend(v113, "scoreBoost");
                        v122 = v121;
                        objc_msgSend(v94, "eventIdentifier");
                        v123 = (void *)objc_claimAutoreleasedReturnValue();
                        BYTE2(v137) = 3;
                        BYTE1(v137) = v120;
                        LOBYTE(v137) = 0;
                        objc_msgSend(v114, "quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", &stru_1E7E221D0, v116, v117, v118, v119, 0, v122, 0, -1, v137, v123);
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        v111 = v160;
                        objc_msgSend(v160, "addObject:", v124);

                      }
                      v162 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v177, buf, 16);
                    }
                    while (v162);
                  }

                  v125 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v169, v183, 16);
                  if (v125)
                  {
                    v126 = v125;
                    v127 = *(_QWORD *)v170;
                    v18 = v150;
                    v78 = v148;
                    v89 = v155;
                    while (2)
                    {
                      v128 = 0;
                      if (v144 >= v89)
                        v129 = v144 - v89;
                      else
                        v129 = 0;
                      do
                      {
                        if (*(_QWORD *)v170 != v127)
                          objc_enumerationMutation(v160);
                        v130 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v128);
                        pp_quicktype_log_handle();
                        v131 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v130;
                          _os_log_debug_impl(&dword_1C392E000, v131, OS_LOG_TYPE_DEBUG, "event item prediction: %@", buf, 0xCu);
                        }

                        if (v129 == v128)
                        {
                          v89 += v128;
                          v133 = v160;
                          goto LABEL_143;
                        }
                        v132 = 100 - (v89 + v128);
                        if (v89 + v128 > 0x64)
                          v132 = 0;
                        objc_msgSend(v130, "setScore:", (double)(unint64_t)v132);
                        objc_msgSend(v150, "addObject:", v130);
                        ++v128;
                      }
                      while (v126 != v128);
                      v89 += v128;
                      v133 = v160;
                      v126 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v169, v183, 16);
                      if (v126)
                        continue;
                      break;
                    }
LABEL_143:

                    v72 = v149;
                    v88 = v147;
                    if (v89 > v144)
                      goto LABEL_148;
                  }
                  else
                  {

                    v18 = v150;
                    v72 = v149;
                    v88 = v147;
                    v78 = v148;
                    v89 = v155;
                  }
                  v90 = v153 + 1;
                }
                while (v153 + 1 != v151);
                v151 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v173, v184, 16);
              }
              while (v151);
            }
LABEL_148:

            if (objc_msgSend(v78, "count"))
            {
              v134 = objc_msgSend(v18, "count");
              v135 = v138;
              if ((v72 & 0x10000) != 0 && !v134)
                objc_msgSend(v138, "push:", 24);
              goto LABEL_154;
            }
          }
          else
          {
            v18 = 0;
          }
          v135 = v138;
LABEL_154:
          v13 = v140;

LABEL_155:
          goto LABEL_156;
        }
        pp_quicktype_log_handle();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v48;
          _os_log_error_impl(&dword_1C392E000, v65, OS_LOG_TYPE_ERROR, "unsupported time criteria: %lu", buf, 0xCu);
        }

        objc_msgSend(v51, "push:", 25);
      }
      v58 = 0;
      goto LABEL_85;
    }
    pp_quicktype_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "ignoring prediction request for Events due to settings", buf, 2u);
    }

    objc_msgSend(v143, "push:", 47);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPQuickTypeEventsServant ignoring request since it doesn't ask for events", buf, 2u);
    }

  }
  v18 = 0;
LABEL_157:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEventStore, 0);
}

void __73__PPQuickTypeEventsServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "containsString:", CFSTR(":")))
  {
    v3 = (void *)MEMORY[0x1C3BD6630]();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

void __58__PPQuickTypeEventsServant__fuzzyNextEvents_minimumCount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  if (v4 <= (double)*(unint64_t *)(a1 + 48))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6);

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {

  }
}

- (id)_freeEventsAndGapsFromEvents:(void *)a3 explanationSet:
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  double v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v53;
  id v54;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  _BYTE *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  uint8_t v72[128];
  _BYTE v73[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v54 = a3;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v5 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v67 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend(v10, "availability") != 1
          && !-[PPQuickTypeEventsServant _shouldTreatAsUnscheduledFreeTime:](v10))
        {
          objc_msgSend(v10, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v13 = v12;

          objc_msgSend(v10, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceDate:", v15);
          v17 = v16;

          objc_msgSend(v5, "addIndexesInRange:", (unint64_t)v13, (unint64_t)v17);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v7);
  }

  pp_quicktype_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v73 = 138412290;
    *(_QWORD *)&v73[4] = v5;
    _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: busy ranges: %@", v73, 0xCu);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v5, "firstIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    pp_quicktype_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v73 = 138412290;
      *(_QWORD *)&v73[4] = v19;
      _os_log_debug_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: busy start: %@", v73, 0xCu);
    }

    v56 = (void *)objc_opt_new();
    v21 = objc_msgSend(v5, "firstIndex");
    objc_msgSend(v56, "timeIntervalSinceReferenceDate");
    if ((double)v21 - v22 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "components:fromDate:", 124, v56);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "minute") < 30;
      v26 = (void *)MEMORY[0x1E0C99D68];
      v27 = objc_msgSend(v24, "minute");
      v28 = 60;
      if (v25)
        v28 = 30;
      objc_msgSend(v26, "dateWithTimeInterval:sinceDate:", v56, (double)(60 * (v28 - v27)));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      pp_quicktype_log_handle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v73 = 138412290;
        *(_QWORD *)&v73[4] = v29;
        _os_log_debug_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: free start: %@", v73, 0xCu);
      }

      if (objc_msgSend(v29, "compare:", v19) != 1)
      {
        pp_quicktype_log_handle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v73 = 138412546;
          *(_QWORD *)&v73[4] = v29;
          *(_WORD *)&v73[12] = 2112;
          *(_QWORD *)&v73[14] = v19;
          _os_log_debug_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: initial free added: %@-%@", v73, 0x16u);
        }

        -[PPQuickTypeEventsServant _unscheduledFreeTimeEventFrom:to:](a1, v29, v19);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v32);

      }
    }
    *(_QWORD *)v73 = 0;
    *(_QWORD *)&v73[8] = v73;
    *(_QWORD *)&v73[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__6301;
    v75 = __Block_byref_object_dispose__6302;
    v53 = v19;
    v76 = v53;
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __72__PPQuickTypeEventsServant__freeEventsAndGapsFromEvents_explanationSet___block_invoke;
    v62[3] = &unk_1E7E17D78;
    v65 = v73;
    v33 = v57;
    v63 = v33;
    v64 = a1;
    objc_msgSend(v5, "enumerateRangesWithOptions:usingBlock:", 0, v62);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v34 = v6;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v59 != v36)
            objc_enumerationMutation(v34);
          v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          if (objc_msgSend(v38, "availability") == 1
            && !-[PPQuickTypeEventsServant _shouldTreatAsUnscheduledFreeTime:](v38))
          {
            objc_msgSend(v38, "startDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "timeIntervalSinceReferenceDate");
            v41 = v40;

            objc_msgSend(v38, "endDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "startDate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "timeIntervalSinceDate:", v43);
            v45 = v44;

            if ((objc_msgSend(v5, "intersectsIndexesInRange:", (unint64_t)v41, (unint64_t)v45) & 1) == 0)
            {
              pp_quicktype_log_handle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v71 = v38;
                _os_log_debug_impl(&dword_1C392E000, v46, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: adding free event: %@", buf, 0xCu);
              }

              objc_msgSend(v33, "addObject:", v38);
            }
          }
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v35);
    }

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", *(_QWORD *)(*(_QWORD *)&v73[8] + 40), 86400.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "startOfDayForDate:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPQuickTypeEventsServant _unscheduledFreeTimeEventFrom:to:](a1, *(void **)(*(_QWORD *)&v73[8] + 40), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v50);

    if (!objc_msgSend(v33, "count"))
      objc_msgSend(v54, "push:", 22);
    objc_msgSend(v33, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
    v51 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v73, 8);
  }
  else
  {
    v51 = v57;
  }

  return v51;
}

- (id)_busyEventsFromEvents:(void *)a1 people:(void *)a2 explanationSet:(void *)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  id v58;
  char v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *context;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[16];
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
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v9 = v5;
  v70 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
  if (!v70)
  {

    v56 = 23;
LABEL_68:
    objc_msgSend(v7, "push:", v56);
    goto LABEL_69;
  }
  v58 = v7;
  v59 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v79;
  v62 = v8;
  v63 = v6;
  v60 = *(_QWORD *)v79;
  v61 = v9;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v79 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v12);
      objc_msgSend(v13, "startDate", v58);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      v16 = v15;

      if (v16 < -600.0
        || objc_msgSend(v13, "availability") == 1
        || -[PPQuickTypeEventsServant _shouldTreatAsUnscheduledFreeTime:](v13))
      {
        goto LABEL_59;
      }
      if (!v6 || !objc_msgSend(v6, "count"))
        goto LABEL_57;
      v64 = v13;
      objc_msgSend(v13, "attendees");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v6;
      v69 = v17;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v19 = v18;
      v67 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      v68 = v19;
      if (!v67)
        goto LABEL_50;
      v65 = *(_QWORD *)v96;
      v66 = v12;
      while (2)
      {
        v20 = 0;
        while (2)
        {
          if (*(_QWORD *)v96 != v65)
            objc_enumerationMutation(v19);
          v73 = v20;
          v21 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v20);
          v74 = (void *)MEMORY[0x1C3BD6630]();
          v22 = (void *)objc_opt_new();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "contact");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedFullName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v22, "addObject:", v24);
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            objc_msgSend(v23, "emailAddresses");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v92;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v92 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "value");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "addObject:", v30);

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
              }
              while (v27);
            }

          }
          else
          {
            objc_msgSend(v22, "addObject:", v21);
          }
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v31 = v69;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
          if (!v32)
          {
LABEL_53:

            pp_quicktype_log_handle();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v54, OS_LOG_TYPE_INFO, "one or more person of interest not found in attendees", buf, 2u);
            }

            objc_autoreleasePoolPop(v74);
            v52 = 0;
            v53 = v68;
            v51 = v68;
            v8 = v62;
            v6 = v63;
            v11 = v60;
            v9 = v61;
            v12 = v66;
            goto LABEL_56;
          }
          v33 = v32;
          v34 = *(_QWORD *)v88;
          v75 = v31;
          v71 = *(_QWORD *)v88;
LABEL_30:
          v35 = 0;
          v72 = v33;
          while (1)
          {
            if (*(_QWORD *)v88 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v35);
            v37 = (void *)MEMORY[0x1C3BD6630]();
            if (objc_msgSend(v36, "status") == 3)
              goto LABEL_45;
            context = v37;
            objc_msgSend(v36, "url");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "absoluteString");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "lowercaseString");
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "emailAddress");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lowercaseString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v43 = v22;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
            if (v44)
              break;
LABEL_44:

            v33 = v72;
            v37 = context;
LABEL_45:
            objc_autoreleasePoolPop(v37);
            if (++v35 == v33)
            {
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
              if (v33)
                goto LABEL_30;
              goto LABEL_53;
            }
          }
          v45 = v44;
          v46 = *(_QWORD *)v84;
LABEL_36:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v84 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v47);
            v49 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v48, "lowercaseString");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v40, "containsString:", v50) & 1) != 0
              || (objc_msgSend(v42, "containsString:", v50) & 1) != 0
              || objc_msgSend(v77, "containsString:", v50))
            {
              break;
            }

            objc_autoreleasePoolPop(v49);
            if (v45 == ++v47)
            {
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
              v31 = v75;
              v34 = v71;
              if (v45)
                goto LABEL_36;
              goto LABEL_44;
            }
          }

          objc_autoreleasePoolPop(v49);
          objc_autoreleasePoolPop(context);

          objc_autoreleasePoolPop(v74);
          v20 = v73 + 1;
          v12 = v66;
          v19 = v68;
          if (v73 + 1 != v67)
            continue;
          break;
        }
        v67 = -[NSObject countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
        if (v67)
          continue;
        break;
      }
LABEL_50:

      pp_quicktype_log_handle();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = 1;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v51, OS_LOG_TYPE_INFO, "all people of interest found in attendees", buf, 2u);
      }
      v8 = v62;
      v6 = v63;
      v11 = v60;
      v9 = v61;
      v53 = v68;
LABEL_56:

      v13 = v64;
      if (v52)
LABEL_57:
        objc_msgSend(v8, "addObject:", v13);
      else
        v59 = 1;
      v10 = 1;
LABEL_59:
      ++v12;
    }
    while (v12 != v70);
    v55 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
    v70 = v55;
  }
  while (v55);

  if ((v10 & 1) == 0)
  {
    v56 = 23;
    v7 = v58;
    goto LABEL_68;
  }
  v7 = v58;
  if (((objc_msgSend(v6, "count") != 0) & v59) == 1)
  {
    v56 = 21;
    goto LABEL_68;
  }
LABEL_69:

  return v8;
}

- (BOOL)_shouldTreatAsUnscheduledFreeTime:(void *)a1
{
  id v1;
  _BOOL8 v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  unint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "availability") == 1 && (objc_msgSend(v1, "organizerIsCurrentUser") & 1) == 0)
  {
    v3 = v1;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "attendees");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          pp_quicktype_log_handle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v19 = (unint64_t)v9;
            _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "isFreeTime: attendee: %@", buf, 0xCu);
          }

          if (objc_msgSend(v9, "isCurrentUser"))
          {
            pp_quicktype_log_handle();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              v13 = objc_msgSend(v9, "status");
              *(_DWORD *)buf = 134217984;
              v19 = v13;
              _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "isFreeTime: is current user, status: %ld", buf, 0xCu);
            }

            v2 = objc_msgSend(v9, "status") != 255;
            goto LABEL_18;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
    v2 = 0;
LABEL_18:

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_unscheduledFreeTimeEventFrom:(void *)a3 to:
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D70B30];
    v5 = a3;
    v6 = a2;
    v7 = [v4 alloc];
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PP-FT-%@-%@"), v6, v5);
    objc_msgSend(MEMORY[0x1E0CAA0C0], "temporaryObjectIDWithEntityType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70AD8]), "initWithCalendarIdentifier:title:color:", CFSTR("PP-FT"), CFSTR("PP-FT"), 0);
    LOBYTE(v15) = 0;
    LOBYTE(v14) = 3;
    LOBYTE(v13) = 1;
    v11 = (void *)objc_msgSend(v7, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURI:attendees:organizerName:eventFlags:notes:url:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v8, v9, &stru_1E7E221D0, &stru_1E7E221D0, v10, v6, v5, v13, 0, MEMORY[0x1E0C9AA60], &stru_1E7E221D0, v14, 0, 0, 0,
                    0,
                    0,
                    v15);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __72__PPQuickTypeEventsServant__freeEventsAndGapsFromEvents_explanationSet___block_invoke(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(a2 + a3));
  v7 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "compare:", v6) == -1)
  {
    pp_quicktype_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "freeEventsAndGapsFromEvents: adding free block: %@-%@", (uint8_t *)&v14, 0x16u);
    }

    v9 = (void *)a1[4];
    -[PPQuickTypeEventsServant _unscheduledFreeTimeEventFrom:to:](a1[5], *(void **)(*(_QWORD *)(a1[6] + 8) + 40), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v7;

}

@end
