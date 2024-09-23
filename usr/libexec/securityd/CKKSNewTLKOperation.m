@implementation CKKSNewTLKOperation

- (CKKSNewTLKOperation)init
{

  return 0;
}

- (CKKSNewTLKOperation)initWithDependencies:(id)a3 rollTLKIfPresent:(BOOL)a4 preexistingPendingKeySets:(id)a5 intendedState:(id)a6 errorState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)CKKSNewTLKOperation;
  v17 = -[CKKSGroupOperation init](&v37, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 150), a3);
    v18[128] = a4;
    if (v14)
    {
      v29 = v16;
      v30 = v15;
      v31 = a7;
      v32 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v25));
            if (objc_msgSend(v26, "proposed"))
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v22);
      }

      v27 = *(void **)(v18 + 166);
      *(_QWORD *)(v18 + 166) = v19;
      a7 = v31;
      v13 = v32;
      v16 = v29;
      v15 = v30;
    }
    else
    {
      v27 = *(void **)(v18 + 166);
      *(_QWORD *)(v18 + 166) = 0;
    }

    objc_storeStrong((id *)(v18 + 134), a6);
    objc_storeStrong((id *)(v18 + 142), a7);
  }

  return (CKKSNewTLKOperation *)v18;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  OctagonPendingFlag *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  void *v21;
  id v22;
  _QWORD v23[6];
  id v24;
  id v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10015B6A0;
  v31[3] = &unk_1002E94C8;
  v31[4] = self;
  v22 = v4;
  v32 = v22;
  v6 = v5;
  v33 = v6;
  objc_msgSend(v21, "dispatchSyncWithReadOnlySQLTransaction:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (!v7)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentTrustStates"));

        }
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10015B998;
        v23[3] = &unk_1002E9240;
        v23[4] = v11;
        v23[5] = self;
        v26 = &v34;
        v7 = v7;
        v24 = v7;
        v25 = v22;
        objc_msgSend(v21, "dispatchSyncWithSQLTransaction:", v23);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v22, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
    objc_msgSend(v13, "provideKeySets:", v22);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  v15 = v14 == 0;

  if (v15)
    -[CKKSNewTLKOperation setKeysets:](self, "setKeysets:", v22);
  if (*((_BYTE *)v35 + 24))
  {
    v16 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("key_set"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flagHandler"));
    objc_msgSend(v18, "handlePendingFlag:", v16);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNewTLKOperation intendedState](self, "intendedState"));
  -[CKKSNewTLKOperation setNextState:](self, "setNextState:", v19);

  _Block_object_dispose(&v34, 8);
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKKSNewTLKOperation;
  -[CKKSGroupOperation cancel](&v2, "cancel");
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (NSDictionary)keysets
{
  return (NSDictionary *)objc_getProperty(self, a2, 158, 1);
}

- (void)setKeysets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (BOOL)rollTLKIfPresent
{
  return self->_rollTLKIfPresent;
}

- (void)setRollTLKIfPresent:(BOOL)a3
{
  self->_rollTLKIfPresent = a3;
}

- (NSDictionary)previousPendingKeySets
{
  return (NSDictionary *)objc_getProperty(self, a2, 166, 1);
}

- (void)setPreviousPendingKeySets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_keysets + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_rollTLKIfPresent + 6), 0);
}

@end
