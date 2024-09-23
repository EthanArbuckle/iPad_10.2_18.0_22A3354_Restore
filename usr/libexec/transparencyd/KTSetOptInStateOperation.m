@implementation KTSetOptInStateOperation

- (KTSetOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  KTSetOptInStateOperation *v14;
  KTSetOptInStateOperation *v15;
  KTSetOptInStateOperation *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTSetOptInStateOperation;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[KTSetOptInStateOperation setDeps:](v14, "setDeps:", v10);
    -[KTSetOptInStateOperation setOptInStates:](v15, "setOptInStates:", v13);
    -[KTSetOptInStateOperation setIntendedState:](v15, "setIntendedState:", v11);
    -[KTSetOptInStateOperation setErrorState:](v15, "setErrorState:", v12);
    -[KTSetOptInStateOperation setOptInStates:](v15, "setOptInStates:", v13);
    v16 = v15;
  }

  return v15;
}

- (id)verifyResponse:(id)a3 uri:(id)a4 expectedState:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  KTSetOptInResult *v12;
  void *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  KTSetOptInResult *v19;

  v5 = a5;
  v16 = 0;
  v17 = 0;
  v8 = a4;
  v9 = -[KTSetOptInStateOperation decodeAndVerifyOptInOutResponse:optInOutState:optInOutTime:error:](self, "decodeAndVerifyOptInOutResponse:optInOutState:optInOutTime:error:", a3, v5, &v17, &v16);
  v10 = v17;
  v11 = v16;
  v12 = objc_alloc_init(KTSetOptInResult);
  -[KTSetOptInResult setSuccess:](v12, "setSuccess:", v9 == 1);
  -[KTSetOptInResult setUri:](v12, "setUri:", v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  -[KTSetOptInResult setOptInStatus:](v12, "setOptInStatus:", v13);

  -[KTSetOptInResult setOptInDate:](v12, "setOptInDate:", v10);
  -[KTSetOptInResult setError:](v12, "setError:", v11);
  if (qword_1002A7AD8 != -1)
    dispatch_once(&qword_1002A7AD8, &stru_10024B820);
  v14 = qword_1002A7AE0;
  if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "verified response returned: %@", buf, 0xCu);
  }

  return v12;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  KTIDSOpsOptInOutData *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  SendOptInUpdateRequestOperation *v30;
  void *v31;
  SendOptInUpdateRequestOperation *v32;
  SendOptInUpdateRequestOperation *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  SendOptInUpdateRequestOperation *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  KTIDSOpsOptInOutData *v54;
  _BYTE buf[12];
  __int16 v56;
  id v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation errorState](self, "errorState"));
  -[KTSetOptInStateOperation setNextState:](self, "setNextState:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTarget"));
  -[KTSetOptInStateOperation setApplicationId:](self, "setApplicationId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetOptInStates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &stru_10024B860));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v10);
    v11 = objc_alloc_init(KTIDSOpsOptInOutData);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    -[KTIDSOpsOptInOutData setKtApplication:](v11, "setKtApplication:", v12);

    v13 = objc_msgSend(v9, "targetState");
    if ((unint64_t)v13 <= 2)
      -[KTIDSOpsOptInOutData setOptInStatus:](v11, "setOptInStatus:", *(&off_10024BB68 + (_QWORD)v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cloudRecords"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData optInStatus](v11, "optInStatus"));
    v52 = 0;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeOptInIntentForApplication:state:overwrite:error:", v16, objc_msgSend(v17, "BOOLValue"), 1, &v52));
    v41 = v52;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cloudRecords"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    v51 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deleteOptInIntentForApplication:error:", v20, &v51));
    v39 = v51;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accountKeyService"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accountKeyService:", v24));

    v50 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "publicPublicKey:", &v50));
    v42 = v50;
    -[KTIDSOpsOptInOutData setPublicAccountKey:](v11, "setPublicAccountKey:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData publicAccountKey](v11, "publicAccountKey"));
    LODWORD(v25) = v26 == 0;

    if ((_DWORD)v25)
    {
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024B880);
      v27 = qword_1002A7AE0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v44;
        v56 = 2112;
        v57 = v42;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Cloud not get account key from service %@, this is not going to end well: %@", buf, 0x16u);
      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId", v39));
    v53 = v28;
    v54 = v11;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));

    v30 = [SendOptInUpdateRequestOperation alloc];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v32 = -[SendOptInUpdateRequestOperation initWithDependenics:optInRequest:](v30, "initWithDependenics:optInRequest:", v31, v29);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10018FAB0;
    v45[3] = &unk_10023D9B0;
    objc_copyWeak(&v49, (id *)buf);
    v33 = v32;
    v46 = v33;
    v47 = v9;
    v34 = v10;
    v48 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", CFSTR("set-opt-io"), v45));
    -[KTResultOperation addSuccessDependency:](v33, "addSuccessDependency:", v43);
    objc_msgSend(v35, "addDependency:", v33);
    objc_msgSend(v21, "addSuccessDependency:", v35);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v43);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v33);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v35);
    -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v21);

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B840);
    v36 = (void *)qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Warning: no target application available: %@", buf, 0xCu);

    }
    v34 = (id)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
    objc_msgSend(v34, "setCurrentTarget:", 0);
  }

}

