@implementation OTSOSUpgradeOperation

- (OTSOSUpgradeOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8
{
  id v15;
  id v16;
  id v17;
  OTSOSUpgradeOperation *v18;
  OTSOSUpgradeOperation *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)OTSOSUpgradeOperation;
  v18 = -[CKKSGroupOperation init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_deps, a3);
    objc_storeStrong((id *)&v19->_intendedState, a4);
    objc_storeStrong((id *)&v19->_nextState, a6);
    objc_storeStrong((id *)&v19->_ckksConflictState, a5);
    objc_storeStrong((id *)&v19->_deviceInfo, a7);
    objc_storeStrong((id *)&v19->_policyOverride, a8);
  }

  return v19;
}

- (id)persistentKeyRef:(__SecKey *)a3 error:(id *)a4
{
  int v5;
  NSErrorDomain v6;
  uint64_t v7;
  id v9;

  v9 = 0;
  v5 = SecKeyCopyPersistentRef(a3, &v9);
  if (v5)
  {
    if (a4)
    {
      v6 = NSOSStatusErrorDomain;
      v7 = v5;
LABEL_7:
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, v7, 0));
    }
  }
  else if (a4 && v9)
  {
    v6 = NSOSStatusErrorDomain;
    v7 = -25300;
    goto LABEL_7;
  }
  return v9;
}

