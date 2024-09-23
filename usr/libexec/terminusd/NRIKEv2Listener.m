@implementation NRIKEv2Listener

- (NSString)description
{
  if (self)
    self = (NRIKEv2Listener *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("NRIKEv2Listener[%@]"), CFSTR("62743"));
  return (NSString *)self;
}

- (NRIKEv2Listener)init
{
  NRIKEv2Listener *v2;
  NRIKEv2Listener *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  id v7;
  int IsLevelEnabled;
  id v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NRIKEv2Listener;
  v2 = -[NRIKEv2Listener init](&v16, "init");
  if (!v2)
  {
    v7 = sub_10000E2AC();
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16);

    if (IsLevelEnabled)
    {
      v9 = sub_10000E2AC();
      _NRLogWithArgs(v9, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRIKEv2Listener init]", 129);

    }
    v10 = _os_log_pack_size(12);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = __error();
    v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "-[NRIKEv2Listener init]";
    v14 = sub_10000E2AC();
    _NRLogAbortWithPack(v14, v11);
  }
  v3 = v2;
  v4 = (OS_dispatch_queue *)sub_10014CFBC();
  queue = v3->_queue;
  v3->_queue = v4;

  return v3;
}

- (void)listener:(id)a3 receivedNewSession:(id)a4
{
  id v6;
  id v7;
  int IsLevelEnabled;
  id v9;
  id v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!v12)
  {
    v7 = sub_10000E2AC();
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 17);

    if (!IsLevelEnabled)
      goto LABEL_9;
    v9 = sub_10000E2AC();
    _NRLogWithArgs(v9, 17, "%s called with null listener");
