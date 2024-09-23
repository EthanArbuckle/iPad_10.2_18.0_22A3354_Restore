@implementation PPConnectionsDuetSource

- (id)identifier
{
  return CFSTR("duet");
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  uint64_t v9;

  LOWORD(v9) = 256;
  return -[PPConnectionsDuetSource locationItemsWithCriteria:earliest:latest:limit:duetLimit:consumer:richLocationItems:resolveEKLocations:explanationSet:](self, "locationItemsWithCriteria:earliest:latest:limit:duetLimit:consumer:richLocationItems:resolveEKLocations:explanationSet:", a3, a4, a5, a6, 10, a7, v9, a8);
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 duetLimit:(int64_t)a7 consumer:(unint64_t)a8 richLocationItems:(BOOL)a9 resolveEKLocations:(BOOL)a10 explanationSet:(id)a11
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  void *v41;
  char isKindOfClass;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  _UNKNOWN **v75;
  void *v76;
  void *v77;
  NSObject *v78;
  int v79;
  NSObject *v80;
  NSObject *v81;
  const char *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
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
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  _BOOL4 v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  const char *v126;
  NSObject *v127;
  uint32_t v128;
  void *v130;
  id v131;
  id v132;
  uint64_t v133;
  void *v134;
  void *v135;
  id v136;
  id v138;
  id v139;
  uint64_t v140;
  void *v141;
  void *v142;
  PPConnectionsDuetSource *v143;
  void *v144;
  void *v145;
  void *v146;
  void *context;
  void *contexta;
  _BOOL4 v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id obj;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint8_t buf[4];
  uint64_t v162;
  __int16 v163;
  void *v164;
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v139 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a11;
  v18 = (void *)MEMORY[0x1C3BD6630]();
  v19 = (void *)objc_opt_new();
  v143 = self;
  v144 = v17;
  -[PPConnectionsDuetSource duetLocationUserActivitiesWithLimit:afterDate:explanationSet:](self, "duetLocationUserActivitiesWithLimit:afterDate:explanationSet:", a7, v15, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    pp_connections_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v126 = "PPConnectionsDuetSource: duetLocationUserActivitiesWithLimit timed out";
      v127 = v25;
      v128 = 2;
LABEL_105:
      _os_log_impl(&dword_1C392E000, v127, OS_LOG_TYPE_DEFAULT, v126, buf, v128);
    }
LABEL_106:
    v125 = 0;
    goto LABEL_111;
  }
  if (!objc_msgSend(v20, "count"))
  {
    objc_msgSend(v144, "push:", 27);
    pp_connections_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v162 = (uint64_t)v15;
      v126 = "PPConnectionsDuetSource: no activities found in Duet after date %@";
      v127 = v25;
      v128 = 12;
      goto LABEL_105;
    }
    goto LABEL_106;
  }
  v134 = v21;
  -[PPConnectionsDuetSource supportedLocationFields](self, "supportedLocationFields");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v139, "locationField"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "containsObject:", v23);

  if ((v24 & 1) != 0)
  {
    v135 = v19;
    v130 = v18;
    v131 = v16;
    objc_msgSend(v139, "bundleIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    v132 = v15;
    v26 = v15;
    v150 = (void *)objc_opt_new();
    pp_connections_log_handle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v162 = objc_msgSend(v134, "count");
      _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: got %tu activities from Duet", buf, 0xCu);
    }

    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    obj = v134;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v165, 16);
    if (v28)
    {
      v29 = v28;
      v156 = *(_QWORD *)v158;
      v133 = *MEMORY[0x1E0D70E68];
      v138 = v26;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v158 != v156)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v30);
          v32 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v31, "value");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          pp_connections_log_handle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v31, "startDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v162 = (uint64_t)v34;
            v163 = 2112;
            v164 = v36;
            _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: processing activity from bundle %@ at time %@", buf, 0x16u);

          }
          if (v25 && objc_msgSend(v34, "isEqualToString:", v25))
          {
            pp_connections_log_handle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v162 = (uint64_t)v25;
              v38 = v37;
              v39 = "PPConnectionsDuetSource: skipping activity since it came from the requesting bundle (%@)";
              v40 = 12;
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          objc_msgSend(v31, "value");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            pp_connections_log_handle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
            *(_WORD *)buf = 0;
            v38 = v37;
            v39 = "PPConnectionsDuetSource: skipping activity since the value is not a _DKIdentifier";
            goto LABEL_23;
          }
          if (objc_msgSend(v34, "isEqualToString:", CFSTR("unknown")))
          {
            pp_connections_log_handle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
LABEL_20:
            *(_WORD *)buf = 0;
            v38 = v37;
            v39 = "PPConnectionsDuetSource: skipping activity since the bundleId is unknown";
LABEL_23:
            v40 = 2;
LABEL_24:
            _os_log_impl(&dword_1C392E000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, v40);
LABEL_25:

LABEL_26:
            objc_autoreleasePoolPop(v32);
            goto LABEL_27;
          }
          objc_msgSend(v31, "startDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "compare:", v26);

          if (v44 == -1)
          {
            pp_connections_log_handle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v47, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: skipping activity since it is before the cutoff time", buf, 2u);
            }

            objc_msgSend(v144, "push:", 5);
            goto LABEL_26;
          }
          objc_msgSend(v31, "startDate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "compare:", v150);

          if (v46 == 1)
          {
            pp_connections_log_handle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
            goto LABEL_20;
          }
          objc_msgSend(v31, "metadata");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15998], "activityType");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", v49);
          v153 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "metadata");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15A60], "locationName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", v51);
          v154 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "metadata");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15A60], "fullyFormattedAddress");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", v53);
          v152 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "metadata");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", v55);
          v151 = (void *)objc_claimAutoreleasedReturnValue();

          v149 = -[PPConnectionsDuetSource testMetadataForValidAddressAndNameWithEvent:](v143, "testMetadataForValidAddressAndNameWithEvent:", v31);
          if (a10)
          {
            +[PPConnectionsUtils calendarUserActivityIdentifier](PPConnectionsUtils, "calendarUserActivityIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v153, "isEqualToString:", v56);

            if (v57)
            {
              if (v154)
              {
                +[PPConnectionsCalendarSource sharedInstance](PPConnectionsCalendarSource, "sharedInstance");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "metadata");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPConnectionsUtils calendarUserActivityExternalIDKey](PPConnectionsUtils, "calendarUserActivityExternalIDKey");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "objectForKeyedSubscript:", v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v142 = v58;
                objc_msgSend(v58, "ekEventWithExternalID:", v61);
                v62 = objc_claimAutoreleasedReturnValue();

                v63 = (void *)v62;
                if (!v62)
                {
                  pp_connections_log_handle();
                  v78 = objc_claimAutoreleasedReturnValue();
                  v26 = v138;
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C392E000, v78, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: skipping activity since the calendar event could not be loaded", buf, 2u);
                  }

                  v79 = 3;
                  goto LABEL_92;
                }
                v64 = objc_alloc(MEMORY[0x1E0D70B30]);
                v65 = (void *)objc_opt_new();
                v66 = (void *)objc_msgSend(v64, "initWithEKEvent:calendarInternPool:", v62, v65);

                if (!v66)
                {
                  pp_connections_log_handle();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    v81 = v80;
                    v82 = "PPConnectionsDuetSource: skipping activity since PPEvent conversion failed.";
                    goto LABEL_62;
                  }
LABEL_63:

                  v79 = 3;
                  v26 = v138;
                  v77 = v142;
                  goto LABEL_93;
                }
                if ((objc_msgSend(v142, "isCalendarEventEligibleForLocationPrediction:", v66) & 1) == 0)
                {
                  pp_connections_log_handle();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    v81 = v80;
                    v82 = "PPConnectionsDuetSource: skipping activity since the calendar event is not eligible for prediction";
LABEL_62:
                    _os_log_impl(&dword_1C392E000, v81, OS_LOG_TYPE_DEFAULT, v82, buf, 2u);
                  }
                  goto LABEL_63;
                }
                +[PPConnectionsCalendarSource locationNameFromEvent:](PPConnectionsCalendarSource, "locationNameFromEvent:", v66);
                v136 = (id)objc_claimAutoreleasedReturnValue();
                +[PPConnectionsCalendarSource locationLabelFromEvent:](PPConnectionsCalendarSource, "locationLabelFromEvent:", v66);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPConnectionsCalendarSource locationValueFromEvent:](PPConnectionsCalendarSource, "locationValueFromEvent:", v66);
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                context = 0;
                v145 = 0;
                v68 = v63;
                v26 = v138;
