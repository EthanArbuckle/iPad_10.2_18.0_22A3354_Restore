@implementation NRPairingClient

- (void)dealloc
{
  objc_super v3;

  if (qword_1001E44C8 != -1)
    dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
  if (_NRLogIsLevelEnabled(qword_1001E44C0, 0))
  {
    if (qword_1001E44C8 != -1)
      dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
    _NRLogWithArgs(qword_1001E44C0, 0, "%s%.30s:%-4d %@: Dealloc", ", "-[NRPairingClient dealloc]", 137, self);
  }
  sub_100006CA0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRPairingClient;
  -[NRPairingClient dealloc](&v3, "dealloc");
}

- (NSString)description
{
  id v3;
  void *v4;
  const __CFString *v5;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = v3;
  if (self->_state - 1 > 6)
    v5 = CFSTR("Invalid");
  else
    v5 = *(&off_1001B5E38 + (self->_state - 1));
  objc_msgSend(v3, "appendFormat:", CFSTR("NRPairingClient[%llu, %@, %@]"), self->_identifier, v5, self->_nrUUID);
  return (NSString *)v4;
}

- (BOOL)sendPacketData:(id)a3
{
  return 1;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  NRPairingClient *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NRDDecryptedIdentifier *v34;
  id v35;
  NSUUID *v36;
  NSUUID *v37;
  NSUUID *v38;
  unsigned __int8 v39;
  void *v40;
  uint64_t v41;
  id v42;
  unsigned int v43;
  id v44;
  char *v45;
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  void *v50;
  id v51;
  NSUUID *nrUUID;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  unsigned __int8 v62;
  uint64_t v63;
  void *v64;
  id v65;
  unsigned int v66;
  id v67;
  id v68;
  id v69;
  char *v70;
  id v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NRPairingParameters *pairingParameters;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  _QWORD *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  int v92;
  id v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id *v109;
  id *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  unsigned __int8 *v117;
  int v118;
  id v119;
  void *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  int IsLevelEnabled;
  id v127;
  id v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  id v136;
  int v137;
  NSUUID *v138;
  id v139;
  int v140;
  NSUUID *v141;
  id v142;
  int v143;
  id v144;
  id v145;
  char *v146;
  void *v147;
  uint64_t (**v148)(_QWORD, void *);
  void *v149;
  void *v150;
  uint64_t String;
  unsigned __int8 v152;
  unsigned __int8 v153;
  char v154;
  char *v155;
  id v156;
  void *v157;
  NRPairingClient *v158;
  void *v159;
  void (**v160)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v161;
  _QWORD v162[5];
  id v163;
  id v164;
  void (**v165)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v166[2];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (qword_1001E44C8 != -1)
    dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
  if (_NRLogIsLevelEnabled(qword_1001E44C0, 0))
  {
    if (qword_1001E44C8 != -1)
      dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
    _NRLogWithArgs(qword_1001E44C0, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1593, self, v14, v15, v16, v17);
  }
  if ((self->_state & 0xFE) != 6)
  {
    v160 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v19;
    v161 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v21 = objc_msgSend(v20, "identifierType");

    if (v21 == (id)11)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
      v23 = objc_msgSend(v22, "identifierType");

      if (v23 == (id)11)
      {
        v158 = self;
        v155 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->_nrUUID);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
        v26 = objc_msgSend(v24, "isEqual:", v25);

        v157 = v18;
        v154 = v26;
        v156 = v14;
        if ((v26 & 1) != 0)
          goto LABEL_29;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        if (qword_1001E4920 != -1)
          dispatch_once(&qword_1001E4920, &stru_1001B7D88);
        v28 = v158;
        v29 = (id)qword_1001E4918;
        if ((objc_msgSend(v27, "isEqual:", v29) & 1) == 0)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
          if (qword_1001E4930 != -1)
            dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
          v31 = (id)qword_1001E4928;
          if ((objc_msgSend(v30, "isEqual:", v31) & 1) == 0)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
            v150 = v30;
            v85 = sub_100111A10();
            v152 = objc_msgSend(v84, "isEqual:", v85);

            v28 = v158;
            if ((v152 & 1) == 0)
            {
              v15 = v161;
              if (qword_1001E44C8 != -1)
                dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
              v45 = v155;
              v14 = v156;
              v18 = v157;
              v19 = v160;
              if (_NRLogIsLevelEnabled(qword_1001E44C0, 16))
              {
                v86 = sub_100004A00();
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
                _NRLogWithArgs(v86, 16, "%s%.30s:%-4d %@: Local identifier %@ does not match remote identifier %@", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1618, v158, v87, v88);

                v15 = v161;
                v18 = v157;

                v19 = v160;
              }
              goto LABEL_131;
            }
LABEL_19:
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
            v34 = sub_100130BF8((uint64_t)NRDLocalDevice, v32, v33, v161);

            if (v34)
            {
              if (qword_1001E44C8 != -1)
                dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
              if (_NRLogIsLevelEnabled(qword_1001E44C0, 1))
              {
                if (qword_1001E44C8 != -1)
                  dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
                v35 = (id)qword_1001E44C0;
                v36 = v34->_identity;
                _NRLogWithArgs(v35, 1, "%s%.30s:%-4d %@: Decrypted device identity %@", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1630, v28, v36);

              }
              v37 = v34->_nrUUID;

              if (v37)
              {
                v38 = v34->_nrUUID;
                v39 = -[NSUUID isEqual:](v38, "isEqual:", v28->_nrUUID);

                if ((v39 & 1) != 0)
                {

LABEL_29:
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                  if (qword_1001E4960 != -1)
                    dispatch_once(&qword_1001E4960, &stru_1001B7E08);
                  v41 = (uint64_t)v158;
                  v42 = (id)qword_1001E4958;
                  v43 = objc_msgSend(v40, "isEqual:", v42);

                  if (v43)
                  {
                    sub_100004AF0((uint64_t)v158, (id *)&v158->_ikeSessionPairing);
                    objc_storeStrong((id *)&v158->_ikeSessionPairing, a4);
                    sub_100004C50((uint64_t)v158);
                    v44 = objc_msgSend(objc_alloc((Class)NEIKEv2AuthenticationProtocol), "initWithMethod:", 2);
                    if (qword_1001E4960 != -1)
                      dispatch_once(&qword_1001E4960, &stru_1001B7E08);
                    v45 = v155;
                    v46 = (id)qword_1001E4958;
                    v47 = sub_10011268C(0, v46, v44);

                    if (v155)
                    {
                      v48 = (_QWORD *)*((_QWORD *)v155 + 19);
                      if (v48)
                        v48 = (_QWORD *)v48[2];
                      v49 = v48;
                    }
                    else
                    {
                      v49 = 0;
                    }
                    objc_msgSend(v47, "setSharedSecret:", v49);

                    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sharedSecret"));
                    if (v50)
                    {
                      if (v47)
                      {
                        if (qword_1001E44C8 != -1)
                          dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
                        if (_NRLogIsLevelEnabled(qword_1001E44C0, 0))
                        {
                          v51 = sub_100004A00();
                          _NRLogWithArgs(v51, 0, "%s%.30s:%-4d %@: Receiving session for pairing with OOBK", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1669, v158);

                        }
                        nrUUID = v158->_nrUUID;
                        v162[0] = _NSConcreteStackBlock;
                        v162[1] = 3221225472;
                        v162[2] = sub_100005110;
                        v162[3] = &unk_1001B6D50;
                        v162[4] = v158;
                        v163 = v47;
                        v164 = v17;
                        v165 = v160;
                        v53 = v47;
                        v19 = v160;
                        sub_1001385D4((uint64_t)NRDLocalDevice, nrUUID, 1, v162);

                        goto LABEL_89;
                      }
                      v19 = v160;
                      v160[2](v160, 0, 0, 0);
                    }
                    else
                    {
                      v125 = sub_100004A00();
                      IsLevelEnabled = _NRLogIsLevelEnabled(v125, 17);

                      v19 = v160;
                      if (IsLevelEnabled)
                      {
                        v127 = sub_100004A00();
                        _NRLogWithArgs(v127, 17, "%@: Missing out of band key", v158);

                        v19 = v160;
                      }
                    }

LABEL_89:
                    v14 = v156;
                    v15 = v161;
                    v18 = v157;
LABEL_131:

                    goto LABEL_132;
                  }
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                  if (qword_1001E4920 != -1)
                    dispatch_once(&qword_1001E4920, &stru_1001B7D88);
                  v57 = (id)qword_1001E4918;
                  if ((objc_msgSend(v56, "isEqual:", v57) & 1) == 0)
                  {
                    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                    if (qword_1001E4930 != -1)
                      dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
                    v59 = (id)qword_1001E4928;
                    if ((objc_msgSend(v58, "isEqual:", v59) & 1) == 0)
                    {
                      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                      v90 = sub_100111A10();
                      v153 = objc_msgSend(v89, "isEqual:", v90);

                      if ((v153 & 1) == 0)
                      {
                        v91 = sub_100004A00();
                        v92 = _NRLogIsLevelEnabled(v91, 16);

                        v14 = v156;
                        v15 = v161;
                        if (v92)
                        {
                          v93 = sub_100004A00();
                          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                          _NRLogWithArgs(v93, 16, "%s%.30s:%-4d %@: Unrecognized IKEv2 identifier %@", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1752, v158, v94);

                        }
                        v19 = v160;
                        v160[2](v160, 0, 0, 0);
                        v18 = v157;
                        goto LABEL_130;
                      }
LABEL_66:
                      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                      if (qword_1001E4930 != -1)
                        dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
                      v61 = (id)qword_1001E4928;
                      v62 = objc_msgSend(v60, "isEqual:", v61);

                      if ((v62 & 1) != 0)
                      {
                        v63 = 3;
                      }
                      else
                      {
                        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
                        if (qword_1001E4940 != -1)
                          dispatch_once(&qword_1001E4940, &stru_1001B7DC8);
                        v65 = (id)qword_1001E4938;
                        v66 = objc_msgSend(v64, "isEqual:", v65);

                        if (v66)
                          v63 = 1;
                        else
                          v63 = 4;
                      }
                      v18 = v157;
                      v67 = v161;
                      v68 = v157;
                      v19 = v160;
                      if ((v158->_state & 0xFE) == 6)
                      {
                        v69 = 0;
LABEL_113:

                        v116 = sub_10012FFF4((uint64_t)NRDLocalDevice, *(void **)(v41 + 24));
                        if (v17)
                        {
                          v117 = (unsigned __int8 *)*(id *)(v41 + 40);
                          if (v117 && (v118 = v117[11], v117, v118))
                          {
                            v119 = sub_100112420();
                            objc_msgSend(v119, "setSequencePerTrafficClass:", 1);
                            v120 = v119;
                            v121 = 16;
                          }
                          else
                          {
                            v119 = sub_100112420();
                            objc_msgSend(v119, "setMode:", 2);
                            v120 = v119;
                            v121 = 4;
                          }
                          objc_msgSend(v120, "setReplayWindowSize:", v121);
                        }
                        else
                        {
                          v119 = 0;
                        }
                        v122 = v154;
                        if (!v69)
                          v122 = 1;
                        if ((v122 & 1) == 0)
                          sub_10013C890((uint64_t)NRDLocalDevice, *(void **)(v41 + 24));
                        if (v119)
                        {
                          v123 = *(_QWORD *)(v41 + 40);
                          if (v123)
                            v124 = *(_QWORD *)(v123 + 40);
                          else
                            v124 = 0;
                          (*((void (**)(id, id, id, uint64_t))v19 + 2))(v19, v69, v119, v124);
                        }
                        else
                        {
                          (*((void (**)(id, id, _QWORD, _QWORD))v19 + 2))(v19, v69, 0, 0);
                        }

                        v14 = v156;
                        v15 = v161;
LABEL_130:
                        v45 = v155;
                        goto LABEL_131;
                      }
                      if (!v67)
                      {
                        v142 = sub_100004A00();
                        v143 = _NRLogIsLevelEnabled(v142, 17);

                        if (v143)
                        {
                          v144 = sub_100004A00();
                          _NRLogWithArgs(v144, 17, "%s called with null session", "-[NRPairingClient respondToIKESession:dataProtectionClass:validateAuthBlock:]");

                        }
                        v69 = 0;
                        v18 = v157;
                        v41 = (uint64_t)v158;
                        v19 = v160;
                        goto LABEL_113;
                      }
                      String = NRDataProtectionClassCreateString(v63);
                      v70 = sub_10012FFF4((uint64_t)NRDLocalDevice, v158->_nrUUID);
                      v71 = sub_100131288(v70, v63);
                      v149 = v71;
                      if (v71)
                        v72 = (void *)*((_QWORD *)v71 + 1);
                      else
                        v72 = 0;
                      v73 = v72;

                      if (!v73)
                      {
                        v95 = (void *)String;
                        sub_100004A40(v158, 3019, CFSTR("%@ %@ %@"), v74, v75, v76, v77, v78, String);
                        v69 = 0;
                        v19 = v160;
LABEL_112:

                        goto LABEL_113;
                      }
                      pairingParameters = v158->_pairingParameters;
                      v148 = (uint64_t (**)(_QWORD, void *))v68;
                      if (pairingParameters && pairingParameters->_isTransportModeIPsec)
                      {
                        if ((_DWORD)v63 == 3)
                        {
                          if (v70)
                          {
                            v96 = sub_10014CFBC();
                            dispatch_assert_queue_V2(v96);

                            v81 = sub_100133920(v70, CFSTR("0"));
                            v97 = sub_10014CFBC();
                            dispatch_assert_queue_V2(v97);

                            v83 = sub_100133AD8(v70, CFSTR("0"));
                            goto LABEL_103;
                          }
LABEL_150:
                          v159 = 0;
                          v81 = 0;
                          goto LABEL_104;
                        }
                        if ((_DWORD)v63 == 4)
                        {
                          if (v70)
                          {
                            v80 = sub_10014CFBC();
                            dispatch_assert_queue_V2(v80);

                            v81 = (uint64_t)sub_1001331E8(v70, CFSTR("0"));
                            v82 = sub_10014CFBC();
                            dispatch_assert_queue_V2(v82);

                            v83 = sub_100133714(v70, CFSTR("0"));
LABEL_103:
                            v159 = v83;
LABEL_104:
                            v18 = v157;
LABEL_105:
                            v146 = v70;
                            v98 = sub_100112798(0, v70, v63);
                            v147 = (void *)v81;
                            if (v81 && v159)
                            {
                              v99 = objc_alloc((Class)NEIKEv2ConfigurationMessage);
                              v145 = objc_msgSend(objc_alloc((Class)NEIKEv2InitiatorTransportIPv6Address), "initWithAddress:", v159);
                              v166[0] = v145;
                              v100 = objc_msgSend(objc_alloc((Class)NEIKEv2ResponderTransportIPv6Address), "initWithAddress:", v147);
                              v166[1] = v100;
                              v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v166, 2));
                              v102 = objc_msgSend(v99, "initWithWithAttributes:", v101);
                              objc_msgSend(v98, "setConfigurationReply:", v102);

                              v18 = v157;
                            }
                            v103 = sub_100005460(v41, 1);
                            objc_msgSend(v98, "setCustomIKEAuthPrivateNotifies:", v103);
                            v19 = v160;
                            if ((v148[2](v148, v98) & 1) != 0)
                            {
                              v109 = (id *)sub_100005AFC(v41, v63);
                              sub_100004AF0(v41, v109);
                              v110 = (id *)sub_100005AFC(v41, v63);
                              objc_storeStrong(v110, a4);
                              sub_100005C6C(v41, v63);
                              v95 = (void *)String;
                              sub_100004A40((_QWORD *)v41, 3016, CFSTR("%@ %@"), v111, v112, v113, v114, v115, String);
                              v69 = v98;
                            }
                            else
                            {
                              v95 = (void *)String;
                              sub_100004A40((_QWORD *)v41, 3021, CFSTR("%@ %@"), v104, v105, v106, v107, v108, String);
                              v69 = 0;
                            }

                            v70 = v146;
                            v68 = v148;
                            goto LABEL_112;
                          }
                          goto LABEL_150;
                        }
                      }
                      v159 = 0;
                      v81 = 0;
                      goto LABEL_105;
                    }

                  }
                  goto LABEL_66;
                }
                v139 = sub_100004A00();
                v140 = _NRLogIsLevelEnabled(v139, 16);

                v28 = v158;
                if (v140)
                {
                  v135 = sub_100004A00();
                  v138 = v34->_identity;
                  v141 = v34->_nrUUID;
                  _NRLogWithArgs(v135, 16, "%s%.30s:%-4d %@: Different device found for identity %@ (%@ != %@)", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1641, v158, v138, v141, v158->_nrUUID);

                  goto LABEL_141;
                }
              }
              else
              {
                v136 = sub_100004A00();
                v137 = _NRLogIsLevelEnabled(v136, 16);

                if (v137)
                {
                  v135 = sub_100004A00();
                  v138 = v34->_identity;
                  _NRLogWithArgs(v135, 16, "%s%.30s:%-4d %@: No device found for identity %@", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1634, v28, v138);
LABEL_141:

                  goto LABEL_142;
                }
              }
            }
            else
            {
              v128 = sub_100004A00();
              v129 = _NRLogIsLevelEnabled(v128, 16);

              if (v129)
              {
                v135 = sub_100004A00();
                _NRLogWithArgs(v135, 16, "%s%.30s:%-4d %@: Failed to decrypt device identity", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1626, v28);
LABEL_142:

                v28 = v158;
              }
            }
            v45 = v155;
            sub_100004A40(v28, 3023, CFSTR("%@ %@"), v130, v131, v132, v133, v134, (uint64_t)v161);

            v15 = v161;
            v14 = v156;
            v18 = v157;
            v19 = v160;
            goto LABEL_131;
          }

        }
        goto LABEL_19;
      }
      if (qword_1001E44C8 != -1)
        dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
      v19 = v160;
      v15 = v161;
      if (_NRLogIsLevelEnabled(qword_1001E44C0, 16))
      {
        if (qword_1001E44C8 != -1)
          dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
        v54 = (id)qword_1001E44C0;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
        _NRLogWithArgs(v54, 16, "%s%.30s:%-4d %@: Remote identifier has wrong type %zu", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1606, self, objc_msgSend(v55, "identifierType"));
LABEL_57:

        v19 = v160;
        v15 = v161;
      }
    }
    else
    {
      if (qword_1001E44C8 != -1)
        dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
      v19 = v160;
      v15 = v161;
      if (_NRLogIsLevelEnabled(qword_1001E44C0, 16))
      {
        if (qword_1001E44C8 != -1)
          dispatch_once(&qword_1001E44C8, &stru_1001B5DD8);
        v54 = (id)qword_1001E44C0;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        _NRLogWithArgs(v54, 16, "%s%.30s:%-4d %@: Local identifier has wrong type %zu", ", "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1602, self, objc_msgSend(v55, "identifierType"));
        goto LABEL_57;
      }
    }
  }
LABEL_132:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_storeStrong((id *)&self->_initiatorLocalPublicClassAKeys, 0);
  objc_storeStrong((id *)&self->_initiatorLocalPublicClassCKeys, 0);
  objc_storeStrong((id *)&self->_initiatorLocalPublicClassDKeys, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_ikeSessionClassA, 0);
  objc_storeStrong((id *)&self->_ikeSessionClassC, 0);
  objc_storeStrong((id *)&self->_ikeSessionClassD, 0);
  objc_storeStrong((id *)&self->_ikeSessionPairing, 0);
  objc_storeStrong((id *)&self->_ikeListener, 0);
  objc_storeStrong((id *)&self->_randomUUID, 0);
  objc_storeStrong((id *)&self->_pairingParameters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
