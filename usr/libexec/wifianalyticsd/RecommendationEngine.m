@implementation RecommendationEngine

- (RecommendationEngine)init
{
  RecommendationEngine *v2;
  uint64_t v3;
  RecommendationPreferences *preferences;
  RecommendationEngine *v5;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v11.receiver = self;
  v11.super_class = (Class)RecommendationEngine;
  v2 = -[RecommendationEngine init](&v11, "init");
  if (!v2)
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RecommendationEngine init]";
      v14 = 1024;
      v15 = 35;
      v9 = "%{public}s::%d:Error super init";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    }
LABEL_10:

    v5 = 0;
    goto LABEL_4;
  }
  v3 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](RecommendationPreferences, "sharedObject"));
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    v10 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RecommendationEngine init]";
      v14 = 1024;
      v15 = 38;
      v9 = "%{public}s::%d:Error RecommendationPreferences init";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v5 = v2;
LABEL_4:

  return v5;
}

- (BOOL)canWDforDPS
{
  void *v3;
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  __int16 v24;
  NSObject *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_lastWD")));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_lastWD")));
    objc_msgSend(v3, "timeIntervalSinceDate:", v5);
    v7 = v6;
    v8 = (double)(60 * -[RecommendationPreferences minutes_between_dps_wd](self->_preferences, "minutes_between_dps_wd"));
    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    v12 = v7 > v8;
    if (v7 <= v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136446978;
        v19 = "-[RecommendationEngine canWDforDPS]";
        v20 = 1024;
        v21 = 61;
        v22 = 2048;
        v23 = v7;
        v24 = 2112;
        v25 = v5;
        v13 = "%{public}s::%d:DPS Not Allowed - Last DPS WD was %f seconds ago at %@";
        v14 = v11;
        v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_10;
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "-[RecommendationEngine canWDforDPS]";
      v20 = 1024;
      v21 = 58;
      v22 = 2048;
      v23 = v7;
      v24 = 2112;
      v25 = v5;
      v13 = "%{public}s::%d:DPS Allowed - Last DPS WD was %f seconds ago at %@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v18, 0x26u);
    }

    goto LABEL_12;
  }
  v16 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446466;
    v19 = "-[RecommendationEngine canWDforDPS]";
    v20 = 1024;
    v21 = 52;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kDPSLastWD not yet populated", (uint8_t *)&v18, 0x12u);
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)canCaptureforDPS
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  NSObject *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_lastCapture")));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_lastCapture")));
    objc_msgSend(v3, "timeIntervalSinceDate:", v5);
    v7 = v6;
    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "-[RecommendationEngine canCaptureforDPS]";
      v14 = 1024;
      v15 = 76;
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Capture Allowed - Last DPS WD was %f seconds ago at %@", (uint8_t *)&v12, 0x26u);
    }

  }
  else
  {
    v10 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446466;
      v13 = "-[RecommendationEngine canCaptureforDPS]";
      v14 = 1024;
      v15 = 71;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kDPSLastCapture not yet populated", (uint8_t *)&v12, 0x12u);
    }
  }

  return 1;
}

