@implementation PGMemoryTriggerUpcomingCalendarEvent

- (PGMemoryTriggerUpcomingCalendarEvent)initWithServiceManager:(id)a3 locationCache:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  PGMemoryTriggerUpcomingCalendarEvent *v11;
  PGMemoryTriggerUpcomingCalendarEvent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGMemoryTriggerUpcomingCalendarEvent;
  v11 = -[PGMemoryTrigger initWithLoggingConnection:](&v14, sel_initWithLoggingConnection_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceManager, a3);
    objc_storeStrong((id *)&v12->_locationCache, a4);
  }

  return v12;
}

- (unint64_t)triggerType
{
  return 26;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  double v64;
  uint64_t j;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t k;
  void *v100;
  void *v101;
  PGGraphMemoryNodeCollection *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  PGMemoryTriggerUpcomingCalendarEvent *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[4];
  id v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  _QWORD v153[4];
  id v154;
  id v155;
  BOOL v156;
  BOOL v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  double v162;
  double v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint8_t v172[128];
  _BYTE buf[22];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _QWORD v177[5];

  v177[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v140 = v9;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 47;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Memories/MemoryTriggers/PGMemoryTriggerUpcomingCalendarEvent.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "localDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v139 = v8;
    objc_msgSend(v8, "timeZone");
    v13 = objc_claimAutoreleasedReturnValue();
    v120 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0D4B130], "startOfDayForDate:", v12);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0D4B130], "universalDateFromLocalDate:inTimeZone:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingTimeInterval:", 86400.0);
    v15 = objc_claimAutoreleasedReturnValue();
    v118 = v14;
    objc_msgSend(v14, "dateByAddingTimeInterval:", 345600.0);
    v16 = objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, v9);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = (void *)MEMORY[0x1E0D4B198];
    v116 = (void *)v16;
    v117 = (void *)v15;
    v177[0] = v15;
    v177[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clueWithDates:serviceManager:", v18, self->_serviceManager);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v115 = v19;
    objc_msgSend(v19, "events");
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v168, v176, 16);
    v124 = v20;
    v125 = v10;
    v142 = self;
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v169;
      v24 = *MEMORY[0x1E0C9E490];
      v25 = *MEMORY[0x1E0C9E4A8] + *MEMORY[0x1E0C9E4A8];
      v122 = *(_QWORD *)v169;
      while (2)
      {
        v26 = 0;
        v123 = v22;
        do
        {
          if (*(_QWORD *)v169 != v23)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v26);
          v28 = (void *)MEMORY[0x1CAA4EB2C]();
          if (objc_msgSend(v10, "isCancelledWithProgress:", 0.5))
          {
            v8 = v139;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 64;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/MemoryTriggers/PGMemoryTriggerUpcomingCalendarEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            objc_autoreleasePoolPop(v28);
            v11 = (void *)MEMORY[0x1E0C9AA60];
            v113 = v20;
            goto LABEL_77;
          }
          if ((objc_msgSend(v27, "hasMeetingRoom") & 1) == 0)
          {
            v136 = v28;
            objc_msgSend(v27, "endDate");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "objectForKeyedSubscript:", v29);
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              v30 = objc_alloc_init(MEMORY[0x1E0D429B0]);
              objc_msgSend(v128, "setObject:forKeyedSubscript:", v30, v29);
            }
            v134 = (void *)v29;
            v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v27, "attendees");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "valueForKey:", CFSTR("name"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            v135 = v26;
            v133 = v30;
            if (v33)
              v35 = v33;
            else
              v35 = objc_alloc_init(MEMORY[0x1E0C99E60]);
            v36 = v35;

            v37 = (void *)MEMORY[0x1E0D4B190];
            v132 = v36;
            objc_msgSend(v36, "allObjects");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "cluesWithPeoples:serviceManager:", v38, self->_serviceManager);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v166 = 0u;
            v167 = 0u;
            v164 = 0u;
            v165 = 0u;
            v40 = v39;
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v164, v175, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v165;
              do
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v165 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
                  objc_msgSend(v45, "prepareIfNeeded");
                  objc_msgSend(v45, "person");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v46;
                  if (v46 && (objc_msgSend(v46, "isMe") & 1) == 0)
                  {
                    objc_msgSend(v47, "CNIdentifier");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v48)
                    {
                      objc_msgSend(v31, "addObject:", v48);
                    }
                    else
                    {
                      -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
                      v49 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v45, "name");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138477827;
                        *(_QWORD *)&buf[4] = v50;
                        _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_INFO, "[PGMemoryTriggerUpcomingCalendarEvent] person.CNIdentifier found to be nil for person %{private}@", buf, 0xCu);

                      }
                      self = v142;
                    }

                  }
                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v164, v175, 16);
              }
              while (v42);
            }

            +[PGGraphPersonNodeCollection personNodesForContactIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForContactIdentifiers:inGraph:", v31, v140);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "momentNodes");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "memoryNodes");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "collectionByIntersecting:", v127);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "elementIdentifiers");
            v131 = (void *)objc_claimAutoreleasedReturnValue();

            v129 = objc_alloc_init(MEMORY[0x1E0D429B0]);
            v163 = 0.0;
            v162 = 0.0;
            objc_msgSend(v27, "location");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "coordinate");
            v162 = v56;
            v163 = v57;

            -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self->_locationCache, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", v162, v163, v24, v25);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = v58;
            if (objc_msgSend(v58, "count"))
            {
              v126 = v51;
              v160 = 0u;
              v161 = 0u;
              v158 = 0u;
              v159 = 0u;
              v59 = v58;
              v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
              if (v60)
              {
                v61 = v60;
                v62 = 0;
                v63 = *(_QWORD *)v159;
                v64 = 1.79769313e308;
                do
                {
                  for (j = 0; j != v61; ++j)
                  {
                    if (*(_QWORD *)v159 != v63)
                      objc_enumerationMutation(v59);
                    v66 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * j);
                    *(_QWORD *)&buf[8] = 0;
                    *(_QWORD *)buf = 0;
                    objc_msgSend(v66, "location");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "coordinate");
                    *(_QWORD *)buf = v68;
                    *(_QWORD *)&buf[8] = v69;

                    CLLocationCoordinate2DGetDistanceFrom();
                    if (v70 < v64)
                    {
                      v71 = v70;
                      v72 = v66;

                      v64 = v71;
                      v62 = v72;
                    }
                  }
                  v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
                }
                while (v61);
              }
              else
              {
                v62 = 0;
                v64 = 1.79769313e308;
              }

              -[NSObject locality](v62, "locality");
              v75 = (void *)objc_claimAutoreleasedReturnValue();

              if (v75)
              {
                -[NSObject locality](v62, "locality");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                +[PGGraphNamedLocationNodeCollection locationNodeWithName:inGraph:](PGGraphLocationCityNodeCollection, "locationNodeWithName:inGraph:", v76, v140);
                v77 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSObject administrativeArea](v62, "administrativeArea");
                v78 = (void *)objc_claimAutoreleasedReturnValue();

                if (v78)
                {
                  -[NSObject administrativeArea](v62, "administrativeArea");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGGraphNamedLocationNodeCollection locationNodeWithName:inGraph:](PGGraphLocationStateNodeCollection, "locationNodeWithName:inGraph:", v79, v140);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();

                }
                -[NSObject ISOcountryCode](v62, "ISOcountryCode");
                v80 = (void *)objc_claimAutoreleasedReturnValue();

                if (v80)
                {
                  -[NSObject ISOcountryCode](v62, "ISOcountryCode");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGGraphNamedLocationNodeCollection locationNodeWithName:inGraph:](PGGraphLocationCountryNodeCollection, "locationNodeWithName:inGraph:", v81, v140);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v82 = MEMORY[0x1E0C809B0];
                v153[0] = MEMORY[0x1E0C809B0];
                v153[1] = 3221225472;
                v153[2] = __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
                v153[3] = &unk_1E8433CC0;
                v156 = v78 != 0;
                v157 = v80 != 0;
                v154 = v78;
                v155 = v80;
                v121 = v78;
                v83 = v80;
                objc_msgSend(v77, "filteredCollectionUsingBlock:", v153);
                v84 = objc_claimAutoreleasedReturnValue();
                v85 = v77;
                v86 = v84;

                -[NSObject momentNodes](v86, "momentNodes");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject location](v62, "location");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "coordinate");
                v90 = v89;
                v92 = v91;

                v147[0] = v82;
                v147[1] = 3221225472;
                v147[2] = __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
                v147[3] = &unk_1E8433D10;
                v150 = v90;
                v151 = v92;
                v152 = v64;
                v74 = v129;
                v148 = v129;
                v149 = v127;
                objc_msgSend(v87, "enumerateIdentifiersAsCollectionsWithBlock:", v147);

                v10 = v125;
              }
              else
              {
                -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
                v86 = objc_claimAutoreleasedReturnValue();
                v10 = v125;
                if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134283777;
                  *(double *)&buf[4] = v162;
                  *(_WORD *)&buf[12] = 2049;
                  *(double *)&buf[14] = v163;
                  _os_log_impl(&dword_1CA237000, v86, OS_LOG_TYPE_INFO, "[PGMemoryTriggerUpcomingCalendarEvent] closestPlacemark.locality is nil, not going to try matching location for event coordinate (%{private}f, %{private}f)", buf, 0x16u);
                }
                v74 = v129;
              }

              v26 = v135;
              v73 = v133;
              v51 = v126;
            }
            else
            {
              -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
              v62 = objc_claimAutoreleasedReturnValue();
              v10 = v125;
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134283777;
                *(double *)&buf[4] = v162;
                *(_WORD *)&buf[12] = 2049;
                *(double *)&buf[14] = v163;
                _os_log_impl(&dword_1CA237000, v62, OS_LOG_TYPE_INFO, "[PGMemoryTriggerUpcomingCalendarEvent] No placemarks found matching event coordinate (%{private}f, %{private}f)", buf, 0x16u);
              }
              v26 = v135;
              v73 = v133;
              v74 = v129;
            }

            objc_msgSend(v131, "identifierSetByIntersectingIdentifierSet:", v74);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v93, "count");
            v95 = v93;
            if (!v94)
            {
              objc_msgSend(v73, "unionWithIdentifierSet:", v131);
              v95 = v74;
            }
            objc_msgSend(v73, "unionWithIdentifierSet:", v95);

            v22 = v123;
            v20 = v124;
            v23 = v122;
            v28 = v136;
          }
          objc_autoreleasePoolPop(v28);
          ++v26;
        }
        while (v26 != v22);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v168, v176, 16);
        if (v22)
          continue;
        break;
      }
    }

    v141 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v96 = v128;
    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v143, v172, 16);
    if (v97)
    {
      v98 = v97;
      v137 = *(_QWORD *)v144;
      do
      {
        for (k = 0; k != v98; ++k)
        {
          if (*(_QWORD *)v144 != v137)
            objc_enumerationMutation(v96);
          v100 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
          objc_msgSend(v96, "objectForKeyedSubscript:", v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:elementIdentifiers:", v140, v101);
          v103 = (void *)MEMORY[0x1E0D4B130];
          objc_msgSend(v100, "dateByAddingTimeInterval:", -259200.0);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "localDateFromUniversalDate:inTimeZone:", v104, v138);
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          v106 = (void *)MEMORY[0x1E0D4B130];
          objc_msgSend(v100, "dateByAddingTimeInterval:", -86400.0);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "localDateFromUniversalDate:inTimeZone:", v107, v138);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = (void *)objc_opt_class();
          objc_msgSend(v139, "timeZone");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v105, v108, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v102, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "addObjectsFromArray:", v112);

        }
        v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v143, v172, 16);
      }
      while (v98);
    }

    v10 = v125;
    if (objc_msgSend(v125, "isCancelledWithProgress:", 1.0))
    {
      v20 = v124;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 178;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/MemoryTriggers/PGMemoryTriggerUpcomingCalendarEvent.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
      v8 = v139;
      v113 = v141;
    }
    else
    {
      v113 = v141;
      v11 = v113;
      v8 = v139;
      v20 = v124;
    }
LABEL_77:

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

uint64_t __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "stateNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intersectsCollection:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v4, "countryNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intersectsCollection:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v8 = 1;
  }

  return v6 & v8;
}

void __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;

  v7 = a3;
  objc_msgSend(v7, "cityNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
  {
    objc_msgSend(v7, "addressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_3;
    v8[3] = &unk_1E8433CE8;
    v12 = *(_OWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 64);
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "enumerateIdentifiersAsCollectionsWithBlock:", v8);

  }
}

void __93__PGMemoryTriggerUpcomingCalendarEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "centroidCoordinate");
  v13 = v6;
  v14 = v7;
  CLLocationCoordinate2DGetDistanceFrom();
  if (v8 <= *(double *)(a1 + 72) + 0.01)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "memoryNodes", v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionByIntersecting:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elementIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionWithIdentifierSet:", v12);

    *a4 = 1;
  }
}

@end
