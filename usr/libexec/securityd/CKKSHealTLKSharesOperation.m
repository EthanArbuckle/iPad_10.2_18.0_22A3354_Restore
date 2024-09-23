@implementation CKKSHealTLKSharesOperation

- (CKKSHealTLKSharesOperation)init
{

  return 0;
}

- (CKKSHealTLKSharesOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKKSHealTLKSharesOperation;
  v12 = -[CKKSGroupOperation init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a5);
    objc_storeStrong((id *)(v13 + 134), a4);
    v13[128] = 0;
    v13[129] = 0;
    v13[130] = 0;
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v15 = *(void **)(v13 + 158);
    *(_QWORD *)(v13 + 158) = v14;

  }
  return (CKKSHealTLKSharesOperation *)v13;
}

- (void)groupStart
{
  void *v2;
  void *v3;
  unsigned int v4;
  const void *v5;
  NSObject *v6;
  AAFAnalyticsEventSecurity *v7;
  void *v8;
  void *v9;
  AAFAnalyticsEventSecurity *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AAFAnalyticsEventSecurity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  OctagonPendingFlag *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  id *v38;
  AAFAnalyticsEventSecurity *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  AAFAnalyticsEventSecurity *v47;
  id v48;
  id location;
  const __CFString *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syncingPolicy"));
  v4 = objc_msgSend(v3, "isInheritedAccount");

  if (v4)
  {
    v5 = sub_10000EF14("ckksshare");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account is inherited, bailing out of healing TLKShares", buf, 2u);
    }

    v7 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation intendedState](self, "intendedState"));
    -[CKKSHealTLKSharesOperation setNextState:](self, "setNextState:", v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "overallLaunch"));
    objc_msgSend(v9, "addEvent:", CFSTR("heal-tlk-shares-begin"));

    v10 = [AAFAnalyticsEventSecurity alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "altDSID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v15 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v10, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v13, CFSTR("com.apple.security.ckks.healTLKShares"), 0, &off_10030AF70, objc_msgSend(v14, "sendMetric"));

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1001983E8;
    v46[3] = &unk_1002EA758;
    v37 = &v48;
    objc_copyWeak(&v48, &location);
    v39 = v15;
    v47 = v39;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("determine-next-state"), v46));
    -[CKKSHealTLKSharesOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentTrustStates"));

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeManagedViews"));

    v20 = 0;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "viewKeyHierarchyState", v37));
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("ready"));

          if ((v26 & 1) != 0)
          {
            -[CKKSHealTLKSharesOperation checkAndHealTLKShares:currentTrustStates:](self, "checkAndHealTLKShares:currentTrustStates:", v24, v40);
            v20 = (v20 + 1);
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "zoneName"));
            v29 = sub_10000BDF4(CFSTR("ckksshare"), v28);
            v30 = objc_claimAutoreleasedReturnValue(v29);

            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v24;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "View key state is %@; not checking TLK share validity",
                buf,
                0xCu);
            }

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v21);
    }

    v50 = CFSTR("numViews");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
    v51 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    -[AAFAnalyticsEventSecurity addMetrics:](v39, "addMetrics:", v32);

    if (-[CKKSHealTLKSharesOperation failedDueToLockState](self, "failedDueToLockState"))
    {
      v33 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("key_process_requested"), 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "flagHandler"));
      objc_msgSend(v35, "handlePendingFlag:", v33);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation setResultStateOperation](self, "setResultStateOperation", v37));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);

    objc_destroyWeak(v38);
    v7 = v39;
  }

  objc_destroyWeak(&location);
}