LABEL_73:

                v77 = v136;
                v87 = v142;
                goto LABEL_74;
              }
            }
          }
          if (v149
            && -[PPConnectionsDuetSource isDuetEventAuthorized:bundleID:](v143, "isDuetEventAuthorized:bundleID:", v31, v34))
          {
            +[PPConnectionsAddressFormatter postalAddressFromDuetEvent:](PPConnectionsAddressFormatter, "postalAddressFromDuetEvent:", v31);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            PPCollapseWhitespaceAndStrip();
            v136 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v139, "locationField") != 1)
              goto LABEL_66;
            if (!v152)
              goto LABEL_66;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_66;
            v69 = (void *)MEMORY[0x1C3BD6630]();
            -[PPConnectionsDuetSource whitespaceAndNewlineCharacterSet](v143, "whitespaceAndNewlineCharacterSet");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "stringByTrimmingCharactersInSet:", v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v69);
            if (objc_msgSend(v71, "length"))
            {
              if (v151)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  contexta = (void *)MEMORY[0x1C3BD6630]();
                  -[PPConnectionsDuetSource whitespaceAndNewlineCharacterSet](v143, "whitespaceAndNewlineCharacterSet");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "stringByTrimmingCharactersInSet:", v72);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_autoreleasePoolPop(contexta);
                  if (objc_msgSend(v73, "length"))
                  {
                    v74 = objc_msgSend(v152, "containsString:", v151);

                    if (v74)
                    {
                      PPCollapseWhitespaceAndStrip();
                      v140 = objc_claimAutoreleasedReturnValue();
                      v75 = &off_1E7E12000;
                      v76 = v142;
LABEL_67:
                      objc_msgSend(v75[174], "formattedAddressWithLocationField:address:duetEvent:shortStyle:", objc_msgSend(v139, "locationField"), v76, v31, 1);
                      context = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v34, "isEqualToString:", v133))
                      {
                        objc_msgSend(v31, "metadata");
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0D15A60], "URL");
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v83, "objectForKeyedSubscript:", v84);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        PPCollapseWhitespaceAndStrip();
                        v86 = objc_claimAutoreleasedReturnValue();

                        if (v86)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v86);
                          v145 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v145 = 0;
                        }
                        v146 = v136;
                        v68 = (void *)v86;
                        v26 = v138;
                        v67 = (void *)v140;
                        goto LABEL_73;
                      }
                      v87 = v76;
                      v77 = v136;
                      v145 = 0;
                      v146 = v136;
                      v26 = v138;
                      v67 = (void *)v140;
