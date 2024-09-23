@implementation ICCloudConfiguration

+ (id)sharedConfiguration
{
  if (qword_100852710 != -1)
    dispatch_once(&qword_100852710, &stru_1007D9778);
  return (id)qword_100852708;
}

- (ICCloudConfiguration)init
{
  ICCloudConfiguration *v2;
  uint64_t v3;
  _ICCloudConfigurationStorage *storage;
  void *v5;
  uint64_t v6;
  NSURLSession *session;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICCloudConfiguration;
  v2 = -[ICCloudConfiguration init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_ICCloudDefaultValuesConfigurationStorage sharedConfiguration](_ICCloudDefaultValuesConfigurationStorage, "sharedConfiguration"));
    storage = v2->_storage;
    v2->_storage = (_ICCloudConfigurationStorage *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    objc_msgSend(v5, "setDiscretionary:", 1);
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", REMUniversalAppBundleIdentifier);
    v6 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v5));
    session = v2->_session;
    v2->_session = (NSURLSession *)v6;

    -[ICCloudConfiguration loadLocalConfigurationFile](v2, "loadLocalConfigurationFile");
  }
  return v2;
}

+ (BOOL)isConfigurationValid:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("configurationVersion")));
  v4 = v3;
  if (!v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10067D9E8();
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "unsignedIntegerValue") != (id)2)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10067DA14(v4, v6);
LABEL_8:

    v5 = 0;
    goto LABEL_9;
  }
  v5 = 1;
LABEL_9:

  return v5;
}

+ (id)defaultConfigurationURL
{
  ICUserDefaults *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  ICUserDefaults *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];

  v3 = objc_opt_new(ICUserDefaults);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICUserDefaults userDefaults](v3, "userDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("CloudConfigurationPath")));

  if (!v5)
    goto LABEL_5;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableConfigurationURLs"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100053A9C;
    v24[3] = &unk_1007D97A0;
    v25 = v5;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_objectPassingTest:", v24));

    objc_msgSend(a1, "setDefaultConfigurationURL:", v8);
    v6 = (id)v8;
  }
  if (!v6)
  {
LABEL_5:
    v19 = v3;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableConfigurationURLs"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
LABEL_7:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
        v16 = objc_msgSend(v15, "containsString:", CFSTR("Normal"));

        if ((v16 & 1) != 0)
          break;
        if (v11 == (id)++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
          if (v11)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v6 = v14;

      if (v6)
        goto LABEL_16;
    }
    else
    {
LABEL_13:

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableConfigurationURLs"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

LABEL_16:
    objc_msgSend(a1, "setDefaultConfigurationURL:", v6);
    v3 = v19;
  }

  return v6;
}

+ (void)setDefaultConfigurationURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  ICUserDefaults *v7;

  v3 = a3;
  v7 = objc_opt_new(ICUserDefaults);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICUserDefaults userDefaults](v7, "userDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("CloudConfigurationPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICUserDefaults userDefaults](v7, "userDefaults"));
  objc_msgSend(v6, "synchronize");

}

+ (id)cachedConfigurationURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", REMDaemonBundleIdentifier, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("RemoteConfiguration"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("plist")));

  return v6;
}

+ (id)availableConfigurationURLs
{
  void *v2;
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)qword_100852718;
  if (!qword_100852718)
  {
    v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(REMLog, a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("CloudConfigurations"), 1));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 5, 0));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v10 = (void *)qword_100852718;
    qword_100852718 = v9;

    v2 = (void *)qword_100852718;
  }
  return v2;
}

- (void)loadLocalConfigurationFile
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "cachedConfigurationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v4));
    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking cached configuration", buf, 2u);
      }

      if (objc_msgSend((id)objc_opt_class(self, v7), "isConfigurationValid:", v5))
      {
        v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Using cached remote configuration", v13, 2u);
        }

        -[ICCloudConfiguration setConfigurationFromDictionary:](self, "setConfigurationFromDictionary:", v5);
        goto LABEL_14;
      }
    }
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10067DAA0();
  }

  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using default configuration", v12, 2u);
  }

  v11 = objc_msgSend((id)objc_opt_class(self, v10), "defaultConfigurationURL");
  v5 = objc_claimAutoreleasedReturnValue(v11);
  -[ICCloudConfiguration loadConfigurationFromURL:](self, "loadConfigurationFromURL:", v5);
LABEL_14:

}

- (void)downloadRemoteConfiguration
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/reminders-1.0.plist")));
  v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICCloudConfiguration: Start downloading configuration from {remoteURL: %{public}@}", (uint8_t *)&v5, 0xCu);
  }

  -[ICCloudConfiguration downloadConfigurationFromRemoteURL:completionHandler:](self, "downloadConfigurationFromRemoteURL:completionHandler:", v3, &stru_1007D97E0);
}

- (void)downloadConfigurationFromRemoteURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  ICCloudConfiguration *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudConfiguration session](self, "session"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000540D0;
  v14 = &unk_1007D9808;
  v15 = self;
  v16 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataTaskWithURL:completionHandler:", v7, &v11));

  objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);
}

