@implementation NESMDNSSettingsSession

- (NESMDNSSettingsSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6;
  NESMDNSSettingsSession *v7;
  uint64_t v8;
  NESMDNSSettingsSession *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NEDNSSettings *settings;
  void *v17;
  uint64_t v18;
  NSArray *onDemandRules;
  NESMPolicySession *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  NESMDNSSettingsSession *v25;
  uint64_t v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  NESMDNSSettingsSession *v31;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NESMDNSSettingsSession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v29, "initWithConfiguration:andServer:", v6, a4);
  v9 = v7;
  if (!v7)
  {
LABEL_6:
    v23 = ne_log_obj(v7, v8);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ initialized DNS settings session", buf, 0xCu);
    }

    v25 = v9;
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dnsSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "settings"));

  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dnsSettings"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "settings"));
    settings = v9->_settings;
    v9->_settings = (NEDNSSettings *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dnsSettings"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "onDemandRules"));
    onDemandRules = v9->_onDemandRules;
    v9->_onDemandRules = (NSArray *)v18;

    v9->_MCNotifyToken = -1;
    sub_10007DD74((int *)v9, v6);
    v20 = [NESMPolicySession alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v22 = objc_msgSend(v6, "grade");
    if (v20)
      v20 = (NESMPolicySession *)sub_10002EB54((id *)&v20->super.isa, v21, 7, v22, (void *)1, (void *)1);
    -[NESMSession setPolicySession:](v9, "setPolicySession:", v20);

    sub_10007AAF8(v9);
    goto LABEL_6;
  }
  v26 = ne_log_obj(v12, v13);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@ settings is nil", buf, 0xCu);
  }

  v25 = 0;
LABEL_12:

  return v25;
}

- (int)type
{
  return 7;
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return !a3 || (a3 & 0xFFFFFFFD) == 1;
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
  const char *v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  id v26;
  const char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  const char *v36;
  id v37;
  void *v38;
  id v39;
  const char *v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  id v46;
  unsigned int v47;
  const char *v48;
  int v49;
  SEL v50;
  void *v51;
  int v52;
  NESMDNSSettingsSession *v53;
  char v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  NESMDNSSettingsSession *v63;
  __int16 v64;
  id v65;

  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (self)
    Property = objc_getProperty(self, v11, 384, 1);
  else
    Property = 0;
  v14 = Property;
  if (v14 == v10)
  {
    v15 = objc_msgSend(v9, "isEqualToString:", CFSTR("bestAvailableNetworkDescription"));

    if (!v15)
      goto LABEL_59;
    v17 = objc_alloc_init((Class)NEOnDemandRuleConnect);
    if (self)
      v18 = objc_getProperty(self, v16, 384, 1);
    else
      v18 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bestAvailableNetworkDescription"));
    if (v20)
    {
      if (self)
        v21 = objc_getProperty(self, v19, 384, 1);
      else
        v21 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "networkDescriptionArray"));
      v23 = objc_msgSend(v22, "indexOfObject:", v20);

      if (self)
        v25 = objc_getProperty(self, v24, 368, 1);
      else
        v25 = 0;
      v26 = objc_msgSend(v25, "count");
      if (v26 > v23)
      {
        if (self)
          v28 = objc_getProperty(self, v27, 368, 1);
        else
          v28 = 0;
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndex:", v23));

        v17 = (id)v29;
      }
      v30 = ne_log_obj(v26, v27);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        if (objc_msgSend(v17, "action") == (id)3)
        {
          v55 = v20;
          v37 = objc_alloc_init((Class)NSMutableArray);
          v56 = v17;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectionRules"));
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          if (v39)
          {
            v41 = v39;
            v42 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v41; i = (char *)i + 1)
              {
                if (*(_QWORD *)v58 != v42)
                  objc_enumerationMutation(v38);
                v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v44, "action", v55) == (id)2)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "matchDomains"));
                  objc_msgSend(v37, "addObjectsFromArray:", v45);

                }
              }
              v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
            }
            while (v41);
          }
          if (self)
            v46 = objc_getProperty(self, v40, 376, 1);
          else
            v46 = 0;
          v20 = v55;
          v17 = v56;
          v47 = objc_msgSend(v37, "isEqual:", v46, v55);
          v49 = v47 ^ 1;
          if (self && (v47 & 1) == 0)
            objc_setProperty_atomic(self, v48, v37, 376);

        }
        else if (self)
        {
          v49 = objc_getProperty(self, v36, 376, 1) != 0;
          objc_setProperty_atomic(self, v50, 0, 376);
        }
        else
        {
          v49 = 0;
        }
        if (-[NESMSession status](self, "status") != 1
          && (objc_msgSend(v17, "action") == (id)2 || objc_msgSend(v17, "action") == (id)4))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          objc_msgSend(v51, "requestUninstallForSession:", self);
        }
        else
        {
          if (-[NESMSession status](self, "status") == 3
            || objc_msgSend(v17, "action") != (id)1 && objc_msgSend(v17, "action") != (id)3)
          {
            if (-[NESMSession status](self, "status") == 3)
              v52 = v49;
            else
              v52 = 0;
            if (v52 == 1)
            {
              v53 = self;
              v54 = 0;
            }
            else
            {
              if (!self || !self->_configurationUpdatePending)
                goto LABEL_58;
              self->_configurationUpdatePending = 0;
              v53 = self;
              v54 = 1;
            }
            sub_10007D938(v53, v54);
LABEL_58:

            goto LABEL_59;
          }
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          objc_msgSend(v51, "requestInstallForSession:withParentSession:exclusive:", self, 0, 0);
        }

        goto LABEL_58;
      }
      *(_DWORD *)buf = 138412546;
      v63 = self;
      v64 = 2112;
      v65 = v17;
      v32 = "%@ Matched DNS On Demand rule %@";
      v33 = v31;
      v34 = 22;
    }
    else
    {
      v35 = ne_log_obj(0, v19);
      v31 = objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v63 = self;
      v32 = "%@ Matched no DNS On Demand rule";
      v33 = v31;
      v34 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    goto LABEL_22;
  }

