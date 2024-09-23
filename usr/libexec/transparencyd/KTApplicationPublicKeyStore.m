@implementation KTApplicationPublicKeyStore

- (BOOL)readyWithRefresh:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vrfKey"));
  if (!v6)
    goto LABEL_15;
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appSthKeyStore"));
  if (!v9)
  {

LABEL_15:
    return 0;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tltKeyStore"));

  if (!v12)
    return 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vrfKey"));
  v15 = objc_msgSend(v14, "needsRefresh");

  if (v15)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249770);
    v16 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      v49 = 138412290;
      v50 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Trusted VRF key need refresh: %@", (uint8_t *)&v49, 0xCu);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appSthKeyStore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signatureVerifier"));
  v22 = objc_msgSend(v21, "needsRefresh");

  if (v22)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249790);
    v23 = (void *)qword_1002A7960;
    v24 = 0;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v23;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      v49 = 138412290;
      v50 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Trusted application STH signing keys need refresh: %@", (uint8_t *)&v49, 0xCu);

      v24 = 0;
    }
  }
  else
  {
    v24 = v15 ^ 1;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v29 = objc_msgSend(v28, "isEqualToString:", kKTApplicationIdentifierTLT);

  if ((v29 & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "appSmtKeyStore"));
    if (v31)
    {
      v32 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "appSmtKeyStore"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "signatureVerifier"));
      v36 = objc_msgSend(v35, "needsRefresh");

      if (!v36)
        goto LABEL_28;
    }
    else
    {

    }
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_1002497B0);
    v37 = (void *)qword_1002A7960;
    v24 = 0;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      v49 = 138412290;
      v50 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Trusted application SMT signing keys need refresh: %@", (uint8_t *)&v49, 0xCu);

      v24 = 0;
    }
  }
LABEL_28:
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "tltKeyStore"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "signatureVerifier"));
  v43 = objc_msgSend(v42, "needsRefresh");

  if (v43)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_1002497D0);
    v44 = (void *)qword_1002A7960;
    v24 = 0;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      v49 = 138412290;
      v50 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Trusted TLT signing keys need refresh: %@", (uint8_t *)&v49, 0xCu);

      v24 = 0;
    }
  }
  if ((v24 & 1) == 0 && v3)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore delegate](self, "delegate"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
    objc_msgSend(v47, "storeNeedsUpdate:", v48);

    return 0;
  }
  return v24;
}

- (BOOL)ready
{
  return -[KTApplicationPublicKeyStore readyWithRefresh:](self, "readyWithRefresh:", 1);
}

- (BOOL)storeExpired
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore receiptTime](self, "receiptTime"));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;
  v6 = (double)(uint64_t)-kKTPublicKeysResponseRefresh;

  if (v5 < v6)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_1002497F0);
    v7 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Public Keys Response older than refresh time period: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  return v5 < v6;
}

- (BOOL)triggerRefreshFromServerStatus:(int)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  int v23;
  void *v24;

  if (a3 != 6)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore receiptTime](self, "receiptTime"));
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = (double)(uint64_t)-kKTPublicKeysResponseRefreshInvalidRequest;

  if (v6 >= v7)
    return 0;
  if (qword_1002A7958 != -1)
    dispatch_once(&qword_1002A7958, &stru_100249810);
  v8 = (void *)qword_1002A7960;
  if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
    v23 = 138543362;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got invalid request status and public keys response for %{public}@ is old; setting key store as needs refresh",
      (uint8_t *)&v23,
      0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vrfKey"));
  v13 = 1;
  objc_msgSend(v12, "setNeedsRefresh:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appSmtKeyStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signatureVerifier"));
  objc_msgSend(v16, "setNeedsRefresh:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appSthKeyStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "signatureVerifier"));
  objc_msgSend(v19, "setNeedsRefresh:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  objc_msgSend(WeakRetained, "storeNeedsUpdate:", v21);

  return v13;
}

- (void)clearState:(id *)a3
{
  KTApplicationPublicKeyStore *obj;

  obj = self;
  objc_sync_enter(obj);
  -[KTApplicationPublicKeyStore setKeyBag:](obj, "setKeyBag:", 0);
  objc_sync_exit(obj);

}

- (VRFPublicKey)vrfKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "vrfKey"));

  return (VRFPublicKey *)v3;
}

- (TransparencyTrustedKeyStore)appSmtKeyStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appSmtKeyStore"));

  return (TransparencyTrustedKeyStore *)v3;
}

- (TransparencyTrustedKeyStore)appSthKeyStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appSthKeyStore"));

  return (TransparencyTrustedKeyStore *)v3;
}

