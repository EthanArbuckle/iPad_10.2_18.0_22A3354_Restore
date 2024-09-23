@implementation OTPreloadOctagonKeysOperation

- (OTPreloadOctagonKeysOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTPreloadOctagonKeysOperation *v12;
  OTPreloadOctagonKeysOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTPreloadOctagonKeysOperation;
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
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v3 = sub_10000EF14("octagon-preload-keys");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning operation that preloads the SOSAccount with newly created Octagon Keys", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTPreloadOctagonKeysOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sosAdapter"));
  v9 = objc_msgSend(v8, "sosEnabled");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "octagonAdapter"));
    v30 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fetchSelfPeers:", &v30));
    v13 = v30;

    if (!v12 || v13)
    {
      v22 = sub_10000EF14("octagon-preload-keys");
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "failed to retrieve self peers: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v14);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSelf"));
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation deps](self, "deps"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sosAdapter"));
        v29 = 0;
        v17 = objc_msgSend(v16, "preloadOctagonKeySetOnAccount:error:", v14, &v29);
        v18 = v29;

        if ((v17 & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation intendedState](self, "intendedState"));
          -[OTPreloadOctagonKeysOperation setNextState:](self, "setNextState:", v19);

        }
        else
        {
          -[CKKSResultOperation setError:](self, "setError:", v18);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v28);

      }
      else
      {
        v24 = sub_10000EF14("octagon-preload-keys");
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "failed to retrieve current self", buf, 2u);
        }

        v31 = NSLocalizedDescriptionKey;
        v32 = CFSTR("failed to retrieve current self");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 38, v26));
        -[CKKSResultOperation setError:](self, "setError:", v27);

        v18 = (id)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v18);
      }

    }
  }
  else
  {
    v35 = NSLocalizedDescriptionKey;
    v36 = CFSTR("sos adapter not enabled");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 39, v20));
    -[CKKSResultOperation setError:](self, "setError:", v21);

    v13 = (id)objc_claimAutoreleasedReturnValue(-[OTPreloadOctagonKeysOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
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

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
