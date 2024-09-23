@implementation KTEnrollmentRegistrationSignature

- (KTEnrollmentRegistrationSignature)initWithDependencies:(id)a3 forceUpdate:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6 idsRegistrationInterface:(id)a7 signatureTracker:(id)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  KTEnrollmentRegistrationSignature *v17;
  KTEnrollmentRegistrationSignature *v18;
  KTEnrollmentRegistrationSignature *v19;
  objc_super v21;

  v11 = a4;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)KTEnrollmentRegistrationSignature;
  v17 = -[KTGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    -[KTEnrollmentRegistrationSignature setDeps:](v17, "setDeps:", v13);
    -[KTEnrollmentRegistrationSignature setForceUpdate:](v18, "setForceUpdate:", v11);
    -[KTEnrollmentRegistrationSignature setNextState:](v18, "setNextState:", v14);
    -[KTEnrollmentRegistrationSignature setIdsRegistrationInterface:](v18, "setIdsRegistrationInterface:", v15);
    -[KTEnrollmentRegistrationSignature setSignatureTracker:](v18, "setSignatureTracker:", v16);
    v19 = v18;
  }

  return v18;
}

- (void)recordKeyState:(int)a3 application:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "logger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TBS-%@-%@"), CFSTR("k"), v6));

  objc_msgSend(v7, "setNumberProperty:forKey:", v8, v9);
}

- (void)groupStart
{
  void *v2;
  KDeviceSet *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  KTPendingFlag *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  KDeviceSet *v43;
  void *v44;
  id v45;
  _QWORD block[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  _QWORD v53[5];
  KDeviceSet *v54;
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v3 = objc_alloc_init(KDeviceSet);
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountOperations"));
  v60 = 0;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryAccount:", &v60));
  v42 = v60;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "aa_altDSID"));
  if (!v6)
  {
    if (qword_1002A7710 != -1)
      dispatch_once(&qword_1002A7710, &stru_1002474D0);
    v7 = qword_1002A7718;
    if (os_log_type_enabled((os_log_t)qword_1002A7718, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v42;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't get AltDSID: %@", buf, 0xCu);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "aa_personID"));
  if (!v8)
  {
    if (qword_1002A7710 != -1)
      dispatch_once(&qword_1002A7710, &stru_1002474F0);
    v9 = qword_1002A7718;
    if (os_log_type_enabled((os_log_t)qword_1002A7718, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v42;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't get DSID: %@", buf, 0xCu);
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "smDataStore"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1001361B0;
  v53[3] = &unk_100247680;
  v53[4] = self;
  v43 = v3;
  v54 = v43;
  v45 = v2;
  v55 = v45;
  v41 = v8;
  v56 = v41;
  v40 = v6;
  v57 = v40;
  v58 = &v65;
  v59 = &v61;
  objc_msgSend(v11, "fetchDeviceSignature:complete:", 0, v53);

  if (qword_1002A7710 != -1)
    dispatch_once(&qword_1002A7710, &stru_1002476A0);
  v12 = (id)qword_1002A7718;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v45, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v71) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating registration datas: %d", buf, 8u);
  }

  if (objc_msgSend(v45, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "smDataStore"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100137164;
    v52[3] = &unk_1002476C8;
    v52[4] = self;
    objc_msgSend(v15, "storeDeviceSignature:complete:", v45, v52);

    *((_BYTE *)v62 + 24) = 1;
  }
  v16 = (KTPendingFlag *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag cloudRecords](v16, "cloudRecords"));
  if (!v17 || !*((_BYTE *)v62 + 24))
    goto LABEL_32;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v43, "devices"));
  v19 = objc_msgSend(v18, "count") == 0;

  if (!v19)
  {
    if (qword_1002A7710 != -1)
      dispatch_once(&qword_1002A7710, &stru_1002476E8);
    v20 = (id)qword_1002A7718;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v43, "devices"));
      v22 = objc_msgSend(v21, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v71) = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Updating cloud devices: %d", buf, 8u);

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v43, "devices"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cloudRecords"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pushToken"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "registrationData"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "apps"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allObjects"));
          objc_msgSend(v30, "updateSelfCloudDeviceWithPushToken:tbsRegistrationData:applications:", v31, v32, v34);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
      }
      while (v25);
    }

    v16 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("CloudKitOutgoing"), 2, 5.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flagHandler"));
    objc_msgSend(v35, "handlePendingFlag:", v16);

LABEL_32:
  }
  if (*((_BYTE *)v66 + 24) || -[KTEnrollmentRegistrationSignature forceUpdate](self, "forceUpdate"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature signatureTracker](self, "signatureTracker"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "signatureQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100137214;
    block[3] = &unk_10023A390;
    block[4] = self;
    dispatch_async(v37, block);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "flagHandler"));
    objc_msgSend(v39, "cancelPendingFlag:", CFSTR("ValidateSelf"));

  }
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v65, 8);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 126, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (BOOL)forceUpdate
{
  return self->_forceUpdate;
}

- (void)setForceUpdate:(BOOL)a3
{
  self->_forceUpdate = a3;
}

- (KTCheckIDSRegistrationInterface)idsRegistrationInterface
{
  return (KTCheckIDSRegistrationInterface *)objc_loadWeakRetained((id *)((char *)&self->_deps + 6));
}

- (void)setIdsRegistrationInterface:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_deps + 6), a3);
}

- (KTSignatureTracker)signatureTracker
{
  return (KTSignatureTracker *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->_idsRegistrationInterface
                                                                                      + 6)));
}

- (void)setSignatureTracker:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_idsRegistrationInterface + 6), a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->_idsRegistrationInterface + 6));
  objc_destroyWeak((id *)((char *)&self->_deps + 6));
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_forceUpdate + 6), 0);
}

@end