- (TransparencyTrustedKeyStore)tltKeyStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tltKeyStore"));

  return (TransparencyTrustedKeyStore *)v3;
}

- (BOOL)unsupported
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "unsupported");

  return v3;
}

- (unint64_t)patLogBeginningMs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "patLogBeginningMs");

  return (unint64_t)v3;
}

- (unint64_t)tltLogBeginningMs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "tltLogBeginningMs");

  return (unint64_t)v3;
}

- (int)tltEarliestVersion
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "tltEarliestVersion");

  return v3;
}

- (int)patEarliestVersion
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "patEarliestVersion");

  return v3;
}

- (unint64_t)shutDown
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "shutDown");

  return (unint64_t)v3;
}

- (NSString)treeRollInfoURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "treeRollInfoURL"));

  return (NSString *)v3;
}

- (id)copyKeyStoreState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "diskStoreDictionary"));

  return v3;
}

- (void)notifyTreeResetDetected:(BOOL)a3 logTimestamp:(unint64_t)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;
  void *v29;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "noteEventNamed:", CFSTR("ktTLTResetEvent"));

    notify_post("com.apple.Transparency.TLTReset");
    notify_post("com.apple.Transparency.KT.IDSReset");
    notify_post("com.apple.Transparency.KT.FTReset");
    notify_post("com.apple.Transparency.KT.MPReset");
LABEL_3:
    notify_post("com.apple.Transparency.KT.CKReset");
    return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("TreeResetEvent"), v9));
  objc_msgSend(v8, "noteEventNamed:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", kKTApplicationIdentifierIDS);

  if ((_DWORD)v10)
  {
    notify_post("com.apple.Transparency.KT.IDSReset");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore delegate](self, "delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "optInStateForKeyStore:error:", v13, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore contextStore](self, "contextStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "followup"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore treeRollInfoURL](self, "treeRollInfoURL"));
    v28 = CFSTR("logBeginMs");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
    v29 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    objc_msgSend(v16, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:", v17, 3, v18, 0, v14, v19, v21, 0);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
    v23 = objc_msgSend(v22, "isEqualToString:", kKTApplicationIdentifierIDSFaceTime);

    if (v23)
    {
      notify_post("com.apple.Transparency.KT.FTReset");
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      v25 = objc_msgSend(v24, "isEqualToString:", kKTApplicationIdentifierIDSMultiplex);

      if (v25)
      {
        notify_post("com.apple.Transparency.KT.MPReset");
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
        v27 = objc_msgSend(v26, "isEqualToString:", kKTApplicationIdentifierCloudKit);

        if (v27)
          goto LABEL_3;
      }
    }
  }
}

- (BOOL)detectResetForTLT:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  unint64_t v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  if (!objc_msgSend(v5, "tltLogBeginningMs"))
  {

    return 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v7 = objc_msgSend(v6, "tltLogBeginningMs");

  if ((unint64_t)v7 >= a3)
    return 0;
  if (qword_1002A7958 != -1)
    dispatch_once(&qword_1002A7958, &stru_100249830);
  v8 = (void *)qword_1002A7960;
  if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
    v12 = 134218240;
    v13 = objc_msgSend(v10, "tltLogBeginningMs");
    v14 = 2048;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Detected a TLT reset from %llu to %llu", (uint8_t *)&v12, 0x16u);

  }
  return 1;
}

- (void)clearDataForTLT:(unint64_t)a3 dataStore:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore contextStore](self, "contextStore"));
  objc_msgSend(v7, "clearGossip");

  v8 = kKTApplicationIdentifierTLT;
  v23 = 0;
  LOBYTE(a3) = objc_msgSend(v6, "deleteSTHs:logBeginMsLessThan:error:", kKTApplicationIdentifierTLT, a3, &v23);
  v9 = v23;
  if ((a3 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249850);
    v10 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to delete TLT STHs from prior epoch: %@", buf, 0xCu);
    }
  }
  v22 = v9;
  v11 = objc_msgSend(v6, "deleteDownloadRecords:error:", v8, &v22);
  v12 = v22;

  if ((v11 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249870);
    v13 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to delete TLT download records: %@", buf, 0xCu);
    }
  }
  v21 = v12;
  v14 = objc_msgSend(v6, "deleteServerRPCs:error:", v8, &v21);
  v15 = v21;

  if ((v14 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249890);
    v16 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to delete TLT server RPCs: %@", buf, 0xCu);
    }
  }
  v20 = v15;
  v17 = objc_msgSend(v6, "resetRequestsForTLTReset:", &v20);
  v18 = v20;

  if ((v17 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_1002498B0);
    v19 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to delete stored requests for all applications: %@", buf, 0xCu);
    }
  }

}