- (float)medianCCA:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  float v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  float v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v55;
  unint64_t v56;
  const char *v57;
  void *i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  uint64_t v69;
  id v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  NSObject *v76;
  __int16 v77;
  double v78;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repeatableValues"));
  v6 = (const char *)objc_msgSend(v5, "count");

  if ((unint64_t)v6 > 1)
  {
    v56 = 0;
    v57 = v6 - 1;
    v55 = 0;
    v15 = 0;
    for (i = v3; ; v3 = i)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "repeatableValues"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subMessageValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fieldForKey:", CFSTR("NWAPS_ccas")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "repeatableValues"));
      v23 = objc_msgSend(v22, "count");

      if ((unint64_t)v23 <= v15)
        break;
      v24 = v15;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "repeatableValues"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectAtIndex:", v57));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "subMessageValue"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fieldForKey:", CFSTR("NWAPS_ccas")));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "repeatableValues"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectAtIndex:", v15));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v25 = objc_msgSend(v59, "uint64Value");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "repeatableValues"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", 0));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "subMessageValue"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "fieldForKey:", CFSTR("NWAPS_ccas")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "repeatableValues"));
      v69 = v24;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndex:", v24));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v35 = v25 - (_BYTE *)objc_msgSend(v34, "uint64Value");

      if (v35 > v56)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "repeatableValues"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndex:", v57));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fieldForKey:", CFSTR("DPSCS_peerStats")));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subMessageValue"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fieldForKey:", CFSTR("NWAPS_ccas")));
        v68 = v35;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "repeatableValues"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndex:", v69));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "fieldForKey:", CFSTR("NWASB_state")));
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringValue"));

        v55 = v45;
        v56 = v68;
      }
      v15 = v69 + 1;
    }
    v10 = v55;
    if (v55)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v55));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
      objc_msgSend(v46, "scanUpToCharactersFromSet:intoString:", v47, 0);

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
      v70 = 0;
      objc_msgSend(v46, "scanCharactersFromSet:intoString:", v48, &v70);
      v49 = v70;

      objc_msgSend(v49, "floatValue");
      v11 = v50;
      v51 = WALogCategoryDefaultHandle();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v72 = "-[RecommendationEngine medianCCA:]";
        v73 = 1024;
        v74 = 121;
        v75 = 2112;
        v76 = v55;
        v77 = 2048;
        v78 = v11;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCA %@ floatCCA %f", buf, 0x26u);
      }

    }
    else
    {
      v53 = WALogCategoryDefaultHandle();
      v10 = objc_claimAutoreleasedReturnValue(v53);
      v11 = 65535.0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Instances populated with the same values, CCA not found (slowDPS)";
        v13 = v10;
        v14 = 2;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v72 = "-[RecommendationEngine medianCCA:]";
      v73 = 1024;
      v74 = 90;
      v75 = 2048;
      v76 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough DPSR_dpsCounterSamples %lu", buf, 0x1Cu);
    }

    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = 0.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v72 = v6;
      v12 = "Not enough DPSR_dpsCounterSamples %lu";
      v13 = v10;
      v14 = 12;
LABEL_18:
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v12, buf, v14);
    }
  }

  return v11;
}

