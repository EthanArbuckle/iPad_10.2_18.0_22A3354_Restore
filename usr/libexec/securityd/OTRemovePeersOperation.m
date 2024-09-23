@implementation OTRemovePeersOperation

- (OTRemovePeersOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 peerIDs:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTRemovePeersOperation *v15;
  OTRemovePeersOperation *v16;
  uint64_t v17;
  NSSet *peerIDs;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OTRemovePeersOperation;
  v15 = -[CKKSGroupOperation init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
    v17 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
    peerIDs = v16->_peerIDs;
    v16->_peerIDs = (NSSet *)v17;

  }
  return v16;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _BYTE buf[24];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation peerIDs](self, "peerIDs"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to remove peers: %@", buf, 0xCu);

  }
  v6 = objc_alloc_init((Class)NSOperation);
  -[OTRemovePeersOperation setFinishedOp:](self, "setFinishedOp:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v7);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cuttlefishXPCWrapper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation peerIDs](self, "peerIDs"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100154380;
  v13[3] = &unk_1002EB050;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v9, "distrustPeerIDsWithSpecificUser:peerIDs:reply:", v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
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

- (NSSet)peerIDs
{
  return (NSSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPeerIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_peerIDs, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
