@implementation NSPConfigurationManager

- (void)resetConfigurationManager
{
  NSPConfigurationManager *v2;
  NSPConfiguration *configuration;
  NSPConfiguration *v4;
  NSPConfiguration *v5;
  void *v6;
  NSPConfiguration *v7;
  void *v8;
  NSPConfiguration *v9;
  void *v10;
  NSPConfiguration *v11;
  void *v12;
  NSPConfiguration *v13;
  void *v14;
  NSPConfiguration *v15;
  void *v16;
  NSPConfiguration *v17;
  void *v18;
  NSPConfiguration *v19;
  void *v20;
  NSPConfiguration *v21;
  void *v22;
  NSPConfiguration *v23;
  uint64_t v24;
  uint64_t v25;
  NSPConfiguration *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v2 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v30 = (id)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus"));
  if (v2)
    configuration = v2->_configuration;
  else
    configuration = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](configuration, "geohashOverride"));
  if (v2)
    v4 = v2->_configuration;
  else
    v4 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration preferredPathRoutingEnabledStatus](v4, "preferredPathRoutingEnabledStatus"));
  if (v2)
    v5 = v2->_configuration;
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensEnabledStatus](v5, "privateAccessTokensEnabledStatus"));
  if (v2)
    v7 = v2->_configuration;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensAllowTools](v7, "privateAccessTokensAllowTools"));
  if (v2)
    v9 = v2->_configuration;
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration inProcessFlowDivert](v9, "inProcessFlowDivert"));
  if (v2)
    v11 = v2->_configuration;
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v11, "proxyTrafficState"));
  if (v2)
    v13 = v2->_configuration;
  else
    v13 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v13, "userTier"));
  if (v2)
    v15 = v2->_configuration;
  else
    v15 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v15, "proxyAccountType"));
  if (v2)
    v17 = v2->_configuration;
  else
    v17 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v17, "proxyAccountUnlimited"));
  if (v2)
    v19 = v2->_configuration;
  else
    v19 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](v19, "userPreferredTier"));
  if (v2)
    v21 = v2->_configuration;
  else
    v21 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration subscriberEnabledFromNonSettingsApp](v21, "subscriberEnabledFromNonSettingsApp"));
  if (v2)
    v23 = v2->_configuration;
  else
    v23 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration lastPrivateCloudComputeEnvironment](v23, "lastPrivateCloudComputeEnvironment"));
  sub_1000854A0((uint64_t)v2, v24, v25);
  if (v2)
  {
    -[NSPConfiguration setGeohashSharingEnabledStatus:](v2->_configuration, "setGeohashSharingEnabledStatus:", v30);
    -[NSPConfiguration setGeohashOverride:](v2->_configuration, "setGeohashOverride:", v29);
    -[NSPConfiguration setPreferredPathRoutingEnabledStatus:](v2->_configuration, "setPreferredPathRoutingEnabledStatus:", v28);
    -[NSPConfiguration setPrivateAccessTokensEnabledStatus:](v2->_configuration, "setPrivateAccessTokensEnabledStatus:", v6);
    -[NSPConfiguration setPrivateAccessTokensAllowTools:](v2->_configuration, "setPrivateAccessTokensAllowTools:", v8);
    -[NSPConfiguration setInProcessFlowDivert:](v2->_configuration, "setInProcessFlowDivert:", v10);
    -[NSPConfiguration setProxyTrafficState:](v2->_configuration, "setProxyTrafficState:", v12);
    -[NSPConfiguration setUserTier:](v2->_configuration, "setUserTier:", v14);
    -[NSPConfiguration setProxyAccountType:](v2->_configuration, "setProxyAccountType:", v16);
    -[NSPConfiguration setProxyAccountUnlimited:](v2->_configuration, "setProxyAccountUnlimited:", v18);
    -[NSPConfiguration setUserPreferredTier:](v2->_configuration, "setUserPreferredTier:", v20);
    -[NSPConfiguration setSubscriberEnabledFromNonSettingsApp:](v2->_configuration, "setSubscriberEnabledFromNonSettingsApp:", v22);
    v26 = v2->_configuration;
  }
  else
  {
    objc_msgSend(0, "setGeohashSharingEnabledStatus:", v30);
    objc_msgSend(0, "setGeohashOverride:", v29);
    objc_msgSend(0, "setPreferredPathRoutingEnabledStatus:", v28);
    objc_msgSend(0, "setPrivateAccessTokensEnabledStatus:", v6);
    objc_msgSend(0, "setPrivateAccessTokensAllowTools:", v8);
    objc_msgSend(0, "setInProcessFlowDivert:", v10);
    objc_msgSend(0, "setProxyTrafficState:", v12);
    objc_msgSend(0, "setUserTier:", v14);
    objc_msgSend(0, "setProxyAccountType:", v16);
    objc_msgSend(0, "setProxyAccountUnlimited:", v18);
    objc_msgSend(0, "setUserPreferredTier:", v20);
    objc_msgSend(0, "setSubscriberEnabledFromNonSettingsApp:", v22);
    v26 = 0;
  }
  -[NSPConfiguration setLastPrivateCloudComputeEnvironment:](v26, "setLastPrivateCloudComputeEnvironment:", v27);
  sub_10008586C((uint64_t)v2);

}

- (BOOL)policyIncludesUnlimited
{
  NSPConfigurationManager *v2;
  void *v3;
  unsigned int v4;
  char v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  NSPConfiguration *configuration;
  NSPConfiguration *v11;
  void *v12;
  NSPConfiguration *v13;
  NSPConfiguration *v14;
  void *v15;
  NSPConfiguration *v16;
  void *v17;
  unsigned __int8 v18;

  v2 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyTrafficState](self, "proxyTrafficState"));
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  if ((v4 & 0x20000) == 0)
    return 0;
  v6 = sub_100086F0C((id *)&v2->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_100086CFC(v2, v7);
  v9 = v8;
  if (v8 && objc_msgSend(v8, "containsObject:", &off_1000FF530))
  {
    if (v2)
      configuration = v2->_configuration;
    else
      configuration = 0;
    v11 = configuration;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v11, "proxyAccountUnlimited"));
    if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      if (v2)
        v13 = v2->_configuration;
      else
        v13 = 0;
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v14, "cloudSubscriptionCheckEnabled"));
      if (v15)
      {
        if (v2)
          v16 = v2->_configuration;
        else
          v16 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v16, "cloudSubscriptionCheckEnabled"));
        v18 = objc_msgSend(v17, "BOOLValue");

        v5 = v18 ^ 1;
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mergeProxyTrafficStateWithCurrentPolicy
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSPConfiguration *configuration;
  NSPConfiguration *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSPConfiguration *v18;
  NSPConfiguration *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSPConfiguration *v28;
  NSPConfiguration *v29;
  uint64_t v30;
  void *v31;
  NSPConfiguration *v32;
  NSPConfiguration *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  NSPConfiguration *v40;
  NSPConfiguration *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSPConfiguration *v49;
  NSPConfiguration *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *i;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  NSPConfigurationManager *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;

  v4 = nplog_obj(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Merging current policy with proxy traffic state", buf, 2u);
  }

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v7 = configuration;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v7, "proxyTrafficState"));

  if (v8)
  {
    v12 = sub_100086F0C((id *)&self->super.isa);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = sub_100086CFC(self, v13);
    v17 = v14;
    if (!v14)
    {
      v26 = nplog_obj(0, v15, v16);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v73 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@ failed to find conditions in the current policy", buf, 0xCu);
      }
      v25 = 0;
      goto LABEL_125;
    }
    if (!objc_msgSend(v14, "containsObject:", &off_1000FF530))
    {
LABEL_31:
      if (self)
        v40 = self->_configuration;
      else
        v40 = 0;
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v41, "proxyTrafficState"));
      v43 = objc_msgSend(v42, "unsignedLongLongValue");

      v47 = nplog_obj(v44, v45, v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        if (self)
          v49 = self->_configuration;
        else
          v49 = 0;
        v50 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v50, "proxyTrafficState"));
        v52 = (id)objc_claimAutoreleasedReturnValue(+[NSPConfiguration proxyTrafficStateToString:](NSPConfiguration, "proxyTrafficStateToString:", v51));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v13, "description"));
        *(_DWORD *)buf = 138412802;
        v73 = self;
        v74 = 2112;
        v75 = v52;
        v76 = 2112;
        v77 = v53;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@ merging proxy traffic state [%@] with current proxy policy [%@]", buf, 0x20u);

      }
      if ((v43 & 1) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF548))
        objc_msgSend(v17, "removeObject:", &off_1000FF548);
      if ((v43 & 2) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF560))
        objc_msgSend(v17, "removeObject:", &off_1000FF560);
      if ((v43 & 4) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF578))
        objc_msgSend(v17, "removeObject:", &off_1000FF578);
      if ((v43 & 8) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF590))
        objc_msgSend(v17, "removeObject:", &off_1000FF590);
      if ((v43 & 0x10) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF5A8))
        objc_msgSend(v17, "removeObject:", &off_1000FF5A8);
      if ((v43 & 0x40000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF5C0))
        objc_msgSend(v17, "removeObject:", &off_1000FF5C0);
      if ((v43 & 0x80000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF5D8))
        objc_msgSend(v17, "removeObject:", &off_1000FF5D8);
      if ((v43 & 0x100000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF5F0))
        objc_msgSend(v17, "removeObject:", &off_1000FF5F0);
      if ((v43 & 0x200000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF608))
        objc_msgSend(v17, "removeObject:", &off_1000FF608);
      if ((v43 & 0x20) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF620))
        objc_msgSend(v17, "removeObject:", &off_1000FF620);
      if ((v43 & 0x40) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF638))
        objc_msgSend(v17, "removeObject:", &off_1000FF638);
      if ((v43 & 0x80) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF650))
        objc_msgSend(v17, "removeObject:", &off_1000FF650);
      if ((v43 & 0x100) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF668))
        objc_msgSend(v17, "removeObject:", &off_1000FF668);
      if ((v43 & 0x200) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF680))
        objc_msgSend(v17, "removeObject:", &off_1000FF680);
      if ((v43 & 0x400) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF698))
        objc_msgSend(v17, "removeObject:", &off_1000FF698);
      if ((v43 & 0x10000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF6B0))
        objc_msgSend(v17, "removeObject:", &off_1000FF6B0);
      if ((v43 & 0x800) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF6C8))
        objc_msgSend(v17, "removeObject:", &off_1000FF6C8);
      if ((v43 & 0x1000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF6E0))
        objc_msgSend(v17, "removeObject:", &off_1000FF6E0);
      if ((v43 & 0x2000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF6F8))
        objc_msgSend(v17, "removeObject:", &off_1000FF6F8);
      if ((v43 & 0x4000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF710))
        objc_msgSend(v17, "removeObject:", &off_1000FF710);
      if ((v43 & 0x8000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF728))
        objc_msgSend(v17, "removeObject:", &off_1000FF728);
      if ((v43 & 0x20000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF530))
        objc_msgSend(v17, "removeObject:", &off_1000FF530);
      if ((v43 & 0x400000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF740))
        objc_msgSend(v17, "removeObject:", &off_1000FF740);
      if ((v43 & 0x800000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF758))
        objc_msgSend(v17, "removeObject:", &off_1000FF758);
      if ((v43 & 0x1000000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF770))
        objc_msgSend(v17, "removeObject:", &off_1000FF770);
      if ((v43 & 0x2000000) == 0 && objc_msgSend(v17, "containsObject:", &off_1000FF788))
        objc_msgSend(v17, "removeObject:", &off_1000FF788);
      v54 = objc_alloc_init((Class)NSPPrivacyProxyPolicy);
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v55 = v17;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v57; i = (char *)i + 1)
          {
            if (*(_QWORD *)v68 != v58)
              objc_enumerationMutation(v55);
            objc_msgSend(v54, "addConditions:", objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "intValue", (_QWORD)v67));
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        }
        while (v57);
      }

      v63 = nplog_obj(v60, v61, v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "description"));
        *(_DWORD *)buf = 138412546;
        v73 = self;
        v74 = 2112;
        v75 = v65;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%@ merged privacy proxy policy: [%@]", buf, 0x16u);

      }
      v27 = v54;
      v25 = v27;
LABEL_125:

      goto LABEL_126;
    }
    if (self)
      v18 = self->_configuration;
    else
      v18 = 0;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v19, "proxyAccountUnlimited"));
    if (objc_msgSend(v20, "BOOLValue"))
    {

LABEL_24:
      v36 = nplog_obj(v21, v22, v23);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Allowed to use app condition", buf, 2u);
      }

      goto LABEL_31;
    }
    if (self)
      v28 = self->_configuration;
    else
      v28 = 0;
    v29 = v28;
    v30 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v29, "cloudSubscriptionCheckEnabled"));
    if (v30)
    {
      v31 = (void *)v30;
      if (self)
        v32 = self->_configuration;
      else
        v32 = 0;
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v33, "cloudSubscriptionCheckEnabled"));
      v35 = objc_msgSend(v34, "BOOLValue");

      if ((v35 & 1) == 0)
        goto LABEL_24;
    }
    else
    {

    }
    v38 = nplog_obj(v21, v22, v23);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Not allowed to use app condition", buf, 2u);
    }

    objc_msgSend(v17, "removeObject:", &off_1000FF530);
    goto LABEL_31;
  }
  v24 = nplog_obj(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v73 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ proxy traffic state is nil", buf, 0xCu);
  }
  v25 = 0;
LABEL_126:

  return v25;
}

- (id)currentConfiguration
{
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  return self;
}

