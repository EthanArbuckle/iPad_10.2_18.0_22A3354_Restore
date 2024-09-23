@implementation NESMRelaySession

- (NESMRelaySession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6;
  NESMRelaySession *v7;
  uint64_t v8;
  NESMRelaySession *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NERelayConfiguration *relayConfig;
  NESMPolicySession *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NESMRelaySession *v20;
  uint64_t v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  NESMRelaySession *v26;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NESMRelaySession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v24, "initWithConfiguration:andServer:", v6, a4);
  v9 = v7;
  if (!v7)
  {
LABEL_6:
    v18 = ne_log_obj(v7, v8);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ initialized relay session", buf, 0xCu);
    }

    v20 = v9;
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relay"));

  if (v10)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relay"));
    relayConfig = v9->_relayConfig;
    v9->_relayConfig = (NERelayConfiguration *)v13;

    v15 = [NESMPolicySession alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v17 = objc_msgSend(v6, "grade");
    if (v15)
      v15 = (NESMPolicySession *)sub_10002EB54((id *)&v15->super.isa, v16, 9, v17, (void *)2, (void *)1);
    -[NESMSession setPolicySession:](v9, "setPolicySession:", v15);

    sub_10007AAF8(v9);
    goto LABEL_6;
  }
  v21 = ne_log_obj(v11, v12);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ relay configuration is nil", buf, 0xCu);
  }

  v20 = 0;
LABEL_12:

  return v20;
}