- (void)processResponse:(id)a3 watcher:(id)a4 finishOp:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  KTPendingFlag *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  char v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *j;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL8 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  KTPendingFlag *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  KTPendingFlag *v97;
  KTSetOptInStateOperation *v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[5];
  id v110;
  id v111;
  uint8_t buf[4];
  id v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  _BYTE v118[128];
  _BYTE v119[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((objc_msgSend(v8, "success") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverSMTByURI"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverSMTByURI"));
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_100190A9C;
      v109[3] = &unk_10024B8C8;
      v109[4] = self;
      v110 = v9;
      v111 = v11;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v109);

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverProvidedSMT"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation verifyResponse:uri:expectedState:](self, "verifyResponse:uri:expectedState:", v24, 0, objc_msgSend(v9, "targetState") != 0));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, &stru_1002508B8);
    }
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B8E8);
    v95 = v9;
    v26 = qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v113 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "OptIn result: %@", buf, 0xCu);
    }
    -[KTSetOptInStateOperation setOptInResult:](self, "setOptInResult:", v11);
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v97 = (KTPendingFlag *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectEnumerator"));
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
    v98 = self;
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v106 != v31)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v33, "success") & 1) == 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "error"));

            if (v34)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "error"));
              objc_msgSend(v96, "addObject:", v35);

            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "uri"));

            if (v36)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "uri"));
              -[KTPendingFlag addObject:](v97, "addObject:", v37);

            }
            v30 = 1;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
      }
      while (v29);

      self = v98;
      if ((v30 & 1) != 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v15 = v96;
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v96, NSMultipleUnderlyingErrorsKey);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v97, CFSTR("uris"));
        v99 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", CFSTR("TransparencyErrorVerify"), -361, 0, v38, CFSTR("Failed validation uri")));
        -[KTResultOperation setError:](v98, "setError:", v39);

        v9 = v95;
        if (qword_1002A7AD8 != -1)
          dispatch_once(&qword_1002A7AD8, &stru_10024B908);
        v40 = (void *)qword_1002A7AE0;
        if (!os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
          goto LABEL_78;
        v23 = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v98, "error"));
        *(_DWORD *)buf = 138412290;
        v113 = v41;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to change opt-in state due to IDS opt-in failure: %@", buf, 0xCu);

