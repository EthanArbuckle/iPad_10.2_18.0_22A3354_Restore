@implementation PerfDiagsSelfEnablementController

+ (BOOL)isAnyModeActive
{
  id v2;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  void *i;
  id v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[5];

  v17[0] = CFSTR("PDSEHangTracer");
  v17[1] = CFSTR("PDSEHTThirdParty");
  v17[2] = CFSTR("PDSESentry");
  v17[3] = CFSTR("PDSEAppLaunch");
  v17[4] = CFSTR("PDSEWorkflowResponsiveness");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 5));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = objc_msgSend(v9, "count", (_QWORD)v12);

        v5 |= v10 != 0;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

+ (id)clientClasses
{
  if (qword_10001E520 != -1)
    dispatch_once(&qword_10001E520, &stru_100018820);
  return (id)qword_10001E518;
}

+ (void)evaluateSelfEnablement
{
  id v2;
  __CFString *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  const __CFString *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  const __CFString *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  mach_header_64 *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  unsigned int v30;
  int v31;
  id v32;
  NSObject *v33;
  char v34;
  char v35;
  char v36;
  id v37;
  NSObject *v38;
  _BOOL4 v39;
  unsigned int v40;
  id v41;
  const __CFString *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  char v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  mach_header_64 *v53;
  int v54;
  id v55;
  NSObject *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  id v62;
  NSObject *v63;
  void *v64;
  id v65;
  NSObject *v66;
  _BOOL4 v67;
  _BOOL4 v68;
  char v69;
  id v70;
  NSObject *v71;
  unsigned __int8 v72;
  id v73;
  NSObject *v74;
  _BOOL4 v75;
  _QWORD *v76;
  uint64_t v77;
  __CFString *v78;
  id v79;
  NSObject *v80;
  void *v81;
  unsigned int v82;
  id v83;
  NSObject *v84;
  _BOOL4 v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  unsigned __int8 v90;
  id v91;
  NSObject *v92;
  _BOOL4 v93;
  uint64_t v94;
  id v95;
  NSObject *v96;
  uint64_t v97;
  id obj;
  void *v99;
  CFStringRef hostName;
  char v101;
  id v102;
  uint64_t v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  _QWORD v109[4];
  __CFString *v110;
  char v111;
  _QWORD v112[5];
  _QWORD v113[4];
  __CFString *v114;
  unsigned __int8 v115;
  _QWORD v116[5];
  char v117;
  _QWORD v118[4];
  __CFString *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[4];
  __CFString *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint8_t buf[4];
  const __CFString *v135;
  __int16 v136;
  _BYTE v137[28];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];

  v2 = a1;
  v97 = tailspin_config_create_with_default_config(a1, a2);
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientClasses"));
  v4 = -[__CFString countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v130, v140, 16);
  if (!v4)
  {

    v24 = 0;
LABEL_26:
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientClasses"));
    v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v138, 16);
    if (!v105)
      goto LABEL_107;
    v25 = 0;
    v26 = (mach_header_64 *)&_mh_execute_header;
    v103 = *(_QWORD *)v121;
    while (1)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v121 != v103)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v27);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "prefixForDefaults"));
        v30 = objc_msgSend(v2, "getKillSwitchSettingForPrefix:", v29);
        v31 = DiagnosticLogSubmissionEnabled();
        v32 = sub_10000DFC0();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v135 = v29;
          v136 = 1024;
          *(_DWORD *)v137 = v30;
          *(_WORD *)&v137[4] = 1024;
          *(_DWORD *)&v137[6] = v31;
          *(_WORD *)&v137[10] = 1024;
          *(_DWORD *)&v137[12] = v25 & 1;
          _os_log_impl(v26, v33, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: kill switch setting = %{BOOL}i, diagCollectionEnable = %{BOOL}i, haveEnabledClientAlready = %{BOOL}i", buf, 0x1Eu);
        }

        v34 = v30 | ~(_BYTE)v31;
        if (objc_msgSend(v28, "isEqual:", objc_opt_class(PDSEHangTracerThirdParty)))
          v35 = v30;
        else
          v35 = v34;
        v36 = v35 | v25;
        v37 = sub_10000DFC0();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
        if ((v36 & 1) != 0)
        {
          if (v39)
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl(v26, v38, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: shouldDisable == TRUE, do not enable today", buf, 0xCu);
          }
          v40 = 0;
        }
        else
        {
          if (v39)
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl(v26, v38, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: calling client's to determine if it wantsEnablement", buf, 0xCu);
          }

          v40 = objc_msgSend(v28, "wantsEnablement");
          v41 = sub_10000DFC0();
          v38 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v42 = CFSTR("NO");
            if (v40)
              v42 = CFSTR("YES");
            v135 = v29;
            v136 = 2112;
            *(_QWORD *)v137 = v42;
            _os_log_impl(v26, v38, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: client's wantsEnablement returned %@", buf, 0x16u);
          }
        }

        v43 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)v29);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v45 = objc_msgSend(v44, "count");

        v46 = sub_10000DFC0();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v135 = v29;
          v136 = 1024;
          *(_DWORD *)v137 = v45 != 0;
          *(_WORD *)&v137[4] = 2048;
          *(_QWORD *)&v137[6] = v45;
          *(_WORD *)&v137[14] = 2112;
          *(_QWORD *)&v137[16] = v29;
          _os_log_impl(v26, v47, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: client enabled state = %{BOOL}i, found %lu settings with prefix %@", buf, 0x26u);
        }

        if (v45)
          v48 = 1;
        else
          v48 = v40;
        if ((v48 & 1) == 0)
        {
          v49 = sub_10000DFC0();
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl(v26, v50, OS_LOG_TYPE_INFO, "PDSE: evaluateSelfEnablement %@: Transition from Disable to Disable", buf, 0xCu);
          }

          j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.DisableToDisable"), v29), 1);
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472;
          v118[2] = sub_100006628;
          v118[3] = &unk_100018848;
          v119 = v29;
          AnalyticsSendEventLazy(CFSTR("com.apple.perfdiagsselfenable.transition"), v118);

        }
        v51 = (uint64_t)v24;
        v52 = v25;
        v53 = v26;
        v54 = v40 ^ 1;
        if (v45 || (v54 & 1) != 0)
        {
          v68 = v45 == 0;
          if (v45)
            v69 = v40;
          else
            v69 = 1;
          if ((v69 & 1) == 0)
          {
            v70 = sub_10000DFC0();
            v71 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v135 = v29;
              _os_log_impl(v53, v71, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Transition from Enable to Disable", buf, 0xCu);
            }

            j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.EnableToDisable"), v29), 1);
            CFPreferencesSetValue((CFStringRef)objc_msgSend(v2, "timeoutPrefNameForPrefix:", v29), 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
            v72 = objc_msgSend(v28, "didDisableDiagnostics");
            v73 = sub_10000DFC0();
            v74 = objc_claimAutoreleasedReturnValue(v73);
            v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
            if ((v72 & 1) != 0)
            {
              if (v75)
              {
                *(_DWORD *)buf = 138412290;
                v135 = v29;
                _os_log_impl(v53, v74, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Successful Transition from Enable to Disable", buf, 0xCu);
              }

            }
            else
            {
              if (v75)
              {
                *(_DWORD *)buf = 138412290;
                v135 = v29;
                _os_log_impl(v53, v74, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: FAILED Transition from Enable to Disable", buf, 0xCu);
              }

              j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.EnableToDisable.Failed"), v29), 1);
            }
            v113[0] = _NSConcreteStackBlock;
            v113[1] = 3221225472;
            v113[2] = sub_100006770;
            v113[3] = &unk_100018870;
            v114 = v29;
            v115 = v72;
            AnalyticsSendEventLazy(CFSTR("com.apple.perfdiagsselfenable.transition"), v113);

            v68 = 0;
            v51 = 1;
          }
          if (((v68 | v54) & 1) != 0)
          {
            v26 = v53;
            v25 = v52;
            v24 = (id)v51;
            if (!v40)
              goto LABEL_88;
            goto LABEL_96;
          }
          v79 = sub_10000DFC0();
          v80 = objc_claimAutoreleasedReturnValue(v79);
          v26 = v53;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl(v53, v80, OS_LOG_TYPE_INFO, "PDSE: evaluateSelfEnablement %@: Transition from Enable to Enable", buf, 0xCu);
          }

          j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.EnableToEnable"), v29), 1);
          v112[0] = _NSConcreteStackBlock;
          v112[1] = 3221225472;
          v112[2] = sub_100006834;
          v112[3] = &unk_100018848;
          v112[4] = v29;
          v76 = v112;
          v25 = v52;
          v24 = (id)v51;
        }
        else
        {
          v55 = sub_10000DFC0();
          v56 = objc_claimAutoreleasedReturnValue(v55);
          v26 = v53;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v135 = v29;
            v136 = 2112;
            *(_QWORD *)v137 = v29;
            _os_log_impl(v53, v56, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Transition from Disable to Enable, calling %@'s willEnableDiagnostics", buf, 0x16u);
          }

          j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.DisableToEnable"), v29), 1);
          objc_msgSend(v28, "timeoutDurationSec");
          if (v57 <= 432000.0)
            v58 = v57;
          else
            v58 = 432000.0;
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v59, "timeIntervalSinceReferenceDate");
          v61 = v58 + v60;

          CFPreferencesSetValue((CFStringRef)objc_msgSend(v2, "timeoutPrefNameForPrefix:", v29), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v61), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
          v62 = sub_10000DFC0();
          v63 = objc_claimAutoreleasedReturnValue(v62);
          v25 = v52;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "timeoutPrefNameForPrefix:", v29));
            *(_DWORD *)buf = 138413058;
            v135 = v29;
            v136 = 2112;
            *(_QWORD *)v137 = v64;
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v61;
            *(_WORD *)&v137[18] = 2048;
            *(double *)&v137[20] = v58;
            _os_log_impl(v26, v63, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: set setting %@ to %f secs_after_ref_date, which is %f seconds in the future", buf, 0x2Au);

          }
          v24 = objc_msgSend(v28, "willEnableDiagnostics");
          v65 = sub_10000DFC0();
          v66 = objc_claimAutoreleasedReturnValue(v65);
          v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v24)
          {
            if (v67)
            {
              *(_DWORD *)buf = 138412290;
              v135 = v29;
              _os_log_impl(v26, v66, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Successful Transition from Disable to Enable", buf, 0xCu);
            }

          }
          else
          {
            if (v67)
            {
              *(_DWORD *)buf = 138412290;
              v135 = v29;
              _os_log_impl(v26, v66, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: FAILED Transition from Disable to Enable", buf, 0xCu);
            }

            j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.DisableToEnable.Failed"), v29), 1);
          }
          v116[0] = _NSConcreteStackBlock;
          v116[1] = 3221225472;
          v116[2] = sub_1000066AC;
          v116[3] = &unk_100018870;
          v116[4] = v29;
          v117 = (char)v24;
          v76 = v116;
        }
        AnalyticsSendEventLazy(CFSTR("com.apple.perfdiagsselfenable.transition"), v76);

        if (!v40)
        {
LABEL_88:
          j__ADClientSetValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.EnableToday"), v29), 0);
          v77 = 0;
          if (!-[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("PDSEHangTracer")))
            goto LABEL_90;
LABEL_89:
          j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTSE.EnabledToday"), v77);
          goto LABEL_90;
        }
LABEL_96:
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v82 = objc_msgSend(v81, "pdseAllowEnableTailspin");

        v83 = sub_10000DFC0();
        v84 = objc_claimAutoreleasedReturnValue(v83);
        v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
        if (v82)
        {
          if (v85)
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl(v26, v84, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: get desired tailspin config", buf, 0xCu);
          }

          v86 = objc_msgSend(v28, "desiredTailspinConfig");
          if (v86)
          {
            v87 = (uint64_t)v86;
            tailspin_config_free(v97);
            v97 = v87;
          }
        }
        else
        {
          if (v85)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v26, v84, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement: will NOT enable tailspin due to PDSE Enable Tailspin is FALSE", buf, 2u);
          }

        }
        v77 = 1;
        j__ADClientSetValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.EnableToday"), v29), 1);
        v25 = 1;
        if ((-[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("PDSEHangTracer")) & 1) != 0)
          goto LABEL_89;