- (void)updateConfiguration:(id)a3
{
  NSPConfiguration *configuration;
  NSPConfiguration *v5;
  unint64_t v6;
  NSPConfiguration *v7;
  NSPConfiguration *v8;
  NSPConfiguration *v9;
  unint64_t v10;
  NSPConfiguration *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  unsigned int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  unsigned int v51;
  const __CFString *v52;
  NSPConfiguration *v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  NSPConfiguration *v58;
  uint64_t v59;
  uint64_t v60;
  NSPConfiguration *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSPConfiguration *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  unsigned int v86;
  const char *v87;
  void *v88;
  unsigned __int8 v89;
  void *v90;
  unsigned __int8 v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  unint64_t v107;
  unint64_t v108;
  void *v109;
  void *v110;
  unsigned int v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  NSPConfiguration *v128;
  void *v129;
  BOOL v130;
  NSPConfiguration *v131;
  NSPConfiguration *v132;
  NSObject *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSPConfiguration *v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  NSObject *v150;
  void *v151;
  unsigned int v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  uint64_t v163;
  NSObject *v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  NSObject *v169;
  id v170;
  void *v171;
  id v172;
  uint64_t v173;
  NSObject *v174;
  void *v175;
  void *v176;
  _BOOL4 v177;
  void *v178;
  void *v179;
  void *v180;
  unsigned int v181;
  void *v182;
  unsigned int v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  NSObject *v188;
  void *v189;
  unsigned int v190;
  const char *v191;
  NSPConfiguration *v192;
  void *v193;
  unsigned int v194;
  uint64_t v195;
  uint64_t v196;
  NSObject *v197;
  NSObject *v198;
  void (*v199)(uint64_t);
  void *v200;
  unsigned int v201;
  void *v202;
  void *v203;
  int v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  NSObject *v209;
  void *v210;
  id v211;
  void *v212;
  void *v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  NSObject *v219;
  void *v220;
  unsigned int v221;
  const char *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  NSObject *v233;
  NSPConfiguration *v234;
  NSPConfiguration *v235;
  unsigned __int8 v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  uint64_t v242;
  NSObject *v243;
  void *v244;
  id v245;
  char v246;
  void *v247;
  void *v248;
  unsigned int v249;
  void *v250;
  uint64_t v251;
  NSObject *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  id v257;
  id v258;
  uint64_t v259;
  uint64_t v260;
  id v261;
  char *v262;
  char *v263;
  void *v264;
  id v265;
  id v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  unsigned int v270;
  void *v271;
  void *v272;
  unint64_t v273;
  unint64_t v274;
  void *v275;
  void *v276;
  void *v277;
  unint64_t v278;
  void *v279;
  void *v280;
  unint64_t v281;
  void *v282;
  void *v283;
  unint64_t v284;
  void *v285;
  void *v286;
  unint64_t v287;
  void *v288;
  void *v289;
  unint64_t v290;
  void *v291;
  void *v292;
  unint64_t v293;
  void *v294;
  void *v295;
  unint64_t v296;
  void *v297;
  void *v298;
  char v299;
  void *v300;
  void *v301;
  char v302;
  unsigned int v303;
  unsigned int v304;
  void *v305;
  void *v306;
  id v307;
  id v308;
  uint64_t v309;
  uint64_t v310;
  char *v311;
  char *v312;
  void *v313;
  id v314;
  uint64_t v315;
  void *v316;
  unsigned int v317;
  id v318;
  uint64_t v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  unsigned __int8 v324;
  void *v325;
  void *v326;
  id v327;
  id v328;
  uint64_t v329;
  uint64_t v330;
  char *v331;
  char *v332;
  void *v333;
  id v334;
  uint64_t v335;
  void *v336;
  unsigned int v337;
  id v338;
  uint64_t v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  unsigned __int8 v344;
  uint64_t v345;
  NSObject *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  NSObject *v351;
  uint64_t v352;
  NSObject *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  NSObject *v358;
  void *v359;
  void *v360;
  id v361;
  id v362;
  uint64_t v363;
  uint64_t v364;
  void *i;
  void *v366;
  id v367;
  id v368;
  char v369;
  uint64_t v370;
  void *j;
  void *v372;
  void *v373;
  void *v374;
  unint64_t v375;
  unint64_t v376;
  void *v377;
  void *v378;
  void *v379;
  unint64_t v380;
  unsigned int v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  void *v386;
  void *v387;
  void *k;
  void *v389;
  void *v390;
  void *v391;
  id v392;
  uint64_t v393;
  void *m;
  void *v395;
  unsigned int v396;
  void *v397;
  void *v398;
  id v399;
  id v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  int v404;
  id v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  NSObject *v410;
  uint64_t v411;
  NSObject *v412;
  void *v413;
  void *v414;
  int v415;
  uint64_t v416;
  NSObject *v417;
  void *v418;
  void *v419;
  id v420;
  id v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  void *v429;
  unint64_t v430;
  unint64_t v431;
  void *v432;
  void *v433;
  void *v434;
  unint64_t v435;
  void *v436;
  void *v437;
  void *v438;
  unint64_t v439;
  unint64_t v440;
  void *v441;
  void *v442;
  void *v443;
  unint64_t v444;
  unint64_t v445;
  void *v446;
  unsigned int v447;
  void *v448;
  id v449;
  void *v450;
  _BOOL4 v451;
  uint64_t v452;
  uint64_t v453;
  void *v454;
  uint64_t v455;
  void *v456;
  void *v457;
  void *v458;
  unint64_t v459;
  unint64_t v460;
  void *v461;
  void *v462;
  void *v463;
  unint64_t v464;
  unint64_t v465;
  void *v466;
  void *v467;
  void *v468;
  unint64_t v469;
  unint64_t v470;
  void *v471;
  unsigned int v472;
  unsigned int v473;
  BOOL v474;
  unsigned int v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  NSObject *v480;
  uint64_t v481;
  NSObject *v482;
  uint64_t v483;
  NSObject *v484;
  void *v485;
  unsigned int v486;
  void *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  unsigned int v492;
  void *v493;
  uint64_t v494;
  NSObject *v495;
  void *v496;
  unsigned int v497;
  void *v498;
  void *v499;
  id v500;
  id v501;
  uint64_t v502;
  uint64_t v503;
  char *v504;
  char *v505;
  void *v506;
  id v507;
  uint64_t v508;
  uint64_t v509;
  void *v510;
  uint64_t v511;
  void *v512;
  void *v513;
  void *v514;
  unint64_t v515;
  unint64_t v516;
  void *v517;
  unsigned int v518;
  unsigned int v519;
  unsigned int v520;
  unsigned int v521;
  id v522;
  unsigned int v523;
  unsigned int v524;
  void *v525;
  void *v526;
  unint64_t v527;
  unint64_t v528;
  void *v529;
  void *v530;
  void *v531;
  unint64_t v532;
  unint64_t v533;
  int v534;
  id v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  NSObject *v540;
  uint64_t v541;
  NSObject *v542;
  void *v543;
  void *v544;
  int v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  NSObject *v550;
  void *v551;
  unsigned int v552;
  const char *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  unsigned __int8 v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  NSObject *v563;
  void *v564;
  void *v565;
  void *v566;
  int v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  NSObject *v572;
  void *v573;
  void *v574;
  void *v575;
  int v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  NSObject *v581;
  void *v582;
  unsigned int v583;
  const char *v584;
  void *v585;
  void *v586;
  int v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  NSObject *v592;
  void *v593;
  unsigned int v594;
  const char *v595;
  void *v596;
  void *v597;
  int v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  NSObject *v603;
  void *v604;
  unsigned int v605;
  const char *v606;
  void *v607;
  void *v608;
  int v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  NSObject *v614;
  void *v615;
  unsigned int v616;
  const char *v617;
  void *v618;
  void *v619;
  void *v620;
  id v621;
  id v622;
  id v623;
  uint64_t v624;
  uint64_t v625;
  void *v626;
  id v627;
  id v628;
  uint64_t v629;
  uint64_t v630;
  void *v631;
  void *v632;
  int v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  NSObject *v638;
  uint64_t v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  id v645;
  id v646;
  void *v647;
  uint64_t v648;
  void *v649;
  id v650;
  void *v651;
  uint64_t v652;
  void *v653;
  void *v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  void *v659;
  void *v660;
  void *v661;
  char v662;
  int v663;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  uint64_t v669;
  void *v670;
  id v671;
  void *v672;
  uint64_t v673;
  id v674;
  id v675;
  id v676;
  id v677;
  NSPConfiguration *v678;
  NSPConfigurationManager *v679;
  void *v680;
  uint64_t v681;
  id v682;
  id v683;
  id v684;
  id v685;
  id v686;
  void *v687;
  void *v688;
  void *v689;
  uint64_t v690;
  uint64_t v691;
  void *v692;
  uint64_t v693;
  uint64_t v694;
  void *v695;
  char *v696;
  void *v697;
  char *v698;
  char *v699;
  void *v700;
  void *v701;
  id v702;
  id v703;
  id v704;
  id v705;
  id v706;
  char *v707;
  id v708;
  char *v709;
  char *v710;
  char *v711;
  id v712;
  id v713;
  id v714;
  id v715;
  id v716;
  char *v717;
  id v718;
  id v719;
  id v720;
  id v721;
  id v722;
  unsigned int v723;
  unsigned int v724;
  _BOOL4 v725;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  id objf;
  id objg;
  id objh;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  __int128 v804;
  __int128 v805;
  __int128 v806;
  void **block;
  uint64_t p_block;
  uint64_t v809;
  uint64_t (*v810)(uint64_t, uint64_t);
  void (*v811)(uint64_t);
  __int128 *p_buf;
  _BYTE v813[128];
  _BYTE v814[128];
  _BYTE v815[128];
  _BYTE v816[128];
  _BYTE v817[128];
  _BYTE v818[128];
  _BYTE v819[128];
  _BYTE v820[128];
  _BYTE v821[128];
  _BYTE v822[128];
  _BYTE v823[128];
  _BYTE v824[128];
  _BYTE v825[128];
  _BYTE v826[128];
  _BYTE v827[128];
  _BYTE v828[128];
  _BYTE v829[128];
  uint8_t v830[128];
  __int128 buf;
  uint64_t v832;
  uint64_t (*v833)(uint64_t, uint64_t);
  void (*v834)(uint64_t);
  void ***v835;
  unsigned __int8 v836;

  v674 = a3;
  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v5 = configuration;
  v677 = -[NSPConfiguration copy](v5, "copy");

  v6 = -[NSPConfigurationManager effectiveUserTier](self, "effectiveUserTier");
  if (self)
  {
    v7 = self->_configuration;
    -[NSPConfiguration merge:](v7, "merge:", v674);

    v8 = self->_configuration;
  }
  else
  {
    objc_msgSend(0, "merge:", v674);
    v8 = 0;
  }
  v9 = v8;
  -[NSPConfiguration evaluateEnableRatios](v9, "evaluateEnableRatios");

  v10 = sub_10008C254((uint64_t)self);
  v679 = self;
  if (self)
  {
    self->_effectiveUserTier = v10;
    v11 = self->_configuration;
  }
  else
  {
    v11 = 0;
  }
  v678 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfigurationData](v678, "proxyConfigurationData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfigurationData"));
  v14 = v12;
  v15 = v13;
  v16 = (void *)v15;
  if (!(v14 | v15) || (v17 = 1, v14) && v15 && objc_msgSend((id)v14, "isEqual:", v15))
    v17 = 0;

  v21 = v17;
  if (v17)
  {
    v22 = nplog_obj(v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "proxy configuration data changed", (uint8_t *)&buf, 2u);
    }

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v678, "enabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "enabled"));
  v26 = v24;
  v27 = v25;
  v28 = (void *)v27;
  if (v26 | v27 && (!v26 || !v27 || !objc_msgSend((id)v26, "isEqual:", v27)))
  {

    v48 = nplog_obj(v45, v46, v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v678, "enabled"));
      v51 = objc_msgSend(v50, "BOOLValue");
      v52 = CFSTR("disabled");
      if (v51)
        v52 = CFSTR("enabled");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v52;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "privacy proxy %@", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.configEnableStateUpdated");
      v53 = v679->_configuration;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v53, "enabled"));
      v55 = objc_msgSend(v54, "BOOLValue");

      if (v55)
      {
        v58 = v679->_configuration;
        -[NSPConfiguration setConfigServerEnabled:](v58, "setConfigServerEnabled:", &__kCFBooleanTrue);

        sub_100085CA0((uint64_t)v679);
        sub_100083EBC((uint64_t)v679);
        sub_100085154((id *)&v679->super.isa, v59, v60);
        v61 = v679->_configuration;
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v61, "configServerHost"));
        v679->_useDefaultInterface = objc_msgSend(v62, "isEqualToString:", CFSTR("mask-api.icloud.com")) ^ 1;

        v64 = NPGetInternalQueue(v63);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        block = _NSConcreteStackBlock;
        p_block = 3221225472;
        v809 = (uint64_t)sub_100085E80;
      }
      else
      {
        sub_100084DFC((uint64_t)v679, v56, v57);
        sub_100084B74((uint64_t)v679, v66, v67);
        sub_1000854A0((uint64_t)v679, v68, v69);
        v70 = v679->_configuration;
        -[NSPConfiguration setEnabled:](v70, "setEnabled:", &__kCFBooleanFalse);

        sub_100085EDC((uint64_t)v679);
        v71 = +[NSPConfigurationSignatureInfo removeFromPreferences](NSPConfigurationSignatureInfo, "removeFromPreferences");
        v679->_effectiveUserTier = 1;
        v72 = NPGetInternalQueue(v71);
        v65 = objc_claimAutoreleasedReturnValue(v72);
        block = _NSConcreteStackBlock;
        p_block = 3221225472;
        v809 = (uint64_t)sub_100085F18;
      }
      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
      v811 = (void (*)(uint64_t))v679;
      p_buf = &buf;
      dispatch_async(v65, &block);

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_128;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v678, "enabled"));
  v30 = objc_msgSend(v29, "BOOLValue");

  if ((v30 & 1) == 0)
    goto LABEL_127;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v678, "configServerHost"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "configServerHost"));
  v33 = objc_msgSend(v31, "isEqualToString:", v32);

  if ((v33 & 1) == 0)
  {
    v73 = nplog_obj(v34, v35, v36);
    v42 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v678, "configServerHost"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v74;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "configuration server host changed to %@", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_24;
  }
  v37 = -[NSPConfiguration ignoreInvalidCerts](v678, "ignoreInvalidCerts");
  v38 = objc_msgSend(v677, "ignoreInvalidCerts");
  if (v37 != (_DWORD)v38)
  {
    v41 = nplog_obj(v38, v39, v40);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = -[NSPConfiguration ignoreInvalidCerts](v678, "ignoreInvalidCerts");
      v44 = "no";
      if (v43)
        v44 = "yes";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "ignore invalid certs changed to %s", (uint8_t *)&buf, 0xCu);
    }
LABEL_24:

    sub_10008586C((uint64_t)v679);