- (void)checkAndHealTLKShares:(id)a3 currentTrustStates:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *p_super;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  AAFAnalyticsEventSecurity *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  id *v45;
  id *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  unsigned __int8 v75;
  NSObject *v76;
  unsigned __int8 v77;
  AAFAnalyticsEventSecurity *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  void *i;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  AAFAnalyticsEventSecurity *v97;
  id v98;
  char *v99;
  uint64_t v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  void *k;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  NSObject *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  id v124;
  NSObject *v125;
  AAFAnalyticsEventSecurity *v126;
  id v127;
  void *v128;
  id *to;
  uint64_t v130;
  void *v131;
  AAFAnalyticsEventSecurity *v132;
  NSObject *v133;
  uint64_t j;
  CKKSHealTLKSharesOperation *val;
  id v136;
  _QWORD v137[4];
  id v138;
  AAFAnalyticsEventSecurity *v139;
  id v140;
  id v141;
  _BYTE *v142;
  _QWORD *v143;
  id v144;
  id location;
  _QWORD v146[4];
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[4];
  id v153;
  AAFAnalyticsEventSecurity *v154;
  _QWORD *v155;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD v161[3];
  char v162;
  id v163;
  id v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  _QWORD v170[4];
  id v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t (*v176)(uint64_t, uint64_t);
  void (*v177)(uint64_t);
  id v178;
  _BYTE v179[128];
  _BYTE v180[128];
  const __CFString *v181;
  void *v182;
  _BYTE buf[24];
  int v184;
  const __CFString *v185;
  void *v186;
  _BYTE v187[128];
  const __CFString *v188;
  void *v189;
  const __CFString *v190;
  void *v191;

  v6 = a3;
  v127 = a4;
  v173 = 0;
  v174 = &v173;
  v175 = 0x3032000000;
  v176 = sub_100197CB4;
  v177 = sub_100197CC4;
  v178 = 0;
  val = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "databaseProvider"));
  v170[0] = _NSConcreteStackBlock;
  v170[1] = 3221225472;
  v170[2] = sub_100197CCC;
  v170[3] = &unk_1002EB140;
  v172 = &v173;
  v136 = v6;
  v171 = v136;
  objc_msgSend(v8, "dispatchSyncWithReadOnlySQLTransaction:", v170);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v174[5], "error"));
  if (v9)
  {
    objc_msgSend(v136, "setViewKeyHierarchyState:", CFSTR("unhealthy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
    v12 = sub_10000BDF4(CFSTR("ckksshare"), v11);
    p_super = objc_claimAutoreleasedReturnValue(v12);

    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "couldn't load current keys: can't fix TLK shares", buf, 2u);
    }
    goto LABEL_83;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
  v16 = sub_10000BDF4(CFSTR("ckksshare"), v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v174[5];
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Key set is %@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
  +[CKKSPowerCollection CKKSPowerEvent:zone:](CKKSPowerCollection, "CKKSPowerEvent:zone:", CFSTR("TLKShareProcessing"), v20);

  v21 = [AAFAnalyticsEventSecurity alloc];
  v190 = CFSTR("isLocked");
  v191 = &__kCFBooleanFalse;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "activeAccount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "altDSID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
  v132 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v21, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v22, v25, CFSTR("com.apple.security.ckks.healTLKShares.createMissingTLKShares"), 0, &off_10030AF70, objc_msgSend(v26, "sendMetric"));

  v27 = objc_autoreleasePoolPush();
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v174[5], "tlk"));
  v169 = 0;
  v29 = objc_msgSend(v28, "loadKeyMaterialFromKeychain:", &v169);
  v30 = v169;
  if (v30)
    v31 = 0;
  else
    v31 = v29;

  if ((v31 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lockStateTracker"));
    v34 = objc_msgSend(v33, "isLockedError:", v30);

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneName"));
      v37 = sub_10000BDF4(CFSTR("ckksshare"), v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Keychain is locked: can't fix shares yet: %@", buf, 0xCu);
      }

      -[CKKSHealTLKSharesOperation setFailedDueToLockState:](val, "setFailedDueToLockState:", 1);
      v188 = CFSTR("isLocked");
      v189 = &__kCFBooleanTrue;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1));
      -[AAFAnalyticsEventSecurity addMetrics:](v132, "addMetrics:", v39);

    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "zoneName"));
      v42 = sub_10000BDF4(CFSTR("ckksshare"), v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);

      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "couldn't load current tlk from keychain: %@", buf, 0xCu);
      }

      objc_msgSend(v136, "setViewKeyHierarchyState:", CFSTR("unhealthy"));
    }
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v132, 0, v30);
  }

  objc_autoreleasePoolPop(v27);
  if (!v31)
    goto LABEL_82;
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v44 = v127;
  v45 = (id *)-[NSObject countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v165, v187, 16);
  v133 = v44;
  if (!v45)
    goto LABEL_50;
  v130 = *(_QWORD *)v166;
  do
  {
    v46 = 0;
    to = v45;
    do
    {
      if (*(_QWORD *)v166 != v130)
        objc_enumerationMutation(v44);
      v47 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)v46);
      v48 = objc_autoreleasePoolPush();
      v49 = v174[5];
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "databaseProvider"));
      v164 = 0;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSHealTLKSharesOperation createMissingKeyShares:peers:databaseProvider:error:](CKKSHealTLKSharesOperation, "createMissingKeyShares:peers:databaseProvider:error:", v49, v47, v51, &v164));
      v53 = v164;

      if (v52 && !v53)
      {
        objc_msgSend(v128, "unionSet:", v52);
LABEL_36:
        v60 = 1;
        goto LABEL_47;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v174[5], "tlk"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "zoneName"));
      v56 = sub_10000BDF4(CFSTR("ckksshare"), v55);
      v57 = objc_claimAutoreleasedReturnValue(v56);

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v53;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Unable to create shares for trust set %@: %@", buf, 0x16u);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v132, 0, v53);
      if (!objc_msgSend(v47, "essential"))
        goto LABEL_36;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "domain"));
      if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.security.trustedpeers.container"))
        && objc_msgSend(v53, "code") == (id)1)
      {
        goto LABEL_35;
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "domain"));
      if (objc_msgSend(v59, "isEqualToString:", CFSTR("CKKSErrorDomain"))
        && objc_msgSend(v53, "code") == (id)52)
      {

LABEL_35:
        goto LABEL_39;
      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "domain"));
      if ((objc_msgSend(v61, "isEqualToString:", CFSTR("CKKSErrorDomain")) & 1) == 0)
      {

LABEL_43:
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "zoneName"));
        v69 = sub_10000BDF4(CFSTR("ckksshare"), v68);
        v70 = objc_claimAutoreleasedReturnValue(v69);

        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = 0;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Unable to create shares: %@", buf, 0xCu);
        }

        objc_msgSend(v136, "setViewKeyHierarchyState:", CFSTR("unhealthy"));
        goto LABEL_46;
      }
      v62 = objc_msgSend(v53, "code") == (id)24;

      if (!v62)
        goto LABEL_43;
