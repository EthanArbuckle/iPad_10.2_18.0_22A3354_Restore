@implementation ADSearchSession

- (void)setOdmlSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)requestUserTargetingIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADSearchSession requestUserTargetingIdentifier:]";
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  objc_msgSend_workQueue(MEMORY[0x24BE02228], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22827BCB0;
  v14[3] = &unk_24F0D9020;
  v15 = v3;
  v10 = v3;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v14, v12, v13);

}

- (ADSearchSession)initWithAppID:(id)a3 appVersion:(id)a4 appsRank:(int)a5 storeFront:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ADSearchSession *v18;
  void *v19;
  ADCapService *v20;
  ADCapService *capService;
  ADParameterFactory *v22;
  ADParameterFactory *parameterFactory;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *campaignNamespace;
  NSString *clientRequestID;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  dispatch_queue_t v70;
  OS_dispatch_queue *idNotificationQueue;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  NSObject *notificationObserver;
  dispatch_queue_t v86;
  OS_dispatch_queue *odmlQueue;
  NSObject *v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD block[4];
  ADSearchSession *v101;
  _QWORD v102[4];
  id v103;
  id location;
  objc_super v105;
  uint8_t buf[4];
  id v107;
  __int16 v108;
  uint64_t v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v105.receiver = self;
  v105.super_class = (Class)ADSearchSession;
  v18 = -[ADSearchSession init](&v105, sel_init);
  if (v18)
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(ADCapService);
    capService = v18->_capService;
    v18->_capService = v20;

    v22 = objc_alloc_init(ADParameterFactory);
    parameterFactory = v18->_parameterFactory;
    v18->_parameterFactory = v22;

    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKey_(v28, v29, (uint64_t)CFSTR("ToroCampaignNamespace"), v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    campaignNamespace = v18->_campaignNamespace;
    v18->_campaignNamespace = (NSString *)v32;

    objc_storeStrong((id *)&v18->_appID, a3);
    objc_storeStrong((id *)&v18->_appVersion, a4);
    v18->_appsRank = a5;
    clientRequestID = v18->_clientRequestID;
    v18->_clientRequestID = 0;

    v39 = (id)objc_msgSend_sharedNetworkController(MEMORY[0x24BE021F0], v35, v36, v37, v38);
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBundleIdentifier_(v44, v45, (uint64_t)v11, v46, v47);
    objc_msgSend_setITunesStorefront_(v44, v48, (uint64_t)v13, v49, v50);
    v55 = (id)objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], v51, v52, v53, v54);
    v60 = (id)objc_msgSend_sharedInstance(MEMORY[0x24BDFD490], v56, v57, v58, v59);
    if (MGGetBoolAnswer())
    {
      objc_msgSend_sharedInstance(ADSearchAdsSettings, v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_checkDefaultsAndSetInternalSettingsOverrides(v65, v66, v67, v68, v69);

    }
    v18->_notificationReceivedAndWaiting = 0;
    v70 = dispatch_queue_create("com.apple.ap.SearchAds.notificationQueue", 0);
    idNotificationQueue = v18->_idNotificationQueue;
    v18->_idNotificationQueue = (OS_dispatch_queue *)v70;

    objc_initWeak(&location, v18);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_workQueue(MEMORY[0x24BE02228], v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = MEMORY[0x24BDAC760];
    v102[0] = MEMORY[0x24BDAC760];
    v102[1] = 3221225472;
    v102[2] = sub_228285960;
    v102[3] = &unk_24F0D8FB0;
    objc_copyWeak(&v103, &location);
    objc_msgSend_addObserverForName_object_queue_usingBlock_(v76, v83, (uint64_t)CFSTR("kADIDManager_ChangedNotification"), *MEMORY[0x24BE02100], (uint64_t)v81, v102);
    v84 = objc_claimAutoreleasedReturnValue();
    notificationObserver = v18->_notificationObserver;
    v18->_notificationObserver = v84;

    v86 = dispatch_queue_create("com.apple.ap.SearchAds.odmlQueue", 0);
    odmlQueue = v18->_odmlQueue;
    v18->_odmlQueue = (OS_dispatch_queue *)v86;

    v88 = v18->_odmlQueue;
    block[0] = v82;
    block[1] = 3221225472;
    block[2] = sub_228285A84;
    block[3] = &unk_24F0D8F60;
    v101 = v18;
    dispatch_async(v88, block);
    APLogForCategory();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_date(MEMORY[0x24BDBCE60], v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceDate_(v94, v95, (uint64_t)v19, v96, v97);
      *(_DWORD *)buf = 138412546;
      v107 = v11;
      v108 = 2048;
      v109 = v98;
      _os_log_impl(&dword_228279000, v89, OS_LOG_TYPE_DEFAULT, "TORO: ADSearchSession initWithAppID:%@ initTime: %0.3lf", buf, 0x16u);

    }
    objc_destroyWeak(&v103);
    objc_destroyWeak(&location);

  }
  return v18;
}