LABEL_34:
LABEL_78:

        goto LABEL_79;
      }
    }
    else
    {

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v95, "targetState")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInStates](self, "optInStates"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "currentStates"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v42, v45);

    -[KTSetOptInStateOperation clearCoreFollowUp](self, "clearCoreFollowUp");
    -[KTSetOptInStateOperation clearFailureEvents](self, "clearFailureEvents");
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B928);
    v46 = (void *)qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v95, "targetState")));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      *(_DWORD *)buf = 138543618;
      v113 = v48;
      v114 = 2114;
      v115 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "changing opt-in state to %{public}@ for %{public}@", buf, 0x16u);

    }
    v94 = v10;
    v92 = v8;
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v93 = v11;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectEnumerator"));
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
    if (v51)
    {
      v52 = v51;
      v53 = 0;
      v54 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v52; j = (char *)j + 1)
        {
          if (*(_QWORD *)v102 != v54)
            objc_enumerationMutation(v50);
          v56 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)j);
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "uri"));

          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "uri"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication addApplicationPrefixForIdentifier:uri:](TransparencyApplication, "addApplicationPrefixForIdentifier:uri:", v58, v59));

            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "optInDate"));
            objc_msgSend(v99, "setObject:forKeyedSubscript:", v61, v60);

            if (!v53
              || (v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "optInDate")),
                  v63 = objc_msgSend(v62, "compare:", v53),
                  v62,
                  v63 == (id)-1))
            {
              v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "optInDate"));

              v53 = (void *)v64;
            }

            self = v98;
          }
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
      }
      while (v52);
    }
    else
    {
      v53 = 0;
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "cloudRecords"));

    v8 = v92;
    if (v66)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "cloudRecords"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      v9 = v95;
      v100 = 0;
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "storeOptInForApplication:uris:state:error:", v69, v99, objc_msgSend(v95, "targetState") != 0, &v100));
      v71 = v100;

      if (v70)
      {
        objc_msgSend(v94, "addDependency:", v70);
        -[KTGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v70);
      }
      if (v71)
      {
        if (qword_1002A7AD8 != -1)
          dispatch_once(&qword_1002A7AD8, &stru_10024B948);
        v72 = qword_1002A7AE0;
        if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v113 = v71;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "storeOptInForApplication failed %@", buf, 0xCu);
        }
        -[KTResultOperation setError:](self, "setError:", v71);
      }

    }
    else
    {
      v71 = 0;
      v9 = v95;
    }
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B968);
    v73 = (void *)qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_DEFAULT))
    {
      v74 = v73;
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "targetState")));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "allKeys"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 138543874;
      v113 = v75;
      v114 = 2114;
      v115 = v76;
      v116 = 2112;
      v117 = v78;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "changing peer opt-in state to %{public}@ for %{public}@ for %@", buf, 0x20u);

      self = v98;
    }
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "dataStore"));
    v81 = objc_msgSend(v9, "targetState") != 0;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "allKeys"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
    objc_msgSend(v80, "setCachedPeerOptInState:uris:application:", v81, v82, v83);

    if (objc_msgSend(v9, "targetState") == (id)1)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](v98, "deps"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "dataStore"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](v98, "applicationId"));
      objc_msgSend(v85, "removeFailuresOnOptIn:", v86);

    }
    if (v53)
    {
      -[KTSetOptInStateOperation setKVSSMTTime:forState:](v98, "setKVSSMTTime:forState:", v53, objc_msgSend(v9, "targetState") != 0);
    }
    else
    {
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024B988);
      v87 = qword_1002A7AE0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v113 = v93;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "no KVS smt timestamp: %@", buf, 0xCu);
      }
    }
    -[KTSetOptInStateOperation notifyOptInStatusChanged](v98, "notifyOptInStatusChanged");
    v88 = -[KTPendingFlag initWithFlag:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:delayInSeconds:", CFSTR("StatusUpdate"), 0.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](v98, "deps"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "flagHandler"));
    objc_msgSend(v90, "handlePendingFlag:", v88);

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation intendedState](v98, "intendedState"));
    -[KTSetOptInStateOperation setNextState:](v98, "setNextState:", v91);

    v11 = v93;
    v10 = v94;
    v15 = v96;
    goto LABEL_78;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
  if (qword_1002A7AD8 != -1)
    dispatch_once(&qword_1002A7AD8, &stru_10024B8A0);
  v16 = (void *)qword_1002A7AE0;
  if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    *(_DWORD *)buf = 138412290;
    v113 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to change opt-in state due to IDS opt-in failure: %@", buf, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorInternal, -290, v15, CFSTR("IDS failed to change opt-in state for KT")));
  -[KTResultOperation setError:](self, "setError:", v19);

  if (objc_msgSend(v15, "code") == (id)-8101)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
    v21 = objc_msgSend(v20, "isEqual:", IDSKeyTransparencyErrorDomain);

    if (v21)
    {
      v22 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("CheckAccountSignatures"), 2, 1.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "flagHandler"));
      v97 = v22;
      -[NSObject handlePendingFlag:](v23, "handlePendingFlag:", v22);
      goto LABEL_34;
    }
  }
LABEL_79:

}

- (id)optInKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManagerServer optInKeyForApplication:](KTOptInManagerServer, "optInKeyForApplication:", v2));

  return v3;
}

- (id)notificationKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManager notificationKeyForApplication:](KTOptInManager, "notificationKeyForApplication:", v2));

  return v3;
}