LABEL_74:

                      goto LABEL_75;
                    }
LABEL_66:
                    v75 = &off_1E7E12000;
                    v76 = v142;
                    +[PPConnectionsAddressFormatter formattedAddressWithLocationField:address:duetEvent:shortStyle:](PPConnectionsAddressFormatter, "formattedAddressWithLocationField:address:duetEvent:shortStyle:", objc_msgSend(v139, "locationField"), v142, v31, 0);
                    v140 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_67;
                  }

                }
              }
            }

            goto LABEL_66;
          }
          v77 = 0;
          v146 = 0;
          context = 0;
          v67 = 0;
          v145 = 0;
LABEL_75:
          if (objc_msgSend(v67, "length"))
          {
            v141 = v67;
            if (objc_msgSend(v77, "length"))
            {
              v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70AF0]), "initWithOriginatingBundleID:", v34);
              v142 = v77;
              objc_msgSend(v88, "setName:", v77);
              if (v146)
              {
                objc_msgSend(v88, "setLabel:");
              }
              else
              {
                objc_msgSend(v88, "name");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setLabel:", v92);

              }
              objc_msgSend(v88, "setValue:", v141);
              objc_msgSend(v88, "setShortValue:", context);
              objc_msgSend(v88, "setOriginatingWebsiteURL:", v145);
              objc_msgSend(v88, "setShouldAggregate:", 0);
              objc_msgSend(v31, "startDate");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setCreatedAt:", v93);

              +[PPConnectionsMetricsTracker donationSourceFromBundleID:](PPConnectionsMetricsTracker, "donationSourceFromBundleID:", v34);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setSource:", v94);

              v95 = (void *)MEMORY[0x1E0CB37E8];
              +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "userActivityExpirySeconds");
              objc_msgSend(v95, "numberWithDouble:");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setLifetime:", v97);

              if (a9 && v149)
              {
                objc_msgSend(v88, "setFullFormattedAddress:", v152);
                objc_msgSend(v31, "metadata");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "subThoroughfare");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "objectForKeyedSubscript:", v99);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setSubThoroughfare:", v100);

                objc_msgSend(v88, "setThoroughfare:", v151);
                objc_msgSend(v31, "metadata");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "objectForKeyedSubscript:", v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setPostalCode:", v103);

                objc_msgSend(v31, "metadata");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "city");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "objectForKeyedSubscript:", v105);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setLocality:", v106);

                objc_msgSend(v31, "metadata");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "stateOrProvince");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "objectForKeyedSubscript:", v108);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setAdministrativeArea:", v109);

                objc_msgSend(v31, "metadata");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "country");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "objectForKeyedSubscript:", v111);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setCountry:", v112);

                objc_msgSend(v31, "metadata");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "latitude");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "objectForKeyedSubscript:", v114);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setLatitude:", v115);

                objc_msgSend(v31, "metadata");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A60], "longitude");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "objectForKeyedSubscript:", v117);
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setLongitude:", v118);

              }
              pp_private_log_handle();
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v88, "name");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "value");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v162 = (uint64_t)v121;
                v163 = 2112;
                v164 = v122;
                _os_log_debug_impl(&dword_1C392E000, v119, OS_LOG_TYPE_DEBUG, "PPConnectionsDuetSource: sourced connection: %@: %@", buf, 0x16u);

              }
              objc_msgSend(v135, "addObject:", v88);
              v120 = objc_msgSend(v135, "count") == a6;

              v79 = 2 * v120;
              v26 = v138;
