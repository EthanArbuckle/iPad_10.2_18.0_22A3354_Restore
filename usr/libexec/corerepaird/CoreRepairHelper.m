@implementation CoreRepairHelper

- (void)setupModuleChallengeCallBack:(__AMFDR *)a3
{
  AMFDRRegisterModuleChallengeCallback(a3, CFSTR("vcrt"), sub_100006718);
  AMFDRRegisterModuleChallengeCallback(a3, CFSTR("bcrt"), sub_100006778);
  AMFDRRegisterModuleChallengeCallback(a3, CFSTR("tcrt"), sub_1000067D8);
  AMFDRRegisterModuleChallengeCallback(a3, CFSTR("prpc"), sub_100006838);
}

- (CoreRepairHelper)init
{
  CoreRepairHelper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreRepairHelper;
  result = -[CoreRepairHelper init](&v3, "init");
  if (result)
    result->_factoryServiceOn = 0;
  return result;
}

+ (id)sharedInstance
{
  if (qword_100066848 != -1)
    dispatch_once(&qword_100066848, &stru_100050C10);
  return (id)qword_100066840;
}

- (void)seal:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void (**v104)(id, void *);
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
  _QWORD v114[6];
  _QWORD v115[6];
  _QWORD v116[2];
  _QWORD v117[2];
  uint8_t buf[4];
  void *v119;

  v6 = a3;
  v104 = (void (**)(id, void *))a4;
  v107 = (void *)os_transaction_create("com.apple.corerepaird");
  v112 = 0;
  v113 = 0;
  v111 = 0;
  v7 = (void *)objc_opt_new(CRUtils);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doSeal")));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = objc_msgSend(v6, "mutableCopy");
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyBlob")));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyBlob")));
    v14 = objc_opt_class(NSData);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    if ((isKindOfClass & 1) != 0)
    {
      v16 = handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Use Key Blob", buf, 2u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyBlob")));
      objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("keyBlob"));

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRFileSystemController sharedSingleton](CRFileSystemController, "sharedSingleton"));
  v20 = objc_msgSend(v19, "setupAlternativeFDRPath:", v6);

  if ((v20 & 1) == 0)
  {
    v66 = handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1000372B0(v39, v67, v68, v69, v70, v71, v72, v73);
    goto LABEL_65;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRFileSystemController sharedSingleton](CRFileSystemController, "sharedSingleton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "setupFileSystemForRepair"));

  if (!v22)
  {
    v74 = handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue(v74);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100037150(v39, v75, v76, v77, v78, v79, v80, v81);
LABEL_65:
    v46 = 0;
    v22 = 0;
    v33 = 0;
    v101 = 0;
    v32 = -16;
    goto LABEL_28;
  }
  objc_msgSend(v10, "setObject:forKey:", v22, CFSTR("datapath"));
  v23 = handleForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v119 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Temporary FDR Directory is %@", buf, 0xCu);
  }

  v25 = handleForCategory(0);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Starting to seal FDR", buf, 2u);
  }

  if (!v9)
  {
    v28 = 0;
LABEL_25:
    v47 = handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "FDR Seal Successful", buf, 2u);
    }

    v101 = v28;
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "handler"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject warnings](v39, "warnings"));
    v33 = 0;
    v32 = 0;
    goto LABEL_28;
  }
  v27 = objc_msgSend(objc_alloc((Class)CRFDRSeal), "initWithParameters:", v10);
  if (!v27)
  {
    v82 = handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100037184((uint64_t)v6, v39, v83, v84, v85, v86, v87, v88);
    v46 = 0;
    v33 = 0;
    v101 = 0;
    goto LABEL_23;
  }
  v28 = v27;
  if (-[CoreRepairHelper factoryServiceOn](self, "factoryServiceOn"))
  {
    v29 = handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Enable service board support", buf, 2u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "handler"));
    objc_msgSend(v31, "setAllowFactoryReset:", 1);

  }
  objc_msgSend(v28, "setDelegate:", self);
  v110 = 0;
  v32 = (uint64_t)objc_msgSend(v28, "seal:oldSealingManifest:newSealingManifest:stats:", &v110, &v113, &v112, &v111);
  v33 = v110;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "convertDataToHexInDictionary:", v113));
  v35 = v113;
  v113 = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "convertDataToHexInDictionary:", v112));
  v37 = v112;
  v112 = v36;

  if (!v32)
  {
    if (v33)
    {
      v101 = v28;
      v38 = handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_1000371E8((uint64_t)v33, v39, v40, v41, v42, v43, v44, v45);
      v46 = 0;
LABEL_23:
      v32 = -3;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v101 = v28;
  v89 = handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue(v89);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    sub_10003724C(v32, v39, v90, v91, v92, v93, v94, v95);
  v46 = 0;
LABEL_28:

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[CRFileSystemController sharedSingleton](CRFileSystemController, "sharedSingleton"));
  v50 = objc_msgSend(v49, "cleanupFileSystemForRepair");

  v51 = -18;
  if (v32)
    v51 = v32;
  if (v50)
    v52 = v32;
  else
    v52 = v51;
  if (v33)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CRUtils getInnermostNSError:](CRUtils, "getInnermostNSError:", v33));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v53, "code")));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description"));

  }
  else
  {
    v54 = 0;
    v109 = 0;
  }
  v116[0] = CFSTR("statusCode");
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v52));
  v116[1] = CFSTR("data");
  v117[0] = v102;
  v114[0] = CFSTR("fdrErrorCode");
  v55 = (uint64_t)v54;
  if (!v54)
    v55 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v108 = v6;
  v100 = (void *)v55;
  v115[0] = v55;
  v114[1] = CFSTR("fdrErrorDescription");
  v56 = (uint64_t)v109;
  if (!v109)
    v56 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v106 = v7;
  v115[1] = v56;
  v114[2] = CFSTR("oldSealingManifest");
  v57 = v113;
  v58 = v113;
  if (!v113)
    v58 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v98 = v58;
  v99 = (void *)v56;
  v115[2] = v58;
  v114[3] = CFSTR("newSealingManifest");
  v59 = v112;
  v60 = v112;
  if (!v112)
    v60 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v105 = v10;
  v96 = v60;
  v115[3] = v60;
  v114[4] = CFSTR("Stats");
  v61 = v111;
  v62 = v111;
  if (!v111)
    v62 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v60, v98, v99, v100));
  v103 = v33;
  v115[4] = v62;
  v114[5] = CFSTR("warnings");
  v63 = v46;
  if (!v46)
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v115[5] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 6, v96));
  v117[1] = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 2));
  v104[2](v104, v65);

  if (!v46)
  if (!v61)

  if (v59)
  {
    if (v57)
      goto LABEL_54;
  }
  else
  {

    if (v57)
      goto LABEL_54;
  }