- (void)loadConfigurationFromURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading cloud configuration {configurationURL: %{public}@}", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v4));
  if (!v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10067DD20();

  }
  -[ICCloudConfiguration setConfigurationFromDictionary:](self, "setConfigurationFromDictionary:", v6);

}

- (void)setConfigurationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  _ICCloudConfigurationStorage *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  ICCloudThrottlingLevel *v28;
  ICCloudThrottlingPolicy *v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  double v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  unint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
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
  uint64_t v150;
  _ICCloudConfigurationStorage *v151;
  NSObject *v152;
  _ICCloudConfigurationStorage *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  id v216;
  void *v217;
  void *v219;
  void *v220;
  void *v221;
  id obj;
  id obja;
  _QWORD block[4];
  _ICCloudConfigurationStorage *v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  _BYTE v230[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_ICCloudDefaultValuesConfigurationStorage sharedConfiguration](_ICCloudDefaultValuesConfigurationStorage, "sharedConfiguration"));
  v5 = objc_alloc_init(_ICCloudConfigurationStorage);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minimumClientVersions")));
  v7 = v6;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iOS"))),
        v8,
        v8))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iOS")));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10067DE64();

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minimumClientVersion"));
  }
  v11 = (void *)v9;
  -[_ICCloudConfigurationStorage setMinimumClientVersion:](v5, "setMinimumClientVersion:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("throttlingPolicyResetIntervalSeconds")));
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  if (v14 == 0.0)
    v14 = 86400.0;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("throttlingPolicy")));
  v221 = v4;
  v220 = v7;
  v219 = (void *)v15;
  if (v15)
  {
    v16 = (void *)v15;
    v216 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v226 = 0u;
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    obj = v16;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v226, v230, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v227;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v227 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("count")));
          v24 = objc_msgSend(v23, "unsignedIntegerValue");

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("intervalSeconds")));
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          v28 = -[ICCloudThrottlingLevel initWithBatchInterval:numberOfBatches:]([ICCloudThrottlingLevel alloc], "initWithBatchInterval:numberOfBatches:", v24, v27);
          objc_msgSend(v17, "addObject:", v28);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v226, v230, 16);
      }
      while (v19);
    }

    v29 = -[ICCloudThrottlingPolicy initWithThrottlingLevels:resetInterval:]([ICCloudThrottlingPolicy alloc], "initWithThrottlingLevels:resetInterval:", v17, v14);
    -[_ICCloudConfigurationStorage setThrottlingPolicy:](v5, "setThrottlingPolicy:", v29);

    v3 = v216;
  }
  else
  {
    v30 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10067DE38();

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "throttlingPolicy"));
    -[_ICCloudConfigurationStorage setThrottlingPolicy:](v5, "setThrottlingPolicy:", v17);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxInlineAssetSizeBytes")));
  obja = v31;
  if (v31)
  {
    v32 = objc_msgSend(v31, "unsignedIntegerValue");
  }
  else
  {
    v33 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_10067DE0C();

    v32 = objc_msgSend(v4, "maxInlineAssetSizeBytes");
  }
  -[_ICCloudConfigurationStorage setMaxInlineAssetSizeBytes:](v5, "setMaxInlineAssetSizeBytes:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxAttachmentsPerNote")));
  v217 = v34;
  if (v34)
  {
    v35 = objc_msgSend(v34, "unsignedIntegerValue");
  }
  else
  {
    v36 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10067DDE0();

    v35 = objc_msgSend(v4, "maxAttachmentsPerNote");
  }
  -[_ICCloudConfigurationStorage setMaxAttachmentsPerNote:](v5, "setMaxAttachmentsPerNote:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxSubAttachmentsPerAttachment")));
  v215 = v37;
  if (v37)
  {
    v38 = objc_msgSend(v37, "unsignedIntegerValue");
  }
  else
  {
    v39 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_10067DDB4();

    v38 = objc_msgSend(v4, "maxSubAttachmentsPerAttachment");
  }
  -[_ICCloudConfigurationStorage setMaxSubAttachmentsPerAttachment:](v5, "setMaxSubAttachmentsPerAttachment:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pollingIntervalSeconds")));
  v214 = v40;
  if (v40)
    v41 = (double)(unint64_t)objc_msgSend(v40, "unsignedIntegerValue");
  else
    objc_msgSend(v4, "pollingInterval");
  -[_ICCloudConfigurationStorage setPollingInterval:](v5, "setPollingInterval:", v41);
  v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maximumAttachmentSizeMB")));
  v213 = (void *)v42;
  if (v42)
  {
    -[_ICCloudConfigurationStorage setMaximumAttachmentSizeMB:](v5, "setMaximumAttachmentSizeMB:", v42);
  }
  else
  {
    v43 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_10067DD88();

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maximumAttachmentSizeMB"));
    -[_ICCloudConfigurationStorage setMaximumAttachmentSizeMB:](v5, "setMaximumAttachmentSizeMB:", v44);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("resultsLimitPerSyncOperation")));
  v212 = v45;
  if (v45)
    v46 = objc_msgSend(v45, "unsignedIntegerValue");
  else
    v46 = objc_msgSend(v4, "resultsLimitPerSyncOperation");
  -[_ICCloudConfigurationStorage setResultsLimitPerSyncOperation:](v5, "setResultsLimitPerSyncOperation:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "cloudKitResultsLimitPerSyncOperation"));
  v49 = (uint64_t)objc_msgSend(v48, "integerValue");

  if (v49 >= 1)
    -[_ICCloudConfigurationStorage setResultsLimitPerSyncOperation:](v5, "setResultsLimitPerSyncOperation:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fetchBatchSize")));
  v211 = v50;
  if (v50)
    v51 = objc_msgSend(v50, "unsignedIntegerValue");
  else
    v51 = objc_msgSend(v4, "fetchBatchSize");
  -[_ICCloudConfigurationStorage setFetchBatchSize:](v5, "setFetchBatchSize:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fetchCacheCountLimit")));
  v210 = v52;
  if (v52)
    v53 = objc_msgSend(v52, "unsignedIntegerValue");
  else
    v53 = objc_msgSend(v4, "fetchCacheCountLimit");
  -[_ICCloudConfigurationStorage setFetchCacheCountLimit:](v5, "setFetchCacheCountLimit:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reachabilityChangeSyncThrottleInterval")));
  v209 = v54;
  if (v54)
    objc_msgSend(v54, "doubleValue");
  else
    objc_msgSend(v4, "reachabilityChangeSyncThrottleInterval");
  -[_ICCloudConfigurationStorage setReachabilityChangeSyncThrottleInterval:](v5, "setReachabilityChangeSyncThrottleInterval:");
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("launchAndSignificantTimeChangePollThrottleIntervalV2")));
  v208 = v55;
  if (v55)
    objc_msgSend(v55, "doubleValue");
  else
    objc_msgSend(v4, "launchAndSignificantTimeChangePollThrottleInterval");
  -[_ICCloudConfigurationStorage setLaunchAndSignificantTimeChangePollThrottleInterval:](v5, "setLaunchAndSignificantTimeChangePollThrottleInterval:");
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cloudConfigurationDownloadThrottleInterval")));
  v207 = v56;
  if (v56)
    objc_msgSend(v56, "doubleValue");
  else
    objc_msgSend(v4, "cloudConfigurationDownloadThrottleInterval");
  -[_ICCloudConfigurationStorage setCloudConfigurationDownloadThrottleInterval:](v5, "setCloudConfigurationDownloadThrottleInterval:");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("persistedSubscriptionIDsValidityPeriod")));
  v206 = v57;
  if (v57)
    objc_msgSend(v57, "doubleValue");
  else
    objc_msgSend(v4, "persistedSubscriptionIDsValidityPeriod");
  -[_ICCloudConfigurationStorage setPersistedSubscriptionIDsValidityPeriod:](v5, "setPersistedSubscriptionIDsValidityPeriod:");
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("apsDebouncerDefaultInterval")));
  v205 = v58;
  if (v58)
    objc_msgSend(v58, "doubleValue");
  else
    objc_msgSend(v4, "apsDebouncerDefaultInterval");
  -[_ICCloudConfigurationStorage setApsDebouncerDefaultInterval:](v5, "setApsDebouncerDefaultInterval:");
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("apsDebouncerMigrationInProgressInterval")));
  v204 = v59;
  if (v59)
    objc_msgSend(v59, "doubleValue");
  else
    objc_msgSend(v4, "apsDebouncerMigrationInProgressInterval");
  -[_ICCloudConfigurationStorage setApsDebouncerMigrationInProgressInterval:](v5, "setApsDebouncerMigrationInProgressInterval:");
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("apsDebouncerWatchDefaultInterval")));
  v203 = v60;
  if (v60)
    objc_msgSend(v60, "doubleValue");
  else
    objc_msgSend(v4, "apsDebouncerWatchDefaultInterval");
  -[_ICCloudConfigurationStorage setApsDebouncerWatchDefaultInterval:](v5, "setApsDebouncerWatchDefaultInterval:");
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("apsDebouncerWatchMigrationInProgressInterval")));
  v202 = v61;
  if (v61)
    objc_msgSend(v61, "doubleValue");
  else
    objc_msgSend(v4, "apsDebouncerWatchMigrationInProgressInterval");
  -[_ICCloudConfigurationStorage setApsDebouncerWatchMigrationInProgressInterval:](v5, "setApsDebouncerWatchMigrationInProgressInterval:");
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accountChangedDebouncerInterval")));
  v201 = v62;
  if (v62)
    objc_msgSend(v62, "doubleValue");
  else
    objc_msgSend(v4, "accountChangedDebouncerInterval");
  -[_ICCloudConfigurationStorage setAccountChangedDebouncerInterval:](v5, "setAccountChangedDebouncerInterval:");
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mergeLocalObjectsInitialRetryInterval")));
  v200 = v63;
  if (v63)
    objc_msgSend(v63, "doubleValue");
  else
    objc_msgSend(v4, "mergeLocalObjectsInitialRetryInterval");
  -[_ICCloudConfigurationStorage setMergeLocalObjectsInitialRetryInterval:](v5, "setMergeLocalObjectsInitialRetryInterval:");
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mergeLocalObjectsMaximumRetryCount")));
  v199 = v64;
  if (v64)
    v65 = objc_msgSend(v64, "unsignedIntegerValue");
  else
    v65 = objc_msgSend(v4, "mergeLocalObjectsMaximumRetryCount");
  -[_ICCloudConfigurationStorage setMergeLocalObjectsMaximumRetryCount:](v5, "setMergeLocalObjectsMaximumRetryCount:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mergeLocalObjectsRetryStartOverThrottleInterval")));
  v198 = v66;
  if (v66)
    objc_msgSend(v66, "doubleValue");
  else
    objc_msgSend(v4, "mergeLocalObjectsRetryStartOverThrottleInterval");
  -[_ICCloudConfigurationStorage setMergeLocalObjectsRetryStartOverThrottleInterval:](v5, "setMergeLocalObjectsRetryStartOverThrottleInterval:");
  v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsCleanUpTriggerReductionFactor")));
  v197 = (void *)v67;
  if (v67)
  {
    -[_ICCloudConfigurationStorage setExtraneousAlarmsCleanUpTriggerReductionFactor:](v5, "setExtraneousAlarmsCleanUpTriggerReductionFactor:", v67);
  }
  else
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extraneousAlarmsCleanUpTriggerReductionFactor"));
    -[_ICCloudConfigurationStorage setExtraneousAlarmsCleanUpTriggerReductionFactor:](v5, "setExtraneousAlarmsCleanUpTriggerReductionFactor:", v68);

  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsDeleteCountLimit")));
  v196 = v69;
  if (v69)
    v70 = objc_msgSend(v69, "unsignedIntValue");
  else
    v70 = (unint64_t)objc_msgSend(v4, "extraneousAlarmsDeleteCountLimit");
  -[_ICCloudConfigurationStorage setExtraneousAlarmsDeleteCountLimit:](v5, "setExtraneousAlarmsDeleteCountLimit:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsDeleteCountThreshold")));
  v195 = v71;
  if (v71)
    v72 = objc_msgSend(v71, "unsignedIntValue");
  else
    v72 = (unint64_t)objc_msgSend(v4, "extraneousAlarmsDeleteCountThreshold");
  -[_ICCloudConfigurationStorage setExtraneousAlarmsDeleteCountThreshold:](v5, "setExtraneousAlarmsDeleteCountThreshold:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsBackoffThrottleInterval")));
  v194 = v73;
  if (v73)
    objc_msgSend(v73, "doubleValue");
  else
    objc_msgSend(v4, "extraneousAlarmsBackoffThrottleInterval");
  -[_ICCloudConfigurationStorage setExtraneousAlarmsBackoffThrottleInterval:](v5, "setExtraneousAlarmsBackoffThrottleInterval:");
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsThrottleInterval")));
  v193 = v74;
  if (v74)
    objc_msgSend(v74, "doubleValue");
  else
    objc_msgSend(v4, "extraneousAlarmsThrottleInterval");
  -[_ICCloudConfigurationStorage setExtraneousAlarmsThrottleInterval:](v5, "setExtraneousAlarmsThrottleInterval:");
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsCollectorDebounceInterval")));
  v192 = v75;
  if (v75)
    objc_msgSend(v75, "doubleValue");
  else
    objc_msgSend(v4, "extraneousAlarmsCollectorDebounceInterval");
  -[_ICCloudConfigurationStorage setExtraneousAlarmsCollectorDebounceInterval:](v5, "setExtraneousAlarmsCollectorDebounceInterval:");
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extraneousAlarmsCollectorThrottleInterval")));
  v191 = v76;
  if (v76)
    objc_msgSend(v76, "doubleValue");
  else
    objc_msgSend(v4, "extraneousAlarmsCollectorThrottleInterval");
  -[_ICCloudConfigurationStorage setExtraneousAlarmsCollectorThrottleInterval:](v5, "setExtraneousAlarmsCollectorThrottleInterval:");
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("staledFileAttachmentCleanupDefaultThrottleInterval")));
  v190 = v77;
  if (v77)
    objc_msgSend(v77, "doubleValue");
  else
    objc_msgSend(v4, "staledFileAttachmentCleanupDefaultThrottleInterval");
  -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupDefaultThrottleInterval:](v5, "setStaledFileAttachmentCleanupDefaultThrottleInterval:");
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("staledFileAttachmentCleanupBackoffThrottleInterval")));
  v189 = v78;
  if (v78)
    objc_msgSend(v78, "doubleValue");
  else
    objc_msgSend(v4, "staledFileAttachmentCleanupBackoffThrottleInterval");
  -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupBackoffThrottleInterval:](v5, "setStaledFileAttachmentCleanupBackoffThrottleInterval:");
  v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("staledFileAttachmentCleanupRateReduceFactor")));
  v188 = (void *)v79;
  if (v79)
  {
    -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupRateReduceFactor:](v5, "setStaledFileAttachmentCleanupRateReduceFactor:", v79);
  }
  else
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "staledFileAttachmentCleanupRateReduceFactor"));
    -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupRateReduceFactor:](v5, "setStaledFileAttachmentCleanupRateReduceFactor:", v80);

  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("staledFileAttachmentCleanupPerRunDeleteLimit")));
  v187 = v81;
  if (v81)
    v82 = objc_msgSend(v81, "unsignedIntValue");
  else
    v82 = (unint64_t)objc_msgSend(v4, "staledFileAttachmentCleanupPerRunDeleteLimit");
  -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupPerRunDeleteLimit:](v5, "setStaledFileAttachmentCleanupPerRunDeleteLimit:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageDeduplicationDefaultThrottleInterval")));
  v186 = v83;
  if (v83)
    objc_msgSend(v83, "doubleValue");
  else
    objc_msgSend(v4, "imageDeduplicationDefaultThrottleInterval");
  -[_ICCloudConfigurationStorage setImageDeduplicationDefaultThrottleInterval:](v5, "setImageDeduplicationDefaultThrottleInterval:");
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageDeduplicationBackoffThrottleInterval")));
  v185 = v84;
  if (v84)
    objc_msgSend(v84, "doubleValue");
  else
    objc_msgSend(v4, "imageDeduplicationBackoffThrottleInterval");
  -[_ICCloudConfigurationStorage setImageDeduplicationBackoffThrottleInterval:](v5, "setImageDeduplicationBackoffThrottleInterval:");
  v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageDeduplicationRateReduceFactor")));
  v184 = (void *)v85;
  if (v85)
  {
    -[_ICCloudConfigurationStorage setImageDeduplicationRateReduceFactor:](v5, "setImageDeduplicationRateReduceFactor:", v85);
  }
  else
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageDeduplicationRateReduceFactor"));
    -[_ICCloudConfigurationStorage setImageDeduplicationRateReduceFactor:](v5, "setImageDeduplicationRateReduceFactor:", v86);

  }
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageDeduplicationApproximatePerRunDeleteLimit")));
  v183 = v87;
  if (v87)
    v88 = objc_msgSend(v87, "unsignedIntValue");
  else
    v88 = (unint64_t)objc_msgSend(v4, "imageDeduplicationApproximatePerRunDeleteLimit");
  -[_ICCloudConfigurationStorage setImageDeduplicationApproximatePerRunDeleteLimit:](v5, "setImageDeduplicationApproximatePerRunDeleteLimit:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("savedImageDeduplicationDefaultThrottleInterval")));
  v182 = v89;
  if (v89)
    objc_msgSend(v89, "doubleValue");
  else
    objc_msgSend(v4, "savedImageDeduplicationDefaultThrottleInterval");
  -[_ICCloudConfigurationStorage setSavedImageDeduplicationDefaultThrottleInterval:](v5, "setSavedImageDeduplicationDefaultThrottleInterval:");
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("savedImageDeduplicationBackoffThrottleInterval")));
  v181 = v90;
  if (v90)
    objc_msgSend(v90, "doubleValue");
  else
    objc_msgSend(v4, "savedImageDeduplicationBackoffThrottleInterval");
  -[_ICCloudConfigurationStorage setSavedImageDeduplicationBackoffThrottleInterval:](v5, "setSavedImageDeduplicationBackoffThrottleInterval:");
  v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("savedImageDeduplicationRateReduceFactor")));
  v180 = (void *)v91;
  if (v91)
  {
    -[_ICCloudConfigurationStorage setSavedImageDeduplicationRateReduceFactor:](v5, "setSavedImageDeduplicationRateReduceFactor:", v91);
  }
  else
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savedImageDeduplicationRateReduceFactor"));
    -[_ICCloudConfigurationStorage setSavedImageDeduplicationRateReduceFactor:](v5, "setSavedImageDeduplicationRateReduceFactor:", v92);

  }
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("savedImageDeduplicationApproximatePerRunDeleteLimit")));
  v179 = v93;
  if (v93)
    v94 = objc_msgSend(v93, "unsignedIntValue");
  else
    v94 = (unint64_t)objc_msgSend(v4, "savedImageDeduplicationApproximatePerRunDeleteLimit");
  -[_ICCloudConfigurationStorage setSavedImageDeduplicationApproximatePerRunDeleteLimit:](v5, "setSavedImageDeduplicationApproximatePerRunDeleteLimit:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestConversionToGroceryListDefaultThrottleInterval")));
  v178 = v95;
  if (v95)
    objc_msgSend(v95, "doubleValue");
  else
    objc_msgSend(v4, "suggestConversionToGroceryListDefaultThrottleInterval");
  -[_ICCloudConfigurationStorage setSuggestConversionToGroceryListDefaultThrottleInterval:](v5, "setSuggestConversionToGroceryListDefaultThrottleInterval:");
  v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestConversionToGroceryListRateReduceFactor")));
  v177 = (void *)v96;
  if (v96)
  {
    -[_ICCloudConfigurationStorage setSuggestConversionToGroceryListRateReduceFactor:](v5, "setSuggestConversionToGroceryListRateReduceFactor:", v96);
  }
  else
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestConversionToGroceryListRateReduceFactor"));
    -[_ICCloudConfigurationStorage setSuggestConversionToGroceryListRateReduceFactor:](v5, "setSuggestConversionToGroceryListRateReduceFactor:", v97);

  }
  v98 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("languageHypothesisThresholdForPrimaryLanguage")));
  v176 = (void *)v98;
  if (v98)
  {
    -[_ICCloudConfigurationStorage setLanguageHypothesisThresholdForPrimaryLanguage:](v5, "setLanguageHypothesisThresholdForPrimaryLanguage:", v98);
  }
  else
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageHypothesisThresholdForPrimaryLanguage"));
    -[_ICCloudConfigurationStorage setLanguageHypothesisThresholdForPrimaryLanguage:](v5, "setLanguageHypothesisThresholdForPrimaryLanguage:", v99);

  }
  v100 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("languageHypothesisThresholdForAdditionalLanguages")));
  v175 = (void *)v100;
  if (v100)
  {
    -[_ICCloudConfigurationStorage setLanguageHypothesisThresholdForAdditionalLanguages:](v5, "setLanguageHypothesisThresholdForAdditionalLanguages:", v100);
  }
  else
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageHypothesisThresholdForAdditionalLanguages"));
    -[_ICCloudConfigurationStorage setLanguageHypothesisThresholdForAdditionalLanguages:](v5, "setLanguageHypothesisThresholdForAdditionalLanguages:", v101);

  }
  v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("miniumumAutomaticLanguageConfidenceScoreAllowed")));
  v174 = (void *)v102;
  if (v102)
  {
    -[_ICCloudConfigurationStorage setMiniumumAutomaticLanguageConfidenceScoreAllowed:](v5, "setMiniumumAutomaticLanguageConfidenceScoreAllowed:", v102);
  }
  else
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "miniumumAutomaticLanguageConfidenceScoreAllowed"));
    -[_ICCloudConfigurationStorage setMiniumumAutomaticLanguageConfidenceScoreAllowed:](v5, "setMiniumumAutomaticLanguageConfidenceScoreAllowed:", v103);

  }
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("postAnalyticsDefaultThrottleInterval")));
  v173 = v104;
  if (v104)
    objc_msgSend(v104, "doubleValue");
  else
    objc_msgSend(v4, "postAnalyticsDefaultThrottleInterval");
  -[_ICCloudConfigurationStorage setPostAnalyticsDefaultThrottleInterval:](v5, "setPostAnalyticsDefaultThrottleInterval:");
  v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("postAnalyticsRateReduceFactor")));
  v172 = (void *)v105;
  if (v105)
  {
    -[_ICCloudConfigurationStorage setPostAnalyticsRateReduceFactor:](v5, "setPostAnalyticsRateReduceFactor:", v105);
  }
  else
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "postAnalyticsRateReduceFactor"));
    -[_ICCloudConfigurationStorage setPostAnalyticsRateReduceFactor:](v5, "setPostAnalyticsRateReduceFactor:", v106);

  }
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("batchDeleteExpiredRemindersDefaultThrottleInterval")));
  v171 = v107;
  if (v107)
    objc_msgSend(v107, "doubleValue");
  else
    objc_msgSend(v4, "batchDeleteExpiredRemindersDefaultThrottleInterval");
  -[_ICCloudConfigurationStorage setBatchDeleteExpiredRemindersDefaultThrottleInterval:](v5, "setBatchDeleteExpiredRemindersDefaultThrottleInterval:");
  v108 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("batchDeleteExpiredRemindersRateReduceFactor")));
  v170 = (void *)v108;
  if (v108)
  {
    -[_ICCloudConfigurationStorage setBatchDeleteExpiredRemindersRateReduceFactor:](v5, "setBatchDeleteExpiredRemindersRateReduceFactor:", v108);
  }
  else
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batchDeleteExpiredRemindersRateReduceFactor"));
    -[_ICCloudConfigurationStorage setBatchDeleteExpiredRemindersRateReduceFactor:](v5, "setBatchDeleteExpiredRemindersRateReduceFactor:", v109);

  }
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("batchDeleteExpiredRemindersMinimumDeletionTimeInterval")));
  v169 = v110;
  if (v110)
    objc_msgSend(v110, "doubleValue");
  else
    objc_msgSend(v4, "batchDeleteExpiredRemindersMinimumDeletionTimeInterval");
  -[_ICCloudConfigurationStorage setBatchDeleteExpiredRemindersMinimumDeletionTimeInterval:](v5, "setBatchDeleteExpiredRemindersMinimumDeletionTimeInterval:");
  v111 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minimumSearchTermLengthByBaseLanguage")));
  v168 = (void *)v111;
  if (v111)
  {
    -[_ICCloudConfigurationStorage setMinimumSearchTermLengthByBaseLanguage:](v5, "setMinimumSearchTermLengthByBaseLanguage:", v111);
  }
  else
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "minimumSearchTermLengthByBaseLanguage"));
    -[_ICCloudConfigurationStorage setMinimumSearchTermLengthByBaseLanguage:](v5, "setMinimumSearchTermLengthByBaseLanguage:", v112);

  }
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cloudSchemaCatchUpSyncInitialRetryInterval")));
  v167 = v113;
  if (v113)
    objc_msgSend(v113, "doubleValue");
  else
    objc_msgSend(v4, "cloudSchemaCatchUpSyncInitialRetryInterval");
  -[_ICCloudConfigurationStorage setCloudSchemaCatchUpSyncInitialRetryInterval:](v5, "setCloudSchemaCatchUpSyncInitialRetryInterval:");
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cloudSchemaCatchUpSyncMaximumRetryCount")));
  v166 = v114;
  if (v114)
    v115 = objc_msgSend(v114, "unsignedIntegerValue");
  else
    v115 = objc_msgSend(v4, "cloudSchemaCatchUpSyncMaximumRetryCount");
  -[_ICCloudConfigurationStorage setCloudSchemaCatchUpSyncMaximumRetryCount:](v5, "setCloudSchemaCatchUpSyncMaximumRetryCount:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount")));
  v165 = v116;
  if (v116)
    v117 = objc_msgSend(v116, "unsignedIntegerValue");
  else
    v117 = objc_msgSend(v4, "fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount");
  -[_ICCloudConfigurationStorage setFetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount:](v5, "setFetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objectEffectiveVersionValidationFlushBatchSize")));
  v164 = v118;
  if (v118)
    v119 = objc_msgSend(v118, "unsignedIntegerValue");
  else
    v119 = objc_msgSend(v4, "objectEffectiveVersionValidationFlushBatchSize");
  -[_ICCloudConfigurationStorage setObjectEffectiveVersionValidationFlushBatchSize:](v5, "setObjectEffectiveVersionValidationFlushBatchSize:", v119);
  v120 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestedAttributesTrainingOverrides")));
  v163 = (void *)v120;
  if (v120)
  {
    -[_ICCloudConfigurationStorage setSuggestedAttributesTrainingOverrides:](v5, "setSuggestedAttributesTrainingOverrides:", v120);
  }
  else
  {
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedAttributesTrainingOverrides"));
    -[_ICCloudConfigurationStorage setSuggestedAttributesTrainingOverrides:](v5, "setSuggestedAttributesTrainingOverrides:", v121);

  }
  v122 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestedAttributesHarvestingOverrides")));
  v162 = (void *)v122;
  if (v122)
  {
    -[_ICCloudConfigurationStorage setSuggestedAttributesHarvestingOverrides:](v5, "setSuggestedAttributesHarvestingOverrides:", v122);
  }
  else
  {
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedAttributesHarvestingOverrides"));
    -[_ICCloudConfigurationStorage setSuggestedAttributesHarvestingOverrides:](v5, "setSuggestedAttributesHarvestingOverrides:", v123);

  }
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestedAttributesAutoTrainingThrottleInterval")));
  v161 = v124;
  if (v124)
    objc_msgSend(v124, "doubleValue");
  else
    objc_msgSend(v4, "suggestedAttributesAutoTrainingThrottleInterval");
  -[_ICCloudConfigurationStorage setSuggestedAttributesAutoTrainingThrottleInterval:](v5, "setSuggestedAttributesAutoTrainingThrottleInterval:");
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("manualSortHintClientSideExpiration")));
  v160 = v125;
  if (v125)
    objc_msgSend(v125, "doubleValue");
  else
    objc_msgSend(v4, "manualSortHintClientSideExpiration");
  -[_ICCloudConfigurationStorage setManualSortHintClientSideExpiration:](v5, "setManualSortHintClientSideExpiration:");
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("manualSortHintLastAccessedUpdatePolicy")));
  if (objc_msgSend(v126, "length"))
  {
    -[_ICCloudConfigurationStorage setManualSortHintLastAccessedUpdatePolicy:](v5, "setManualSortHintLastAccessedUpdatePolicy:", v126);
  }
  else
  {
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manualSortHintLastAccessedUpdatePolicy"));
    -[_ICCloudConfigurationStorage setManualSortHintLastAccessedUpdatePolicy:](v5, "setManualSortHintLastAccessedUpdatePolicy:", v127);

  }
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("templatePublicLinkTTL")));
  v158 = v128;
  if (v128)
    objc_msgSend(v128, "doubleValue");
  else
    objc_msgSend(v4, "templatePublicLinkTTL");
  -[_ICCloudConfigurationStorage setTemplatePublicLinkTTL:](v5, "setTemplatePublicLinkTTL:");
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("templatePublicLinkOperationTimeoutInterval")));
  v157 = v129;
  if (v129)
    objc_msgSend(v129, "doubleValue");
  else
    objc_msgSend(v4, "templatePublicLinkOperationTimeoutInterval");
  -[_ICCloudConfigurationStorage setTemplatePublicLinkOperationTimeoutInterval:](v5, "setTemplatePublicLinkOperationTimeoutInterval:");
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("alarmIDsLimitPerReminder")));
  v156 = v130;
  if (v130)
    v131 = objc_msgSend(v130, "unsignedIntegerValue");
  else
    v131 = objc_msgSend(v4, "alarmIDsLimitPerReminder");
  -[_ICCloudConfigurationStorage setAlarmIDsLimitPerReminder:](v5, "setAlarmIDsLimitPerReminder:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tapToRadarThrottlingInterval")));
  v155 = v132;
  if (v132)
    objc_msgSend(v132, "doubleValue");
  else
    objc_msgSend(v4, "tapToRadarThrottlingInterval");
  -[_ICCloudConfigurationStorage setTapToRadarThrottlingInterval:](v5, "setTapToRadarThrottlingInterval:");
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("housekeepingActivityMinimumDelay")));
  v154 = v133;
  if (v133)
    objc_msgSend(v133, "doubleValue");
  else
    objc_msgSend(v4, "housekeepingActivityMinimumDelay");
  -[_ICCloudConfigurationStorage setHousekeepingActivityMinimumDelay:](v5, "setHousekeepingActivityMinimumDelay:");
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appStoreReviewCreatedOrCompletedRemindersCountThreshold")));
  v135 = v134;
  if (v134)
    v136 = objc_msgSend(v134, "unsignedIntegerValue");
  else
    v136 = objc_msgSend(v4, "appStoreReviewCreatedOrCompletedRemindersCountThreshold");
  -[_ICCloudConfigurationStorage setAppStoreReviewCreatedOrCompletedRemindersCountThreshold:](v5, "setAppStoreReviewCreatedOrCompletedRemindersCountThreshold:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appStoreReviewNumberOfForegroundsThreshold")));
  v138 = v137;
  if (v137)
    v139 = objc_msgSend(v137, "unsignedIntegerValue");
  else
    v139 = objc_msgSend(v4, "appStoreReviewNumberOfForegroundsThreshold");
  -[_ICCloudConfigurationStorage setAppStoreReviewNumberOfForegroundsThreshold:](v5, "setAppStoreReviewNumberOfForegroundsThreshold:", v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appStoreReviewTimeIntervalOfInterest")));
  v141 = v140;
  if (v140)
    objc_msgSend(v140, "doubleValue");
  else
    objc_msgSend(v4, "appStoreReviewTimeIntervalOfInterest");
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalOfInterest:](v5, "setAppStoreReviewTimeIntervalOfInterest:");
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appStoreReviewTimeIntervalSinceInitialForeground")));
  v143 = v142;
  if (v142)
    objc_msgSend(v142, "doubleValue");
  else
    objc_msgSend(v4, "appStoreReviewTimeIntervalSinceInitialForeground");
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalSinceInitialForeground:](v5, "setAppStoreReviewTimeIntervalSinceInitialForeground:");
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appStoreReviewTimeIntervalSinceLastPrompt")));
  v145 = v144;
  v159 = v126;
  if (v144)
    objc_msgSend(v144, "doubleValue");
  else
    objc_msgSend(v4, "appStoreReviewTimeIntervalSinceLastPrompt");
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalSinceLastPrompt:](v5, "setAppStoreReviewTimeIntervalSinceLastPrompt:");
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appStoreReviewTimeIntervalSinceLastFetch")));
  v147 = v146;
  if (v146)
    objc_msgSend(v146, "doubleValue");
  else
    objc_msgSend(v4, "appStoreReviewTimeIntervalSinceLastFetch");
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalSinceLastFetch:](v5, "setAppStoreReviewTimeIntervalSinceLastFetch:");
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iCloudIsOffTimeIntervalSinceLastPrompt")));
  v149 = v148;
  if (v148)
    objc_msgSend(v148, "doubleValue");
  else
    objc_msgSend(v4, "iCloudIsOffTimeIntervalSinceLastPrompt");
  -[_ICCloudConfigurationStorage setICloudIsOffTimeIntervalSinceLastPrompt:](v5, "setICloudIsOffTimeIntervalSinceLastPrompt:");
  -[ICCloudConfiguration setStorage:](self, "setStorage:", v5);
  v150 = objc_claimAutoreleasedReturnValue(+[ICCloudContext processingQueue](ICCloudContext, "processingQueue"));
  v151 = v5;
  v152 = v150;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055DA0;
  block[3] = &unk_1007D7A60;
  v153 = v151;
  v225 = v153;
  dispatch_async(v152, block);

}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudConfiguration storage](self, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v4));

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICCloudConfiguration;
  if (-[ICCloudConfiguration respondsToSelector:](&v8, "respondsToSelector:"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudConfiguration storage](self, "storage"));
    v5 = objc_opt_respondsToSelector(v6, a3);

  }
  return v5 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudConfiguration storage](self, "storage"));
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (_ICCloudConfigurationStorage)storage
{
  return (_ICCloudConfigurationStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
