@implementation NESMPathControllerSession

- (NESMPathControllerSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6;
  NESMPathControllerSession *v7;
  NESMPathControllerSession *v8;
  uint64_t v9;
  NEPathController *controllerConfiguration;
  const char *v11;
  const char *v12;
  NESMPolicySession *v13;
  void *v14;
  id v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NESMPathControllerSession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v17, "initWithConfiguration:andServer:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_level = 0;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathController"));
    controllerConfiguration = v8->_controllerConfiguration;
    v8->_controllerConfiguration = (NEPathController *)v9;

    v8->_needsRoamingMonitor = sub_10008C8C0(v8, 0);
    v8->_needsFallbackNotifications = sub_10008CD84(v8, v11);
    sub_10008CE7C(v8, v12);
    v13 = [NESMPolicySession alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v15 = objc_msgSend(v6, "grade");
    if (v13)
      v13 = (NESMPolicySession *)sub_10002EB54((id *)&v13->super.isa, v14, 5, v15, (void *)1, (void *)1);
    -[NESMSession setPolicySession:](v8, "setPolicySession:", v13);

    sub_10007AAF8(v8);
  }

  return v8;
}

- (int)type
{
  return 5;
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return !a3 || (a3 & 0xFFFFFFFD) == 1;
}

- (void)handleStartMessage:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMPathControllerSession;
  -[NESMSession handleStartMessage:](&v5, "handleStartMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  objc_msgSend(v4, "requestInstallForSession:withParentSession:exclusive:", self, 0, 0);

}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  NESMPathControllerSession *v11;

  v3 = *(_QWORD *)&a3;
  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v3 == 36)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Resetting policies", buf, 0xCu);
    }

    -[NESMSession setRestartPending:](self, "setRestartPending:", 0);
    sub_100088278(self, 1, 0);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Uninstalling", buf, 0xCu);
    }

    v9.receiver = self;
    v9.super_class = (Class)NESMPathControllerSession;
    -[NESMSession handleStopMessageWithReason:](&v9, "handleStopMessageWithReason:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    objc_msgSend(v8, "requestUninstallForSession:", self);

  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)NESMPathControllerSession,
        -[NESMSession handleUpdateConfiguration:](&v13, "handleUpdateConfiguration:", v4)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathController"));
    v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 368);

      self->_needsRoamingMonitor = sub_10008C8C0(self, 0);
      self->_needsFallbackNotifications = sub_10008CD84(self, v8);
      sub_10008CE7C(self, v9);
    }
    else
    {

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    objc_msgSend(v10, "requestInstallForSession:withParentSession:exclusive:", self, 0, 0);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD v8[5];
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 <= 5)
  {
    v10 = v3;
    v11 = v4;
    if (((1 << a3) & 0x2A) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10008CC70;
      v8[3] = &unk_1000BECF8;
      v8[4] = self;
      v9 = a3;
      dispatch_async(v7, v8);

    }
  }
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CC30;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleInstalledAppsChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CA88;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id v9;
  const char *v10;
  void *v11;
  int v12;
  id v13;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didStartTrackingNOI %@", (uint8_t *)&v12, 0xCu);
  }

  if (self)
  {
    v9 = objc_getProperty(self, v8, 512, 1);
    v11 = v9;
    if (v9)
      objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("considerAlternateUpdate"));
    objc_setProperty_atomic(self, v10, v4, 512);

  }
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("considerAlternateUpdate"), 5, 0);

}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  SEL v10;
  int v11;
  id v12;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didStopTrackingNOI %@", (uint8_t *)&v11, 0xCu);
  }

  if (self)
  {
    if (objc_getProperty(self, v8, 512, 1) == v4)
    {
      objc_msgSend(objc_getProperty(self, v9, 512, 1), "removeObserver:forKeyPath:", self, CFSTR("considerAlternateUpdate"));
      objc_setProperty_atomic(self, v10, 0, 512);
    }
  }
  else if (!v4)
  {
    objc_msgSend(0, "removeObserver:forKeyPath:", 0, CFSTR("considerAlternateUpdate"));
  }

}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  SEL v9;
  const char *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = ne_log_large_obj(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "didStopTrackingAllNOIs %@", (uint8_t *)&v11, 0xCu);
  }

  if (self)
  {
    if (objc_msgSend(v4, "containsObject:", objc_getProperty(self, v7, 512, 1)))
    {
      objc_msgSend(objc_getProperty(self, v8, 512, 1), "removeObserver:forKeyPath:", self, CFSTR("considerAlternateUpdate"));
      objc_setProperty_atomic(self, v9, 0, 512);
    }
    if (objc_getProperty(self, v8, 504, 1))
      objc_msgSend(objc_getProperty(self, v10, 504, 1), "trackNOIAnyForInterfaceType:options:", 1, 0);
  }
  else if ((objc_msgSend(v4, "containsObject:", 0) & 1) != 0)
  {
    objc_msgSend(0, "removeObserver:forKeyPath:", 0, CFSTR("considerAlternateUpdate"));
  }

}