LABEL_59:
}

- (void)handleStartMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  objc_super v9;
  uint8_t buf[4];
  NESMDNSSettingsSession *v11;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ handling start for DNS settings session", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)NESMDNSSettingsSession;
  -[NESMSession handleStartMessage:](&v9, "handleStartMessage:", v4);

  sub_10007E56C(self, v8);
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  NESMDNSSettingsSession *v10;

  v3 = *(_QWORD *)&a3;
  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ handling stop for DNS settings session", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)NESMDNSSettingsSession;
  -[NESMSession handleStopMessageWithReason:](&v8, "handleStopMessageWithReason:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  objc_msgSend(v7, "requestUninstallForSession:", self);

}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  if (v4
    && (v15.receiver = self,
        v15.super_class = (Class)NESMDNSSettingsSession,
        -[NESMSession handleUpdateConfiguration:](&v15, "handleUpdateConfiguration:", v4)))
  {
    if (self)
      self->_configurationUpdatePending = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dnsSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settings"));
    if (self)
      objc_setProperty_atomic(self, v6, v7, 360);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dnsSettings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "onDemandRules"));
    v11 = v9;
    if (self)
    {
      objc_setProperty_atomic(self, v10, v9, 368);

      sub_10007DD74((int *)self, v4);
      sub_10007E56C(self, v12);
    }
    else
    {

      sub_10007DD74(0, v4);
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[9];

  if (a3 == 1)
  {
    block[7] = v3;
    block[8] = v4;
    v6 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007DC9C;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)install
{
  uint64_t v3;
  NSObject *v4;
  id Property;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  NESMDNSSettingsSession *v10;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ installing DNS settings session", (uint8_t *)&v9, 0xCu);
  }

  sub_10007D938(self, 1);
  if (self && (Property = objc_getProperty(self, v6, 360, 1)) != 0)
  {
    -[NESMSession setStatus:](self, "setStatus:", 3);
  }
  else
  {
    v7 = ne_log_obj(Property, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ settings is not, not moving to connected", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)uninstall
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  const char *v9;
  int v10;
  NESMDNSSettingsSession *v11;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ uninstalling DNS settings session", (uint8_t *)&v10, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002C404((uint64_t)v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dnsSettings"));
  v8 = objc_msgSend(v7, "isEnabled");

  if ((v8 & 1) == 0)
    sub_10007D820(self, v9);
  -[NESMSession setStatus:](self, "setStatus:", 1);
}

- (void)dealloc
{
  int MCNotifyToken;
  objc_super v4;

  MCNotifyToken = self->_MCNotifyToken;
  if ((MCNotifyToken & 0x80000000) == 0)
  {
    notify_cancel(MCNotifyToken);
    self->_MCNotifyToken = -1;
  }
  sub_10007D820(self, a2);
  -[NESMDNSSettingsSession uninstall](self, "uninstall");
  v4.receiver = self;
  v4.super_class = (Class)NESMDNSSettingsSession;
  -[NESMSession dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_dnsOnDemandMonitor, 0);
  objc_storeStrong((id *)&self->_exceptionDomains, 0);
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (BOOL)hasRequiredFrameworks
{
  return objc_opt_class(MCProfileConnection) != 0;
}

@end
