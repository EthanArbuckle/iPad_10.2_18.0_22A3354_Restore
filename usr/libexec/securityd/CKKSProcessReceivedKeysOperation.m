@implementation CKKSProcessReceivedKeysOperation

- (CKKSProcessReceivedKeysOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKKSProcessReceivedKeysOperation *v14;
  CKKSProcessReceivedKeysOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKKSProcessReceivedKeysOperation;
  v14 = -[CKKSResultOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deps, a3);
    v15->_allowFullRefetchResult = a4;
    objc_storeStrong((id *)&v15->_intendedState, a5);
    objc_storeStrong((id *)&v15->_nextState, a6);
  }

  return v15;
}

- (void)main
{
  void *v2;
  void *v3;
  AAFAnalyticsEventSecurity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  void *v16;
  void *v17;
  AAFAnalyticsEventSecurity *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  id obj;
  uint64_t v48;
  void *v49;
  void *v50;
  AAFAnalyticsEventSecurity *v51;
  id v53;
  _QWORD v54[6];
  AAFAnalyticsEventSecurity *v55;
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[5];
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;
  _QWORD v88[2];
  _QWORD v89[2];
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  id v93;
  _BYTE v94[128];
  const __CFString *v95;
  void *v96;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "databaseProvider"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTrustStates"));

  v4 = [AAFAnalyticsEventSecurity alloc];
  v95 = CFSTR("numViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeManagedViews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
  v96 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altDSID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v51 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v4, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v8, v11, CFSTR("com.apple.security.ckks.processReceivedKeys"), 0, &off_10030AF70, objc_msgSend(v12, "sendMetric"));

  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 1;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeManagedViews"));

  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v14)
  {
    v48 = *(_QWORD *)v77;
    *(_QWORD *)&v15 = 138412546;
    v46 = v15;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v77 != v48)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v16);
        v70 = 0;
        v71 = &v70;
        v72 = 0x3032000000;
        v73 = sub_100183738;
        v74 = sub_100183748;
        v75 = 0;
        v68[0] = 0;
        v68[1] = v68;
        v68[2] = 0x3032000000;
        v68[3] = sub_100183738;
        v68[4] = sub_100183748;
        v69 = 0;
        v62 = 0;
        v63 = &v62;
        v64 = 0x3032000000;
        v65 = sub_100183738;
        v66 = sub_100183748;
        v67 = 0;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_100183750;
        v54[3] = &unk_1002E9DC0;
        v54[4] = self;
        v54[5] = v17;
        v57 = &v84;
        v18 = v51;
        v55 = v18;
        v58 = &v80;
        v59 = &v70;
        v19 = v49;
        v56 = v19;
        v60 = v68;
        v61 = &v62;
        objc_msgSend(v50, "dispatchSyncWithSQLTransaction:", v54);
        v20 = (void *)v71[5];
        if (!v20 || objc_msgSend(v20, "isEqualToString:", CFSTR("ready")))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID", v46));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneName"));
          v23 = sub_10000BDF4(CFSTR("ckkskey"), v22);
          v24 = objc_claimAutoreleasedReturnValue(v23);

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Checking consistency of key hierarchy", buf, 2u);
          }

          v25 = v63[5];
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
          v53 = 0;
          v27 = objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation checkExistingKeyHierarchy:zoneID:currentTrustStates:error:](self, "checkExistingKeyHierarchy:zoneID:currentTrustStates:error:", v25, v26, v19, &v53));
          v28 = v53;
          v29 = (void *)v71[5];
          v71[5] = v27;

          -[AAFAnalyticsEventSecurity populateUnderlyingErrorsStartingWithRootError:](v18, "populateUnderlyingErrorsStartingWithRootError:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneName"));
          v32 = sub_10000BDF4(CFSTR("ckkskey"), v31);
          v33 = objc_claimAutoreleasedReturnValue(v32);

          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = v71[5];
            *(_DWORD *)buf = v46;
            v91 = v34;
            v92 = 2112;
            v93 = v28;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Key hierarchy is '%@' (error: %@)", buf, 0x16u);
          }

        }
        objc_msgSend(v17, "setViewKeyHierarchyState:", v71[5], v46);

        _Block_object_dispose(&v62, 8);
        _Block_object_dispose(v68, 8);

        _Block_object_dispose(&v70, 8);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v14);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "activeManagedViews"));
  if (objc_msgSend(v36, "count"))
  {
    v37 = *((int *)v81 + 6);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "activeManagedViews"));
    v40 = (unint64_t)objc_msgSend(v39, "count");

    v41 = v37 / v40;
  }
  else
  {
    v41 = 0;
  }

  v88[0] = CFSTR("avgRemoteKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
  v88[1] = CFSTR("totalRemoteKeys");
  v89[0] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v81 + 6)));
  v89[1] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v89, v88, 2));
  -[AAFAnalyticsEventSecurity addMetrics:](v51, "addMetrics:", v44);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v51, *((unsigned __int8 *)v85 + 24), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation intendedState](self, "intendedState"));
  -[CKKSProcessReceivedKeysOperation setNextState:](self, "setNextState:", v45);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

}