- (void)install
{
  id v3;
  id v4;
  void *v5;
  SEL v6;
  SEL v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  SEL v21;
  void *v22;
  SEL v23;
  void *v24;
  SEL v25;
  void *v26;
  SEL v27;
  void *v28;
  SEL v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_time_t v32;
  SEL v33;
  id v34;
  SEL v35;
  SEL v36;
  const char *v37;
  id v38;
  void *v39;
  SEL v40;
  SEL v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  id Property;
  __int128 handler;
  void (*v53)(uint64_t);
  void *v54;
  NESMPathControllerSession *v55;

  if (self)
  {
    if (self->_needsRoamingMonitor)
    {
      if (!objc_getProperty(self, a2, 392, 1))
      {
        v3 = objc_alloc_init((Class)NWNetworkDescription);
        objc_msgSend(v3, "setRoamingPreference:", 1);
        v4 = objc_alloc_init((Class)NWParameters);
        objc_msgSend(v4, "setRequiredInterfaceType:", 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:](NWMonitor, "monitorWithNetworkDescription:endpoint:parameters:", v3, 0, v4));
        objc_setProperty_atomic(self, v6, v5, 392);

        if (objc_getProperty(self, v7, 392, 1))
        {
          v9 = objc_getProperty(self, v8, 416, 1);
          if (v9)
          {

          }
          else
          {
            v13 = sub_10008C8C0(self, (const char *)1);
            if ((_DWORD)v13)
            {
              v14 = ne_log_obj(v13, v10);
              v15 = objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(handler) = 0;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Begin roaming monitor transaction", (uint8_t *)&handler, 2u);
              }

              v16 = objc_alloc((Class)NSString);
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
              v19 = objc_msgSend(v16, "initWithFormat:", CFSTR("com.apple.nesessionmanager.RoamingMonitor.%@"), v18);

              v20 = (void *)os_transaction_create(objc_msgSend(v19, "UTF8String"));
              objc_setProperty_atomic(self, v21, v20, 416);

            }
          }
          objc_msgSend(objc_getProperty(self, v10, 392, 1), "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, 0);
        }
        else
        {
          v11 = ne_log_obj(0, v8);
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Roaming monitor creation failed", (uint8_t *)&handler, 2u);
          }

        }
      }
    }
    else
    {
      sub_10008C1D4(self, a2);
    }
    if (self->_needsFallbackNotifications)
    {
      if (!self->_watchingFallbackNotifications)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_setProperty_atomic(self, v23, v22, 456);

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_setProperty_atomic(self, v25, v24, 464);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        objc_setProperty_atomic(self, v27, v26, 472);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_setProperty_atomic(self, v29, v28, 480);

        self->_fallbackInUseToken = -1;
        v30 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
        v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v30);

        v32 = dispatch_time(0, -1);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
        *(_QWORD *)&handler = _NSConcreteStackBlock;
        *((_QWORD *)&handler + 1) = 3221225472;
        v53 = sub_10008C8B8;
        v54 = &unk_1000BEB80;
        v55 = self;
        dispatch_source_set_event_handler(v31, &handler);
        dispatch_resume(v31);
        objc_setProperty_atomic(self, v33, v31, 488);

        v34 = objc_alloc_init(off_1000CF5E0());
        objc_setProperty_atomic(self, v35, v34, 504);

        if (objc_getProperty(self, v36, 504, 1))
        {
          v38 = objc_getProperty(self, v37, 504, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
          objc_msgSend(v38, "setQueue:", v39);

          objc_msgSend(objc_getProperty(self, v40, 504, 1), "setDelegate:", self);
          objc_msgSend(objc_getProperty(self, v41, 504, 1), "trackNOIAnyForInterfaceType:options:", 1, 0);
        }
        else
        {
          v42 = ne_log_obj(0, v37);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "NWNetworkOfInterestManager alloc failed", (uint8_t *)&handler, 2u);
          }

        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
        objc_msgSend(v44, "addObserver:forKeyPath:options:context:", self, CFSTR("primaryCellularInterface"), 5, 0);

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
        objc_msgSend(v45, "addObserver:forKeyPath:options:context:", self, CFSTR("primaryPhysicalInterface"), 5, 0);

        self->_watchingFallbackNotifications = 1;
      }
    }
    else if (self->_watchingFallbackNotifications)
    {
      sub_10008C2B8((uint64_t)self, a2);
    }
  }
  v46 = sub_10008C444(self, a2);
  v48 = ne_log_obj(v46, v47);
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(handler) = 138412290;
    *(_QWORD *)((char *)&handler + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%@: Updating policies and agent on install", (uint8_t *)&handler, 0xCu);
  }

  sub_100088278(self, 1, 1);
  if (self)
    Property = objc_getProperty(self, v50, 368, 1);
  else
    Property = 0;
  if ((objc_msgSend(Property, "hasNonDefaultRules") & 1) != 0
    || ne_session_fallback_advisory())
  {
    -[NESMSession setStatus:](self, "setStatus:", 3);
  }
  -[NESMSession sendConfigurationChangeHandledNotification](self, "sendConfigurationChangeHandledNotification");
}