- (void)isDatapathStudyShowingDPS:(id)a3 andReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, const __CFString *);
  void *v8;
  void *v9;
  char *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  id v67;
  NSObject *v68;
  BOOL v69;
  uint8_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  id v80;
  NSObject *v81;
  uint64_t v82;
  char v83;
  void *v84;
  uint64_t v85;
  id v86;
  NSObject *v87;
  int v88;
  int v89;
  int v90;
  id v91;
  NSObject *v92;
  unint64_t v93;
  float v94;
  const __CFString *v95;
  float v96;
  id v97;
  NSObject *v98;
  id v99;
  id v100;
  NSObject *v101;
  void (*v102)(_QWORD *, uint64_t, void *);
  _QWORD *v103;
  uint64_t v104;
  id v105;
  NSObject *v106;
  id v107;
  id v108;
  NSObject *v109;
  NSObject *v110;
  char *v111;
  id v112;
  _QWORD *v113;
  unint64_t v114;
  char v115;
  uint64_t v116;
  unsigned int v117;
  unsigned int v118;
  void *v119;
  void *v120;
  RecommendationEngine *v121;
  char *v122;
  void *v123;
  uint64_t v124;
  int v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  _BYTE v131[10];
  _BYTE v132[6];
  _BYTE v133[6];
  __int16 v134;
  int v135;
  __int16 v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, const __CFString *))a4;
  v125 = 0;
  v140 = 0;
  v141 = 0;
  v138 = 0;
  v139 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repeatableValues"));
  v10 = (char *)objc_msgSend(v9, "count");

  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  v14 = v10 - 1;
  if ((unint64_t)v10 <= 1)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 147;
      v130 = 2048;
      *(_QWORD *)v131 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough samples %lu", buf, 0x1Cu);
    }

    v7[2](v7, 0, &stru_1000CF640);
    goto LABEL_64;
  }
  v113 = v7;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
    v128 = 1024;
    v129 = 152;
    v130 = 2048;
    *(_QWORD *)v131 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Called with countOfSamples %lu", buf, 0x1Cu);
  }
  v111 = v10;

  v123 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repeatableValues"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subMessageValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repeatableValues"));
  v22 = (unint64_t)objc_msgSend(v21, "count");

  v121 = self;
  if (v22 < 5)
  {
    v25 = v123;
    if (!v22)
      goto LABEL_26;
  }
  else
  {
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v127 = (const char *)v22;
      _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Out of range acCount found in NWAPS_acCompletions: %lu", buf, 0xCu);
    }

    v22 = 4;
    v25 = v123;
  }
  v26 = 0;
  v122 = v14;
  v114 = v22;
  do
  {
    v124 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples"), v111));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repeatableValues"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndex:", v14));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fieldForKey:", CFSTR("DPSCS_peerStats")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subMessageValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "repeatableValues"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", v26));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fieldForKey:", CFSTR("NWAPACTC_success")));
    v117 = objc_msgSend(v35, "uint32Value");

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "repeatableValues"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndex:", 0));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fieldForKey:", CFSTR("DPSCS_peerStats")));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subMessageValue"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "repeatableValues"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndex:", v124));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "fieldForKey:", CFSTR("NWAPACTC_success")));
    v45 = objc_msgSend(v44, "uint32Value");

    v46 = WALogCategoryDefaultHandle();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 169;
      v130 = 2048;
      *(_QWORD *)v131 = v122;
      *(_WORD *)&v131[8] = 1024;
      *(_DWORD *)v132 = v117;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)v133 = v45;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWAPACTC_success[%lu] %u NWAPACTC_success[0] %u ", buf, 0x28u);
    }

    *((_DWORD *)&v140 + v124) = v117 - v45;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "repeatableValues"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v122));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "fieldForKey:", CFSTR("DPSCS_peerStats")));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "subMessageValue"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "repeatableValues"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndex:", v124));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "fieldForKey:", CFSTR("NWAPACTC_qeuedPackets")));
    v118 = objc_msgSend(v56, "uint32Value");

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "repeatableValues"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndex:", 0));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "fieldForKey:", CFSTR("DPSCS_peerStats")));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "subMessageValue"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "repeatableValues"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndex:", v124));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "fieldForKey:", CFSTR("NWAPACTC_qeuedPackets")));
    v66 = objc_msgSend(v65, "uint32Value");

    v67 = WALogCategoryDefaultHandle();
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 177;
      v130 = 2048;
      *(_QWORD *)v131 = v122;
      *(_WORD *)&v131[8] = 1024;
      *(_DWORD *)v132 = v118;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)v133 = v66;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWAPACTC_qeuedPackets[%lu] %u NWAPACTC_qeuedPackets[0] %u ", buf, 0x28u);
    }

    if (v118)
      v69 = v66 == 0;
    else
      v69 = 1;
    v70 = !v69;
    buf[v124 - 4] = v70;
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "repeatableValues"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndex:", v122));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "fieldForKey:", CFSTR("DPSCS_peerStats")));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "subMessageValue"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "repeatableValues"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndex:", v124));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "fieldForKey:", CFSTR("NWAPACTC_durSinceLastEnqueueAtLastCheck")));
    v79 = objc_msgSend(v78, "uint32Value");
    *((_DWORD *)&v138 + v124) = v79;

    v14 = v122;
    v80 = WALogCategoryDefaultHandle();
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 183;
      v130 = 2048;
      *(_QWORD *)v131 = v122;
      *(_WORD *)&v131[8] = 1024;
      *(_DWORD *)v132 = v79;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWAPACTC_durSinceLastEnqueueAtLastCheck[%lu] %u", buf, 0x22u);
    }

    v25 = v123;
    v26 = v124 + 1;
  }
  while (v114 != v124 + 1);
