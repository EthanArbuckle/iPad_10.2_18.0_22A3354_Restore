@implementation KTEnrollmentSignatureSupport

+ (void)updateClientData:(id)a3 deps:(id)a4 complete:(id)a5
{
  id v7;
  void *v8;
  id *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *i;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *j;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  KTPendingFlag *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  KDeviceSet *v99;
  char v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[6];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[5];
  id obj;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  _BYTE v138[128];
  uint8_t v139[128];
  uint8_t buf[4];
  void *v141;
  __int16 v142;
  id v143;
  __int16 v144;
  void *v145;
  _BYTE v146[128];

  v106 = a3;
  v7 = a4;
  v95 = a5;
  v131 = 0;
  v132 = 0;
  v133 = &v132;
  v134 = 0x3032000000;
  v135 = sub_10014BC44;
  v136 = sub_10014BC54;
  v137 = 0;
  v126 = 0;
  v127 = &v126;
  v128 = 0x3032000000;
  v129 = sub_10014BC44;
  v130 = sub_10014BC54;
  v122 = 0;
  v123 = &v122;
  v124 = 0x2020000000;
  v125 = 0;
  v105 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountOperations"));
  v9 = (id *)(v127 + 5);
  obj = (id)v127[5];
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primaryAccount:", &obj));
  objc_storeStrong(v9, obj);

  if (!v96)
  {
    if (qword_1002A77B0 != -1)
      dispatch_once(&qword_1002A77B0, &stru_100248018);
    v56 = qword_1002A77B8;
    if (os_log_type_enabled((os_log_t)qword_1002A77B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "TransparencyAccount no account", buf, 2u);
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    (*((void (**)(id, void *, _QWORD, _QWORD, uint64_t))v95 + 2))(v95, v57, 0, 0, v127[5]);
    goto LABEL_89;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountOperations"));
  v93 = objc_msgSend(v10, "accountLevel:", v96);

  if (v93 != (id)4)
  {
    if (qword_1002A77B0 != -1)
      dispatch_once(&qword_1002A77B0, &stru_100248038);
    v11 = qword_1002A77B8;
    if (os_log_type_enabled((os_log_t)qword_1002A77B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v141) = (_DWORD)v93;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "TransparencyAccount level not HSA2: %d", buf, 8u);
    }
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "aa_altDSID"));
  if (!v12)
  {
    if (qword_1002A77B0 != -1)
      dispatch_once(&qword_1002A77B0, &stru_100248058);
    v13 = qword_1002A77B8;
    if (os_log_type_enabled((os_log_t)qword_1002A77B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Can't get AltDSID", buf, 2u);
    }
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "aa_personID"));
  if (!v14)
  {
    if (qword_1002A77B0 != -1)
      dispatch_once(&qword_1002A77B0, &stru_100248078);
    v15 = qword_1002A77B8;
    if (os_log_type_enabled((os_log_t)qword_1002A77B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't get DSID", buf, 2u);
    }
  }
  v103 = (void *)v14;
  v104 = (void *)v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "requests"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));

  if (!objc_msgSend(v94, "count"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD))v95 + 2))(v95, v58, 0, 0, 0);
    goto LABEL_88;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "smDataStore"));
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_10014BD1C;
  v120[3] = &unk_10023E180;
  v120[4] = &v132;
  objc_msgSend(v17, "fetchDeviceSignature:complete:", v94, v120);

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v133[5], "allValues"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
  if (!v19)
  {
    v100 = 0;
    goto LABEL_62;
  }
  v100 = 0;
  v20 = *(_QWORD *)v117;
  v101 = v18;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v117 != v20)
        objc_enumerationMutation(v101);
      v22 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "requests"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v24));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tbsKTIDSRegistrationData"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tbsKTIDSRegistrationData"));
      LOBYTE(v24) = objc_msgSend(v26, "isEqual:", v27);

      if ((v24 & 1) == 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "logger"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TBS-%@-%@"), CFSTR("u"), v38));
        objc_msgSend(v37, "incrementIntegerPropertyForKey:", v39);

        if (qword_1002A77B0 != -1)
          dispatch_once(&qword_1002A77B0, &stru_100248098);
        v35 = (id)qword_1002A77B8;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tbsKTIDSRegistrationData"));
          v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "kt_hexString"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tbsKTIDSRegistrationData"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "kt_hexString"));
          *(_DWORD *)buf = 138412802;
          v141 = v40;
          v142 = 2112;
          v143 = v42;
          v144 = 2112;
          v145 = v44;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "TBS changed since last update: %@, old %@, new %@", buf, 0x20u);

        }
        v100 = 1;
        goto LABEL_51;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pushToken"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pushToken"));
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if ((v30 & 1) == 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "logger"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TBS-%@-%@"), CFSTR("h"), v46));
        objc_msgSend(v45, "incrementIntegerPropertyForKey:", v47);

        if (qword_1002A77B0 != -1)
          dispatch_once(&qword_1002A77B0, &stru_1002480B8);
        v35 = (id)qword_1002A77B8;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
          *(_DWORD *)buf = 138412290;
          v141 = v48;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Pushtoken changed since last update: %@", buf, 0xCu);

        }
        goto LABEL_51;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "altDSID"));
      v32 = v31;
      if (v31 && v104)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "altDSID"));
        v34 = objc_msgSend(v104, "isEqual:", v33);

        if ((v34 & 1) == 0)
        {
          if (qword_1002A77B0 != -1)
            dispatch_once(&qword_1002A77B0, &stru_1002480D8);
          v35 = (id)qword_1002A77B8;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
            *(_DWORD *)buf = 138412290;
            v141 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "TBS have different DSID: %@", buf, 0xCu);

          }
          goto LABEL_51;
        }
      }
      else
      {

      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dsid"));
      v50 = v49 == 0;

      if (v50)
      {
        if (qword_1002A77B0 != -1)
          dispatch_once(&qword_1002A77B0, &stru_1002480F8);
        v51 = (id)qword_1002A77B8;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
          *(_DWORD *)buf = 138412290;
          v141 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "TBS missing dsid, adding in: %@", buf, 0xCu);

        }
        objc_msgSend(v22, "setDsid:", v103);
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "signature"));
      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "publicKey"));
        v55 = v54 == 0;

        if (!v55)
        {
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
          objc_msgSend(v97, "addObject:", v35);
LABEL_51:

        }
      }

      v21 = (char *)v21 + 1;
    }
    while (v19 != v21);
    v18 = v101;
    v19 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
  }
  while (v19);