- (void)uninstall
{
  const char *v3;
  void *v4;

  sub_10008C1D4(self, a2);
  if (self && self->_watchingFallbackNotifications)
    sub_10008C2B8((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002C3A4((uint64_t)v4);

  -[NESMSession setStatus:](self, "setStatus:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[NESMPathControllerSession uninstall](self, "uninstall");
  v3.receiver = self;
  v3.super_class = (Class)NESMPathControllerSession;
  -[NESMSession dealloc](&v3, "dealloc");
}

- (void)handleChangeEventForFallbackInterfaces:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008BF18;
  v7[3] = &unk_1000BEB58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  id Property;
  id v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  int v21;
  uint64_t v22;
  id v23;
  int v24;
  unsigned __int8 v25;
  const char *v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NESMPathControllerSession *v45;
  void *v46;
  unsigned __int8 v47;
  const char *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  char **v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  SEL v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  int v65;
  id v66;
  unsigned __int8 v67;
  id v68;
  void *v69;
  NESMPathControllerSession *v70;
  SEL v71;
  id v72;
  void *v73;
  SEL v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  id v78;
  id v79;
  char **v80;
  void *v81;
  unsigned int v82;
  id v83;
  const char *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  SEL v93;
  BOOL v94;
  id v95;
  const char *v96;
  void *v97;
  int v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  __CFString *v103;
  __CFString *v104;
  uint64_t v105;
  NSObject *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  SEL v112;
  uint64_t v113;
  NSObject *v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  SEL v120;
  id v121;
  SEL v122;
  id v123;
  const char *v124;
  void *v125;
  id v126;
  const char *v127;
  void *v128;
  id v129;
  void *v130;
  id v131;
  id v132;
  id v133;
  char v134;
  uint64_t v135;
  void *i;
  void *v137;
  void *v138;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  const char *v143;
  const char *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  void *v149;
  uint64_t v150;
  NSObject *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  NSObject *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  NSObject *v171;
  int v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  uint64_t v176;
  NSObject *v177;
  uint64_t v178;
  int v179;
  SEL v180;
  unsigned int v181;
  NSObject *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  NSObject *v186;
  NESMPathControllerSession *v187;
  NESMPathControllerSession *v188;
  NESMPathControllerSession *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  int v195;
  int v196;
  void *v197;
  id v198;
  int v199;
  id v200;
  id v201;
  void *v202;
  void *v203;
  int v204;
  void *v205;
  id v206;
  id v207;
  int v208;
  int v209;
  _QWORD block[5];
  int v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  uint8_t v216[4];
  NESMPathControllerSession *v217;
  uint8_t buf[4];
  _BYTE v219[10];
  uint64_t v220;
  __int16 v221;
  int v222;
  __int16 v223;
  unsigned int v224;

  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (self)
    Property = objc_getProperty(self, v11, 392, 1);
  else
    Property = 0;
  v14 = Property;
  if (v14 != v10)
  {

LABEL_8:
    v21 = 0;
    goto LABEL_9;
  }
  v15 = objc_msgSend(v9, "isEqualToString:", CFSTR("status"));

  if (!v15)
    goto LABEL_8;
  v18 = ne_log_obj(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    if (self)
      v101 = objc_getProperty(self, v20, 392, 1);
    else
      v101 = 0;
    v102 = objc_msgSend(v101, "status");
    v103 = CFSTR("Invalid");
    if (v102 == (id)2)
      v103 = CFSTR("Not Available");
    if (v102 == (id)1)
      v103 = CFSTR("Available");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v219 = v103;
    v104 = v103;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Roaming status changed to %@", buf, 0xCu);

  }
  v21 = 1;
LABEL_9:
  v22 = objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  if ((id)v22 == v10)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("primaryCellularInterface")) & 1) != 0)
    {

    }
    else
    {
      v25 = objc_msgSend(v9, "isEqualToString:", CFSTR("primaryPhysicalInterface"));

      if ((v25 & 1) == 0)
      {
        v24 = 0;
        goto LABEL_72;
      }
    }
    v27 = objc_msgSend(v9, "isEqualToString:", CFSTR("primaryCellularInterface"));
    v28 = (int)v27;
    v30 = ne_log_obj(v27, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
    if (v28)
    {
      if (!v32)
        goto LABEL_18;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "primaryCellularInterface"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v219 = v35;
      v36 = "Primary cellular interface changed to %@";
    }
    else
    {
      if (!v32)
        goto LABEL_18;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "primaryPhysicalInterface"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v219 = v35;
      v36 = "Primary physical interface changed to %@";
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);

    v12 = v34;
LABEL_18:
    v208 = v21;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "primaryCellularInterface"));
    v206 = v12;
    if (v38)
    {
      v39 = (void *)v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "primaryCellularInterface"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "interfaceName"));
      v201 = v9;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      v198 = v10;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "primaryPhysicalInterface"));
      v45 = self;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "interfaceName"));
      v47 = objc_msgSend(v42, "isEqualToString:", v46);

      self = v45;
      v10 = v198;

      v9 = v201;
      v12 = v206;

      if ((v47 & 1) == 0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v45, "server"));
        v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "primaryCellularInterface"));

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v45, "server"));
        v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "primaryPhysicalInterface"));

        if (v23)
        {
          if (v45)
          {
            v53 = &selRef_sharedConnection;
            v24 = 1;
            v54 = objc_getProperty(self, v48, 432, 1);
            v21 = v208;
            if (v54)
            {
              v55 = v54;
              v204 = 0;
              goto LABEL_32;
            }
LABEL_26:
            v56 = objc_getProperty(self, v48, *((int *)v53 + 560), 1);
            if (v23 != v56)
            {

              if ((v24 & 1) != 0)
              {
LABEL_65:
                if (!objc_getProperty(self, v48, *((int *)v53 + 560), 1))
                  v21 = 1;
                goto LABEL_67;
              }
LABEL_59:
              v21 = 1;
LABEL_67:
              objc_setProperty_atomic(self, v48, v23, *((int *)v53 + 560));
              objc_setProperty_atomic(self, v74, v51, 440);
LABEL_68:
              v75 = ne_log_obj(v52, v48);
              v76 = objc_claimAutoreleasedReturnValue(v75);
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
              {
                if (self)
                  v95 = objc_getProperty(self, v77, *((int *)v53 + 560), 1);
                else
                  v95 = 0;
                v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "interfaceName"));
                v98 = v21;
                if (self)
                  v99 = objc_getProperty(self, v96, 440, 1);
                else
                  v99 = 0;
                v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "interfaceName"));
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v219 = v97;
                *(_WORD *)&v219[8] = 2112;
                v220 = (uint64_t)v100;
                _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Fallback interface set to %@ from %@", buf, 0x16u);

                v21 = v98;
              }

              v24 = 1;
              goto LABEL_70;
            }
            v55 = 0;
            if (!v24)
            {
              LOBYTE(v204) = 1;
              v199 = 0;
              v196 = 0;
              goto LABEL_42;
            }
            v204 = 1;
