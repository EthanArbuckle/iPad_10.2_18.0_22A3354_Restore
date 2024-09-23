@implementation GKWidgetEventListener

- (void)activateListener
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = objc_msgSend(objc_alloc((Class)CHSWidgetEventServiceListener), "initWithServiceDomain:delegate:", CFSTR("com.apple.chrono.event-service.gamed"), self);
  -[GKWidgetEventListener setListener:](self, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKWidgetEventListener listener](self, "listener"));
  objc_msgSend(v4, "activate");

  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Activating CHSWidgetEventServiceListener listener", v8, 2u);
  }
}

- (BOOL)isKnownScheme:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_100318190[0];
  v4 = a3;
  if (v3 != -1)
    dispatch_once(qword_100318190, &stru_1002C5210);
  v5 = objc_msgSend((id)qword_100318188, "containsObject:", v4);

  return v5;
}

- (BOOL)isActionDefined:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentPlayer) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentLeaderboard) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentAchievement) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentGame) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentDashboard);
  }

  return v4;
}

- (id)makeDeepLinkDictionaryFrom:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  id v41;
  id v42;
  void *v44;
  id v45;
  uint8_t v46[8];
  _QWORD v47[13];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint8_t buf[8];
  uint8_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  _QWORD v102[4];
  _QWORD v103[4];
  _QWORD v104[6];
  _QWORD v105[6];
  _QWORD v106[6];
  _QWORD v107[6];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[6];
  _QWORD v111[6];
  _QWORD v112[2];
  _QWORD v113[2];

  v45 = a3;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "host"));
  v4 = (void *)v3;
  if (v3)
  {
    v44 = (void *)v3;
    v95 = 0;
    *(_QWORD *)buf = 0;
    v97 = buf;
    v98 = 0x3032000000;
    v99 = sub_10015F474;
    v100 = sub_10015F484;
    v101 = 0;
    v90 = 0;
    v91 = &v90;
    v92 = 0x3032000000;
    v93 = sub_10015F474;
    v94 = sub_10015F484;
    v84 = 0;
    v85 = &v84;
    v86 = 0x3032000000;
    v87 = sub_10015F474;
    v88 = sub_10015F484;
    v89 = 0;
    v78 = 0;
    v79 = &v78;
    v80 = 0x3032000000;
    v81 = sub_10015F474;
    v82 = sub_10015F484;
    v83 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = sub_10015F474;
    v76 = sub_10015F484;
    v77 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = sub_10015F474;
    v70 = sub_10015F484;
    v71 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = sub_10015F474;
    v64 = sub_10015F484;
    v65 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = sub_10015F474;
    v58 = sub_10015F484;
    v59 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_10015F474;
    v52 = sub_10015F484;
    v53 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "queryItems"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10015F48C;
    v47[3] = &unk_1002C5238;
    v47[4] = buf;
    v47[5] = &v90;
    v47[6] = &v84;
    v47[7] = &v78;
    v47[8] = &v72;
    v47[9] = &v66;
    v47[10] = &v60;
    v47[11] = &v48;
    v47[12] = &v54;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v47);

    if (objc_msgSend(v44, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentDashboard))
    {
      if (objc_msgSend((id)v67[5], "length"))
      {
        v110[0] = GKRemoteAlertDeeplinkActionKey;
        v110[1] = GKRemoteAlertDeeplinkActionIdentifierKey;
        v6 = (const __CFString *)v67[5];
        if (!v6)
          v6 = &stru_1002CE2A8;
        v111[0] = GKRemoteAlertDeeplinkActionActivityIdValue;
        v111[1] = v6;
        v7 = (const __CFString *)v49[5];
        if (!v7)
          v7 = &stru_1002CE2A8;
        v110[2] = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
        v110[3] = GKRemoteAlertDeeplinkActionActivityTypeKey;
        v8 = (const __CFString *)v61[5];
        if (!v8)
          v8 = &stru_1002CE2A8;
        v111[2] = v7;
        v111[3] = v8;
        v9 = (const __CFString *)v55[5];
        if (!v9)
          v9 = &stru_1002CE2A8;
        v110[4] = GKRemoteAlertDeeplinkActionWidgetIdKey;
        v110[5] = GKRemoteAlertDeeplinkGameAdamIdKey;
        v10 = (const __CFString *)v91[5];
        if (!v10)
          v10 = &stru_1002CE2A8;
        v11 = v110;
        v12 = v111;
        v111[4] = v9;
        v111[5] = v10;
        v13 = 6;
        goto LABEL_37;
      }
      v24 = (const __CFString *)v49[5];
      if (!v24)
        v24 = &stru_1002CE2A8;
      v112[0] = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
      v112[1] = GKRemoteAlertDeeplinkActionWidgetIdKey;
      v25 = (const __CFString *)v55[5];
      if (!v25)
        v25 = &stru_1002CE2A8;
      v113[0] = v24;
      v113[1] = v25;
      v11 = v112;
      v12 = v113;
LABEL_36:
      v13 = 2;
LABEL_37:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, v13));
LABEL_73:
      v4 = v44;
