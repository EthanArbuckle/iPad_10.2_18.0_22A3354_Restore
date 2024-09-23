@implementation OTPrepareAndRecoverTLKSharesForInheritancePeerOperation

- (OTPrepareAndRecoverTLKSharesForInheritancePeerOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 ik:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8 isInheritedAccount:(BOOL)a9 epoch:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *v20;
  OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v26.receiver = self;
  v26.super_class = (Class)OTPrepareAndRecoverTLKSharesForInheritancePeerOperation;
  v20 = -[CKKSGroupOperation init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deps, a3);
    objc_storeStrong((id *)&v21->_intendedState, a4);
    objc_storeStrong((id *)&v21->_nextState, a5);
    objc_storeStrong((id *)&v21->_ik, a6);
    objc_storeStrong((id *)&v21->_deviceInfo, a7);
    v21->_epoch = a10;
    objc_storeStrong((id *)&v21->_intendedState, a4);
    objc_storeStrong((id *)&v21->_nextState, a5);
    objc_storeStrong((id *)&v21->_policyOverride, a8);
  }

  return v21;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  TrustedPeersHelperCustodianRecoveryKey *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TrustedPeersHelperCustodianRecoveryKey *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[12];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating inheritance peer and recovering shares using an inheritance key", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation ik](self, "ik"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recoveryKeyData"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));

  -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation setSalt:](self, "setSalt:", &stru_1002EE888);
  v9 = [TrustedPeersHelperCustodianRecoveryKey alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation ik](self, "ik"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation salt](self, "salt"));
  v14 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:](v9, "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:", v12, 0, 0, v42, v13, 2);
  -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation setTphcrk:](self, "setTphcrk:", v14);

  *(_QWORD *)buf = 0;
  v49 = buf;
  v50 = 0x3032000000;
  v51 = sub_1000FADA4;
  v52 = sub_1000FADB4;
  v53 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stateHolder"));
  v46 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000FADBC;
  v47[3] = &unk_1002DDDE0;
  v47[4] = buf;
  v17 = objc_msgSend(v16, "persistAccountChanges:error:", v47, &v46);
  v43 = v46;

  if (v43)
    v18 = 0;
  else
    v18 = v17;
  if ((v18 & 1) == 0)
  {
    v19 = sub_10000EF14("SecError");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v54 = 138412290;
      *(_QWORD *)&v54[4] = v43;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'se' state: %@", v54, 0xCu);
    }

  }
  *(_QWORD *)v54 = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)v54, self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "cuttlefishXPCWrapper"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "activeAccount"));
  v31 = -[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation epoch](self, "epoch");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "machineID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "modelID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "serialNumber"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deviceInfo](self, "deviceInfo"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "osVersion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation policyOverride](self, "policyOverride"));
  v28 = *((_QWORD *)v49 + 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation tphcrk](self, "tphcrk"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000FAE00;
  v44[3] = &unk_1002DDE08;
  objc_copyWeak(&v45, (id *)v54);
  LODWORD(v30) = 0;
  objc_msgSend(v36, "prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:crk:reply:", v35, v31, v34, &stru_1002EE888, v33, v32, v22, v24, v26, v27, 0, v30, v28, 0, 0,
    v29,
    v44);

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)v54);

  _Block_object_dispose(buf, 8);
}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuttlefishXPCWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrepareAndRecoverTLKSharesForInheritancePeerOperation tphcrk](self, "tphcrk"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FAA34;
  v11[3] = &unk_1002DDE30;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v6, "recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:", v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

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

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 216, 1);
}

- (void)setIk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 232, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTphcrk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tphcrk, 0);
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_ik, 0);
  objc_storeStrong((id *)&self->_deps, 0);
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