LABEL_92:
              v77 = v142;
              goto LABEL_93;
            }
            pp_connections_log_handle();
            v91 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v91, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: ignoring location from Duet due to missing name", buf, 2u);
            }

          }
          else
          {
            v89 = v67;
            pp_connections_log_handle();
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v90, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: ignoring location from Duet due to missing value", buf, 2u);
            }

          }
          v79 = 3;
LABEL_93:

          objc_autoreleasePoolPop(v32);
          if (v79 != 3 && v79)
            goto LABEL_97;
LABEL_27:
          ++v30;
        }
        while (v29 != v30);
        v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v165, 16);
        v29 = v123;
      }
      while (v123);
    }
LABEL_97:

    v19 = v135;
    if (objc_msgSend(v135, "count"))
      v124 = v135;
    else
      v124 = 0;
    v125 = v124;

    v16 = v131;
    v15 = v132;
    v18 = v130;
  }
  else
  {
    pp_connections_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v162) = objc_msgSend(v139, "locationField");
      _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: supportedLocationFields does not contain field %d", buf, 8u);
    }
    v125 = 0;
  }
  v21 = v134;
LABEL_111:

  objc_autoreleasePoolPop(v18);
  return v125;
}

- (id)supportedLocationFields
{
  if (supportedLocationFields_onceToken != -1)
    dispatch_once(&supportedLocationFields_onceToken, &__block_literal_global_26);
  return (id)supportedLocationFields_supportedLocationFields;
}

- (BOOL)testMetadataForValidAddressAndNameWithEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  _BOOL4 v64;
  _BOOL4 v65;
  _BOOL4 v66;
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
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
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
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  _BYTE v160[20];
  uint64_t v161;
  uint64_t v162;
  _BYTE v163[12];
  _BYTE v164[32];
  int v165;
  uint64_t v166;
  id v167;
  id v168;
  __int128 v169;

  v8 = a3;
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v167 = (id)objc_claimAutoreleasedReturnValue();
  v168 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  objc_msgSend(v8, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v11;
  objc_msgSend(v11, "objectForKeyedSubscript:");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v156 = (void *)v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v166 = 0;
    v165 = 0;
    memset(v164, 0, 29);
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_9;
  }
  v3 = MEMORY[0x1C3BD6630]();
  objc_msgSend(v8, "metadata");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsDuetSource whitespaceAndNewlineCharacterSet](self, "whitespaceAndNewlineCharacterSet");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop((void *)v3);
  v15 = v14;

  v153 = v15;
  if (!objc_msgSend(v15, "length"))
  {
    v166 = 0;
    v164[28] = 0;
    v165 = 0;
    memset(v164, 0, 24);
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    *(_DWORD *)&v164[24] = 1;
    goto LABEL_9;
  }
  objc_msgSend(v8, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "city");
  v152 = v16;
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:");
  v17 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v166) = v17 != 0;
  v150 = (void *)v17;
  if (v17)
  {
    objc_msgSend(v8, "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "city");
    v147 = v18;
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:");
    v19 = objc_claimAutoreleasedReturnValue();
    v3 = 0x1E0CB3000uLL;
    objc_opt_class();
    v145 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_82;
    }
    v20 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v8, "metadata");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "city");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPConnectionsDuetSource whitespaceAndNewlineCharacterSet](self, "whitespaceAndNewlineCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v20);
    v23 = v22;

    v139 = v23;
    v6 = 1;
    if (objc_msgSend(v23, "length"))
    {
      v4 = 0;
      goto LABEL_86;
    }
  }
  else
  {
    v6 = 0;
  }
  v3 = 0x1E0CB3000;