- (BOOL)detectResetForPAT:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  unint64_t v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  if (!objc_msgSend(v5, "patLogBeginningMs"))
  {

    return 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v7 = objc_msgSend(v6, "patLogBeginningMs");

  if ((unint64_t)v7 >= a3)
    return 0;
  if (qword_1002A7958 != -1)
    dispatch_once(&qword_1002A7958, &stru_1002498D0);
  v8 = (void *)qword_1002A7960;
  if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
    v12 = 134218240;
    v13 = objc_msgSend(v10, "patLogBeginningMs");
    v14 = 2048;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Detected a PAT reset from %llu to %llu", (uint8_t *)&v12, 0x16u);

  }
  return 1;
}

- (void)clearDataForPAT:(unint64_t)a3 dataStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trustedAppSigningKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v44 = 0;
  v11 = objc_msgSend(v6, "deleteSMTsWithSPKINotIn:application:error:", v9, v10, &v44);
  v12 = v44;

  if ((v11 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_1002498F0);
    v13 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *(_DWORD *)buf = 138412546;
      v46 = v15;
      v47 = 2112;
      v48 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to delete %@ PAT SMTs from prior epoch: %@", buf, 0x16u);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v43 = v12;
  v17 = objc_msgSend(v6, "deleteSTHs:logBeginMsLessThan:error:", v16, a3, &v43);
  v18 = v43;

  if ((v17 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249910);
    v19 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *(_DWORD *)buf = 138412546;
      v46 = v21;
      v47 = 2112;
      v48 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to delete %@ PAT STHs from prior epoch: %@", buf, 0x16u);

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v42 = v18;
  v23 = objc_msgSend(v6, "deleteDownloadRecords:error:", v22, &v42);
  v24 = v42;

  if ((v23 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249930);
    v25 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *(_DWORD *)buf = 138412546;
      v46 = v27;
      v47 = 2112;
      v48 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to delete %@ download records: %@", buf, 0x16u);

    }
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v41 = v24;
  v29 = objc_msgSend(v6, "deleteServerRPCs:error:", v28, &v41);
  v30 = v41;

  if ((v29 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249950);
    v31 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *(_DWORD *)buf = 138412546;
      v46 = v33;
      v47 = 2112;
      v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "failed to delete %@ server RPCs: %@", buf, 0x16u);

    }
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v40 = v30;
  v35 = objc_msgSend(v6, "resetRequestsForApplication:error:", v34, &v40);
  v36 = v40;

  if ((v35 & 1) == 0)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249970);
    v37 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *(_DWORD *)buf = 138412546;
      v46 = v39;
      v47 = 2112;
      v48 = v36;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "failed to delete stored requests for %@: %@", buf, 0x16u);

    }
  }

}

- (BOOL)detectEpochChangeAndResetData:(unint64_t)a3 patLogBeginningMs:(unint64_t)a4 mapStillPopulating:(BOOL)a5 dataStore:(id)a6
{
  _BOOL4 v6;
  id v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  unint64_t v17;

  v6 = a5;
  v10 = a6;
  v11 = -[KTApplicationPublicKeyStore detectResetForTLT:](self, "detectResetForTLT:", a3);
  if (v11)
  {
    -[KTApplicationPublicKeyStore clearDataForTLT:dataStore:](self, "clearDataForTLT:dataStore:", a3, v10);
    -[KTApplicationPublicKeyStore notifyTreeResetDetected:logTimestamp:](self, "notifyTreeResetDetected:logTimestamp:", 1, a3);
  }
  v12 = -[KTApplicationPublicKeyStore detectResetForPAT:](self, "detectResetForPAT:", a4);
  if (v12)
  {
    -[KTApplicationPublicKeyStore clearDataForPAT:dataStore:](self, "clearDataForPAT:dataStore:", a4, v10);
    if (v6)
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249990);
      v13 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134217984;
        v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying about PAT reset %llu", (uint8_t *)&v16, 0xCu);
      }
      -[KTApplicationPublicKeyStore notifyTreeResetDetected:logTimestamp:](self, "notifyTreeResetDetected:logTimestamp:", 0, a4);
    }
    else
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_1002499B0);
      v14 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134217984;
        v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not notifying about PAT reset %llu", (uint8_t *)&v16, 0xCu);
      }
    }
  }

  return v11 | v12;
}

