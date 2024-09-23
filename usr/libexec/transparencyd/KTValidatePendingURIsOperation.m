@implementation KTValidatePendingURIsOperation

- (KTValidatePendingURIsOperation)initWithApplication:(id)a3 opId:(id)a4 dependencies:(id)a5
{
  id v8;
  id v9;
  id v10;
  KTValidatePendingURIsOperation *v11;
  KTValidatePendingURIsOperation *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KTValidatePendingURIsOperation;
  v11 = -[KTGroupOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[KTValidatePendingURIsOperation setDeps:](v11, "setDeps:", v10);
    -[KTValidatePendingURIsOperation setApplication:](v12, "setApplication:", v8);
    -[KTValidatePendingURIsOperation setOpUUID:](v12, "setOpUUID:", v9);
  }

  return v12;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _BYTE buf[12];
  __int16 v46;
  id v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dew"));
  v5 = objc_msgSend(v4, "validatePendingURILimit");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dew"));
  v8 = objc_msgSend(v7, "validatePendingSMTLimit");

  if (qword_1002A4450 != -1)
    dispatch_once(&qword_1002A4450, &stru_10023A8E8);
  v9 = qword_1002A4458;
  if (os_log_type_enabled((os_log_t)qword_1002A4458, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "ValidatePendingURIs: start", buf, 2u);
  }
  v10 = (void *)os_transaction_create("KTValidatePendingURIsOperation");
  -[KTValidatePendingURIsOperation setTransaction:](self, "setTransaction:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation application](self, "application"));
  v44 = 0;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pendingVerificationURIs:fetchLimit:error:", v13, v5, &v44));
  v14 = v44;

  if (v14)
  {
    if (qword_1002A4450 != -1)
      dispatch_once(&qword_1002A4450, &stru_10023A908);
    v15 = (void *)qword_1002A4458;
    if (os_log_type_enabled((os_log_t)qword_1002A4458, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation application](self, "application"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      v46 = 2112;
      v47 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "ValidatePendingURIs: failed to get pending peer uris for %@ from data store: %@", buf, 0x16u);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation deps](self, "deps"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation application](self, "application"));
  v43 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getPendingSmtUris:fetchLimit:error:", v20, v8, &v43));
  v22 = v43;

  if (!v22)
    goto LABEL_17;
  if (qword_1002A4450 != -1)
    dispatch_once(&qword_1002A4450, &stru_10023A928);
  v23 = (void *)qword_1002A4458;
  if (os_log_type_enabled((os_log_t)qword_1002A4458, OS_LOG_TYPE_ERROR))
  {
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation application](self, "application"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v25;
    v46 = 2112;
    v47 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "ValidatePendingURIs: failed to get pending SMT uris for %@ from data store: %@", buf, 0x16u);

  }
  if (v14)
  {
    -[KTResultOperation setError:](self, "setError:", v14);
    -[KTValidatePendingURIsOperation setTransaction:](self, "setTransaction:", 0);
  }
  else
  {
LABEL_17:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    objc_msgSend(v26, "addObjectsFromArray:", v37);
    objc_msgSend(v26, "addObjectsFromArray:", v21);
    if (v26 && objc_msgSend(v26, "count"))
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10000D94C;
      v41[3] = &unk_10023A970;
      objc_copyWeak(&v42, (id *)buf);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v41));
      -[KTValidatePendingURIsOperation setFinishedOp:](self, "setFinishedOp:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation finishedOp](self, "finishedOp"));
      -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation deps](self, "deps"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contextStore"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation application](self, "application"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation deps](self, "deps"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "logClient"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10000D97C;
      v38[3] = &unk_10023AA00;
      objc_copyWeak(&v40, (id *)buf);
      v39 = v26;
      objc_msgSend(v30, "contextForApplication:logClient:fetchState:completionHandler:", v31, v33, 1, v38);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (qword_1002A4450 != -1)
        dispatch_once(&qword_1002A4450, &stru_10023A948);
      v34 = (void *)qword_1002A4458;
      if (os_log_type_enabled((os_log_t)qword_1002A4458, OS_LOG_TYPE_INFO))
      {
        v35 = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingURIsOperation application](self, "application"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "ValidatePendingURIs: No pending URIs for %@", buf, 0xCu);

      }
      -[KTValidatePendingURIsOperation setTransaction:](self, "setTransaction:", 0);
    }

  }
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSUUID)opUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOpUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opUUID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