LABEL_39:
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "zoneName"));
      v65 = sub_10000BDF4(CFSTR("ckksshare"), v64);
      v66 = objc_claimAutoreleasedReturnValue(v65);

      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = 0;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Unable to create shares due to some trust issue: %@", buf, 0xCu);
      }

      objc_msgSend(v136, "setViewKeyHierarchyState:", CFSTR("waitfortrust"));
      -[CKKSHealTLKSharesOperation setFailedDueToEssentialTrustState:](val, "setFailedDueToEssentialTrustState:", 1);
LABEL_46:
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v132, 0, 0);
      v60 = 0;
LABEL_47:

      objc_autoreleasePoolPop(v48);
      v44 = v133;
      if (!v60)
        goto LABEL_81;
      v46 = (id *)((char *)v46 + 1);
    }
    while (to != v46);
    v45 = (id *)-[NSObject countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v165, v187, 16);
  }
  while (v45);
LABEL_50:

  if (objc_msgSend(v128, "count"))
  {
    v185 = CFSTR("newTLKShares");
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v128, "count")));
    v186 = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1));
    -[AAFAnalyticsEventSecurity addMetrics:](v132, "addMetrics:", v72);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v132, 1, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "allObjects"));
    objc_msgSend((id)v174[5], "setPendingTLKShares:", v73);

    v74 = v174[5];
    v163 = 0;
    v75 = -[CKKSHealTLKSharesOperation areNewSharesSufficient:trustStates:error:](val, "areNewSharesSufficient:trustStates:error:", v74, v133, &v163);
    v76 = v163;
    if (v76)
      v77 = 0;
    else
      v77 = v75;
    if ((v77 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v184 = 0;
      v161[0] = 0;
      v161[1] = v161;
      v161[2] = 0x2020000000;
      v162 = 1;
      v78 = [AAFAnalyticsEventSecurity alloc];
      v181 = CFSTR("isPrioritized");
      v182 = &__kCFBooleanFalse;
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1));
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "activeAccount"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "altDSID"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
      v126 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v78, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v79, v82, CFSTR("com.apple.security.ckks.healTLKShares.uploadMissingTLKShares"), 0, &off_10030AF70, objc_msgSend(v83, "sendMetric"));

      v84 = objc_alloc_init((Class)NSMutableArray);
      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      v85 = v128;
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v157, v180, 16);
      if (v86)
      {
        v87 = *(_QWORD *)v158;
        do
        {
          for (i = 0; i != v86; i = (char *)i + 1)
          {
            if (*(_QWORD *)v158 != v87)
              objc_enumerationMutation(v85);
            v89 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)i);
            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "CKRecordWithZoneID:", v90));
            objc_msgSend(v84, "addObject:", v91);

          }
          v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v157, v180, 16);
        }
        while (v86);
      }

      for (j = 0; ; ++j)
      {
        v92 = 1000 * j;
        if (1000 * j >= (unint64_t)objc_msgSend(v85, "count"))
          break;
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "zoneName"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("heal-tlkshares-%@"), v94));
        v152[0] = _NSConcreteStackBlock;
        v152[1] = 3221225472;
        v152[2] = sub_100197D50;
        v152[3] = &unk_1002EA790;
        v96 = v85;
        v153 = v96;
        v156 = 1000 * j;
        v97 = v126;
        v154 = v97;
        v155 = v161;
        v131 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", v95, v152));

        -[CKKSGroupOperation dependOnBeforeGroupFinished:](val, "dependOnBeforeGroupFinished:", v131);
        v98 = objc_alloc_init((Class)NSMutableDictionary);
        v99 = (char *)objc_msgSend(v96, "count");
        if ((unint64_t)&v99[-v92] >= 0x3E8)
          v100 = 1000;
        else
          v100 = (uint64_t)&v99[-v92];
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "subarrayWithRange:", v92, v100));
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v102 = v101;
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v148, v179, 16);
        if (v103)
        {
          v104 = *(_QWORD *)v149;
          do
          {
            for (k = 0; k != v103; k = (char *)k + 1)
            {
              if (*(_QWORD *)v149 != v104)
                objc_enumerationMutation(v102);
              v106 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)k);
              v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "recordID"));
              objc_msgSend(v98, "setObject:forKeyedSubscript:", v106, v107);

            }
            v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v148, v179, 16);
          }
          while (v103);
        }

        v108 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v102, 0);
        objc_msgSend(v108, "setAtomic:", 1);
        objc_msgSend(v108, "setLongLived:", 0);
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "configuration"));
        objc_msgSend(v109, "setIsCloudKitSupportOperation:", 1);

        objc_msgSend(v108, "setQualityOfService:", 25);
        v146[0] = _NSConcreteStackBlock;
        v146[1] = 3221225472;
        v146[2] = sub_100197DA8;
        v146[3] = &unk_1002EA7B8;
        v110 = v136;
        v147 = v110;
        objc_msgSend(v108, "setPerRecordSaveBlock:", v146);
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, val);
        v137[0] = _NSConcreteStackBlock;
        v137[1] = 3221225472;
        v137[2] = sub_100197F10;
        v137[3] = &unk_1002EA808;
        objc_copyWeak(&v144, &location);
        v138 = v110;
        v142 = buf;
        v143 = v161;
        v139 = v97;
        v111 = v98;
        v140 = v111;
        v112 = v131;
        v141 = v112;
        objc_msgSend(v108, "setModifyRecordsCompletionBlock:", v137);
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation ckOperations](val, "ckOperations"));
        objc_msgSend(v108, "linearDependencies:", v113);

        v114 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation setResultStateOperation](val, "setResultStateOperation"));
        objc_msgSend(v114, "addDependency:", v112);

        v115 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](val, "deps"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "ckdatabase"));
        objc_msgSend(v116, "addOperation:", v108);

        objc_destroyWeak(&v144);
        objc_destroyWeak(&location);

      }
      _Block_object_dispose(v161, 8);
      _Block_object_dispose(buf, 8);
      v44 = 0;
    }
    else
    {
      v121 = v76;
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "zoneName"));
      v124 = sub_10000BDF4(CFSTR("ckksshare"), v123);
      v125 = objc_claimAutoreleasedReturnValue(v124);

      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v121;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "New shares won't resolve the share issue; erroring to avoid infinite loops: %@",
          buf,
          0xCu);
      }

      objc_msgSend(v136, "setViewKeyHierarchyState:", CFSTR("error"));
      v44 = v121;
    }
  }
  else
  {
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "zoneID"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "zoneName"));
    v119 = sub_10000BDF4(CFSTR("ckksshare"), v118);
    v120 = objc_claimAutoreleasedReturnValue(v119);

    v44 = v120;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Don't believe we need to change any TLKShares, stopping", buf, 2u);
    }
  }