LABEL_128:
    v232 = nplog_large_obj();
    v233 = objc_claimAutoreleasedReturnValue(v232);
    if (os_log_type_enabled(v233, OS_LOG_TYPE_DEBUG))
    {
      v244 = v679;
      if (v679)
        v244 = v679->_configuration;
      v245 = v244;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v245;
      _os_log_debug_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEBUG, "Configuration state: %@", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
      v234 = v679->_configuration;
    else
      v234 = 0;
    v235 = v234;
    v236 = -[NSPConfiguration saveToPreferences](v235, "saveToPreferences");

    if ((v236 & 1) != 0)
    {
      if (v679)
      {
        ++v679->_generation;
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed"));
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v832 = 0x3032000000;
        v833 = sub_10000314C;
        v834 = sub_1000841FC;
        v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.configurationUpdated");
        v240 = NPGetInternalQueue(v835);
        v241 = objc_claimAutoreleasedReturnValue(v240);
        block = _NSConcreteStackBlock;
        p_block = 3221225472;
        v809 = (uint64_t)sub_1000860E8;
        v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
        v811 = (void (*)(uint64_t))v679;
        p_buf = &buf;
        dispatch_async(v241, &block);

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed"), 0);
      }
    }
    else
    {
      v242 = nplog_obj(v237, v238, v239);
      v243 = objc_claimAutoreleasedReturnValue(v242);
      if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_ERROR, "Failed to write configuration to file", (uint8_t *)&buf, 2u);
      }

    }
    goto LABEL_137;
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v678, "cloudSubscriptionCheckEnabled"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "cloudSubscriptionCheckEnabled"));
  v77 = v75;
  v78 = v76;
  v79 = (void *)v78;
  if (!(v77 | v78) || v77 && v78 && objc_msgSend((id)v77, "isEqual:", v78))
  {

  }
  else
  {

    v83 = nplog_obj(v80, v81, v82);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v678, "cloudSubscriptionCheckEnabled"));
      v86 = objc_msgSend(v85, "BOOLValue");
      v87 = "no";
      if (v86)
        v87 = "yes";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v87;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "cloud subscription check changed to %s", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v679->_configuration, "cloudSubscriptionCheckEnabled"));
      v89 = objc_msgSend(v88, "BOOLValue");

      if ((v89 & 1) == 0)
      {
        -[NSPConfiguration setProxyAccountType:](v679->_configuration, "setProxyAccountType:", 0);
        -[NSPConfiguration setProxyAccountUnlimited:](v679->_configuration, "setProxyAccountUnlimited:", 0);
      }
      v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v679->_configuration, "cloudSubscriptionCheckEnabled"));
      v91 = objc_msgSend(v90, "BOOLValue");

      block = 0;
      p_block = (uint64_t)&block;
      v809 = 0x3032000000;
      v810 = sub_10000314C;
      v811 = sub_1000841FC;
      p_buf = (__int128 *)os_transaction_create("com.apple.networkserviceproxy.cloudSubscriptionCheckChanged");
      v92 = NPGetInternalQueue(p_buf);
      v93 = objc_claimAutoreleasedReturnValue(v92);
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v832 = (uint64_t)sub_100085FD0;
      v833 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5B90;
      v836 = v91;
      v834 = (void (*)(uint64_t))v679;
      v835 = &block;
      dispatch_async(v93, &buf);

      _Block_object_dispose(&block, 8);
    }
    v21 = 1;
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration trialConfigVersion](v678, "trialConfigVersion"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "trialConfigVersion"));
  v96 = v94;
  v97 = v95;
  v98 = (void *)v97;
  if (!(v96 | v97) || v96 && v97 && objc_msgSend((id)v96, "isEqual:", v97))
  {

  }
  else
  {

    v102 = nplog_obj(v99, v100, v101);
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration trialConfigVersion](v678, "trialConfigVersion"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v104;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Trial configuration version changed to %@", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.trialConfigurationVersionChanged");
      block = _NSConcreteStackBlock;
      p_block = 3221225472;
      v809 = (uint64_t)sub_100086C24;
      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F6170;
      v811 = (void (*)(uint64_t))&buf;
      -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:](v679, "refreshConfigurationWithReason:completionHandler:", 2, &block);
      _Block_object_dispose(&buf, 8);

    }
    v21 = 1;
  }
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v678, "resurrectionDate"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "resurrectionDate"));
  v107 = v105;
  v108 = v106;
  v109 = (void *)v108;
  if (v107 | v108 && (!v107 || !v108 || !objc_msgSend((id)v107, "isEqual:", v108)))
  {

    v121 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v678, "resurrectionDate"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v121, 1, 2));

    v126 = nplog_obj(v123, v124, v125);
    v127 = objc_claimAutoreleasedReturnValue(v126);
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v122;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "resurrection date changed to %@", (uint8_t *)&buf, 0xCu);
    }

    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.resurrectionDateUpdated");
      v128 = v679->_configuration;
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v128, "resurrectionDate"));
      v130 = v129 == 0;

      v131 = v679->_configuration;
      v132 = v131;
      if (v130)
      {
        -[NSPConfiguration setConfigServerEnabled:](v131, "setConfigServerEnabled:", &__kCFBooleanTrue);

        sub_100083EBC((uint64_t)v679);
        sub_100085154((id *)&v679->super.isa, v144, v145);
        v147 = NPGetInternalQueue(v146);
        v133 = objc_claimAutoreleasedReturnValue(v147);
        block = _NSConcreteStackBlock;
        p_block = 3221225472;
        v809 = (uint64_t)sub_10008608C;
        v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
        v811 = (void (*)(uint64_t))v679;
        p_buf = &buf;
        dispatch_async(v133, &block);
      }
      else
      {
        v133 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v131, "resurrectionDate"));

        sub_100084DFC((uint64_t)v679, v134, v135);
        sub_100084B74((uint64_t)v679, v136, v137);
        sub_1000854A0((uint64_t)v679, v138, v139);
        v140 = v679->_configuration;
        -[NSPConfiguration setResurrectionDate:](v140, "setResurrectionDate:", v133);

        sub_1000845E8((id *)&v679->super.isa);
        v142 = NPGetInternalQueue(v141);
        v143 = objc_claimAutoreleasedReturnValue(v142);
        block = _NSConcreteStackBlock;
        p_block = 3221225472;
        v809 = (uint64_t)sub_100086030;
        v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
        v811 = (void (*)(uint64_t))v679;
        p_buf = &buf;
        dispatch_async(v143, &block);

      }
      _Block_object_dispose(&buf, 8);

    }
    goto LABEL_128;
  }

  v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v678, "userTier"));
  v111 = objc_msgSend(v110, "unsignedIntValue");
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "userTier"));
  LOBYTE(v111) = v111 == objc_msgSend(v112, "unsignedIntValue");

  if ((v111 & 1) == 0)
  {
    v116 = nplog_obj(v113, v114, v115);
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v678, "userTier"));
      v119 = objc_msgSend(v118, "unsignedIntValue");
      if (v119 >= 3)
        v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v119));
      else
        v120 = *(&off_1000F6AF0 + (int)v119);
      v148 = v120;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v148;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "user tier changed to %@", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.userTierChanged");
      v149 = NPGetInternalQueue(v835);
      v150 = objc_claimAutoreleasedReturnValue(v149);
      block = _NSConcreteStackBlock;
      p_block = 3221225472;
      v809 = (uint64_t)sub_10008646C;
      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
      v811 = (void (*)(uint64_t))v679;
      p_buf = &buf;
      dispatch_async(v150, &block);

      _Block_object_dispose(&buf, 8);
    }
    v21 = 1;
  }
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](v678, "userPreferredTier"));
  v152 = objc_msgSend(v151, "unsignedIntValue");
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "userPreferredTier"));
  LOBYTE(v152) = v152 == objc_msgSend(v153, "unsignedIntValue");

  if ((v152 & 1) == 0)
  {
    v157 = nplog_obj(v154, v155, v156);
    v158 = objc_claimAutoreleasedReturnValue(v157);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      v159 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v678, "userTier"));
      v160 = objc_msgSend(v159, "unsignedIntValue");
      if (v160 >= 3)
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v160));
      else
        v161 = *(&off_1000F6AF0 + (int)v160);
      v162 = v161;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v162;
      _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "user preferred tier changed to %@", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.userPreferredTierChanged");
      v163 = NPGetInternalQueue(v835);
      v164 = objc_claimAutoreleasedReturnValue(v163);
      block = _NSConcreteStackBlock;
      p_block = 3221225472;
      v809 = (uint64_t)sub_1000864C8;
      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
      v811 = (void (*)(uint64_t))v679;
      p_buf = &buf;
      dispatch_async(v164, &block);

      _Block_object_dispose(&buf, 8);
    }
    v21 = 1;
  }
  v165 = -[NSPConfigurationManager effectiveUserTier](v679, "effectiveUserTier");
  if ((id)v6 != v165)
  {
    v168 = nplog_obj(v165, v166, v167);
    v169 = objc_claimAutoreleasedReturnValue(v168);
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      v170 = -[NSPConfigurationManager effectiveUserTier](v679, "effectiveUserTier");
      if (v170 >= 3)
        v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v170));
      else
        v171 = *(&off_1000F6AF0 + (int)v170);
      v172 = v171;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v172;
      _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEFAULT, "effective user tier changed to %@", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.effectiveUserTierChanged");
      v173 = NPGetInternalQueue(v835);
      v174 = objc_claimAutoreleasedReturnValue(v173);
      block = _NSConcreteStackBlock;
      p_block = 3221225472;
      v809 = (uint64_t)sub_100086570;
      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
      v811 = (void (*)(uint64_t))v679;
      p_buf = &buf;
      dispatch_async(v174, &block);

      _Block_object_dispose(&buf, 8);
    }
    v21 = 1;
  }
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration willResetSubscriberTierTomorrow](v678, "willResetSubscriberTierTomorrow"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "willResetSubscriberTierTomorrow"));
  if (v175 == v176)
  {
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration resetTomorrowDate](v678, "resetTomorrowDate"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "resetTomorrowDate"));
    v177 = v178 != v179;

  }
  else
  {
    v177 = 1;
  }

  v180 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v181 = objc_msgSend(v180, "enabled");
  v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v183 = objc_msgSend(v182, "enabled");

  if (v181 != v183)
  {
    v187 = nplog_obj(v184, v185, v186);
    v188 = objc_claimAutoreleasedReturnValue(v187);
    if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
    {
      v189 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
      v190 = objc_msgSend(v189, "enabled");
      v191 = "disabled";
      if (v190)
        v191 = "enabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v191;
      _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEFAULT, "proxy token fetch state changed to %s", (uint8_t *)&buf, 0xCu);

    }
    if (v679)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v832 = 0x3032000000;
      v833 = sub_10000314C;
      v834 = sub_1000841FC;
      v835 = (void ***)os_transaction_create("com.apple.networkserviceproxy.proxyTokenFetchStateUpdated");
      v192 = v679->_configuration;
      v193 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v192, "proxyConfiguration"));
      v194 = objc_msgSend(v193, "enabled");

      v196 = NPGetInternalQueue(v195);
      v197 = objc_claimAutoreleasedReturnValue(v196);
      v198 = v197;
      block = _NSConcreteStackBlock;
      if (v194)
        v199 = sub_10008627C;
      else
        v199 = sub_1000862D8;
      p_block = 3221225472;
      v809 = (uint64_t)v199;
      v810 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F5428;
      v811 = (void (*)(uint64_t))v679;
      p_buf = &buf;
      dispatch_async(v197, &block);

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_128;
  }
  v200 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v201 = objc_msgSend(v200, "enabled");

  v21 |= v177;
  if (!v201)
  {
LABEL_127:
    if (!v21)
      goto LABEL_137;
    goto LABEL_128;
  }
  v663 = v21;
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v678, "proxyAccountType"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyAccountType"));
  v204 = sub_10008C2E0(v202, v203);

  if (v204)
  {
    v208 = nplog_obj(v205, v206, v207);
    v209 = objc_claimAutoreleasedReturnValue(v208);
    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
    {
      v210 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v678, "proxyAccountType"));
      v211 = (id)objc_claimAutoreleasedReturnValue(+[NSPConfiguration proxyAccountTypeToString:](NSPConfiguration, "proxyAccountTypeToString:", v210));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v211;
      _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "proxy account type changed to %@", (uint8_t *)&buf, 0xCu);

    }
    v663 = 1;
  }
  v212 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v678, "proxyAccountUnlimited"));
  v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyAccountUnlimited"));
  v214 = sub_10008C2E0(v212, v213);

  if (v214)
  {
    v218 = nplog_obj(v215, v216, v217);
    v219 = objc_claimAutoreleasedReturnValue(v218);
    if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
    {
      v220 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v678, "proxyAccountUnlimited"));
      v221 = objc_msgSend(v220, "BOOLValue");
      v222 = "false";
      if (v221)
        v222 = "true";
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v222;
      _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_DEFAULT, "proxy account unlimited changed to %{public}s", (uint8_t *)&buf, 0xCu);

    }
    v663 = 1;
  }
  v223 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "authInfo"));
  v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v224, "authURL"));
  v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "authInfo"));
  v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "authURL"));
  if ((sub_10008C2E0(v225, v228) & 1) != 0)
  {

  }
  else
  {
    obj = (id)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
    v716 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "authInfo"));
    v697 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v716, "accessTokenURL"));
    v708 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
    v702 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v708, "authInfo"));
    v692 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v702, "accessTokenURL"));
    if ((sub_10008C2E0(v697, v692) & 1) != 0)
    {
      v246 = 1;
    }
    else
    {
      v687 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
      v680 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v687, "authInfo"));
      v682 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
      v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v682, "authInfo"));
      if (sub_100087A28((uint64_t)v679, v680, v247))
      {
        v675 = (id)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
        v672 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v675, "authInfo"));
        v668 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v672, "accessTokenKnownOrigins"));
        v670 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
        v666 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v670, "authInfo"));
        v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v666, "accessTokenKnownOrigins"));
        if ((sub_10008C2E0(v668, v248) & 1) != 0)
        {
          v246 = 1;
        }
        else
        {
          v661 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
          v664 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v661, "authInfo"));
          v659 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v664, "accessTokenBlockedIssuers"));
          v657 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
          v653 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v657, "authInfo"));
          v655 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v653, "accessTokenBlockedIssuers"));
          if ((sub_10008C2E0(v659, v655) & 1) != 0)
          {
            v246 = 1;
          }
          else
          {
            v651 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
            v649 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v651, "authInfo"));
            v249 = objc_msgSend(v649, "authType");
            v647 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
            v645 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v647, "authInfo"));
            if (v249 == objc_msgSend(v645, "authType"))
            {
              v644 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
              v643 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v644, "authInfo"));
              v642 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v643, "nonDefaultAttesters"));
              v641 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
              v640 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v641, "authInfo"));
              v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v640, "nonDefaultAttesters"));
              v246 = sub_10008C2E0(v642, v250);

            }
            else
            {
              v246 = 1;
            }

          }
        }

      }
      else
      {
        v246 = 1;
      }

    }
    if ((v246 & 1) == 0)
      goto LABEL_162;
  }
  v251 = nplog_obj(v229, v230, v231);
  v252 = objc_claimAutoreleasedReturnValue(v251);
  if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
  {
    v253 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
    v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "authInfo"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v254;
    _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "authentication info updated to %@", (uint8_t *)&buf, 0xCu);

  }
  sub_100086334((uint64_t)v679);
  v663 = 1;
