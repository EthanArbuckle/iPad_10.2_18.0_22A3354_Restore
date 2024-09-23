@implementation OTResetCKKSZonesLackingTLKsOperation

- (OTResetCKKSZonesLackingTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTResetCKKSZonesLackingTLKsOperation *v12;
  OTResetCKKSZonesLackingTLKsOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTResetCKKSZonesLackingTLKsOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
  }

  return v13;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  OTFetchCKKSKeysOperation *v7;
  void *v8;
  OTFetchCKKSKeysOperation *v9;
  OTFetchCKKSKeysOperation *v10;
  void *v11;
  _QWORD v12[4];
  OTFetchCKKSKeysOperation *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[8];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking if any CKKS zones need resetting", buf, 2u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000C9204;
  v15[3] = &unk_1002EB598;
  objc_copyWeak(&v16, (id *)buf);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v15));
  -[OTResetCKKSZonesLackingTLKsOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = [OTFetchCKKSKeysOperation alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation deps](self, "deps"));
  v9 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v7, "initWithDependencies:refetchNeeded:", v8, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C92E4;
  v12[3] = &unk_1002EA8C8;
  objc_copyWeak(&v14, (id *)buf);
  v10 = v9;
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("continue-ckks-resets"), v12));
  objc_msgSend(v11, "addDependency:", v10);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithKeys:(id)a3 incompleteKeySets:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  OTResetCKKSZonesLackingTLKsOperation *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];

  v24 = self;
  v4 = a4;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error", v24));

        if (v11)
        {
          v12 = sub_10000EF14("octagon-ckks");
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error loading key set %@; not attempting reset",
              buf,
              0xCu);
          }
LABEL_14:

          continue;
        }
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTLKPointer"));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tlk"));

          if (!v16)
          {
            v17 = sub_10000EF14("octagon-ckks");
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v10;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Key set %@ has no TLK; scheduling for reset",
                buf,
                0xCu);
            }

            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneName](v13, "zoneName"));
            objc_msgSend(v25, "addObject:", v19);

            goto LABEL_14;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v25, "count"))
  {
    -[OTResetCKKSZonesLackingTLKsOperation resetViews:](v24, "resetViews:", v25);
  }
  else
  {
    v20 = sub_10000EF14("octagon-ckks");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No CKKS views need resetting", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation intendedState](v24, "intendedState"));
    -[OTResetCKKSZonesLackingTLKsOperation setNextState:](v24, "setNextState:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](v24, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](v24, "runBeforeGroupFinished:", v23);

  }
}

- (void)resetViews:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = sub_10000EF14("octagon-ckks");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resetting CKKS view %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rpcResetCloudKit:reply:", v4, &stru_1002DD328));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C90EC;
  v18[3] = &unk_1002EC350;
  v19 = v4;
  v10 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("wait-for-ckks-reset"), v18));
  v12 = objc_msgSend(v11, "timeout:", 120000000000);
  objc_msgSend(v11, "addDependency:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v13, "addOperation:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v14, "addDependency:", v11);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation intendedState](self, "intendedState"));
  -[OTResetCKKSZonesLackingTLKsOperation setNextState:](self, "setNextState:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetCKKSZonesLackingTLKsOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v16, "addOperation:", v17);

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

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