LABEL_81:

LABEL_82:
  p_super = &v132->super;
LABEL_83:

  _Block_object_dispose(&v173, 8);
}

- (BOOL)areNewSharesSufficient:(id)a3 trustStates:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void **p_cache;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  void **v20;
  CKKSHealTLKSharesOperation *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id *v32;
  id v33;
  id obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];

  v35 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = a4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v8)
  {
    v9 = v8;
    v32 = a5;
    v10 = *(_QWORD *)v38;
    p_cache = OTAccountsActualAdapter.cache;
LABEL_3:
    v12 = 0;
    v33 = v9;
    while (1)
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealTLKSharesOperation deps](self, "deps"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "databaseProvider"));
      v36 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 453, "filterTrustedPeers:missingTLKSharesFor:databaseProvider:error:", v13, v35, v15, &v36));
      v17 = v36;

      if (v16)
        v18 = v17 == 0;
      else
        v18 = 0;
      if (!v18)
      {
        if (objc_msgSend(v13, "essential"))
        {
          if (v32)
          {
            v17 = objc_retainAutorelease(v17);
            *v32 = v17;
          }
          goto LABEL_23;
        }
        v19 = v10;
        v20 = p_cache;
        v21 = self;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tlk"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneName"));
        v24 = sub_10000BDF4(CFSTR("ckksshare"), v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v13;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to find peers for nonessential system: %@", buf, 0xCu);
        }

        self = v21;
        p_cache = v20;
        v10 = v19;
        v9 = v33;
      }
      if (objc_msgSend(v16, "count"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tlk"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "zoneName"));
        v29 = sub_10000BDF4(CFSTR("ckksshare"), v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v16;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "New share set is missing shares for peers: %@", buf, 0xCu);
        }

LABEL_23:
        v26 = 0;
        goto LABEL_24;
      }

      if (v9 == (id)++v12)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  v26 = 1;
