@implementation OTEnsureOctagonKeyConsistency

- (OTEnsureOctagonKeyConsistency)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTEnsureOctagonKeyConsistency *v12;
  OTEnsureOctagonKeyConsistency *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTEnsureOctagonKeyConsistency;
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
  OctagonCKKSPeerAdapter *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  OctagonCKKSPeerAdapter *v19;
  const void *v20;
  NSObject *v21;
  OctagonCKKSPeerAdapter *v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  OctagonCKKSPeerAdapter *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const void *v34;
  NSObject *v35;
  void *v36;
  OctagonCKKSPeerAdapter *v37;
  OctagonCKKSPeerAdapter *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const void *v48;
  NSObject *v49;
  const void *v50;
  NSObject *v51;
  const void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  const void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  NSErrorUserInfoKey v75;
  const __CFString *v76;
  uint8_t buf[4];
  OctagonCKKSPeerAdapter *v78;
  NSErrorUserInfoKey v79;
  const __CFString *v80;

  v3 = sub_10000EF14("octagon-sos");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning ensuring Octagon keys are set properly in SOS", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTEnsureOctagonKeyConsistency setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sosAdapter"));
  v9 = objc_msgSend(v8, "sosEnabled");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sosAdapter"));
    v74 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSOSSelf:", &v74));
    v13 = (OctagonCKKSPeerAdapter *)v74;

    if (!v12 || v13)
    {
      v25 = sub_10000EF14("octagon-sos");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v13;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to get the current SOS self: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v13);
      v19 = (OctagonCKKSPeerAdapter *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v19);
      goto LABEL_42;
    }
    v14 = sub_10000EF14("octagon");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetched SOS Self! Fetching Octagon Adapter now.", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stateHolder"));
    v73 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getEgoPeerID:", &v73));
    v19 = (OctagonCKKSPeerAdapter *)v73;

    if (v19)
    {
      v20 = sub_10000EF14("octagon");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "failed to get peer id: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v19);
      v22 = (OctagonCKKSPeerAdapter *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v22);
      goto LABEL_41;
    }
    v70 = v12;
    v27 = [OctagonCKKSPeerAdapter alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "activeAccount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "personaAdapter"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cuttlefishXPCWrapper"));
    v69 = v18;
    v22 = -[OctagonCKKSPeerAdapter initWithPeerID:specificUser:personaAdapter:cuttlefishXPC:](v27, "initWithPeerID:specificUser:personaAdapter:cuttlefishXPC:", v18, v29, v31, v33);

    v34 = sub_10000EF14("octagon");
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v22;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Fetched SOS Self! Fetching Octagon Adapter now: %@", buf, 0xCu);
    }

    v72 = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter fetchSelfPeers:](v22, "fetchSelfPeers:", &v72));
    v37 = (OctagonCKKSPeerAdapter *)v72;
    v38 = v37;
    if (!v36 || v37)
    {
      v50 = sub_10000EF14("octagon");
      v51 = objc_claimAutoreleasedReturnValue(v50);
      v19 = 0;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v38;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "failed to retrieve self peers: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v40);
      v12 = v70;
      goto LABEL_40;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "currentSelf"));
    v40 = v39;
    v19 = 0;
    if (!v39)
    {
      v58 = sub_10000EF14("octagon");
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "failed to retrieve current self", buf, 2u);
      }

      v75 = NSLocalizedDescriptionKey;
      v76 = CFSTR("failed to retrieve current self");
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 38, v60));
      -[CKKSResultOperation setError:](self, "setError:", v61);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v62);
      v12 = v70;
      v18 = v69;
      goto LABEL_39;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "publicSigningKey"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "keyData"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "publicEncryptionKey"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "keyData"));

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "publicSigningKey"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "keyData"));

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "publicEncryptionKey"));
    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "keyData"));

    v66 = (void *)v45;
    v67 = v42;
    v65 = (void *)v47;
    if (objc_msgSend(v42, "isEqualToData:", v45)
      && (objc_msgSend(v68, "isEqualToData:", v47) & 1) != 0)
    {
      v48 = sub_10000EF14("octagon");
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "SOS and Octagon keys match!", buf, 2u);
      }
      v18 = v69;
      v38 = 0;
    }
    else
    {
      v64 = v36;
      v52 = sub_10000EF14("octagon");
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "SOS and Octagon signing keys do NOT match! updating SOS", buf, 2u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency deps](self, "deps"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "sosAdapter"));
      v71 = 0;
      v56 = objc_msgSend(v55, "updateOctagonKeySetWithAccount:error:", v40, &v71);
      v49 = v71;

      v38 = 0;
      if ((v56 & 1) == 0)
      {
        -[CKKSResultOperation setError:](self, "setError:", v49);
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v63);

        v18 = v69;
        v36 = v64;
        goto LABEL_38;
      }
      v18 = v69;
      v36 = v64;
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency intendedState](self, "intendedState"));
    -[OTEnsureOctagonKeyConsistency setNextState:](self, "setNextState:", v57);

    v49 = objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v49);
LABEL_38:

    v12 = v70;
    v62 = v67;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  v79 = NSLocalizedDescriptionKey;
  v80 = CFSTR("sos adapter not enabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 39, v23));
  -[CKKSResultOperation setError:](self, "setError:", v24);

  v13 = (OctagonCKKSPeerAdapter *)objc_claimAutoreleasedReturnValue(-[OTEnsureOctagonKeyConsistency finishOp](self, "finishOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
LABEL_43:

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
