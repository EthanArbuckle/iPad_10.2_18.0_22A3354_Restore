@implementation KTFixupOperation

- (KTFixupOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v8;
  id v9;
  id v10;
  KTFixupOperation *v11;
  KTFixupOperation *v12;
  KTFixupOperation *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)KTFixupOperation;
  v11 = -[KTGroupOperation init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[KTFixupOperation setDeps:](v11, "setDeps:", v8);
    -[KTFixupOperation setErrorState:](v12, "setErrorState:", v10);
    -[KTFixupOperation setIntendedState:](v12, "setIntendedState:", v9);
    v13 = v12;
  }

  return v12;
}

- (void)groupStart
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  __int128 v35;
  id obj;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE buf[12];
  _BYTE v46[128];
  _QWORD v47[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation intendedState](self, "intendedState"));
  -[KTFixupOperation setNextState:](self, "setNextState:", v3);

  v4 = objc_alloc_init((Class)NSOperation);
  -[KTFixupOperation setFinishedOp:](self, "setFinishedOp:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);

  v47[0] = objc_opt_class(_TtC13transparencyd25KTFixupRegistrationUpload, v6);
  v47[1] = objc_opt_class(_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles, v7);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
  v8 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v42;
    *(_QWORD *)&v11 = 138412290;
    v35 = v11;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v13);
        v15 = objc_msgSend((id)objc_opt_class(v14, v9), "fixupName");
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation deps](self, "deps"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "smDataStore"));
        v19 = objc_msgSend(v18, "haveDoneFixup:", v16);

        if (v19)
        {
          if (qword_1002A4430 != -1)
            dispatch_once(&qword_1002A4430, &stru_10023A7E0);
          v21 = qword_1002A4438;
          if (os_log_type_enabled((os_log_t)qword_1002A4438, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            *(_QWORD *)&buf[4] = v16;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Already performed fixup %@", buf, 0xCu);
          }
        }
        else
        {
          v22 = objc_alloc((Class)objc_opt_class(v14, v20));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation deps](self, "deps"));
          v24 = objc_msgSend(v22, "initWithDependencies:", v23);

          if (!v24)
          {
            if (qword_1002A4430 != -1)
              dispatch_once(&qword_1002A4430, &stru_10023A800);
            v33 = qword_1002A4438;
            if (os_log_type_enabled((os_log_t)qword_1002A4438, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v35;
              *(_QWORD *)&buf[4] = v16;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to create fixup operation %@", buf, 0xCu);
            }
            v34 = obj;
            goto LABEL_33;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "doFixupOperation"));
          v26 = v25;
          if (v25)
          {
            if (v8)
              objc_msgSend(v25, "addDependency:", v8);
            *(_QWORD *)buf = 0;
            objc_initWeak((id *)buf, self);
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_10000BC7C;
            v37[3] = &unk_10023A868;
            objc_copyWeak(&v40, (id *)buf);
            v38 = v16;
            v27 = v26;
            v39 = v27;
            v28 = (id)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v37));

            objc_msgSend(v28, "addDependency:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
            objc_msgSend(v29, "addOperation:", v27);

            v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
            objc_msgSend(v30, "addOperation:", v28);

            objc_destroyWeak(&v40);
            objc_destroyWeak((id *)buf);

            v8 = v28;
          }
          else
          {
            if (qword_1002A4430 != -1)
              dispatch_once(&qword_1002A4430, &stru_10023A820);
            v31 = qword_1002A4438;
            if (os_log_type_enabled((os_log_t)qword_1002A4438, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v35;
              *(_QWORD *)&buf[4] = v16;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Fixup %@ can't run right now, skipping for now", buf, 0xCu);
            }
          }

        }
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v10)
        continue;
      break;
    }

    if (v8)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation finishedOp](self, "finishedOp"));
      objc_msgSend(v32, "addDependency:", v8);
      goto LABEL_31;
    }
  }
  else
  {
    v32 = obj;
LABEL_31:

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue", v35));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v34, "addOperation:", v16);
LABEL_33:

}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIntendedState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setErrorState:(id)a3
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
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