LABEL_26:
  v82 = 0;
  v83 = 0;
  v84 = 0;
  do
  {
    v115 = v83;
    v120 = v84;
    v85 = v82;
    while (1)
    {
      v86 = WALogCategoryDefaultHandle();
      v87 = objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = *((_DWORD *)&v140 + v85);
        v89 = buf[v85 - 4];
        v90 = *((_DWORD *)&v138 + v85);
        *(_DWORD *)buf = 136448002;
        v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
        v128 = 1024;
        v129 = 188;
        v130 = 1024;
        *(_DWORD *)v131 = v85;
        *(_WORD *)&v131[4] = 1024;
        *(_DWORD *)&v131[6] = v88;
        *(_WORD *)v132 = 1024;
        *(_DWORD *)&v132[2] = v85;
        *(_WORD *)v133 = 1024;
        *(_DWORD *)&v133[2] = v89;
        v134 = 1024;
        v135 = v85;
        v136 = 1024;
        v137 = v90;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Evaluating deltaSuccessPerAC[%d] %d queuedPendingAtBeginningAndEnd[%d] %d durSinceLastEnqueueAtLastCheck[%d] %d", buf, 0x36u);
      }

      if (-[RecommendationPreferences force_dps_recommend_always](v121->_preferences, "force_dps_recommend_always"))
      {
        v91 = WALogCategoryDefaultHandle();
        v92 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
          v128 = 1024;
          v129 = 191;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%{public}s::%d:force_dps_recommend_always is true, faking 0 success, pending data, and a a long stall", buf, 0x12u);
        }

        LODWORD(v141) = 0;
        BYTE2(v125) = 1;
        LODWORD(v139) = 4000
                      * -[RecommendationPreferences dps_stall_dur_for_wd](v121->_preferences, "dps_stall_dur_for_wd");
      }
      if (!*((_DWORD *)&v140 + v85))
      {
        if (buf[v85 - 4])
        {
          v93 = *((unsigned int *)&v138 + v85);
          if (1000
             * (uint64_t)-[RecommendationPreferences dps_stall_dur_for_wd](v121->_preferences, "dps_stall_dur_for_wd") <= v93)
            break;
        }
      }
      if (++v85 == 4)
      {
        if ((v115 & 1) != 0)
        {
          v84 = v120;
          goto LABEL_51;
        }
        v105 = WALogCategoryDefaultHandle();
        v106 = objc_claimAutoreleasedReturnValue(v105);
        v6 = v123;
        v7 = (void (**)(id, _QWORD, const __CFString *))v113;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
          v128 = 1024;
          v129 = 227;
          _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: Recommending WARecommendNull", buf, 0x12u);
        }

        v102 = (void (*)(_QWORD *, uint64_t, void *))v113[2];
        v103 = v113;
        v104 = 0;
        v84 = v120;
LABEL_62:
        v102(v103, v104, v84);
        goto LABEL_63;
      }
    }
    -[RecommendationEngine medianCCA:](v121, "medianCCA:", v123);
    if (v94 >= 35.0)
    {
      -[RecommendationEngine medianCCA:](v121, "medianCCA:", v123);
      if (v96 >= (float)-[RecommendationPreferences dps_wd_cca](v121->_preferences, "dps_wd_cca"))
        v95 = CFSTR("Data Path Stuck~High CCA");
      else
        v95 = CFSTR("Data Path Stuck~Med CCA");
    }
    else
    {
      v95 = CFSTR("Data Path Stuck~Low CCA");
    }
    v116 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v95, v111));

    v97 = WALogCategoryDefaultHandle();
    v98 = objc_claimAutoreleasedReturnValue(v97);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 210;
      v130 = 2112;
      *(_QWORD *)v131 = v116;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@", buf, 0x1Cu);
    }

    v82 = v85 + 1;
    v83 = 1;
    v69 = v85 == 3;
    v84 = (void *)v116;
  }
  while (!v69);
