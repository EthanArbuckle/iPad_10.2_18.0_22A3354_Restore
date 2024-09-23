@implementation KTContextVerifier

- (unint64_t)checkBatchQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "smh"));
  v10 = -[KTContextVerifier checkResponseFreshness:smh:receiptDate:error:](self, "checkResponseFreshness:smh:receiptDate:error:", 0, v9, v8, a5);

  return v10;
}

- (unint64_t)checkQueryInfoFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pendingSmtsArray"));
  v10 = -[KTContextVerifier checkResponseFreshness:smh:receiptDate:error:](self, "checkResponseFreshness:smh:receiptDate:error:", v9, 0, v8, a5);

  return v10;
}

- (void)checkBatchQueryResponseEpochs:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "hasPerApplicationTreeEntry");
  v5 = v18;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perApplicationTreeEntry"));
    v5 = v18;
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perApplicationTreeEntry"));
      if (!objc_msgSend(v8, "hasSlh"))
      {
LABEL_6:

        v5 = v18;
        goto LABEL_7;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perApplicationTreeEntry"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slh"));

      v5 = v18;
      if (v10)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perApplicationTreeEntry"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "slh"));
        -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v8);
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  v11 = objc_msgSend(v5, "hasTopLevelTreeEntry");
  v12 = v18;
  if (v11)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topLevelTreeEntry"));
    v12 = v18;
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topLevelTreeEntry"));
      if (!objc_msgSend(v15, "hasSlh"))
      {
LABEL_12:

        v12 = v18;
        goto LABEL_13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topLevelTreeEntry"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "slh"));

      v12 = v18;
      if (v17)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topLevelTreeEntry"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "slh"));
        -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v15);
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 queryInfoHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, _QWORD, id);
  unint64_t v19;
  void *v20;
  unsigned __int8 v21;
  unint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  TransparencyMapInclusionProofVerifier *v32;
  void *v33;
  void *v34;
  TransparencyMapInclusionProofVerifier *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  unint64_t v45;
  id v46;
  void *v47;
  unint64_t v48;
  id v49;
  void *v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  TransparencyMapEntryVerifier *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  TransparencyMapEntryVerifier *v70;
  TransparencyMapEntryVerifier *v71;
  void *v72;
  void (**v73)(id, void *, _QWORD, id);
  uint64_t v74;
  TransparencyMapInclusionProofVerifier *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *, _QWORD, id))a8;
  v19 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", objc_msgSend(v14, "status"), a7);
  if (v19 != 1)
  {
    v26 = v19;
    if (qword_1002A7490 != -1)
      dispatch_once(&qword_1002A7490, &stru_1002459F0);
    v27 = (void *)qword_1002A7498;
    if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
    {
      v28 = v27;
      *(_DWORD *)buf = 138543618;
      v89 = (uint64_t)v17;
      v90 = 1024;
      LODWORD(v91) = objc_msgSend(v14, "status");
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "BatchQueryResponse for fetchId %{public}@ server error: %d", buf, 0x12u);

    }
    goto LABEL_25;
  }
  -[KTContextVerifier checkBatchQueryResponseEpochs:](self, "checkBatchQueryResponseEpochs:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  v21 = objc_msgSend(v20, "ready:", a7);

  if ((v21 & 1) != 0)
  {
    v22 = -[KTContextVerifier checkBatchQueryResponseFreshness:receiptDate:error:](self, "checkBatchQueryResponseFreshness:receiptDate:error:", v14, v16, a7);
    if (v22 == 1)
    {
      v23 = objc_msgSend(v14, "queryInfoArray_Count");
      if (v23 > objc_msgSend(v15, "uriArray_Count"))
      {
        v24 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -326, CFSTR("More query infos in response than in request for fetchId %@, aborting validation and deleting record"), v17));
        if (qword_1002A7490 != -1)
          dispatch_once(&qword_1002A7490, &stru_100245A50);
        v25 = qword_1002A7498;
        if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v89 = (uint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "More query infos in response than in request for fetchId %{public}@, aborting validation and deleting record", buf, 0xCu);
        }
        v26 = 0;
        if (a7 && v24)
        {
          v24 = objc_retainAutorelease(v24);
          v26 = 0;
          *a7 = v24;
        }
        goto LABEL_26;
      }
      v32 = [TransparencyMapInclusionProofVerifier alloc];
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
      v35 = -[TransparencyMapInclusionProofVerifier initWithKeyStore:application:](v32, "initWithKeyStore:application:", v33, v34);

      v75 = v35;
      objc_msgSend(v14, "setVerifier:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      objc_msgSend(v14, "setDataStore:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "optInServer"));
      objc_msgSend(v14, "setOptInServer:", v38);

      v87 = 0;
      v26 = (unint64_t)objc_msgSend(v14, "verifyWithError:", &v87);
      v77 = v87;
      v78 = v17;
      v81 = v16;
      if (v26 == 1)
      {
        if (objc_msgSend(v14, "queryInfoArray_Count"))
        {
          v39 = 0;
          v74 = kTransparencyResponseMetadataKeyServerHint;
          v73 = v18;
          v79 = v15;
          while (1)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queryInfoArray"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", v39));

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uriArray"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v39));

            v44 = objc_msgSend(v41, "status");
            v86 = 0;
            v45 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", v44, &v86);
            v46 = v86;
            v47 = v46;
            if (v45 == 1)
              break;
            v18[2](v18, v43, 0, v46);
            v49 = v47;
LABEL_65:

            if (++v39 >= (unint64_t)objc_msgSend(v14, "queryInfoArray_Count"))
              goto LABEL_74;
          }
          v85 = v46;
          v48 = -[KTContextVerifier checkQueryInfoFreshness:receiptDate:error:](self, "checkQueryInfoFreshness:receiptDate:error:", v41, v81, &v85);
          v49 = v85;

          if (v48 != 1)
          {
            if (qword_1002A7490 != -1)
              dispatch_once(&qword_1002A7490, &stru_100245A90);
            v15 = v79;
            v56 = qword_1002A7498;
            if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558274;
              v89 = 1752392040;
              v90 = 2112;
              v91 = v43;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "QueryInfo for %{mask.hash}@ is outside MMD", buf, 0x16u);
            }
            v18[2](v18, v43, 0, v49);
            goto LABEL_65;
          }
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "uriWitness"));
          v84 = v49;
          v51 = -[KTContextVerifier verifyUriWitness:uri:error:](self, "verifyUriWitness:uri:error:", v50, v43, &v84);
          v80 = v84;

          if (v51 != 1)
          {
            if (qword_1002A7490 != -1)
              dispatch_once(&qword_1002A7490, &stru_100245AB0);
            v15 = v79;
            v57 = qword_1002A7498;
            if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558530;
              v89 = 1752392040;
              v90 = 2112;
              v91 = v43;
              v92 = 2114;
              v93 = v78;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "URIWitness verification failed for %{mask.hash}@ fetchId %{public}@", buf, 0x20u);
            }
            v49 = v80;
            v18[2](v18, v43, 0, v80);
            goto LABEL_65;
          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
          v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v74));

          v76 = (void *)v53;
          if (objc_msgSend(v41, "pendingSmtsArray_Count"))
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pendingSmtsArray"));
            v83 = v80;
            v55 = -[KTContextVerifier verifySMTs:uri:serverHint:error:](self, "verifySMTs:uri:serverHint:error:", v54, v43, v53, &v83);
            v49 = v83;

            if (v55 != 1)
            {
              v15 = v79;
              v18 = v73;
              if (qword_1002A7490 != -1)
                dispatch_once(&qword_1002A7490, &stru_100245AD0);
              v66 = qword_1002A7498;
              if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 141558530;
                v89 = 1752392040;
                v90 = 2112;
                v91 = v43;
                v92 = 2114;
                v93 = v78;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Pending SMT verification failed for %{mask.hash}@ fetchId %{public}@", buf, 0x20u);
              }
              v73[2](v73, v43, 0, v49);
              goto LABEL_63;
            }
            v80 = v49;
            v15 = v79;
            v18 = v73;
          }
          else
          {
            v15 = v79;
          }
          if (!objc_msgSend(v41, "hasMapEntry"))
          {
            v49 = v80;
            v64 = v76;
            goto LABEL_52;
          }
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mapEntry"));
          v71 = [TransparencyMapEntryVerifier alloc];
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "index"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "appSthKeyStore"));
          v61 = -[TransparencyMapEntryVerifier initWithPositon:trustedKeyStore:](v71, "initWithPositon:trustedKeyStore:", v69, v60);

          v70 = v61;
          objc_msgSend(v58, "setVerifier:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
          objc_msgSend(v58, "setDataStore:", v62);

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "verifiableSmh"));
          objc_msgSend(v58, "setSmh:", v63);

          v64 = v76;
          objc_msgSend(v58, "setMetadataValue:key:", v76, v74);
          v82 = v80;
          v72 = v58;
          v65 = objc_msgSend(v58, "verifyWithError:", &v82);
          v49 = v82;

          if (v65 == (id)1)
          {

            v15 = v79;
            v18 = v73;
LABEL_52:
            ((void (**)(id, void *, void *, id))v18)[2](v18, v43, v41, 0);
LABEL_64:

            goto LABEL_65;
          }
          v18 = v73;
          if (qword_1002A7490 != -1)
            dispatch_once(&qword_1002A7490, &stru_100245AF0);
          v15 = v79;
          v67 = qword_1002A7498;
          if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558530;
            v89 = 1752392040;
            v90 = 2112;
            v91 = v43;
            v92 = 2114;
            v93 = v78;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "MapEntry verification failed for %{mask.hash}@ fetchId %{public}@", buf, 0x20u);
          }
          v73[2](v73, v43, 0, v49);

LABEL_63:
          v64 = v76;
          goto LABEL_64;
        }
      }
      else
      {
        if (qword_1002A7490 != -1)
          dispatch_once(&qword_1002A7490, &stru_100245A70);
        v68 = qword_1002A7498;
        if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v89 = (uint64_t)v17;
          v90 = 2112;
          v91 = v77;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Proof validation failed for fetchId %{public}@: %@", buf, 0x16u);
        }
        if (a7 && v77)
          *a7 = objc_retainAutorelease(v77);
      }
LABEL_74:

      v24 = 0;
      v16 = v81;
      v17 = v78;
      goto LABEL_26;
    }
    v26 = v22;
    if (qword_1002A7490 != -1)
      dispatch_once(&qword_1002A7490, &stru_100245A30);
    v30 = qword_1002A7498;
    if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v89 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "BatchQueryResponse for fetchId %{public}@ exceeded MMD", buf, 0xCu);
    }
LABEL_25:
    v24 = 0;
    goto LABEL_26;
  }
  if (qword_1002A7490 != -1)
    dispatch_once(&qword_1002A7490, &stru_100245A10);
  v29 = qword_1002A7498;
  if (os_log_type_enabled((os_log_t)qword_1002A7498, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v89 = (uint64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "BatchQueryResponse for fetchId %{public}@ waiting for keystore refresh", buf, 0xCu);
  }
  v24 = 0;
  v26 = 2;
LABEL_26:

  return v26;
}

- (id)createTransparentDataFromQueryInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  KTTransparentData *v13;
  KTTransparentData *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  if (!objc_msgSend(v6, "hasMapEntry")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapEntry")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapLeaf")),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v7,
        !v9))
  {
    v12 = 0;
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapEntry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapLeaf"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IdsMapLeaf parseFromData:error:](IdsMapLeaf, "parseFromData:error:", v11, a4));

  if (v12)
  {
LABEL_6:
    v14 = [KTTransparentData alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uriWitness"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "output"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pendingSmtsArray"));
    v13 = -[KTTransparentData initWithUriVRFOutput:mapLeaf:pendingSMTs:error:](v14, "initWithUriVRFOutput:mapLeaf:pendingSMTs:error:", v16, v12, v17, a4);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v18, "patLogBeginningMs") / 1000.0));
    -[KTTransparentData setCurrentTreeEpochBeginDate:](v13, "setCurrentTreeEpochBeginDate:", v19);

    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10010DA7C;
  v20[3] = &unk_100245B58;
  v20[4] = self;
  v21 = a6;
  v22 = v14;
  v23 = a8;
  v15 = v14;
  v16 = v23;
  v17 = v21;
  v18 = -[KTContextVerifier handleBatchQueryResponse:queryRequest:receiptDate:fetchId:error:queryInfoHandler:](self, "handleBatchQueryResponse:queryRequest:receiptDate:fetchId:error:queryInfoHandler:", a3, a4, v15, v17, a7, v20);

  return v18;
}

- (unint64_t)verifySMTTimestamps:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a3;
  v8 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = kKTMaximumMergeDelayMs;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMutationTimestamp signedTypeWithObject:](SignedMutationTimestamp, "signedTypeWithObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), (_QWORD)v24));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parsedMutationWithError:", a5));
        v17 = v16;
        if (!v16)
          goto LABEL_16;
        v18 = (double)((unint64_t)objc_msgSend(v16, "mutationMs") + v13);
        objc_msgSend(v8, "timeIntervalSince1970");
        if (v19 * 1000.0 > v18)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -307, CFSTR("SMT timestamp more than MMD ago")));
          v22 = v21;
          if (a5 && v21)
            *a5 = objc_retainAutorelease(v21);

LABEL_16:
          v20 = 0;
          goto LABEL_17;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v20 = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v20 = 1;
  }
LABEL_17:

  return v20;
}

- (unint64_t)verifySMTs:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t v25;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  KTContextVerifier *v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v10 = a3;
  v28 = a4;
  v29 = a5;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v11)
  {
    v27 = *(_QWORD *)v43;
    v25 = 1;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore", v25));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appSmtKeyStore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signatureVerifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMutationTimestamp signedTypeWithObject:verifier:dataStore:](SignedMutationTimestamp, "signedTypeWithObject:verifier:dataStore:", v13, v16, v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
        objc_msgSend(v18, "setApplication:", v19);

        v20 = objc_msgSend(v18, "verifyWithError:", a6);
        if (v20 != (id)1)
        {

          v25 = (unint64_t)v20;
          goto LABEL_15;
        }
        v36 = 0;
        v37 = &v36;
        v38 = 0x3032000000;
        v39 = sub_10015703C;
        v40 = sub_10015704C;
        v41 = 0;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100157054;
        v30[3] = &unk_100248AA0;
        v22 = v18;
        v31 = v22;
        v32 = self;
        v33 = v28;
        v34 = v29;
        v35 = &v36;
        objc_msgSend(v21, "performBlockAndWait:", v30);

        if (a6)
        {
          v23 = (void *)v37[5];
          if (v23)
            *a6 = objc_retainAutorelease(v23);
        }

        _Block_object_dispose(&v36, 8);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v25 = 1;
  }
LABEL_15:

  return v25;
}

- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 uri:(id)a5 receiptServerHint:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  KTContextVerifier *v31;
  id v32;

  v32 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = +[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics");
  v18 = v17;
  if (v12 && v17)
    objc_msgSend(v16, "addEntriesFromDictionary:", v12);
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SignedObjectHolder parseFromData:error:](SignedMutationTimestamp, "parseFromData:error:", v32, 0));
    v20 = v19;
    if (v19)
    {
      v31 = self;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "signature"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "signature"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "base64EncodedStringWithOptions:", 0));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("sig"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parsedMutationWithError:", 0));
      v25 = v24;
      if (v24)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v24, "mutationMs")));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("ms"));

      }
      self = v31;
    }
    if (v13)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("uri"));
    if (v14)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("rSH"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySmtInclusionEvent"), v28));
  if (objc_msgSend(v16, "count"))
    v30 = v16;
  else
    v30 = 0;
  objc_msgSend(v27, "logResultForEvent:hardFailure:result:withAttributes:", v29, 1, v15, v30);

}

- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 error:(id)a5
{
  -[KTContextVerifier reportVerifySMTFailure:analyticsData:uri:receiptServerHint:error:](self, "reportVerifySMTFailure:analyticsData:uri:receiptServerHint:error:", a3, a4, 0, 0, a5);
}

- (BOOL)areSMTsOverMMD:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  double v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    v6 = kKTMaximumMergeDelayMs;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v8 = (double)((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "getUnsigned:", "mutationMs", (_QWORD)v11)+ v6);
        +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
        if (v9 > v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)createErrorFromSMTFailure:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorDomain"));
  v8 = objc_msgSend(v6, "errorCode");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v7, v8, v5, 0));
  return v9;
}

- (id)createChainOfErrorsFromSMTFailures:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier createErrorFromSMTFailure:underlyingError:](self, "createErrorFromSMTFailure:underlyingError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), v10));

        v9 = (char *)v9 + 1;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 savePendingError:(BOOL)a7 analyticsData:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  KTContextVerifier *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  int64_t v48;
  _BOOL4 v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id obj;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];

  v49 = a7;
  v11 = a3;
  v12 = a5;
  v13 = a8;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v59;
    v54 = kKTMaximumMergeDelayMs;
    v47 = kTransparencyResponseMetadataKeyServerHint;
    v18 = self;
    v51 = *(_QWORD *)v59;
    v52 = v13;
    v48 = a6;
    while (1)
    {
      v19 = 0;
      v50 = v15;
      do
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v19);
        if (objc_msgSend(v20, "mergeResult") == (id)2)
        {
          v21 = (double)((unint64_t)objc_msgSend(v20, "getUnsigned:", "mutationMs") + v54);
          +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
          if (v22 <= v21)
          {
            if (!v49)
              goto LABEL_26;
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "receiptServerHint"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), a6, v12, CFSTR("SMT verification failure before MMD for %@"), v40));

            if (qword_1002A78A0 != -1)
              dispatch_once(&qword_1002A78A0, &stru_100248AE0);
            v41 = (void *)qword_1002A78A8;
            if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_INFO))
            {
              v42 = v41;
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "receiptServerHint"));
              *(_DWORD *)buf = 138543874;
              v63 = v43;
              v64 = 2112;
              v65 = v57;
              v66 = 2112;
              v67 = v12;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "SMT verification failure before MMD for %{public}@, error: %@, underlyingError: %@", buf, 0x20u);

            }
            v18 = self;
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "failures"));
            v24 = objc_claimAutoreleasedReturnValue(-[KTContextVerifier createChainOfErrorsFromSMTFailures:](v18, "createChainOfErrorsFromSMTFailures:", v23));

            v53 = (void *)v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithError:underlyingError:](TransparencyError, "errorWithError:underlyingError:", v12, v24));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "receiptServerHint"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), a6, v25, CFSTR("SMT verification failure after MMD for %@"), v26));

            if (qword_1002A78A0 != -1)
              dispatch_once(&qword_1002A78A0, &stru_100248AC0);
            v13 = v52;
            v27 = (void *)qword_1002A78A8;
            if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
            {
              v28 = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "receiptServerHint"));
              *(_DWORD *)buf = 138543874;
              v63 = v29;
              v64 = 2112;
              v65 = v57;
              v66 = 2112;
              v67 = v12;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "SMT verification failure after MMD for %{public}@, error: %@, underlyingError: %@", buf, 0x20u);

            }
            objc_msgSend(v20, "setMergeResult:", 0);
            if (objc_msgSend(v20, "signatureResult") == (id)2)
              objc_msgSend(v20, "setSignatureResult:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "smt"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uri"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "receiptServerHint"));
            -[KTContextVerifier reportVerifySMTFailure:analyticsData:uri:receiptServerHint:error:](v18, "reportVerifySMTFailure:analyticsData:uri:receiptServerHint:error:", v30, v52, v31, v32, v57);

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("opUUID")));
            if (v33)
            {
              v34 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v47));
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](v18, "context"));
              v37 = v12;
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stateMachine"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "smt"));
              objc_msgSend(v38, "notifyBackgroundValidationFailure:data:type:serverHint:failure:", v34, v39, CFSTR("SmtInclusion"), v35, v57);

              v12 = v37;
              v18 = self;
              v13 = v52;

              a6 = v48;
            }

            v16 = 1;
            v15 = v50;
          }
          if (v57)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](v18, "dataStore"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "createSignedMutationTimestampsFailure"));

            v18 = self;
            objc_msgSend(v45, "setErrorCode:", a6);
            objc_msgSend(v45, "setErrorDomain:", CFSTR("TransparencyErrorVerify"));
            objc_msgSend(v45, "setMutation:", v20);

          }
          v17 = v51;
        }
LABEL_26:
        v19 = (char *)v19 + 1;
      }
      while (v15 != v19);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      if (!v15)
        goto LABEL_30;
    }
  }
  v16 = 0;
LABEL_30:

  return v16 & 1;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 analyticsData:(id)a7
{
  return -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:savePendingError:analyticsData:](self, "failSMTsIfOverMMD:proof:underlyingError:errorCode:savePendingError:analyticsData:", a3, a4, a5, a6, 1, a7);
}

- (void)deleteSMT:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  objc_msgSend(v8, "deleteObject:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smt"));
  -[KTContextVerifier reportVerifySMTFailure:analyticsData:error:](self, "reportVerifySMTFailure:analyticsData:error:", v9, 0, v6);

}

- (id)verifyKTSMTSignatures:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v42;
  KTContextVerifier *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  uint8_t buf[4];
  id v58;
  _BYTE v59[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = v5;
  v48 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (!v48)
    goto LABEL_40;
  v47 = *(_QWORD *)v53;
  v45 = kTransparencyErrorDecode;
  v44 = self;
  v42 = v7;
  while (2)
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v53 != v47)
        objc_enumerationMutation(v7);
      v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v8);
      v10 = objc_autoreleasePoolPush();
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smt"));

      if (!v11)
      {
        v19 = 0;
LABEL_15:
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smt"));
        objc_msgSend(v6, "addObject:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v45, -72, v19, CFSTR("SMT from DB failed to parse")));
        -[KTContextVerifier deleteSMT:error:](self, "deleteSMT:error:", v9, v24);

        if (qword_1002A78A0 != -1)
          dispatch_once(&qword_1002A78A0, &stru_100248B00);
        v25 = qword_1002A78A8;
        if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "SMT from DB failed to parse: %@", buf, 0xCu);
        }
        goto LABEL_29;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smt"));
      v51 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SignedObjectHolder parseFromData:error:](SignedMutationTimestamp, "parseFromData:error:", v12, &v51));
      v14 = v51;

      if (!v13)
      {
        v19 = v14;
        goto LABEL_15;
      }
      v46 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appSmtKeyStore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "signatureVerifier"));
      objc_msgSend(v13, "setVerifier:", v17);

      v50 = v14;
      v18 = objc_msgSend(v13, "verifyWithError:", &v50);
      v19 = v50;

      if (v18)
      {
        if (v18 != (id)1)
        {
          if (v18 == (id)2)
          {
            v56 = v9;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
            v21 = -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:](self, "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:", v20, 0, v19, -64, 0);

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smt"));
              objc_msgSend(v6, "addObject:", v22);

            }
            else
            {

              v19 = v13;
            }
            v10 = v46;
            goto LABEL_29;
          }
          goto LABEL_22;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "receiptTime"));
        objc_msgSend(v27, "timeIntervalSinceNow");
        v29 = -v28;

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29));
        v31 = v6;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](v44, "applicationID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySMTTime"), v32));
        objc_msgSend(v26, "logMetric:withName:", v30, v33);

        self = v44;
        v6 = v31;
        v7 = v42;

      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smt"));
        objc_msgSend(v6, "addObject:", v26);
      }