LABEL_24:

  return v26;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (NSHashTable)ckOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 158, 1);
}

- (void)setCkOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 166, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (BOOL)cloudkitWriteFailures
{
  return self->_cloudkitWriteFailures;
}

- (void)setCloudkitWriteFailures:(BOOL)a3
{
  self->_cloudkitWriteFailures = a3;
}

- (BOOL)failedDueToLockState
{
  return self->_failedDueToLockState;
}

- (void)setFailedDueToLockState:(BOOL)a3
{
  self->_failedDueToLockState = a3;
}

- (BOOL)failedDueToEssentialTrustState
{
  return self->_failedDueToEssentialTrustState;
}

- (void)setFailedDueToEssentialTrustState:(BOOL)a3
{
  self->_failedDueToEssentialTrustState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckOperations + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_failedDueToEssentialTrustState + 4), 0);
}

+ (id)createMissingKeyShares:(id)a3 trustStates:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  id *v31;
  id v32;
  id obj;
  id v34;
  id v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];

  v32 = a3;
  v9 = a4;
  v10 = a5;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v9;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v11)
  {
    v12 = v11;
    v31 = a6;
    v34 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v39;
    v15 = v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v37 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createMissingKeyShares:peers:databaseProvider:error:", v15, v17, v10, &v37));
        v19 = v37;
        v20 = v19;
        if (v18)
          v21 = v19 == 0;
        else
          v21 = 0;
        if (v21)
        {
          if (v13)
          {
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "setByAddingObjectsFromSet:", v18));

            v13 = (id)v29;
          }
          else
          {
            v13 = v18;
          }
        }
        else
        {
          v35 = v13;
          v22 = v12;
          v23 = v14;
          v24 = v10;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tlk"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneName"));
          v27 = sub_10000BDF4(CFSTR("ckksshare"), v26);
          v28 = objc_claimAutoreleasedReturnValue(v27);

          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v17;
            v44 = 2112;
            v45 = v20;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Unable to create shares for trust set %@: %@", buf, 0x16u);
          }

          if (!v34)
            v34 = v20;
          v10 = v24;
          v15 = v32;
          v14 = v23;
          v12 = v22;
          v13 = v35;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v12);
    if (v13)
    {
      v11 = v34;
    }
    else
    {
      v11 = v34;
      if (v31 && v34)
      {
        v11 = objc_retainAutorelease(v34);
        v13 = 0;
        *v31 = v11;
      }
    }
  }
  else
  {
    v13 = 0;
    v15 = v32;
  }

  return v13;
}

+ (id)createMissingKeyShares:(id)a3 peers:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v51;
  void *v52;
  id obj;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tlk"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ownerName"));
  v67 = 0;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ensureKeyLoadedForContextID:error:", v14, &v67));
  v16 = v67;

  v57 = (void *)v15;
  if (v15)
  {
    v66 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filterTrustedPeers:missingTLKSharesFor:databaseProvider:error:", v10, v9, v11, &v66));
    v18 = v66;

    if (v17)
    {
      v60 = v18;
      v51 = v11;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v52 = v17;
      obj = v17;
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      if (v59)
      {
        v58 = *(_QWORD *)v63;
        v55 = v10;
        while (2)
        {
          for (i = 0; i != v59; i = (char *)i + 1)
          {
            if (*(_QWORD *)v63 != v58)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "publicEncryptionKey"));

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tlk"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneName"));
            v24 = sub_10000BDF4(CFSTR("ckksshare"), v23);
            v25 = objc_claimAutoreleasedReturnValue(v24);

            v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
            if (v21)
            {
              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tlk"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSelfPeers"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentSelf"));
                *(_DWORD *)buf = 138412802;
                v69 = v27;
                v70 = 2112;
                v71 = v29;
                v72 = 2112;
                v73 = v20;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Creating share of %@ as %@ for %@", buf, 0x20u);

              }
              v30 = v9;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tlk"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contextID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSelfPeers"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentSelf"));
              v61 = v60;
              v25 = objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord share:contextID:as:to:epoch:poisoned:error:](CKKSTLKShareRecord, "share:contextID:as:to:epoch:poisoned:error:", v57, v32, v34, v20, -1, 0, &v61));
              v18 = v61;

              if (v18)
              {
                v9 = v30;
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tlk"));
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "zoneName"));
                v48 = sub_10000BDF4(CFSTR("ckksshare"), v47);
                v49 = objc_claimAutoreleasedReturnValue(v48);

                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v69 = v20;
                  v70 = 2112;
                  v71 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Couldn't create new share for %@: %@", buf, 0x16u);
                }

                v10 = v55;
                if (a6)
                  *a6 = objc_retainAutorelease(v18);

                v36 = 0;
                v11 = v51;
                v35 = v56;
                goto LABEL_31;
              }
              objc_msgSend(v56, "addObject:", v25);
              v60 = 0;
              v9 = v30;
              v10 = v55;
            }
            else if (v26)
            {
              *(_DWORD *)buf = 138412290;
              v69 = v20;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No need to make TLK for %@; they don't have any encryption keys",
                buf,
                0xCu);
            }

          }
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          if (v59)
            continue;
          break;
        }
      }

      v35 = v56;
      v36 = v56;
      v11 = v51;
      v18 = v60;