- (BOOL)inResetWindow
{
  void *v2;
  id v3;
  double v4;
  double v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v3 = objc_msgSend(v2, "patLogBeginningMs");
  v4 = (double)((unint64_t)v3 + kKTMaximumResetFailureWindowMs);
  +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
  v6 = v5 < v4;

  return v6;
}

- (void)startKeyStoreStateSampler
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100168184;
  v7[4] = sub_100168194;
  v8 = 0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KeyStoreState-%@"), v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10016819C;
  v6[3] = &unk_1002499D8;
  v6[4] = self;
  v6[5] = v7;
  objc_msgSend(v5, "addMultiSamplerForName:withTimeInterval:block:", v4, v6, SFAnalyticsSamplerIntervalOncePerReport);

  _Block_object_dispose(v7, 8);
}

- (KTApplicationPublicKeyStore)initWithApplication:(id)a3 dataStore:(id)a4 response:(id)a5 contextStore:(id)a6 settings:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  KTApplicationPublicKeyStore *v20;
  KTApplicationPublicKeyStore *v21;
  KTApplicationPublicKeyStore *v22;
  NSObject *v23;
  id v24;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)KTApplicationPublicKeyStore;
  v20 = -[KTApplicationPublicKeyStore init](&v26, "init");
  v21 = v20;
  if (!v20)
    goto LABEL_4;
  objc_storeStrong((id *)&v20->_application, a3);
  -[KTApplicationPublicKeyStore setSettings:](v21, "setSettings:", v19);
  if (-[KTApplicationPublicKeyStore updateWithPublicKeyResponse:dataStore:error:](v21, "updateWithPublicKeyResponse:dataStore:error:", v17, v16, a8))
  {
    -[KTApplicationPublicKeyStore startKeyStoreStateSampler](v21, "startKeyStoreStateSampler");
    -[KTApplicationPublicKeyStore setContextStore:](v21, "setContextStore:", v18);
LABEL_4:
    v22 = v21;
    goto LABEL_13;
  }
  if (qword_1002A7958 != -1)
    dispatch_once(&qword_1002A7958, &stru_1002499F8);
  v23 = qword_1002A7960;
  if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
  {
    if (a8)
      v24 = *a8;
    else
      v24 = 0;
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2112;
    v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create key bag from public key response for %{public}@: %@", buf, 0x16u);
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)updateWithPublicKeyResponse:(id)a3 dataStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TransparencyPublicKeyBag *v10;
  void *v11;
  void *v12;
  TransparencyPublicKeyBag *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  BOOL v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  KTApplicationPublicKeyStore *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];

  v8 = a3;
  v9 = a4;
  v10 = [TransparencyPublicKeyBag alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore settings](self, "settings"));
  v13 = -[TransparencyPublicKeyBag initWithPublicKeysResponse:application:settings:error:](v10, "initWithPublicKeysResponse:application:settings:error:", v8, v11, v12, a5);

  if (!v13)
  {
LABEL_35:
    -[KTApplicationPublicKeyStore setKeyBag:](self, "setKeyBag:", 0);
    v35 = 0;
    goto LABEL_36;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag vrfKey](v13, "vrfKey"));

  if (!v14)
  {
    if (a5)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -166, CFSTR("missing VRF key in KT %@ key bag"), v36));

    }
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249A18);
    v37 = (void *)qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](self, "application"));
      *(_DWORD *)buf = 138543362;
      v53 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "missing VRF key in KT %{public}@ key bag", buf, 0xCu);

    }
    goto LABEL_35;
  }
  if (-[KTApplicationPublicKeyStore detectEpochChangeAndResetData:patLogBeginningMs:mapStillPopulating:dataStore:](self, "detectEpochChangeAndResetData:patLogBeginningMs:mapStillPopulating:dataStore:", -[TransparencyPublicKeyBag tltLogBeginningMs](v13, "tltLogBeginningMs"), -[TransparencyPublicKeyBag patLogBeginningMs](v13, "patLogBeginningMs"), -[TransparencyPublicKeyBag mapStillPopulating](v13, "mapStillPopulating"), v9))
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249A38);
    v15 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "processPatConfigProof detected a tree reset", buf, 2u);
    }
  }
  v41 = self;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag verifiedLogHeads](v13, "verifiedLogHeads"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "setDataStore:", v9);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100168B8C;
        v46[3] = &unk_10023B3A8;
        v46[4] = v21;
        v47 = v9;
        objc_msgSend(v47, "performBlockAndWait:", v46);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag verifiedSignedMapHead](v13, "verifiedSignedMapHead"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag verifiedSignedMapHead](v13, "verifiedSignedMapHead"));
    objc_msgSend(v23, "setDataStore:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](v41, "application"));
    v45 = 0;
    v25 = objc_msgSend(v9, "newestMapRevision:logBeginMs:error:", v24, objc_msgSend(v23, "overrideBeginTime"), &v45);
    v26 = v45;

    if (v26)
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249A78);
      v27 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "processPamHeadInPatProof couldn't fetch newest map revision: %@", buf, 0xCu);
      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parsedMapHead"));
    v29 = objc_msgSend(v28, "revision");

    if (v29 > v25)
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249A98);
      v30 = (void *)qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_INFO))
      {
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore application](v41, "application"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parsedMapHead"));
        v34 = objc_msgSend(v33, "revision");
        *(_DWORD *)buf = 138412546;
        v53 = v32;
        v54 = 2048;
        v55 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "processPamHeadInPatProof storing SMH for %@ rev %llu", buf, 0x16u);

      }
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100168DAC;
      v42[3] = &unk_10023B3A8;
      v43 = v23;
      v44 = v9;
      objc_msgSend(v44, "performBlockAndWait:", v42);

    }
  }
  -[KTApplicationPublicKeyStore setKeyBag:](v41, "setKeyBag:", v13);
  v35 = 1;