LABEL_32:
            v57 = objc_getProperty(self, v48, *((int *)v53 + 560), 1);
            if (v57)
            {
              v202 = v55;
              v194 = v57;
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "interfaceName"));
              v60 = objc_getProperty(self, v59, *((int *)v53 + 560), 1);
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "interfaceName"));
              if (objc_msgSend(v58, "isEqualToString:", v61))
              {

                if (v204)
                v12 = v206;
                goto LABEL_65;
              }
              v191 = v61;
              v192 = v60;
              v193 = v58;
              v199 = 1;
              v196 = 1;
              v12 = v206;
              v55 = v202;
            }
            else
            {
              v199 = 1;
              v194 = 0;
              v196 = 0;
              v12 = v206;
            }
LABEL_42:
            v203 = v55;
            if (v51)
            {
              v62 = objc_getProperty(self, v48, 440, 1);
              if (v62)
              {
                v63 = v62;
                v64 = v9;
                v65 = 0;
                goto LABEL_50;
              }
            }
            v66 = objc_getProperty(self, v48, 440, 1);
            v67 = v51 != v66;
            if (v51 == v66)
            {
              if (v51)
              {
                v64 = v9;
                v63 = 0;
                v65 = 1;
LABEL_50:
                v68 = v10;
                if (objc_getProperty(self, v48, 440, 1))
                {
                  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "interfaceName"));
                  v70 = self;
                  v72 = objc_msgSend(objc_getProperty(self, v71, 440, 1), "interfaceName");
                  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
                  v67 = objc_msgSend(v69, "isEqualToString:", v73);

                  v21 = v208;
                  if (!v65)
                  {
LABEL_53:
                    v9 = v64;
                    self = v70;
                    v10 = v68;
                    v12 = v206;
                    v53 = &selRef_sharedConnection;
LABEL_54:

                    if ((v196 & 1) != 0)
                      goto LABEL_55;
                    goto LABEL_61;
                  }
                }
                else
                {
                  v70 = self;
                  v67 = 0;
                  if (!v65)
                    goto LABEL_53;
                }

                goto LABEL_53;
              }
            }
            else
            {

              if (v51)
              {
                v63 = 0;
                v67 = 1;
                goto LABEL_54;
              }
            }
            v51 = 0;
            if (v196)
            {
LABEL_55:

              if ((v199 & 1) == 0)
                goto LABEL_56;
              goto LABEL_62;
            }