LABEL_162:
  v255 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v667 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "proxies"));

  v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v665 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "proxies"));

  v257 = objc_msgSend(v667, "count");
  v258 = objc_msgSend(v665, "count");
  if (v257 != v258)
  {
    v345 = nplog_obj(v258, v259, v260);
    v346 = objc_claimAutoreleasedReturnValue(v345);
    if (os_log_type_enabled(v346, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v667;
      _os_log_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_DEFAULT, "proxy info updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_1000865CC((uint64_t)v679);
    goto LABEL_288;
  }
  if (!objc_msgSend(v667, "count"))
    goto LABEL_226;
  v806 = 0u;
  v805 = 0u;
  v804 = 0u;
  v803 = 0u;
  obja = v667;
  v717 = (char *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v803, v830, 16);
  if (!v717)
    goto LABEL_225;
  v261 = *(id *)v804;
  v703 = *(id *)v804;
  do
  {
    v262 = 0;
    do
    {
      if (*(id *)v804 != v261)
      {
        v263 = v262;
        objc_enumerationMutation(obja);
        v262 = v263;
      }
      v709 = v262;
      v264 = *(void **)(*((_QWORD *)&v803 + 1) + 8 * (_QWORD)v262);
      v799 = 0u;
      v800 = 0u;
      v801 = 0u;
      v802 = 0u;
      v265 = v665;
      v266 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v799, v829, 16);
      if (!v266)
      {
LABEL_279:

        v350 = nplog_obj(v347, v348, v349);
        v351 = objc_claimAutoreleasedReturnValue(v350);
        if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = obja;
          _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_DEFAULT, "proxy info updated to %@", (uint8_t *)&buf, 0xCu);
        }

        sub_1000865CC((uint64_t)v679);
        goto LABEL_288;
      }
      v267 = *(_QWORD *)v800;
LABEL_171:
      v268 = 0;
      while (1)
      {
        if (*(_QWORD *)v800 != v267)
          objc_enumerationMutation(v265);
        v269 = *(void **)(*((_QWORD *)&v799 + 1) + 8 * v268);
        v270 = objc_msgSend(v264, "proxyHop");
        if (v270 != objc_msgSend(v269, "proxyHop"))
          goto LABEL_220;
        v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "proxyURL"));
        v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "proxyURL"));
        v273 = v271;
        v274 = v272;
        v275 = (void *)v274;
        if (!(v273 | v274) || v273 && v274 && objc_msgSend((id)v273, "isEqual:", v274))
        {

          v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "tcpProxyFqdn"));
          v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "tcpProxyFqdn"));
          v273 = v276;
          v278 = v277;
          v275 = (void *)v278;
          if (!(v273 | v278) || v273 && v278 && objc_msgSend((id)v273, "isEqual:", v278))
          {

            v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "proxyKeyInfos"));
            v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "proxyKeyInfos"));
            v273 = v279;
            v281 = v280;
            v275 = (void *)v281;
            if (!(v273 | v281) || v273 && v281 && objc_msgSend((id)v273, "isEqual:", v281))
            {

              v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "tokenKeyInfo"));
              v283 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "tokenKeyInfo"));
              v273 = v282;
              v284 = v283;
              v275 = (void *)v284;
              if (!(v273 | v284) || v273 && v284 && objc_msgSend((id)v273, "isEqual:", v284))
              {

                v285 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "preferredPathConfigUri"));
                v286 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "preferredPathConfigUri"));
                v273 = v285;
                v287 = v286;
                v275 = (void *)v287;
                if (!(v273 | v287) || v273 && v287 && objc_msgSend((id)v273, "isEqual:", v287))
                {

                  v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "tokenChallenge"));
                  v289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "tokenChallenge"));
                  v273 = v288;
                  v290 = v289;
                  v275 = (void *)v290;
                  if (!(v273 | v290) || v273 && v290 && objc_msgSend((id)v273, "isEqual:", v290))
                  {

                    v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "bootstrapAddresses"));
                    v292 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "bootstrapAddresses"));
                    v273 = v291;
                    v293 = v292;
                    v275 = (void *)v293;
                    if (!(v273 | v293) || v273 && v293 && objc_msgSend((id)v273, "isEqual:", v293))
                    {

                      v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "allowedNextHops"));
                      v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "allowedNextHops"));
                      v273 = v294;
                      v296 = v295;
                      v275 = (void *)v296;
                      if (!(v273 | v296) || v273 && v296 && objc_msgSend((id)v273, "isEqual:", v296))
                        break;
                    }
                  }
                }
              }
            }
          }
        }

LABEL_220:
        if (v266 == (id)++v268)
        {
          v266 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v799, v829, 16);
          if (!v266)
            goto LABEL_279;
          goto LABEL_171;
        }
      }

      v297 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "preferredPathPatterns"));
      v298 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "preferredPathPatterns"));
      v299 = sub_10008C2E0(v297, v298);

      if ((v299 & 1) != 0)
        goto LABEL_220;
      v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "proxyVersion"));
      v301 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "proxyVersion"));
      v302 = sub_10008C2E0(v300, v301);

      if ((v302 & 1) != 0)
        goto LABEL_220;
      v303 = objc_msgSend(v264, "fallbackSupportsUDPProxying");
      if (v303 != objc_msgSend(v269, "fallbackSupportsUDPProxying"))
        goto LABEL_220;
      v304 = objc_msgSend(v264, "algorithm");
      if (v304 != objc_msgSend(v269, "algorithm"))
        goto LABEL_220;

      v262 = v709 + 1;
      v261 = v703;
    }
    while (v709 + 1 != v717);
    v717 = (char *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v803, v830, 16);
    v261 = v703;
  }
  while (v717);
LABEL_225:

LABEL_226:
  v305 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v688 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "pathWeights"));

  v306 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v704 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v306, "pathWeights"));

  v307 = objc_msgSend(v688, "count");
  v308 = objc_msgSend(v704, "count");
  if (v307 != v308)
  {
    v352 = nplog_obj(v308, v309, v310);
    v353 = objc_claimAutoreleasedReturnValue(v352);
    if (os_log_type_enabled(v353, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v688;
      _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_DEFAULT, "proxy path list updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_1000865CC((uint64_t)v679);
LABEL_288:
    v663 = 1;
    goto LABEL_289;
  }
  if (!objc_msgSend(v688, "count"))
    goto LABEL_251;
  v798 = 0u;
  v797 = 0u;
  v796 = 0u;
  v795 = 0u;
  v683 = v688;
  v698 = (char *)objc_msgSend(v683, "countByEnumeratingWithState:objects:count:", &v795, v828, 16);
  if (!v698)
    goto LABEL_250;
  v693 = *(_QWORD *)v796;
  while (2)
  {
    v311 = 0;
    while (2)
    {
      if (*(_QWORD *)v796 != v693)
      {
        v312 = v311;
        objc_enumerationMutation(v683);
        v311 = v312;
      }
      v710 = v311;
      v313 = *(void **)(*((_QWORD *)&v795 + 1) + 8 * (_QWORD)v311);
      v791 = 0u;
      v792 = 0u;
      v793 = 0u;
      v794 = 0u;
      v718 = v704;
      v314 = objc_msgSend(v718, "countByEnumeratingWithState:objects:count:", &v791, v827, 16);
      if (!v314)
      {
LABEL_285:

        v357 = nplog_obj(v354, v355, v356);
        v358 = objc_claimAutoreleasedReturnValue(v357);
        if (os_log_type_enabled(v358, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v683;
          _os_log_impl((void *)&_mh_execute_header, v358, OS_LOG_TYPE_DEFAULT, "proxy path updated to %@", (uint8_t *)&buf, 0xCu);
        }

        sub_1000865CC((uint64_t)v679);
        goto LABEL_288;
      }
      objb = *(id *)v792;
      while (2)
      {
        v315 = 0;
LABEL_236:
        if (*(id *)v792 != objb)
          objc_enumerationMutation(v718);
        v316 = *(void **)(*((_QWORD *)&v791 + 1) + 8 * v315);
        v317 = objc_msgSend(v313, "weight");
        if (v317 != objc_msgSend(v316, "weight")
          || (v318 = objc_msgSend(v313, "proxiesCount"), v318 != objc_msgSend(v316, "proxiesCount")))
        {
LABEL_245:
          if ((id)++v315 == v314)
          {
            v314 = objc_msgSend(v718, "countByEnumeratingWithState:objects:count:", &v791, v827, 16);
            if (!v314)
              goto LABEL_285;
            continue;
          }
          goto LABEL_236;
        }
        break;
      }
      if (objc_msgSend(v313, "proxiesCount"))
      {
        v319 = 0;
        do
        {
          v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v667, "objectAtIndex:", *((unsigned int *)objc_msgSend(v313, "proxies")
                                                                                                + v319)));
          v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v665, "objectAtIndex:", *((unsigned int *)objc_msgSend(v316, "proxies")
                                                                                                + v319)));
          v322 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v320, "proxyURL"));
          v323 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "proxyURL"));
          v324 = objc_msgSend(v322, "isEqualToString:", v323);

          if ((v324 & 1) == 0)
            goto LABEL_245;
        }
        while (++v319 < (unint64_t)objc_msgSend(v313, "proxiesCount"));
      }

      v311 = v710 + 1;
      if (v710 + 1 != v698)
        continue;
      break;
    }
    v698 = (char *)objc_msgSend(v683, "countByEnumeratingWithState:objects:count:", &v795, v828, 16);
    if (v698)
      continue;
    break;
  }
LABEL_250:

LABEL_251:
  v325 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v689 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v325, "fallbackPathWeights"));

  v326 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v705 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v326, "fallbackPathWeights"));

  v327 = objc_msgSend(v689, "count");
  v328 = objc_msgSend(v705, "count");
  if (v327 == v328)
  {
    if (!objc_msgSend(v689, "count"))
      goto LABEL_588;
    v790 = 0u;
    v789 = 0u;
    v788 = 0u;
    v787 = 0u;
    v684 = v689;
    v699 = (char *)objc_msgSend(v684, "countByEnumeratingWithState:objects:count:", &v787, v826, 16);
    if (!v699)
      goto LABEL_587;
    v694 = *(_QWORD *)v788;
    while (1)
    {
      v331 = 0;
LABEL_256:
      if (*(_QWORD *)v788 != v694)
      {
        v332 = v331;
        objc_enumerationMutation(v684);
        v331 = v332;
      }
      v711 = v331;
      v333 = *(void **)(*((_QWORD *)&v787 + 1) + 8 * (_QWORD)v331);
      v783 = 0u;
      v784 = 0u;
      v785 = 0u;
      v786 = 0u;
      v719 = v705;
      v334 = objc_msgSend(v719, "countByEnumeratingWithState:objects:count:", &v783, v825, 16);
      if (!v334)
      {
LABEL_584:

        v637 = nplog_obj(v634, v635, v636);
        v638 = objc_claimAutoreleasedReturnValue(v637);
        if (os_log_type_enabled(v638, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v684;
          _os_log_impl((void *)&_mh_execute_header, v638, OS_LOG_TYPE_DEFAULT, "fallback proxy path updated to %@", (uint8_t *)&buf, 0xCu);
        }

        sub_1000865CC((uint64_t)v679);
        v663 = 1;
        goto LABEL_587;
      }
      objc = *(id *)v784;
LABEL_260:
      v335 = 0;
      while (1)
      {
        if (*(id *)v784 != objc)
          objc_enumerationMutation(v719);
        v336 = *(void **)(*((_QWORD *)&v783 + 1) + 8 * v335);
        v337 = objc_msgSend(v333, "weight");
        if (v337 == objc_msgSend(v336, "weight"))
        {
          v338 = objc_msgSend(v333, "proxiesCount");
          if (v338 == objc_msgSend(v336, "proxiesCount"))
            break;
        }
LABEL_270:
        if ((id)++v335 == v334)
        {
          v334 = objc_msgSend(v719, "countByEnumeratingWithState:objects:count:", &v783, v825, 16);
          if (v334)
            goto LABEL_260;
          goto LABEL_584;
        }
      }
      if (objc_msgSend(v333, "proxiesCount"))
        break;
LABEL_273:

      v331 = v711 + 1;
      if (v711 + 1 != v699)
        goto LABEL_256;
      v699 = (char *)objc_msgSend(v684, "countByEnumeratingWithState:objects:count:", &v787, v826, 16);
      if (!v699)
      {
LABEL_587:

        goto LABEL_588;
      }
    }
    v339 = 0;
    while (1)
    {
      v340 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v667, "objectAtIndex:", *((unsigned int *)objc_msgSend(v333, "proxies")
                                                                                            + v339)));
      v341 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v665, "objectAtIndex:", *((unsigned int *)objc_msgSend(v336, "proxies")
                                                                                            + v339)));
      v342 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v340, "proxyURL"));
      v343 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v341, "proxyURL"));
      v344 = objc_msgSend(v342, "isEqualToString:", v343);

      if ((v344 & 1) == 0)
        goto LABEL_270;
      if (++v339 >= (unint64_t)objc_msgSend(v333, "proxiesCount"))
        goto LABEL_273;
    }
  }
  v481 = nplog_obj(v328, v329, v330);
  v482 = objc_claimAutoreleasedReturnValue(v481);
  if (os_log_type_enabled(v482, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v689;
    _os_log_impl((void *)&_mh_execute_header, v482, OS_LOG_TYPE_DEFAULT, "fallback proxy path list updated to %@", (uint8_t *)&buf, 0xCu);
  }

  sub_1000865CC((uint64_t)v679);
  v663 = 1;
LABEL_588:

LABEL_289:
  v359 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v658 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "resolvers"));

  v360 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v660 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v360, "resolvers"));

  v361 = objc_msgSend(v658, "count");
  v362 = objc_msgSend(v660, "count");
  if (v361 == v362)
  {
    if (objc_msgSend(v658, "count"))
    {
      v782 = 0u;
      v780 = 0u;
      v781 = 0u;
      v779 = 0u;
      v712 = v658;
      objd = objc_msgSend(v712, "countByEnumeratingWithState:objects:count:", &v779, v824, 16);
      if (objd)
      {
        v720 = *(id *)v780;
        while (2)
        {
          for (i = 0; i != objd; i = (char *)i + 1)
          {
            if (*(id *)v780 != v720)
              objc_enumerationMutation(v712);
            v366 = *(void **)(*((_QWORD *)&v779 + 1) + 8 * (_QWORD)i);
            v775 = 0u;
            v776 = 0u;
            v777 = 0u;
            v778 = 0u;
            v367 = v660;
            v368 = objc_msgSend(v367, "countByEnumeratingWithState:objects:count:", &v775, v823, 16);
            if (!v368)
            {

LABEL_359:
              v416 = nplog_obj(v382, v383, v384);
              v417 = objc_claimAutoreleasedReturnValue(v416);
              if (os_log_type_enabled(v417, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v712;
                _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_DEFAULT, "resolver info updated to %@", (uint8_t *)&buf, 0xCu);
              }

              sub_100086704(v679, 1);
              goto LABEL_362;
            }
            v369 = 0;
            v370 = *(_QWORD *)v776;
            do
            {
              for (j = 0; j != v368; j = (char *)j + 1)
              {
                if (*(_QWORD *)v776 != v370)
                  objc_enumerationMutation(v367);
                v372 = *(void **)(*((_QWORD *)&v775 + 1) + 8 * (_QWORD)j);
                v373 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v366, "dohURL"));
                v374 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v372, "dohURL"));
                v375 = v373;
                v376 = v374;
                v377 = (void *)v376;
                if (v375 | v376 && (!v375 || !v376 || !objc_msgSend((id)v375, "isEqual:", v376)))
                  goto LABEL_311;

                v378 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v366, "obliviousDoHConfig"));
                v379 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v372, "obliviousDoHConfig"));
                v375 = v378;
                v380 = v379;
                v377 = (void *)v380;
                if (!(v375 | v380) || v375 && v380 && objc_msgSend((id)v375, "isEqual:", v380))
                {

                  v381 = objc_msgSend(v366, "weight");
                  v369 |= v381 == objc_msgSend(v372, "weight");
                }
                else
                {
LABEL_311:

                }
              }
              v368 = objc_msgSend(v367, "countByEnumeratingWithState:objects:count:", &v775, v823, 16);
            }
            while (v368);

            if ((v369 & 1) == 0)
              goto LABEL_359;
          }
          objd = objc_msgSend(v712, "countByEnumeratingWithState:objects:count:", &v779, v824, 16);
          if (objd)
            continue;
          break;
        }
      }

    }
    v773 = 0u;
    v774 = 0u;
    v771 = 0u;
    v772 = 0u;
    v385 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
    obje = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v385, "policyTierMaps"));

    v721 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v771, v822, 16);
    if (v721)
    {
      v386 = 0;
      v387 = 0;
      v713 = *(id *)v772;
      while (1)
      {
        for (k = 0; k != v721; k = (char *)k + 1)
        {
          if (*(id *)v772 != v713)
            objc_enumerationMutation(obje);
          v389 = *(void **)(*((_QWORD *)&v771 + 1) + 8 * (_QWORD)k);
          v767 = 0u;
          v768 = 0u;
          v769 = 0u;
          v770 = 0u;
          v390 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
          v391 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v390, "policyTierMaps"));

          v392 = objc_msgSend(v391, "countByEnumeratingWithState:objects:count:", &v767, v821, 16);
          if (!v392)
            goto LABEL_343;
          v393 = *(_QWORD *)v768;
          while (2)
          {
            for (m = 0; m != v392; m = (char *)m + 1)
            {
              if (*(_QWORD *)v768 != v393)
                objc_enumerationMutation(v391);
              v395 = *(void **)(*((_QWORD *)&v767 + 1) + 8 * (_QWORD)m);
              v396 = objc_msgSend(v389, "tier");
              if (v396 == objc_msgSend(v395, "tier"))
              {
                v397 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v389, "policy"));

                v398 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v395, "policy"));
                v399 = objc_msgSend(v397, "conditionsCount");
                v400 = objc_msgSend(v398, "conditionsCount");
                if (v399 == v400)
                {
                  if (!objc_msgSend(v397, "conditionsCount") || !objc_msgSend(v397, "conditionsCount"))
                  {
LABEL_342:
                    v387 = v398;
                    v386 = v397;
                    goto LABEL_343;
                  }
                  v403 = 0;
                  while (1)
                  {
                    v404 = *((_DWORD *)objc_msgSend(v397, "conditions") + v403);
                    v405 = objc_msgSend(v398, "conditionsCount");
                    if (!v405)
                      break;
                    v408 = 0;
                    while (*((_DWORD *)objc_msgSend(v398, "conditions") + v408) != v404)
                    {
                      v405 = objc_msgSend(v398, "conditionsCount");
                      if (++v408 >= (unint64_t)v405)
                        goto LABEL_349;
                    }
                    if (++v403 >= (unint64_t)objc_msgSend(v397, "conditionsCount"))
                      goto LABEL_342;
                  }
LABEL_349:
                  v411 = nplog_obj(v405, v406, v407);
                  v412 = objc_claimAutoreleasedReturnValue(v411);
                  if (os_log_type_enabled(v412, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(_QWORD *)((char *)&buf + 4) = v397;
                    goto LABEL_351;
                  }
                }
                else
                {
                  v639 = nplog_obj(v400, v401, v402);
                  v412 = objc_claimAutoreleasedReturnValue(v639);
                  if (os_log_type_enabled(v412, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(_QWORD *)((char *)&buf + 4) = v397;
LABEL_351:
                    _os_log_impl((void *)&_mh_execute_header, v412, OS_LOG_TYPE_DEFAULT, "policy information updated to %@", (uint8_t *)&buf, 0xCu);
                  }
                }

                sub_100086704(v679, 0);
                v663 = 1;
                goto LABEL_357;
              }
            }
            v392 = objc_msgSend(v391, "countByEnumeratingWithState:objects:count:", &v767, v821, 16);
            if (v392)
              continue;
            break;
          }