- (int)type
{
  return 9;
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  if (a3 == 3)
    return !sub_100074D90(self, a2);
  else
    return a3 < 2;
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
  id v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  const char *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  const char *v38;
  id v39;
  void *v40;
  id v41;
  const char *v42;
  id v43;
  uint64_t v44;
  void *i;
  void *v46;
  void *v47;
  id v48;
  unsigned int v49;
  const char *v50;
  int v51;
  SEL v52;
  void *v53;
  int v54;
  NESMRelaySession *v55;
  char v56;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  NESMRelaySession *v65;
  __int16 v66;
  id v67;

  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (self)
    Property = objc_getProperty(self, v11, 424, 1);
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
      v18 = objc_getProperty(self, v16, 424, 1);
    else
      v18 = 0;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bestAvailableNetworkDescription"));
    if (v58)
    {
      if (self)
        v20 = objc_getProperty(self, v19, 424, 1);
      else
        v20 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "networkDescriptionArray"));
      v22 = objc_msgSend(v21, "indexOfObject:", v58);

      if (self)
        v24 = objc_getProperty(self, v23, 408, 1);
      else
        v24 = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "onDemandRules"));
      v26 = objc_msgSend(v25, "count");

      if (v26 > v22)
      {
        if (self)
          v29 = objc_getProperty(self, v28, 408, 1);
        else
          v29 = 0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "onDemandRules"));
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndex:", v22));

        v17 = (id)v31;
      }
      v32 = ne_log_obj(v27, v28);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        if (objc_msgSend(v17, "action") == (id)3)
        {
          v39 = objc_alloc_init((Class)NSMutableArray);
          v57 = v17;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectionRules"));
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (v41)
          {
            v43 = v41;
            v44 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v43; i = (char *)i + 1)
              {
                if (*(_QWORD *)v60 != v44)
                  objc_enumerationMutation(v40);
                v46 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v46, "action") == (id)2)
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "matchDomains"));
                  objc_msgSend(v39, "addObjectsFromArray:", v47);

                }
              }
              v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
            }
            while (v43);
          }
          if (self)
            v48 = objc_getProperty(self, v42, 432, 1);
          else
            v48 = 0;
          v49 = objc_msgSend(v39, "isEqual:", v48);
          v51 = v49 ^ 1;
          if (self && (v49 & 1) == 0)
            objc_setProperty_atomic(self, v50, v39, 432);

          v17 = v57;
        }
        else if (self)
        {
          v51 = objc_getProperty(self, v38, 432, 1) != 0;
          objc_setProperty_atomic(self, v52, 0, 432);
        }
        else
        {
          v51 = 0;
        }
        if (-[NESMSession status](self, "status") != 1
          && (objc_msgSend(v17, "action") == (id)2 || objc_msgSend(v17, "action") == (id)4))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          objc_msgSend(v53, "requestUninstallForSession:", self);
        }
        else
        {
          if (-[NESMSession status](self, "status") == 3
            || objc_msgSend(v17, "action") != (id)1 && objc_msgSend(v17, "action") != (id)3)
          {
            if (-[NESMSession status](self, "status") == 3)
              v54 = v51;
            else
              v54 = 0;
            if (v54 == 1)
            {
              v55 = self;
              v56 = 0;
            }
            else
            {
              if (!self || !self->_configurationUpdatePending)
                goto LABEL_58;
              self->_configurationUpdatePending = 0;
              v55 = self;
              v56 = 1;
            }
            sub_10007464C(v55, v56);
LABEL_58:

            goto LABEL_59;
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          objc_msgSend(v53, "requestInstallForSession:withParentSession:exclusive:", self, 0, 0);
        }

        goto LABEL_58;
      }
      *(_DWORD *)buf = 138412546;
      v65 = self;
      v66 = 2112;
      v67 = v17;
      v34 = "%@ Matched Relay On Demand rule %@";
      v35 = v33;
      v36 = 22;
    }
    else
    {
      v37 = ne_log_obj(0, v19);
      v33 = objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v65 = self;
      v34 = "%@ Matched no Relay On Demand rule";
      v35 = v33;
      v36 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
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
  NESMRelaySession *v11;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ handling start for relay session", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)NESMRelaySession;
  -[NESMSession handleStartMessage:](&v9, "handleStartMessage:", v4);

  sub_1000761B8(self, v8);
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  objc_super v9;
  uint8_t buf[4];
  NESMRelaySession *v11;

  v3 = *(_QWORD *)&a3;
  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ handling stop for relay session", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)NESMRelaySession;
  -[NESMSession handleStopMessageWithReason:](&v9, "handleStopMessageWithReason:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  objc_msgSend(v7, "requestUninstallForSession:", self);

  if (self)
    objc_setProperty_atomic(self, v8, 0, 472);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  if (v4
    && (v11.receiver = self,
        v11.super_class = (Class)NESMRelaySession,
        -[NESMSession handleUpdateConfiguration:](&v11, "handleUpdateConfiguration:", v4)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relay"));
    v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 408);

      sub_1000761B8(self, v8);
    }
    else
    {

    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
    block[2] = sub_100076150;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)install
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void *i;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  int v28;
  SEL v29;
  SEL v30;
  id v31;
  const char *v32;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  const char *v50;
  void *fallback_privacy_proxy;
  SEL v52;
  SEL v53;
  id Property;
  SEL v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  SEL v61;
  SEL v62;
  void *v63;
  void *v64;
  SEL v65;
  id v66;
  SEL v67;
  id v68;
  id v69;
  SEL v70;
  SEL v71;
  id v72;
  SEL v73;
  id v74;
  void *v75;
  char is_equal;
  const char *v77;
  void *v78;
  void *v79;
  const char *v80;
  void *v81;
  id v82;
  uint64_t v83;
  NSObject *v84;
  SEL v85;
  SEL v86;
  void *v87;
  void *v88;
  uint64_t v89;
  SEL v90;
  id v91;
  SEL v92;
  id v93;
  unsigned __int8 v94;
  const char *v95;
  NESMRelaySession *v96;
  id v97;
  unsigned __int8 v98;
  const char *v99;
  NESMRelaySession *v100;
  id v101;
  SEL v102;
  id v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  id v110;
  void *v111;
  id v112;
  SEL v113;
  id v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  id v120;
  void *v121;
  uint64_t v122;
  const char *v123;
  id v124;
  void *v125;
  uint64_t v126;
  const char *v127;
  void *default_privacy_proxy;
  const char *v129;
  void *v130;
  SEL v131;
  id v132;
  SEL v133;
  id v134;
  const char *v135;
  id v136;
  void *v137;
  BOOL v138;
  id v139;
  void *v140;
  SEL v141;
  id v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  const char *v147;
  id v148;
  void *v149;
  uint64_t v150;
  NSObject *v151;
  NESMRelaySession *selfa;
  void *v153;
  int v154;
  void *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[6];
  uint8_t v165[128];
  uint8_t buf[4];
  NESMRelaySession *v167;
  uint8_t v168[4];
  NESMRelaySession *v169;
  __int16 v170;
  int v171;
  __int16 v172;
  void *v173;
  __int128 v174;
  uint64_t v175;
  uint64_t (*v176)(uint64_t, uint64_t);
  void (*v177)(uint64_t);
  id v178;

  selfa = self;
  v2 = ne_log_obj(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v167 = selfa;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ installing relay session", buf, 0xCu);
  }

  sub_100073DFC(selfa, v4);
  sub_100073F14(selfa, v5);
  if (!selfa)
  {
    sub_10007464C(0, 1);
    goto LABEL_80;
  }
  v7 = objc_getProperty(selfa, v6, 408, 1);
  if (!v7)
    goto LABEL_18;
  v9 = v7;
  if ((objc_msgSend(objc_getProperty(selfa, v8, 408, 1), "isEnabled") & 1) == 0)
  {

    goto LABEL_18;
  }
  v11 = objc_msgSend(objc_getProperty(selfa, v10, 408, 1), "relays");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "count") == 0;

  if (v13)
  {
LABEL_18:
    objc_setProperty_atomic(selfa, v8, 0, 360);
    objc_setProperty_atomic(selfa, v29, 0, 368);
    goto LABEL_19;
  }
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v14 = objc_msgSend(objc_getProperty(selfa, v8, 408, 1), "relays");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
  if (!v16)
  {

    v155 = (void *)nw_array_create();
    v28 = 0;
    goto LABEL_23;
  }
  v17 = *(_QWORD *)v161;
  v18 = 1;
  v19 = 1;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v161 != v17)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)i);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "HTTP3RelayURL", selfa));
      v23 = v22 != 0;

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "HTTP2RelayURL"));
      LODWORD(v21) = v24 != 0;

      v19 &= v23;
      v18 &= v21;
    }
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
  }
  while (v16);

  if (((v19 | v18) & 1) != 0)
  {
    v155 = (void *)nw_array_create();
    v28 = v18 & ~v19;
    if ((v19 & v18) == 0)
    {
      v153 = 0;
      v154 = 0;
      goto LABEL_24;
    }
LABEL_23:
    v153 = (void *)nw_array_create();
    v154 = 1;
LABEL_24:
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v35 = objc_msgSend(objc_getProperty(selfa, v27, 408, 1), "relays");
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v156, v165, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v157;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(_QWORD *)v157 != v38)
            objc_enumerationMutation(v36);
          v40 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)j);
          if ((v28 & 1) != 0)
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)j), "HTTP2RelayURL"));
          else
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)j), "HTTP3RelayURL"));
          v42 = v41;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "absoluteString", selfa));

          if (v43)
          {
            v44 = sub_100074A84(v43, v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            nw_array_append(v155, v45);
            if (v154)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "HTTP2RelayURL"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "absoluteString"));

              if (v47)
              {
                v48 = sub_100074A84(v47, v40);
                v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                nw_array_append(v153, v49);

              }
            }
            else
            {
              v47 = 0;
            }

          }
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v156, v165, 16);
      }
      while (v37);
    }

    if (!v154)
    {
      sub_100073DFC(selfa, v50);
      goto LABEL_68;
    }
    fallback_privacy_proxy = (void *)nw_proxy_config_create_fallback_privacy_proxy(v153);
    objc_setProperty_atomic(selfa, v52, fallback_privacy_proxy, 368);

    Property = objc_getProperty(selfa, v53, 368, 1);
    nw_proxy_config_set_ignore_privacy_stance(Property, 1);
    v56 = objc_getProperty(selfa, v55, 368, 1);
    nw_proxy_config_set_use_over_privacy_proxy(v56, 1);
    v57 = objc_alloc((Class)NERelayNetworkAgent);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](selfa, "configuration"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
    v60 = objc_msgSend(v57, "initWithConfigUUID:sessionType:name:", v59, -[NESMRelaySession type](selfa, "type"), CFSTR("h2-fallback"));
    objc_setProperty_atomic(selfa, v61, v60, 376);

    objc_msgSend(objc_getProperty(selfa, v62, 376, 1), "setActive:", 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](selfa, "configuration"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "name"));
    objc_msgSend(objc_getProperty(selfa, v65, 376, 1), "setConfigurationName:", v64);

    v66 = objc_alloc((Class)NWNetworkAgentRegistration);
    v68 = objc_getProperty(selfa, v67, 376, 1);
    v69 = objc_msgSend(v66, "initWithNetworkAgentClass:", objc_opt_class(v68));
    objc_setProperty_atomic(selfa, v70, v69, 384);

    v72 = objc_getProperty(selfa, v71, 368, 1);
    v74 = objc_msgSend(objc_getProperty(selfa, v73, 376, 1), "proxyConfig");
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    is_equal = nw_proxy_config_is_equal(v75, v72);

    if ((is_equal & 1) == 0)
      objc_msgSend(objc_getProperty(selfa, v77, 376, 1), "setProxyConfig:", v72);
    *(_QWORD *)&v174 = 0;
    *((_QWORD *)&v174 + 1) = &v174;
    v175 = 0x3032000000;
    v176 = sub_10007473C;
    v177 = sub_10007474C;
    v178 = 0;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer", selfa));
    v164[0] = _NSConcreteStackBlock;
    v164[1] = 3221225472;
    v164[2] = sub_1000760B0;
    v164[3] = &unk_1000BE5C0;
    v164[4] = selfa;
    v164[5] = &v174;
    objc_msgSend(v78, "iterateFileHandlesWithBlock:", v164);

    v79 = *(void **)(*((_QWORD *)&v174 + 1) + 40);
    if (v79)
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "agentUUID"));
    else
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v82 = objc_getProperty(selfa, v80, 376, 1);
    objc_msgSend(v82, "setAgentUUID:", v81);

    v87 = *(void **)(*((_QWORD *)&v174 + 1) + 40);
    if (v87)
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "handle"));
      v89 = dup((int)objc_msgSend(v88, "fileDescriptor"));

      v91 = objc_getProperty(selfa, v90, 384, 1);
      v93 = objc_getProperty(selfa, v92, 376, 1);
      v94 = objc_msgSend(v91, "setRegisteredNetworkAgent:fileDescriptor:", v93, v89);

      v96 = selfa;
      if ((v94 & 1) == 0)
      {
        close(v89);
        sub_1000788C8(selfa);
      }
    }
    else
    {
      v96 = selfa;
      sub_1000788C8(selfa);
    }
    v97 = objc_getProperty(v96, v95, 384, 1);
    v98 = objc_msgSend(v97, "isRegistered");

    if ((v98 & 1) != 0)
    {
      v100 = selfa;
      if ((is_equal & 1) != 0)
      {
LABEL_67:
        sub_10007433C(v100);
        _Block_object_dispose(&v174, 8);

LABEL_68:
        if (v28)
          default_privacy_proxy = (void *)nw_proxy_config_create_fallback_privacy_proxy(v155);
        else
          default_privacy_proxy = (void *)nw_proxy_config_create_default_privacy_proxy(v155);
        v130 = default_privacy_proxy;
        objc_setProperty_atomic(selfa, v129, default_privacy_proxy, 360);

        v132 = objc_getProperty(selfa, v131, 360, 1);
        nw_proxy_config_set_ignore_privacy_stance(v132, 1);
        v134 = objc_getProperty(selfa, v133, 360, 1);
        nw_proxy_config_set_use_over_privacy_proxy(v134, 1);
        if (v154)
        {
          v136 = objc_msgSend(objc_getProperty(selfa, v135, 376, 1), "agentUUID");
          v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
          v138 = v137 == 0;

          if (!v138)
          {
            v174 = 0uLL;
            v139 = objc_msgSend(objc_getProperty(selfa, v135, 376, 1), "agentUUID");
            v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
            objc_msgSend(v140, "getUUIDBytes:", &v174);

            v142 = objc_getProperty(selfa, v141, 360, 1);
            nw_proxy_config_set_fallback_proxy_agent(v142, &v174);
          }
        }
        v143 = objc_msgSend(objc_getProperty(selfa, v135, 408, 1), "relays");
        v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
        v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "lastObject"));

        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "dnsOverHTTPSURL"));
        if (v146)
        {

        }
        else if (!sub_100074D90(selfa, v147))
        {
LABEL_78:

          goto LABEL_19;
        }
        sub_100074E24((unsigned __int16 *)selfa, (const char *)1);
        goto LABEL_78;
      }
      v101 = objc_getProperty(selfa, v99, 384, 1);
      v103 = objc_getProperty(selfa, v102, 376, 1);
      v104 = objc_msgSend(v101, "updateNetworkAgent:", v103);

      if (v104)
      {
        v107 = ne_log_obj(v105, v106);
        v108 = objc_claimAutoreleasedReturnValue(v107);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v110 = objc_getProperty(selfa, v109, 376, 1);
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "agentUUID"));
          *(_DWORD *)v168 = 138412802;
          v169 = selfa;
          v170 = 1042;
          v171 = 16;
          v172 = 2098;
          v173 = v111;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%@: Updated fallback relay network agent %{public,uuid_t}.16P", v168, 0x1Cu);

        }
      }
      else
      {
        v126 = ne_log_obj(v105, v106);
        v108 = objc_claimAutoreleasedReturnValue(v126);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          v148 = objc_getProperty(selfa, v127, 376, 1);
          v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "agentUUID"));
          *(_DWORD *)v168 = 138412802;
          v169 = selfa;
          v170 = 1042;
          v171 = 16;
          v172 = 2098;
          v173 = v149;
          _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%@: Update failed for fallback relay network agent %{public,uuid_t}.16P", v168, 0x1Cu);

        }
      }
    }
    else
    {
      v112 = objc_getProperty(selfa, v99, 384, 1);
      v114 = objc_getProperty(selfa, v113, 376, 1);
      v115 = objc_msgSend(v112, "registerNetworkAgent:", v114);

      if (v115)
      {
        v118 = ne_log_obj(v116, v117);
        v108 = objc_claimAutoreleasedReturnValue(v118);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v120 = objc_getProperty(selfa, v119, 376, 1);
          v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "agentUUID"));
          *(_DWORD *)v168 = 138412802;
          v169 = selfa;
          v170 = 1042;
          v171 = 16;
          v172 = 2098;
          v173 = v121;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%@: Registered fallback relay network agent %{public,uuid_t}.16P", v168, 0x1Cu);

        }
      }
      else
      {
        v122 = ne_log_obj(v116, v117);
        v108 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          v124 = objc_getProperty(selfa, v123, 376, 1);
          v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "agentUUID"));
          *(_DWORD *)v168 = 138412802;
          v169 = selfa;
          v170 = 1042;
          v171 = 16;
          v172 = 2098;
          v173 = v125;
          _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%@: Registration failed for fallback relay network agent %{public,uuid_t}.16P", v168, 0x1Cu);

        }
      }
    }

    v100 = selfa;
    goto LABEL_67;
  }
  v83 = ne_log_obj(v25, v26);
  v84 = objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v174) = 138412290;
    *(_QWORD *)((char *)&v174 + 4) = selfa;
    _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%@ Invalid proxy hops, no consistent HTTP version supported", (uint8_t *)&v174, 0xCu);
  }

  objc_setProperty_atomic(selfa, v85, 0, 360);
  objc_setProperty_atomic(selfa, v86, 0, 368);