LABEL_61:
            if (!v199)
            {
LABEL_56:
              if ((v204 & 1) != 0)

              if ((v67 & 1) != 0)
                goto LABEL_59;
              goto LABEL_90;
            }
LABEL_62:

            if ((v204 & 1) != 0)
            if ((v67 & 1) != 0)
              goto LABEL_65;
LABEL_90:
            v24 = 0;
LABEL_70:

            goto LABEL_71;
          }
          v21 = 1;
        }
        else
        {
          v23 = 0;
          if (v45)
          {
            v24 = 0;
            v21 = v208;
            v53 = &selRef_sharedConnection;
            goto LABEL_26;
          }
          if (!v51)
          {
            v24 = 0;
            v51 = 0;
            v10 = v198;
            v9 = v201;
            self = 0;
            v12 = v206;
            v21 = v208;
            goto LABEL_70;
          }
          v21 = 1;
          v10 = v198;
          v9 = v201;
          self = 0;
          v12 = v206;
        }
        v53 = &selRef_sharedConnection;
        goto LABEL_68;
      }
    }
    else
    {

    }
    v51 = 0;
    v24 = 0;
    v23 = 0;
    v21 = v208;
    v53 = &selRef_sharedConnection;
    if (!self)
    {
      v23 = 0;
      goto LABEL_70;
    }
    goto LABEL_26;
  }
  v23 = (id)v22;
  v24 = 0;