LABEL_31:

      v41 = v52;
    }
    else
    {
      v41 = 0;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tlk"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "zoneName"));
      v44 = sub_10000BDF4(CFSTR("ckksshare"), v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);

      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v18;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Unable to find peers missing TLKShares: %@", buf, 0xCu);
      }

      if (a6)
      {
        v18 = objc_retainAutorelease(v18);
        v36 = 0;
        *a6 = v18;
      }
      else
      {
        v36 = 0;
      }
    }

    v16 = v18;
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tlk"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "zoneName"));
    v39 = sub_10000BDF4(CFSTR("ckksshare"), v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);

    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v16;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "TLK not loaded; cannot make shares for peers: %@",
        buf,
        0xCu);
    }

    if (a6)
    {
      v16 = objc_retainAutorelease(v16);
      v36 = 0;
      *a6 = v16;
    }
    else
    {
      v36 = 0;
    }
  }

  return v36;
}

+ (id)filterTrustedPeers:(id)a3 missingTLKSharesFor:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned __int8 v66;
  void *v67;
  unsigned int v68;
  void *v69;
  unsigned int v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned int v81;
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
  id v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  unsigned int v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  NSObject *v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  NSObject *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  NSObject *v138;
  uint64_t v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  NSObject *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  unsigned int v157;
  char v158;
  void *v159;
  id obj;
  id v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  NSObject *v165;
  void *v166;
  uint64_t v167;
  id v168;
  id v169;
  void *v170;
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[5];
  id v177;
  uint64_t *v178;
  _BYTE *v179;
  id v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t);
  void (*v185)(uint64_t);
  id v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  uint8_t v191[4];
  id v192;
  __int16 v193;
  void *v194;
  __int16 v195;
  void *v196;
  uint8_t v197[128];
  _BYTE buf[24];
  uint64_t (*v199)(uint64_t, uint64_t);
  void (*v200)(uint64_t);
  id v201;
  _BYTE v202[128];

  v9 = a3;
  v169 = a4;
  v161 = a5;
  v166 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTrustedPeersError"));

  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSelfPeersError"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
      v19 = sub_10000BDF4(CFSTR("ckksshare"), v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeersError"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Couldn't find missing shares because self peers aren't available: %@", buf, 0xCu);

      }
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeersError"));
      goto LABEL_12;
    }
    v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTrustedPeerIDs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSelfPeers"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentSelf"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "peerID"));
    v28 = objc_msgSend(v24, "containsObject:", v27);

    if ((v28 & 1) != 0)
    {
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeers"));
      v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v202, 16);
      if (v163)
      {
        v162 = *(_QWORD *)v188;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v188 != v162)
            {
              v30 = v29;
              objc_enumerationMutation(obj);
              v29 = v30;
            }
            v164 = v29;
            v170 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "zoneName"));
            v33 = objc_msgSend(v170, "shouldHaveView:", v32);

            if ((v33 & 1) != 0)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v199 = sub_100197CB4;
              v200 = sub_100197CC4;
              v201 = 0;
              v181 = 0;
              v182 = &v181;
              v183 = 0x3032000000;
              v184 = sub_100197CB4;
              v185 = sub_100197CC4;
              v186 = 0;
              if (v161)
              {
                v176[0] = _NSConcreteStackBlock;
                v176[1] = 3221225472;
                v176[2] = sub_10019A1C4;
                v176[3] = &unk_1002EB320;
                v178 = &v181;
                v176[4] = v170;
                v177 = v169;
                v179 = buf;
                objc_msgSend(v161, "dispatchSyncWithReadOnlySQLTransaction:", v176);

              }
              else
              {
                v38 = objc_autoreleasePoolPush();
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "peerID"));
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contextID"));
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "uuid"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "zoneID"));
                v46 = (id *)(*(_QWORD *)&buf[8] + 40);
                v180 = *(id *)(*(_QWORD *)&buf[8] + 40);
                v47 = objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord allFor:contextID:keyUUID:zoneID:error:](CKKSTLKShareRecord, "allFor:contextID:keyUUID:zoneID:error:", v39, v41, v43, v45, &v180));
                objc_storeStrong(v46, v180);
                v48 = (void *)v182[5];
                v182[5] = v47;

                objc_autoreleasePoolPop(v38);
              }
              v49 = (void *)v182[5];
              if (!v49 || *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "zoneName"));
                v52 = sub_10000BDF4(CFSTR("ckksshare"), v51);
                v53 = objc_claimAutoreleasedReturnValue(v52);

                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  v54 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  *(_DWORD *)v191 = 138412546;
                  v192 = v170;
                  v193 = 2112;
                  v194 = v54;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Unable to load existing TLKShares for peer (%@): %@", v191, 0x16u);
                }