- (id)processRemoteKeys:(id)a3 viewState:(id)a4 currentTrustStates:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  id v52;
  unsigned __int8 v53;
  unsigned __int8 v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *j;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  NSObject *v75;
  const char *v76;
  NSObject *v77;
  uint32_t v78;
  __CFString *v79;
  __CFString *v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  __CFString *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  void *v98;
  void *v99;
  __CFString *v100;
  id v101;
  void *v102;
  void *v103;
  unsigned int v104;
  void *v105;
  void *v106;
  id v107;
  NSObject *v108;
  _BOOL4 v109;
  void *v110;
  __CFString *v111;
  void *v112;
  void *v113;
  unsigned __int8 v114;
  id v115;
  __CFString **v116;
  id v117;
  id v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  id *v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  NSObject *v137;
  void *v138;
  void *v139;
  id v140;
  NSObject *v141;
  __CFString *v142;
  void *v143;
  void *v144;
  id v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  unsigned int v150;
  void *v151;
  void *v152;
  id v153;
  NSObject *v154;
  __CFString **v155;
  void *v156;
  void *v157;
  id v158;
  NSObject *v159;
  void *v160;
  id v161;
  __CFString **v162;
  void *v163;
  void *v164;
  unsigned int v165;
  void *v166;
  void *v167;
  id v168;
  NSObject *v169;
  void *v170;
  void *v171;
  id v172;
  NSObject *v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  id obj;
  unsigned int obja;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  void *v186;
  void *v187;
  id v190;
  void *v191;
  void *v192;
  id v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  id v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  id v211;
  id v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  _BYTE v224[128];
  _BYTE v225[128];
  uint8_t v226[128];
  uint8_t buf[4];
  id v228;
  __int16 v229;
  id v230;
  __int16 v231;
  void *v232;
  __int16 v233;
  id v234;
  __int16 v235;
  id v236;

  v193 = a3;
  v8 = a4;
  v190 = a5;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("ckkskey"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v228 = v193;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "remote keys: %@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v223 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("tlk"), v9, v14, &v223));
  v16 = v223;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v222 = v16;
  v191 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("classA"), v9, v17, &v222));
  v18 = v222;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v221 = v18;
  v196 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("classC"), v9, v19, &v221));
  v20 = v221;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentKeyUUID"));
  v22 = (void *)v9;
  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentKeyUUID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v220 = v20;
    v195 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:](CKKSKey, "tryFromDatabaseAnyState:contextID:zoneID:error:", v23, v9, v24, &v220));
    v25 = v220;

    v20 = v25;
  }
  else
  {
    v195 = 0;
  }
  v26 = v15;

  v27 = v191;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "currentKeyUUID"));
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "currentKeyUUID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v219 = v20;
    v194 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:](CKKSKey, "tryFromDatabaseAnyState:contextID:zoneID:error:", v29, v22, v30, &v219));
    v31 = v219;

    v20 = v31;
  }
  else
  {
    v194 = 0;
  }

  v32 = v196;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "currentKeyUUID"));
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "currentKeyUUID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v218 = v20;
    v192 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:](CKKSKey, "tryFromDatabaseAnyState:contextID:zoneID:error:", v34, v22, v35, &v218));
    v36 = v218;

    v32 = v196;
    v20 = v36;
  }
  else
  {
    v192 = 0;
  }

  if (!v26)
    goto LABEL_51;
  if (!v191)
    goto LABEL_51;
  if (!v32)
    goto LABEL_51;
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentKeyUUID"));
  if (!v37)
    goto LABEL_51;
  v38 = (void *)v37;
  v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "currentKeyUUID"));
  if (!v39)
  {

LABEL_51:
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "zoneName"));
    v74 = sub_10000BDF4(CFSTR("ckkskey"), v73);
    v75 = objc_claimAutoreleasedReturnValue(v74);

    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