- (void)groupStart
{
  AAFAnalyticsEventSecurity *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AAFAnalyticsEventSecurity *v12;
  void *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  unsigned int v20;
  __CFString *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  __CFString *v25;
  unsigned __int8 v26;
  const void *v27;
  NSObject *v28;
  const void *v29;
  NSObject *v30;
  const __CFString *v31;
  const void *v32;
  NSObject *v33;
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
  const void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const void *v51;
  NSObject *v52;
  _BOOL4 v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  const void *v60;
  NSObject *v61;
  const void *v62;
  NSObject *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  const void *v75;
  NSObject *v76;
  const void *v77;
  NSObject *v78;
  const void *v79;
  NSObject *v80;
  void *v81;
  const void *v82;
  NSObject *v83;
  void *v84;
  const void *v85;
  NSObject *v86;
  void *v87;
  __CFString *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  unsigned int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  __CFString *v109;
  uint64_t v110;
  __CFString *v111;
  void *v112;
  __CFString *v113;
  const __CFString *v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  __CFString *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id location;
  uint8_t buf[4];
  const __CFString *v129;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [AAFAnalyticsEventSecurity alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "altDSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flowID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceSessionID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  LOBYTE(v90) = objc_msgSend(v11, "permittedToSendMetrics");
  v12 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v3, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v6, v8, v10, CFSTR("com.apple.security.preApprovedJoin"), 0, v90, &off_10030AF70);
  -[OTSOSUpgradeOperation setEventS:](self, "setEventS:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sosAdapter"));
  LOBYTE(v5) = objc_msgSend(v14, "sosEnabled");

  v15 = sub_10000EF14("octagon-sos");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attempting SOS upgrade", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sosAdapter"));
    v126 = 0;
    v20 = objc_msgSend(v19, "circleStatus:", &v126);
    v21 = (__CFString *)v126;

    if (v21 || v20 == -1)
    {
      v32 = sub_10000EF14("octagon-sos");
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v129 = v21;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Error fetching circle status: %@", buf, 0xCu);
      }

      -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", CFSTR("BecomeUntrusted"));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 71, CFSTR("Device not in SOS circle")));
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v25, 0, v34);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stateHolder"));
      v125 = 0;
      v24 = objc_msgSend(v23, "persistAccountChanges:error:", &stru_1002DEBE8, &v125);
      v25 = (__CFString *)v125;

      if (v25)
        v26 = 0;
      else
        v26 = v24;
      if ((v26 & 1) == 0)
      {
        v27 = sub_10000EF14("SecError");
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v25;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'attempted join' state: %@", buf, 0xCu);
        }

      }
      if (v20)
      {
        v29 = sub_10000EF14("octagon-sos");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          if (v20 + 1 > 4)
            v31 = CFSTR("kSOSCCError");
          else
            v31 = off_1002EB7C0[v20 + 1];
          *(_DWORD *)buf = 138412290;
          v129 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Device is not in SOS circle (state: %@), quitting SOS upgrade", buf, 0xCu);
        }

        -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", CFSTR("BecomeUntrusted"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 71, CFSTR("Device not in SOS circle")));
        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v34, 0, v38);
        v21 = 0;
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "sosAdapter"));
        v124 = 0;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "currentSOSSelf:", &v124));
        v21 = (__CFString *)v124;

        if (!v34 || v21)
        {
          v75 = sub_10000EF14("octagon-sos");
          v76 = objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v129 = v21;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Failed to get the current SOS self: %@", buf, 0xCu);
          }

          -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:](self, "handlePrepareErrors:nextExpectedState:", v21, CFSTR("BecomeUntrusted"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
          +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v38, 0, v21);
        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "signingKey"));
          v123 = 0;
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation persistentKeyRef:error:](self, "persistentKeyRef:error:", objc_msgSend(v37, "_secKey"), &v123));
          v21 = (__CFString *)v123;

          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "encryptionKey"));
            v122 = v21;
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation persistentKeyRef:error:](self, "persistentKeyRef:error:", objc_msgSend(v39, "_secKey"), &v122));
            v114 = v122;

            if (v40)
            {
              v120[0] = _NSConcreteStackBlock;
              v120[1] = 3221225472;
              v120[2] = sub_100120234;
              v120[3] = &unk_1002EB598;
              objc_copyWeak(&v121, &location);
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v120));
              -[OTSOSUpgradeOperation setFinishedOp:](self, "setFinishedOp:", v41);

              v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
              -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v42);

              v43 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stateHolder"));
              v119 = 0;
              v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "loadOrCreateAccountMetadata:", &v119));
              v113 = (__CFString *)v119;

              if (v112)
              {
                v110 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "parsedSecureElementIdentity"));
                v45 = sub_10000EF14("octagon-sos");
                v46 = objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Fetching trusted peers from SOS", buf, 2u);
                }

                v47 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sosAdapter"));
                v118 = 0;
                v49 = (void *)objc_claimAutoreleasedReturnValue(+[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:](OTSOSAdapterHelpers, "peerPublicSigningKeySPKIsForCircle:error:", v48, &v118));
                v111 = (__CFString *)v118;
                -[OTSOSUpgradeOperation setPeerPreapprovedSPKIs:](self, "setPeerPreapprovedSPKIs:", v49);

                v50 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
                v51 = sub_10000EF14("octagon-sos");
                v52 = objc_claimAutoreleasedReturnValue(v51);
                v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
                if (v50)
                {
                  if (v53)
                  {
                    v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
                    *(_DWORD *)buf = 138412290;
                    v129 = v54;
                    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "SOS preapproved keys are %@", buf, 0xCu);

                  }
                  v55 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "activeAccount"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "altDSID"));

                  if (v57)
                  {
                    v101 = v57;
                    v58 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "sosAdapter"));
                    v117 = 0;
                    v94 = objc_msgSend(v59, "safariViewSyncingEnabled:", &v117);
                    v109 = (__CFString *)v117;

                    if (v109)
                    {
                      v60 = sub_10000EF14("octagon-sos");
                      v61 = objc_claimAutoreleasedReturnValue(v60);
                      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v129 = v109;
                        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Unable to check safari view status: %@", buf, 0xCu);
                      }

                    }
                    v62 = sub_10000EF14("octagon-sos");
                    v63 = objc_claimAutoreleasedReturnValue(v62);
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                    {
                      v64 = CFSTR("disabled");
                      if (v94)
                        v64 = CFSTR("enabled");
                      *(_DWORD *)buf = 138412290;
                      v129 = v64;
                      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Safari view is: %@", buf, 0xCu);
                    }

                    v65 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "cuttlefishXPCWrapper"));
                    v66 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "activeAccount"));
                    v108 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v93 = objc_msgSend(v108, "epoch");
                    v107 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "machineID"));
                    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "UUIDString"));
                    v105 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "modelID"));
                    v104 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "deviceName"));
                    v67 = objc_opt_self(self);
                    v103 = (void *)objc_claimAutoreleasedReturnValue(v67);
                    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "deviceInfo"));
                    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "serialNumber"));
                    v69 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deviceInfo](self, "deviceInfo"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "osVersion"));
                    v71 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation policyOverride](self, "policyOverride"));
                    v92 = v66;
                    if (v94)
                      v72 = 2;
                    else
                      v72 = 1;
                    v115[0] = _NSConcreteStackBlock;
                    v115[1] = 3221225472;
                    v115[2] = sub_100120498;
                    v115[3] = &unk_1002DEC10;
                    objc_copyWeak(&v116, &location);
                    LODWORD(v91) = v72;
                    objc_msgSend(v99, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", v100, v93, v97, v101, v96, v98, v95, v68, v70, v71, 0, v91, v110, 0, v38,
                      v40,
                      v115);

                    objc_destroyWeak(&v116);
                    v73 = v101;
                    v74 = v101;
                  }
                  else
                  {
                    v85 = sub_10000EF14("authkit");
                    v86 = objc_claimAutoreleasedReturnValue(v85);
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                    {
                      v87 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
                      v88 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "activeAccount"));
                      *(_DWORD *)buf = 138412290;
                      v129 = v88;
                      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

                    }
                    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
                    -[CKKSResultOperation setError:](self, "setError:", v89);

                    v73 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
                    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v73);
                    v74 = 0;
                  }

                }
                else
                {
                  if (v53)
                  {
                    *(_DWORD *)buf = 138412290;
                    v129 = v111;
                    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Unable to fetch SOS preapproved keys: %@", buf, 0xCu);
                  }

                  -[CKKSResultOperation setError:](self, "setError:", v111);
                  v74 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
                  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v74);
                }

                v84 = (void *)v110;
              }
              else
              {
                if (!v113)
                  v113 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainOSStatus, -67671, 0));
                v82 = sub_10000EF14("SecError");
                v83 = objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v129 = v113;
                  _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "failed to retrieve account object: %@", buf, 0xCu);
                }

                -[CKKSResultOperation setError:](self, "setError:", v113);
                v84 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
                -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v84);
              }

              objc_destroyWeak(&v121);
            }
            else
            {
              v79 = sub_10000EF14("octagon-sos");
              v80 = objc_claimAutoreleasedReturnValue(v79);
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v129 = v114;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS encryption key: %@", buf, 0xCu);
              }

              -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:](self, "handlePrepareErrors:nextExpectedState:", v114, CFSTR("BecomeUntrusted"));
              v81 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
              +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v81, 0, v114);

              v40 = 0;
            }
            v21 = (__CFString *)v114;
          }
          else
          {
            v77 = sub_10000EF14("octagon-sos");
            v78 = objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v129 = v21;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS signing key: %@", buf, 0xCu);
            }

            -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:](self, "handlePrepareErrors:nextExpectedState:", v21, CFSTR("BecomeUntrusted"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
            +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v40, 0, v21);
          }

        }
      }

    }
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

    -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", CFSTR("BecomeUntrusted"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation eventS](self, "eventS"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 70, CFSTR("SOS not enabled on this platform")));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 0, v25);
  }

  objc_destroyWeak(&location);
}