LABEL_343:

        }
        v721 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v771, v822, 16);
        if (!v721)
          goto LABEL_354;
      }
    }
    v386 = 0;
    v387 = 0;
LABEL_354:

    v413 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v678, "proxyTrafficState"));
    v414 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyTrafficState"));
    v415 = sub_10008C2E0(v413, v414);

    if (v415)
    {
      sub_100086704(v679, 0);
      v663 = 1;
    }
    v398 = v387;
    v397 = v386;
LABEL_357:

  }
  else
  {
    v409 = nplog_obj(v362, v363, v364);
    v410 = objc_claimAutoreleasedReturnValue(v409);
    if (os_log_type_enabled(v410, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v658;
      _os_log_impl((void *)&_mh_execute_header, v410, OS_LOG_TYPE_DEFAULT, "resolver info updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_100086704(v679, 1);
LABEL_362:
    v663 = 1;
  }
  v418 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v656 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v418, "obliviousConfigs"));

  v419 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v654 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v419, "obliviousConfigs"));

  v420 = objc_msgSend(v656, "count");
  v421 = objc_msgSend(v654, "count");
  if (v420 == v421)
  {
    if (objc_msgSend(v656, "count"))
    {
      v765 = 0u;
      v766 = 0u;
      v763 = 0u;
      v764 = 0u;
      v646 = v656;
      v650 = objc_msgSend(v646, "countByEnumeratingWithState:objects:count:", &v763, v820, 16);
      if (!v650)
        goto LABEL_454;
      v648 = *(_QWORD *)v764;
LABEL_367:
      v424 = 0;
LABEL_368:
      if (*(_QWORD *)v764 != v648)
      {
        v425 = v424;
        objc_enumerationMutation(v646);
        v424 = v425;
      }
      v652 = v424;
      v695 = *(void **)(*((_QWORD *)&v763 + 1) + 8 * v424);
      v759 = 0u;
      v760 = 0u;
      v761 = 0u;
      v762 = 0u;
      v676 = v654;
      v685 = objc_msgSend(v676, "countByEnumeratingWithState:objects:count:", &v759, v819, 16);
      if (v685)
      {
        v662 = 0;
        v681 = *(_QWORD *)v760;
        while (1)
        {
          v426 = 0;
          do
          {
            if (*(_QWORD *)v760 != v681)
            {
              v427 = v426;
              objc_enumerationMutation(v676);
              v426 = v427;
            }
            v690 = v426;
            v700 = *(void **)(*((_QWORD *)&v759 + 1) + 8 * v426);
            v428 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v695, "obliviousHTTPConfig"));
            v429 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v700, "obliviousHTTPConfig"));
            v430 = v428;
            v431 = v429;
            v432 = (void *)v431;
            v706 = (id)v430;
            v714 = (id)v431;
            if (v430 | v431)
            {
              v436 = (void *)v431;
              if (!v430)
                goto LABEL_435;
              v436 = (void *)v431;
              if (!v431)
                goto LABEL_435;
              v475 = objc_msgSend((id)v430, "isEqual:", v431);
              v432 = v714;
              v436 = v714;
              if (!v475)
                goto LABEL_435;
            }

            v433 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v695, "transparencyKeyBundle"));
            v434 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v700, "transparencyKeyBundle"));
            v430 = v433;
            v435 = v434;
            v436 = (void *)v435;
            if (v430 | v435)
            {
              v441 = (void *)v435;
              v439 = v430;
              if (!v430)
                goto LABEL_434;
              v441 = (void *)v435;
              v439 = v430;
              if (!v435)
                goto LABEL_434;
              v441 = (void *)v435;
              v439 = v430;
              if (!objc_msgSend((id)v430, "isEqual:", v435))
                goto LABEL_434;
            }

            v437 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v695, "transparencyProof"));
            v438 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v700, "transparencyProof"));
            v439 = v437;
            v440 = v438;
            v441 = (void *)v440;
            if (v439 | v440)
            {
              v446 = (void *)v440;
              v444 = v439;
              if (!v439)
                goto LABEL_433;
              v446 = (void *)v440;
              v444 = v439;
              if (!v440)
                goto LABEL_433;
              v446 = (void *)v440;
              v444 = v439;
              if (!objc_msgSend((id)v439, "isEqual:", v440))
                goto LABEL_433;
            }

            v442 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v695, "transparencyInternalProof"));
            v443 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v700, "transparencyInternalProof"));
            v444 = v442;
            v445 = v443;
            v446 = (void *)v445;
            if (v444 | v445 && (!v444 || !v445 || !objc_msgSend((id)v444, "isEqual:", v445)))
            {

LABEL_433:
LABEL_434:

LABEL_435:
LABEL_436:

              goto LABEL_437;
            }

            v447 = objc_msgSend(v695, "obliviousHTTPType");
            if (v447 != objc_msgSend(v700, "obliviousHTTPType"))
              goto LABEL_433;
            v448 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v695, "obliviousTargets"));
            v449 = objc_msgSend(v448, "count");
            v450 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v700, "obliviousTargets"));
            v451 = v449 == objc_msgSend(v450, "count");

            if (!v451)
              goto LABEL_438;
            v757 = 0u;
            v758 = 0u;
            v755 = 0u;
            v756 = 0u;
            v706 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v695, "obliviousTargets"));
            v671 = objc_msgSend(v706, "countByEnumeratingWithState:objects:count:", &v755, v818, 16);
            if (!v671)
              goto LABEL_416;
            v669 = *(_QWORD *)v756;
            while (2)
            {
              v452 = 0;
              while (2)
              {
                if (*(_QWORD *)v756 != v669)
                {
                  v453 = v452;
                  objc_enumerationMutation(v706);
                  v452 = v453;
                }
                v673 = v452;
                v454 = *(void **)(*((_QWORD *)&v755 + 1) + 8 * v452);
                v751 = 0u;
                v752 = 0u;
                v753 = 0u;
                v754 = 0u;
                v714 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v700, "obliviousTargets"));
                objf = objc_msgSend(v714, "countByEnumeratingWithState:objects:count:", &v751, v817, 16);
                if (!objf)
                  goto LABEL_436;
                v722 = *(id *)v752;
LABEL_388:
                v455 = 0;
                while (1)
                {
                  if (*(id *)v752 != v722)
                    objc_enumerationMutation(v714);
                  v456 = *(void **)(*((_QWORD *)&v751 + 1) + 8 * v455);
                  v457 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v454, "targetHost"));
                  v458 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v456, "targetHost"));
                  v459 = v457;
                  v460 = v458;
                  v461 = (void *)v460;
                  if (v459 | v460)
                  {
                    v466 = (void *)v460;
                    v464 = v459;
                    if (!v459)
                      goto LABEL_410;
                    v466 = (void *)v460;
                    v464 = v459;
                    if (!v460)
                      goto LABEL_410;
                    v466 = (void *)v460;
                    v464 = v459;
                    if (!objc_msgSend((id)v459, "isEqual:", v460))
                      goto LABEL_410;
                  }

                  v462 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v454, "proxyURLPath"));
                  v463 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v456, "proxyURLPath"));
                  v464 = v462;
                  v465 = v463;
                  v466 = (void *)v465;
                  if (v464 | v465)
                  {
                    v471 = (void *)v465;
                    v469 = v464;
                    if (!v464)
                      goto LABEL_409;
                    v471 = (void *)v465;
                    v469 = v464;
                    if (!v465)
                      goto LABEL_409;
                    v471 = (void *)v465;
                    v469 = v464;
                    if (!objc_msgSend((id)v464, "isEqual:", v465))
                      goto LABEL_409;
                  }

                  v467 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v454, "processes"));
                  v468 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v456, "processes"));
                  v469 = v467;
                  v470 = v468;
                  v471 = (void *)v470;
                  if (v469 | v470
                    && (!v469 || !v470 || (objc_msgSend((id)v469, "isEqual:", v470) & 1) == 0))
                  {

LABEL_409:
LABEL_410:

                    goto LABEL_411;
                  }

                  v472 = objc_msgSend(v454, "proxyIndex");
                  if (v472 != objc_msgSend(v456, "proxyIndex"))
                    goto LABEL_409;
                  v473 = objc_msgSend(v454, "weight");
                  v474 = v473 == objc_msgSend(v456, "weight");

                  if (v474)
                    break;
LABEL_411:
                  if (objf == (id)++v455)
                  {
                    objf = objc_msgSend(v714, "countByEnumeratingWithState:objects:count:", &v751, v817, 16);
                    if (objf)
                      goto LABEL_388;
                    goto LABEL_436;
                  }
                }

                v452 = v673 + 1;
                if ((id)(v673 + 1) != v671)
                  continue;
                break;
              }
              v671 = objc_msgSend(v706, "countByEnumeratingWithState:objects:count:", &v755, v818, 16);
              if (v671)
                continue;
              break;
            }
LABEL_416:
            v662 = 1;
LABEL_437:

LABEL_438:
            v426 = v690 + 1;
          }
          while ((id)(v690 + 1) != v685);
          v685 = objc_msgSend(v676, "countByEnumeratingWithState:objects:count:", &v759, v819, 16);
          if (!v685)
          {

            if ((v662 & 1) == 0)
              goto LABEL_451;
            v424 = v652 + 1;
            if ((id)(v652 + 1) == v650)
            {
              v650 = objc_msgSend(v646, "countByEnumeratingWithState:objects:count:", &v763, v820, 16);
              if (!v650)
                goto LABEL_454;
              goto LABEL_367;
            }
            goto LABEL_368;
          }
        }
      }