LABEL_90:
        v109[0] = _NSConcreteStackBlock;
        v109[1] = 3221225472;
        v109[2] = sub_1000068B8;
        v109[3] = &unk_100018870;
        v110 = v29;
        v111 = v40;
        v78 = v29;
        AnalyticsSendEventLazy(CFSTR("com.apple.perfdiagsselfenable.EnabledToday"), v109);

        v27 = (char *)v27 + 1;
      }
      while (v105 != v27);
      v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v138, 16);
      v105 = v88;
      if (!v88)
      {
LABEL_107:

        goto LABEL_108;
      }
    }
  }
  v101 = 0;
  v5 = 0;
  v106 = *(_QWORD *)v131;
  v6 = v4;
  v99 = v2;
  hostName = v3;
  do
  {
    v7 = 0;
    v102 = v6;
    do
    {
      if (*(_QWORD *)v131 != v106)
        objc_enumerationMutation(v3);
      v107 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "prefixForDefaults"));
      if (objc_msgSend(v2, "hasTimeoutExpiredForPrefix:", v8))
      {
        v104 = v7;
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v108 = v8;
        v9 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v127;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v127 != v13)
                objc_enumerationMutation(v10);
              v15 = *(const __CFString **)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)i);
              CFPreferencesSetValue(v15, 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
              v16 = sub_10000DFC0();
              v17 = objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v135 = v15;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "PDSE: Timeout Force Disable, delete setting %@", buf, 0xCu);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
          }
          while (v12);
        }

        v2 = v99;
        CFPreferencesSetValue((CFStringRef)objc_msgSend(v99, "timeoutPrefNameForPrefix:", v108), 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
        v18 = sub_10000DFC0();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "timeoutPrefNameForPrefix:", v108));
          *(_DWORD *)buf = 138412290;
          v135 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDSE: Timeout Force Disable, delete timeout setting %@", buf, 0xCu);

        }
        CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
        j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.pdse.%@.TimeoutForceDisable"), v108), 1);
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472;
        v124[2] = sub_1000065B8;
        v124[3] = &unk_100018848;
        v21 = v108;
        v125 = (__CFString *)v21;
        AnalyticsSendEventLazy(CFSTR("com.apple.perfdiagsselfenable.TimeoutForceDisable"), v124);
        v22 = sub_10000DFC0();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        v3 = (__CFString *)hostName;
        v7 = v104;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PDSE: Timeout Force Disable, call %@'s didDisableDiagnostics method", buf, 0xCu);
        }

        objc_msgSend(v107, "didDisableDiagnostics");
        v101 = 1;
        v5 = 1;
        v6 = v102;
        v8 = v108;
      }

      v7 = (char *)v7 + 1;
    }
    while (v7 != v6);
    v6 = -[__CFString countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v130, v140, 16);
  }
  while (v6);

  v24 = (id)v5;
  if ((v101 & 1) == 0)
    goto LABEL_26;