LABEL_54:

      if (a6)
        *a6 = objc_retainAutorelease(v20);
      v79 = CFSTR("unhealthy");
      v80 = CFSTR("unhealthy");
      v81 = 0;
      v61 = 0;
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138413314;
    v228 = v26;
    v229 = 2112;
    v230 = v191;
    v231 = 2112;
    v232 = v32;
    v233 = 2112;
    v234 = v20;
    v235 = 2112;
    v236 = v20;
    v76 = "no current pointer for some keyclass: tlk:%@ a:%@ c:%@ %@ %@";
    v77 = v75;
    v78 = 52;
LABEL_53:
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v76, buf, v78);
    goto LABEL_54;
  }
  v40 = (void *)v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentKeyUUID"));

  if (!v41 || !v195 || !v194 || !v192)
    goto LABEL_51;
  v187 = v8;
  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  v42 = v193;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v214, v226, 16);
  if (!v43)
  {

LABEL_64:
    v8 = v187;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "zoneName"));
    v93 = sub_10000BDF4(CFSTR("ckkskey"), v92);
    v75 = objc_claimAutoreleasedReturnValue(v93);

    v32 = v196;
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_DWORD *)buf = 138412290;
    v228 = v26;
    v76 = "couldn't find active TLK: %@";
    v77 = v75;
    v78 = 12;
    goto LABEL_53;
  }
  v44 = v43;
  v186 = v22;
  v197 = 0;
  v45 = *(_QWORD *)v215;
  do
  {
    for (i = 0; i != v44; i = (char *)i + 1)
    {
      if (*(_QWORD *)v215 != v45)
        objc_enumerationMutation(v42);
      v47 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * (_QWORD)i);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "uuid"));
      v49 = v26;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentKeyUUID"));
      v51 = objc_msgSend(v48, "isEqualToString:", v50);

      if (v51)
      {
        if (!objc_msgSend(v47, "wrapsSelf"))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "parentKeyUUID"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("current TLK doesn't wrap itself: %@ %@"), v47, v83));
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 18, v84, v20));

          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "zoneName"));
          v88 = sub_10000BDF4(CFSTR("ckkskey"), v87);
          v89 = objc_claimAutoreleasedReturnValue(v88);

          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v228 = v85;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Proposed TLK doesn't wrap self: %@", buf, 0xCu);
          }

          v22 = v186;
          v26 = v49;
          v27 = v191;
          if (a6)
            *a6 = objc_retainAutorelease(v85);
          v79 = CFSTR("unhealthy");
          v90 = CFSTR("unhealthy");

          v61 = 0;
          v8 = v187;
          v32 = v196;
          v81 = v197;
          goto LABEL_57;
        }
        v52 = v47;

        v197 = v52;
      }
      v26 = v49;
    }
    v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v214, v226, 16);
  }
  while (v44);

  v22 = v186;
  v27 = v191;
  if (!v197)
    goto LABEL_64;
  v213 = v20;
  v53 = objc_msgSend(v197, "validTLK:", &v213);
  v184 = v213;

  v32 = v196;
  if ((v53 & 1) == 0)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "zoneName"));
    v96 = sub_10000BDF4(CFSTR("ckkskey"), v95);
    v97 = objc_claimAutoreleasedReturnValue(v96);

    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v228 = v197;
      v229 = 2112;
      v230 = v184;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "CKKS claims %@ is not a valid TLK: %@", buf, 0x16u);
    }

    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 34, CFSTR("invalid TLK from CloudKit"), v184));
    v99 = v98;
    v26 = v49;
    if (a6)
      *a6 = objc_retainAutorelease(v98);
    v79 = CFSTR("error");
    v100 = CFSTR("error");

    v61 = 0;
    v20 = v184;
    v8 = v187;
    v81 = v197;
    goto LABEL_57;
  }
  v212 = 0;
  v54 = objc_msgSend(v197, "tlkMaterialPresentOrRecoverableViaTLKShareForContextID:forTrustStates:error:", v186, v190, &v212);
  v55 = v212;
  v177 = v55;
  if ((v54 & 1) == 0)
  {
    v101 = v55;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "lockStateTracker"));
    v104 = objc_msgSend(v103, "isLockedError:", v101);

    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "zoneName"));
    v107 = sub_10000BDF4(CFSTR("ckkskey"), v106);
    v108 = objc_claimAutoreleasedReturnValue(v107);

    v109 = os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
    v110 = v101;
    if (v104)
    {
      v26 = v49;
      if (v109)
      {
        *(_DWORD *)buf = 138412290;
        v228 = v197;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Received a TLK(%@), but keybag appears to be locked. Entering a waiting state.", buf, 0xCu);
      }

      v8 = v187;
      if (a6)
        *a6 = objc_retainAutorelease(v110);
      v79 = CFSTR("waitforunlock");
      v111 = CFSTR("waitforunlock");
    }
    else
    {
      v112 = v101;
      if (v109)
      {
        *(_DWORD *)buf = 138412546;
        v228 = v197;
        v229 = 2112;
        v230 = v184;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Received a TLK(%@) which we don't have in the local keychain: %@", buf, 0x16u);
      }

      v113 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
      v211 = 0;
      v114 = objc_msgSend(v113, "considerSelfTrusted:error:", v190, &v211);
      v115 = v211;

      if ((v114 & 1) != 0)
      {
        v26 = v49;
        if (a6)
          *a6 = objc_retainAutorelease(v112);
        v116 = &off_1002E9DE8;
      }
      else
      {
        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "zoneName"));
        v145 = sub_10000BDF4(CFSTR("ckkskey"), v144);
        v146 = objc_claimAutoreleasedReturnValue(v145);

        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v228 = v115;
          _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "Not proceeding due to trust system failure: %@", buf, 0xCu);
        }

        if (a6)
        {
          if (v115)
          {
            *a6 = objc_retainAutorelease(v115);
          }
          else
          {
            v175 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 52, CFSTR("No trust states available"))));
            *a6 = v175;

          }
        }
        v116 = off_1002EA778;
        v26 = v49;
      }
      v8 = v187;
      v79 = *v116;

    }
    v61 = 0;
    goto LABEL_144;
  }
  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  obj = v42;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v207, v225, 16);
  if (!v56)
  {
    v58 = 0;
    goto LABEL_84;
  }
  v57 = v56;
  v58 = 0;
  v181 = *(id *)v208;
  do
  {
    for (j = 0; j != v57; j = (char *)j + 1)
    {
      if (*(id *)v208 != v181)
        objc_enumerationMutation(obj);
      v60 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * (_QWORD)j);
      if (v60 == v197)
        continue;
      v206 = 0;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topKeyInAnyState:", &v206));
      v62 = v206;

      if (v62)
      {
        v183 = v62;
LABEL_113:
        v32 = v196;
        v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "zoneName"));
        v158 = sub_10000BDF4(CFSTR("ckkskey"), v157);
        v159 = objc_claimAutoreleasedReturnValue(v158);

        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v228 = v60;
          v229 = 2112;
          v230 = v184;
          _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_ERROR, "new key %@ is orphaned (%@)", buf, 0x16u);
        }

        v26 = v49;
        if (!a6)
        {
          v162 = &off_1002EA780;
          v8 = v187;
          goto LABEL_142;
        }
        v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("orphaned key(%@) in hierarchy"), v61));
        v161 = v183;
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 33, v160, v183));

        v162 = &off_1002EA780;
        v8 = v187;