LABEL_74:
      _Block_object_dispose(&v48, 8);

      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(&v60, 8);

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(&v72, 8);

      _Block_object_dispose(&v78, 8);
      _Block_object_dispose(&v84, 8);

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_75;
    }
    if (objc_msgSend(v44, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentPlayer))
    {
      if (objc_msgSend((id)v79[5], "length"))
      {
        v108[0] = GKRemoteAlertDeeplinkActionKey;
        v108[1] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
        v17 = v79[5];
        v109[0] = GKRemoteAlertDeeplinkActionPlayerProfileValue;
        v109[1] = v17;
        v11 = v108;
        v12 = v109;
        goto LABEL_36;
      }
      if (!os_log_GKGeneral)
        v33 = (id)GKOSLoggers(0);
      v34 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v46 = 0;
        v35 = "GKWidgetEventListener: Received malformed player data";
LABEL_71:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, v35, v46, 2u);
      }
    }
    else
    {
      if (objc_msgSend(v44, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentLeaderboard))
      {
        v4 = v44;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v97 + 5), "firstObject"));
        v19 = objc_msgSend(v18, "length");
        if (v19
          && (v19 = objc_msgSend((id)v73[5], "length")) != 0
          && (v19 = objc_msgSend((id)v79[5], "length")) != 0
          && (v19 = objc_msgSend((id)v85[5], "length")) != 0)
        {
          v106[0] = GKRemoteAlertDeeplinkActionKey;
          v106[1] = GKRemoteAlertDeeplinkActionIdentifierKey;
          v20 = v85[5];
          v106[2] = GKRemoteAlertDeeplinkGameBundleIdentifierKey;
          v106[3] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
          v21 = v79[5];
          v107[2] = v20;
          v107[3] = v21;
          v22 = v73[5];
          v106[4] = GKRemoteAlertDeeplinkActionNameKey;
          v106[5] = GKRemoteAlertDeeplinkGameAdamIdKey;
          v23 = (const __CFString *)v91[5];
          if (!v23)
            v23 = &stru_1002CE2A8;
          v107[0] = GKRemoteAlertDeeplinkActionLeaderboardValue;
          v107[1] = v18;
          v107[4] = v22;
          v107[5] = v23;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v107, v106, 6));
        }
        else
        {
          if (!os_log_GKGeneral)
            v31 = (id)GKOSLoggers(v19);
          v32 = os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v46 = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received malformed leaderboard data", v46, 2u);
          }
          v16 = 0;
        }

        goto LABEL_74;
      }
      if (objc_msgSend(v44, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentAchievement))
      {
        v26 = objc_msgSend((id)v85[5], "length");
        if (v26)
        {
          v26 = objc_msgSend((id)v79[5], "length");
          if (v26)
          {
            v26 = objc_msgSend((id)v73[5], "length");
            if (v26)
            {
              v105[0] = GKRemoteAlertDeeplinkActionAchievementsValue;
              v104[0] = GKRemoteAlertDeeplinkActionKey;
              v104[1] = GKRemoteAlertDeeplinkAchievementsIdsKey;
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v97 + 5), "componentsJoinedByString:", CFSTR(",")));
              v28 = v85[5];
              v105[1] = v27;
              v105[2] = v28;
              v104[2] = GKRemoteAlertDeeplinkGameBundleIdentifierKey;
              v104[3] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
              v29 = v73[5];
              v105[3] = v79[5];
              v105[4] = v29;
              v104[4] = GKRemoteAlertDeeplinkActionNameKey;
              v104[5] = GKRemoteAlertDeeplinkGameAdamIdKey;
              v30 = (const __CFString *)v91[5];
              if (!v30)
                v30 = &stru_1002CE2A8;
              v105[5] = v30;
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, v104, 6));

              v4 = v44;
              goto LABEL_74;
            }
          }
        }
        if (!os_log_GKGeneral)
          v41 = (id)GKOSLoggers(v26);
        v34 = os_log_GKDaemon;
        if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          goto LABEL_72;
        *(_WORD *)v46 = 0;
        v35 = "GKWidgetEventListener: Received malformed achievement data";
        goto LABEL_71;
      }
      if (objc_msgSend(v44, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentGame))
      {
        v36 = objc_msgSend((id)v85[5], "length");
        if (v36)
        {
          v36 = objc_msgSend((id)v91[5], "length");
          if (v36)
          {
            v37 = v85[5];
            v102[0] = GKRemoteAlertDeeplinkGameBundleIdentifierKey;
            v102[1] = GKRemoteAlertDeeplinkGameAdamIdKey;
            v38 = v91[5];
            v103[0] = v37;
            v103[1] = v38;
            v39 = (const __CFString *)v49[5];
            if (!v39)
              v39 = &stru_1002CE2A8;
            v102[2] = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
            v102[3] = GKRemoteAlertDeeplinkActionWidgetIdKey;
            v40 = (const __CFString *)v55[5];
            if (!v40)
              v40 = &stru_1002CE2A8;
            v103[2] = v39;
            v103[3] = v40;
            v11 = v102;
            v12 = v103;
            v13 = 4;
            goto LABEL_37;
          }
        }
        if (!os_log_GKGeneral)
          v42 = (id)GKOSLoggers(v36);
        v34 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v46 = 0;
          v35 = "GKWidgetEventListener: Received malformed achievement data";
          goto LABEL_71;
        }
      }
    }