LABEL_19:
  sub_10007464C(selfa, 1);
  v31 = objc_getProperty(selfa, v30, 408, 1);
  if (v31)
  {
    v33 = v31;
    v34 = objc_getProperty(selfa, v32, 360, 1) == 0;

    if (!v34)
    {
      -[NESMSession setStatus:](selfa, "setStatus:", 3);
      return;
    }
  }
LABEL_80:
  v150 = ne_log_obj(v31, v32);
  v151 = objc_claimAutoreleasedReturnValue(v150);
  if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v167 = selfa;
    _os_log_error_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_ERROR, "%@ relay is not ready, not moving to connected", buf, 0xCu);
  }

}

- (void)uninstall
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id Property;
  NSObject *v10;
  SEL v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  const char *v15;
  int v16;
  NESMRelaySession *v17;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ uninstalling relay session", (uint8_t *)&v16, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002C404((uint64_t)v5);

  sub_100073DFC(self, v6);
  sub_100073F14(self, v7);
  if (self)
  {
    Property = objc_getProperty(self, v8, 440, 1);
    if (Property)
    {
      v10 = Property;
      objc_setProperty_atomic(self, v11, 0, 440);
      self->_dnsListenerPort = 0;
      nw_connection_group_cancel(v10);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relay"));
  v14 = objc_msgSend(v13, "isEnabled");

  if ((v14 & 1) == 0)
    sub_100073CE4(self, v15);
  if (self)
    objc_setProperty_atomic(self, v15, 0, 472);
  -[NESMSession setStatus:](self, "setStatus:", 1);
}

- (void)dealloc
{
  objc_super v3;

  sub_100073CE4(self, a2);
  -[NESMRelaySession uninstall](self, "uninstall");
  v3.receiver = self;
  v3.super_class = (Class)NESMRelaySession;
  -[NESMSession dealloc](&v3, "dealloc");
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t reply;
  id v7;
  void *v8;
  void *v9;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v11;
  xpc_object_t xdict;

  xdict = a3;
  reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    v7 = -[NESMRelaySession copyExtendedStatus](self, "copyExtendedStatus");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
      xpc_dictionary_set_value(reply, "SessionInfo", v9);

    }
  }
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v11, reply);

}

