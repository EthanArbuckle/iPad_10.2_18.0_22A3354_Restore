@implementation OTPrepareOperation

- (OTPrepareOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 policyOverride:(id)a7 accountSettings:(id)a8 epoch:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  OTPrepareOperation *v19;
  OTPrepareOperation *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)OTPrepareOperation;
  v19 = -[CKKSGroupOperation init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_deps, a3);
    objc_storeStrong((id *)&v20->_deviceInfo, a6);
    v20->_epoch = a9;
    objc_storeStrong((id *)&v20->_intendedState, a4);
    objc_storeStrong((id *)&v20->_nextState, a5);
    objc_storeStrong((id *)&v20->_policyOverride, a7);
    objc_storeStrong((id *)&v20->_accountSettings, a8);
  }

  return v20;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  AAFAnalyticsEventSecurity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  const void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const void *v37;
  NSObject *v38;
  const void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  const void *v45;
  NSObject *v46;
  const void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const void *v59;
  NSObject *v60;
  const void *v61;
  const void *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  AAFAnalyticsEventSecurity *v80;
  void *v81;
  _QWORD v82[4];
  AAFAnalyticsEventSecurity *v83;
  id v84;
  id v85;
  _QWORD v86[5];
  id v87;
  id location;
  _BYTE v89[12];
  __int128 buf;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint8_t v95[4];
  int v96;

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "preparing an identity", (uint8_t *)&buf, 2u);
  }

  v5 = [AAFAnalyticsEventSecurity alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flowID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceSessionID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  LOBYTE(v63) = objc_msgSend(v13, "permittedToSendMetrics");
  v80 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v5, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v8, v10, v12, CFSTR("com.apple.security.prepareIdentityInTPH"), 0, v63, &off_10030AF70);

  v14 = objc_alloc_init((Class)NSOperation);
  -[OTPrepareOperation setFinishedOp:](self, "setFinishedOp:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeAccount"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "altDSID"));

  if (v81)
  {
    v79 = v81;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sosAdapter"));
    v20 = objc_msgSend(v19, "sosEnabled");

    if (!v20)
    {
      v71 = 0;
      v77 = 0;
LABEL_26:
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v91 = 0x3032000000;
      v92 = sub_10009FB44;
      v93 = sub_10009FB54;
      v94 = 0;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stateHolder"));
      v85 = 0;
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_10009FB5C;
      v86[3] = &unk_1002DDDE0;
      v86[4] = &buf;
      v43 = objc_msgSend(v42, "persistAccountChanges:error:", v86, &v85);
      v78 = v85;

      if (v78)
        v44 = 0;
      else
        v44 = v43;
      if ((v44 & 1) == 0)
      {
        v45 = sub_10000EF14("SecError");
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v89 = 138412290;
          *(_QWORD *)&v89[4] = v78;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'attempted join' state: %@", v89, 0xCu);
        }

      }
      v47 = sub_10000EF14("octagon");
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation accountSettings](self, "accountSettings"));
        *(_DWORD *)v89 = 138412290;
        *(_QWORD *)&v89[4] = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "preparing identity with %@", v89, 0xCu);

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "cuttlefishXPCWrapper"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "activeAccount"));
      v65 = -[OTPrepareOperation epoch](self, "epoch");
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "machineID"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "UUIDString"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "modelID"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "deviceName"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "serialNumber"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deviceInfo](self, "deviceInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "osVersion"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation policyOverride](self, "policyOverride"));
      v57 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation accountSettings](self, "accountSettings"));
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_10009FBAC;
      v82[3] = &unk_1002DC890;
      objc_copyWeak(&v84, &location);
      v83 = v80;
      LODWORD(v64) = 3;
      objc_msgSend(v70, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", v69, v65, v67, v79, v66, v68, v51, v53, v55, v56, 0, v64, v57, v58, v71,
        v77,
        v82);

      objc_destroyWeak(&v84);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(&location);
      goto LABEL_36;
    }
    v21 = sub_10000EF14("octagon-sos");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Investigating use of Octagon keys from SOS identity", (uint8_t *)&buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sosAdapter"));
    v87 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentSOSSelf:", &v87));
    v26 = v87;

    if (!v25 || v26)
    {
      v37 = sub_10000EF14("octagon-sos");
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to get the current SOS self: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      *(_QWORD *)&buf = 0;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "signingKey"));
      v28 = SecKeyCopyPersistentRef(objc_msgSend(v27, "_secKey"), &buf);

      if (v28 || !(_QWORD)buf)
      {
        v39 = sub_10000EF14("octagon-sos");
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v89 = 67109120;
          *(_DWORD *)&v89[4] = v28;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS signing key: %d", v89, 8u);
        }

      }
      else
      {
        *(_QWORD *)v89 = 0;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "encryptionKey"));
        v30 = SecKeyCopyPersistentRef(objc_msgSend(v29, "_secKey"), v89);

        if (!v30)
        {
          v77 = *(void **)v89;
          if (*(_QWORD *)v89)
          {
            v71 = (void *)buf;
LABEL_25:

            goto LABEL_26;
          }
        }
        v59 = sub_10000EF14("octagon-sos");
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v95 = 67109120;
          v96 = v30;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS encryption key: %d", v95, 8u);
        }

        v61 = (const void *)buf;
        if ((_QWORD)buf)
        {
          *(_QWORD *)&buf = 0;
          CFRelease(v61);
        }
        v62 = *(const void **)v89;
        if (*(_QWORD *)v89)
        {
          *(_QWORD *)v89 = 0;
          CFRelease(v62);
          v71 = 0;
          v77 = 0;
          goto LABEL_25;
        }
      }
    }
    v71 = 0;
    v77 = 0;
    goto LABEL_25;
  }
  v31 = sub_10000EF14("authkit");
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation deps](self, "deps"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "activeAccount"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", (uint8_t *)&buf, 0xCu);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
  -[CKKSResultOperation setError:](self, "setError:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);

  v79 = (id)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v80, 0, v79);
LABEL_36:

}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSData)permanentInfo
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPermanentInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSData)permanentInfoSig
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPermanentInfoSig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSData)stableInfo
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStableInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)stableInfoSig
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setStableInfoSig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPolicyOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (OTAccountSettings)accountSettings
{
  return (OTAccountSettings *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAccountSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 224, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_accountSettings, 0);
  objc_storeStrong((id *)&self->_policyOverride, 0);
  objc_storeStrong((id *)&self->_stableInfoSig, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfoSig, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