LABEL_72:
    v16 = 0;
    goto LABEL_73;
  }
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(0);
  v15 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Missing host from recived url", buf, 2u);
  }
  v16 = 0;
LABEL_75:

  return v16;
}

- (void)eventServiceListener:(id)a3 didReceiveOpenEventWithURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSMutableDictionary *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  _UNKNOWN **v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  NSObject *v41;
  _BOOL8 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __CFString *v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  __CFString *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  __CFString *v64;
  __CFString *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  __CFString *v73;
  void *v74;
  __CFString *v75;
  id v76;
  NSObject *v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  signed int v83;
  void *v84;
  id v85;
  NSObject *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  __CFString *v93;
  __CFString *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  NSObject *v100;
  id v101;
  __CFString *v102;
  void *v103;
  _UNKNOWN **v104;
  NSMutableDictionary *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  _QWORD v113[4];
  __CFString *v114;
  _UNKNOWN **v115;
  id v116;
  id v117;
  _QWORD v118[4];
  __CFString *v119;
  _UNKNOWN **v120;
  __CFString *v121;
  id v122;
  id v123;
  _QWORD v124[4];
  NSMutableDictionary *v125;
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[9];
  _QWORD v129[9];
  uint8_t buf[4];
  __CFString *v131;
  __int16 v132;
  _UNKNOWN **v133;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    *(_DWORD *)buf = 138412290;
    v131 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received url %@", buf, 0xCu);

  }
  v13 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v8, 0);
  if (v13)
  {
    if (_os_feature_enabled_impl("gseui", "de7bbd8e"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("game-overlay-ui"));

      if (v15)
      {
        if (!os_log_GKGeneral)
          v17 = (id)GKOSLoggers(v16);
        v18 = (void *)os_log_GKDaemon;
        if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          goto LABEL_28;
        goto LABEL_27;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("GCActivityFeedLockup"));

    if ((v20 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:credential:](GKUtilityServicePrivate, "serviceWithTransport:forClient:credential:", 0, v21, 0));

      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "host"));
      if (-[__CFString isEqualToString:](v23, "isEqualToString:", GKMarkdownURLFormulationPathComponentASCLaunchTrampoline))
      {
        v108 = v22;
        v111 = v23;
        v24 = objc_opt_new(NSMutableDictionary);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queryItems"));
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472;
        v124[2] = sub_1001604AC;
        v124[3] = &unk_1002C5260;
        v26 = v24;
        v125 = v26;
        objc_msgSend(v25, "enumerateObjectsUsingBlock:", v124);

        v106 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", GKActivityFeedMarkdownURLFormulationQueryAdamId));
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", GKActivityFeedMarkdownURLFormulationQueryBundleId));
        v27 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", GKMarkdownURLFormulationQueryWidgetId));
        v28 = (void *)v27;
        if (v27)
          v29 = (__CFString *)v27;
        else
          v29 = &stru_1002CE2A8;
        v102 = v29;

        v30 = GKMarkdownURLFormulationQueryWidgetSize;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", GKMarkdownURLFormulationQueryWidgetSize));

        if (v31)
          v32 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v30));
        else
          v32 = &off_1002DBE80;
        v62 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", GKMarkdownURLFormulationQueryLocalizedName));
        v63 = (void *)v62;
        if (v62)
          v64 = (__CFString *)v62;
        else
          v64 = &stru_1002CE2A8;
        v65 = v64;

        v105 = v26;
        if (v106)
        {
          v67 = (int)objc_msgSend(v32, "intValue");
          v68 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", GKMarkdownURLFormulationQueryTopic));
          v69 = v6;
          v70 = (void *)v68;
          v71 = &stru_1002CE2A8;
          if (v68)
            v71 = (const __CFString *)v68;
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[ASCAppLaunchTrampolineURL URLWithAdamId:bundleId:widgetId:widgetSize:localizedName:sourceApplication:topic:](ASCAppLaunchTrampolineURL, "URLWithAdamId:bundleId:widgetId:widgetSize:localizedName:sourceApplication:topic:", v106, v109, v102, v67, v65, CFSTR("com.apple.gamecenter.widgets.extension"), v71));

          v6 = v69;
          v73 = v102;
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472;
          v118[2] = sub_100160534;
          v118[3] = &unk_1002C5288;
          v119 = v102;
          v120 = v32;
          v121 = v65;
          v122 = v106;
          v123 = v108;
          objc_msgSend(v123, "invokeASCAppLaunchTrampolineWithURL:handler:", v72, v118);

          v23 = v111;
          v74 = v106;
          v75 = v65;
          v22 = v108;
        }
        else
        {
          v75 = v65;
          if (!os_log_GKGeneral)
            v76 = (id)GKOSLoggers(v66);
          v77 = os_log_GKDaemon;
          v74 = 0;
          v22 = v108;
          v73 = v102;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v131 = v102;
            v132 = 2112;
            v133 = v32;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Unexpected nil value returned in adamId for widgetId: %@, size: %@", buf, 0x16u);
          }
        }

        v46 = (__CFString *)v105;
      }
      else
      {
        v42 = -[GKWidgetEventListener isActionDefined:](self, "isActionDefined:", v23);
        if (v42)
        {
          v107 = v6;
          v43 = objc_claimAutoreleasedReturnValue(-[GKWidgetEventListener makeDeepLinkDictionaryFrom:](self, "makeDeepLinkDictionaryFrom:", v13));
          v44 = (void *)v43;
          v45 = &__NSDictionary0__struct;
          if (v43)
            v45 = (void *)v43;
          v46 = v45;

          v47 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", GKRemoteAlertDeeplinkActionWidgetIdKey));
          v48 = (void *)v47;
          v49 = &stru_1002CE2A8;
          if (v47)
            v49 = (__CFString *)v47;
          v110 = v49;

          v50 = GKRemoteAlertDeeplinkActionWidgetFamilyKey;
          v51 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", GKRemoteAlertDeeplinkActionWidgetFamilyKey));
          v112 = v23;
          if (v51)
          {
            v52 = (void *)v51;
            v53 = v22;
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v50));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC540, "objectForKeyedSubscript:", v54));

            if (v55)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v50));
              v104 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC540, "objectForKeyedSubscript:", v56));

            }
            else
            {
              v104 = &off_1002DBE80;
            }
            v22 = v53;
            v23 = v112;
          }
          else
          {
            v104 = &off_1002DBE80;
          }
          v78 = -[__CFString isEqualToString:](v23, "isEqualToString:", GKActivityFeedMarkdownURLFormulationPathComponentGame);
          if ((_DWORD)v78)
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", GKRemoteAlertDeeplinkGameAdamIdKey));
            v80 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", GKRemoteAlertDeeplinkGameBundleIdentifierKey));
            v81 = (void *)v80;
            if (v79)
            {
              v82 = v104;
              v83 = objc_msgSend(v104, "intValue");
              v84 = (void *)objc_claimAutoreleasedReturnValue(+[ASCAppLaunchTrampolineURL URLWithAdamId:bundleId:widgetId:widgetSize:localizedName:sourceApplication:topic:](ASCAppLaunchTrampolineURL, "URLWithAdamId:bundleId:widgetId:widgetSize:localizedName:sourceApplication:topic:", v79, v81, v110, v83, &stru_1002CE2A8, CFSTR("com.apple.gamecenter.widgets.extension"), GKReporterCSTopic));
              v113[0] = _NSConcreteStackBlock;
              v113[1] = 3221225472;
              v113[2] = sub_100160878;
              v113[3] = &unk_1002C52B0;
              v114 = v110;
              v115 = v104;
              v116 = v79;
              v117 = v22;
              objc_msgSend(v117, "invokeASCAppLaunchTrampolineWithURL:handler:", v84, v113);

              v6 = v107;
            }
            else
            {
              if (!os_log_GKGeneral)
                v99 = (id)GKOSLoggers(v80);
              v100 = os_log_GKDaemon;
              v82 = v104;
              v6 = v107;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v131 = v110;
                v132 = 2112;
                v133 = v104;
                _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Unexpected nil value returned in adamId for widgetId: %@, size: %@", buf, 0x16u);
              }
            }

          }
          else
          {
            if (!os_log_GKGeneral)
              v85 = (id)GKOSLoggers(v78);
            v86 = os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v131 = v46;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Opening remote dashboard with deepLink %@", buf, 0xCu);
            }
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerActivityItemInternal typeToConstantMapMetrics](GKPlayerActivityItemInternal, "typeToConstantMapMetrics"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", GKRemoteAlertDeeplinkActionActivityTypeKey));
            v89 = objc_msgSend(v88, "integerValue");

            v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v89));
            v103 = v87;
            v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", v90));
            v92 = (void *)v91;
            v93 = CFSTR("dashboard");
            if (v91)
              v93 = (__CFString *)v91;
            v94 = v93;

            v101 = objc_alloc((Class)NSMutableDictionary);
            v128[0] = CFSTR("eventType");
            v128[1] = CFSTR("actionType");
            v129[0] = CFSTR("click");
            v129[1] = CFSTR("navigate");
            v129[2] = v110;
            v128[2] = CFSTR("pageType");
            v128[3] = CFSTR("widgetContext");
            v126[0] = CFSTR("widgetId");
            v126[1] = CFSTR("size");
            v127[0] = v110;
            v127[1] = v104;
            v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 2));
            v129[3] = v95;
            v129[4] = v110;
            v82 = v104;
            v128[4] = CFSTR("widgetId");
            v128[5] = CFSTR("size");
            v129[5] = v104;
            v129[6] = CFSTR("dashboard");
            v128[6] = CFSTR("targetId");
            v128[7] = CFSTR("targetType");
            v128[8] = CFSTR("location");
            v129[7] = v94;
            v129[8] = &off_1002DC728;
            v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v129, v128, 9));

            v97 = objc_msgSend(v101, "initWithDictionary:", v96);
            v98 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", GKRemoteAlertDeeplinkGameAdamIdKey));
            if (v98)
              objc_msgSend(v97, "setObject:forKeyedSubscript:", v98, CFSTR("subjectId"));
            objc_msgSend(v22, "reportMetricsEventWithTopic:shouldFlush:metricsFields:", GKReporterCSTopic, &__kCFBooleanFalse, v97);

            v79 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameInternal createGamedGameInternal](GKGameInternal, "createGamedGameInternal"));
            objc_msgSend(v22, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v79, getpid(), v46, GKDashboardLaunchContextWidget);
            v6 = v107;
          }

          v23 = v112;
        }
        else
        {
          if (!os_log_GKGeneral)
            v60 = (id)GKOSLoggers(v42);
          v61 = os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v131 = v23;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "GKWidgetEventListener: No action defined for %@", buf, 0xCu);
          }
          v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GKGameInternal createGamedGameInternal](GKGameInternal, "createGamedGameInternal"));
          objc_msgSend(v22, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v46, getpid(), &__NSDictionary0__struct, GKDashboardLaunchContextWidget);
        }
      }

    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
      v36 = -[GKWidgetEventListener isKnownScheme:](self, "isKnownScheme:", v35);

      if (v36)
      {
        if (!os_log_GKGeneral)
          v38 = (id)GKOSLoggers(v37);
        v18 = (void *)os_log_GKDaemon;
        if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          goto LABEL_28;
LABEL_27:
        v39 = v18;
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
        *(_DWORD *)buf = 138412290;
        v131 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received a known scheme \"%@\" and will open the URL", buf, 0xCu);

LABEL_28:
        v41 = objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
        -[NSObject openURL:](v41, "openURL:", v8);
LABEL_29:

        goto LABEL_82;
      }
      if (!os_log_GKGeneral)
        v57 = (id)GKOSLoggers(v37);
      v58 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v41 = v58;
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
        *(_DWORD *)buf = 138412290;
        v131 = v59;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Received an unknown scheme %@", buf, 0xCu);

        goto LABEL_29;
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v33 = (id)GKOSLoggers(0);
    v34 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "GKWidgetEventListener: Unable to parse url", buf, 2u);
    }
  }
LABEL_82:

}

- (CHSWidgetEventServiceListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
