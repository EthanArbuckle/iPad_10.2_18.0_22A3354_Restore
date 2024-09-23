@implementation OTUpdateTrustedDeviceListOperation

- (OTUpdateTrustedDeviceListOperation)initWithDependencies:(id)a3 intendedState:(id)a4 listUpdatesState:(id)a5 errorState:(id)a6 retryFlag:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  char *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTUpdateTrustedDeviceListOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 150), a3);
    objc_storeStrong((id *)(v18 + 142), a4);
    objc_storeStrong((id *)(v18 + 134), a6);
    objc_storeStrong((id *)(v18 + 158), a5);
    objc_storeStrong((id *)(v18 + 166), a7);
  }

  return (OTUpdateTrustedDeviceListOperation *)v18;
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
  AAFAnalyticsEventSecurity *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  AAFAnalyticsEventSecurity *v38;
  _QWORD v39[4];
  id v40;
  unsigned __int8 v41;
  id v42;
  _QWORD v43[4];
  AAFAnalyticsEventSecurity *v44;
  id v45;
  id location;
  uint8_t buf[4];
  id v48;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = sub_10000EF14("octagon-authkit");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to update trusted device list", buf, 2u);
  }

  v5 = [AAFAnalyticsEventSecurity alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flowID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceSessionID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  LOBYTE(v37) = objc_msgSend(v13, "permittedToSendMetrics");
  v14 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v5, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v8, v10, v12, CFSTR("com.apple.security.updateTDL"), 0, v37, &off_10030AF70);

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10008AE44;
  v43[3] = &unk_1002EA8C8;
  objc_copyWeak(&v45, &location);
  v38 = v14;
  v44 = v38;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v43));
  -[OTUpdateTrustedDeviceListOperation setFinishedOp:](self, "setFinishedOp:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeAccount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "altDSID"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "authKitAdapter"));
    v42 = 0;
    v22 = objc_msgSend(v21, "accountIsDemoAccountByAltDSID:error:", v19, &v42);
    v23 = v42;

    if (v23)
    {
      v24 = sub_10000EF14("SecError");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "octagon-authkit: failed to fetch demo account flag: %@", buf, 0xCu);
      }

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "authKitAdapter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "flowID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "deviceSessionID"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10008B190;
    v39[3] = &unk_1002DC5B8;
    objc_copyWeak(&v40, &location);
    v41 = v22;
    objc_msgSend(v27, "fetchCurrentDeviceListByAltDSID:flowID:deviceSessionID:reply:", v19, v29, v31, v39);

    objc_destroyWeak(&v40);
  }
  else
  {
    v32 = sub_10000EF14("authkit");
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "activeAccount"));
      *(_DWORD *)buf = 138412290;
      v48 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
    -[CKKSResultOperation setError:](self, "setError:", v36);

    v23 = (id)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v23);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

- (void)afterAuthKitFetch:(id)a3 userInitiatedRemovals:(id)a4 evictedRemovals:(id)a5 unknownReasonRemovals:(id)a6 trustedDeviceHash:(id)a7 deletedDeviceHash:(id)a8 trustedDevicesUpdateTimestamp:(id)a9 accountIsDemo:(BOOL)a10 version:(id)a11
{
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location[2];

  v44 = a3;
  v43 = a4;
  v42 = a5;
  v37 = a6;
  v41 = a7;
  v36 = a8;
  v40 = a9;
  v35 = a11;
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceInformationAdapter"));
  v19 = objc_msgSend(v18, "isMachineIDOverridden");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cuttlefishXPCWrapper"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeAccount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "flowID"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "deviceSessionID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v25 = objc_msgSend(v38, "permittedToSendMetrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "activeAccount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "altDSID"));
  v32 = v21;
  v29 = (v19 | a10) ^ 1;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10008AC70;
  v45[3] = &unk_1002DC5E0;
  objc_copyWeak(&v47, location);
  v30 = v35;
  v46 = v30;
  LOBYTE(v31) = v25;
  objc_msgSend(v34, "setAllowedMachineIDsWithSpecificUser:allowedMachineIDs:userInitiatedRemovals:evictedRemovals:unknownReasonRemovals:honorIDMSListChanges:version:flowID:deviceSessionID:canSendMetrics:altDSID:trustedDeviceHash:deletedDeviceHash:trustedDevicesUpdateTimestamp:reply:", v33, v44, v43, v42, v37, v29, v30, v23, v24, v31, v28, v41, v36, v40, v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(location);

}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (BOOL)logForUpgrade
{
  return self->_logForUpgrade;
}

- (void)setLogForUpgrade:(BOOL)a3
{
  self->_logForUpgrade = a3;
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (OctagonStateString)stateIfListUpdates
{
  return (OctagonStateString *)objc_getProperty(self, a2, 158, 1);
}

- (void)setStateIfListUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (OctagonFlagString)retryFlag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 166, 1);
}

- (void)setRetryFlag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_retryFlag + 6), 0);
  objc_storeStrong((id *)((char *)&self->_stateIfListUpdates + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)(&self->_logForUpgrade + 6), 0);
}

@end