LABEL_62:

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v94));
  objc_msgSend(v59, "minusSet:", v97);
  v98 = v59;
  v99 = objc_alloc_init(KDeviceSet);
  if (objc_msgSend(v59, "count"))
  {
    v102 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v60 = v59;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v139, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(_QWORD *)v113 != v62)
            objc_enumerationMutation(v60);
          v64 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)i);
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "requests"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", v64));

          v67 = objc_alloc((Class)TransparencyIDSRegistrationData);
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "tbsKTIDSRegistrationData"));
          v69 = objc_msgSend(v67, "initWithApplication:registrationData:", v64, v68);

          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "pushToken"));
          objc_msgSend(v69, "setPushToken:", v70);

          objc_msgSend(v69, "setAltDSID:", v104);
          objc_msgSend(v69, "setDsid:", v103);
          objc_msgSend(v102, "addObject:", v69);
          objc_msgSend((id)v133[5], "setObject:forKeyedSubscript:", v69, v64);
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "pushToken"));
          if (v71)
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "tbsKTIDSRegistrationData"));
            v73 = v72 == 0;

            if (!v73)
            {
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "pushToken"));
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "tbsKTIDSRegistrationData"));
              v76 = -[KDeviceSet addDevice:registationData:app:](v99, "addDevice:registationData:app:", v74, v75, v64);

            }
          }

        }
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v139, 16);
      }
      while (v61);
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "smDataStore"));
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_10014BE28;
    v111[3] = &unk_100248120;
    v111[4] = &v126;
    v111[5] = &v122;
    objc_msgSend(v77, "storeDeviceSignature:complete:", v102, v111);

    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "cloudRecords"));
    if (v78)
    {
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v99, "devices"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "allObjects"));

      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v107, v138, 16);
      if (v81)
      {
        v82 = *(_QWORD *)v108;
        do
        {
          for (j = 0; j != v81; j = (char *)j + 1)
          {
            if (*(_QWORD *)v108 != v82)
              objc_enumerationMutation(v80);
            v84 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)j);
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "cloudRecords"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "pushToken"));
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "registrationData"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "apps"));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "allObjects"));
            objc_msgSend(v85, "updateSelfCloudDeviceWithPushToken:tbsRegistrationData:applications:", v86, v87, v89);

          }
          v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v107, v138, 16);
        }
        while (v81);
      }

      if (v93 == (id)4)
      {
        v90 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("CloudKitOutgoing"), 2, 5.0);
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "flagHandler"));
        objc_msgSend(v91, "handlePendingFlag:", v90);

      }
    }

  }
  if (v93 == (id)4)
    v92 = (void *)v133[5];
  else
    v92 = &__NSDictionary0__struct;
  (*((void (**)(id, void *, _QWORD, _QWORD, uint64_t))v95 + 2))(v95, v92, *((unsigned __int8 *)v123 + 24), v100 & 1, v127[5]);

  v58 = v97;
LABEL_88:

  v57 = v104;
LABEL_89:

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v126, 8);

  _Block_object_dispose(&v132, 8);
}

+ (id)enrollementLoggingKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(&off_10025C760, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(&off_10025C760);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TBS-%@-%@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), v3));
        objc_msgSend(v4, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(&off_10025C760, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)validateSignatures:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10014BC44;
  v19 = sub_10014BC54;
  v20 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smDataStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014C10C;
  v11[3] = &unk_100248148;
  v13 = &v15;
  v14 = &v21;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "fetchDeviceSignature:complete:", 0, v11);

  if (a4)
  {
    v8 = (void *)v16[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end