- (id)copyExtendedStatus
{
  id v3;
  id v4;
  const char *v5;
  id Property;
  id v7;
  id v8;
  const char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  id v19;
  const char *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  id v31;
  void *v32;
  void *v33;
  SEL v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = objc_alloc((Class)NSMutableDictionary);
  v53.receiver = self;
  v53.super_class = (Class)NESMRelaySession;
  v4 = -[NESMSession copyExtendedStatus](&v53, "copyExtendedStatus");
  v42 = objc_msgSend(v3, "initWithDictionary:", v4);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  if (self)
    Property = objc_getProperty(self, v5, 472, 1);
  else
    Property = 0;
  v7 = Property;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v50;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v12);
        if (self)
          v14 = objc_getProperty(self, v9, 472, 1);
        else
          v14 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13, v42));
        objc_msgSend(v15, "timeIntervalSinceNow");
        v17 = v16;

        if (v17 > 86400.0)
        {
          if (self)
            v18 = objc_getProperty(self, v9, 472, 1);
          else
            v18 = 0;
          objc_msgSend(v18, "removeObjectForKey:", v13);
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      v10 = v19;
    }
    while (v19);
  }

  if (self)
    v21 = objc_getProperty(self, v20, 472, 1);
  else
    v21 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "keysSortedByValueUsingComparator:", &stru_1000BE520, v42));
  v23 = objc_alloc_init((Class)NSMutableArray);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v22;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v46;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v27);
        v29 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("LastCause"));
        if (self)
        {
          v31 = objc_msgSend(objc_getProperty(self, v30, 472, 1), "objectForKeyedSubscript:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          objc_msgSend(v32, "timeIntervalSince1970");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("TimeEpoch"));

          v35 = objc_getProperty(self, v34, 472, 1);
        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", v28));
          objc_msgSend(v38, "timeIntervalSince1970");
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v39, CFSTR("TimeEpoch"));

          v35 = 0;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v28));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description"));
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, CFSTR("TimeString"));

        objc_msgSend(v23, "addObject:", v29);
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      v25 = v40;
    }
    while (v40);
  }

  objc_msgSend(v43, "setObject:forKeyedSubscript:", v23, CFSTR("SortedRelayErrors"));
  return v43;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  const char *v6;
  id v7;
  id v8;
  SEL v9;
  const char *v10;
  void *v11;
  id Property;
  id v13;
  void *v14;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if ((int)v4 <= 1103)
  {
    if ((v4 & 0x80000000) == 0)
    {
      if (!(_DWORD)v4)
        goto LABEL_21;
      if ((_DWORD)v4 != 60 && (_DWORD)v4 != 1100)
        goto LABEL_28;
      goto LABEL_19;
    }
    if ((v4 + 65568) > 0x1E || ((1 << (v4 + 32)) & 0x4000C001) == 0)
      goto LABEL_28;
    v4 = 17;
  }
  else
  {
    if ((int)v4 <= 1203)
    {
      if ((v4 - 1104) >= 2)
      {
        if ((_DWORD)v4 != 1106)
        {
          if ((_DWORD)v4 != 1200)
            goto LABEL_28;
LABEL_19:
          v4 = 20;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
LABEL_15:
      v4 = 21;
      goto LABEL_21;
    }
    if ((v4 - 1204) < 2)
      goto LABEL_15;
    if ((_DWORD)v4 == 1206)
    {
LABEL_20:
      v4 = 28;
      goto LABEL_21;
    }
    if ((_DWORD)v4 != 1302)
      goto LABEL_28;
    v4 = 18;
  }
LABEL_21:
  if (!self)
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    goto LABEL_24;
  }
  if (!objc_getProperty(self, v6, 472, 1))
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_setProperty_atomic(self, v9, v8, 472);
LABEL_24:

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  if (self)
    Property = objc_getProperty(self, v10, 472, 1);
  else
    Property = 0;
  v13 = Property;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v14);

LABEL_28:
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayStats, 0);
  objc_storeStrong((id *)&self->_orderedSynthesizedHostnames, 0);
  objc_storeStrong((id *)&self->_synthesizedIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_synthesizedIPv4Addresses, 0);
  objc_storeStrong((id *)&self->_dnsListener, 0);
  objc_storeStrong((id *)&self->_extraExceptionDomains, 0);
  objc_storeStrong((id *)&self->_relayOnDemandMonitor, 0);
  objc_storeStrong((id *)&self->_onDemandTransaction, 0);
  objc_storeStrong((id *)&self->_relayConfig, 0);
  objc_storeStrong((id *)&self->_dnsAgentRegistration, 0);
  objc_storeStrong((id *)&self->_dnsAgent, 0);
  objc_storeStrong((id *)&self->_fallbackAgentRegistration, 0);
  objc_storeStrong((id *)&self->_fallbackAgent, 0);
  objc_storeStrong((id *)&self->_fallbackProxyConfig, 0);
  objc_storeStrong((id *)&self->_proxyConfig, 0);
}

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

@end