LABEL_22:
      objc_msgSend(v9, "setUnsigned:value:", "signatureResult", v18);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      v49 = 0;
      v35 = objc_msgSend(v34, "persistAndRefaultObject:error:", v9, &v49);
      v36 = v49;

      if ((v35 & 1) == 0)
      {
        if (qword_1002A78A0 != -1)
          dispatch_once(&qword_1002A78A0, &stru_100248B20);
        v37 = qword_1002A78A8;
        if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v36;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "failed to persist signature verified SMTS: %@", buf, 0xCu);
        }
        if (v36)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](v44, "dataStore"));
          objc_msgSend(v38, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("handlePendingSigSMTs"), v36);

          if (!v19)
            v19 = v36;
        }

        objc_autoreleasePoolPop(v46);
        goto LABEL_40;
      }
      v10 = v46;
      if (a4 && v19)
        *a4 = objc_retainAutorelease(v19);

      self = v44;
LABEL_29:

      objc_autoreleasePoolPop(v10);
      v8 = (char *)v8 + 1;
    }
    while (v48 != v8);
    v48 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v48)
      continue;
    break;
  }
LABEL_40:

  if (objc_msgSend(v6, "count"))
    v39 = v6;
  else
    v39 = 0;
  v40 = v39;

  return v40;
}

+ (int64_t)verifyDeviceMutation:(id)a3 mapLeaf:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "mutationType") != 1
    && objc_msgSend(v5, "mutationType") != 2
    && objc_msgSend(v5, "mutationType") != 4
    && objc_msgSend(v5, "mutationType") != 5)
  {
    v10 = -71;
    goto LABEL_23;
  }
  if (!objc_msgSend(v5, "hasOptInExtension")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getOptInOutWithExt")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceMutation")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountKeyHash")),
        v10 = +[KTContextVerifier verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:](KTContextVerifier, "verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:", v7, v9, v6, 0), v9, v8, v7, !v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceMutation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountKeyHash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceMutation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceIdHash"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceMutation"));
    v16 = objc_msgSend(v15, "appVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceMutation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientDataHash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordForAccountKeyHash:deviceIdHash:appVersion:clientDataHash:", v12, v14, v16, v18));

    if (v19)
    {
      v20 = objc_msgSend(v19, "markedForDeletionMs");
      v21 = objc_msgSend(v5, "mutationType");
      if (v20)
      {
        if (v21 == 4 || v21 == 1)
        {
          v22 = objc_msgSend(v19, "markedForDeletionMs");
          if (v22 <= objc_msgSend(v5, "mutationMs"))
          {
            v10 = -70;
LABEL_22:

            goto LABEL_23;
          }
        }
      }
      else if (v21 != 1 && objc_msgSend(v5, "mutationType") != 4)
      {
        v26 = objc_msgSend(v19, "addedMs");
        if (v26 < objc_msgSend(v5, "mutationMs"))
        {
          v10 = -69;
          goto LABEL_22;
        }
      }
    }
    else if (objc_msgSend(v5, "mutationType") == 1 || objc_msgSend(v5, "mutationType") == 4)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceMutation"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23, "accountKeyHash"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountForAccountKeyHash:", v24));

      LOBYTE(v23) = objc_msgSend(v25, "hasOptInAfter:", objc_msgSend(v5, "mutationMs"));
      if ((v23 & 1) == 0)
      {
        v10 = -68;
        goto LABEL_22;
      }
    }
    v10 = 0;
    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

+ (int64_t)verifyOptInOutMutationMerged:(id)a3 mapLeaf:(id)a4 pendingAccountAdds:(id)a5
{
  id v7;
  id v8;
  id v9;
  OptInOutWithExt *v10;
  void *v11;
  int64_t v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[OptInOutWithExt initWithMutation:]([OptInOutWithExt alloc], "initWithMutation:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash"));

  v12 = +[KTContextVerifier verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:](KTContextVerifier, "verifyOptInOutWithExtMerged:accountKeyHash:mapLeaf:pendingAccountAdds:", v10, v11, v8, v7);
  return v12;
}

+ (int64_t)verifyOptInOutWithExtMerged:(id)a3 accountKeyHash:(id)a4 mapLeaf:(id)a5 pendingAccountAdds:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  unsigned int v24;
  id v25;
  unsigned int v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "accountForAccountKeyHash:", v10));
  if ((v12 || objc_msgSend(v11, "containsObject:", v10))
    && ((objc_msgSend(v12, "isActive:", objc_msgSend(v9, "timestampMs")) & 1) != 0
     || objc_msgSend(v11, "containsObject:", v10)))
  {
    v34 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedOptInOutHistory:", &v34));
    v14 = v34;
    if (v13)
    {
      v15 = -287;
      if (objc_msgSend(v13, "count") && !v14)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reverseObjectEnumerator"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v18)
        {
          v19 = v18;
          v28 = 0;
          v29 = v11;
          v20 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v23 = objc_msgSend(v22, "timestampMs", v28, v29);
              if (v23 == objc_msgSend(v9, "timestampMs"))
              {
                v24 = objc_msgSend(v22, "optIn");
                if (v24 == objc_msgSend(v9, "optIn"))
                {
                  v15 = 0;
                  goto LABEL_27;
                }
              }
              else
              {
                v25 = objc_msgSend(v22, "timestampMs");
                if (v25 < objc_msgSend(v9, "timestampMs"))
                {
                  v26 = objc_msgSend(v22, "optIn");
                  if (v26 != objc_msgSend(v9, "optIn"))
                    v15 = -288;
                  else
                    v15 = 0;
                  goto LABEL_27;
                }
                objc_msgSend(v22, "timestampMs");
                objc_msgSend(v9, "timestampMs");
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            if (v19)
              continue;
            break;
          }
          v15 = -288;
LABEL_27:
          v14 = v28;
          v11 = v29;
        }
        else
        {
          v15 = -288;
        }

      }
    }
    else
    {
      v15 = -287;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 skipOptInOut:(BOOL)a4 proof:(id)a5 underlyingError:(id)a6 errorCode:(int64_t)a7 analyticsData:(id)a8
{
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  BOOL v31;
  id v33;
  id v34;
  int64_t v35;
  id v36;
  id v37;
  id obj;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  _BYTE v48[128];

  v12 = a4;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = objc_msgSend(v13, "mutableCopy");
  if (v12)
  {
    v33 = v16;
    v34 = v15;
    v35 = a7;
    v36 = v14;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = v13;
    obj = v13;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      v21 = kTransparencyErrorDecode;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v22);
          v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "smt"));

          if (v24
            && (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "smt")),
                v41 = 0,
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[SignedObjectHolder parseFromData:error:](SignedMutationTimestamp, "parseFromData:error:", v25, &v41)), v24 = v41, v25, v26))
          {
            v40 = v24;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "parsedMutationWithError:", &v40));
            v28 = v40;

            if (objc_msgSend(v27, "mutationType") == 3
              || objc_msgSend(v27, "mutationType") == 6)
            {
              objc_msgSend(v17, "removeObject:", v23);
              objc_msgSend(v23, "setMergeResult:", 1);
            }

            v24 = v28;
          }
          else
          {
            objc_msgSend(v17, "removeObject:", v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v21, -72, v24, CFSTR("SMT from DB failed to parse")));
            -[KTContextVerifier deleteSMT:error:](self, "deleteSMT:error:", v23, v29);

            if (qword_1002A78A0 != -1)
              dispatch_once(&qword_1002A78A0, &stru_100248B40);
            v30 = qword_1002A78A8;
            if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v24;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SMT from DB failed to parse: %@", buf, 0xCu);
            }
          }

          v22 = (char *)v22 + 1;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v19);
    }

    v14 = v36;
    v13 = v37;
    v15 = v34;
    a7 = v35;
    v16 = v33;
  }
  v31 = -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:](self, "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:", v17, v14, v15, a7, v16);

  return v31;
}

- (BOOL)verifyKTSMTsMerged:(id)a3 mapLeaf:(id)a4 analyticsData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int64_t v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  void *v42;
  KTContextVerifier *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  id v84;
  void *v85;
  _BYTE v86[128];

  v8 = a3;
  v63 = a4;
  v62 = a5;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 1;
    v69 = *(_QWORD *)v74;
    v67 = kTransparencyErrorDecode;
    v65 = v9;
    while (1)
    {
      v14 = 0;
      v66 = v11;
      do
      {
        if (*(_QWORD *)v74 != v69)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "smt"));

        if (v16)
        {
          v68 = v13;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "smt"));
          v72 = v12;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[SignedObjectHolder parseFromData:error:](SignedMutationTimestamp, "parseFromData:error:", v17, &v72));
          v19 = v72;

          if (v18)
          {
            v71 = v19;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parsedMutationWithError:", &v71));
            v12 = v71;

            if (v20)
            {
              v21 = -71;
              switch(objc_msgSend(v20, "mutationType"))
              {
                case 0u:
                  goto LABEL_31;
                case 1u:
                case 4u:
                  v22 = +[KTContextVerifier verifyDeviceMutation:mapLeaf:](KTContextVerifier, "verifyDeviceMutation:mapLeaf:", v20, v63);
                  if (!v22)
                    goto LABEL_32;
                  v21 = v22;
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsDeviceMutation"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accountKeyHash"));

                  if (v24)
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsDeviceMutation"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accountKeyHash"));
                    objc_msgSend(v61, "addObject:", v26);

                  }
LABEL_31:
                  v85 = v15;
                  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v85, 1));
                  v34 = -[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:](self, "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:", v33, 0, 0, v21, v62);

                  v13 = (v34 ^ 1) & v68;
                  break;
                case 2u:
                case 5u:
                  v21 = +[KTContextVerifier verifyDeviceMutation:mapLeaf:](KTContextVerifier, "verifyDeviceMutation:mapLeaf:", v20, v63);
                  if (!v21)
                    goto LABEL_32;
                  goto LABEL_31;
                case 3u:
                  if (qword_1002A78A0 != -1)
                    dispatch_once(&qword_1002A78A0, &stru_100248BA0);
                  v31 = qword_1002A78A8;
                  if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "WARNING: Skipping deprecated mutation type OPT_IN_OUT_MUTATION", buf, 2u);
                  }
                  goto LABEL_32;
                case 6u:
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "optInOutMutation"));
                  v21 = +[KTContextVerifier verifyOptInOutMutationMerged:mapLeaf:pendingAccountAdds:](KTContextVerifier, "verifyOptInOutMutationMerged:mapLeaf:pendingAccountAdds:", v32, v63, v61);

                  if (v21)
                    goto LABEL_31;
                  goto LABEL_32;
                default:
LABEL_32:
                  if (qword_1002A78A0 != -1)
                    dispatch_once(&qword_1002A78A0, &stru_100248BC0);
                  v35 = (void *)qword_1002A78A8;
                  if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_DEFAULT))
                  {
                    v36 = v35;
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "application"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri"));
                    v39 = objc_msgSend(v15, "mutationMs");
                    *(_DWORD *)buf = 138544130;
                    v78 = v37;
                    v79 = 2160;
                    v80 = 1752392040;
                    v81 = 2112;
                    v82 = v38;
                    v83 = 2048;
                    v84 = v39;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "verified SMT inclusion for %{public}@/%{mask.hash}@ mutationMs %lld", buf, 0x2Au);

                  }
                  v40 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
                  +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
                  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v41 - (double)(unint64_t)objc_msgSend(v20, "mutationMs")));
                  v64 = v20;
                  v43 = self;
                  v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("SmtMergeDelay"), v44));
                  objc_msgSend(v40, "logMetric:withName:", v42, v45);

                  v46 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "receiptTime"));
                  objc_msgSend(v47, "timeIntervalSinceNow");
                  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v48 * -1000.0));
                  v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](v43, "applicationID"));
                  v51 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("SmtDeviceMergeDelay"), v50));
                  objc_msgSend(v46, "logMetric:withName:", v49, v51);

                  self = v43;
                  v20 = v64;

                  v52 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
                  v53 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
                  v54 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySmtInclusionEvent"), v53));
                  objc_msgSend(v52, "logSuccessForEventNamed:", v54);

                  objc_msgSend(v15, "setMergeResult:", 1);
                  v13 = v68;
                  break;
              }
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
              v70 = v12;
              v56 = objc_msgSend(v55, "persistAndRefaultObject:error:", v15, &v70);
              v57 = v70;

              if ((v56 & 1) != 0)
              {
                v12 = v57;
                v9 = v65;
              }
              else
              {
                if (qword_1002A78A0 != -1)
                  dispatch_once(&qword_1002A78A0, &stru_100248BE0);
                v58 = qword_1002A78A8;
                v9 = v65;
                if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v57;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "failed to save verified KTSMTs: %@", buf, 0xCu);
                }
                if (v57)
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
                  objc_msgSend(v59, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("verifyKTSMTsMerged"), v57);

                  v12 = v57;
                }
                else
                {
                  v12 = 0;
                }
              }
              v11 = v66;
            }
            else
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v67, -73, v12, CFSTR("Mutation failed to parse")));
              -[KTContextVerifier deleteSMT:error:](self, "deleteSMT:error:", v15, v29);

              if (qword_1002A78A0 != -1)
                dispatch_once(&qword_1002A78A0, &stru_100248B80);
              v30 = qword_1002A78A8;
              if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v12;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Mutation failed to parse: %@", buf, 0xCu);
              }
              v13 = 0;
            }

            goto LABEL_48;
          }
          v12 = v19;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v67, -72, v12, CFSTR("SMT from DB failed to parse")));
        -[KTContextVerifier deleteSMT:error:](self, "deleteSMT:error:", v15, v27);

        if (qword_1002A78A0 != -1)
          dispatch_once(&qword_1002A78A0, &stru_100248B60);
        v28 = qword_1002A78A8;
        if (os_log_type_enabled((os_log_t)qword_1002A78A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v12;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "SMT from DB failed to parse: %@", buf, 0xCu);
        }
        v13 = 0;
LABEL_48:
        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
      if (!v11)
        goto LABEL_52;
    }
  }
  v12 = 0;
  LOBYTE(v13) = 1;
LABEL_52:

  return v13 & 1;
}

- (BOOL)verifyKTSMTsMerged:(id)a3 queryResponse:(id)a4 uri:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  TransparencyMapInclusionProofVerifier *v18;
  void *v19;
  void *v20;
  TransparencyMapInclusionProofVerifier *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v42;
  TransparencyMapInclusionProofVerifier *v43;
  uint64_t v44;
  id v45;
  id v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
    v12 = kTransparencyResponseMetadataKeyServerHint;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("APS")));

    if (v13 | v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v17 = v16;
      if (v13)
        objc_msgSend(v16, "setObject:forKey:", v13, v12);
      if (v15)
        objc_msgSend(v17, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("APS"));
    }
    else
    {
      v17 = 0;
    }
    if (objc_msgSend(v9, "status") == 1)
    {
      v44 = v15;
      v18 = [TransparencyMapInclusionProofVerifier alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
      v21 = -[TransparencyMapInclusionProofVerifier initWithKeyStore:application:](v18, "initWithKeyStore:application:", v19, v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));
      v43 = v21;
      objc_msgSend(v22, "setVerifier:", v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      objc_msgSend(v23, "setDataStore:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v12));
      objc_msgSend(v25, "setMetadataValue:key:", v27, v12);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));
      v46 = 0;
      v29 = objc_msgSend(v28, "verifyWithError:", &v46);
      v30 = v46;

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));
      v32 = v31;
      if (v29 == (id)1)
      {
        v45 = v30;
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mapLeafWithError:", &v45));
        v34 = v45;

        if (v33)
        {
          LOBYTE(self) = -[KTContextVerifier verifyKTSMTsMerged:mapLeaf:analyticsData:](self, "verifyKTSMTsMerged:mapLeaf:analyticsData:", v8, v33, v17);
          v32 = (void *)v33;
          v30 = v34;
        }
        else
        {
          v38 = v34;
          v42 = v34;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "data"));
          LODWORD(self) = !-[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:](self, "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:", v8, v40, v38, -79, v17);

          v32 = 0;
          v30 = v42;
        }
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "data"));
        LODWORD(self) = !-[KTContextVerifier failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:](self, "failSMTsIfOverMMD:proof:underlyingError:errorCode:analyticsData:", v8, v37, v30, -67, v17);

      }
      v15 = v44;
    }
    else
    {
      v30 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, (int)objc_msgSend(v9, "status"), CFSTR("Query response indicates server failure: %d"), objc_msgSend(v9, "status")));
      v35 = objc_msgSend(v9, "status") == 7;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
      LODWORD(self) = !-[KTContextVerifier failSMTsIfOverMMD:skipOptInOut:proof:underlyingError:errorCode:analyticsData:](self, "failSMTsIfOverMMD:skipOptInOut:proof:underlyingError:errorCode:analyticsData:", v8, v35, v36, v30, -306, v17);

    }
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTContextVerifier *v15;
  KTContextVerifier *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTContextVerifier;
  v15 = -[KTContextVerifier init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_applicationID, a5);
    objc_storeStrong((id *)&v16->_applicationKeyStore, a3);
    objc_storeStrong((id *)&v16->_dataStore, a4);
    objc_storeWeak((id *)&v16->_context, v14);
  }

  return v16;
}

- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5
{
  return -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:context:](self, "initWithApplicationKeyStore:dataStore:applicationID:context:", a3, a4, a5, 0);
}

- (unint64_t)checkServerStatus:(int)a3 isInsert:(BOOL)a4 error:(id *)a5
{
  BOOL v6;
  unint64_t result;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  int v12;

  v6 = a3 == 3 && a4;
  result = 1;
  if (a3 != 1 && !v6)
  {
    v8 = *(_QWORD *)&a3;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, a3, CFSTR("Query response indicates server failure: %d"), *(_QWORD *)&a3));
    if (qword_1002A78B0 != -1)
      dispatch_once(&qword_1002A78B0, &stru_100248C00);
    v9 = qword_1002A78B8;
    if (os_log_type_enabled((os_log_t)qword_1002A78B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Response indicates server failure: %d", buf, 8u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    objc_msgSend(v10, "triggerRefreshFromServerStatus:", v8);

    return 2 * ((_DWORD)v8 == 5);
  }
  return result;
}

- (unint64_t)checkServerStatus:(int)a3 error:(id *)a4
{
  return -[KTContextVerifier checkServerStatus:isInsert:error:](self, "checkServerStatus:isInsert:error:", *(_QWORD *)&a3, 0, a4);
}

- (unint64_t)checkResponseFreshness:(id)a3 smh:(id)a4 receiptDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12)
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (!objc_msgSend(v10, "count")
    || (v13 = -[KTContextVerifier verifySMTTimestamps:receiptDate:error:](self, "verifySMTTimestamps:receiptDate:error:", v10, v12, a6), v13 == 1))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
    if (v14 && (v15 = (void *)v14, v16 = objc_msgSend(v11, "hasSignature"), v15, v16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appSthKeyStore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "signatureVerifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:verifier:dataStore:](SignedMapHead, "signedTypeWithObject:verifier:dataStore:", v11, v19, v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      objc_msgSend(v21, "setOverrideBeginTime:", objc_msgSend(v22, "patLogBeginningMs"));

      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v13 = (unint64_t)objc_msgSend(v21, "verifyMMD:error:", a6);

    }
    else
    {
      v13 = 1;
    }
  }

  return v13;
}

+ (BOOL)verifyServerLoggableDatas:(id)a3 againstSyncedLoggableDatas:(id)a4 cloudDevices:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  __int128 v45;
  char v46;
  id v48;
  id v49;
  id v50;
  id obj;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];

  v8 = a3;
  v49 = a4;
  v9 = a5;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  v53 = v10;
  if (!v10)
  {
    v43 = 1;
    goto LABEL_48;
  }
  v50 = 0;
  v46 = 1;
  v52 = *(_QWORD *)v62;
  *(_QWORD *)&v11 = 138412546;
  v45 = v11;
  v48 = v9;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v62 != v52)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID", v45));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fetchSyncedLoggableDataByPushToken:registrationData:", v14, v15));

      if ((objc_msgSend(v9, "disableKTSyncabledKVSStore") & 1) != 0)
      {
        if (v16)
          goto LABEL_40;
        v17 = -101;
LABEL_30:
        v56 = v16;
        if (a6 && *a6)
          v18 = *a6;
        else
          v18 = 0;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientData"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "kt_hexString"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("clientData"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "kt_hexString"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("deviceID"));

        v36 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:", CFSTR("TransparencyErrorVerify"), v17, 4, v18, v31, CFSTR("IDS server data missing from syncedData")));
        if (qword_1002A78B0 != -1)
          dispatch_once(&qword_1002A78B0, &stru_100248C20);
        v37 = (void *)qword_1002A78B8;
        if (os_log_type_enabled((os_log_t)qword_1002A78B8, OS_LOG_TYPE_ERROR))
        {
          v38 = v37;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "kt_hexString"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientData"));
          v55 = v12;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "kt_hexString"));
          *(_DWORD *)buf = v45;
          v66 = v40;
          v67 = 2112;
          v68 = v42;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "IDS server data (deviceId: %@, clientData: %@) missing from syncedData", buf, 0x16u);

          v12 = v55;
        }
        objc_msgSend(v13, "setNotInSyncedData:", 1);
        objc_msgSend(v13, "setResult:", 0);
        objc_msgSend(v13, "setFailure:", v36);

        v46 = 0;
        v50 = (id)v36;
