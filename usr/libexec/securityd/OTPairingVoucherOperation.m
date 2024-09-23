@implementation OTPairingVoucherOperation

- (OTPairingVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 peerID:(id)a7 permanentInfo:(id)a8 permanentInfoSig:(id)a9 stableInfo:(id)a10 stableInfoSig:(id)a11
{
  id v18;
  OTPairingVoucherOperation *v19;
  OTPairingVoucherOperation *v20;
  id obj;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  obj = a6;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v23 = a10;
  v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)OTPairingVoucherOperation;
  v19 = -[CKKSGroupOperation init](&v31, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_intendedState, a4);
    objc_storeStrong((id *)&v20->_nextState, a5);
    objc_storeStrong((id *)&v20->_operationDependencies, a3);
    objc_storeStrong((id *)&v20->_peerID, a7);
    objc_storeStrong((id *)&v20->_permanentInfo, a8);
    objc_storeStrong((id *)&v20->_permanentInfoSig, a9);
    objc_storeStrong((id *)&v20->_stableInfo, a10);
    objc_storeStrong((id *)&v20->_stableInfoSig, a11);
    objc_storeStrong((id *)&v20->_deviceInfo, obj);
  }

  return v20;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  AAFAnalyticsEventSecurity *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AAFAnalyticsEventSecurity *v16;
  OTFetchCKKSKeysOperation *v17;
  void *v18;
  OTFetchCKKSKeysOperation *v19;
  OTFetchCKKSKeysOperation *v20;
  AAFAnalyticsEventSecurity *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  OTFetchCKKSKeysOperation *v25;
  AAFAnalyticsEventSecurity *v26;
  id v27;
  uint8_t buf[8];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTPairingVoucherOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = [AAFAnalyticsEventSecurity alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "altDSID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flowID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceSessionID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  LOBYTE(v23) = objc_msgSend(v15, "permittedToSendMetrics");
  v16 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v7, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v10, v12, v14, CFSTR("com.apple.security.cKKSTLKFetch"), 0, v23, &off_10030AF70);

  v17 = [OTFetchCKKSKeysOperation alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v19 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v17, "initWithDependencies:refetchNeeded:", v18, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v19);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10014F098;
  v24[3] = &unk_1002EB5C0;
  objc_copyWeak(&v27, (id *)buf);
  v20 = v19;
  v25 = v20;
  v21 = v16;
  v26 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("vouch-with-keys"), v24));
  objc_msgSend(v22, "addDependency:", v20);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithKeys:(id)a3
{
  const void *v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  unsigned int v28;

  v23 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = sub_10000EF14("octagon");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 67109120;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "vouching with %d keysets", buf, 8u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cuttlefishXPCWrapper"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeAccount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation peerID](self, "peerID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation permanentInfo](self, "permanentInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation permanentInfoSig](self, "permanentInfoSig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation stableInfo](self, "stableInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation stableInfoSig](self, "stableInfoSig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flowID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceSessionID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingVoucherOperation operationDependencies](self, "operationDependencies"));
  v14 = objc_msgSend(v13, "permittedToSendMetrics");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10014EF38;
  v24[3] = &unk_1002E8F90;
  objc_copyWeak(&v25, &location);
  LOBYTE(v15) = v14;
  objc_msgSend(v20, "vouchWithSpecificUser:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:ckksKeys:flowID:deviceSessionID:canSendMetrics:reply:", v19, v18, v17, v16, v7, v8, v23, v10, v12, v15, v24);

  objc_destroyWeak(&v25);
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

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (NSData)permanentInfo
{
  return self->_permanentInfo;
}

- (void)setPermanentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_permanentInfo, a3);
}

- (NSData)permanentInfoSig
{
  return self->_permanentInfoSig;
}

- (void)setPermanentInfoSig:(id)a3
{
  objc_storeStrong((id *)&self->_permanentInfoSig, a3);
}

- (NSData)stableInfo
{
  return self->_stableInfo;
}

- (void)setStableInfo:(id)a3
{
  objc_storeStrong((id *)&self->_stableInfo, a3);
}

- (NSData)stableInfoSig
{
  return self->_stableInfoSig;
}

- (void)setStableInfoSig:(id)a3
{
  objc_storeStrong((id *)&self->_stableInfoSig, a3);
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (NSData)voucherSig
{
  return self->_voucherSig;
}

- (void)setVoucherSig:(id)a3
{
  objc_storeStrong((id *)&self->_voucherSig, a3);
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOperationDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_voucherSig, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_stableInfoSig, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfoSig, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