- (void)clearOptInStateAndPushToCloud
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  KTPendingFlag *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudRecords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v11 = 0;
  objc_msgSend(v4, "clearOptInStateForURI:application:error:", 0, v5, &v11);
  v6 = v11;

  if (v6)
  {
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B9A8);
    v7 = qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Opt-in reset failed clear all states: error: %@", buf, 0xCu);
    }
  }
  v8 = -[KTPendingFlag initWithFlag:conditions:]([KTPendingFlag alloc], "initWithFlag:conditions:", CFSTR("CloudKitOutgoing"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flagHandler"));
  objc_msgSend(v10, "handlePendingFlag:", v8);

}

- (void)setKVSSMTTime:(id)a3 forState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  dispatch_time_t v25;
  _QWORD v26[5];
  dispatch_semaphore_t v27;
  id v28;
  _QWORD v29[2];
  uint8_t buf[4];
  id v31;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kvs"));
  v28 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManagerServer getOptInHistory:store:error:](KTOptInManagerServer, "getOptInHistory:store:error:", v7, v9, &v28));
  v11 = v28;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logger"));
    objc_msgSend(v13, "logResultForEvent:hardFailure:result:", CFSTR("optInHistory"), 1, v11);

    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B9C8);
    v14 = qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "getOptInHistory failed with %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = dispatch_semaphore_create(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
    v29[0] = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v29[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    objc_msgSend(v16, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kvs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation optInKey](self, "optInKey"));
    objc_msgSend(v20, "setObject:forKey:", v16, v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "kvs"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001911BC;
    v26[3] = &unk_10023A9D8;
    v26[4] = self;
    v27 = v15;
    v24 = v15;
    objc_msgSend(v23, "forceSync:", v26);

    v25 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v24, v25);

  }
}

- (void)clearFailureEvents
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v9 = 0;
  v6 = objc_msgSend(v4, "clearAllFailureEvents:error:", v5, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024B9E8);
    v8 = qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "failed to clear existing failure events: %@", buf, 0xCu);
    }
  }

}

- (void)clearCoreFollowUp
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "followup"));
  v7 = 0;
  v4 = objc_msgSend(v3, "clearAllFollowups:", &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024BA08);
    v6 = qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "failed to clear existing follow ups: %@", buf, 0xCu);
    }
  }

}

- (void)notifyOptInStatusChanged
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation notificationKey](self, "notificationKey"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", v3, 0, 0, 1);

}

- (unint64_t)decodeAndVerifyOptInOutResponse:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6
{
  _BOOL8 v8;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  void *v24;
  id v26;
  id v27;
  uint8_t buf[4];
  _BYTE v29[18];

  v8 = a4;
  v27 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](OptInOutResponse, "parseFromData:error:", a3, &v27));
  v11 = v27;
  if (v10)
  {
    if (objc_msgSend(v10, "status") == 1 || objc_msgSend(v10, "status") == 3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "smt"));
      v26 = 0;
      v13 = -[KTSetOptInStateOperation decodeAndVerifySMT:optInOutState:optInOutTime:error:](self, "decodeAndVerifySMT:optInOutState:optInOutTime:error:", v12, v8, a5, &v26);
      v14 = v26;

      if (v13 != 1)
      {
        if (qword_1002A7AD8 != -1)
          dispatch_once(&qword_1002A7AD8, &stru_10024BA68);
        v15 = (void *)qword_1002A7AE0;
        if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
        {
          v16 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverEventInfo"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v29 = v17;
          *(_WORD *)&v29[8] = 2112;
          *(_QWORD *)&v29[10] = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SMT verification failed for OptInOutResponse with %@: %@", buf, 0x16u);

        }
        if (a6 && v14)
          *a6 = objc_retainAutorelease(v14);
      }

      v18 = 0;
      goto LABEL_26;
    }
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024BA48);
    v21 = (void *)qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = objc_msgSend(v10, "status");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverEventInfo"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v29 = v23;
      *(_WORD *)&v29[4] = 2112;
      *(_QWORD *)&v29[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "optInOutResponse status failure: %d. ServerHint: %@", buf, 0x12u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, (int)objc_msgSend(v10, "status"), CFSTR("optInOutResponse status failure: %d"), objc_msgSend(v10, "status")));
  }
  else
  {
    if (qword_1002A7AD8 != -1)
      dispatch_once(&qword_1002A7AD8, &stru_10024BA28);
    v19 = qword_1002A7AE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to parse optInOutResponse from directory server: %@", buf, 0xCu);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -318, v11, CFSTR("failed to parse optInOutResponse from directory server")));
  }
  v18 = v20;
  v13 = 0;
  if (a6 && v20)
  {
    v18 = objc_retainAutorelease(v20);
    v13 = 0;
    *a6 = v18;
  }
LABEL_26:

  return v13;
}