LABEL_143:
        v79 = *v162;

        goto LABEL_144;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "uuid"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "uuid"));
      v65 = objc_msgSend(v63, "isEqual:", v64);

      if ((v65 & 1) == 0)
      {
        v183 = 0;
        goto LABEL_113;
      }
      v205 = 0;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "unwrapViaKeyHierarchy:", &v205));
      v67 = v205;

      if (!v66 || v67)
      {
        v183 = v67;
        if (v67
          && (v163 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps")),
              v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "lockStateTracker")),
              v165 = objc_msgSend(v164, "isLockedError:", v183),
              v164,
              v163,
              v165))
        {
          v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
          v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "zoneName"));
          v168 = sub_10000BDF4(CFSTR("ckkskey"), v167);
          v169 = objc_claimAutoreleasedReturnValue(v168);

          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v228 = v60;
            _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEFAULT, "Couldn't unwrap new key (%@), but keybag appears to be locked. Entering waitforunlock.", buf, 0xCu);
          }

          if (a6)
          {
            v161 = objc_retainAutorelease(v183);
            *a6 = v161;
            v162 = off_1002E9DE0;
            goto LABEL_128;
          }
          v162 = off_1002E9DE0;
LABEL_141:
          v26 = v49;
          v22 = v186;
          v8 = v187;
          v27 = v191;
          v32 = v196;