LABEL_108:
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v90 = objc_msgSend(v89, "isInternal");

  v91 = sub_10000DFC0();
  v92 = objc_claimAutoreleasedReturnValue(v91);
  v93 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
  if ((v90 & 1) != 0)
  {
    if (v93)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement: will NOT configure tailspin for internal install", buf, 2u);
    }

    v94 = v97;
  }
  else
  {
    if (v93)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement: configure tailspin for desired tailspin config", buf, 2u);
    }

    v94 = v97;
    sub_10000CF74(v97);
  }
  tailspin_config_free(v94);
  if ((v24 & 1) != 0)
  {
    v95 = sub_10000DFC0();
    v96 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "PDSE: Posting notification regarding enablement state change", buf, 2u);
    }

    notify_post(off_10001E510);
  }
}

+ (BOOL)getKillSwitchSettingForPrefix:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHangTracer")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseHangTracerKillSwitch");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHTBadDay")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseHTBadDayKillSwitch");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHTRateOnly")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseHTRateOnlyKillSwitch");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHTThirdParty")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseHTThirdPartyKillSwitch");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSESentry")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseSentryKillSwitch");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEWorkflowResponsiveness")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseWorkflowResponsivenessKillSwitch");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PDSECATailspin")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseCATailspinKillSwitch");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEAppLaunch")))
    {
      v6 = 1;
      goto LABEL_18;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "pdseAppLaunchKillSwitch");
  }
  v6 = v5;