LABEL_82:
  objc_msgSend(v8, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
  v149 = v30;
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    LODWORD(v166) = v6;
    v155 = 0;
    memset(v164, 0, 20);
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    v164[28] = 0;
    *(_QWORD *)&v164[20] = 0x100000001;
    v165 = 1;
    goto LABEL_9;
  }
  v155 = (void *)v31;
  objc_msgSend(v8, "metadata");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
  v144 = v32;
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:");
  v33 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v142 = (void *)v33;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LODWORD(v166) = v6;
    *(_QWORD *)&v164[8] = 0;
    *(_QWORD *)v164 = 0;
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    v164[28] = 0;
    *(_QWORD *)&v164[20] = 0x100000001;
    v165 = 1;
    *(_DWORD *)&v164[16] = 1;
    goto LABEL_9;
  }
  v34 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v8, "metadata");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsDuetSource whitespaceAndNewlineCharacterSet](self, "whitespaceAndNewlineCharacterSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v34);
  v37 = v36;

  v138 = v37;
  if (!objc_msgSend(v37, "length"))
  {
    v164[28] = 0;
    *(_QWORD *)&v164[4] = 0;
    *(_DWORD *)v164 = 0;
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    *(_DWORD *)&v164[16] = 1;
    *(_QWORD *)&v164[20] = 0x100000001;
    v165 = 1;
    LODWORD(v166) = v6;
    *(_DWORD *)&v164[12] = 1;
    goto LABEL_9;
  }
  v4 = 1;
LABEL_86:
  objc_msgSend(v8, "metadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v39);
  v40 = objc_claimAutoreleasedReturnValue();
  v165 = v4;
  LODWORD(v166) = v6;
  v141 = v38;
  v140 = (void *)v39;
  if (!v40)
  {
    v154 = 0;
    *(_QWORD *)v164 = 0;
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    v164[28] = 0;
    *(_DWORD *)&v164[16] = v4;
    *(_QWORD *)&v164[20] = 0x100000001;
    *(_DWORD *)&v164[12] = v4;
    *(_DWORD *)&v164[8] = 1;
    goto LABEL_9;
  }
  v154 = (void *)v40;
  objc_msgSend(v8, "metadata");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v135 = v5;
  v137 = (void *)v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = 0;
    v162 = 0;
    memset(v163, 0, sizeof(v163));
    v25 = 0;
    v161 = 0;
    v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    v26 = 0;
    v159 = 0;
    v27 = 0;
    v28 = 0;
    v164[28] = 0;
    *(_DWORD *)&v164[16] = v4;
    *(_QWORD *)&v164[20] = 0x100000001;
    *(_DWORD *)&v164[8] = 1;
    *(_DWORD *)&v164[12] = v4;
    *(_QWORD *)v164 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v8, "metadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "locationName");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:");
  v42 = objc_claimAutoreleasedReturnValue();
  v66 = v42 != 0;
  v132 = (void *)v42;
  v134 = v41;
  if (v42)
  {
    objc_msgSend(v8, "metadata");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "locationName");
    v131 = v43;
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v129 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v162 = 0;
      memset(v163, 0, sizeof(v163));
      v25 = 0;
      v161 = 0;
      v169 = 0uLL;
      memset(v160, 0, sizeof(v160));
      v26 = 0;
      v159 = 0;
      v27 = 0;
      v28 = 0;
      *(_QWORD *)&v164[24] = 1;
      *(_DWORD *)&v164[16] = v4;
      *(_DWORD *)&v164[20] = 1;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_QWORD *)v164 = 0x100000001;
      v24 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "locationName");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v120, "length") > 0x12B)
    {
      *(_QWORD *)&v163[4] = 0;
      v25 = 0;
      v161 = 0;
      v169 = 0uLL;
      memset(v160, 0, sizeof(v160));
      v26 = 0;
      v159 = 0;
      v162 = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_QWORD *)v164 = 0x100000001;
      v24 = 1;
      *(_DWORD *)v163 = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "subThoroughfare");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v44;
  objc_msgSend(v44, "objectForKeyedSubscript:");
  v45 = objc_claimAutoreleasedReturnValue();
  v65 = v45 != 0;
  v126 = (void *)v45;
  if (v45)
  {
    objc_msgSend(v8, "metadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "subThoroughfare");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v46;
    objc_msgSend(v46, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v161 = 0;
      v169 = 0uLL;
      memset(v160, 0, sizeof(v160));
      v26 = 0;
      v159 = 0;
      v162 = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "subThoroughfare");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v111, "length") > 0x12B)
    {
      v161 = 0;
      v162 = 0;
      v169 = 0uLL;
      *(_QWORD *)v160 = 0;
      *(_QWORD *)&v160[8] = 0;
      v26 = 0;
      v159 = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = 1;
      *(_DWORD *)&v160[16] = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v47;
  objc_msgSend(v47, "objectForKeyedSubscript:");
  v48 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v169) = v48 != 0;
  v117 = (void *)v48;
  if (v48)
  {
    objc_msgSend(v8, "metadata");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v49;
    objc_msgSend(v49, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_QWORD *)v160 = 0;
      *(_QWORD *)&v160[8] = 0;
      v26 = 0;
      v159 = 0;
      *(_QWORD *)((char *)&v169 + 4) = 0;
      v161 = 0x100000000;
      v162 = 0;
      LODWORD(v169) = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      HIDWORD(v169) = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v102, "length") > 0x12B)
    {
      *(_QWORD *)&v160[8] = 0;
      v26 = 0;
      v159 = 0;
      *(_QWORD *)((char *)&v169 + 4) = 0;
      v161 = 0x100000000;
      v162 = 0;
      LODWORD(v169) = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      HIDWORD(v169) = 1;
      *(_QWORD *)v160 = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v50;
  objc_msgSend(v50, "objectForKeyedSubscript:");
  v51 = objc_claimAutoreleasedReturnValue();
  v64 = v51 != 0;
  v108 = (void *)v51;
  if (v51)
  {
    objc_msgSend(v8, "metadata");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v52;
    objc_msgSend(v52, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v159 = 0;
      *(_QWORD *)&v160[4] = 0;
      *(_QWORD *)((char *)&v169 + 4) = 0;
      v161 = 0x100000000;
      v162 = 0;
      LODWORD(v169) = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      v26 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v93, "length") > 0x12B)
    {
      *(_QWORD *)&v160[4] = 0;
      *(_QWORD *)((char *)&v169 + 4) = 0;
      v161 = 0x100000000;
      v162 = 0;
      LODWORD(v169) = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      v26 = 1;
      v159 = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "city");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v53;
  objc_msgSend(v53, "objectForKeyedSubscript:");
  v54 = objc_claimAutoreleasedReturnValue();
  DWORD2(v169) = v54 != 0;
  v99 = (void *)v54;
  if (v54)
  {
    objc_msgSend(v8, "metadata");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "city");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v55;
    objc_msgSend(v55, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v161 = 0x100000000;
      *(_QWORD *)&v169 = 0;
      *(_QWORD *)&v160[8] = 0x100000000;
      v162 = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      v26 = v64;
      v159 = v64;
      *(_DWORD *)&v160[4] = 1;
      DWORD2(v169) = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "city");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v84, "length") > 0x12B)
    {
      v161 = 0x100000000;
      *(_QWORD *)&v169 = 0;
      *(_QWORD *)&v160[8] = 0x100000000;
      v162 = 0;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      v26 = v64;
      v159 = v64 | 0x100000000;
      *(_DWORD *)&v160[4] = 1;
      DWORD2(v169) = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "stateOrProvince");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v56;
  objc_msgSend(v56, "objectForKeyedSubscript:");
  v57 = objc_claimAutoreleasedReturnValue();
  DWORD1(v169) = v57 != 0;
  v90 = (void *)v57;
  if (v57)
  {
    objc_msgSend(v8, "metadata");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "stateOrProvince");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v58;
    objc_msgSend(v58, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_QWORD *)&v160[8] = 0x100000000;
      v162 = 0;
      *(_QWORD *)&v169 = 0x100000000;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      v26 = v64;
      v159 = __PAIR64__(DWORD2(v169), v64);
      *(_DWORD *)&v160[4] = 1;
      v161 = 0x100000001;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "stateOrProvince");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v74, "length") > 0x12B)
    {
      v162 = 0;
      *(_QWORD *)&v169 = 0x100000000;
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      v26 = v64;
      v159 = __PAIR64__(DWORD2(v169), v64);
      v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_QWORD *)&v160[8] = 0x100000001;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "country");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v59 = objc_claimAutoreleasedReturnValue();
  LODWORD(v169) = v59 != 0;
  v81 = (void *)v59;
  if (v59)
  {
    objc_msgSend(v8, "metadata");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "country");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v60;
    objc_msgSend(v60, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      v26 = v64;
      v159 = __PAIR64__(DWORD2(v169), v64);
      v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      v162 = 1;
      LODWORD(v169) = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "country");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v67, "length") > 0x12B)
    {
      v27 = 0;
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      v26 = v64;
      v159 = __PAIR64__(DWORD2(v169), v64);
      v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      v162 = 0x100000001;
      LODWORD(v169) = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v8, "metadata");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "displayName");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v61;
  if (v80)
  {
    objc_msgSend(v8, "metadata");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "displayName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v62;
    objc_msgSend(v62, "objectForKeyedSubscript:");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "metadata");
      v63 = v4;
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A60], "displayName");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v4, "objectForKeyedSubscript:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v164[28] = (unint64_t)objc_msgSend(v5, "length") < 0x12C;
      *(_DWORD *)&v164[16] = v63;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v63;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)&v160[12] = 1;
      v26 = v64;
      *(_DWORD *)v160 = HIDWORD(v169);
      *(_DWORD *)&v160[4] = 1;
      v159 = __PAIR64__(DWORD2(v169), v64);
      v161 = 0x100000001;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      LODWORD(v162) = 1;
      HIDWORD(v162) = v169;
      v28 = 1;
    }
    else
    {
      v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(_QWORD *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_QWORD *)v164 = 0x100000001;
      v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      v26 = v64;
      v159 = __PAIR64__(DWORD2(v169), v64);
      v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      LODWORD(v162) = 1;
      HIDWORD(v162) = v169;
    }
    *(_DWORD *)&v163[8] = 1;
    v27 = 1;
  }
  else
  {
    v80 = 0;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)&v164[20] = 0x100000001;
    *(_DWORD *)&v164[12] = v4;
    *(_DWORD *)&v164[16] = v4;
    *(_DWORD *)&v164[8] = 1;
    *(_QWORD *)v164 = 0x100000001;
    v24 = v66;
    *(_DWORD *)v163 = v66;
    *(_DWORD *)&v163[4] = 1;
    v25 = v65;
    *(_DWORD *)&v160[16] = v65;
    *(_DWORD *)v160 = HIDWORD(v169);
    *(_DWORD *)&v160[12] = 1;
    v26 = v64;
    v159 = __PAIR64__(DWORD2(v169), v64);
    v161 = 0x100000001;
    *(_DWORD *)&v160[4] = 1;
    *(_DWORD *)&v160[8] = DWORD1(v169);
    LODWORD(v162) = 1;
    HIDWORD(v162) = v169;
    *(_DWORD *)&v163[8] = 1;
    v164[28] = 1;
  }