LABEL_39:

        v16 = v56;
        goto LABEL_40;
      }
      v54 = v12;
      v56 = v16;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v18 = v49;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v58;
        v17 = -101;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "deviceID"));
            v26 = objc_msgSend(v24, "isEqualToData:", v25);

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientData"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "clientData"));
            v29 = objc_msgSend(v27, "isEqualToData:", v28);

            v30 = v26 ^ 1;
            if (((v26 ^ 1) & 1) == 0 && (v29 & 1) != 0)
            {
              v9 = v48;
              v12 = v54;
              goto LABEL_39;
            }
            if ((v30 & v29) != 1 || v17 == -88)
            {
              if (((v30 | v29) & 1) != 0 || v17 == -87)
              {
                if (v26 | v29)
                  v17 = -89;
              }
              else
              {
                v17 = -88;
              }
            }
            else
            {
              v17 = -87;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          if (v20)
            continue;
          break;
        }
      }
      else
      {
        v17 = -101;
      }

      v9 = v48;
      v12 = v54;
      v16 = v56;
      if (!v56)
        goto LABEL_30;
LABEL_40:

      v12 = (char *)v12 + 1;
    }
    while (v12 != v53);
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  }
  while (v53);
  if (a6)
  {
    v10 = v50;
    if (v50)
    {
      v10 = objc_retainAutorelease(v50);
      *a6 = v10;
    }
  }
  else
  {
    v10 = v50;
  }
  v43 = v46;
LABEL_48:

  return v43 & 1;
}

- (unint64_t)verifyUriWitness:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v9, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore vrfKey](self->_applicationKeyStore, "vrfKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyVRFVerifier verifierOfType:key:](TransparencyVRFVerifier, "verifierOfType:key:", v10, v11));

  objc_msgSend(v9, "setVerifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  objc_msgSend(v9, "setMessage:", v13);

  v14 = objc_msgSend(v9, "verifyWithError:", a5);
  if (v14 != (id)1)
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -104, *a5, CFSTR("URI VRF witness failed for %@"), v8));
    if (qword_1002A78B0 != -1)
      dispatch_once(&qword_1002A78B0, &stru_100248C40);
    v15 = qword_1002A78B8;
    if (os_log_type_enabled((os_log_t)qword_1002A78B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "URI VRF witness failed for %@", buf, 0xCu);
    }
  }

  return (unint64_t)v14;
}

- (unint64_t)verifyAccountKeyWitness:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  id v17;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v9, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTApplicationPublicKeyStore vrfKey](self->_applicationKeyStore, "vrfKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyVRFVerifier verifierOfType:key:](TransparencyVRFVerifier, "verifierOfType:key:", v10, v11));

  objc_msgSend(v9, "setVerifier:", v12);
  objc_msgSend(v9, "setMessage:", v8);
  v13 = objc_msgSend(v9, "verifyWithError:", a5);

  if (v13 != (id)1)
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -77, *a5, CFSTR("AccountKey VRF witness failed for %@"), v8));
    if (qword_1002A78B0 != -1)
      dispatch_once(&qword_1002A78B0, &stru_100248C60);
    v14 = qword_1002A78B8;
    if (os_log_type_enabled((os_log_t)qword_1002A78B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "AccountKey VRF witness failed for %@", buf, 0xCu);
    }
  }

  return (unint64_t)v13;
}

+ (BOOL)verifyLoggableDataSignatures:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *i;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id *v29;
  BOOL v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  void *v38;
  _BYTE v39[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  v12 = v11 == 0;
  if (!v11)
  {
    v14 = 0;
    v25 = v10;
LABEL_20:

    goto LABEL_21;
  }
  v13 = v11;
  v29 = a5;
  v30 = v11 == 0;
  v31 = v9;
  v14 = 0;
  v15 = *(_QWORD *)v34;
  v16 = 1;
  do
  {
    v17 = v10;
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v34 != v15)
        objc_enumerationMutation(v17);
      v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
      v32 = 0;
      v20 = objc_msgSend(v19, "verifySignatureWithAccountKey:error:", v8, &v32, v29);
      v21 = v32;
      if ((v20 & 1) == 0)
      {
        objc_msgSend(v19, "setResult:", 0);
        objc_msgSend(v19, "setFailure:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "kt_hexString"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v21, v23);

        v24 = v21;
        v16 = 0;
        v14 = v24;
      }

    }
    v10 = v17;
    v13 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  }
  while (v13);

  if ((v16 & 1) == 0)
  {
    v9 = v31;
    if (v31)
    {
      v37 = CFSTR("loggableDataErrors");
      v38 = v31;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    }
    else
    {
      v25 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:userInfo:](TransparencyError, "errorWithDomain:code:userInfo:", v26, objc_msgSend(v14, "code"), v25));

    v12 = v30;
    if (v29 && v27)
      *v29 = objc_retainAutorelease(v27);

    goto LABEL_20;
  }
  v12 = 1;
  v9 = v31;
LABEL_21:

  return v12;
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTContext)context
{
  return (KTContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (KTLogClient)logClient
{
  return (KTLogClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_applicationKeyStore, 0);
}

- (unint64_t)checkQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pendingSmtsArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inclusionProof"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapEntry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smh"));
  v14 = -[KTContextVerifier checkResponseFreshness:smh:receiptDate:error:](self, "checkResponseFreshness:smh:receiptDate:error:", v10, v13, v8, a5);

  return v14;
}

- (void)checkQueryResponseEpochs:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "hasInclusionProof");
  v5 = v18;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "inclusionProof"));

    v5 = v18;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "inclusionProof"));
      if (objc_msgSend(v7, "hasPerApplicationTreeEntry"))
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "perApplicationTreeEntry"));
        if (v8)
        {
          v9 = (void *)v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "perApplicationTreeEntry"));
          if (!objc_msgSend(v10, "hasSlh"))
          {
LABEL_8:

            goto LABEL_9;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "perApplicationTreeEntry"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "slh"));

          if (v12)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "perApplicationTreeEntry"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slh"));
            -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v10);
            goto LABEL_8;
          }
        }
      }
LABEL_9:
      if (!objc_msgSend(v7, "hasTopLevelTreeEntry"))
        goto LABEL_15;
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelTreeEntry"));
      if (!v13)
        goto LABEL_15;
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelTreeEntry"));
      if (objc_msgSend(v15, "hasSlh"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelTreeEntry"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "slh"));

        if (!v17)
        {
LABEL_15:

          v5 = v18;
          goto LABEL_16;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelTreeEntry"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "slh"));
        -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v15);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

}

- (unint64_t)verifyInclusionProof:(id)a3 mapLeaf:(id *)a4 error:(id *)a5
{
  id v8;
  TransparencyMapInclusionProofVerifier *v9;
  void *v10;
  void *v11;
  TransparencyMapInclusionProofVerifier *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;

  v8 = a3;
  v9 = [TransparencyMapInclusionProofVerifier alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  v12 = -[TransparencyMapInclusionProofVerifier initWithKeyStore:application:](v9, "initWithKeyStore:application:", v10, v11);

  objc_msgSend(v8, "setVerifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  objc_msgSend(v8, "setDataStore:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "optInServer"));
  objc_msgSend(v8, "setOptInServer:", v15);

  v16 = (unint64_t)objc_msgSend(v8, "verifyWithError:", a5);
  if (v16 == 1)
  {
    if (a4)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapLeafWithError:", a5));
      *a4 = v17;
      v16 = v17 != 0;
    }
    else
    {
      v16 = 1;
    }
  }

  return v16;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 rawDataHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, void *, id, void *, _QWORD);
  unint64_t v19;
  void *v20;
  unsigned __int8 v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *, void *, id, void *, _QWORD))a8;
  v19 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", objc_msgSend(v14, "status"), a7);
  if (v19 == 1)
  {
    -[KTContextVerifier checkQueryResponseEpochs:](self, "checkQueryResponseEpochs:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
    v21 = objc_msgSend(v20, "ready:", a7);

    if ((v21 & 1) != 0)
    {
      v22 = -[KTContextVerifier checkQueryResponseFreshness:receiptDate:error:](self, "checkQueryResponseFreshness:receiptDate:error:", v14, v16, a7);
      if (v22 == 1)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uriWitness"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri"));
        v25 = -[KTContextVerifier verifyUriWitness:uri:error:](self, "verifyUriWitness:uri:error:", v23, v24, a7);

        if (v25 == 1)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
          v27 = kTransparencyResponseMetadataKeyServerHint;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));

          if (objc_msgSend(v14, "hasInclusionProof")
            && (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "inclusionProof")),
                v28,
                v28))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "inclusionProof"));
            objc_msgSend(v29, "setMetadataValue:key:", v49, v27);

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "inclusionProof"));
            v50 = 0;
            v25 = -[KTContextVerifier verifyInclusionProof:mapLeaf:error:](self, "verifyInclusionProof:mapLeaf:error:", v30, &v50, a7);
            v48 = v50;

            if (v25 != 1)
            {
              if (qword_1002A79C8 != -1)
                dispatch_once(&qword_1002A79C8, &stru_10024A4D0);
              v31 = qword_1002A79D0;
              if (os_log_type_enabled((os_log_t)qword_1002A79D0, OS_LOG_TYPE_ERROR))
              {
                if (a7)
                  v32 = *a7;
                else
                  v32 = 0;
                *(_DWORD *)buf = 138543618;
                v52 = v17;
                v53 = 2112;
                v54 = (uint64_t)v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ failed inclusion proof verification: %@", buf, 0x16u);
              }
              v45 = v48;
LABEL_42:

              goto LABEL_43;
            }
          }
          else
          {
            v48 = 0;
          }
          if (objc_msgSend(v14, "pendingSmtsArray_Count")
            && (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pendingSmtsArray")),
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri")),
                v25 = -[KTContextVerifier verifySMTs:uri:serverHint:error:](self, "verifySMTs:uri:serverHint:error:", v39, v40, v49, a7), v40, v39, v25 != 1))
          {
            if (qword_1002A79C8 != -1)
              dispatch_once(&qword_1002A79C8, &stru_10024A4F0);
            v46 = qword_1002A79D0;
            v45 = v48;
            if (os_log_type_enabled((os_log_t)qword_1002A79D0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v17;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Pending SMT verification failed for fetchId %{public}@", buf, 0xCu);
            }
          }
          else
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uriWitness"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "output"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pendingSmtsArray"));
            v45 = v48;
            v18[2](v18, v41, v43, v48, v44, 0);

            v25 = 1;
          }
          goto LABEL_42;
        }
        if (qword_1002A79C8 != -1)
          dispatch_once(&qword_1002A79C8, &stru_10024A4B0);
        v37 = (void *)qword_1002A79D0;
        if (os_log_type_enabled((os_log_t)qword_1002A79D0, OS_LOG_TYPE_ERROR))
        {
          v34 = v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri"));
          *(_DWORD *)buf = 138543874;
          v52 = v17;
          v53 = 2160;
          v54 = 1752392040;
          v55 = 2112;
          v56 = v38;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ failed uri witness verification: %{mask.hash}@", buf, 0x20u);

          goto LABEL_17;
        }
      }
      else
      {
        v25 = v22;
        if (qword_1002A79C8 != -1)
          dispatch_once(&qword_1002A79C8, &stru_10024A490);
        v36 = qword_1002A79D0;
        if (os_log_type_enabled((os_log_t)qword_1002A79D0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v52 = v17;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ exceeded MMD", buf, 0xCu);
        }
      }
    }
    else
    {
      if (qword_1002A79C8 != -1)
        dispatch_once(&qword_1002A79C8, &stru_10024A470);
      v35 = qword_1002A79D0;
      if (os_log_type_enabled((os_log_t)qword_1002A79D0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v17;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ waiting for keystore refresh", buf, 0xCu);
      }
      v25 = 2;
    }
  }
  else
  {
    v25 = v19;
    if (qword_1002A79C8 != -1)
      dispatch_once(&qword_1002A79C8, &stru_10024A450);
    v33 = (void *)qword_1002A79D0;
    if (os_log_type_enabled((os_log_t)qword_1002A79D0, OS_LOG_TYPE_ERROR))
    {
      v34 = v33;
      *(_DWORD *)buf = 138543618;
      v52 = v17;
      v53 = 1024;
      LODWORD(v54) = objc_msgSend(v14, "status");
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ server error: %d", buf, 0x12u);
LABEL_17:

    }
  }