LABEL_451:
      v483 = nplog_obj(v476, v477, v478);
      v484 = objc_claimAutoreleasedReturnValue(v483);
      if (os_log_type_enabled(v484, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v646;
        _os_log_impl((void *)&_mh_execute_header, v484, OS_LOG_TYPE_DEFAULT, "oblivious configs updated to %@", (uint8_t *)&buf, 0xCu);
      }

      sub_1000865CC((uint64_t)v679);
      v663 = 1;
LABEL_454:

    }
  }
  else
  {
    v479 = nplog_obj(v421, v422, v423);
    v480 = objc_claimAutoreleasedReturnValue(v479);
    if (os_log_type_enabled(v480, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v656;
      _os_log_impl((void *)&_mh_execute_header, v480, OS_LOG_TYPE_DEFAULT, "oblivious configs updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_1000865CC((uint64_t)v679);
    v663 = 1;
  }
  v485 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v486 = objc_msgSend(v485, "hasPreferredPathEnabledPercentage");
  v487 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  if (v486 == objc_msgSend(v487, "hasPreferredPathEnabledPercentage"))
  {
    v491 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
    v492 = objc_msgSend(v491, "preferredPathEnabledPercentage");
    v493 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
    LOBYTE(v492) = v492 == objc_msgSend(v493, "preferredPathEnabledPercentage");

    if ((v492 & 1) != 0)
      goto LABEL_461;
  }
  else
  {

  }
  v494 = nplog_obj(v488, v489, v490);
  v495 = objc_claimAutoreleasedReturnValue(v494);
  if (os_log_type_enabled(v495, OS_LOG_TYPE_DEFAULT))
  {
    v496 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
    v497 = objc_msgSend(v496, "hasPreferredPathEnabledPercentage");
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v497;
    _os_log_impl((void *)&_mh_execute_header, v495, OS_LOG_TYPE_DEFAULT, "preferred path enabled percentage changed to %u", (uint8_t *)&buf, 8u);

  }
  v663 = 1;
LABEL_461:
  v498 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  v701 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v498, "proxiedContentMaps"));

  v499 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v715 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v499, "proxiedContentMaps"));

  v500 = objc_msgSend(v701, "count");
  v501 = objc_msgSend(v715, "count");
  if (v500 == v501)
  {
    if (objc_msgSend(v701, "count"))
    {
      v749 = 0u;
      v750 = 0u;
      v747 = 0u;
      v748 = 0u;
      v686 = v701;
      v696 = (char *)objc_msgSend(v686, "countByEnumeratingWithState:objects:count:", &v747, v816, 16);
      if (!v696)
        goto LABEL_519;
      v691 = *(_QWORD *)v748;
LABEL_465:
      v504 = 0;
LABEL_466:
      if (*(_QWORD *)v748 != v691)
      {
        v505 = v504;
        objc_enumerationMutation(v686);
        v504 = v505;
      }
      v707 = v504;
      v506 = *(void **)(*((_QWORD *)&v747 + 1) + 8 * (_QWORD)v504);
      v743 = 0u;
      v744 = 0u;
      v745 = 0u;
      v746 = 0u;
      objg = v715;
      v507 = objc_msgSend(objg, "countByEnumeratingWithState:objects:count:", &v743, v815, 16);
      if (v507)
      {
        v508 = 0;
        v509 = *(_QWORD *)v744;
        while (1)
        {
          v510 = 0;
          do
          {
            v511 = v508;
            if (*(_QWORD *)v744 != v509)
              objc_enumerationMutation(objg);
            v512 = *(void **)(*((_QWORD *)&v743 + 1) + 8 * (_QWORD)v510);
            v513 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v506, "identifier"));
            v514 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v512, "identifier"));
            v515 = v513;
            v516 = v514;
            v517 = (void *)v516;
            if (v515 | v516 && (!v515 || !v516 || !objc_msgSend((id)v515, "isEqual:", v516)))
            {
              v529 = v517;
              v527 = v515;
LABEL_494:

LABEL_495:
              v508 = v511;
              goto LABEL_496;
            }

            v518 = objc_msgSend(v506, "enabled");
            if (v518 != objc_msgSend(v512, "enabled"))
              goto LABEL_495;
            v519 = objc_msgSend(v506, "systemProcessOnly");
            if (v519 != objc_msgSend(v512, "systemProcessOnly"))
              goto LABEL_495;
            v520 = objc_msgSend(v506, "matchExactHostnames");
            if (v520 != objc_msgSend(v512, "matchExactHostnames"))
              goto LABEL_495;
            v521 = objc_msgSend(v506, "isPrivacyProxy");
            if (v521 != objc_msgSend(v512, "isPrivacyProxy"))
              goto LABEL_495;
            v522 = objc_msgSend(v506, "proxiesCount");
            if (v522 != objc_msgSend(v512, "proxiesCount"))
              goto LABEL_495;
            v523 = objc_msgSend(v506, "hasResolver");
            if (v523 != objc_msgSend(v512, "hasResolver"))
              goto LABEL_495;
            v524 = objc_msgSend(v506, "resolver");
            if (v524 != objc_msgSend(v512, "resolver"))
              goto LABEL_495;
            v525 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v506, "hostnames"));
            v526 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v512, "hostnames"));
            v527 = v525;
            v528 = v526;
            v529 = (void *)v528;
            if (v527 | v528 && (!v527 || !v528 || !objc_msgSend((id)v527, "isEqual:", v528)))
            {
              v517 = v529;
              v515 = v527;
              goto LABEL_494;
            }

            v530 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v506, "processes"));
            v531 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v512, "processes"));
            v515 = v530;
            v532 = v531;
            v517 = (void *)v532;
            if (v515 | v532 && (!v515 || !v532 || (objc_msgSend((id)v515, "isEqual:", v532) & 1) == 0))
            {

              goto LABEL_494;
            }

            v723 = objc_msgSend(v506, "hasPercentEnabled");
            if (v723 != objc_msgSend(v512, "hasPercentEnabled"))
              goto LABEL_494;
            v724 = objc_msgSend(v506, "percentEnabled");
            v725 = v724 == objc_msgSend(v512, "percentEnabled");

            if (!v725)
              goto LABEL_495;
            if (objc_msgSend(v506, "proxiesCount"))
            {
              v533 = 0;
              while (1)
              {
                v534 = *((_DWORD *)objc_msgSend(v506, "proxies") + v533);
                if (v534 != *((_DWORD *)objc_msgSend(v512, "proxies") + v533))
                  goto LABEL_495;
                ++v533;
                v508 = 1;
                if (v533 >= (unint64_t)objc_msgSend(v506, "proxiesCount"))
                  goto LABEL_496;
              }
            }
            v508 = 1;
LABEL_496:
            v510 = (char *)v510 + 1;
          }
          while (v510 != v507);
          v535 = objc_msgSend(objg, "countByEnumeratingWithState:objects:count:", &v743, v815, 16);
          v507 = v535;
          if (!v535)
          {

            if ((v508 & 1) == 0)
              goto LABEL_516;
            v504 = v707 + 1;
            if (v707 + 1 == v696)
            {
              v696 = (char *)objc_msgSend(v686, "countByEnumeratingWithState:objects:count:", &v747, v816, 16);
              if (!v696)
                goto LABEL_519;
              goto LABEL_465;
            }
            goto LABEL_466;
          }
        }
      }

LABEL_516:
      v541 = nplog_obj(v536, v537, v538);
      v542 = objc_claimAutoreleasedReturnValue(v541);
      if (os_log_type_enabled(v542, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v686;
        _os_log_impl((void *)&_mh_execute_header, v542, OS_LOG_TYPE_DEFAULT, "proxied content maps updated to %@", (uint8_t *)&buf, 0xCu);
      }

      sub_1000865CC((uint64_t)v679);
      v663 = 1;
LABEL_519:

    }
  }
  else
  {
    v539 = nplog_obj(v501, v502, v503);
    v540 = objc_claimAutoreleasedReturnValue(v539);
    if (os_log_type_enabled(v540, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v701;
      _os_log_impl((void *)&_mh_execute_header, v540, OS_LOG_TYPE_DEFAULT, "proxied content maps updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_1000865CC((uint64_t)v679);
    v663 = 1;
  }
  v543 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashSharingEnabledStatus](v678, "geohashSharingEnabledStatus"));
  v544 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "geohashSharingEnabledStatus"));
  v545 = sub_10008C2E0(v543, v544);

  if (v545)
  {
    v549 = nplog_obj(v546, v547, v548);
    v550 = objc_claimAutoreleasedReturnValue(v549);
    if (os_log_type_enabled(v550, OS_LOG_TYPE_DEFAULT))
    {
      v551 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashSharingEnabledStatus](v678, "geohashSharingEnabledStatus"));
      v552 = objc_msgSend(v551, "BOOLValue");
      v553 = "disabled";
      if (v552)
        v553 = "enabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v553;
      _os_log_impl((void *)&_mh_execute_header, v550, OS_LOG_TYPE_DEFAULT, "Geohash sharing preference changed to %s", (uint8_t *)&buf, 0xCu);

    }
    sub_10008687C((uint64_t)v679);
    v663 = 1;
  }
  v554 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v678, "geohashOverride"));
  v555 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "geohashOverride"));
  if (v554 == v555)
  {

  }
  else
  {
    v556 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v678, "geohashOverride"));
    v557 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "geohashOverride"));
    v558 = objc_msgSend(v556, "isEqualToString:", v557);

    if ((v558 & 1) == 0)
    {
      v562 = nplog_obj(v559, v560, v561);
      v563 = objc_claimAutoreleasedReturnValue(v562);
      if (os_log_type_enabled(v563, OS_LOG_TYPE_DEFAULT))
      {
        v564 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v678, "geohashOverride"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v564;
        _os_log_impl((void *)&_mh_execute_header, v563, OS_LOG_TYPE_DEFAULT, "Geohash override changed to %@", (uint8_t *)&buf, 0xCu);

      }
      sub_10008687C((uint64_t)v679);
      v663 = 1;
    }
  }
  v565 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration epoch](v678, "epoch"));
  v566 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "epoch"));
  v567 = sub_10008C2E0(v565, v566);

  if (v567)
  {
    v571 = nplog_obj(v568, v569, v570);
    v572 = objc_claimAutoreleasedReturnValue(v571);
    if (os_log_type_enabled(v572, OS_LOG_TYPE_DEFAULT))
    {
      v573 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration epoch](v678, "epoch"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v573;
      _os_log_impl((void *)&_mh_execute_header, v572, OS_LOG_TYPE_DEFAULT, "Configuration epoch changed to %@", (uint8_t *)&buf, 0xCu);

    }
    sub_1000869B4((uint64_t)v679);
    v663 = 1;
  }
  v574 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration preferredPathRoutingEnabledStatus](v678, "preferredPathRoutingEnabledStatus"));
  v575 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "preferredPathRoutingEnabledStatus"));
  v576 = sub_10008C2E0(v574, v575);

  if (v576)
  {
    v580 = nplog_obj(v577, v578, v579);
    v581 = objc_claimAutoreleasedReturnValue(v580);
    if (os_log_type_enabled(v581, OS_LOG_TYPE_DEFAULT))
    {
      v582 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration preferredPathRoutingEnabledStatus](v678, "preferredPathRoutingEnabledStatus"));
      v583 = objc_msgSend(v582, "BOOLValue");
      v584 = "disabled";
      if (v583)
        v584 = "enabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v584;
      _os_log_impl((void *)&_mh_execute_header, v581, OS_LOG_TYPE_DEFAULT, "Preferred path routing enabled changed to %s", (uint8_t *)&buf, 0xCu);

    }
    v663 = 1;
  }
  v585 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensEnabledStatus](v678, "privateAccessTokensEnabledStatus"));
  v586 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "privateAccessTokensEnabledStatus"));
  v587 = sub_10008C2E0(v585, v586);

  if (v587)
  {
    v591 = nplog_obj(v588, v589, v590);
    v592 = objc_claimAutoreleasedReturnValue(v591);
    if (os_log_type_enabled(v592, OS_LOG_TYPE_DEFAULT))
    {
      v593 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensEnabledStatus](v678, "privateAccessTokensEnabledStatus"));
      v594 = objc_msgSend(v593, "BOOLValue");
      v595 = "disabled";
      if (v594)
        v595 = "enabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v595;
      _os_log_impl((void *)&_mh_execute_header, v592, OS_LOG_TYPE_DEFAULT, "Private access tokens preference changed to %s", (uint8_t *)&buf, 0xCu);

    }
    sub_100086AEC((uint64_t)v679);
    v663 = 1;
  }
  v596 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensAllowTools](v678, "privateAccessTokensAllowTools"));
  v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "privateAccessTokensAllowTools"));
  v598 = sub_10008C2E0(v596, v597);

  if (v598)
  {
    v602 = nplog_obj(v599, v600, v601);
    v603 = objc_claimAutoreleasedReturnValue(v602);
    if (os_log_type_enabled(v603, OS_LOG_TYPE_DEFAULT))
    {
      v604 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration privateAccessTokensAllowTools](v678, "privateAccessTokensAllowTools"));
      v605 = objc_msgSend(v604, "BOOLValue");
      v606 = "disallowed";
      if (v605)
        v606 = "allowed";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v606;
      _os_log_impl((void *)&_mh_execute_header, v603, OS_LOG_TYPE_DEFAULT, "Private access tokens allow tools changed to %s", (uint8_t *)&buf, 0xCu);

    }
    v663 = 1;
  }
  v607 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration inProcessFlowDivert](v678, "inProcessFlowDivert"));
  v608 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "inProcessFlowDivert"));
  v609 = sub_10008C2E0(v607, v608);

  if (v609)
  {
    v613 = nplog_obj(v610, v611, v612);
    v614 = objc_claimAutoreleasedReturnValue(v613);
    if (os_log_type_enabled(v614, OS_LOG_TYPE_DEFAULT))
    {
      v615 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration inProcessFlowDivert](v678, "inProcessFlowDivert"));
      v616 = objc_msgSend(v615, "BOOLValue");
      v617 = "disabled";
      if (v616)
        v617 = "enabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v617;
      _os_log_impl((void *)&_mh_execute_header, v614, OS_LOG_TYPE_DEFAULT, "In-process flow divert support changed to %s", (uint8_t *)&buf, 0xCu);

    }
    v663 = 1;
  }
  v618 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v678, "proxyConfiguration"));
  objh = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v618, "trustedNetworkDiscoveredProxies"));

  v619 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "proxyConfiguration"));
  v620 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v619, "trustedNetworkDiscoveredProxies"));

  v621 = objc_msgSend(objh, "count");
  if (v621 == objc_msgSend(v620, "count"))
  {
    if (objc_msgSend(objh, "count"))
    {
      v741 = 0u;
      v742 = 0u;
      v739 = 0u;
      v740 = 0u;
      v622 = objh;
      v623 = objc_msgSend(v622, "countByEnumeratingWithState:objects:count:", &v739, v814, 16);
      if (v623)
      {
        v624 = *(_QWORD *)v740;
        while (1)
        {
          v625 = 0;
LABEL_565:
          if (*(_QWORD *)v740 != v624)
            objc_enumerationMutation(v622);
          v626 = *(void **)(*((_QWORD *)&v739 + 1) + 8 * v625);
          v735 = 0u;
          v736 = 0u;
          v737 = 0u;
          v738 = 0u;
          v627 = v620;
          v628 = objc_msgSend(v627, "countByEnumeratingWithState:objects:count:", &v735, v813, 16);
          if (!v628)
            break;
          v629 = *(_QWORD *)v736;
LABEL_569:
          v630 = 0;
          while (1)
          {
            if (*(_QWORD *)v736 != v629)
              objc_enumerationMutation(v627);
            if ((objc_msgSend(v626, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v735 + 1) + 8 * v630)) & 1) != 0)
              break;
            if (v628 == (id)++v630)
            {
              v628 = objc_msgSend(v627, "countByEnumeratingWithState:objects:count:", &v735, v813, 16);
              if (v628)
                goto LABEL_569;
              goto LABEL_580;
            }
          }

          if ((id)++v625 != v623)
            goto LABEL_565;
          v623 = objc_msgSend(v622, "countByEnumeratingWithState:objects:count:", &v739, v814, 16);
          if (!v623)
            goto LABEL_581;
        }
LABEL_580:

        sub_1000865CC((uint64_t)v679);
        v663 = 1;
      }