- (unint64_t)decodeAndVerifySMT:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  unsigned int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint8_t buf[4];
  id v63;

  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicKeyStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation applicationId](self, "applicationId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationPublicKeyStore:", v13));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appSmtKeyStore"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signatureVerifier"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInStateOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataStore"));
    v19 = (void *)v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMutationTimestamp signedTypeWithObject:verifier:dataStore:](SignedMutationTimestamp, "signedTypeWithObject:verifier:dataStore:", v10, v16, v18));

    v59 = 0;
    v21 = (unint64_t)objc_msgSend(v20, "verifyWithError:", &v59);
    v22 = v59;
    if (v21 != 1)
    {
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024BAA8);
      v34 = qword_1002A7AE0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v22;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "failed to verify optInOut SMT from directory server: %@", buf, 0xCu);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -316, v22, CFSTR("failed to verify optInOut SMT from directory server")));
      v36 = v35;
      v37 = 0;
      if (a6 && v35)
      {
        v36 = objc_retainAutorelease(v35);
        v37 = 0;
        *a6 = v36;
      }
      goto LABEL_60;
    }
    v58 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parsedMutationWithError:", &v58));
    v56 = v58;
    v57 = v23;
    if (!v23)
    {
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024BAC8);
      v37 = v56;
      v38 = qword_1002A7AE0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v56;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "failed to parse mutation from SMT from directory server: %@", buf, 0xCu);
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -316, v56, CFSTR("failed to parse mutation from SMT from directory server")));
      v36 = v39;
      v21 = 0;
      if (a6 && v39)
      {
        v36 = objc_retainAutorelease(v39);
        v21 = 0;
        *a6 = v36;
      }
      goto LABEL_59;
    }
    v24 = objc_msgSend(v23, "mutationType");
    if (v24 == 6)
    {
      v55 = v19;
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024BB08);
      v40 = (void *)qword_1002A7AE0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_DEBUG))
      {
        v41 = v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "optInOutMutation"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "description"));
        *(_DWORD *)buf = 138412290;
        v63 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "decodeAndVerifySMT OptInOut_Sync: %@", buf, 0xCu);

        v23 = v57;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "optInOutMutation"));
      v45 = v23;
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)objc_msgSend(v44, "timestampMs") / 0x3E8)));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "optInOutMutation"));
    }
    else
    {
      if (v24 != 3)
      {
        if (qword_1002A7AD8 != -1)
          dispatch_once(&qword_1002A7AD8, &stru_10024BB28);
        v37 = v56;
        v53 = qword_1002A7AE0;
        if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "mutation from directory server not optInOut", buf, 2u);
        }
        v51 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -314, CFSTR("mutation from directory server not optInOut")));

        v31 = 0;
        if (a6 && v51)
        {
          v51 = objc_retainAutorelease(v51);
          v31 = 0;
          v21 = 0;
          *a6 = v51;
        }
        else
        {
          v21 = 0;
        }
        goto LABEL_58;
      }
      v55 = v19;
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024BAE8);
      v25 = (void *)qword_1002A7AE0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_DEBUG))
      {
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "optInOut"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "description"));
        *(_DWORD *)buf = 138412290;
        v63 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "decodeAndVerifySMT OptInOutMutation: %@", buf, 0xCu);

        v23 = v57;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "optInOut"));
      v30 = v23;
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)objc_msgSend(v29, "timestampMs") / 0x3E8)));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "optInOut"));
    }
    v46 = v32;
    v47 = objc_msgSend(v32, "optIn");

    if ((_DWORD)v47 == v8)
    {
      v21 = 1;
      if (a5)
      {
        v19 = v55;
        if (v31)
        {
          v31 = objc_retainAutorelease(v31);
          *a5 = v31;
          v21 = 1;
        }
        v51 = v22;
      }
      else
      {
        v51 = v22;
        v19 = v55;
      }
      v37 = v56;
    }
    else
    {
      v60[0] = CFSTR("mutation");
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v47));
      v60[1] = CFSTR("expected");
      v61[0] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
      v61[1] = v49;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));

      v51 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", CFSTR("TransparencyErrorVerify"), -315, 0, v50, CFSTR("mutation from directory server has wrong optInOut state")));
      if (qword_1002A7AD8 != -1)
        dispatch_once(&qword_1002A7AD8, &stru_10024BB48);
      v37 = v56;
      v52 = qword_1002A7AE0;
      v19 = v55;
      if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v51;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "mutation from directory server has wrong optInOut %@", buf, 0xCu);
      }
      if (a6 && v51)
        *a6 = objc_retainAutorelease(v51);

      v21 = 0;
    }
LABEL_58:

    v36 = 0;
    v22 = v51;
LABEL_59:

LABEL_60:
    goto LABEL_61;
  }
  if (qword_1002A7AD8 != -1)
    dispatch_once(&qword_1002A7AD8, &stru_10024BA88);
  v33 = qword_1002A7AE0;
  if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "could not get KTApplicationPublicKeyStore", buf, 2u);
  }
  v21 = 0;
LABEL_61:

  return v21;
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

- (NSMutableDictionary)optInResult
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setOptInResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOptInStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)applicationId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setApplicationId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setErrorState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_applicationId, 0);
  objc_storeStrong((id *)&self->_optInStates, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_optInResult, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