LABEL_43:

  return v25;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100177574;
  v20[3] = &unk_10024A558;
  v20[4] = self;
  v21 = a6;
  v22 = v14;
  v23 = a8;
  v15 = v14;
  v16 = v23;
  v17 = v21;
  v18 = -[KTContextVerifier handleQueryResponse:queryRequest:receiptDate:fetchId:error:rawDataHandler:](self, "handleQueryResponse:queryRequest:receiptDate:fetchId:error:rawDataHandler:", a3, a4, v15, v17, a7, v20);

  return v18;
}

- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id, id, _QWORD);
  unint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  const char *v41;
  KTTransparentData *v43;
  KTTransparentData *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, id, id, _QWORD))a7;
  v16 = -[KTContextVerifier checkServerStatus:isInsert:error:](self, "checkServerStatus:isInsert:error:", objc_msgSend(v12, "status"), 1, a6);
  if (v16 == 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
    v18 = objc_msgSend(v17, "ready:", a6);

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uriWitness"));
      v20 = -[KTContextVerifier verifyUriWitness:uri:error:](self, "verifyUriWitness:uri:error:", v19, v13, a6);

      if (v20 == 1)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smt"));
        v46 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverEventInfo"));
        v20 = -[KTContextVerifier verifySMTs:uri:serverHint:error:](self, "verifySMTs:uri:serverHint:error:", v22, v13, v23, a6);

        if (v20 == 1)
        {
          v43 = [KTTransparentData alloc];
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uriWitness"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "output"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smt"));
          v45 = v26;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
          v44 = -[KTTransparentData initWithUriVRFOutput:mapLeaf:pendingSMTs:error:](v43, "initWithUriVRFOutput:mapLeaf:pendingSMTs:error:", v25, 0, v27, a6);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v28, "patLogBeginningMs") / 1000.0));
          -[KTTransparentData setCurrentTreeEpochBeginDate:](v44, "setCurrentTreeEpochBeginDate:", v29);

          if (v44)
          {
            if (-[KTTransparentData verifyServerInvariantsAt:error:](v44, "verifyServerInvariantsAt:error:", 0, a6))
            {
              v15[2](v15, v13, v44, 0);
              v20 = 1;
LABEL_42:

              goto LABEL_43;
            }
            if (qword_1002A79D8 != -1)
              dispatch_once(&qword_1002A79D8, &stru_10024A618);
            v38 = qword_1002A79E0;
            if (!os_log_type_enabled((os_log_t)qword_1002A79E0, OS_LOG_TYPE_ERROR))
            {
LABEL_41:
              v20 = 0;
              goto LABEL_42;
            }
            if (a6)
              v40 = *a6;
            else
              v40 = 0;
            *(_DWORD *)buf = 138543618;
            v48 = v14;
            v49 = 2112;
            v50 = (uint64_t)v40;
            v41 = "InsertResponse for fetchId %{public}@ failed server invariant verification: %@";
          }
          else
          {
            if (qword_1002A79D8 != -1)
              dispatch_once(&qword_1002A79D8, &stru_10024A5F8);
            v38 = qword_1002A79E0;
            if (!os_log_type_enabled((os_log_t)qword_1002A79E0, OS_LOG_TYPE_ERROR))
              goto LABEL_41;
            if (a6)
              v39 = *a6;
            else
              v39 = 0;
            *(_DWORD *)buf = 138543618;
            v48 = v14;
            v49 = 2112;
            v50 = (uint64_t)v39;
            v41 = "InsertResponse for fetchId %{public}@ failed to build transparentData: %@";
          }
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);
          goto LABEL_41;
        }
        if (qword_1002A79D8 != -1)
          dispatch_once(&qword_1002A79D8, &stru_10024A5D8);
        v37 = qword_1002A79E0;
        if (os_log_type_enabled((os_log_t)qword_1002A79E0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v48 = v14;
          v34 = "Pending SMT verification failed for fetchId %{public}@";
          v35 = v37;
          v36 = 12;
          goto LABEL_25;
        }
      }
      else
      {
        if (qword_1002A79D8 != -1)
          dispatch_once(&qword_1002A79D8, &stru_10024A5B8);
        v33 = qword_1002A79E0;
        if (os_log_type_enabled((os_log_t)qword_1002A79E0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v48 = v14;
          v49 = 2160;
          v50 = 1752392040;
          v51 = 2112;
          v52 = v13;
          v34 = "InsertResponse for fetchId %{public}@ failed uri witness verification: %{mask.hash}@";
          v35 = v33;
          v36 = 32;
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
        }
      }
    }
    else
    {
      if (qword_1002A79D8 != -1)
        dispatch_once(&qword_1002A79D8, &stru_10024A598);
      v32 = qword_1002A79E0;
      if (os_log_type_enabled((os_log_t)qword_1002A79E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v14;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "InsertResponse for fetchId %{public}@ waiting for keystore refresh", buf, 0xCu);
      }
      v20 = 2;
    }
  }
  else
  {
    v20 = v16;
    if (qword_1002A79D8 != -1)
      dispatch_once(&qword_1002A79D8, &stru_10024A578);
    v30 = (void *)qword_1002A79E0;
    if (os_log_type_enabled((os_log_t)qword_1002A79E0, OS_LOG_TYPE_ERROR))
    {
      v31 = v30;
      *(_DWORD *)buf = 138543618;
      v48 = v14;
      v49 = 1024;
      LODWORD(v50) = objc_msgSend(v12, "status");
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "InsertResponse for fetchId %{public}@ server error: %d", buf, 0x12u);

    }
  }
LABEL_43:

  return v20;
}

- (id)createErrorFromSTHFailure:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorDomain"));
  v8 = objc_msgSend(v6, "errorCode");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v7, v8, v5, 0));
  return v9;
}

- (id)createChainOfErrorsFromSTHFailures:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "verificationType") == (id)a4)
        {
          v14 = objc_claimAutoreleasedReturnValue(-[KTContextVerifier createErrorFromSTHFailure:underlyingError:](self, "createErrorFromSTHFailure:underlyingError:", v13, v10));

          v10 = (void *)v14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)failExpiredSTHsForType:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100185954;
  v25 = sub_100185964;
  v26 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumSTHProofDelay));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10018596C;
  v16[3] = &unk_10024B0D8;
  v19 = a3;
  v20 = a4;
  v16[4] = self;
  v18 = &v21;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v9, "performForPendingSTHs:olderThan:type:error:block:", v10, v8, a3, a4, v16);

  if (a4)
  {
    v12 = (void *)v22[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  if (objc_msgSend(v11, "count"))
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (unint64_t)verifyLogConsistencyResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 forwards:(BOOL)a6 serverHint:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  TransparencyConsistencyProofVerifier *v17;
  void *v18;
  void *v19;
  TransparencyConsistencyProofVerifier *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v10 = a6;
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = [TransparencyConsistencyProofVerifier alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appSthKeyStore"));
  v20 = -[TransparencyConsistencyProofVerifier initWithTrustedKeyStore:](v17, "initWithTrustedKeyStore:", v19);

  objc_msgSend(v14, "setVerifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  objc_msgSend(v14, "setDataStore:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  objc_msgSend(v14, "setStartRevision:", v22);

  objc_msgSend(v14, "setMetadataValue:key:", v16, kTransparencyResponseMetadataKeyServerHint);
  objc_msgSend(v14, "setForwards:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "optInServer"));
  objc_msgSend(v14, "setOptInServer:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "followUp"));
  objc_msgSend(v14, "setFollowUp:", v26);

  if (objc_msgSend(v14, "hasStartSlh"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startSlh"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startSlh"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v28));

      if (v15)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "parsedLogHead"));
        v31 = v30;
        if (v30)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v30, "revision")));
          objc_msgSend(v15, "addObject:", v32);

        }
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startSlh"));
      -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v33);

    }
  }
  if (objc_msgSend(v14, "hasEndSlh"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endSlh"));

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endSlh"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v35));

      if (v15)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "parsedLogHead"));
        v38 = v37;
        if (v37)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v37, "revision")));
          objc_msgSend(v15, "addObject:", v39);

        }
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endSlh"));
      -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v40);

    }
  }
  v41 = objc_msgSend(v14, "verifyWithError:", a8);

  return (unint64_t)v41;
}

- (unint64_t)verifyConsistencyProofResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  void *v22;
  unsigned __int8 v23;
  unint64_t v24;
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
  int v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  int64_t v51;
  unint64_t v52;
  id v53;
  __int16 v54;
  uint8_t buf[2];

  v10 = a3;
  v53 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));

  LODWORD(v11) = objc_msgSend(v10, "application");
  v13 = objc_msgSend(v10, "logType");
  if ((_DWORD)v11)
  {
    if (v13 != 2
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "application"))), v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v15)), v17 = objc_msgSend(v14, "isEqualToString:", v16), v16, v15, v14, (v17 & 1) == 0))
    {
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -187, CFSTR("LogConsistencyResponse for wrong application or tree")));
      if (qword_1002A7A58 != -1)
        dispatch_once(&qword_1002A7A58, &stru_10024B118);
      v18 = v53;
      v19 = qword_1002A7A60;
      if (!os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      v54 = 0;
      v20 = "LogConsistencyResponse for wrong application or tree";
      v21 = (uint8_t *)&v54;
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
LABEL_39:
      v39 = 0;
      goto LABEL_40;
    }
  }
  else if (v13 != 3
         || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID")),
             v23 = objc_msgSend(v22, "isEqualToString:", kKTApplicationIdentifierTLT),
             v22,
             (v23 & 1) == 0))
  {
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -186, CFSTR("LogConsistencyResponse omits application, but log type or verifier is not TLT")));
    if (qword_1002A7A58 != -1)
      dispatch_once(&qword_1002A7A58, &stru_10024B0F8);
    v18 = v53;
    v19 = qword_1002A7A60;
    if (!os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v20 = "LogConsistencyResponse omits application, but log type or verifier is not TLT";
    v21 = buf;
    goto LABEL_38;
  }
  if (!objc_msgSend(v10, "responsesArray_Count"))
  {
    v39 = 1;
    goto LABEL_42;
  }
  v24 = 0;
  v52 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = v53;
  do
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responsesArray"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v24));

    if (objc_msgSend(v26, "hasStartSlh"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startSlh"));
      if (v27 && (objc_msgSend(v26, "hasEndSlh") & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endSlh"));

        if (v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startSlh"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v29));

          v50 = v30;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "parsedLogHead"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endSlh"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v32));

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "parsedLogHead"));
          v49 = v31;
          if (objc_msgSend(v31, "revision") == (id)a4)
          {
            v35 = 1;
            v52 = v24;
          }
          else if (v52 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v37 = objc_msgSend(v34, "revision");
            v35 = 0;
            v38 = 0x7FFFFFFFFFFFFFFFLL;
            if (v37 == (id)a4)
              v38 = v24 + 1;
            v52 = v38;
          }
          else
          {
            v35 = 1;
          }

          v18 = v53;
          if (!v35)
            goto LABEL_22;
        }
        else
        {
          v18 = v53;
        }
      }
      else
      {

      }
    }
    v36 = -[KTContextVerifier verifyLogConsistencyResponse:startRevision:receivedRevisions:forwards:serverHint:error:](self, "verifyLogConsistencyResponse:startRevision:receivedRevisions:forwards:serverHint:error:", v26, a4, v18, 1, v12, a6);
    if (v36 != 1)
    {
      v39 = v36;

      goto LABEL_40;
    }