LABEL_581:

    }
  }
  else
  {
    sub_1000865CC((uint64_t)v679);
    v663 = 1;
  }
  v631 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration lastPrivateCloudComputeEnvironment](v678, "lastPrivateCloudComputeEnvironment"));
  v632 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v677, "lastPrivateCloudComputeEnvironment"));
  v633 = sub_10008C2E0(v631, v632);

  if (((v633 | v663) & 1) != 0)
    goto LABEL_128;
LABEL_137:

}

- (void)setConfigurationTrialVersion:(int64_t)a3
{
  NSPConfigurationManager *v4;
  void *v5;
  id v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager trialConfigVersion](self, "trialConfigVersion"));
  v6 = objc_msgSend(v5, "longValue");

  if (v6 != (id)a3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3));
    objc_msgSend(v9, "setTrialConfigVersion:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (void)configurationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSPConfigurationManager *v4;
  void *v5;
  unsigned int v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager enabled](self, "enabled"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "setEnabled:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (void)setResetDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSPConfiguration *configuration;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;

  v6 = a3;
  if (v6)
  {
    if (self)
      configuration = self->_configuration;
    else
      configuration = 0;
    v8 = -[NSPConfiguration copy](configuration, "copy");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "willResetSubscriberTierTomorrow"));

    if (!v9)
      objc_msgSend(v8, "setWillResetSubscriberTierTomorrow:", &off_1000FF7A0);
    objc_msgSend(v8, "setResetTomorrowDate:", v6);
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v8);

  }
  else
  {
    v10 = nplog_obj(0, v4, v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315138;
      v13 = "-[NSPConfigurationManager setResetDate:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null resetDate", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)clearResetDate
{
  NSPConfigurationManager *v2;
  id v3;

  v2 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v3 = -[NSPConfigurationManager copy](self, "copy");
  objc_msgSend(v3, "setWillResetSubscriberTierTomorrow:", &off_1000FF7A0);
  objc_msgSend(v3, "setResetTomorrowDate:", 0);
  -[NSPConfigurationManager updateConfiguration:](v2, "updateConfiguration:", v3);

}

- (BOOL)setUserTier:(unint64_t)a3 resetDate:(id)a4 clearResetDate:(BOOL)a5 changeSource:(unint64_t)a6
{
  _BOOL4 v7;
  id v10;
  NSPConfiguration *configuration;
  void *v12;
  id v13;
  NSPConfiguration *v14;
  void *v15;
  unsigned int v16;
  NSPConfiguration *v17;
  id v18;
  NSPConfiguration *v19;
  NSPConfiguration *v20;
  uint64_t v21;
  void *v22;
  NSPConfiguration *v23;
  void *v24;
  unsigned int v25;
  NSPConfiguration *v26;
  void *v27;
  unsigned __int8 v28;
  BOOL v29;
  NSPConfiguration *v30;
  id v31;
  NSPConfiguration *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSPConfiguration *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSPConfiguration *v45;
  id v46;
  void *v47;
  void *v48;
  _UNKNOWN **v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v54;
  uint8_t buf[4];
  void *v56;

  v7 = a5;
  v10 = a4;
  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](configuration, "userTier"));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  if (v13 != (id)a3)
  {
    if (self)
      v19 = self->_configuration;
    else
      v19 = 0;
    v20 = v19;
    v21 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v20, "cloudSubscriptionCheckEnabled"));
    if (v21)
    {
      v22 = (void *)v21;
      if (self)
        v23 = self->_configuration;
      else
        v23 = 0;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration cloudSubscriptionCheckEnabled](v23, "cloudSubscriptionCheckEnabled"));
      v25 = objc_msgSend(v24, "BOOLValue");

      if (!v25)
      {
LABEL_37:
        if (self)
          v45 = self->_configuration;
        else
          v45 = 0;
        v46 = -[NSPConfiguration copy](v45, "copy");
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
        objc_msgSend(v46, "setUserTier:", v47);

        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
        objc_msgSend(v46, "setUserPreferredTier:", v48);

        if (a3 == 2)
        {
          if (a6 == 1)
          {
            v49 = &off_1000FF7A0;
            goto LABEL_49;
          }
          if (a6 == 3)
          {
            v49 = &off_1000FF7B8;
LABEL_49:
            objc_msgSend(v46, "setSubscriberEnabledFromNonSettingsApp:", v49);
          }
        }
        else if (a3 == 1 && v10)
        {
          objc_msgSend(v46, "setWillResetSubscriberTierTomorrow:", &off_1000FF7B8);
          v50 = v46;
          v51 = v10;
          goto LABEL_52;
        }
        objc_msgSend(v46, "setWillResetSubscriberTierTomorrow:", &off_1000FF7A0);
        if (!v7)
        {
LABEL_53:
          -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v46);

LABEL_54:
          v29 = 1;
          goto LABEL_55;
        }
        v50 = v46;
        v51 = 0;
LABEL_52:
        objc_msgSend(v50, "setResetTomorrowDate:", v51);
        goto LABEL_53;
      }
    }
    else
    {

    }
    if (self)
      v32 = self->_configuration;
    else
      v32 = 0;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v32, "proxyAccountType"));

    if (v33)
    {
      if (self)
        v37 = self->_configuration;
      else
        v37 = 0;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v37, "proxyAccountType"));
      v39 = objc_msgSend(v38, "unsignedIntegerValue");

      if (a3 != 2 || v39 != (id)1)
        goto LABEL_37;
      v43 = nplog_obj(v40, v41, v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "invalid to set subscriber tier for free account type", buf, 2u);
      }
    }
    else
    {
      v52 = nplog_obj(v34, v35, v36);
      v44 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        if (a3 >= 3)
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), a3));
        else
          v54 = *(&off_1000F6AF0 + (int)a3);
        *(_DWORD *)buf = 138412290;
        v56 = v54;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "invalid to set %@ tier until proxy account type is available", buf, 0xCu);

      }
    }

    v29 = 0;
    goto LABEL_55;
  }
  if (self)
    v14 = self->_configuration;
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration willResetSubscriberTierTomorrow](v14, "willResetSubscriberTierTomorrow"));
  v16 = objc_msgSend(v15, "BOOLValue");

  if (!v10 && v16)
  {
    if (self)
      v17 = self->_configuration;
    else
      v17 = 0;
    v18 = -[NSPConfiguration copy](v17, "copy");
    objc_msgSend(v18, "setWillResetSubscriberTierTomorrow:", &off_1000FF7A0);
    if (v7)
      objc_msgSend(v18, "setResetTomorrowDate:", 0);
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v18);

    goto LABEL_54;
  }
  if (self)
    v26 = self->_configuration;
  else
    v26 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration willResetSubscriberTierTomorrow](v26, "willResetSubscriberTierTomorrow"));
  v28 = objc_msgSend(v27, "BOOLValue");

  v29 = 1;
  if (v10 && (v28 & 1) == 0)
  {
    if (self)
      v30 = self->_configuration;
    else
      v30 = 0;
    v31 = -[NSPConfiguration copy](v30, "copy");
    objc_msgSend(v31, "setWillResetSubscriberTierTomorrow:", &off_1000FF7B8);
    objc_msgSend(v31, "setResetTomorrowDate:", v10);
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v31);

    goto LABEL_54;
  }
LABEL_55:

  return v29;
}

- (void)setProxyAccountType:(unint64_t)a3 unlimited:(BOOL)a4
{
  _BOOL8 v4;
  NSPConfiguration *configuration;
  NSPConfiguration *v8;
  void *v9;
  NSPConfiguration *v10;
  void *v11;
  unsigned int v12;
  NSPConfiguration *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSPConfiguration *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;

  if (a3)
  {
    v4 = a4;
    if (self)
      configuration = self->_configuration;
    else
      configuration = 0;
    v8 = configuration;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountType](v8, "proxyAccountType"));
    if (objc_msgSend(v9, "unsignedIntegerValue") == (id)a3)
    {
      if (self)
        v10 = self->_configuration;
      else
        v10 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyAccountUnlimited](v10, "proxyAccountUnlimited"));
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12 == v4)
        return;
    }
    else
    {

    }
    if (self)
      v13 = self->_configuration;
    else
      v13 = 0;
    v21 = -[NSPConfiguration copy](v13, "copy");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v21, "setProxyAccountType:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    objc_msgSend(v21, "setProxyAccountUnlimited:", v15);

    if (a3 == 2)
    {
      if (self)
        v17 = self->_configuration;
      else
        v17 = 0;
      v16 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](v17, "userPreferredTier"));
    }
    else
    {
      if (a3 != 1)
      {
LABEL_19:
        -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v21);

        return;
      }
      v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
    }
    v18 = (void *)v16;
    objc_msgSend(v21, "setUserTier:", v16);

    goto LABEL_19;
  }
  v19 = nplog_obj(self, a2, 0);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[NSPConfigurationManager setProxyAccountType:unlimited:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null proxyAccountType", buf, 0xCu);
  }

}

- (void)setGeohashSharingPreference:(BOOL)a3
{
  _BOOL8 v3;
  NSPConfigurationManager *v4;
  void *v5;
  unsigned int v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "setGeohashSharingEnabledStatus:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (BOOL)getGeohashSharingPreference
{
  void *v2;
  unsigned __int8 v3;

  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setGeohashOverride:(id)a3
{
  NSPConfiguration *configuration;
  NSPConfiguration *v5;
  id v6;
  NSPConfiguration *v7;
  void *v8;
  unsigned __int8 v9;
  NSPConfiguration *v10;
  id v11;

  v11 = a3;
  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v5 = configuration;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v5, "geohashOverride"));
  if (v6 == v11)
  {

LABEL_11:
    goto LABEL_12;
  }
  if (self)
    v7 = self->_configuration;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v7, "geohashOverride"));
  v9 = objc_msgSend(v8, "isEqualToString:", v11);

  if ((v9 & 1) == 0)
  {
    if (self)
      v10 = self->_configuration;
    else
      v10 = 0;
    v5 = (NSPConfiguration *)-[NSPConfiguration copy](v10, "copy");
    -[NSPConfiguration setGeohashOverride:](v5, "setGeohashOverride:", v11);
    -[NSPConfigurationManager updateConfiguration:](self, "updateConfiguration:", v5);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)setPreferredPathRoutingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSPConfigurationManager *v4;
  void *v5;
  unsigned int v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager preferredPathRoutingEnabledStatus](self, "preferredPathRoutingEnabledStatus"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "setPreferredPathRoutingEnabledStatus:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (void)setPrivateAccessTokensEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSPConfigurationManager *v4;
  void *v5;
  unsigned int v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "setPrivateAccessTokensEnabledStatus:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (BOOL)getPrivateAccessTokensEnabled
{
  void *v2;
  unsigned __int8 v3;

  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPrivateAccessTokensAllowTools:(BOOL)a3
{
  _BOOL8 v3;
  NSPConfigurationManager *v4;
  void *v5;
  unsigned int v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager privateAccessTokensAllowTools](self, "privateAccessTokensAllowTools"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "setPrivateAccessTokensAllowTools:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (void)setInProcessFlowDivert:(BOOL)a3
{
  _BOOL8 v3;
  NSPConfigurationManager *v4;
  void *v5;
  unsigned int v6;
  NSPConfiguration *configuration;
  void *v8;
  id v9;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager inProcessFlowDivert](self, "inProcessFlowDivert"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v4)
      configuration = v4->_configuration;
    else
      configuration = 0;
    v9 = -[NSPConfiguration copy](configuration, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "setInProcessFlowDivert:", v8);

    -[NSPConfigurationManager updateConfiguration:](v4, "updateConfiguration:", v9);
  }
}

- (unint64_t)getPrivacyProxyAccountType
{
  void *v2;
  id v3;

  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyAccountType](self, "proxyAccountType"));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4
{
  NSPConfigurationManager *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSPConfiguration *configuration;
  void *v11;
  id v12;
  NSPConfiguration *v13;
  NSPConfiguration *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;

  v6 = self;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyTrafficState](self, "proxyTrafficState"));
  v8 = (unint64_t)objc_msgSend(v7, "unsignedLongLongValue");

  v9 = v8 & ~a3 | a4 & a3;
  if (v6)
    configuration = v6->_configuration;
  else
    configuration = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](configuration, "proxyTrafficState"));
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  if (v12 != (id)v9)
  {
    if (v6)
      v13 = v6->_configuration;
    else
      v13 = 0;
    v19 = -[NSPConfiguration copy](v13, "copy");
    if ((v9 & 0x20000) != 0)
    {
      if (v6)
        v14 = v6->_configuration;
      else
        v14 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v14, "proxyTrafficState"));
      v16 = objc_msgSend(v15, "unsignedLongLongValue");

      if ((v16 & 0x20000) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        objc_msgSend(v19, "setAnyAppEnabledDate:", v17);

      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
    objc_msgSend(v19, "setProxyTrafficState:", v18);

    -[NSPConfigurationManager updateConfiguration:](v6, "updateConfiguration:", v19);
  }
}

- (void)refreshConfigurationWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSPConfiguration *configuration;
  NSPConfiguration *v8;
  void *v9;
  NSPConfiguration *v10;
  NSPConfiguration *v11;
  void *v12;
  NSPConfiguration *v13;
  NSPConfiguration *v14;
  uint64_t v15;
  void *v16;
  NSPConfiguration *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[16];

  v6 = a4;
  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v8 = configuration;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](v8, "enabled"));
  if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
    goto LABEL_15;
  if (self)
    v10 = self->_configuration;
  else
    v10 = 0;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerEnabled](v11, "configServerEnabled"));
  if (!objc_msgSend(v12, "BOOLValue"))
  {

LABEL_15:
    goto LABEL_16;
  }
  if (self)
    v13 = self->_configuration;
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v14, "resurrectionDate"));
  if (v15)
  {
    v16 = (void *)v15;
    if (self)
      v17 = self->_configuration;
    else
      v17 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration resurrectionDate](v17, "resurrectionDate"));
    objc_msgSend(v18, "timeIntervalSinceNow");
    v20 = v19;

    if (v20 >= 0.0)
      goto LABEL_16;
  }
  else
  {

  }
  v24 = nplog_obj(v21, v22, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Refresh configuration", buf, 2u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10008D540;
  v26[3] = &unk_1000F68A8;
  v27 = v6;
  sub_100084218((uint64_t)self, (void *)a3, v26);

LABEL_16:
}