LABEL_142:
          v161 = v183;
        }
        else
        {
          v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
          v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "zoneName"));
          v172 = sub_10000BDF4(CFSTR("ckkskey"), v171);
          v173 = objc_claimAutoreleasedReturnValue(v172);

          if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v228 = v61;
            v229 = 2112;
            v230 = v183;
            _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "new key %@ claims to wrap to TLK, but we can't unwrap it: %@", buf, 0x16u);
          }

          if (!a6)
          {
            v162 = &off_1002EA780;
            goto LABEL_141;
          }
          v161 = v183;
          v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unwrappable key(%@) in hierarchy: %@"), v61, v183));
          *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 33, v174, v184));

          v162 = &off_1002EA780;
LABEL_128:
          v26 = v49;
          v22 = v186;
          v8 = v187;
          v27 = v191;
          v32 = v196;
        }
        goto LABEL_143;
      }
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "zoneName"));
      v70 = sub_10000BDF4(CFSTR("ckkskey"), v69);
      v71 = objc_claimAutoreleasedReturnValue(v70);

      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v228 = v60;
        v229 = 2112;
        v230 = v197;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "New key %@ wraps to tlk %@", buf, 0x16u);
      }

      v58 = v61;
    }
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v207, v225, 16);
  }
  while (v57);