LABEL_36:

  return v35;
}

- (KTApplicationPublicKeyStore)initWithApplication:(id)a3 dataStore:(id)a4 diskState:(id)a5 contextStore:(id)a6 settings:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  KTApplicationPublicKeyStore *v18;
  KTApplicationPublicKeyStore *v19;
  TransparencyPublicKeyBag *v20;
  void *v21;
  TransparencyPublicKeyBag *v22;
  KTApplicationPublicKeyStore *v23;
  NSObject *v24;
  id v25;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)KTApplicationPublicKeyStore;
  v18 = -[KTApplicationPublicKeyStore init](&v27, "init");
  v19 = v18;
  if (!v18)
    goto LABEL_4;
  objc_storeStrong((id *)&v18->_application, a3);
  -[KTApplicationPublicKeyStore setSettings:](v19, "setSettings:", v17);
  v20 = [TransparencyPublicKeyBag alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore settings](v19, "settings"));
  v22 = -[TransparencyPublicKeyBag initWithDiskKeyStore:application:settings:error:](v20, "initWithDiskKeyStore:application:settings:error:", v15, v14, v21, a8);

  if (v22)
  {
    -[KTApplicationPublicKeyStore setKeyBag:](v19, "setKeyBag:", v22);
    -[KTApplicationPublicKeyStore startKeyStoreStateSampler](v19, "startKeyStoreStateSampler");
    -[KTApplicationPublicKeyStore setContextStore:](v19, "setContextStore:", v16);

LABEL_4:
    v23 = v19;
    goto LABEL_13;
  }
  if (qword_1002A7958 != -1)
    dispatch_once(&qword_1002A7958, &stru_100249AF8);
  v24 = qword_1002A7960;
  if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
  {
    if (a8)
      v25 = *a8;
    else
      v25 = 0;
    *(_DWORD *)buf = 138543618;
    v29 = v14;
    v30 = 2112;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to create key bag from disk for %{public}@: %@", buf, 0x16u);
  }
  v23 = 0;
LABEL_13:

  return v23;
}

- (id)createTLTApplicationPublicKeyStore
{
  KTApplicationPublicKeyStore *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(KTApplicationPublicKeyStore);
  -[KTApplicationPublicKeyStore setApplication:](v3, "setApplication:", kKTApplicationIdentifierTLT);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore keyBag](self, "keyBag"));
  v5 = objc_msgSend(v4, "copyTltBag");
  -[KTApplicationPublicKeyStore setKeyBag:](v3, "setKeyBag:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore receiptTime](self, "receiptTime"));
  -[KTApplicationPublicKeyStore setReceiptTime:](v3, "setReceiptTime:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore contextStore](self, "contextStore"));
  -[KTApplicationPublicKeyStore setContextStore:](v3, "setContextStore:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore settings](self, "settings"));
  -[KTApplicationPublicKeyStore setSettings:](v3, "setSettings:", v8);

  return v3;
}

- (TransparencyPublicKeyBag)keyBag
{
  return (TransparencyPublicKeyBag *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeyBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTContextStore)store
{
  return (KTContextStore *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)receiptTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReceiptTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_loadWeakRetained((id *)&self->_contextStore);
}

- (void)setContextStore:(id)a3
{
  objc_storeWeak((id *)&self->_contextStore, a3);
}

- (KTPublicKeyStoreDelegateProtocol)delegate
{
  return (KTPublicKeyStoreDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contextStore);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_receiptTime, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
}

@end