LABEL_9:
  if (v28)
  {

  }
  if (v27)
  {

  }
  if (*(_DWORD *)&v163[8])
  {

  }
  if (HIDWORD(v162))
  {

  }
  if ((_DWORD)v169)
  {

  }
  if ((_DWORD)v162)
  {

  }
  if (*(_DWORD *)&v160[8])
  {

  }
  if (DWORD1(v169))
  {

  }
  if ((_DWORD)v161)
  {

  }
  if (HIDWORD(v159))
  {

  }
  if (DWORD2(v169))
  {

  }
  if (*(_DWORD *)&v160[4])
  {

  }
  if ((_DWORD)v159)
  {

  }
  if (v26)
  {

  }
  if (*(_DWORD *)&v160[12])
  {

  }
  if (*(_DWORD *)v160)
  {

  }
  if (HIDWORD(v169))
  {

  }
  if (HIDWORD(v161))
  {

  }
  if (*(_DWORD *)&v160[16])
  {

  }
  if (v25)
  {

  }
  if (*(_DWORD *)&v163[4])
  {

  }
  if (*(_DWORD *)v163)
  {

  }
  if (v24)
  {

  }
  if (*(_DWORD *)&v164[4])
  {

  }
  if (*(_DWORD *)v164)
  {

  }
  if (*(_DWORD *)&v164[8])
  {

  }
  if (*(_DWORD *)&v164[12])

  if (*(_DWORD *)&v164[16])
  {

  }
  if (v165)
  {

  }
  if ((_DWORD)v166)

  if (HIDWORD(v166))
  {

  }
  if (*(_DWORD *)&v164[20])
  {

  }
  if (*(_DWORD *)&v164[24])

  if (v10)
  {

  }
  return v164[28];
}