LABEL_84:
  v176 = v58;

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v178 = obj;
  v117 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v201, v224, 16);
  v118 = v184;
  v182 = v117;
  if (!v117)
    goto LABEL_97;
  v119 = *(_QWORD *)v202;
  v120 = v184;
  while (2)
  {
    v121 = 0;
    while (2)
    {
      if (*(_QWORD *)v202 != v119)
        objc_enumerationMutation(v178);
      v122 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * v121);
      objc_msgSend(v122, "setState:", CFSTR("local"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "uuid"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "currentKeyUUID"));
      if (objc_msgSend(v123, "isEqualToString:", v124))
      {

        goto LABEL_92;
      }
      v185 = v122;
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "uuid"));
      v126 = v119;
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "currentKeyUUID"));
      obja = objc_msgSend(v125, "isEqualToString:", v127);

      v119 = v126;
      v122 = v185;

      if (obja)
      {
LABEL_92:
        v200 = v120;
        v128 = &v200;
        objc_msgSend(v122, "saveToDatabaseAsOnlyCurrentKeyForClassAndState:", &v200);
      }
      else
      {
        v199 = v120;
        v128 = &v199;
        objc_msgSend(v185, "saveToDatabase:", &v199);
      }
      v129 = *v128;

      v198 = v129;
      objc_msgSend(v122, "saveKeyMaterialToKeychain:", &v198);
      v130 = v198;

      if (v130)
      {
        v147 = v122;
        v148 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "lockStateTracker"));
        v150 = objc_msgSend(v149, "isLockedError:", v130);

        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "zoneName"));
        v153 = sub_10000BDF4(CFSTR("ckkskey"), v152);
        v154 = objc_claimAutoreleasedReturnValue(v153);

        v184 = v130;
        if (v150)
        {
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v228 = v147;
            v229 = 2112;
            v230 = v130;
            _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "Couldn't save newly local key %@ keychain, due to lock state. Entering a waiting state; %@",
              buf,
              0x16u);
          }

          v155 = off_1002E9DE0;
        }
        else
        {
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v228 = v147;
            v229 = 2112;
            v230 = v130;
            _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "couldn't save newly local key %@ to database: %@", buf, 0x16u);
          }

          v155 = &off_1002EA780;
        }
        v26 = v49;
        v32 = v196;
        if (a6)
          *a6 = objc_retainAutorelease(v184);
        v79 = *v155;

        v61 = v176;
        v8 = v187;
        goto LABEL_144;
      }
      v120 = 0;
      if (v182 != (id)++v121)
        continue;
      break;
    }
    v131 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v201, v224, 16);
    v120 = 0;
    v118 = 0;
    v182 = v131;
    if (v131)
      continue;
    break;
  }
LABEL_97:
  v184 = v118;

  v132 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "savedTLKNotifier"));

  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "zoneName"));
  v136 = sub_10000BDF4(CFSTR("ckkstlk"), v135);
  v137 = objc_claimAutoreleasedReturnValue(v136);

  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v228 = v133;
    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "triggering new TLK notification: %@", buf, 0xCu);
  }

  objc_msgSend(v133, "trigger");
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "zoneID"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "zoneName"));
  v140 = sub_10000BDF4(CFSTR("ckkskey"), v139);
  v141 = objc_claimAutoreleasedReturnValue(v140);

  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "Accepted new key hierarchy", buf, 2u);
  }

  v79 = CFSTR("ready");
  v142 = CFSTR("ready");

  v61 = v176;
  v26 = v49;
  v22 = v186;
  v8 = v187;
  v27 = v191;
  v32 = v196;
LABEL_144:
  v81 = v197;

  v20 = v184;
LABEL_57:

  return v79;
}