LABEL_51:
  v99 = -[RecommendationPreferences dps_capture_evaluated_at_sample](v121->_preferences, "dps_capture_evaluated_at_sample", v111);
  if (v112 == v99)
  {
    v100 = WALogCategoryDefaultHandle();
    v101 = objc_claimAutoreleasedReturnValue(v100);
    v6 = v123;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 218;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: Recommending WARecommendFullCapture", buf, 0x12u);
    }

    v7 = (void (**)(id, _QWORD, const __CFString *))v113;
    v102 = (void (*)(_QWORD *, uint64_t, void *))v113[2];
    v103 = v113;
    v104 = 1;
    goto LABEL_62;
  }
  v107 = -[RecommendationPreferences dps_trap_evaluated_at_sample](v121->_preferences, "dps_trap_evaluated_at_sample");
  v108 = WALogCategoryDefaultHandle();
  v109 = objc_claimAutoreleasedReturnValue(v108);
  v110 = v109;
  v6 = v123;
  if (v112 == v107)
  {
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      v128 = 1024;
      v129 = 222;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: Recommending WARecommendTrapWatchdog", buf, 0x12u);
    }

    v7 = (void (**)(id, _QWORD, const __CFString *))v113;
    v102 = (void (*)(_QWORD *, uint64_t, void *))v113[2];
    v103 = v113;
    v104 = 2;
    goto LABEL_62;
  }
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
    v128 = 1024;
    v129 = 232;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Returning", buf, 0x12u);
  }

  v7 = (void (**)(id, _QWORD, const __CFString *))v113;
  ((void (*)(_QWORD *, _QWORD, const __CFString *))v113[2])(v113, 0, &stru_1000CF640);
LABEL_63:

LABEL_64:
}

- (void)addNumRecommendedWD
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedWD")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedWD")));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1));

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numRecommendedWD"));

}

- (void)addNumSuppressedWD
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedWD")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedWD")));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1));

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numSuppressedWD"));

}

- (void)addNumRecommendedCapture
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedCapture")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedCapture")));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1));

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numRecommendedCapture"));

}

- (void)addNumSuppressedCapture
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedCapture")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedCapture")));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1));

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numSuppressedCapture"));

}

- (void)recommendActionFromData:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;

  v6 = a3;
  v7 = a4;
  if (!-[RecommendationPreferences disable_dps_wd](self->_preferences, "disable_dps_wd"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repeatableValues"));
    v12 = objc_msgSend(v11, "count");
    if (v12 == (id)-[RecommendationPreferences dps_capture_evaluated_at_sample](self->_preferences, "dps_capture_evaluated_at_sample"))
    {

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "repeatableValues"));
      v15 = objc_msgSend(v14, "count");
      v16 = -[RecommendationPreferences dps_trap_evaluated_at_sample](self->_preferences, "dps_trap_evaluated_at_sample");

      if (v15 != (id)v16)
        goto LABEL_9;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100041B20;
    v17[3] = &unk_1000CD150;
    v17[4] = self;
    v19 = v7;
    v18 = v6;
    -[RecommendationEngine isDatapathStudyShowingDPS:andReply:](self, "isDatapathStudyShowingDPS:andReply:", v18, v17);

    goto LABEL_9;
  }
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RecommendationEngine recommendActionFromData:andReply:]";
    v22 = 1024;
    v23 = 290;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WARecommendNull disable_dps_wd", buf, 0x12u);
  }

  (*((void (**)(id, _QWORD, const __CFString *))v7 + 2))(v7, 0, CFSTR("disable_dps_wd"));
LABEL_9:

}

- (NSMutableDictionary)dpsWDBudgetDict
{
  return self->_dpsWDBudgetDict;
}

- (void)setDpsWDBudgetDict:(id)a3
{
  objc_storeStrong((id *)&self->_dpsWDBudgetDict, a3);
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dpsWDBudgetDict, 0);
}

@end