LABEL_71:

LABEL_72:
  if (self)
    v78 = objc_getProperty(self, v26, 512, 1);
  else
    v78 = 0;
  v79 = v78;
  v80 = &selRef_sharedConnection;
  if (v79 == v10)
  {
    v82 = objc_msgSend(v9, "isEqualToString:", CFSTR("considerAlternateUpdate"));

    if (!v82)
      goto LABEL_165;
    if (self)
      v85 = objc_getProperty(self, v84, 512, 1);
    else
      v85 = 0;
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "considerAlternateUpdate"));
    v87 = ne_log_obj(v81, v86);
    v88 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v219 = v81;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Consider alternate update, new advice: %@", buf, 0xCu);
    }

    v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "applications"));
    v89 = objc_msgSend(v81, "level");
    v197 = v81;
    if (self)
    {
      if ((id)self->_level == v89)
        goto LABEL_120;
      self->_level = (int64_t)v89;
      if (v89 == (id)2)
      {
        if (self->_fallbackEnabled)
        {
          if (!self->_weakFallback)
          {
LABEL_120:
            v195 = v24;
            v121 = v205;
            v123 = objc_getProperty(self, v122, 504, 1);
            if (v123)
            {
              v125 = v123;
              v126 = objc_getProperty(self, v124, 512, 1);
              if (v126)
              {
                v128 = v126;
                v209 = v21;
                v129 = objc_getProperty(self, v127, 472, 1);

                if (v129)
                {
                  v200 = v10;
                  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
                  v212 = 0u;
                  v213 = 0u;
                  v214 = 0u;
                  v215 = 0u;
                  v131 = v121;
                  v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v212, buf, 16);
                  if (v132)
                  {
                    v133 = v132;
                    v207 = v12;
                    v134 = 0;
                    v135 = *(_QWORD *)v213;
                    do
                    {
                      for (i = 0; i != v133; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v213 != v135)
                          objc_enumerationMutation(v131);
                        v137 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * (_QWORD)i);
                        v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "bundleIdentifier"));
                        if (v138)
                        {
                          objc_msgSend(v130, "addObject:", v138);
                          if (objc_msgSend(v137, "state") == (id)2
                            && (objc_msgSend(objc_getProperty(self, v139, 456, 1), "containsObject:", v138) & 1) == 0)
                          {
                            v134 = 1;
                            objc_msgSend(objc_getProperty(self, v140, 456, 1), "addObject:", v138);
                          }
                          else if (objc_msgSend(v137, "state") == (id)1
                                 && objc_msgSend(objc_getProperty(self, v141, 456, 1), "containsObject:", v138))
                          {
                            v134 = 1;
                            objc_msgSend(objc_getProperty(self, v142, 456, 1), "removeObject:", v138);
                          }
                          if (objc_msgSend(v137, "state") == (id)1
                            && (objc_msgSend(objc_getProperty(self, v143, 464, 1), "containsObject:", v138) & 1) == 0)
                          {
                            v134 = 1;
                            objc_msgSend(objc_getProperty(self, v144, 464, 1), "addObject:", v138);
                          }
                          else if (objc_msgSend(v137, "state") == (id)2
                                 && objc_msgSend(objc_getProperty(self, v145, 464, 1), "containsObject:", v138))
                          {
                            v134 = 1;
                            objc_msgSend(objc_getProperty(self, v146, 464, 1), "removeObject:", v138);
                          }
                        }

                      }
                      v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v212, buf, 16);
                    }
                    while (v133);

                    v81 = v197;
                    v10 = v200;
                    v12 = v207;
                    v24 = v195;
                    v149 = v130;
                    if ((v134 & 1) != 0)
                    {
                      v150 = ne_log_obj(v147, v148);
                      v151 = objc_claimAutoreleasedReturnValue(v150);
                      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
                      {
                        v188 = (NESMPathControllerSession *)objc_getProperty(self, v152, 456, 1);
                        *(_DWORD *)v216 = 138412290;
                        v217 = v188;
                        _os_log_debug_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEBUG, "Foreground apps changed to %@", v216, 0xCu);
                      }

                      v155 = ne_log_obj(v153, v154);
                      v156 = objc_claimAutoreleasedReturnValue(v155);
                      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
                      {
                        v189 = (NESMPathControllerSession *)objc_getProperty(self, v157, 464, 1);
                        *(_DWORD *)v216 = 138412290;
                        v217 = v189;
                        _os_log_debug_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEBUG, "Background running apps changed to %@", v216, 0xCu);
                      }

                      v160 = ne_log_obj(v158, v159);
                      v161 = objc_claimAutoreleasedReturnValue(v160);
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v216 = 138412290;
                        v217 = self;
                        _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, "%@: Updating policies on app state change", v216, 0xCu);
                      }

                      sub_100088278(self, 1, 0);
                      v81 = v197;
                    }
                  }
                  else
                  {

                    v10 = v200;
                    v24 = v195;
                    v149 = v130;
                  }
                  v21 = v209;
                  v80 = &selRef_sharedConnection;
                  if ((objc_msgSend(objc_getProperty(self, v148, 472, 1), "isEqualToSet:", v149) & 1) == 0)
                  {
                    objc_setProperty_atomic(self, v162, v149, 472);
                    v165 = ne_log_obj(v163, v164);
                    v166 = objc_claimAutoreleasedReturnValue(v165);
                    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
                    {
                      v187 = (NESMPathControllerSession *)objc_getProperty(self, v167, 472, 1);
                      *(_DWORD *)v216 = 138412290;
                      v217 = v187;
                      _os_log_debug_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEBUG, "Fallback allowed apps changed to %@", v216, 0xCu);
                    }

                    v170 = ne_log_obj(v168, v169);
                    v171 = objc_claimAutoreleasedReturnValue(v170);
                    if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v216 = 138412290;
                      v217 = self;
                      _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEFAULT, "%@: Updating policies on fallback app change", v216, 0xCu);
                    }

                    sub_100088278(self, 1, 0);
                  }

                  goto LABEL_163;
                }
                v21 = v209;
              }
              else
              {

              }
              v24 = v195;
            }