LABEL_18:
  return v6;
}

+ (id)timeoutPrefNameForPrefix:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHangTracer")) & 1) != 0)
  {
    v4 = &off_1000186C8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHTBadDay")) & 1) != 0)
  {
    v4 = &off_1000186D0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHTRateOnly")) & 1) != 0)
  {
    v4 = &off_1000186D8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEHTThirdParty")) & 1) != 0)
  {
    v4 = &off_1000186E0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSESentry")) & 1) != 0)
  {
    v4 = &off_1000186E8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEWorkflowResponsiveness")) & 1) != 0)
  {
    v4 = &off_100018700;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDSECATailspin")) & 1) != 0)
  {
    v4 = &off_1000186F0;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("PDSEAppLaunch")))
    {
      v5 = CFSTR("PDSEUnknownPrefixTimeout");
      goto LABEL_18;
    }
    v4 = &off_1000186F8;
  }
  v5 = *v4;
LABEL_18:

  return v5;
}

+ (double)getTimeoutForPrefix:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)CFPreferencesCopyValue((CFStringRef)objc_msgSend(a1, "timeoutPrefNameForPrefix:", a3), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v4 = 0.0;
  if ((objc_opt_respondsToSelector(v3, "doubleValue") & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v5;
  }

  return v4;
}

+ (BOOL)hasTimeoutExpiredForPrefix:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v18;
  void *v19;
  uint64_t v20;
  int v21;
  id v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend(a1, "getTimeoutForPrefix:", v4);
  v6 = v5;
  v7 = sub_10000DFC0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v21 = 138412546;
    v22 = v4;
    v23 = 2048;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PDSE: Fetching timeout for %@, it has value = %f", (uint8_t *)&v21, 0x16u);
  }

  if (v6 == 0.0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        objc_msgSend(v9, "timeIntervalSinceReferenceDate"),
        v11 = v10,
        v9,
        v11 < v6))
  {
    v12 = sub_10000DFC0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v21 = 138412802;
      v22 = v4;
      v23 = 2048;
      v24 = v6;
      v25 = 2048;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PDSE: Timeout for %@ has not expired (timeout = %f, current time = %f)", (uint8_t *)&v21, 0x20u);

    }
    v16 = 0;
  }
  else
  {
    v18 = sub_10000DFC0();
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
      v21 = 138412802;
      v22 = v4;
      v23 = 2048;
      v24 = v6;
      v25 = 2048;
      v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDSE: Timeout for %@ has EXPIRED! (timeout = %f, current time = %f)", (uint8_t *)&v21, 0x20u);

    }
    v16 = 1;
  }

  return v16;
}

@end