- (unint64_t)configurationSubscriberPoliciesCount
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (self)
    self = (NSPConfigurationManager *)self->_configuration;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager proxyConfiguration](self, "proxyConfiguration", (_QWORD)v10));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "policyTierMaps"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "tier") == 2)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "policy"));
          v4 = objc_msgSend(v8, "conditionsCount");

          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return (unint64_t)v4;
}

- (void)handlePathChange:(id)a3
{
  id v5;
  NWPath *path;
  id v7;
  void *v8;
  NSDictionary *networkCharacteristics;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t configFetchRetryAttempt;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_path, a3);
    path = self->_path;
  }
  else
  {
    path = 0;
  }
  v7 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:](NPUtilities, "copyCurrentNetworkCharacteristicsForPath:", path);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Signature")));
  if (self)
    networkCharacteristics = self->_networkCharacteristics;
  else
    networkCharacteristics = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](networkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature")));
  v11 = v8;
  v12 = v10;
  v13 = (void *)v12;
  if (v11 | v12 && (v11 ? (v14 = v12 == 0) : (v14 = 1), v14 || !objc_msgSend((id)v11, "isEqual:", v12)))
  {

    v18 = nplog_obj(v15, v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "config manager: network signature changed", buf, 2u);
    }

    if (self)
    {
      objc_storeStrong((id *)&self->_networkCharacteristics, v7);
      if (objc_msgSend(v5, "status") == (id)1 && self->_configFetchOnNetworkChange)
      {
        v22 = nplog_obj(1, v20, v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Retry fetching configuration", buf, 2u);
        }

        configFetchRetryAttempt = self->_configFetchRetryAttempt;
        sub_100084B74((uint64_t)self, v25, v26);
        self->_configFetchRetryAttempt = configFetchRetryAttempt;
        *(_QWORD *)buf = 0;
        v29 = buf;
        v30 = 0x3032000000;
        v31 = sub_10000314C;
        v32 = sub_1000841FC;
        v33 = (id)os_transaction_create("com.apple.networkserviceproxy.configManagerHandlePathChange");
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10008D34C;
        v27[3] = &unk_1000F6170;
        v27[4] = buf;
        sub_100084218((uint64_t)self, (void *)0xA, v27);
        _Block_object_dispose(buf, 8);

      }
    }
    else
    {
      objc_msgSend(v5, "status");
    }
  }
  else
  {

  }
}

- (void)setup
{
  _QWORD *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[2];
  void (*v20)(uint64_t, int);
  void *v21;
  NSPConfigurationManager *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 buf;
  void *v28;
  void *v29;
  NSPConfigurationManager *v30;
  id v31;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v20 = sub_10008DE8C;
  v21 = &unk_1000F5720;
  v22 = self;
  v3 = v19;
  if (self)
  {
    if (os_variant_has_internal_diagnostics("com.apple.networkserviceproxy"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getSavedPrivateCloudComputeEnvironment"));

      if (!v5)
      {
        v23 = 0;
        v24 = &v23;
        v25 = 0x2050000000;
        v11 = (void *)qword_100112EF0;
        v26 = qword_100112EF0;
        if (!qword_100112EF0)
        {
          *(_QWORD *)&buf = _NSConcreteStackBlock;
          *((_QWORD *)&buf + 1) = 3221225472;
          v28 = sub_1000909DC;
          v29 = &unk_1000F58B0;
          v30 = (NSPConfigurationManager *)&v23;
          sub_1000909DC((uint64_t)&buf);
          v11 = (void *)v24[3];
        }
        v12 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v23, 8);
        v15 = objc_alloc_init(v12);
        if (v15)
        {
          *(_QWORD *)&buf = _NSConcreteStackBlock;
          *((_QWORD *)&buf + 1) = 3221225472;
          v28 = sub_10008D940;
          v29 = &unk_1000F6920;
          v16 = v3;
          v30 = self;
          v31 = v16;
          objc_msgSend(v15, "selectedEnvironmentNameWithCompletionHandler:", &buf);

          goto LABEL_8;
        }
        v17 = nplog_obj(0, v13, v14);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create PCCServerEnvironment", (uint8_t *)&buf, 2u);
        }

      }
      v9 = nplog_obj(v6, v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Has saved private cloud compute environment \"%@\", (uint8_t *)&buf, 0xCu);
      }

    }
    v20((uint64_t)v3, 0);
  }
LABEL_8:

}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  NSPConfigurationManager *v8;

  v4 = nplog_obj(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dealloc: \nConfiguration: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)NSPConfigurationManager;
  -[NSPConfigurationManager dealloc](&v6, "dealloc");
}

- (NSPConfigurationManager)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSPConfigurationManager *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSPConfigurationManager *v17;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    v20 = nplog_obj(v7, v8, v9);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
LABEL_12:

      v17 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NSPConfigurationManager initWithDelegate:configuration:]";
    v22 = "%s called with null delegate";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v22, buf, 0xCu);
    goto LABEL_12;
  }
  if (!v7)
  {
    v23 = nplog_obj(0, v8, v9);
    v21 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NSPConfigurationManager initWithDelegate:configuration:]";
    v22 = "%s called with null configuration";
    goto LABEL_14;
  }
  v24.receiver = self;
  v24.super_class = (Class)NSPConfigurationManager;
  v11 = -[NSPConfigurationManager init](&v24, "init");
  v12 = (uint64_t)v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    objc_storeStrong((id *)(v12 + 32), a4);
    *(_QWORD *)(v12 + 16) = sub_10008C254(v12);
    ++*(_QWORD *)(v12 + 56);
    sub_100085CA0(v12);
    v13 = +[NPUtilities copyTrueClientIPAddressFromPreferences](NPUtilities, "copyTrueClientIPAddressFromPreferences");
    v14 = *(void **)(v12 + 120);
    *(_QWORD *)(v12 + 120) = v13;

    v15 = nplog_large_obj();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(const char **)(v12 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Configuration state: %@", buf, 0xCu);
    }

  }
  self = (NSPConfigurationManager *)(id)v12;
  v17 = self;
LABEL_8:

  return v17;
}

- (BOOL)environmentUsesNonDefaultServer
{
  return os_variant_has_internal_diagnostics("com.apple.networkserviceproxy")
      && sub_10008FE9C((uint64_t)self) > 2;
}

- (void)publishDailyConfigurationStats
{
  void *v3;
  NSPConfiguration *configuration;
  void *v5;
  NSPConfiguration *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSPConfiguration *v10;
  void *v11;
  unsigned int v12;
  NSPConfigurationStats *v13;
  void *v14;
  NSPConfigurationStats *v15;

  v15 = objc_alloc_init(NSPConfigurationStats);
  if (self)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](self->_configuration, "proxyConfiguration"));
    -[NSPConfigurationStats setConfigurationVersion:](v15, "setConfigurationVersion:", objc_msgSend(v3, "version"));

    configuration = self->_configuration;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "proxyConfiguration"));
    -[NSPConfigurationStats setConfigurationVersion:](v15, "setConfigurationVersion:", objc_msgSend(v14, "version"));

    configuration = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration enabled](configuration, "enabled"));
  -[NSPConfigurationStats setConfigurationEnabled:](v15, "setConfigurationEnabled:", objc_msgSend(v5, "BOOLValue"));

  if (self)
    v6 = self->_configuration;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v6, "proxyConfiguration"));
  -[NSPConfigurationStats setTokenFetchEnabled:](v15, "setTokenFetchEnabled:", objc_msgSend(v7, "enabled"));

  v8 = -[NSPConfigurationManager effectiveUserTier](self, "effectiveUserTier");
  if (v8 >= 3)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v8));
  else
    v9 = *(&off_1000F6AF0 + (int)v8);
  -[NSPConfigurationStats setTierType:](v15, "setTierType:", v9);

  if (self)
    v10 = self->_configuration;
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyTrafficState](v10, "proxyTrafficState"));
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  if ((v12 & 1) != 0)
    -[NSPConfigurationStats setSafariUnencryptedEnabled:](v15, "setSafariUnencryptedEnabled:", 1);
  v13 = v15;
  if ((v12 & 2) != 0)
  {
    -[NSPConfigurationStats setSafariDNSEnabled:](v15, "setSafariDNSEnabled:", 1);
    v13 = v15;
    if ((v12 & 4) == 0)
    {
LABEL_14:
      if ((v12 & 8) == 0)
        goto LABEL_15;
      goto LABEL_41;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_14;
  }
  -[NSPConfigurationStats setSafariTrackersEnabled:](v15, "setSafariTrackersEnabled:", 1);
  v13 = v15;
  if ((v12 & 8) == 0)
  {
LABEL_15:
    if ((v12 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  -[NSPConfigurationStats setSafariAllEnabled:](v15, "setSafariAllEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x10) == 0)
  {
LABEL_16:
    if ((v12 & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  -[NSPConfigurationStats setSafariHTTPEnabled:](v15, "setSafariHTTPEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x40000) == 0)
  {
LABEL_17:
    if ((v12 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  -[NSPConfigurationStats setSafariPrivateUnencryptedEnabled:](v15, "setSafariPrivateUnencryptedEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x80000) == 0)
  {
LABEL_18:
    if ((v12 & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  -[NSPConfigurationStats setSafariPrivateDNSEnabled:](v15, "setSafariPrivateDNSEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x100000) == 0)
  {
LABEL_19:
    if ((v12 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  -[NSPConfigurationStats setSafariPrivateAllEnabled:](v15, "setSafariPrivateAllEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x200000) == 0)
  {
LABEL_20:
    if ((v12 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  -[NSPConfigurationStats setSafariMetricsEnabled:](v15, "setSafariMetricsEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x20) == 0)
  {
LABEL_21:
    if ((v12 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  -[NSPConfigurationStats setMailTrackersEnabled:](v15, "setMailTrackersEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x40) == 0)
  {
LABEL_22:
    if ((v12 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  -[NSPConfigurationStats setUnencryptedEnabled:](v15, "setUnencryptedEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x80) == 0)
  {
LABEL_23:
    if ((v12 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  -[NSPConfigurationStats setDnsEnabled:](v15, "setDnsEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x100) == 0)
  {
LABEL_24:
    if ((v12 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  -[NSPConfigurationStats setKnownTrackersEnabled:](v15, "setKnownTrackersEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x200) == 0)
  {
LABEL_25:
    if ((v12 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  -[NSPConfigurationStats setAppTrackersEnabled:](v15, "setAppTrackersEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x400) == 0)
  {
LABEL_26:
    if ((v12 & 0x10000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  -[NSPConfigurationStats setNewsURLResolutionEnabled:](v15, "setNewsURLResolutionEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x10000) == 0)
  {
LABEL_27:
    if ((v12 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_54;
  }
LABEL_53:
  -[NSPConfigurationStats setNewsEmbeddedContentEnabled:](v15, "setNewsEmbeddedContentEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x800) == 0)
  {
LABEL_28:
    if ((v12 & 0x1000) == 0)
      goto LABEL_29;
    goto LABEL_55;
  }
LABEL_54:
  -[NSPConfigurationStats setExposureNotificationsEnabled:](v15, "setExposureNotificationsEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x1000) == 0)
  {
LABEL_29:
    if ((v12 & 0x2000) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_55:
  -[NSPConfigurationStats setAppleCertificatesEnabled:](v15, "setAppleCertificatesEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x2000) == 0)
  {
LABEL_30:
    if ((v12 & 0x4000) == 0)
      goto LABEL_31;
    goto LABEL_57;
  }
LABEL_56:
  -[NSPConfigurationStats setNetworkToolsEnabled:](v15, "setNetworkToolsEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x4000) == 0)
  {
LABEL_31:
    if ((v12 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_58;
  }
LABEL_57:
  -[NSPConfigurationStats setMetricsUploadEnabled:](v15, "setMetricsUploadEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x8000) == 0)
  {
LABEL_32:
    if ((v12 & 0x20000) == 0)
      goto LABEL_33;
    goto LABEL_59;
  }
LABEL_58:
  -[NSPConfigurationStats setBrandedCallingEnabled:](v15, "setBrandedCallingEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x20000) == 0)
  {
LABEL_33:
    if ((v12 & 0x400000) == 0)
      goto LABEL_34;
    goto LABEL_60;
  }
LABEL_59:
  -[NSPConfigurationStats setAppMetricsEnabled:](v15, "setAppMetricsEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x400000) == 0)
  {
LABEL_34:
    if ((v12 & 0x800000) == 0)
      goto LABEL_35;
    goto LABEL_61;
  }
LABEL_60:
  -[NSPConfigurationStats setPromotedContentEnabled:](v15, "setPromotedContentEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x800000) == 0)
  {
LABEL_35:
    if ((v12 & 0x1000000) == 0)
      goto LABEL_36;
LABEL_62:
    -[NSPConfigurationStats setPasswordManagerIconFetchEnabled:](v15, "setPasswordManagerIconFetchEnabled:", 1);
    v13 = v15;
    if ((v12 & 0x2000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_61:
  -[NSPConfigurationStats setPostbackFetchEnabled:](v15, "setPostbackFetchEnabled:", 1);
  v13 = v15;
  if ((v12 & 0x1000000) != 0)
    goto LABEL_62;
LABEL_36:
  if ((v12 & 0x2000000) != 0)
  {
LABEL_37:
    -[NSPConfigurationStats setLaunchWarningDetailsEnabled:](v15, "setLaunchWarningDetailsEnabled:", 1);
    v13 = v15;
  }
LABEL_38:
  -[NSPProxyAnalytics sendAnalytics](v13, "sendAnalytics");

}

- (void)copyProxyInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t configFetchFailedCount;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (self)
    {
      objc_msgSend(v4, "setConfigFetchedSuccessCount:", self->_configFetchSuccessCount);
      configFetchFailedCount = self->_configFetchFailedCount;
    }
    else
    {
      objc_msgSend(v4, "setConfigFetchedSuccessCount:", 0);
      configFetchFailedCount = 0;
    }
    objc_msgSend(v7, "setConfigFetchedFailedCount:", configFetchFailedCount);
  }
  else
  {
    v9 = nplog_obj(0, v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[NSPConfigurationManager copyProxyInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null proxyInfo", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (id)diagnostics
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = -[NSPConfigurationManager effectiveUserTier](self, "effectiveUserTier");
  if (v4 >= 3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v4));
  else
    v5 = *(&off_1000F6AF0 + (int)v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("EffectiveUserTier"));

  return v3;
}

- (unint64_t)effectiveUserTier
{
  return self->_effectiveUserTier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
  objc_storeStrong((id *)&self->_trueClientIPAddress, 0);
  objc_storeStrong((id *)&self->_configFetchRetryDate, 0);
  objc_storeStrong((id *)&self->_configFetchSession, 0);
  objc_storeStrong((id *)&self->_configFetchRetryTimer, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_enableCheckTimer, 0);
  objc_storeStrong((id *)&self->_resurrectionTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