- (ADSearchSession)initWithAppID:(id)a3 appVersion:(id)a4 appsRank:(int)a5
{
  return (ADSearchSession *)MEMORY[0x24BEDD108](self, sel_initWithAppID_appVersion_appsRank_storeFront_, a3, a4, *(_QWORD *)&a5);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  objc_super v8;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self->_notificationObserver, (uint64_t)CFSTR("kADIDManager_ChangedNotification"), *MEMORY[0x24BE02100]);

  v8.receiver = self;
  v8.super_class = (Class)ADSearchSession;
  -[ADSearchSession dealloc](&v8, sel_dealloc);
}

- (BOOL)startUpdatingIDs
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int IDs;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228279000, v2, OS_LOG_TYPE_DEFAULT, "Updating to the current user.", buf, 2u);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IDs = objc_msgSend_loadIDs(v7, v8, v9, v10, v11);

  if (IDs)
  {
    APLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_228279000, v13, OS_LOG_TYPE_DEFAULT, "We have now updated the active IDs.", v15, 2u);
    }

  }
  return IDs;
}

- (void)setCampaignNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_campaignNamespace, a3);
}

- (id)campaignNamespaceParameter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_parameterFactory(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_campaignNamespace(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_campaignNamespaceParameterWithCampaignNamespace_(v6, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)adParameters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int isTest;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int isCustomTemplate;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;

  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capService(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cleanDownloadData(v11, v12, v13, v14, v15);

  objc_msgSend_parameterFactory(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frequencyCapDataParameter(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend_addObject_(v6, v26, (uint64_t)v25, v28, v29);
  objc_msgSend_parameterFactory(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toroClickCountDataParameter(v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    objc_msgSend_addObject_(v6, v36, (uint64_t)v35, v38, v39);
  objc_msgSend_sharedInstance(ADSearchAdsSettings, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  isTest = objc_msgSend_isTest(v40, v41, v42, v43, v44);

  if (isTest)
  {
    objc_msgSend_parameterFactory(self, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_campaignNamespace(self, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_campaignNamespaceParameterWithCampaignNamespace_(v50, v56, (uint64_t)v55, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
      objc_msgSend_addObject_(v6, v60, (uint64_t)v59, v62, v63);
    objc_msgSend_parameterFactory(self, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privacyDataKeyParameter(v64, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
      objc_msgSend_addObject_(v6, v70, (uint64_t)v69, v72, v73);
    objc_msgSend_sharedInstance(ADSearchAdsSettings, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    isCustomTemplate = objc_msgSend_isCustomTemplate(v74, v75, v76, v77, v78);

    if (isCustomTemplate)
    {
      objc_msgSend_parameterFactory(self, v80, v81, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestedAdDataParameter(v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
        objc_msgSend_addObject_(v6, v90, (uint64_t)v89, v92, v93);
      objc_msgSend_parameterFactory(self, v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestedTemplateTypeParameter(v94, v95, v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (v99)
        objc_msgSend_addObject_(v6, v100, (uint64_t)v99, v101, v102);

    }
  }

  return v6;
}

- (id)userTargetingProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int isManagedAppleID;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  int isEqualToString;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  int isPersonalizedAdsEnabled;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  NSString *v239;
  NSString *clientRequestID;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(ADSearchAdsSettings, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x24BDBCE60], v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (double)(int)objc_msgSend_AD_toServerTime(v21, v22, v23, v24, v25);

  v27 = objc_alloc_init(MEMORY[0x24BE02240]);
  objc_msgSend_setClientClockTime_(v27, v28, v29, v30, v31, v26);
  objc_msgSend_appID(self, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppID_(v27, v37, (uint64_t)v36, v38, v39);

  objc_msgSend_deviceModel(v11, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceModel_(v27, v45, (uint64_t)v44, v46, v47);

  objc_msgSend_timezone(v11, v48, v49, v50, v51);
  objc_msgSend_setTimezone_(v27, v52, v53, v54, v55);
  v60 = objc_msgSend_runState(v11, v56, v57, v58, v59);
  objc_msgSend_setRunState_(v27, v61, v60, v62, v63);
  objc_msgSend_appVersion(self, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppVersion_(v27, v69, (uint64_t)v68, v70, v71);

  objc_msgSend_osVersionAndBuild(v11, v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOsVersionAndBuild_(v27, v77, (uint64_t)v76, v78, v79);

  objc_msgSend_iTunesStorefront(v11, v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setITunesStore_(v27, v85, (uint64_t)v84, v86, v87);

  objc_msgSend_localeIdentifier(v11, v88, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocaleIdentifier_(v27, v93, (uint64_t)v92, v94, v95);

  objc_msgSend_userKeyboards(v16, v96, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend_mutableCopy(v100, v101, v102, v103, v104);
  objc_msgSend_setUserKeyboards_(v27, v106, (uint64_t)v105, v107, v108);

  v113 = objc_msgSend_appsRank(self, v109, v110, v111, v112);
  objc_msgSend_setAppsRank_(v27, v114, v113, v115, v116);
  v121 = objc_msgSend_connectionType(v11, v117, v118, v119, v120);
  objc_msgSend_setConnectionType_(v27, v122, v121, v123, v124);
  v129 = objc_msgSend_educationModeEnabled(v11, v125, v126, v127, v128);
  objc_msgSend_addDeviceMode_(v27, v130, v129, v131, v132);
  objc_msgSend_activeDSIDRecord(v6, v133, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isPlaceholderAccount(v137, v138, v139, v140, v141) & 1) != 0)
  {
    objc_msgSend_addAccountType_(v27, v142, 0, v144, v145);
  }
  else if ((objc_msgSend_accountAgeUnknown(v137, v142, v143, v144, v145) & 1) != 0)
  {
    objc_msgSend_addAccountType_(v27, v150, 6, v152, v153);
  }
  else
  {
    isManagedAppleID = objc_msgSend_isManagedAppleID(v11, v150, v151, v152, v153);
    if (isManagedAppleID)
      objc_msgSend_addAccountType_(v27, v154, 2, v156, v157);
    if (objc_msgSend_accountIsU13(v137, v154, v155, v156, v157))
    {
      objc_msgSend_addAccountType_(v27, v159, 3, v161, v162);
      v163 = 0;
    }
    else
    {
      v163 = isManagedAppleID ^ 1;
    }
    objc_msgSend_accountIsT13(v137, v159, v160, v161, v162);
    if ((objc_msgSend_accountIsU18(v137, v164, v165, v166, v167) & 1) != 0)
    {
      objc_msgSend_addAccountType_(v27, v146, 5, v148, v149);
    }
    else if (v163)
    {
      objc_msgSend_addAccountType_(v27, v146, 1, v148, v149);
      if (objc_msgSend_sensitiveContentEligible(v137, v168, v169, v170, v171))
        objc_msgSend_addAccountType_(v27, v146, 7, v148, v149);
    }
  }
  objc_msgSend_iCloudDSID(v11, v146, v147, v148, v149);
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  if (v172)
  {
    objc_msgSend_iCloudDSID(v11, v173, v174, v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_iTunesAccountDSID(v11, v178, v179, v180, v181);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v177, v183, (uint64_t)v182, v184, v185);

    if (isEqualToString)
      objc_msgSend_addAccountState_(v27, v187, 1, v188, v189);
    else
      objc_msgSend_addAccountState_(v27, v187, 2, v188, v189);
  }
  else
  {
    objc_msgSend_addAccountState_(v27, v173, 0, v175, v176);
  }
  objc_msgSend_adParameters(self, v190, v191, v192, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetings_(v27, v195, (uint64_t)v194, v196, v197);

  isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v11, v198, v199, v200, v201);
  objc_msgSend_setLimitAdTracking_(v27, v203, isPersonalizedAdsEnabled ^ 1u, v204, v205);
  objc_msgSend_algoID(v16, v206, v207, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlgoId_(v27, v211, (uint64_t)v210, v212, v213);

  v218 = objc_msgSend_PersonalizedAdsMonthResetCount(v6, v214, v215, v216, v217);
  objc_msgSend_setAdvertisingIdentifierMonthResetCount_(v27, v219, v218, v220, v221);
  objc_msgSend_UUID(MEMORY[0x24BDD1880], v222, v223, v224, v225);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v226, v227, v228, v229, v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceRequestID_(v27, v232, (uint64_t)v231, v233, v234);

  objc_msgSend_deviceRequestID(v27, v235, v236, v237, v238);
  v239 = (NSString *)objc_claimAutoreleasedReturnValue();
  clientRequestID = self->_clientRequestID;
  self->_clientRequestID = v239;

  objc_msgSend_idForClientType_(v6, v241, 4, v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToroIDString_(v27, v245, (uint64_t)v244, v246, v247);

  objc_msgSend_idForClientType_(v6, v248, 0, v249, v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIAdIDString_(v27, v252, (uint64_t)v251, v253, v254);

  objc_msgSend_idForClientType_(v6, v255, 5, v256, v257);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDPIDString_(v27, v259, (uint64_t)v258, v260, v261);

  if ((objc_msgSend_isManagedAppleID(v11, v262, v263, v264, v265) & 1) == 0
    && (objc_msgSend_educationModeEnabled(v11, v266, v267, v268, v269) & 1) == 0)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BDFD490], v270, v271, v272, v273);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_locationInfo(v274, v275, v276, v277, v278);
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = v279;
    if (v279)
    {
      objc_msgSend_isoCountryCode(v279, v280, v281, v282, v283);
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIsoCountryCode_(v27, v286, (uint64_t)v285, v287, v288);

      objc_msgSend_postalCode(v284, v289, v290, v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPostalCode_(v27, v294, (uint64_t)v293, v295, v296);

      objc_msgSend_administrativeArea(v284, v297, v298, v299, v300);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAdministrativeArea_(v27, v302, (uint64_t)v301, v303, v304);

      objc_msgSend_locality(v284, v305, v306, v307, v308);
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLocality_(v27, v310, (uint64_t)v309, v311, v312);

      objc_msgSend_subAdministrativeArea(v284, v313, v314, v315, v316);
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSubAdministrativeArea_(v27, v318, (uint64_t)v317, v319, v320);

    }
  }

  return v27;
}

- (id)populateStoreFrontLanguageLocale:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int isEqualToString;
  uint64_t v41;
  void *v42;
  char v43;
  id v44;

  v3 = a3;
  objc_msgSend_sharedInstance(ADSearchAdsSettings, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isTest(v8, v14, v15, v16, v17))
    goto LABEL_14;
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v22, v23, (uint64_t)CFSTR("StorefrontLanguageLocale"), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v31, v32, (uint64_t)CFSTR("TransparencyBundleLocale"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v39 = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)&stru_24F0D9888, v37, v38) ^ 1;
    if (v26)
    {
LABEL_4:
      isEqualToString = objc_msgSend_isEqualToString_(v26, v36, (uint64_t)&stru_24F0D9888, v37, v38);
      if (((v39 ^ 1) & 1) == 0)
      {
        v41 = (uint64_t)v35;
        v42 = v26;
        if (!isEqualToString)
          goto LABEL_12;
      }
      v41 = (uint64_t)v3;
      v42 = v26;
      if ((v39 | isEqualToString) != 1)
        goto LABEL_12;
      v43 = isEqualToString ^ 1;
      if (((v39 ^ 1) & 1) != 0)
        goto LABEL_13;
      goto LABEL_11;
    }
  }
  else
  {
    v39 = 0;
    if (v26)
      goto LABEL_4;
  }
  v43 = 0;
  if (((v39 ^ 1) & 1) != 0)
  {
LABEL_13:

LABEL_14:
    objc_msgSend_setStorefrontLocalizationLanguage_(v13, v18, (uint64_t)v3, v20, v21);
    v44 = v3;
    goto LABEL_15;
  }
LABEL_11:
  v41 = (uint64_t)v35;
  v42 = v3;
  if ((v43 & 1) != 0)
    goto LABEL_13;
LABEL_12:
  objc_msgSend_setStorefrontLocalizationLanguage_(v13, v36, v41, v37, v38);
  v44 = v42;

LABEL_15:
  return v44;
}

- (void)searchObjectForCriteria:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CFAbsoluteTime Current;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  CFAbsoluteTime v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  APLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[ADSearchSession searchObjectForCriteria:withCompletionHandler:]";
    _os_log_impl(&dword_228279000, v8, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  objc_msgSend_workQueue(MEMORY[0x24BE02228], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperationWithBlock_(v13, v14, (uint64_t)&unk_24F0D8FD0, v15, v16);

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_languageLocale(v7, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_2282866F0;
  v26[3] = &unk_24F0D8FF8;
  v28 = Current;
  v27 = v6;
  v23 = v6;
  objc_msgSend_requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality_withCompletionHandler_(self, v24, (uint64_t)v22, (uint64_t)v26, v25);

}

- (void)requestSponsoredSearchURL:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADSearchSession requestSponsoredSearchURL:]";
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  objc_msgSend_workQueue(MEMORY[0x24BE02228], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_228286C54;
  v14[3] = &unk_24F0D9020;
  v15 = v3;
  v10 = v3;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v14, v12, v13);

}

- (void)requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  APLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADSearchSession requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality:withCompletionHandler:]";
    _os_log_impl(&dword_228279000, v8, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  objc_msgSend_workQueue(MEMORY[0x24BE02228], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_228286E4C;
  v19[3] = &unk_24F0D8F10;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend_addOperationWithBlock_(v13, v16, (uint64_t)v19, v17, v18);

}

- (id)sponsoredSearchRequestForLanguageLocale:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t isTest;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t isBaseline;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int isRunningTests;
  void *v80;
  const char *v81;
  uint64_t v82;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE02230]);
  objc_msgSend_userTargetingProperties(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProperties_(v5, v11, (uint64_t)v10, v12, v13);

  if (MGGetBoolAnswer())
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_BOOLForKey_(v18, v19, (uint64_t)CFSTR("ODMLDataRequest"), v20, v21);

    if (v22)
    {
      objc_msgSend_properties(v5, v14, v23, v16, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOverrideType_(v24, v25, 11001, v26, v27);

    }
  }
  objc_msgSend_populateStoreFrontLanguageLocale_(self, v14, (uint64_t)v4, v16, v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v5, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStoreFrontLanguageLocaleIdentifier_(v33, v34, (uint64_t)v28, v35, v36);

  objc_msgSend_sharedInstance(ADSearchAdsSettings, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  isTest = objc_msgSend_isTest(v41, v42, v43, v44, v45);
  objc_msgSend_setIsTest_(v5, v47, isTest, v48, v49);
  isBaseline = objc_msgSend_isBaseline(v41, v50, v51, v52, v53);
  objc_msgSend_setIsBaseline_(v5, v55, isBaseline, v56, v57);
  objc_msgSend_setEnableImagesForDupes_(v5, v58, 1, v59, v60);
  objc_msgSend_odmlSettings(self, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {

  }
  else
  {
    objc_msgSend_processInfo(MEMORY[0x24BDD1760], v66, v67, v68, v69);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    isRunningTests = objc_msgSend_isRunningTests(v74, v75, v76, v77, v78);

    if (!isRunningTests)
    {
      objc_msgSend__setODMLProperties_withSettings_(self, v70, (uint64_t)v5, 0, v73);
      goto LABEL_9;
    }
  }
  objc_msgSend_odmlSettings(self, v70, v71, v72, v73);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setODMLProperties_withSettings_(self, v81, (uint64_t)v5, (uint64_t)v80, v82);

LABEL_9:
  return v5;
}

- (void)_setODMLProperties:(id)a3 withSettings:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;

  v56 = a4;
  if (v56)
  {
    v5 = a3;
    v10 = objc_msgSend_odmlVersion(v56, v6, v7, v8, v9);
    objc_msgSend_setSupportedODMLVersion_(v5, v11, v10, v12, v13);
    objc_msgSend_treatmentID(v56, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTreatmentID_(v5, v19, (uint64_t)v18, v20, v21);

    objc_msgSend_experimentID(v56, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExperimentID_(v5, v27, (uint64_t)v26, v28, v29);

    v30 = (void *)MEMORY[0x24BDD17C8];
    v35 = objc_msgSend_deploymentID(v56, v31, v32, v33, v34);
    objc_msgSend_stringWithFormat_(v30, v36, (uint64_t)CFSTR("%d"), v37, v38, v35);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeploymentID_(v5, v40, (uint64_t)v39, v41, v42);

  }
  else
  {
    v43 = *MEMORY[0x24BE7A780];
    v39 = a3;
    objc_msgSend_setSupportedODMLVersion_(v39, v44, v43, v45, v46);
    objc_msgSend_setTreatmentID_(v39, v47, (uint64_t)CFSTR("-1"), v48, v49);
    objc_msgSend_setExperimentID_(v39, v50, (uint64_t)CFSTR("-1"), v51, v52);
    objc_msgSend_setDeploymentID_(v39, v53, (uint64_t)CFSTR("-1"), v54, v55);
  }

}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)appsRank
{
  return self->_appsRank;
}

- (void)setAppsRank:(int)a3
{
  self->_appsRank = a3;
}

- (ADCapService)capService
{
  return self->_capService;
}

- (void)setCapService:(id)a3
{
  objc_storeStrong((id *)&self->_capService, a3);
}

- (ADParameterFactory)parameterFactory
{
  return self->_parameterFactory;
}

- (void)setParameterFactory:(id)a3
{
  objc_storeStrong((id *)&self->_parameterFactory, a3);
}

- (NSString)campaignNamespace
{
  return self->_campaignNamespace;
}

- (NSObject)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_notificationObserver, a3);
}

- (BOOL)notificationReceivedAndWaiting
{
  return self->_notificationReceivedAndWaiting;
}

- (void)setNotificationReceivedAndWaiting:(BOOL)a3
{
  self->_notificationReceivedAndWaiting = a3;
}

- (NSString)clientRequestID
{
  return self->_clientRequestID;
}

- (void)setClientRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_clientRequestID, a3);
}

- (APOdmlSettings)odmlSettings
{
  return (APOdmlSettings *)objc_getProperty(self, a2, 80, 1);
}

- (OS_dispatch_queue)odmlQueue
{
  return self->_odmlQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odmlQueue, 0);
  objc_storeStrong((id *)&self->_odmlSettings, 0);
  objc_storeStrong((id *)&self->_clientRequestID, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_campaignNamespace, 0);
  objc_storeStrong((id *)&self->_parameterFactory, 0);
  objc_storeStrong((id *)&self->_capService, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_idNotificationQueue, 0);
}

@end