LABEL_81:

                _Block_object_dispose(&v181, 8);
                _Block_object_dispose(buf, 8);

                goto LABEL_82;
              }
              v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "pendingTLKShares"));
              v56 = (void *)v55;
              if (v55)
                v57 = (void *)v55;
              else
                v57 = &__NSArray0__struct;
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v57));

              v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              v174 = 0u;
              v175 = 0u;
              v172 = 0u;
              v173 = 0u;
              v165 = v58;
              v59 = -[NSObject countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v172, v197, 16);
              if (!v59)
              {

LABEL_76:
                v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "zoneName"));
                v117 = sub_10000BDF4(CFSTR("ckksshare"), v116);
                v118 = objc_claimAutoreleasedReturnValue(v117);

                if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                {
                  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "uuid"));
                  *(_DWORD *)v191 = 138412802;
                  v192 = v170;
                  v193 = 2112;
                  v194 = v120;
                  v195 = 2112;
                  v196 = v159;
                  _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Peer %@ is shared %@ via insufficient shares: %@", v191, 0x20u);

                }
                v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "publicEncryptionKey"));

                if (v121)
                  objc_msgSend(v156, "addObject:", v170);
LABEL_80:

                v53 = v165;
                goto LABEL_81;
              }
              v158 = 0;
              v167 = *(_QWORD *)v173;
              while (2)
              {
                v60 = 0;
                v168 = v59;
LABEL_37:
                if (*(_QWORD *)v173 != v167)
                  objc_enumerationMutation(v165);
                v61 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v60);
                v62 = objc_autoreleasePoolPush();
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "share"));
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "receiverPeerID"));
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "peerID"));
                v66 = objc_msgSend(v64, "isEqualToString:", v65);

                if ((v66 & 1) != 0)
                {
                  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "senderPeerID"));
                  v68 = objc_msgSend(v67, "hasPrefix:", CFSTR("spid-"));

                  if (!v68)
                    goto LABEL_43;
                  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeers"));
                  v171 = 0;
                  v70 = objc_msgSend(v61, "signatureVerifiesWithPeerSet:error:", v69, &v171);
                  v71 = v171;

                  if (v70)
                  {

LABEL_43:
                    v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "tlkUUID"));
                    v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v72, "uuid"));
                    if ((objc_msgSend(v71, "isEqualToString:", v73) & 1) != 0)
                    {
                      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeerIDs"));
                      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "senderPeerID"));
                      v76 = objc_msgSend(v74, "containsObject:", v75);

                      if (!v76)
                      {
                        v96 = 0;
                        goto LABEL_62;
                      }
                      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "peerID"));
                      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeers"));
                      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "currentSelf"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "peerID"));
                      v81 = objc_msgSend(v77, "isEqualToString:", v80);

                      if (v81)
                      {
                        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeers"));
                        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "currentSelf"));
                        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "publicEncryptionKey"));
                        v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "keyData"));

                        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "senderPeerID"));
                        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeers"));
                        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "currentSelf"));
                        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "peerID"));
                        if (objc_msgSend(v85, "isEqualToString:", v88))
                        {
                          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "share"));
                          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "receiverPublicEncryptionKeySPKI"));
                          v157 = objc_msgSend(v90, "isEqual:", v71);

                          if (v157)
                          {
                            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "zoneName"));
                            v93 = sub_10000BDF4(CFSTR("ckksshare"), v92);
                            v72 = objc_claimAutoreleasedReturnValue(v93);

                            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                            {
                              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "uuid"));
                              *(_DWORD *)v191 = 138412802;
                              v192 = v170;
                              v193 = 2112;
                              v194 = v95;
                              v195 = 2112;
                              v196 = v61;
                              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Local peer %@ is shared %@ via self: %@", v191, 0x20u);

                            }
                            goto LABEL_59;
                          }
                        }
                        else
                        {

                        }
                        objc_msgSend(v159, "addObject:", v61);
LABEL_71:
                        v96 = 0;
LABEL_61:

LABEL_62:
                        objc_autoreleasePoolPop(v62);
                        if (v96 != 5 && v96)
                          goto LABEL_73;
                        if (v168 == (id)++v60)
                        {
                          v59 = -[NSObject countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v172, v197, 16);
                          if (!v59)
                          {
LABEL_73:

                            if ((v158 & 1) != 0)
                              goto LABEL_80;
                            goto LABEL_76;
                          }
                          continue;
                        }
                        goto LABEL_37;
                      }
                      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "publicEncryptionKey"));
                      v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "keyData"));

                      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "share"));
                      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "receiverPublicEncryptionKeySPKI"));
                      v103 = objc_msgSend(v102, "isEqual:", v71);

                      if (!v103)
                      {
                        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "zoneName"));
                        v111 = sub_10000BDF4(CFSTR("ckksshare"), v110);
                        v112 = objc_claimAutoreleasedReturnValue(v111);

                        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                        {
                          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "uuid"));
                          *(_DWORD *)v191 = 138412802;
                          v192 = v170;
                          v193 = 2112;
                          v194 = v114;
                          v195 = 2112;
                          v196 = v61;
                          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Peer %@ has a share for %@, but to old keys: %@", v191, 0x20u);

                        }
                        objc_msgSend(v159, "addObject:", v61);
                        goto LABEL_71;
                      }
                      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "zoneName"));
                      v106 = sub_10000BDF4(CFSTR("ckksshare"), v105);
                      v72 = objc_claimAutoreleasedReturnValue(v106);

                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                      {
                        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "uuid"));
                        *(_DWORD *)v191 = 138412802;
                        v192 = v170;
                        v193 = 2112;
                        v194 = v108;
                        v195 = 2112;
                        v196 = v61;
                        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Peer %@ is shared %@ via trusted %@", v191, 0x20u);

                      }
LABEL_59:
                      v158 = 1;
                      v96 = 4;
                    }
                    else
                    {

                      v96 = 0;
                    }
                  }
                  else
                  {
                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "zoneName"));
                    v99 = sub_10000BDF4(CFSTR("ckksshare"), v98);
                    v72 = objc_claimAutoreleasedReturnValue(v99);

                    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v191 = 138412546;
                      v192 = v71;
                      v193 = 2112;
                      v194 = v61;
                      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Existing TLKShare's signature doesn't verify with current peer set: %@ %@", v191, 0x16u);
                    }
                    v96 = 5;
                  }

                  goto LABEL_61;
                }
                break;
              }
              v96 = 5;
              goto LABEL_62;
            }
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
            v36 = sub_10000BDF4(CFSTR("ckksshare"), v35);
            v37 = objc_claimAutoreleasedReturnValue(v36);

            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v170;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Peer (%@) is not supposed to have view, skipping", buf, 0xCu);
            }

LABEL_82:
            v29 = v164 + 1;
          }
          while ((id)(v164 + 1) != v163);
          v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v202, 16);
        }
        while (v163);
      }

      if (objc_msgSend(v156, "count"))
      {
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "zoneName"));
        v124 = sub_10000BDF4(CFSTR("ckksshare"), v123);
        v125 = objc_claimAutoreleasedReturnValue(v124);

        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          v126 = objc_msgSend(v156, "count");
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v126;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v156;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Missing TLK shares for %lu peers: %@", buf, 0x16u);
        }

        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
        v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "zoneName"));
        v129 = sub_10000BDF4(CFSTR("ckksshare"), v128);
        v130 = objc_claimAutoreleasedReturnValue(v129);

        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          v131 = objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeersError"));
          v132 = (void *)v131;
          if (v131)
            v133 = (const __CFString *)v131;
          else
            v133 = CFSTR("no error");
          v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeers"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v133;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v134;
          _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "Self peers are (%@) %@", buf, 0x16u);

        }
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "zoneName"));
        v137 = sub_10000BDF4(CFSTR("ckksshare"), v136);
        v138 = objc_claimAutoreleasedReturnValue(v137);

        if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
        {
          v139 = objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeersError"));
          v140 = (void *)v139;
          if (v139)
            v141 = (const __CFString *)v139;
          else
            v141 = CFSTR("no error");
          v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeers"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v141;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v142;
          _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "Trusted peers are (%@) %@", buf, 0x16u);

        }
      }
      v143 = v156;
      v22 = v156;
    }
    else
    {
      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "zoneName"));
      v146 = sub_10000BDF4(CFSTR("ckksshare"), v145);
      v147 = objc_claimAutoreleasedReturnValue(v146);

      if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
      {
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeers"));
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "currentSelf"));
        v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "peerID"));
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeerIDs"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v150;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v151;
        _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "current self peer (%@) is not in the set of trusted peers: %@", buf, 0x16u);

      }
      if (a6)
      {
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentSelfPeers"));
        v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "currentSelf"));
        v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "peerID"));
        v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("current self peer (%@) is not in the set of trusted peers"), v154));
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 52, v155));

      }
      v22 = 0;
      v143 = v156;
    }

    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "tlk"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
  v13 = sub_10000BDF4(CFSTR("ckksshare"), v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeersError"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't find missing shares because trusted peers aren't available: %@", buf, 0xCu);

  }
  if (a6)
    *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "currentTrustedPeersError"));
LABEL_12:
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
LABEL_13:

  return v22;
}

@end