LABEL_22:

    ++v24;
  }
  while (v24 < (unint64_t)objc_msgSend(v10, "responsesArray_Count"));
  v39 = 1;
  if (v52)
  {
    v51 = a4;
    if (v52 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = v52 - 1;
      v39 = 1;
      v42 = 1;
      while (1)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responsesArray"));
        v44 = v12;
        v45 = v18;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", v41));

        v47 = v45;
        v12 = v44;
        v48 = -[KTContextVerifier verifyLogConsistencyResponse:startRevision:receivedRevisions:forwards:serverHint:error:](self, "verifyLogConsistencyResponse:startRevision:receivedRevisions:forwards:serverHint:error:", v46, v51, v47, 0, v44, a6);

        if (v48 != 1)
          break;
        ++v42;
        --v41;
        v18 = v53;
        if (v42 > v52)
          goto LABEL_40;
      }
      v39 = v48;
LABEL_42:
      v18 = v53;
    }
  }
LABEL_40:

  return v39;
}

- (id)verifySTHs:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  id *v20;
  id *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  double Current;
  double v29;
  double v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id *v45;
  id obj;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  id v59;
  _BYTE v60[128];

  v6 = a3;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v8)
  {

    v10 = 0;
    goto LABEL_38;
  }
  v9 = v8;
  v45 = a4;
  v10 = 0;
  v48 = *(_QWORD *)v55;
  obj = v7;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v55 != v48)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v11);
      v13 = objc_autoreleasePoolPush();
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sth"));
      if (v14
        && (v15 = (void *)v14, v16 = objc_msgSend(v12, "isMapHead"), v15, (v16 & 1) == 0))
      {
        v49 = v13;
        v18 = SignedLogHead;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sth"));
        v53 = v10;
        v20 = &v53;
        v21 = &v53;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sth"));

        if (!v17)
          goto LABEL_18;
        v49 = v13;
        v18 = SignedMapHead;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sth"));
        v52 = v10;
        v20 = &v52;
        v21 = &v52;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class parseFromData:error:](v18, "parseFromData:error:", v19, v21));
      v23 = *v20;

      if (!v22)
      {
        v10 = v23;
        v13 = v49;
LABEL_18:
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sth"));
        objc_msgSend(v47, "addObject:", v36);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        objc_msgSend(v22, "deleteObject:", v12);
        goto LABEL_32;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "appSthKeyStore"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "signatureVerifier"));
      objc_msgSend(v22, "setVerifier:", v26);

      v51 = v23;
      v27 = objc_msgSend(v22, "verifyWithError:", &v51);
      v10 = v51;

      objc_msgSend(v12, "setUnsigned:value:", "signatureVerified", v27);
      if (objc_msgSend(v12, "signatureVerified") == (id)1)
      {
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v12, "receiptTime");
        v30 = Current - v29;
        if (objc_msgSend(v12, "isMapHead"))
          v31 = CFSTR("VerifySMHTime");
        else
          v31 = CFSTR("VerifySTHTime");
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", v31, v32));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
        objc_msgSend(v34, "logMetric:withName:", v35, v33);

      }
      else
      {
        if (objc_msgSend(v12, "signatureVerified"))
          goto LABEL_22;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sth"));
        objc_msgSend(v47, "addObject:", v33);
      }

LABEL_22:
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      v50 = 0;
      v38 = objc_msgSend(v37, "persistAndRefaultObject:error:", v12, &v50);
      v39 = v50;

      if ((v38 & 1) != 0)
        goto LABEL_30;
      if (qword_1002A7A58 != -1)
        dispatch_once(&qword_1002A7A58, &stru_10024B138);
      v40 = qword_1002A7A60;
      if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v39;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "failed to save signature verified STHs: %@", buf, 0xCu);
      }
      if (!v39)
      {
LABEL_30:
        v13 = v49;
      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
        objc_msgSend(v41, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("verifySTHs"), v39);

        v13 = v49;
        if (!v10)
          v10 = v39;
      }

LABEL_32:
      objc_autoreleasePoolPop(v13);
      v11 = (char *)v11 + 1;
    }
    while (v9 != v11);
    v7 = obj;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  }
  while (v9);

  if (v45 && v10)
  {
    v10 = objc_retainAutorelease(v10);
    *v45 = v10;
  }
LABEL_38:
  if (objc_msgSend(v47, "count"))
    v42 = v47;
  else
    v42 = 0;
  v43 = v42;

  return v43;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 perApplicationTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double Current;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  _QWORD v36[4];
  id v37;
  KTContextVerifier *v38;
  id v39;
  id v40;
  __int128 *p_buf;
  uint8_t *v42;
  uint64_t *v43;
  unint64_t v44;
  id *v45;
  uint8_t v46[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  void *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v10 = a4;
  v11 = a5;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nodeBytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PerApplicationTreeNode, "parseFromData:error:", v12, a6));

  if (!v13)
  {
    if (qword_1002A7A58 != -1)
      dispatch_once(&qword_1002A7A58, &stru_10024B158);
    v14 = qword_1002A7A60;
    if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
    {
      if (a6)
        v15 = *a6;
      else
        v15 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to parse PAT node from revision log inclusion proof: %@", (uint8_t *)&buf, 0xCu);
    }
    *((_BYTE *)v51 + 24) = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v57 = 0x3032000000;
  v58 = sub_100185954;
  v59 = sub_100185964;
  v60 = 0;
  if ((objc_msgSend(v13, "hasObjectMapHead") & 1) == 0)
  {
    if (qword_1002A7A58 != -1)
      dispatch_once(&qword_1002A7A58, &stru_10024B178);
    v16 = qword_1002A7A60;
    if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Per application tree node is missing map head", v46, 2u);
    }
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -203, CFSTR("Per application tree node is missing map head")));
    *((_BYTE *)v51 + 24) = 0;
  }
  *(_QWORD *)v46 = 0;
  v47 = v46;
  v48 = 0x2020000000;
  v49 = 0;
  if (objc_msgSend(v13, "hasObjectMapHead"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1001873F4;
    v36[3] = &unk_10024B200;
    v37 = v13;
    v38 = self;
    v39 = v10;
    p_buf = &buf;
    v44 = a3;
    v40 = v11;
    v42 = v46;
    v45 = a6;
    v43 = &v50;
    objc_msgSend(v17, "performBlockAndWait:", v36);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyPATInclusionProofEvent"), v18));

  if (!+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics")|| (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata")), v21 = kTransparencyResponseMetadataKeyServerHint, v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint)), v23 = v22 == 0, v22, v20, v23))
  {
    v26 = 0;
  }
  else
  {
    v54 = v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v21));
    v55 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v27, "logResultForEvent:hardFailure:result:withAttributes:", v19, a3 == 0, v11, v26);

  if (a3 == 1 && *((double *)v47 + 3) != 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v29 = *((double *)v47 + 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v29));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationID](self, "applicationID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("PatInclusionProofTime"), v32));
    objc_msgSend(v30, "logMetric:withName:", v31, v33);

  }
  v34 = *((_BYTE *)v51 + 24) != 0;

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v50, 8);
  return v34;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 topLevelTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double Current;
  double v27;
  void *v28;
  void *v29;
  BOOL v30;
  _QWORD v32[4];
  id v33;
  KTContextVerifier *v34;
  __int128 *p_buf;
  uint8_t *v36;
  uint64_t *v37;
  unint64_t v38;
  id *v39;
  uint8_t v40[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  void *v49;
  __int128 buf;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v10 = a4;
  v11 = a5;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nodeBytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](TopLevelTreeNode, "parseFromData:error:", v12, a6));

  if (!v13)
  {
    if (qword_1002A7A58 != -1)
      dispatch_once(&qword_1002A7A58, &stru_10024B220);
    v14 = qword_1002A7A60;
    if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
    {
      if (a6)
        v15 = *a6;
      else
        v15 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to parse TLT node from revision log inclusion proof: %@", (uint8_t *)&buf, 0xCu);
    }
    *((_BYTE *)v45 + 24) = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v51 = 0x3032000000;
  v52 = sub_100185954;
  v53 = sub_100185964;
  v54 = 0;
  if ((objc_msgSend(v13, "hasPatHead") & 1) == 0)
  {
    if (qword_1002A7A58 != -1)
      dispatch_once(&qword_1002A7A58, &stru_10024B240);
    v16 = qword_1002A7A60;
    if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Top level tree node is missing PAT head", v40, 2u);
    }
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -204, CFSTR("Top level tree node is missing PAT head")));
    *((_BYTE *)v45 + 24) = 0;
  }
  *(_QWORD *)v40 = 0;
  v41 = v40;
  v42 = 0x2020000000;
  v43 = 0;
  if (objc_msgSend(v13, "hasPatHead"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100187EB0;
    v32[3] = &unk_10024B2E8;
    v33 = v13;
    v34 = self;
    v38 = a3;
    v39 = a6;
    p_buf = &buf;
    v36 = v40;
    v37 = &v44;
    objc_msgSend(v17, "performBlockAndWait:", v32);

  }
  if (!+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics")|| (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata")), v19 = kTransparencyResponseMetadataKeyServerHint, v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint)), v21 = v20 == 0, v20, v18, v21))
  {
    v24 = 0;
  }
  else
  {
    v48 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v19));
    v49 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v25, "logResultForEvent:hardFailure:result:withAttributes:", CFSTR("ktTLTVerifyInclusionProofEvent"), a3 == 0, v11, v24);

  if (a3 == 1 && *((double *)v41 + 3) != 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v27 = *((double *)v41 + 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v27));
    objc_msgSend(v28, "logMetric:withName:", v29, CFSTR("ktTLTInclusionProofTime"));

  }
  v30 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v44, 8);
  return v30;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 logEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  unsigned __int8 v12;
  BOOL v13;

  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "logType") == 2)
  {
    v12 = -[KTContextVerifier setInclusionVerifiedState:perApplicationTreeLogEntry:failure:error:](self, "setInclusionVerifiedState:perApplicationTreeLogEntry:failure:error:", a3, v10, v11, a6);
  }
  else
  {
    if (objc_msgSend(v10, "logType") != 3)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v12 = -[KTContextVerifier setInclusionVerifiedState:topLevelTreeLogEntry:failure:error:](self, "setInclusionVerifiedState:topLevelTreeLogEntry:failure:error:", a3, v10, v11, a6);
  }
  v13 = v12;
LABEL_7:

  return v13;
}