- (BOOL)isDuetEventAuthorized:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  const char *v28;
  uint8_t *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  __int16 v38;
  __int16 v39;
  uint8_t buf[2];
  __int16 v41;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D70E68]);
  v8 = (void *)MEMORY[0x1C3BD6630]();
  if (v7)
  {
    objc_msgSend(v5, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A60], "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PPCollapseWhitespaceAndStrip();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v15 = objc_claimAutoreleasedReturnValue();

    +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "shouldUseAllowedWebsite");

    if ((_DWORD)v14)
    {
      if (!v15
        || (+[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v17, "donationAllowedWebsites"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "containsObject:", v15),
            v18,
            v17,
            (v19 & 1) == 0))
      {
        pp_connections_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 0;
          v21 = "PPConnectionsDuetSource: website not allowed";
          v22 = (uint8_t *)&v41;
LABEL_16:
          _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (v15)
    {
      +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "donationBlockedWebsites");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "containsObject:", v15);

      if (v32)
      {
        pp_connections_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v21 = "PPConnectionsDuetSource: website is blocked";
          v22 = buf;
          goto LABEL_16;
        }
LABEL_17:

        goto LABEL_23;
      }
    }

LABEL_25:
    objc_autoreleasePoolPop(v8);
    v36 = 1;
    goto LABEL_26;
  }
  objc_msgSend(v6, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldUseAllowedApps");

  if (!v24)
  {
    if (!v6)
      goto LABEL_25;
    +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "donationBlockedApps");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "containsObject:", v12);

    if (!v35)
      goto LABEL_25;
    pp_connections_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v38 = 0;
    v28 = "PPConnectionsDuetSource: app is blocked";
    v29 = (uint8_t *)&v38;