LABEL_14:

    goto LABEL_9;
  }
  if (!v6)
  {
    v10 = sub_10000E2AC();
    v11 = _NRLogIsLevelEnabled(v10, 17);

    if (!v11)
      goto LABEL_9;
    v9 = sub_10000E2AC();
    _NRLogWithArgs(v9, 17, "%s called with null session");
    goto LABEL_14;
  }
  if (qword_1001E44E8 != -1)
    dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
  if (_NRLogIsLevelEnabled(qword_1001E44E0, 0))
  {
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    _NRLogWithArgs(qword_1001E44E0, 0, "%s%.30s:%-4d %@: Received new session: %@", ", "-[NRIKEv2Listener listener:receivedNewSession:]", 604, self, v6);
  }
LABEL_9:

}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  NEIKEv2Listener *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  unsigned int v30;
  void *v31;
  NRIKEv2Listener *v32;
  NSMutableDictionary *v33;
  id v34;
  id v35;
  uint64_t v36;
  NSMutableDictionary *v37;
  void *v38;
  uint64_t v39;
  id *v40;
  id v41;
  void *v42;
  uint64_t v43;
  NSMutableDictionary *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  unsigned int v53;
  NRDevicePairingManagerContext *pairingManager;
  void *v55;
  void *v56;
  unsigned __int8 v57;
  id v58;
  NSUUID *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NRDDecryptedIdentifier *v63;
  id v64;
  void *v65;
  int v66;
  id v67;
  NSUUID *v68;
  NSUUID *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  char *v78;
  id v79;
  char *v80;
  char *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  NSMutableDictionary *links;
  NSMutableDictionary *v89;
  uint64_t v90;
  id *v91;
  id v92;
  void *v93;
  unsigned int v94;
  id v95;
  void *v96;
  id *v97;
  id v98;
  int v99;
  id v100;
  NSMutableDictionary *pairingClients;
  id v102;
  unsigned __int8 *v103;
  int v104;
  id v105;
  id v106;
  id v107;
  int IsLevelEnabled;
  id v109;
  id v110;
  id v111;
  int v112;
  id v113;
  id v114;
  int v115;
  id v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  id v125;
  int v126;
  NSUUID *v127;
  char v128;
  NEIKEv2Listener *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  NRIKEv2Listener *v136;
  id v137;
  unsigned __int8 v138;
  _QWORD v139[4];
  NSUUID *v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];

  v14 = (NEIKEv2Listener *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    v106 = v19;
    v107 = sub_10000E2AC();
    IsLevelEnabled = _NRLogIsLevelEnabled(v107, 17);

    if (IsLevelEnabled)
    {
      v109 = sub_10000E2AC();
      _NRLogWithArgs(v109, 17, "%s called with null listener", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]");

    }
    v21 = v15;
    v20 = v106;
    goto LABEL_12;
  }
  v21 = v15;
  if (!v15)
  {
    v110 = v19;
    v111 = sub_10000E2AC();
    v112 = _NRLogIsLevelEnabled(v111, 17);

    if (v112)
    {
      v113 = sub_10000E2AC();
      _NRLogWithArgs(v113, 17, "%s called with null session", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]");

    }
    v20 = v110;
    goto LABEL_12;
  }
  if (!v19)
  {
    v114 = sub_10000E2AC();
    v115 = _NRLogIsLevelEnabled(v114, 17);

    if (v115)
    {
      v116 = sub_10000E2AC();
      _NRLogWithArgs(v116, 17, "%s called with null responseBlock", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]");

    }
    v20 = 0;
    goto LABEL_12;
  }
  if (self->_ikeListener != v14)
  {
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    if (_NRLogIsLevelEnabled(qword_1001E44E0, 0))
    {
      if (qword_1001E44E8 != -1)
        dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
      _NRLogWithArgs(qword_1001E44E0, 0, "%s%.30s:%-4d %@: Ignoring received session for a stale listener %p != %p", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 621, self, self->_ikeListener, v14);
    }
    goto LABEL_11;
  }
  v134 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v23 = objc_msgSend(v22, "identifierType");

  if (v23 != (id)11)
  {
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    v20 = v134;
    if (!_NRLogIsLevelEnabled(qword_1001E44E0, 16))
      goto LABEL_11;
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    v49 = (id)qword_1001E44E0;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    _NRLogWithArgs(v49, 16, "%s%.30s:%-4d %@: Local identifier has wrong type %zu", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 626, self, objc_msgSend(v50, "identifierType"));
LABEL_46:

    v20 = v134;
    goto LABEL_11;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
  v25 = objc_msgSend(v24, "identifierType");

  if (v25 != (id)11)
  {
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    v20 = v134;
    if (!_NRLogIsLevelEnabled(qword_1001E44E0, 16))
      goto LABEL_11;
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    v49 = (id)qword_1001E44E0;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
    _NRLogWithArgs(v49, 16, "%s%.30s:%-4d %@: Remote identifier has wrong type %zu", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 629, self, objc_msgSend(v50, "identifierType"));
    goto LABEL_46;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v132 = v18;
  v133 = v17;
  v136 = self;
  if (qword_1001E4960 != -1)
    dispatch_once(&qword_1001E4960, &stru_1001B7E08);
  v27 = (id)qword_1001E4958;
  if ((objc_msgSend(v26, "isEqual:", v27) & 1) == 0)
  {

    goto LABEL_48;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
  if (qword_1001E4960 != -1)
    dispatch_once(&qword_1001E4960, &stru_1001B7E08);
  v29 = (id)qword_1001E4958;
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if (!v30)
  {
LABEL_48:
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v20 = v134;
    if (qword_1001E4970 != -1)
      dispatch_once(&qword_1001E4970, &stru_1001B7E28);
    v18 = v132;
    v17 = v133;
    v52 = (id)qword_1001E4968;
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (v53)
    {
      pairingManager = v136->_pairingManager;
      if (pairingManager)
      {
        -[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:](pairingManager, "requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:", v14, v21, v16, v133, v132, v134);
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
    v57 = objc_msgSend(v55, "isEqual:", v56);

    v138 = v57;
    v131 = v16;
    if ((v57 & 1) != 0)
    {
      v142 = 0u;
      v143 = 0u;
      v144 = 0u;
      v145 = 0u;
      v58 = sub_1001379CC((uint64_t)NRDLocalDevice);
      v59 = (NSUUID *)objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v142, v150, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v143;
LABEL_62:
        v76 = 0;
        while (1)
        {
          if (*(_QWORD *)v143 != v60)
            objc_enumerationMutation(v58);
          v77 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v76);
          v78 = sub_10012FFF4((uint64_t)NRDLocalDevice, v77);
          if ((!v78 || !_os_feature_enabled_impl("terminus", "EncryptedIdentity") || !v78[11])
            && sub_10010DF88(v78) == 1)
          {
            break;
          }

          if (v59 == (NSUUID *)++v76)
          {
            v59 = (NSUUID *)objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v142, v150, 16);
            if (!v59)
              goto LABEL_78;
            goto LABEL_62;
          }
        }
        v59 = v77;
        if (qword_1001E44E8 != -1)
          dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
        if (_NRLogIsLevelEnabled(qword_1001E44E0, 1))
        {
          v79 = sub_10000E2AC();
          _NRLogWithArgs(v79, 1, "%s%.30s:%-4d %@: No encrypted identity included by initiator, trying %@", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 698, v136, v59);

        }
LABEL_78:
        v20 = v134;
      }

      goto LABEL_80;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v63 = sub_100130BF8((uint64_t)NRDLocalDevice, v61, v62, v21);

    v64 = sub_10000E2AC();
    v65 = v64;
    if (v63)
    {
      v66 = _NRLogIsLevelEnabled(v64, 1);

      if (v66)
      {
        v67 = sub_10000E2AC();
        v68 = v63->_identity;
        _NRLogWithArgs(v67, 1, "%s%.30s:%-4d %@: Decrypted device identity %@", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 681, v136, v68);

      }
      v69 = v63->_nrUUID;

      if (v69)
      {
        v59 = v63->_nrUUID;

LABEL_80:
        if (v59)
        {
          v80 = sub_1001300EC((uint64_t)NRDLocalDevice, v59, 0);
          v81 = v80;
          if (v80 && v80[9])
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ikeInterfaceName"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localEndpoint"));
            v84 = sub_10000E3A4((uint64_t)v136, v82, v83, v59);

            v85 = sub_10000E2AC();
            LODWORD(v83) = _NRLogIsLevelEnabled(v85, 1);

            if ((_DWORD)v83)
            {
              v86 = sub_10000E2AC();
              v87 = v86;
              if (v136)
                links = v136->_links;
              else
                links = 0;
              _NRLogWithArgs(v86, 1, "%s%.30s:%-4d %@: Got config request for %@ session %@ registered links %@ sessionConfig %@ childConfig %@ ", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 719, v136, v84, v21, links, v131, v133);

            }
            if (v84)
            {
              if (v136)
                v89 = v136->_links;
              else
                v89 = 0;
              v90 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v89, "objectForKeyedSubscript:", v84));
              v91 = (id *)v90;
              if (v90)
              {
                v92 = *(id *)(v90 + 24);
                if (v92)
                {
                  v93 = v92;
                  v94 = objc_msgSend(v91[3], "state");

                  if (v94 != 255)
                  {
                    v95 = v91[3];
                    if (v95)
                    {
                      v96 = v95;
                      v97 = v91;
                      v20 = v134;
LABEL_107:
                      if ((v138 & 1) == 0)
                      {
                        v139[0] = _NSConcreteStackBlock;
                        v139[1] = 3221225472;
                        v139[2] = sub_10000EA24;
                        v139[3] = &unk_1001B5EC0;
                        v141 = v20;
                        v140 = v59;
                        v20 = objc_retainBlock(v139);

                      }
                      objc_msgSend(v96, "requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:", v14, v21, v131, v133, v132, v20);

                      goto LABEL_111;
                    }
                  }
                }
              }
              if (v136)
                pairingClients = v136->_pairingClients;
              else
                pairingClients = 0;
              v97 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pairingClients, "objectForKeyedSubscript:", v84));

              v20 = v134;
              if (v97)
              {
                v102 = v97[4];
                if (v102)
                {
                  v103 = (unsigned __int8 *)v97[4];
                  if (v103)
                  {
                    v104 = v103[8];

                    if (v104 == 6)
                      goto LABEL_110;
                  }
                  else
                  {

                  }
                  v105 = v97[4];
                  if (v105)
                  {
                    v96 = v105;
                    goto LABEL_107;
                  }
                }
              }
LABEL_110:
              sub_10000E528((id *)&v136->super.isa, v21, v131, v133, v132, v134, v84);
LABEL_111:

              v16 = v131;
              v18 = v132;
              v17 = v133;
              goto LABEL_12;
            }
          }
          else
          {
            v98 = sub_10000E2AC();
            v99 = _NRLogIsLevelEnabled(v98, 1);

            if (v99)
            {
              v100 = sub_10000E2AC();
              _NRLogWithArgs(v100, 1, "%s%.30s:%-4d %@: Device not enabled, rejecting %@", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 711, v136, v81);

            }
          }

        }
        else
        {
          sub_10000E2EC((uint64_t)v136, 3022, v70, v71, v72, v73, v74, v75, (uint64_t)v21);
        }
        v16 = v131;
        v18 = v132;
        v17 = v133;