- (void)afterPrepare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cuttlefishXPCWrapper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100120068;
  v8[3] = &unk_1002DEC38;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "preflightPreapprovedJoinWithSpecificUser:preapprovedKeys:reply:", v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)afterPreflight
{
  OTUpdateTrustedDeviceListOperation *v3;
  void *v4;
  OTUpdateTrustedDeviceListOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [OTUpdateTrustedDeviceListOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v5 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:](v3, "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:", v4, CFSTR("Ready"), CFSTR("Ready"), CFSTR("Error"), 0);
  -[OTSOSUpgradeOperation setUpdateOp:](self, "setUpdateOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
  objc_msgSend(v6, "setLogForUpgrade:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10012003C;
  v13 = &unk_1002EB598;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("after-update"), &v10));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp", v10, v11, v12, v13));
  objc_msgSend(v8, "addDependency:", v9);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)handlePrepareErrors:(id)a3 nextExpectedState:(id)a4
{
  id v6;
  __CFString *v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  int v14;
  id v15;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = sub_10000EF14("octagon-sos");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "handling prepare error: %@", (uint8_t *)&v14, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lockStateTracker"));
  v12 = objc_msgSend(v11, "isLockedError:", v6);

  if (v12)
    v13 = CFSTR("WaitForUnlock");
  else
    v13 = v7;
  -[OTSOSUpgradeOperation setNextState:](self, "setNextState:", v13);
  -[CKKSResultOperation setError:](self, "setError:", v6);

}