LABEL_22:
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, v28, v29, 2u);
    goto LABEL_23;
  }
  if (v6)
  {
    +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "donationAllowedApps");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "containsObject:", v12);

    if ((v27 & 1) != 0)
      goto LABEL_25;
  }
  pp_connections_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 0;
    v28 = "PPConnectionsDuetSource: app is not allowed";
    v29 = (uint8_t *)&v39;
    goto LABEL_22;
  }
LABEL_23:

  objc_autoreleasePoolPop(v8);
  v36 = 0;
LABEL_26:

  return v36;
}

- (id)duetLocationUserActivitiesWithLimit:(unint64_t)a3 explanationSet:(id)a4
{
  return -[PPConnectionsDuetSource duetLocationUserActivitiesWithLimit:afterDate:explanationSet:](self, "duetLocationUserActivitiesWithLimit:afterDate:explanationSet:", a3, 0, a4);
}

- (id)duetLocationUserActivitiesWithLimit:(unint64_t)a3 afterDate:(id)a4 explanationSet:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D15AF8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "appLocationActivityStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userActivityBatchSize");

  if (v13 <= a3)
    v14 = a3;
  else
    v14 = v13;
  +[PPConnectionsDuetSource duetUserActivitiesFromStreams:limit:afterDate:explanationSet:](PPConnectionsDuetSource, "duetUserActivitiesFromStreams:limit:afterDate:explanationSet:", v11, v14, v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)whitespaceAndNewlineCharacterSet
{
  if (whitespaceAndNewlineCharacterSet__pasOnceToken35 != -1)
    dispatch_once(&whitespaceAndNewlineCharacterSet__pasOnceToken35, &__block_literal_global_49_16981);
  return (id)whitespaceAndNewlineCharacterSet__pasExprOnceResult;
}

void __59__PPConnectionsDuetSource_whitespaceAndNewlineCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)whitespaceAndNewlineCharacterSet__pasExprOnceResult;
  whitespaceAndNewlineCharacterSet__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __50__PPConnectionsDuetSource_supportedLocationFields__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59CD8, &unk_1E7E59CF0, &unk_1E7E59D08, &unk_1E7E59D20, &unk_1E7E59D38, &unk_1E7E59D50, &unk_1E7E59D68, &unk_1E7E59D80, &unk_1E7E59D98, 0);
  objc_autoreleasePoolPop(v0);
  v2 = (void *)supportedLocationFields_supportedLocationFields;
  supportedLocationFields_supportedLocationFields = v1;

}

+ (PPConnectionsDuetSource)sharedInstance
{
  if (sharedInstance_once_17049 != -1)
    dispatch_once(&sharedInstance_once_17049, &__block_literal_global_17050);
  return (PPConnectionsDuetSource *)(id)sharedInstance_shared_17051;
}

+ (id)duetUserActivitiesFromStreams:(id)a3 limit:(unint64_t)a4 afterDate:(id)a5 explanationSet:(id)a6
{
  id v10;
  uint64_t v11;
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
  id v22;
  void *context;
  void *contexta;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  dispatch_semaphore_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v10 = a5;
  v26 = a6;
  context = (void *)MEMORY[0x1C3BD6630]();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D15A08], "predicateForEventsWithStartDateAfter:", v10, context);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1, context);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__17038;
  v42 = __Block_byref_object_dispose__17039;
  v43 = (id)MEMORY[0x1E0C9AA60];
  sel_getName(a2);
  v13 = (void *)os_transaction_create();
  v14 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("structuredMetadata._DKApplicationActivityMetadataKey__expirationDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v12, v27, 0, a4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15A08], "allDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDeviceIDs:", v19);

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__17038;
  v36 = __Block_byref_object_dispose__17039;
  v37 = 0;
  v37 = dispatch_semaphore_create(0);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__PPConnectionsDuetSource_duetUserActivitiesFromStreams_limit_afterDate_explanationSet___block_invoke;
  v28[3] = &unk_1E7E1C730;
  v30 = &v38;
  v31 = &v32;
  v21 = v13;
  v29 = v21;
  objc_msgSend(v20, "executeQuery:responseQueue:withCompletion:", v18, 0, v28);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v33[5], 60.0))
  {
    objc_msgSend(v26, "push:", 28);
    v22 = 0;
  }
  else
  {
    v22 = (id)v39[5];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  objc_autoreleasePoolPop(contexta);
  return v22;
}

void __88__PPConnectionsDuetSource_duetUserActivitiesFromStreams_limit_afterDate_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPConnectionsDuetSource: duet query results: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v5;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
  if (v6)
    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("CD"), objc_msgSend(v6, "code"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v9 = (id)objc_opt_self();

}

void __41__PPConnectionsDuetSource_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_17051;
  sharedInstance_shared_17051 = v0;

}

@end