LABEL_163:

            goto LABEL_164;
          }
        }
        else
        {
          v105 = ne_log_obj(2, v90);
          v106 = objc_claimAutoreleasedReturnValue(v105);
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Begin strong fallback advisory", buf, 2u);
          }

          v107 = objc_alloc((Class)NSString);
          v108 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
          v110 = objc_msgSend(v107, "initWithFormat:", CFSTR("com.apple.nesessionmanager.strongFallback.%@"), v109);

          v111 = (void *)os_transaction_create(objc_msgSend(v110, "UTF8String"));
          objc_setProperty_atomic(self, v112, v111, 424);

          v21 = 1;
        }
        v94 = 0;
        self->_fallbackEnabled = 1;
LABEL_119:
        self->_weakFallback = v94;
        v24 = 1;
        goto LABEL_120;
      }
      if (v89 == (id)1)
      {
        if (self->_fallbackEnabled)
        {
          if (self->_weakFallback)
          {
            v80 = &selRef_sharedConnection;
            goto LABEL_120;
          }
        }
        else
        {
          v113 = ne_log_obj(1, v90);
          v114 = objc_claimAutoreleasedReturnValue(v113);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Begin weak fallback advisory", buf, 2u);
          }

          v115 = objc_alloc((Class)NSString);
          v116 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "identifier"));
          v118 = objc_msgSend(v115, "initWithFormat:", CFSTR("com.apple.nesessionmanager.weakFallback.%@"), v117);

          v119 = (void *)os_transaction_create(objc_msgSend(v118, "UTF8String"));
          objc_setProperty_atomic(self, v120, v119, 424);

          v21 = 1;
        }
        v94 = 1;
        self->_fallbackEnabled = 1;
        v80 = &selRef_sharedConnection;
        goto LABEL_119;
      }
      if (v89)
        goto LABEL_120;
    }
    else if (!v89)
    {
      v190 = v205;
      goto LABEL_163;
    }
    if (!self->_fallbackEnabled)
      goto LABEL_120;
    v91 = ne_log_obj(v89, v90);
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "End fallback advisory", buf, 2u);
    }

    objc_setProperty_atomic(self, v93, 0, 424);
    v94 = 0;
    self->_fallbackEnabled = 0;
    v21 = 1;
    goto LABEL_119;
  }
  v81 = v79;