- (void)afterUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation updateOp](self, "updateOp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation nextState](self, "nextState"));
    -[OTSOSUpgradeOperation handlePrepareErrors:nextExpectedState:](self, "handlePrepareErrors:nextExpectedState:", v6, v7);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v10);

  }
  else
  {
    v8 = sub_10000EF14("octagon-sos");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved machineID allow-list", buf, 2u);
    }

    -[OTSOSUpgradeOperation afterSuccessfulAllowList](self, "afterSuccessfulAllowList");
  }
}

- (void)requestSilentEscrowUpdate
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  const void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  NSObject *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(v2, "escrowRequestClass"), "request:", &v12));
  v4 = v12;

  if (!v3 || v4)
  {
    v10 = sub_10000EF14("octagon-sos");
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      v9 = "Unable to acquire a EscrowRequest object: %@";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  v11 = 0;
  objc_msgSend(v3, "triggerEscrowUpdate:error:", CFSTR("octagon-sos"), &v11);
  v4 = v11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("OctagonEventUpgradeSilentEscrow"), 1, v4);

  v6 = sub_10000EF14("octagon-sos");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      v9 = "Unable to request silent escrow update: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requested silent escrow update", buf, 2u);
  }
  v4 = v7;
LABEL_10:

}

- (void)afterSuccessfulAllowList
{
  OTFetchCKKSKeysOperation *v3;
  void *v4;
  OTFetchCKKSKeysOperation *v5;
  const void *v6;
  NSObject *v7;
  OTFetchCKKSKeysOperation *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  OTFetchCKKSKeysOperation *v14;
  id v15;
  uint8_t buf[8];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [OTFetchCKKSKeysOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v5 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v3, "initWithDependencies:refetchNeeded:", v4, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v5);
  v6 = sub_10000EF14("octagon-sos");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching keys from CKKS", buf, 2u);
  }

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10011FFD0;
  v13 = &unk_1002EA8C8;
  objc_copyWeak(&v15, &location);
  v8 = v5;
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("sos-upgrade-with-keys"), &v10));
  objc_msgSend(v9, "addDependency:", v8, v10, v11, v12, v13);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  unsigned int v24;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = sub_10000EF14("octagon-sos");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
    v12 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 67109376;
    v22 = v10;
    v23 = 1024;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning SOS upgrade with %d key sets and %d SOS peers", buf, 0xEu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cuttlefishXPCWrapper"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeAccount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpgradeOperation peerPreapprovedSPKIs](self, "peerPreapprovedSPKIs"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011FB08;
  v18[3] = &unk_1002DEC88;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v14, "attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", v16, v6, v7, v17, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 144, 1);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCkksConflictState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (AAFAnalyticsEventSecurity)eventS
{
  return self->_eventS;
}

- (void)setEventS:(id)a3
{
  objc_storeStrong((id *)&self->_eventS, a3);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (OTUpdateTrustedDeviceListOperation)updateOp
{
  return (OTUpdateTrustedDeviceListOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUpdateOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)peerPreapprovedSPKIs
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPeerPreapprovedSPKIs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPreapprovedSPKIs, 0);
  objc_storeStrong((id *)&self->_updateOp, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_eventS, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_policyOverride, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