LABEL_54:
  if (!v109)

  if (!v54)
}

- (void)daemonControl:(id)a3 withReply:(id)a4
{
  +[CRDaemonController controlWithParameters:withReply:](CRDaemonController, "controlWithParameters:withReply:", a3, a4);
}

- (void)queryRepairDeltaWithReply:(id)a3
{
  CRPreflight *v3;
  CRPreflight *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_opt_new(CRPreflight);
  v4 = v3;
  if (v3)
  {
    -[CRPreflight queryRepairDeltaWithReply:](v3, "queryRepairDeltaWithReply:", v6);
  }
  else if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, -81, 0));
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v5);

  }
}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v5;
  CRPreflight *v6;
  CRPreflight *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_opt_new(CRPreflight);
  v7 = v6;
  if (v6)
  {
    -[CRPreflight issueRepairCert:withReply:](v6, "issueRepairCert:withReply:", v9, v5);
  }
  else if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, -81, 0));
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, 0, v8);

  }
}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v6;
  CoreRepairHelper *v7;
  CRPreflight *v8;
  CRPreflight *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = objc_opt_new(CRPreflight);
  v9 = v8;
  if (v8)
  {
    -[CRPreflight challengeStrongComponents:withReply:](v8, "challengeStrongComponents:withReply:", v11, v6);
  }
  else if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, -81, 0));
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v10);

  }
  objc_sync_exit(v7);

}

- (void)sign:(id)a3 keyBlob:(id)a4 withReply:(id)a5
{
  id v7;
  id v8;
  CRPreflight *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  v9 = objc_opt_new(CRPreflight);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRPreflight sign:keyBlob:](v9, "sign:keyBlob:", v8, v7));

  if (v11)
    v11[2](v11, v10);

}

- (void)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5 withReply:(id)a6
{
  id v9;
  id v10;
  id v11;
  CRPreflight *v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  v15 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_opt_new(CRPreflight);
  v13 = -[CRPreflight verify:signature:keyBlob:](v12, "verify:signature:keyBlob:", v11, v10, v9);

  v14 = v15;
  if (v15)
  {
    (*((void (**)(id, _BOOL8))v15 + 2))(v15, v13);
    v14 = v15;
  }

}

- (BOOL)_mount:(const char *)a3 withFlag:(int)a4
{
  fstab *v6;
  uint64_t v7;
  NSObject *v8;
  int *v9;
  char *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  char *fs_spec;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;

  v19 = 0;
  v18 = 0u;
  v17 = 0u;
  v6 = getfsfile(a3);
  if (!v6)
  {
    v14 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = a3;
      v11 = "get fs file failed for mount %s";
      v12 = v8;
      v13 = 12;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  fs_spec = v6->fs_spec;
  if (mount(v6->fs_vfstype, a3, a4, &fs_spec))
  {
    v7 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = __error();
      v10 = strerror(*v9);
      *(_DWORD *)buf = 136315394;
      v21 = a3;
      v22 = 2080;
      v23 = v10;
      v11 = "mount failed for %s filesystem: %s\n";
      v12 = v8;
      v13 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)decompressPearlFramesWithReply:(id)a3
{
  CRPearlController *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v3 = objc_opt_new(CRPearlController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRPearlController decompressPearlFrames](v3, "decompressPearlFrames"));

  if (v5)
    v5[2](v5, v4);

}

- (void)updateSavageDATFirmwareWithReply:(id)a3
{
  CRPearlController *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v3 = objc_opt_new(CRPearlController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRPearlController updateSavageDATFirmware](v3, "updateSavageDATFirmware"));

  if (v5)
    v5[2](v5, v4);

}

- (void)updateBrunorDATFirmwareWithReply:(id)a3
{
  CRPearlController *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v3 = objc_opt_new(CRPearlController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRPearlController updateBrunorDATFirmware](v3, "updateBrunorDATFirmware"));

  if (v5)
    v5[2](v5, v4);

}

- (void)verifyPSD3WithReply:(id)a3
{
  CRPearlController *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v3 = objc_opt_new(CRPearlController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRPearlController verifyPSD3](v3, "verifyPSD3"));

  if (v5)
    v5[2](v5, v4);

}

- (BOOL)factoryServiceOn
{
  return self->_factoryServiceOn;
}

- (void)setFactoryServiceOn:(BOOL)a3
{
  self->_factoryServiceOn = a3;
}

@end