- (id)checkExistingKeyHierarchy:(id)a3 zoneID:(id)a4 currentTrustStates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  id v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  id v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned __int8 v70;
  __CFString *v71;
  __CFString *v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  __CFString *v80;
  void *v81;
  id v82;
  NSObject *v83;
  id v84;
  __CFString *v85;
  void *v87;
  id v88;
  NSObject *v89;
  void *v90;
  __CFString *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  __CFString *v97;
  void *v98;
  id v99;
  NSObject *v100;
  void *v101;
  __CFString *v102;
  void *v103;
  id v104;
  NSObject *v105;
  void *v106;
  __CFString *v107;
  void *v108;
  void *v109;
  id v110;
  NSObject *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  NSErrorUserInfoKey v119;
  const __CFString *v120;
  NSErrorUserInfoKey v121;
  const __CFString *v122;
  uint8_t buf[4];
  id v124;
  __int16 v125;
  id v126;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
    if ((objc_msgSend(v16, "isEqual:", CFSTR("securityd")) & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
      v18 = objc_msgSend(v17, "code");

      if (v18 == (id)-25300)
        goto LABEL_9;
    }
    else
    {

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
    v20 = sub_10000BDF4(CFSTR("ckkskey"), v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
      *(_DWORD *)buf = 138412290;
      v124 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error examining existing key hierarchy: %@", buf, 0xCu);

    }
  }
LABEL_9:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTLKPointer"));
  if (v23 || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentClassAPointer"))) != 0)
  {

LABEL_12:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
    v118 = 0;
    v25 = objc_msgSend(v24, "considerSelfTrusted:error:", v12, &v118);
    v26 = v118;

    if ((v25 & 1) != 0 || !v26)
    {
      if ((v25 & 1) != 0)
      {
LABEL_19:
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));
        if (v33)
        {
          v34 = (void *)v33;
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classA"));
          if (v35)
          {
            v36 = (void *)v35;
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classC"));

            if (v37)
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));
              v117 = 0;
              v39 = objc_msgSend(v38, "loadKeyMaterialFromKeychain:", &v117);
              v40 = v117;

              if ((v39 & 1) == 0)
              {
                if (v40)
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lockStateTracker"));
                  v43 = objc_msgSend(v42, "isLockedError:", v40);

                  if ((v43 & 1) == 0)
                  {
                    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                    v99 = sub_10000BDF4(CFSTR("ckkskey"), v98);
                    v100 = objc_claimAutoreleasedReturnValue(v99);

                    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                    {
                      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));
                      *(_DWORD *)buf = 138412546;
                      v124 = v101;
                      v125 = 2112;
                      v126 = v40;
                      _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Error loading TLK(%@): %@", buf, 0x16u);

                    }
                    if (a6)
                      *a6 = objc_retainAutorelease(v40);
                    v71 = CFSTR("unhealthy");
                    v102 = CFSTR("unhealthy");
                    goto LABEL_70;
                  }
                }
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                v45 = sub_10000BDF4(CFSTR("ckkskey"), v44);
                v46 = objc_claimAutoreleasedReturnValue(v45);

                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));
                  *(_DWORD *)buf = 138412546;
                  v124 = v47;
                  v125 = 2112;
                  v126 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Soft error loading TLK(%@), maybe locked: %@", buf, 0x16u);

                }
              }
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classA"));
              v116 = 0;
              v49 = objc_msgSend(v48, "loadKeyMaterialFromKeychain:", &v116);
              v50 = v116;

              if ((v49 & 1) == 0)
              {
                if (v50)
                {
                  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lockStateTracker"));
                  v53 = objc_msgSend(v52, "isLockedError:", v50);

                  if ((v53 & 1) == 0)
                  {
                    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                    v104 = sub_10000BDF4(CFSTR("ckkskey"), v103);
                    v105 = objc_claimAutoreleasedReturnValue(v104);

                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    {
                      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classA"));
                      *(_DWORD *)buf = 138412546;
                      v124 = v106;
                      v125 = 2112;
                      v126 = v50;
                      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "Error loading classA key(%@): %@", buf, 0x16u);

                    }
                    if (a6)
                      *a6 = objc_retainAutorelease(v50);
                    v71 = CFSTR("unhealthy");
                    v107 = CFSTR("unhealthy");
                    goto LABEL_69;
                  }
                }
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                v55 = sub_10000BDF4(CFSTR("ckkskey"), v54);
                v56 = objc_claimAutoreleasedReturnValue(v55);

                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classA"));
                  *(_DWORD *)buf = 138412546;
                  v124 = v57;
                  v125 = 2112;
                  v126 = v50;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Soft error loading classA key(%@), maybe locked: %@", buf, 0x16u);

                }
              }
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classC"));
              v115 = 0;
              v59 = objc_msgSend(v58, "loadKeyMaterialFromKeychain:", &v115);
              v60 = v115;

              if ((v59 & 1) == 0)
              {
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                v88 = sub_10000BDF4(CFSTR("ckkskey"), v87);
                v89 = objc_claimAutoreleasedReturnValue(v88);

                if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classC"));
                  *(_DWORD *)buf = 138412546;
                  v124 = v90;
                  v125 = 2112;
                  v126 = v60;
                  _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Error loading classC(%@): %@", buf, 0x16u);

                }
                if (a6)
                  *a6 = objc_retainAutorelease(v60);
                v71 = CFSTR("unhealthy");
                v91 = CFSTR("unhealthy");
                goto LABEL_68;
              }
              v112 = v60;
              v113 = v50;
              v114 = v40;
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classA"));
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "parentKeyUUID"));
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "uuid"));
              v65 = objc_msgSend(v62, "isEqualToString:", v64);

              if ((v65 & 1) != 0)
              {
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classC"));
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "parentKeyUUID"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "uuid"));
                v70 = objc_msgSend(v67, "isEqualToString:", v69);

                if ((v70 & 1) != 0)
                {
                  v71 = CFSTR("ready");
                  v72 = CFSTR("ready");
                  v50 = v113;
                  v40 = v114;
                  v60 = v112;
LABEL_68:

LABEL_69:
LABEL_70:

                  goto LABEL_56;
                }
                v119 = NSLocalizedDescriptionKey;
                v120 = CFSTR("Current class C key does not wrap to current TLK");
                v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
                v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSServerExtensionErrorDomain"), 9, v108));

                v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                v110 = sub_10000BDF4(CFSTR("ckkskey"), v109);
                v111 = objc_claimAutoreleasedReturnValue(v110);

                v60 = v112;
                if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v124 = v93;
                  _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "Key hierarchy unhealthy: %@", buf, 0xCu);
                }

                v50 = v113;
                v40 = v114;
                if (!a6)
                {
LABEL_67:
                  v71 = CFSTR("unhealthy");
                  v97 = CFSTR("unhealthy");

                  goto LABEL_68;
                }
              }
              else
              {
                v121 = NSLocalizedDescriptionKey;
                v122 = CFSTR("Current class A key does not wrap to current TLK");
                v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
                v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSServerExtensionErrorDomain"), 9, v92));

                v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
                v95 = sub_10000BDF4(CFSTR("ckkskey"), v94);
                v96 = objc_claimAutoreleasedReturnValue(v95);

                if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v124 = v93;
                  _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Key hierarchy unhealthy: %@", buf, 0xCu);
                }

                v50 = v113;
                v40 = v114;
                v60 = v112;
                if (!a6)
                  goto LABEL_67;
              }
              *a6 = objc_retainAutorelease(v93);
              goto LABEL_67;
            }
          }
          else
          {

          }
        }
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
        v82 = sub_10000BDF4(CFSTR("ckkskey"), v81);
        v83 = objc_claimAutoreleasedReturnValue(v82);

        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v124 = v10;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Error examining existing key hierarchy (missing at least one key): %@", buf, 0xCu);
        }

        if (a6)
          *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
        v71 = CFSTR("unhealthy");