- (unint64_t)verifyRevisionLogProofLogEntry:(id)a3 patSTH:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  TransparencyLogEntryVerifier *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  TransparencyLogEntryVerifier *v16;
  id v17;
  id v18;
  unsigned int v19;
  void *v20;
  NSObject *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  objc_msgSend(v8, "setDataStore:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "optInServer"));
  objc_msgSend(v8, "setOptInServer:", v11);

  if (objc_msgSend(v8, "logType") == 2)
  {
    v12 = [TransparencyLogEntryVerifier alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appSthKeyStore"));
LABEL_5:
    v15 = (void *)v14;
    v16 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v12, "initWithTrustedKeyStore:", v14);
    objc_msgSend(v8, "setVerifier:", v16);

    v29 = 0;
    v17 = objc_msgSend(v8, "verifyWithError:", &v29);
    v18 = v29;
    if (v17 == (id)1)
    {
      v19 = objc_msgSend(v8, "logType");
      if (a4 && v19 == 2)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "slh"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v20));

      }
    }
    else
    {
      if (qword_1002A7A58 != -1)
        dispatch_once(&qword_1002A7A58, &stru_10024B328);
      v21 = qword_1002A7A60;
      if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to verify revision proof log entry: %@", buf, 0xCu);
      }
      if (a5 && v18)
        *a5 = objc_retainAutorelease(v18);
    }
    v28 = 0;
    v22 = -[KTContextVerifier setInclusionVerifiedState:logEntry:failure:error:](self, "setInclusionVerifiedState:logEntry:failure:error:", v17, v8, v18, &v28);
    v23 = v28;
    if ((v22 & 1) == 0)
    {
      if (qword_1002A7A58 != -1)
        dispatch_once(&qword_1002A7A58, &stru_10024B348);
      v24 = qword_1002A7A60;
      if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to set inclusion verification state for log entry: %@", buf, 0xCu);
      }
    }

    goto LABEL_22;
  }
  if (objc_msgSend(v8, "logType") == 3)
  {
    v12 = [TransparencyLogEntryVerifier alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tltKeyStore"));
    goto LABEL_5;
  }
  if (qword_1002A7A58 != -1)
    dispatch_once(&qword_1002A7A58, &stru_10024B308);
  v26 = (void *)qword_1002A7A60;
  if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = objc_msgSend(v8, "logType");
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unknown log type in log entry: %d", buf, 8u);

  }
  v17 = 0;
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -205, CFSTR("Unknown log type in log entry: %d"), objc_msgSend(v8, "logType")));
LABEL_22:

  return (unint64_t)v17;
}

- (unint64_t)verifyRevisionLogTopLevelProof:(id)a3 patSTH:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  TransparencyLogEntryVerifier *v13;
  void *v14;
  void *v15;
  TransparencyLogEntryVerifier *v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
  objc_msgSend(v8, "setDataStore:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "optInServer"));
  objc_msgSend(v8, "setOptInServer:", v12);

  v13 = [TransparencyLogEntryVerifier alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tltKeyStore"));
  v16 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v13, "initWithTrustedKeyStore:", v15);
  objc_msgSend(v8, "setVerifier:", v16);

  if (v9)
  {
    v26 = 0;
    v17 = objc_msgSend(v8, "verifyTLTEntryForPerApplicationLogHead:error:", v9, &v26);
    v18 = v26;
  }
  else
  {
    v25 = 0;
    v17 = objc_msgSend(v8, "verifyWithError:", &v25);
    v18 = v25;
    v24 = 0;
    v19 = -[KTContextVerifier setInclusionVerifiedState:logEntry:failure:error:](self, "setInclusionVerifiedState:logEntry:failure:error:", v17, v8, v18, &v24);
    v20 = v24;
    if ((v19 & 1) == 0)
    {
      if (qword_1002A7A58 != -1)
        dispatch_once(&qword_1002A7A58, &stru_10024B368);
      v21 = qword_1002A7A60;
      if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to set inclusion verified state: %@", buf, 0xCu);
      }
    }

  }
  if (v17 != (id)1)
  {
    if (qword_1002A7A58 != -1)
      dispatch_once(&qword_1002A7A58, &stru_10024B388);
    v22 = qword_1002A7A60;
    if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to verify revision proof tlt entry: %@", buf, 0xCu);
    }
    if (a5 && v18)
      *a5 = objc_retainAutorelease(v18);
  }

  return (unint64_t)v17;
}

- (BOOL)verifyRevisionLogInclusionProofResponse:(id)a3 receivedRevisions:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  id obj;
  uint64_t v46;
  _QWORD v49[4];
  id v50;
  KTContextVerifier *v51;
  id *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];

  v6 = a3;
  v7 = a4;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logEntryArray"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  v43 = v6;
  v44 = v7;
  if (!v8)
  {
    v10 = 0;
    goto LABEL_24;
  }
  v9 = v8;
  v10 = 0;
  v46 = *(_QWORD *)v55;
  v11 = kTransparencyResponseMetadataKeyServerHint;
  while (2)
  {
    v12 = 0;
    v13 = v10;
    do
    {
      if (*(_QWORD *)v55 != v46)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v12);
      if (objc_msgSend(v14, "hasSlh", v43))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "slh"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "slh"));
          -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v16);

        }
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v11));
      objc_msgSend(v14, "setMetadataValue:key:", v18, v11);

      if (v7)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nodeBytes"));
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          if (objc_msgSend(v14, "logType") == 3)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nodeBytes"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](TopLevelTreeNode, "parseFromData:error:", v21, 0));

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "patHead"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "object"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](LogHead, "parseFromData:error:", v24, 0));

            v7 = v44;
          }
          else
          {
            if (objc_msgSend(v14, "logType") != 2)
              goto LABEL_18;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nodeBytes"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PerApplicationTreeNode, "parseFromData:error:", v26, 0));

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectMapHead"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "object"));
            v7 = v44;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](MapHead, "parseFromData:error:", v27, 0));

          }
          if (v25)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "revision")));
            objc_msgSend(v7, "addObject:", v28);

          }
          v6 = v43;
        }
      }
LABEL_18:
      v53 = v13;
      v29 = -[KTContextVerifier verifyRevisionLogProofLogEntry:patSTH:error:](self, "verifyRevisionLogProofLogEntry:patSTH:error:", v14, &v53, a5);
      v10 = v53;

      if (!v29)
      {
        v30 = 0;
        goto LABEL_33;
      }
      v12 = (char *)v12 + 1;
      v13 = v10;
    }
    while (v9 != v12);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v9)
      continue;
    break;
  }
LABEL_24:

  if (objc_msgSend(v6, "hasTopLevelTreeEntry")
    && (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelTreeEntry")), v31, v31))
  {
    v32 = v6;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelTreeEntry"));
    if (!objc_msgSend(v33, "hasSlh"))
      goto LABEL_29;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topLevelTreeEntry"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "slh"));

    if (v35)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topLevelTreeEntry"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "slh"));
      -[KTContextVerifier checkHeadEpoch:](self, "checkHeadEpoch:", v36);

LABEL_29:
      v32 = v43;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topLevelTreeEntry", v43));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "metadata"));
    v39 = kTransparencyResponseMetadataKeyServerHint;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
    objc_msgSend(v37, "setMetadataValue:key:", v40, v39);

    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topLevelTreeEntry"));
    v30 = -[KTContextVerifier verifyRevisionLogTopLevelProof:patSTH:error:](self, "verifyRevisionLogTopLevelProof:patSTH:error:") != 0;
    v6 = v32;
LABEL_33:

  }
  else
  {
    if (v10)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100189290;
      v49[3] = &unk_10023D2F0;
      v50 = v10;
      v51 = self;
      v52 = a5;
      v10 = v10;
      objc_msgSend(v41, "performBlockAndWait:", v49);

      v30 = 1;
      obj = v50;
      goto LABEL_33;
    }
    v30 = 1;
  }

  return v30;
}

- (void)checkHeadEpoch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parsedLogHead"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "logType");
    v8 = objc_msgSend(v6, "logBeginningMs");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
    v10 = v9;
    if (v7 == 3)
    {
      v11 = objc_msgSend(v9, "tltLogBeginningMs");

      if (v8 > v11)
      {
        if (qword_1002A7A58 != -1)
          dispatch_once(&qword_1002A7A58, &stru_10024B3C8);
        v12 = qword_1002A7A60;
        if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TLT head has logBeginningMs after key store epoch", buf, 2u);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vrfKey"));
        objc_msgSend(v14, "setNeedsRefresh:", 1);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appSmtKeyStore"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "signatureVerifier"));
        objc_msgSend(v17, "setNeedsRefresh:", 1);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appSthKeyStore"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "signatureVerifier"));
        objc_msgSend(v20, "setNeedsRefresh:", 1);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tltKeyStore"));
LABEL_15:
        v30 = v22;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "signatureVerifier"));
        objc_msgSend(v31, "setNeedsRefresh:", 1);

      }
    }
    else
    {
      v23 = objc_msgSend(v9, "patLogBeginningMs");

      if (v8 > v23)
      {
        if (qword_1002A7A58 != -1)
          dispatch_once(&qword_1002A7A58, &stru_10024B3E8);
        v24 = qword_1002A7A60;
        if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Application head has logBeginningMs after key store epoch", v32, 2u);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "vrfKey"));
        objc_msgSend(v26, "setNeedsRefresh:", 1);

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "appSmtKeyStore"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "signatureVerifier"));
        objc_msgSend(v29, "setNeedsRefresh:", 1);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "appSthKeyStore"));
        goto LABEL_15;
      }
    }
  }

}

- (void)processSTHsFromGossipPeers:(id)a3 verifier:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void **p_vtable;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void **v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  id *v34;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];

  obj = a3;
  v37 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v38)
  {
    v34 = a5;
    v7 = 0;
    v8 = *(_QWORD *)v42;
    p_vtable = KtsmdataStoreMessagesRoot.vtable;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v10);
        v40 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 242, "parseFromData:error:", v11, &v40));
        v13 = v40;
        v14 = v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 0;
        if (v15)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier applicationKeyStore](self, "applicationKeyStore"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "appSthKeyStore"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "signatureVerifier"));
          objc_msgSend(v12, "setVerifier:", v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier dataStore](self, "dataStore"));
          objc_msgSend(v12, "setDataStore:", v24);

          objc_msgSend(v12, "setGossip:", 1);
          objc_msgSend(v12, "setGossip:", 1);
          if (v37)
            objc_msgSend(v12, "setVerifier:", v37);
          v39 = 0;
          objc_msgSend(v12, "verifyWithError:", &v39);
          v25 = v39;
          if (v25)
          {
            if (qword_1002A7A58 != -1)
              dispatch_once(&qword_1002A7A58, &stru_10024B428);
            v26 = qword_1002A7A60;
            if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to verify gossiped sth: %@", buf, 0xCu);
            }
            if (v7)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "domain"));
              v28 = p_vtable;
              v29 = v8;
              v30 = objc_msgSend(v25, "code");
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "description"));
              v32 = v30;
              v8 = v29;
              p_vtable = v28;
              v33 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v27, v32, v7, CFSTR("%@"), v31));

              v7 = (id)v33;
            }
            else
            {
              v7 = v25;
            }
          }

        }
        else
        {
          if (qword_1002A7A58 != -1)
            dispatch_once(&qword_1002A7A58, &stru_10024B408);
          v16 = qword_1002A7A60;
          if (os_log_type_enabled((os_log_t)qword_1002A7A60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to parse gossiped slh: %@", buf, 0xCu);
          }
          if (v7)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
            v18 = objc_msgSend(v14, "code");
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
            v20 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v17, v18, v7, CFSTR("%@"), v19));

            v7 = (id)v20;
          }
          else
          {
            v7 = v14;
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v38 != v10);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v38);
    if (v34 && v7)
    {
      v7 = objc_retainAutorelease(v7);
      *v34 = v7;
    }
  }
  else
  {
    v7 = 0;
  }

}

@end
