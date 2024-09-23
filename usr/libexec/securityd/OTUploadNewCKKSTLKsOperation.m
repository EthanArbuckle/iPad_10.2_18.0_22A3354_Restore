@implementation OTUploadNewCKKSTLKsOperation

- (OTUploadNewCKKSTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  OTUploadNewCKKSTLKsOperation *v17;
  OTUploadNewCKKSTLKsOperation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTUploadNewCKKSTLKsOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_ckksConflictState, a5);
    objc_storeStrong((id *)&v18->_peerMissingState, a6);
    objc_storeStrong((id *)&v18->_nextState, a7);
  }

  return v18;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  OTFetchCKKSKeysOperation *v14;
  void *v15;
  OTFetchCKKSKeysOperation *v16;
  OTFetchCKKSKeysOperation *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  OTFetchCKKSKeysOperation *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning an operation to upload any pending CKKS tlks", buf, 2u);
  }

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ckks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewsRequiringTLKUpload"));

  v8 = objc_msgSend(v7, "count");
  v9 = sub_10000EF14("octagon-ckks");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CKKS needs TLK uploads for %@", buf, 0xCu);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001410B8;
    v26[3] = &unk_1002EB598;
    objc_copyWeak(&v27, &location);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v26));
    -[OTUploadNewCKKSTLKsOperation setFinishedOp:](self, "setFinishedOp:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v13);

    v14 = [OTFetchCKKSKeysOperation alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
    v16 = -[OTFetchCKKSKeysOperation initWithDependencies:viewsToFetch:](v14, "initWithDependencies:viewsToFetch:", v15, v7);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v16);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100141198;
    v23 = &unk_1002EA8C8;
    objc_copyWeak(&v25, &location);
    v17 = v16;
    v24 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("upload-tlks-with-keys"), &v20));
    objc_msgSend(v18, "addDependency:", v17, v20, v21, v22, v23);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v18);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No CKKS views need uploads", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation intendedState](self, "intendedState"));
    -[OTUploadNewCKKSTLKsOperation setNextState:](self, "setNextState:", v19);

  }
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint8_t buf[4];
  id v22;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v8 = sub_10000EF14("octagon-ckks");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning tlk upload with keys: %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cuttlefishXPCWrapper"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeAccount"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100140E4C;
    v18[3] = &unk_1002E8BE8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v11, "updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:", v13, v6, v7, v18);

    objc_destroyWeak(&v19);
  }
  else
  {
    v14 = sub_10000EF14("octagon-ckks");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No CKKS views gave us TLKs to upload", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation intendedState](self, "intendedState"));
    -[OTUploadNewCKKSTLKsOperation setNextState:](self, "setNextState:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUploadNewCKKSTLKsOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);

  }
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

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCkksConflictState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OctagonStateString)peerMissingState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPeerMissingState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_peerMissingState, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