LABEL_164:

LABEL_165:
  v172 = v24;
  v173 = *((int *)v80 + 558);
  v174 = 3;
  if (!*((_BYTE *)&self->super.super.isa + v173))
  {
    v83 = objc_msgSend(objc_getProperty(self, v84, 368, 1), "hasNonDefaultRules");
    if ((_DWORD)v83)
      v174 = 3;
    else
      v174 = 1;
  }
  v175 = v21;
  v176 = ne_log_obj(v83, v84);
  v177 = objc_claimAutoreleasedReturnValue(v176);
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    v178 = ne_session_status_to_string(v174);
    v179 = *((unsigned __int8 *)&self->super.super.isa + v173);
    v181 = objc_msgSend(objc_getProperty(self, v180, 368, 1), "hasNonDefaultRules");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v219 = self;
    *(_WORD *)&v219[8] = 2080;
    v220 = v178;
    v221 = 1024;
    v222 = v179;
    v223 = 1024;
    v224 = v181;
    _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "Will update session %@ status to %s (fallback %u non-default %u)", buf, 0x22u);
  }

  v182 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BE4C;
  block[3] = &unk_1000BECF8;
  block[4] = self;
  v211 = v174;
  dispatch_async(v182, block);

  if ((v172 | v175) == 1)
  {
    v185 = ne_log_obj(v183, v184);
    v186 = objc_claimAutoreleasedReturnValue(v185);
    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v219 = v175;
      *(_WORD *)&v219[4] = 1024;
      *(_DWORD *)&v219[6] = v172;
      _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_DEFAULT, "Updating on KVO change, policies=%d, agent=%d", buf, 0xEu);
    }

    sub_100088278(self, v175, v172);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiNOI, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_localResolverAddresses, 0);
  objc_storeStrong((id *)&self->_fallbackNotificationTimer, 0);
  objc_storeStrong((id *)&self->_fallbackAssertions, 0);
  objc_storeStrong((id *)&self->_fallbackAllowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_backgroundBundleIDs, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIDs, 0);
  objc_storeStrong((id *)&self->_fallbackInterfacesDict, 0);
  objc_storeStrong((id *)&self->_primaryFallbackFromInterface, 0);
  objc_storeStrong((id *)&self->_primaryFallbackInterface, 0);
  objc_storeStrong((id *)&self->_fallbackTransaction, 0);
  objc_storeStrong((id *)&self->_roamingMonitorTransaction, 0);
  objc_storeStrong((id *)&self->_currentMatchedSSID, 0);
  objc_storeStrong((id *)&self->_ssidWatchers, 0);
  objc_storeStrong((id *)&self->_roamingMonitor, 0);
  objc_storeStrong((id *)&self->_rulePolicies, 0);
  objc_storeStrong((id *)&self->_ruleMonitors, 0);
  objc_storeStrong((id *)&self->_controllerConfiguration, 0);
}

@end
