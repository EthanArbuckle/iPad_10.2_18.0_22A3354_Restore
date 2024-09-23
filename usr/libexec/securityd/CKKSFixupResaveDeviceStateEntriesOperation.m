@implementation CKKSFixupResaveDeviceStateEntriesOperation

- (CKKSFixupResaveDeviceStateEntriesOperation)initWithOperationDependencies:(id)a3
{
  id v5;
  CKKSFixupResaveDeviceStateEntriesOperation *v6;
  CKKSFixupResaveDeviceStateEntriesOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSFixupResaveDeviceStateEntriesOperation;
  v6 = -[CKKSGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deps, a3);
    objc_storeStrong((id *)&v7->_intendedState, CFSTR("fixup_delete_tombstones"));
    objc_storeStrong((id *)&v7->_nextState, CFSTR("error"));
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "views"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSFixup:ResaveCDSE (%@)>"), v3));

  return v4;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupResaveDeviceStateEntriesOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeManagedViews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100151A58;
        v12[3] = &unk_1002E9418;
        v12[4] = v11;
        v12[5] = self;
        objc_msgSend(v4, "dispatchSyncWithSQLTransaction:", v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

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

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