LABEL_11:
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v20 + 2))(v20, 0, 0, 0);
        goto LABEL_12;
      }
      v125 = sub_10000E2AC();
      v126 = _NRLogIsLevelEnabled(v125, 16);

      if (v126)
      {
        v124 = sub_10000E2AC();
        v127 = v63->_identity;
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d %@: No device found for identity %@", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 685, v136, v127);

        goto LABEL_130;
      }
    }
    else
    {
      v117 = _NRLogIsLevelEnabled(v64, 16);

      if (v117)
      {
        v124 = sub_10000E2AC();
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d %@: Failed to decrypt device identity", ", "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 677, v136);
LABEL_130:

      }
    }
    sub_10000E2EC((uint64_t)v136, 3023, v118, v119, v120, v121, v122, v123, (uint64_t)v21);

    goto LABEL_113;
  }
  v130 = v16;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localEndpoint"));
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v32 = v136;
  v33 = v136->_pairingClients;
  v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v146, v151, 16);
  if (!v34)
  {

LABEL_113:
    v18 = v132;
    v17 = v133;
    v20 = v134;
    goto LABEL_11;
  }
  v35 = v34;
  v135 = v31;
  v129 = v14;
  v128 = 0;
  v36 = *(_QWORD *)v147;
  v37 = v33;
  do
  {
    v38 = 0;
    v137 = v35;
    do
    {
      if (*(_QWORD *)v147 != v36)
        objc_enumerationMutation(v37);
      v39 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v32->_pairingClients, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)v38)));
      v40 = (id *)v39;
      if (v39 && *(_QWORD *)(v39 + 32))
      {
        v41 = *(id *)(v39 + 8);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ikeInterfaceName"));
        if ((objc_msgSend(v41, "isEqualToString:", v42) & 1) != 0)
        {
          v43 = v36;
          v44 = v37;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40[2], "hostname"));
          v46 = v21;
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "hostname"));
          v48 = objc_msgSend(v45, "isEqualToString:", v47);

          v21 = v46;
          v32 = v136;

          v37 = v44;
          v36 = v43;
          v35 = v137;

          if (v48)
          {
            objc_msgSend(v40[4], "requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:", v129, v21, v130, v133, v132, v134);
            v128 = 1;
          }
        }
        else
        {

        }
      }

      v38 = (char *)v38 + 1;
    }
    while (v35 != v38);
    v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v146, v151, 16);
  }
  while (v35);

  v14 = v129;
  v16 = v130;
  v18 = v132;
  v17 = v133;
  v20 = v134;
  if ((v128 & 1) == 0)
    goto LABEL_11;
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionSource, 0);
  objc_storeStrong((id *)&self->_pendingSessions, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_pairingClients, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_ikeListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