LABEL_55:
        v85 = v71;
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSProcessReceivedKeysOperation deps](self, "deps"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lockStateTracker"));
      v29 = objc_msgSend(v28, "isLockedError:", v26);

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
        v31 = sub_10000BDF4(CFSTR("ckkskey"), v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v124 = v26;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Trust system reports device locked: %@", buf, 0xCu);
        }

        v26 = 0;
        goto LABEL_19;
      }
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
    v74 = sub_10000BDF4(CFSTR("ckkskey"), v73);
    v75 = objc_claimAutoreleasedReturnValue(v74);

    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v26;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Not proceeding due to trust system failure: %@", buf, 0xCu);
    }

    if (a6)
    {
      if (v26)
      {
        *a6 = objc_retainAutorelease(v26);
      }
      else
      {
        v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 52, CFSTR("No trust states available"))));
        *a6 = v84;

      }
    }
    v71 = CFSTR("waitfortrust");
    goto LABEL_55;
  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentClassCPointer"));

  if (v76)
    goto LABEL_12;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
  v78 = sub_10000BDF4(CFSTR("ckkskey"), v77);
  v79 = objc_claimAutoreleasedReturnValue(v78);

  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v124 = v10;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "No existing key hierarchy (missing all CKPs): %@", buf, 0xCu);
  }

  v71 = CFSTR("waitfortlkcreation");
  v80 = CFSTR("waitfortlkcreation");
LABEL_57:

  return v71;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)allowFullRefetchResult
{
  return self->_allowFullRefetchResult;
}

- (void)setAllowFullRefetchResult:(BOOL)a3
{
  self->_allowFullRefetchResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
