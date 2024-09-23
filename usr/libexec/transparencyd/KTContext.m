@implementation KTContext

- (BOOL)validatePendingSMTs:(id)a3 singleQuery:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  id v57;
  id v58[2];

  v6 = a3;
  v7 = a4;
  v58[0] = 0;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getQueryRequest:", v58));
  v8 = v58[0];
  v57 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getQueryResponse:", &v57));
  v10 = v57;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
  v12 = kTransparencyResponseMetadataKeyServerHint;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("APS")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = v16;
  v43 = (void *)v15;
  v44 = (void *)v13;
  if (v13 | v15)
  {
    if (v13)
      objc_msgSend(v16, "setObject:forKey:", v13, v12);
    if (v15)
      objc_msgSend(v17, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("APS"));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundOpId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("opUUID"));

  if (v46 && v9)
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responseTime"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rpcId"));
    v52 = v10;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100005FAC;
    v47[3] = &unk_10023A158;
    v47[4] = self;
    v41 = v6;
    v48 = v41;
    v23 = v9;
    v49 = v23;
    v24 = v17;
    v50 = v24;
    v51 = &v53;
    v40 = objc_msgSend(v20, "handleQueryResponse:queryRequest:receiptDate:fetchId:error:rawDataHandler:", v23, v46, v21, v22, &v52, v47);
    v42 = v6;
    v25 = v52;

    v26 = v44;
    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "domain"));
      if (objc_msgSend(v27, "isEqual:", kTransparencyErrorServer))
        v28 = objc_msgSend(v25, "code") == (id)7;
      else
        v28 = 0;

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "data"));
      v36 = objc_msgSend(v34, "failSMTsIfOverMMD:skipOptInOut:proof:underlyingError:errorCode:analyticsData:", v41, v28, v35, v25, -306, v24);

      if ((v36 & 1) == 0)
        *((_BYTE *)v54 + 24) = 1;
      if (!v40)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rpcId"));
        objc_msgSend(v37, "failRpcId:failure:error:", v38, v25, 0);

      }
    }
    LOBYTE(v32) = *((_BYTE *)v54 + 24) != 0;

    _Block_object_dispose(&v53, 8);
    v33 = v42;
  }
  else
  {
    v29 = objc_msgSend(v9, "status") == 7;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    v32 = objc_msgSend(v30, "failSMTsIfOverMMD:skipOptInOut:proof:underlyingError:errorCode:analyticsData:", v6, v29, v31, v10, -306, v17) ^ 1;

    v33 = v6;
    v25 = v10;
    v26 = (void *)v13;
  }

  return v32;
}

- (void)validatePendingSMTsForSingleQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
  v21 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100006418;
  v19[3] = &unk_10023A1A0;
  v19[4] = self;
  v8 = v4;
  v20 = v8;
  v9 = objc_msgSend(v5, "performForPendingSMTs:uri:error:batchSize:block:", v6, v7, &v21, 20, v19);
  v10 = v21;

  if ((v9 & 1) != 0 || !v10)
  {
    if ((v9 & 1) == 0)
    {
      if (qword_1002A4400 != -1)
        dispatch_once(&qword_1002A4400, &stru_10023A1E0);
      v18 = (void *)qword_1002A4408;
      if (os_log_type_enabled((os_log_t)qword_1002A4408, OS_LOG_TYPE_DEBUG))
      {
        v12 = v18;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rpcId"));
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        v14 = "no pending SMTs found for rpcId %{public}@";
        v15 = v12;
        v16 = OS_LOG_TYPE_DEBUG;
        v17 = 12;
        goto LABEL_12;
      }
    }
  }
  else
  {
    if (qword_1002A4400 != -1)
      dispatch_once(&qword_1002A4400, &stru_10023A1C0);
    v11 = (void *)qword_1002A4408;
    if (os_log_type_enabled((os_log_t)qword_1002A4408, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rpcId"));
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v10;
      v14 = "no pending SMTs found for rpcId %{public}@: %@";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);

    }
  }

}

- (void)validatePendingSMTsForBatchQuery:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (qword_1002A4400 != -1)
    dispatch_once(&qword_1002A4400, &stru_10023A200);
  v4 = qword_1002A4408;
  if (os_log_type_enabled((os_log_t)qword_1002A4408, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "validatePendingSMTsForBatchQuery: batch query is unimplemented", v5, 2u);
  }

}

- (void)validatePendingSMTsForRpcId:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v9[4] = self;
  v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000067E8;
  v9[3] = &unk_10023A248;
  v6 = objc_msgSend(v5, "performAndWaitForRpcId:error:block:", v4, &v10, v9);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    if (qword_1002A4400 != -1)
      dispatch_once(&qword_1002A4400, &stru_10023A268);
    v8 = qword_1002A4408;
    if (os_log_type_enabled((os_log_t)qword_1002A4408, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to find rpc for rpcId %{public}@: %@", buf, 0x16u);
    }
  }

}

+ (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 application:(id)a5 staticKeyStore:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id *v38;
  id v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication stripApplicationPrefixForIdentifier:uri:](TransparencyApplication, "stripApplicationPrefixForIdentifier:uri:", a5, v11));
  v40 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "findStaticKeyByHandle:error:", v14, &v40));

  v16 = v40;
  if (v15
    || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "publicKeyID")), v17, v17))
  {
    if (v12)
    {
      v39 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v12, &v39));
      v19 = v39;

      if (v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publicKeyID"));
        v21 = objc_msgSend(v18, "isEqual:", v20);

        if ((v21 & 1) != 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "handles"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v14));

          if (objc_msgSend(v23, "errorCode"))
          {
            if (a7)
              *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, (int)objc_msgSend(v23, "errorCode"), CFSTR("Synthetic mock error")));
            v24 = 2;
          }
          else
          {
            v24 = 0;
          }

        }
        else
        {
          v38 = a7;
          v41[0] = CFSTR("peerID");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "publicAccountIdentity"));
          v41[1] = CFSTR("entry");
          v42[0] = v29;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publicKeyID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "publicAccountIdentity"));
          v42[1] = v31;
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", kTransparencyErrorDecode, -304, 0, v32, CFSTR("Static key mismatch")));
          if (qword_1002A4420 != -1)
            dispatch_once(&qword_1002A4420, &stru_10023A5C8);
          v34 = qword_1002A4428;
          if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v44 = (uint64_t)v11;
            v45 = 2112;
            v46 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to validateStaticKeyForPeer %@: %@", buf, 0x16u);
          }
          if (v38)
            *v38 = objc_retainAutorelease(v33);

          v24 = 2;
          v19 = v33;
        }
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", kTransparencyErrorDecode, -305, 0, 0, CFSTR("failed to decode")));

        if (qword_1002A4420 != -1)
          dispatch_once(&qword_1002A4420, &stru_10023A5A8);
        v26 = (void *)qword_1002A4428;
        if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
          *(_DWORD *)buf = 138412802;
          v44 = (uint64_t)v11;
          v45 = 2112;
          v46 = v28;
          v47 = 2112;
          v48 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to parse account key %@ %@: %@", buf, 0x20u);

        }
        if (a7)
        {
          v19 = objc_retainAutorelease(v25);
          *a7 = v19;
          v24 = 5;
        }
        else
        {
          v24 = 5;
          v19 = v25;
        }
      }

      v16 = v19;
    }
    else
    {
      if (a7)
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -305, CFSTR("Static key missing")));
      v24 = 5;
    }
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "publicKeyID"));

    if (!v35)
    {
      if (qword_1002A4420 != -1)
        dispatch_once(&qword_1002A4420, &stru_10023A588);
      v36 = qword_1002A4428;
      if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558274;
        v44 = 1752392040;
        v45 = 2112;
        v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Static key entry for %{mask.hash}@ missing publicKeyID", buf, 0x16u);
      }
    }
    v24 = 1;
  }

  return v24;
}

- (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a3;
  v11 = (void *)objc_opt_class(self, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext staticKeyStore](self, "staticKeyStore"));
  v14 = objc_msgSend(v11, "validateStaticKeyForPeer:accountKey:application:staticKeyStore:error:", v9, v8, v12, v13, a5);

  return (unint64_t)v14;
}

- (unint64_t)validatePeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 enforceStaticKey:(BOOL)a7 idsResponseTime:(id)a8 responseTime:(id)a9 error:(id *)a10
{
  id v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  unint64_t v19;
  NSObject *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v25 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(a8, "timeIntervalSinceReferenceDate");
  v27 = 0;
  v17 = objc_msgSend(v14, "validateAndUpdateWithServerLoggableDatas:accountKey:idsResponseTime:error:", v16, v15, &v27);
  v18 = v27;
  if ((v17 & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    if (qword_1002A4420 != -1)
      dispatch_once(&qword_1002A4420, &stru_10023A5E8);
    v20 = qword_1002A4428;
    if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      v29 = 1752392040;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ transparency: %@", buf, 0x20u);
    }
    v19 = 0;
    if (a10 && v18)
    {
      v19 = 0;
      *a10 = objc_retainAutorelease(v18);
    }
  }
  v26 = v18;
  v21 = +[KTContextVerifier verifyLoggableDataSignatures:accountKey:error:](KTContextVerifier, "verifyLoggableDataSignatures:accountKey:error:", v16, v15, &v26);
  v22 = v26;

  if ((v21 & 1) == 0)
  {
    if (qword_1002A4420 != -1)
      dispatch_once(&qword_1002A4420, &stru_10023A608);
    v23 = qword_1002A4428;
    if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      v29 = 1752392040;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ signatures: %@", buf, 0x20u);
    }
    if (a10 && v22)
      *a10 = objc_retainAutorelease(v22);
    objc_msgSend(v14, "setStaticKeyStatus:", 4);
    v19 = 0;
  }

  return v19;
}

- (unint64_t)validateSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 idsResponseTime:(id)a8 responseTime:(id)a9 optInCheck:(BOOL)a10 cloudDevices:(id)a11 pcsAccountKey:(id)a12 kvsOptInHistory:(id)a13 isReplay:(BOOL)a14 error:(id *)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  KTContext *v26;
  id v27;
  void *v28;
  unint64_t v29;
  id v30;
  id v31;
  unsigned __int8 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  KTContext *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  unsigned __int8 v57;
  void *v58;
  id v59;
  void *v60;
  char *v61;
  BOOL v62;
  id *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  unsigned __int8 v67;
  id v68;
  NSObject *v69;
  id v70;
  id v71;
  void *v72;
  void *v74;
  void *v75;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a7;
  v23 = a9;
  v24 = a11;
  v71 = a12;
  v70 = a13;
  v84 = 0;
  v25 = a6;
  v26 = self;
  v75 = v20;
  v77 = v19;
  v27 = v19;
  v28 = v21;
  v29 = -[KTContext validatePeer:transparentData:accountKey:loggableDatas:enforceStaticKey:idsResponseTime:responseTime:error:](self, "validatePeer:transparentData:accountKey:loggableDatas:enforceStaticKey:idsResponseTime:responseTime:error:", v27, v20, v21, v25, 0, a8, v23, &v84);
  v30 = v84;
  v83 = v30;
  v72 = v24;
  v74 = v22;
  LOBYTE(v22) = +[KTContextVerifier verifyServerLoggableDatas:againstSyncedLoggableDatas:cloudDevices:error:](KTContextVerifier, "verifyServerLoggableDatas:againstSyncedLoggableDatas:cloudDevices:error:", v25, v22, v24, &v83);

  v31 = v83;
  if ((v22 & 1) == 0)
  {
    v35 = v23;
    if (qword_1002A4420 != -1)
      dispatch_once(&qword_1002A4420, &stru_10023A628);
    v34 = v71;
    v37 = qword_1002A4428;
    v38 = a15;
    if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      v86 = 1752392040;
      v87 = 2112;
      v88 = v77;
      v89 = 2112;
      v90 = v31;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ server data against synced data: %@", buf, 0x20u);
    }
    v29 = 0;
    if (!a15 || !v31)
      goto LABEL_29;
    v39 = v31;
LABEL_37:
    v33 = objc_retainAutorelease(v39);
    v29 = 0;
    *v38 = v33;
    goto LABEL_38;
  }
  if (!a10)
  {
    v82 = v31;
    v32 = objc_msgSend(v75, "validateAndUpdateWithSyncedLoggableDatas:accountKey:cloudDevices:requestDate:error:", v74, v28, v24, v23, &v82);
    v33 = v82;

    if ((v32 & 1) == 0)
    {
      v35 = v23;
      if (qword_1002A4420 != -1)
        dispatch_once(&qword_1002A4420, &stru_10023A648);
      v42 = qword_1002A4428;
      v34 = v71;
      if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558530;
        v86 = 1752392040;
        v87 = 2112;
        v88 = v77;
        v89 = 2112;
        v90 = v33;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ transparent data against synced data: %@", buf, 0x20u);
      }
      v29 = 0;
      v38 = a15;
      if (!a15)
        goto LABEL_38;
LABEL_35:
      if (!v33)
        goto LABEL_38;
      v39 = v33;
      goto LABEL_37;
    }
    v31 = v33;
  }
  if (!a14)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext accountKeyServer](self, "accountKeyServer"));
    v81 = v31;
    v41 = objc_msgSend(v40, "isAccountIdentity:error:", v28, &v81);
    v33 = v81;

    if ((v41 & 1) != 0)
    {
      if (a10)
      {
        v35 = v23;
LABEL_48:
        v36 = v70;
LABEL_49:
        v34 = v71;
        goto LABEL_50;
      }
      v46 = self;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext cloudRecords](self, "cloudRecords"));
      v48 = objc_msgSend(v47, "enforceCKOptInRecords");

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "getLogDataForAccountKey:uri:", v28, v77));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext cloudRecords](v26, "cloudRecords"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](v26, "applicationID"));
        v80 = 0;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "evaluateKTLogData:application:error:", v49, v51, &v80));
        v53 = v80;

        if (!v52)
        {
          v65 = v49;
          v34 = v71;
          v35 = v23;
          if (qword_1002A4420 != -1)
            dispatch_once(&qword_1002A4420, &stru_10023A6A8);
          v66 = qword_1002A4428;
          if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v86 = (uint64_t)v53;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "evaluateKTLogData failure: %@", buf, 0xCu);
          }
          if (a15 && v53)
            *a15 = objc_retainAutorelease(v53);

          v29 = 0;
          goto LABEL_38;
        }
        v54 = v53;
        if (qword_1002A4420 != -1)
          dispatch_once(&qword_1002A4420, &stru_10023A6C8);
        v55 = qword_1002A4428;
        if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = (uint64_t)v52;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "evaluateKTLogData eval result: %@", buf, 0xCu);
        }

        v46 = v26;
      }
      v35 = v23;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext cloudRecords](v46, "cloudRecords"));
      v57 = objc_msgSend(v56, "enforceCKOptInRecords");

      if ((v57 & 1) != 0)
        goto LABEL_48;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](v46, "optInServer"));
      v79 = 0;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "getOptInHistory:", &v79));
      v59 = v79;

      if (!v59)
      {
        v78 = v33;
        v67 = objc_msgSend(v75, "validateOptInHistory:accountKey:responseTime:error:", v36, v28, v35, &v78);
        v68 = v78;

        if ((v67 & 1) != 0)
        {
          v33 = v68;
          goto LABEL_49;
        }
        v29 = 0;
        if (!a15)
        {
          v33 = v68;
          v34 = v71;
          goto LABEL_80;
        }
        v33 = v68;
        v34 = v71;
        v63 = a15;
        if (!v68)
          goto LABEL_80;
        goto LABEL_79;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "domain"));
      if ((objc_msgSend(v60, "isEqualToString:", kTransparencyErrorInterface) & 1) != 0)
      {
        v61 = (char *)objc_msgSend(v59, "code");

        v62 = v61 + 308 == 0;
        v34 = v71;
        if (v62)
        {
          v63 = a15;
          if (qword_1002A4420 != -1)
            dispatch_once(&qword_1002A4420, &stru_10023A6E8);
          v64 = qword_1002A4428;
          if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558530;
            v86 = 1752392040;
            v87 = 2112;
            v88 = v77;
            v89 = 2112;
            v90 = v59;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failed to get %{mask.hash}@ opt-in history (waiting for first unlock): %@", buf, 0x20u);
          }
          v29 = 2;
LABEL_78:
          v68 = v59;
          if (!v63)
          {
LABEL_80:

            goto LABEL_39;
          }
LABEL_79:
          *v63 = objc_retainAutorelease(v68);
          goto LABEL_80;
        }
      }
      else
      {

        v34 = v71;
      }
      v63 = a15;
      if (qword_1002A4420 != -1)
        dispatch_once(&qword_1002A4420, &stru_10023A708);
      v69 = qword_1002A4428;
      if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558530;
        v86 = 1752392040;
        v87 = 2112;
        v88 = v77;
        v89 = 2112;
        v90 = v59;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "Failed to get %{mask.hash}@ opt-in history: %@", buf, 0x20u);
      }
      v29 = 0;
      goto LABEL_78;
    }
    v35 = v23;
    if (qword_1002A4420 != -1)
      dispatch_once(&qword_1002A4420, &stru_10023A668);
    v34 = v71;
    v44 = qword_1002A4428;
    v38 = a15;
    if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      v86 = 1752392040;
      v87 = 2112;
      v88 = v77;
      v89 = 2112;
      v90 = v33;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ account key: %@", buf, 0x20u);
    }
    v29 = 0;
    if (!a15)
      goto LABEL_38;
    goto LABEL_35;
  }
  v34 = v71;
  if ((objc_msgSend(v71, "isEqual:", v28) & 1) == 0)
  {
    v35 = v23;
    if (qword_1002A4420 != -1)
      dispatch_once(&qword_1002A4420, &stru_10023A688);
    v43 = qword_1002A4428;
    if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558274;
      v86 = 1752392040;
      v87 = 2112;
      v88 = v77;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ account key", buf, 0x16u);
    }
    v29 = 0;
LABEL_29:
    v33 = v31;
LABEL_38:
    v36 = v70;
    goto LABEL_39;
  }
  v35 = v23;
  v33 = v31;
  v36 = v70;
LABEL_50:
  if (a15 && v33)
  {
    v33 = objc_retainAutorelease(v33);
    *a15 = v33;
  }
LABEL_39:

  return v29;
}

- (unint64_t)validateAndReportPeerOrEnroll:(id)a3 type:(unint64_t)a4 transparentData:(id)a5 accountKey:(id)a6 loggableDatas:(id)a7 initialResult:(unint64_t)a8 idsResponseTime:(id)a9 responseMetadata:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v31;
  _QWORD v33[4];
  id v34;
  KTContext *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  unint64_t v42;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext validateEventName:application:](KTContext, "validateEventName:application:", a4, v22));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000A67C;
  v33[3] = &unk_10023A730;
  v34 = v21;
  v35 = self;
  v36 = v16;
  v37 = v17;
  v38 = v18;
  v39 = v19;
  v40 = v20;
  v41 = a4;
  v42 = a8;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v21;
  v29 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:error:block:", v31, a11, v33);

  return (unint64_t)v29;
}

- (unint64_t)validateAndReportPeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10
{
  return -[KTContext validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:responseMetadata:error:](self, "validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:responseMetadata:error:", a3, 0, a4, a5, a6, a7, a8, a9, a10);
}

- (unint64_t)validateAndReportEnroll:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10
{
  return -[KTContext validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:responseMetadata:error:](self, "validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:responseMetadata:error:", a3, 2, a4, a5, a6, a7, a8, a9, a10);
}

- (void)clearSelfTicketState:(id)a3 responseTime:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v21 = 0;
  v10 = (char *)objc_msgSend(v8, "checkFollowupTicket:uri:checkTime:error:", v9, v6, v7, &v21);

  v11 = v21;
  if (v11 && objc_msgSend(v11, "code") != (id)-338)
  {
    if (qword_1002A4420 != -1)
      dispatch_once(&qword_1002A4420, &stru_10023A750);
    v12 = (void *)qword_1002A4428;
    if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
      *(_DWORD *)buf = 138544130;
      v23 = (uint64_t)v14;
      v24 = 2160;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to check followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);

    }
  }
  if ((unint64_t)(v10 - 1) <= 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    v20 = 0;
    v17 = objc_msgSend(v15, "clearFollowupTicket:uri:error:", v16, v6, &v20);
    v18 = v20;

    if ((v17 & 1) == 0)
    {
      if (qword_1002A4420 != -1)
        dispatch_once(&qword_1002A4420, &stru_10023A770);
      v19 = qword_1002A4428;
      if (os_log_type_enabled((os_log_t)qword_1002A4428, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558530;
        v23 = 1752392040;
        v24 = 2112;
        v25 = (uint64_t)v6;
        v26 = 2112;
        v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to clear followup ticket for %{mask.hash}@: %@", buf, 0x20u);
      }
    }

  }
}

- (unint64_t)validateAndReportSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 optInCheck:(BOOL)a8 cloudDevices:(id)a9 pcsAccountKey:(id)a10 kvsOptInHistory:(id)a11 isReplay:(BOOL)a12 initialResult:(unint64_t)a13 idsResponseTime:(id)a14 responseMetadata:(id)a15 error:(id *)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  unint64_t v61;
  BOOL v62;

  v50 = a3;
  v20 = a4;
  v43 = a5;
  v49 = a6;
  v48 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a14;
  v25 = a15;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ResponseTime")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate kt_dateFromString:](NSDate, "kt_dateFromString:", v26));

  v45 = v22;
  v46 = v23;
  if (a12)
  {
    v28 = v48;
    LOBYTE(v41) = 1;
    v39 = v22;
    v40 = v23;
    v29 = v21;
    LOBYTE(v38) = a8;
    v30 = v49;
    v31 = v50;
    v32 = v20;
    v33 = v20;
    v34 = v43;
    v35 = -[KTContext validateSelf:transparentData:accountKey:serverloggableDatas:syncedLoggableDatas:idsResponseTime:responseTime:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:error:](self, "validateSelf:transparentData:accountKey:serverloggableDatas:syncedLoggableDatas:idsResponseTime:responseTime:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:error:", v50, v33, v43, v49, v48, v24, v27, v38, v21, v39, v40, v41, a16);
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext validateEventName:application:](KTContext, "validateEventName:application:", 1, v36));

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10000AE5C;
    v51[3] = &unk_10023A798;
    v51[4] = self;
    v31 = v50;
    v52 = v50;
    v32 = v20;
    v53 = v20;
    v34 = v43;
    v54 = v43;
    v30 = v49;
    v55 = v49;
    v28 = v48;
    v56 = v48;
    v57 = v24;
    v58 = v27;
    v62 = a8;
    v29 = v21;
    v59 = v21;
    v61 = a13;
    v60 = v25;
    v35 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:error:block:", v42, a16, v51);

  }
  return (unint64_t)v35;
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
  v20 = objc_msgSend(v19, "handleBatchQueryResponse:queryRequest:receiptDate:fetchId:error:transparentDataHandler:", v18, v17, v16, v15, a7, v14);

  return (unint64_t)v20;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 validateType:(unint64_t)a7 ktCapable:(BOOL)a8 error:(id *)a9 transparentDataHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  _BOOL4 v32;
  void *v33;
  id v34;

  v32 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a10;
  v18 = a6;
  v19 = a5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext validateEventName:application:](KTContext, "validateEventName:application:", a7, v20));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
  v34 = 0;
  v22 = objc_msgSend(v21, "handleQueryResponse:queryRequest:receiptDate:fetchId:error:transparentDataHandler:", v15, v16, v19, v18, &v34, v17);

  v23 = v34;
  if (v22 != (id)1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metadata"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uri"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext analyticsForResponse:type:uri:result:ktCapable:](self, "analyticsForResponse:type:uri:result:ktCapable:", v24, a7, v25, v22, v32));

    if (v22)
    {
      v27 = 0;
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ktSoftFailure")));
      v29 = objc_msgSend(v28, "BOOLValue");

      v27 = v29 ^ 1;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v30, "logResultForEvent:hardFailure:result:withAttributes:", v33, v27, v23, v26);

  }
  if (a9 && v23)
    *a9 = objc_retainAutorelease(v23);

  return (unint64_t)v22;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  return -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:](self, "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:", a3, a4, a5, a6, 3, 0, a7, a8);
}

- (id)metadataForInsertResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverEventInfo"));

  if (v4)
  {
    v7 = kTransparencyResponseMetadataKeyServerHint;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverEventInfo"));
    v8 = v5;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  }
  return v4;
}

- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext validateEventName:application:](KTContext, "validateEventName:application:", 2, v16));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000B560;
  v24[3] = &unk_10023A7C0;
  v24[4] = self;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:error:block:", v17, a6, v24);

  return (unint64_t)v22;
}

- (KTContext)initWithApplicationID:(id)a3 dependencies:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  KTContext *v21;
  id v22;

  v5 = a4;
  v22 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationKeyStore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smDataStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "staticKeyStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logClient"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contextStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKeyServer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateMachine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kvs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "analyticsLogger"));

  v21 = -[KTContext initWithApplicationKeyStore:dataStore:smDataStore:staticKeyStore:logClient:applicationID:contextStore:accountKeyServer:stateMachine:kvs:cloudRecords:followup:settings:analyticsLogger:](self, "initWithApplicationKeyStore:dataStore:smDataStore:staticKeyStore:logClient:applicationID:contextStore:accountKeyServer:stateMachine:kvs:cloudRecords:followup:settings:analyticsLogger:", v19, v18, v15, v17, v16, v22, v14, v13, v12, v6, v7, v8, v9, v10);
  return v21;
}

- (KTContext)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 smDataStore:(id)a5 staticKeyStore:(id)a6 logClient:(id)a7 applicationID:(id)a8 contextStore:(id)a9 accountKeyServer:(id)a10 stateMachine:(id)a11 kvs:(id)a12 cloudRecords:(id)a13 followup:(id)a14 settings:(id)a15 analyticsLogger:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  KTContext *v28;
  KTContext *v29;
  id v30;
  KTContextVerifier *v31;
  TransparencyTranscript *v32;
  uint64_t v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  TransparencyTranscript *v40;
  void *v41;
  void *v42;
  KTOptInManagerServer *v43;
  uint64_t v44;
  void *v45;
  KTOptInManagerServer *v46;
  _TtC13transparencyd12KTTapToRadar *v47;
  void *v48;
  void *v49;
  void *v50;
  _TtC13transparencyd12KTTapToRadar *v51;
  void *v52;
  KTContext *v53;
  NSObject *v54;
  id v56;
  id v57;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[8];
  objc_super v69;

  v63 = a3;
  v60 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v62 = a11;
  v67 = a12;
  v66 = a13;
  v65 = a14;
  v27 = a15;
  v64 = a16;
  v69.receiver = self;
  v69.super_class = (Class)KTContext;
  v28 = -[KTContext init](&v69, "init");
  v29 = v28;
  v61 = v27;
  if (!v28)
  {
    v42 = v26;
    v41 = v24;
    v45 = v62;
    v52 = v60;
    goto LABEL_7;
  }
  v59 = v25;
  v30 = v24;
  -[KTContext setApplicationID:](v28, "setApplicationID:", v24);
  -[KTContext setApplicationKeyStore:](v29, "setApplicationKeyStore:", v63);
  -[KTContext setDataStore:](v29, "setDataStore:", v60);
  v57 = v21;
  -[KTContext setSmDataStore:](v29, "setSmDataStore:", v21);
  v56 = v22;
  -[KTContext setStaticKeyStore:](v29, "setStaticKeyStore:", v22);
  -[KTContext setLogClient:](v29, "setLogClient:", v23);
  -[KTContext setSettings:](v29, "setSettings:", v27);
  v31 = -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:context:]([KTContextVerifier alloc], "initWithApplicationKeyStore:dataStore:applicationID:context:", v63, v60, v24, v29);
  -[KTContext setVerifier:](v29, "setVerifier:", v31);

  v32 = [TransparencyTranscript alloc];
  v34 = (objc_class *)objc_opt_class(v29, v33);
  v35 = NSStringFromClass(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](v29, "applicationID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v36, v37));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext settings](v29, "settings"));
  v40 = -[TransparencyTranscript initWithContext:settings:](v32, "initWithContext:settings:", v38, v39);
  -[KTContext setTranscript:](v29, "setTranscript:", v40);

  v41 = v30;
  if (!v26)
    v26 = (id)objc_claimAutoreleasedReturnValue(+[KTAccountKeyServer sharedKeyServiceForApplication:](KTAccountKeyServer, "sharedKeyServiceForApplication:", v30));
  v42 = v26;
  -[KTContext setAccountKeyServer:](v29, "setAccountKeyServer:", v26);
  v43 = [KTOptInManagerServer alloc];
  v45 = v62;
  v46 = -[KTOptInManagerServer initWithApplication:context:stateMachine:account:store:](v43, "initWithApplication:context:stateMachine:account:store:", v30, v29, v62, objc_opt_class(TransparencyAccount, v44), v67);
  -[KTContext setOptInServer:](v29, "setOptInServer:", v46);

  -[KTContext setStateMachine:](v29, "setStateMachine:", v62);
  -[KTContext setContextStore:](v29, "setContextStore:", v59);
  -[KTContext setFollowUp:](v29, "setFollowUp:", v65);
  -[KTContext setCloudRecords:](v29, "setCloudRecords:", v66);
  v47 = [_TtC13transparencyd12KTTapToRadar alloc];
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](v29, "dataStore"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](v29, "logClient"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "configBag"));
  v51 = -[KTTapToRadar initWithDataStore:configBag:](v47, "initWithDataStore:configBag:", v48, v50);
  -[KTContext setTapToRadar:](v29, "setTapToRadar:", v51);

  -[KTContext setAnalyticsLogger:](v29, "setAnalyticsLogger:", v64);
  if (v29->_verifier)
  {
    v52 = v60;
    v22 = v56;
    v21 = v57;
    v25 = v59;
LABEL_7:
    v53 = v29;
    goto LABEL_13;
  }
  v52 = v60;
  v22 = v56;
  v21 = v57;
  if (qword_1002A4440 != -1)
    dispatch_once(&qword_1002A4440, &stru_10023A888);
  v25 = v59;
  v54 = qword_1002A4448;
  if (os_log_type_enabled((os_log_t)qword_1002A4448, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Cannot create a KTContext with an invalid KTPublicKeyStore", buf, 2u);
  }
  v53 = 0;
LABEL_13:

  return v53;
}

- (BOOL)drainContext
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v3 = objc_msgSend(v2, "drainDataStore");

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
  objc_msgSend(v3, "setContext:", 0);

  v4.receiver = self;
  v4.super_class = (Class)KTContext;
  -[KTContext dealloc](&v4, "dealloc");
}

- (void)logStartEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTContext transcript](self, "transcript"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v4));

  objc_msgSend(v7, "startEvent:", v6);
}

- (void)logFinishSuccessEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTContext transcript](self, "transcript"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v4));

  objc_msgSend(v7, "stopEventWithSuccess:", v6);
}

- (void)logFinishFailureEvent:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[KTContext transcript](self, "transcript"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v8, v7));

  objc_msgSend(v10, "stopEventWithFailure:error:", v9, v6);
}

- (BOOL)unsupported:(id *)a3
{
  void *v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  int v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v6 = objc_msgSend(v5, "unsupported");

  if (v6)
  {
    if (qword_1002A4440 != -1)
      dispatch_once(&qword_1002A4440, &stru_10023A8A8);
    v7 = qword_1002A4448;
    if (os_log_type_enabled((os_log_t)qword_1002A4448, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = kTransparencyProtocolVersion;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This client version (%d) is no longer supported.", buf, 8u);
    }
    if (a3)
    {
      v8 = kTransparencyErrorInternal;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "treeRollInfoURL"));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v8, -230, CFSTR("Client version (%d) no longer supported. See %@ for more info."), kTransparencyProtocolVersion, v10));

    }
  }
  return v6;
}

- (BOOL)ready:(id *)a3
{
  BOOL v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = -[KTApplicationPublicKeyStore ready](self->_applicationKeyStore, "ready");
  if (!v4)
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -41, CFSTR("KT public key store is not ready")));
    if (qword_1002A4440 != -1)
      dispatch_once(&qword_1002A4440, &stru_10023A8C8);
    v5 = qword_1002A4448;
    if (os_log_type_enabled((os_log_t)qword_1002A4448, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "KT public key store is not ready", v7, 2u);
    }
  }
  return v4;
}

- (void)clearState:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[KTContext logStartEvent:](self, "logStartEvent:", CFSTR("clearState"));
  v4[2](v4, 0);

  -[KTContext logFinishSuccessEvent:](self, "logFinishSuccessEvent:", CFSTR("clearState"));
}

- (id)copyState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v3 = objc_msgSend(v2, "copyKeyStoreState");

  return v3;
}

- (BOOL)contextShouldGossip
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v4 = objc_msgSend(v3, "shutDown");

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v6 = objc_msgSend(v5, "shutDown");
  v7 = (double)((unint64_t)v6 + kTransparencyThirtyDaysInMs);

  +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
  return v8 < v7;
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (TransparencyTranscript)transcript
{
  return (TransparencyTranscript *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTranscript:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSmDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStaticKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTContextVerifier)verifier
{
  return (KTContextVerifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVerifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLogClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (KTAccountKeyServer)accountKeyServer
{
  return (KTAccountKeyServer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountKeyServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOptInServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFollowUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudRecords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (TransparencyAnalytics)analyticsLogger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAnalyticsLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_loadWeakRetained((id *)&self->_contextStore);
}

- (void)setContextStore:(id)a3
{
  objc_storeWeak((id *)&self->_contextStore, a3);
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (KTTapToRadarProtocol)tapToRadar
{
  return (KTTapToRadarProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTapToRadar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadar, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_destroyWeak((id *)&self->_contextStore);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_optInServer, 0);
  objc_storeStrong((id *)&self->_accountKeyServer, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_storeStrong((id *)&self->_smDataStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_applicationKeyStore, 0);
  objc_storeStrong((id *)&self->_transcript, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

- (BOOL)shouldShowCFU:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseTime"));
  v39 = 0;
  v9 = objc_msgSend(v5, "checkFollowupTicket:uri:checkTime:error:", v6, v7, v8, &v39);
  v10 = v39;

  if (v10 && objc_msgSend(v10, "code") != (id)-338)
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BBA8);
    v11 = (void *)qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
      *(_DWORD *)buf = 138544130;
      v41 = (uint64_t)v13;
      v42 = 2160;
      v43 = 1752392040;
      v44 = 2112;
      v45 = v14;
      v46 = 2112;
      v47 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to check followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);

    }
  }
  if (v9 != (id)2)
  {
    if (v9 == (id)1)
    {
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023BC08);
      v30 = (void *)qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
        *(_DWORD *)buf = 141558274;
        v41 = 1752392040;
        v42 = 2112;
        v43 = (uint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Have active followup ticket for %{mask.hash}@", buf, 0x16u);

      }
    }
    else if (!v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseTime"));
      v38 = v10;
      v19 = objc_msgSend(v15, "createFollowupTicket:uri:startTime:error:", v16, v17, v18, &v38);
      v20 = v38;

      if ((v19 & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseTime"));
        v25 = objc_msgSend(v21, "checkFollowupTicket:uri:checkTime:error:", v22, v23, v24, 0);

        v26 = v25 == (id)2;
      }
      else
      {
        if (qword_1002A4520 != -1)
          dispatch_once(&qword_1002A4520, &stru_10023BBC8);
        v33 = (void *)qword_1002A4528;
        if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
        {
          v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
          *(_DWORD *)buf = 138544130;
          v41 = (uint64_t)v35;
          v42 = 2160;
          v43 = 1752392040;
          v44 = 2112;
          v45 = v36;
          v46 = 2112;
          v47 = v20;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to create followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);

        }
        v26 = 1;
      }
      v10 = v20;
      goto LABEL_28;
    }
    v26 = 0;
    goto LABEL_28;
  }
  if (qword_1002A4520 != -1)
    dispatch_once(&qword_1002A4520, &stru_10023BBE8);
  v27 = (void *)qword_1002A4528;
  if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
    *(_DWORD *)buf = 141558274;
    v41 = 1752392040;
    v42 = 2112;
    v43 = (uint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Have expired followup ticket for %{mask.hash}@", buf, 0x16u);

  }
  v26 = 1;
LABEL_28:

  return v26;
}

- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 replay:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  double v14;
  CFAbsoluteTime v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v53;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;

  v12 = a4;
  v13 = a5;
  if (v12)
  {
    if (a3 == 2)
    {
      objc_msgSend(v12, "requestTime");
      v15 = v14 + (double)kKTMaximumMergeDelayMs / 1000.0;
      if (v15 >= CFAbsoluteTimeGetCurrent())
        a3 = 2;
      else
        a3 = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "createRequestFailure"));

    if (!v17)
    {
      a3 = 2;
LABEL_46:

      goto LABEL_47;
    }
    objc_msgSend(v17, "setRequest:", v12);
    if (a7)
    {
      if (*a7)
        v18 = (uint64_t)objc_msgSend(*a7, "code");
      else
        v18 = -120;
      objc_msgSend(v17, "setErrorCode:", v18);
      if (*a7)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a7, "domain"));
        objc_msgSend(v17, "setErrorDomain:", v19);

LABEL_16:
        objc_msgSend(v12, "setUnsigned:value:", "verificationResult", a3);
        if (a6)
          goto LABEL_46;
        v20 = objc_msgSend(v12, "type");
        if (!a7 || a3 || v20 != (id)1)
          goto LABEL_46;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v22 = *a7;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "createFailureEvent:application:optInServer:", v22, v23, v24));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "failureEvent"));
        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "failureEvent"));
          objc_msgSend(v27, "deleteObject:", v28);

        }
        objc_msgSend(v12, "setFailureEvent:", v25);
        if (qword_1002A4520 != -1)
          dispatch_once(&qword_1002A4520, &stru_10023BC28);
        v29 = (void *)qword_1002A4528;
        if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "eventId"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestId"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "errorDomain"));
          *(_DWORD *)buf = 138544130;
          v57 = v31;
          v58 = 2114;
          v59 = (uint64_t)v32;
          v60 = 2112;
          v61 = v33;
          v62 = 1024;
          LODWORD(v63) = objc_msgSend(v17, "errorCode");
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Created failure eventId %{public}@ for self validation requestId %{public}@ because error: %@:%d", buf, 0x26u);

        }
        if (!-[KTContext shouldShowCFU:](self, "shouldShowCFU:", v12))
          goto LABEL_45;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
        v55 = 0;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "getAggregateOptInState:", &v55));
        v36 = v55;

        if (!v35)
        {
          if (qword_1002A4520 != -1)
            dispatch_once(&qword_1002A4520, &stru_10023BC48);
          v37 = qword_1002A4528;
          if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v36;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "writeResult: failed getting optin state: %@", buf, 0xCu);
          }
        }
        v53 = v36;
        if (objc_msgSend(v17, "errorCode") == (id)-289)
          goto LABEL_33;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "errorDomain"));
        if ((objc_msgSend(v41, "isEqual:", CFSTR("com.apple.Transparency")) & 1) != 0)
        {
          v42 = objc_msgSend(v17, "errorCode");

          if (v42 == (id)7)
          {
LABEL_33:
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext followUp](self, "followUp"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "eventId"));
            objc_msgSend(v38, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:", v39, 4, v40, -289, v35, 0, 0, 0);
LABEL_39:

            v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "application"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uri"));
            v54 = 0;
            v46 = objc_msgSend(v43, "clearFollowupTicket:uri:error:", v44, v45, &v54);
            v47 = v54;

            if ((v46 & 1) == 0)
            {
              if (qword_1002A4520 != -1)
                dispatch_once(&qword_1002A4520, &stru_10023BC68);
              v48 = (void *)qword_1002A4528;
              if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
              {
                v49 = v48;
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "application"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uri"));
                *(_DWORD *)buf = 138544130;
                v57 = v50;
                v58 = 2160;
                v59 = 1752392040;
                v60 = 2112;
                v61 = v51;
                v62 = 2112;
                v63 = v47;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to clear followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);

              }
            }

LABEL_45:
            a3 = 0;
            goto LABEL_46;
          }
        }
        else
        {

        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext followUp](self, "followUp"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "eventId"));
        objc_msgSend(v38, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:", v39, 0, v40, objc_msgSend(v17, "errorCode"), v35, 0, 0, 0);
        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v17, "setErrorCode:", -120);
    }
    objc_msgSend(v17, "setErrorDomain:", kTransparencyErrorUnknown);
    goto LABEL_16;
  }
LABEL_47:

  return a3;
}

- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 error:(id *)a6
{
  return -[KTContext writeResult:request:proof:replay:error:](self, "writeResult:request:proof:replay:error:", a3, a4, a5, 0, a6);
}

- (unint64_t)deserializeServerLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverLoggableDatas"));
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyManagedDataStore deserializeLoggableDatas:error:](TransparencyManagedDataStore, "deserializeLoggableDatas:error:", v9, &v21));
  v11 = v21;

  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v12 = 1;
  }
  else
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BC88);
    v13 = (void *)qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "deleting requestId %{public}@ with failed deserialization of serverLoggableDatas", buf, 0xCu);

    }
    v16 = kTransparencyErrorDecode;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v16, -131, v11, CFSTR("deleting requestId %@ with failed deserialization of serverLoggableDatas"), v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    objc_msgSend(v19, "deleteObject:", v8);

    v12 = 0;
    if (a5 && v18)
    {
      v11 = objc_retainAutorelease(v18);
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      v11 = v18;
    }
  }

  return v12;
}

- (unint64_t)validatePeerOrEnrollKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 transparentData:(id *)a6 loggableDatas:(id *)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  id *v35;
  id v36;
  unint64_t v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  NSObject *v41;
  const __CFString *v42;
  void *v43;
  id v45;
  id v48;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  id obj;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint8_t buf[4];
  const __CFString *v86;
  __int16 v87;
  void *v88;

  v11 = a3;
  v48 = a4;
  v12 = a5;
  v45 = objc_msgSend(v11, "getUnsigned:", "type");
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 2;
  v75 = 0;
  v76 = (id *)&v75;
  v77 = 0x3032000000;
  v78 = sub_10001F434;
  v79 = sub_10001F444;
  v80 = 0;
  v13 = objc_msgSend(v11, "getUnsigned:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
  objc_msgSend(v11, "setServerHint:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("APS")));
  objc_msgSend(v11, "setUsedReversePush:", v17 != 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ResponseTime")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate kt_dateFromString:](NSDate, "kt_dateFromString:", v19));
  objc_msgSend(v11, "setResponseTime:", v20);

  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_10001F434;
  v73 = sub_10001F444;
  v74 = 0;
  obj = 0;
  v21 = -[KTContext deserializeServerLoggableDatas:loggableDatas:error:](self, "deserializeServerLoggableDatas:loggableDatas:error:", v11, &obj, a8);
  objc_storeStrong(&v74, obj);
  v82[3] = v21;
  if (v21 == 1)
  {
    v22 = +[KTLoggableData isAccountKTCapable:](KTLoggableData, "isAccountKTCapable:", v70[5]);
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = sub_10001F434;
    v66 = sub_10001F444;
    v67 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "responseTime"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestId"));
    v61 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10001F44C;
    v52[3] = &unk_10023BD30;
    v55 = &v75;
    v56 = &v81;
    v52[4] = self;
    v59 = v45;
    v25 = v11;
    v53 = v25;
    v57 = &v69;
    v60 = v13;
    v26 = v12;
    v54 = v26;
    v58 = &v62;
    v27 = -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:](self, "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:", v26, v48, v23, v24, v45, v22, &v61, v52);
    v28 = v61;

    if (a6)
    {
      v29 = (void *)v63[5];
      if (v29)
        *a6 = objc_retainAutorelease(v29);
    }
    if (a7)
    {
      v30 = (void *)v70[5];
      if (v30)
        *a7 = objc_retainAutorelease(v30);
    }
    if (v27 == 2
      || (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "data")),
          objc_msgSend(v25, "setQueryRequest:", v31),
          v31,
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "data")),
          objc_msgSend(v25, "setQueryResponse:", v32),
          v32,
          v27 != 1))
    {
      if (a8 && v28)
        *a8 = objc_retainAutorelease(v28);
      v51 = v28;
      v33 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v27, v25, 0, &v51);
      v34 = v51;

      v82[3] = v33;
      v28 = v34;
    }
    else
    {
      v33 = v82[3];
    }
    if (v33 == 1)
      goto LABEL_20;
    v35 = v76;
    if (a8)
    {
      v36 = v76[5];
      if (v36)
      {
        *a8 = objc_retainAutorelease(v36);
        v33 = v82[3];
        v35 = v76;
      }
    }
    v50 = v35[5];
    v37 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v33, v25, 0, &v50);
    objc_storeStrong(v35 + 5, v50);
    v82[3] = v37;
    if (v37 == 1)
LABEL_20:
      objc_msgSend(v25, "setUnsigned:value:", "verificationResult", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v39 = objc_msgSend(v38, "persistAndRefaultObject:error:", v25, a8);

    if ((v39 & 1) == 0)
    {
      if (a8 && *a8)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        objc_msgSend(v40, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("validatePeerOrEnrollKTRequest"), *a8);

      }
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023BD50);
      v41 = qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
      {
        v42 = CFSTR("enroll");
        if (!v45)
          v42 = CFSTR("peer");
        v43 = a8;
        if (a8)
          v43 = *a8;
        *(_DWORD *)buf = 138412546;
        v86 = v42;
        v87 = 2112;
        v88 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "failed to save validate %@ with response: %@", buf, 0x16u);
      }
    }
    v21 = v82[3];

    _Block_object_dispose(&v62, 8);
  }
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v81, 8);

  return v21;
}

- (void)writeLoggableDatas:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "application"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "createRecordFromLoggableData:application:", v12, v14));

        objc_msgSend(v15, "setRequest:", v7);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (unint64_t)deserializeSyncedLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientLoggableDatas"));
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyManagedDataStore deserializeLoggableDatas:error:](TransparencyManagedDataStore, "deserializeLoggableDatas:error:", v9, &v21));
  v11 = v21;

  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v12 = 1;
  }
  else
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BD70);
    v13 = (void *)qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "deleting requestId %{public}@ with failed deserialization of clientLoggableDatas", buf, 0xCu);

    }
    v16 = kTransparencyErrorDecode;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v16, -131, v11, CFSTR("deleting requestId %@ with failed deserialization of clientLoggableDatas"), v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    objc_msgSend(v19, "deleteObject:", v8);

    v12 = 0;
    if (a5 && v18)
    {
      v11 = objc_retainAutorelease(v18);
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      v11 = v18;
    }
  }

  return v12;
}

- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 optInCheck:(BOOL)a6 cloudDevices:(id)a7 pcsAccountKey:(id)a8 kvsOptInHistory:(id)a9 isReplay:(BOOL)a10 transparentData:(id *)a11 loggableDatas:(id *)a12 error:(id *)a13
{
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  id *v41;
  id v42;
  unint64_t v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  id v68;
  BOOL v69;
  BOOL v70;
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  id obj;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  id *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint8_t buf[4];
  id v96;

  v18 = a3;
  v53 = a4;
  v55 = a5;
  v50 = a7;
  v51 = a8;
  v52 = a9;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 2;
  v85 = 0;
  v86 = (id *)&v85;
  v87 = 0x3032000000;
  v88 = sub_10001F434;
  v89 = sub_10001F444;
  v90 = 0;
  v19 = objc_msgSend(v18, "getUnsigned:");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "metadata"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
  objc_msgSend(v18, "setServerHint:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "metadata"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("APS")));
  objc_msgSend(v18, "setUsedReversePush:", v23 != 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "metadata"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ResponseTime")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate kt_dateFromString:](NSDate, "kt_dateFromString:", v25));
  objc_msgSend(v18, "setResponseTime:", v26);

  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_10001F434;
  v83 = sub_10001F444;
  v84 = 0;
  obj = 0;
  v27 = -[KTContext deserializeServerLoggableDatas:loggableDatas:error:](self, "deserializeServerLoggableDatas:loggableDatas:error:", v18, &obj, a13);
  objc_storeStrong(&v84, obj);
  v92[3] = v27;
  if (v27 == 1)
  {
    v28 = +[KTLoggableData isAccountKTCapable:](KTLoggableData, "isAccountKTCapable:", v80[5]);
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = sub_10001F434;
    v76 = sub_10001F444;
    v77 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "responseTime"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "requestId"));
    v71 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100020444;
    v58[3] = &unk_10023BE38;
    v65 = &v91;
    v64 = &v85;
    v58[4] = self;
    v31 = v18;
    v59 = v31;
    v60 = v50;
    v66 = &v79;
    v69 = a6;
    v61 = v51;
    v70 = a10;
    v62 = v52;
    v68 = v19;
    v32 = v55;
    v63 = v32;
    v67 = &v72;
    v33 = -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:](self, "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:", v32, v53, v29, v30, 0, v28, &v71, v58);
    v34 = v71;

    if (a11)
    {
      v35 = (void *)v73[5];
      if (v35)
        *a11 = objc_retainAutorelease(v35);
    }
    if (a12)
    {
      v36 = (void *)v80[5];
      if (v36)
        *a12 = objc_retainAutorelease(v36);
    }
    if (v33 == 2
      || (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "data")),
          objc_msgSend(v31, "setQueryRequest:", v37),
          v37,
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "data")),
          objc_msgSend(v31, "setQueryResponse:", v38),
          v38,
          v33 != 1))
    {
      if (a13 && v34)
        *a13 = objc_retainAutorelease(v34);
      v57 = v34;
      v39 = -[KTContext writeResult:request:proof:replay:error:](self, "writeResult:request:proof:replay:error:", v33, v31, 0, a10, &v57);
      v40 = v57;

      v92[3] = v39;
      v34 = v40;
    }
    else
    {
      v39 = v92[3];
    }
    if (v39 == 1)
      goto LABEL_20;
    v41 = v86;
    if (a13)
    {
      v42 = v86[5];
      if (v42)
      {
        *a13 = objc_retainAutorelease(v42);
        v39 = v92[3];
        v41 = v86;
      }
    }
    v56 = v41[5];
    v43 = -[KTContext writeResult:request:proof:replay:error:](self, "writeResult:request:proof:replay:error:", v39, v31, 0, a10, &v56);
    objc_storeStrong(v41 + 5, v56);
    v92[3] = v43;
    if (v43 == 1)
LABEL_20:
      objc_msgSend(v31, "setUnsigned:value:", "verificationResult", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v45 = objc_msgSend(v44, "persistAndRefaultObject:error:", v31, a13);

    if ((v45 & 1) == 0)
    {
      if (a13 && *a13)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        objc_msgSend(v46, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("validateSelfResponse"), *a13);

      }
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023BE58);
      v47 = qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
      {
        if (a13)
          v48 = *a13;
        else
          v48 = 0;
        *(_DWORD *)buf = 138412290;
        v96 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "failed to save validate self with response: %@", buf, 0xCu);
      }
    }
    v27 = v92[3];

    _Block_object_dispose(&v72, 8);
  }
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);

  return v27;
}

- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 optInCheck:(BOOL)a6 cloudDevices:(id)a7 transparentData:(id *)a8 loggableDatas:(id *)a9 error:(id *)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[KTContext validateSelfKTRequest:queryRequest:queryResponse:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:transparentData:loggableDatas:error:](self, "validateSelfKTRequest:queryRequest:queryResponse:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:transparentData:loggableDatas:error:", a3, a4, a5, a6, a7, 0, 0, v11, a8, a9, a10);
}

- (void)recordEnrollOptInRecord:(id)a3 accountKey:(id)a4 transparentData:(id)a5 cloudOptIn:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "accountOptInRecord:", a4));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v12, "timestampMs") / 1000.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    v22 = 0;
    v16 = objc_msgSend(v11, "addOptInStateWithURI:smtTimestamp:application:state:error:", v10, v14, v15, objc_msgSend(v13, "optIn"), &v22);
    v17 = v22;

    if ((v16 & 1) == 0)
    {
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023BE98);
      v18 = (void *)qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_toISO_8601_UTCString"));
        *(_DWORD *)buf = 141558786;
        v24 = 1752392040;
        v25 = 2112;
        v26 = v10;
        v27 = 2114;
        v28 = v20;
        v29 = 2112;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update cloud opt-in records for %{mask.hash}@ at %{public}@: %@", buf, 0x2Au);

      }
    }

  }
  else
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BE78);
    v21 = qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558274;
      v24 = 1752392040;
      v25 = 2112;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to find optInOut record during enroll for %{mask.hash}@", buf, 0x16u);
    }
  }

}

- (unint64_t)validateEnrollKTRequest:(id)a3 insertResponse:(id)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 cloudOptIn:(id)a7 error:(id *)a8
{
  id v14;
  unint64_t v15;
  id *v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  void *v25;
  unint64_t v26;
  id v27;
  id *v28;
  id v29;
  unint64_t v30;
  void *v31;
  unsigned __int8 v32;
  id *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id *v38;
  id v39;
  id v40;
  id v41;
  id obj;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t buf[4];
  id v72;

  v14 = a3;
  v39 = a4;
  v40 = a7;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 2;
  v61 = 0;
  v62 = (id *)&v61;
  v63 = 0x3032000000;
  v64 = sub_10001F434;
  v65 = sub_10001F444;
  v66 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_10001F434;
  v59 = sub_10001F444;
  v60 = 0;
  v54 = 0;
  v15 = -[KTContext deserializeServerLoggableDatas:loggableDatas:error:](self, "deserializeServerLoggableDatas:loggableDatas:error:", v14, &v54, a8);
  v41 = v54;
  v68[3] = v15;
  if (v15 == 1)
  {
    v38 = a8;
    v16 = a5;
    v17 = a6;
    v18 = objc_msgSend(v14, "getUnsigned:");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uri"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requestId"));
    v53 = 0;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100021480;
    v44[3] = &unk_10023BF40;
    v50 = &v67;
    v49 = &v61;
    v44[4] = self;
    v21 = v14;
    v45 = v21;
    v22 = v41;
    v46 = v22;
    v52 = v18;
    v47 = v39;
    v48 = v40;
    v51 = &v55;
    v23 = -[KTContext handleInsertResponse:uri:fetchId:error:transparentDataHandler:](self, "handleInsertResponse:uri:fetchId:error:transparentDataHandler:", v47, v19, v20, &v53, v44);
    v24 = v53;

    if (v16)
    {
      v25 = (void *)v56[5];
      if (v25)
        *v16 = objc_retainAutorelease(v25);
    }
    if (v17 && v22)
      *v17 = objc_retainAutorelease(v22);
    if (v23 == 1)
    {
      v26 = v68[3];
    }
    else
    {
      if (v38 && v24)
        *v38 = objc_retainAutorelease(v24);
      v43 = v24;
      v26 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v23, v21, 0, &v43);
      v27 = v43;

      v68[3] = v26;
      v24 = v27;
    }
    if (v26 == 1)
      goto LABEL_19;
    v28 = v62;
    if (v38)
    {
      v29 = v62[5];
      if (v29)
      {
        *v38 = objc_retainAutorelease(v29);
        v26 = v68[3];
        v28 = v62;
      }
    }
    obj = v28[5];
    v30 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v26, v21, 0, &obj);
    objc_storeStrong(v28 + 5, obj);
    v68[3] = v30;
    if (v30 == 1)
LABEL_19:
      objc_msgSend(v21, "setUnsigned:value:", "verificationResult", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v32 = objc_msgSend(v31, "persistAndRefaultObject:error:", v21, v38);

    v33 = v38;
    if ((v32 & 1) == 0)
    {
      if (v38 && *v38)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        objc_msgSend(v34, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("validateEnrollKTRequest"), *v38);

        v33 = v38;
      }
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023BF60);
      v35 = qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
      {
        if (v33)
          v36 = *v33;
        else
          v36 = 0;
        *(_DWORD *)buf = 138412290;
        v72 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "failed to save validate enrollment with response: %@", buf, 0xCu);
      }
    }
    v15 = v68[3];

  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v15;
}

- (id)createQueryRequestForKTRequest:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uri"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildQueryRequest:application:error:", v6, v7, &v12));
  v9 = v12;

  if (v8)
  {
    v10 = v8;
  }
  else if (a4 && v9)
  {
    *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (id)parseQueryRequestFromKTRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryRequest"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](QueryRequest, "parseFromData:error:", v8, a4));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryRequest"));

  if (!v9 || v7)
  {
    if (v7)
    {
      v14 = v7;
      goto LABEL_32;
    }
  }
  else
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BF80);
    v10 = (id)qword_1002A4528;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestId"));
      v12 = (void *)v11;
      if (a4)
        v13 = *a4;
      else
        v13 = 0;
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2112;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "parse saved queryRequest for requestId %{public}@ failed: %@", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "setQueryRequest:", 0);
  objc_msgSend(v6, "setQueryResponse:", 0);
  objc_msgSend(v6, "setServerHint:", 0);
  objc_msgSend(v6, "setUsedReversePush:", 0);
  objc_msgSend(v6, "setResponseTime:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v24 = 0;
  v16 = objc_msgSend(v15, "persistWithError:", &v24);
  v17 = v24;

  if ((v16 & 1) == 0)
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BFA0);
    v18 = qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to remove query request and response for unparseable request: %@", buf, 0xCu);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    objc_msgSend(v19, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("verifyDeviceWitnesses"), v17);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryRequest"));

  if (v20)
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -133, *a4, CFSTR("saved query request failed to decode")));
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BFC0);
    v21 = qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v22 = *a4;
      else
        v22 = 0;
      *(_DWORD *)buf = 138412290;
      v26 = (uint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "saved query request failed to decode: %@", buf, 0xCu);
    }
  }

  v14 = 0;
LABEL_32:

  return v14;
}

- (id)parseQueryResponseFromKTRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryResponse"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryResponse"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](QueryResponse, "parseFromData:error:", v7, a4));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryResponse"));

  if (!v8 || v6)
  {
    if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverHint"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverHint"));
        objc_msgSend(v6, "setMetadataValue:key:", v14, kTransparencyResponseMetadataKeyServerHint);

      }
      if (objc_msgSend(v5, "usedReversePush"))
        objc_msgSend(v6, "setMetadataValue:key:", CFSTR("YES"), CFSTR("APS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "responseTime"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "responseTime"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_dateToString"));
        objc_msgSend(v6, "setMetadataValue:key:", v17, CFSTR("ResponseTime"));

      }
    }
  }
  else
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023BFE0);
    v9 = (id)qword_1002A4528;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestId"));
      v11 = (void *)v10;
      if (a4)
        v12 = *a4;
      else
        v12 = 0;
      v19 = 138543618;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "parse saved queryResponse as query response for requestId %{public}@ failed: %@", (uint8_t *)&v19, 0x16u);

    }
  }

  return v6;
}

- (void)fetchQueryForKTRequest:(id)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v27 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext createQueryRequestForKTRequest:error:](self, "createQueryRequestForKTRequest:error:", v8, &v27));
  v11 = v27;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
    v26 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createFetchRecordForRequestData:request:error:", v13, v8, &v26));
    v15 = v26;

    if (v14)
    {
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023C020);
      v16 = (void *)qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetching query response for requestId %{public}@ with fetchId %{public}@", buf, 0x16u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000224AC;
      v22[3] = &unk_10023C0D0;
      v22[4] = self;
      v23 = v14;
      v25 = v9;
      v24 = v10;
      objc_msgSend(v19, "fetchQuery:uuid:userInitiated:completionHandler:", v24, v23, v6, v22);

    }
    else
    {
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023C000);
      v20 = qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to save query request before fetch: %@", buf, 0xCu);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      objc_msgSend(v21, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("fetchQuery"), v15);

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, v15);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, v11);
    v15 = v11;
  }

}

- (void)fetchQueryForKTRequest:(id)a3 completionHandler:(id)a4
{
  -[KTContext fetchQueryForKTRequest:userInitiated:completionHandler:](self, "fetchQueryForKTRequest:userInitiated:completionHandler:", a3, 1, a4);
}

- (BOOL)peerStaticKeyFallback:(id)a3 accountKey:(id)a4 transparentData:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  OptInOutWithExt *v13;
  void *v14;
  double v15;
  KTTransparentData *v16;
  void *v17;
  KTTransparentData *v18;
  KTAccount *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v10 = -[KTContext validateStaticKeyForPeer:accountKey:error:](self, "validateStaticKeyForPeer:accountKey:error:", v8, v9, &v23);
  v11 = v23;
  if (qword_1002A4520 != -1)
    dispatch_once(&qword_1002A4520, &stru_10023C0F0);
  v12 = qword_1002A4528;
  if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 1024;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "validatePeer static key: %@ result: %d", buf, 0x12u);
  }
  if (!v10)
  {
    v13 = objc_alloc_init(OptInOutWithExt);
    -[OptInOut setOptIn:](v13, "setOptIn:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
    objc_msgSend(v14, "timeIntervalSince1970");
    -[OptInOut setTimestampMs:](v13, "setTimestampMs:", (unint64_t)(v15 * 1000.0));

    v16 = [KTTransparentData alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v18 = -[KTTransparentData initWithUriVRFOutput:](v16, "initWithUriVRFOutput:", v17);

    -[KTTransparentData setStaticKeyEnforced:](v18, "setStaticKeyEnforced:", 1);
    v19 = objc_alloc_init(KTAccount);
    -[KTAccount setAccountKey:](v19, "setAccountKey:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](v19, "optInOutHistory"));
    objc_msgSend(v20, "addObject:", v13);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](v18, "accounts"));
    objc_msgSend(v21, "addObject:", v19);

    if (a5 && v18)
      *a5 = objc_retainAutorelease(v18);

  }
  return v10 == 0;
}

- (void)fetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, unint64_t, id, id, id);
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  void (**v33)(id, unint64_t, id, id, id);
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, unint64_t, id, id, id))a5;
  v37 = 0;
  v10 = -[KTContext unsupported:](self, "unsupported:", &v37);
  v11 = v37;
  v12 = v11;
  if (!v10)
  {
    if (v6)
    {
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023C110);
      v14 = qword_1002A4528;
      if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "client requested fresh KT data", buf, 2u);
      }
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v35 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext parseQueryRequestFromKTRequest:error:](self, "parseQueryRequestFromKTRequest:error:", v8, &v35));
      v17 = v35;

      v34 = v17;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext parseQueryResponseFromKTRequest:error:](self, "parseQueryResponseFromKTRequest:error:", v8, &v34));
      v12 = v34;

      if (v16 && v15)
      {
        if (qword_1002A4520 != -1)
          dispatch_once(&qword_1002A4520, &stru_10023C1B8);
        v18 = (void *)qword_1002A4528;
        if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
          *(_DWORD *)buf = 138543362;
          v39 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Using existing queryResponse in validatePeer for requestId %{public}@", buf, 0xCu);

        }
        v30 = 0;
        v31 = 0;
        v29 = v12;
        v21 = -[KTContext validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:](self, "validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:", v8, v15, v16, &v31, &v30, &v29);
        v22 = v31;
        v23 = v30;
        v24 = v29;

        v9[2](v9, v21, v22, v23, v24);
        v12 = v24;
        goto LABEL_21;
      }
    }
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023C130);
    v25 = (void *)qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEBUG))
    {
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uri"));
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      v40 = 2112;
      v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "fetching query in validatePeer for requestId %{public}@ uri: %@", buf, 0x16u);

    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002308C;
    v32[3] = &unk_10023C198;
    v32[4] = self;
    v33 = v9;
    -[KTContext fetchQueryForKTRequest:completionHandler:](self, "fetchQueryForKTRequest:completionHandler:", v8, v32);

LABEL_21:
    goto LABEL_22;
  }
  v36 = v11;
  -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", 0, v8, 0, &v36);
  v13 = v36;

  v9[2](v9, 0, 0, 0, v13);
  v12 = v13;
LABEL_22:

}

- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v24[8];
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v10 = a4;
  v12 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 2;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_10001F434;
  v47 = sub_10001F444;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_10001F434;
  v41 = sub_10001F444;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10001F434;
  v35 = sub_10001F444;
  v36 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100023738;
  v25[3] = &unk_10023C1E0;
  v27 = &v43;
  v28 = &v37;
  v29 = &v31;
  v30 = &v49;
  v13 = dispatch_semaphore_create(0);
  v26 = v13;
  -[KTContext fetchAndValidatePeerKTRequest:fetchNow:completionHandler:](self, "fetchAndValidatePeerKTRequest:fetchNow:completionHandler:", v12, v10, v25);
  v14 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -168, CFSTR("test timed out waiting for validatePeer")));
    v16 = (void *)v32[5];
    v32[5] = v15;

    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023C200);
    v17 = qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "test timed out waiting for validatePeer", v24, 2u);
    }
    if (a7)
    {
      v18 = (void *)v32[5];
      if (v18)
        *a7 = objc_retainAutorelease(v18);
    }
    v19 = 2;
  }
  else
  {
    if (a5)
    {
      v20 = (void *)v44[5];
      if (v20)
        *a5 = objc_retainAutorelease(v20);
    }
    if (a6)
    {
      v21 = (void *)v38[5];
      if (v21)
        *a6 = objc_retainAutorelease(v21);
    }
    if (a7)
    {
      v22 = (void *)v32[5];
      if (v22)
        *a7 = objc_retainAutorelease(v22);
    }
    v19 = v50[3];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v19;
}

- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 error:(id *)a6
{
  return -[KTContext synchronousFetchAndValidatePeerKTRequest:fetchNow:transparentData:loggableDatas:error:](self, "synchronousFetchAndValidatePeerKTRequest:fetchNow:transparentData:loggableDatas:error:", a3, 0, a4, a5, a6);
}

- (unint64_t)fetchAndValidateEnrollKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;

  v12 = a3;
  v13 = a6;
  if (-[KTContext unsupported:](self, "unsupported:", a7))
  {
    -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", 0, v12, 0, a7);
    v14 = 0;
    goto LABEL_26;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queryResponse"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queryRequest"));

    if (!v17)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queryResponse"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](InsertResponse, "parseFromData:error:", v26, a7));

      if (v18)
      {
        if (qword_1002A4520 != -1)
          dispatch_once(&qword_1002A4520, &stru_10023C2C8);
        v27 = (void *)qword_1002A4528;
        if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
        {
          v28 = v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestId"));
          *(_DWORD *)buf = 138543362;
          v37 = (uint64_t)v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "using existing insertResponse in validateEnrollment for requestId %{public}@", buf, 0xCu);

        }
        v14 = -[KTContext validateEnrollKTRequest:insertResponse:transparentData:loggableDatas:cloudOptIn:error:](self, "validateEnrollKTRequest:insertResponse:transparentData:loggableDatas:cloudOptIn:error:", v12, v18, a4, a5, v13, a7);
        goto LABEL_25;
      }
      if (qword_1002A4520 != -1)
        dispatch_once(&qword_1002A4520, &stru_10023C220);
      v31 = (id)qword_1002A4528;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestId"));
        v33 = (void *)v32;
        if (a7)
          v34 = *a7;
        else
          v34 = 0;
        *(_DWORD *)buf = 138543618;
        v37 = v32;
        v38 = 2112;
        v39 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "parse saved queryResponse as insert response for requestId %{public}@ failed: %@", buf, 0x16u);

      }
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext parseQueryRequestFromKTRequest:error:](self, "parseQueryRequestFromKTRequest:error:", v12, a7));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext parseQueryResponseFromKTRequest:error:](self, "parseQueryResponseFromKTRequest:error:", v12, a7));
  if (v19 && v18)
  {
    if (qword_1002A4520 != -1)
      dispatch_once(&qword_1002A4520, &stru_10023C2A8);
    v20 = (void *)qword_1002A4528;
    if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestId"));
      *(_DWORD *)buf = 138543362;
      v37 = (uint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "using existing queryResponse in validateEnrollment for requestId %{public}@", buf, 0xCu);

    }
    v14 = -[KTContext validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:](self, "validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:", v12, v18, v19, a4, a5, a7);

LABEL_25:
    goto LABEL_26;
  }
  if (qword_1002A4520 != -1)
    dispatch_once(&qword_1002A4520, &stru_10023C240);
  v23 = (void *)qword_1002A4528;
  if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEBUG))
  {
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestId"));
    *(_DWORD *)buf = 138543362;
    v37 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "fetching query in validateEnrollment for requestId %{public}@", buf, 0xCu);

  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100023D40;
  v35[3] = &unk_10023C288;
  v35[4] = self;
  -[KTContext fetchQueryForKTRequest:completionHandler:](self, "fetchQueryForKTRequest:completionHandler:", v12, v35);

  if (a7)
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorUnknown, -134, CFSTR("request to server pending")));
  v14 = 2;
LABEL_26:

  return v14;
}

- (void)validatePeerRequestId:(id)a3 revalidate:(BOOL)a4 fetchNow:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  KTContext *v23;
  id v24;
  BOOL v25;
  BOOL v26;
  id v27;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext validateEventName:application:](KTContext, "validateEventName:application:", 0, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v27 = 0;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1000240E4;
  v22 = &unk_10023C318;
  v25 = a4;
  v23 = self;
  v26 = a5;
  v15 = v10;
  v24 = v15;
  v16 = objc_msgSend(v14, "performAndWaitForRequestId:error:block:", v11, &v27, &v19);

  v17 = v27;
  if ((v16 & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger", v19, v20, v21, v22, v23));
    objc_msgSend(v18, "logResultForEvent:hardFailure:result:", v13, 1, v17);

    (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v17);
  }

}

- (unint64_t)validateEnrollmentRequestId:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v11 = a3;
  v12 = a6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 2;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_10001F434;
  v43 = sub_10001F444;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10001F434;
  v37 = sub_10001F444;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10001F434;
  v31 = sub_10001F444;
  v32 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100024554;
  v21[3] = &unk_10023C340;
  v23 = &v45;
  v24 = &v39;
  v21[4] = self;
  v25 = &v33;
  v14 = v12;
  v22 = v14;
  v26 = &v27;
  LOBYTE(v12) = objc_msgSend(v13, "performAndWaitForRequestId:error:block:", v11, a7, v21);

  if ((v12 & 1) != 0)
  {
    if (a4)
    {
      v15 = (void *)v40[5];
      if (v15)
        *a4 = objc_retainAutorelease(v15);
    }
    if (a5)
    {
      v16 = (void *)v34[5];
      if (v16)
        *a5 = objc_retainAutorelease(v16);
    }
    if (a7)
    {
      v17 = (void *)v28[5];
      if (v17)
        *a7 = objc_retainAutorelease(v17);
    }
    v18 = v46[3];
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v18;
}

- (void)replaySelfValidate:(id)a3 pcsAccountKey:(id)a4 queryRequest:(id)a5 queryResponse:(id)a6 responseTime:(id)a7 completionHandler:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  unsigned __int8 v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void (**v35)(id, uint64_t, id, _QWORD);
  id obj;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v47[4];
  id v48;
  id v49;
  KTContext *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  _BYTE *v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[4];
  id v65;
  __int16 v66;
  id v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];

  v13 = a3;
  v38 = a4;
  v44 = a5;
  v43 = a6;
  v42 = a7;
  v35 = (void (**)(id, uint64_t, id, _QWORD))a8;
  v45 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "syncedLoggableDatas"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyManagedDataStore serializeLoggableDatas:](TransparencyManagedDataStore, "serializeLoggableDatas:", v14));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uriToServerLoggableDatas"));
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v41)
  {
    v37 = *(_QWORD *)v61;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v61 != v37)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "uriToServerLoggableDatas"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v16));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serverLoggableDatas"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyManagedDataStore serializeLoggableDatas:](TransparencyManagedDataStore, "serializeLoggableDatas:", v19));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accountKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "idsResponseTime"));
        v59 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "createRequestWithUri:application:accountKey:serverData:syncedData:idsResponseTime:queryRequest:queryResponse:responseDate:type:clientId:error:", v16, v22, v23, v20, v39, v24, v44, v43, v42, 1, 0, &v59));
        v26 = v59;

        if (qword_1002A4520 != -1)
          dispatch_once(&qword_1002A4520, &stru_10023C360);
        v27 = qword_1002A4528;
        if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "ReplaySelfValidate: created requestId %{public}@ for %@", buf, 0x16u);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v69 = sub_10001F434;
        v70 = sub_10001F444;
        v71 = 0;
        v71 = objc_alloc_init((Class)KTSelfValidationURIDiagnostics);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v58 = 0;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100024C68;
        v47[3] = &unk_10023C3C8;
        v48 = v44;
        v29 = v25;
        v57 = buf;
        v49 = v29;
        v50 = self;
        v51 = v43;
        v52 = v42;
        v53 = v38;
        v54 = v45;
        v55 = v40;
        v56 = v16;
        v30 = objc_msgSend(v28, "performAndWaitForRequestId:error:block:", v29, &v58, v47);
        v31 = v58;

        if ((v30 & 1) == 0)
        {
          if (qword_1002A4520 != -1)
            dispatch_once(&qword_1002A4520, &stru_10023C3E8);
          v32 = qword_1002A4528;
          if (os_log_type_enabled((os_log_t)qword_1002A4528, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 138543618;
            v65 = v29;
            v66 = 2112;
            v67 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "ReplayValidateSelf: failed to find requestId %{public}@: %@", v64, 0x16u);
          }
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setResult:", CFSTR("Failed"));
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setError:", v31);
        }

        _Block_object_dispose(buf, 8);
        v15 = (char *)v15 + 1;
      }
      while (v41 != v15);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v41);
  }

  v33 = objc_alloc_init((Class)KTSelfValidationDiagnostics);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "diagnosticsJsonDictionary"));
  objc_msgSend(v33, "setKtSelfVerificationInfoDiagnosticsJson:", v34);

  objc_msgSend(v33, "setUriToDiagnostics:", v40);
  v35[2](v35, 1, v33, 0);

}

+ (id)validateEventName:(unint64_t)a3 application:(id)a4
{
  id v5;
  const __CFString *v6;
  void *v7;

  v5 = a4;
  if (a3 > 5)
    v6 = CFSTR("ValidateUnknownCompleteEvent");
  else
    v6 = *(&off_10023E3F8 + a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", v6, v5));

  return v7;
}

+ (id)successMetricsKey:(id)a3 validationName:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("days%@Validation-%@"), a4, a3);
}

+ (id)analyticsSuccessNames
{
  if (qword_1002A4590 != -1)
    dispatch_once(&qword_1002A4590, &stru_10023E3B8);
  return (id)qword_1002A4598;
}

+ (id)successMetricsKey:(unint64_t)a3 forApplicationID:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (a3 <= 6 && ((0x77u >> a3) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext successMetricsKey:validationName:](KTContext, "successMetricsKey:validationName:", v5, *(&off_10023E428 + a3)));
  else
    v6 = 0;

  return v6;
}

+ (void)metricsForResult:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 applicationID:(id)a6
{
  void *v9;
  id v10;
  id v11;

  v11 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext successMetricsKey:forApplicationID:](KTContext, "successMetricsKey:forApplicationID:", a4, a6));
  if (v9)
  {
    if (a3)
    {
      v10 = v11;
      if (a3 != 1)
      {
LABEL_7:
        +[KTContext updateReliabilityThreshold:](KTContext, "updateReliabilityThreshold:", v10);
        goto LABEL_8;
      }
      objc_msgSend(v11, "setSuccessNowForPropertyKey:", v9);
    }
    else
    {
      objc_msgSend(v11, "setFailureNowForPropertyKey:", v9);
    }
    v10 = v11;
    goto LABEL_7;
  }
LABEL_8:

}

+ (id)analyticsSelfFlagNames
{
  if (qword_1002A45A0 != -1)
    dispatch_once(&qword_1002A45A0, &stru_10023E3D8);
  return (id)qword_1002A45A8;
}

+ (id)selfStatusFlagMetricsKey:(id)a3 name:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("selfValidation-%@-%@"), a4, a3);
}

- (void)selfValidationURIStatus:(id)a3 transparentData:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  char v26;
  uint64_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  KTContext *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[KTLoggableData isAccountKTCapable:](KTLoggableData, "isAccountKTCapable:", v8);
  v13 = (void *)objc_opt_class(self, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selfStatusFlagMetricsKey:name:", v14, CFSTR("ktCapable")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
  v46 = (void *)v15;
  objc_msgSend(v10, "setNumberProperty:forKey:", v16, v15);

  v18 = (void *)objc_opt_class(self, v17);
  v43 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selfStatusFlagMetricsKey:name:", v19, CFSTR("optIn")));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "verifiedAccountOptInState")));
  v45 = (void *)v20;
  objc_msgSend(v10, "setNumberProperty:forKey:", v21, v20);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  v24 = v22;
  if (!v23)
  {
LABEL_18:

    goto LABEL_19;
  }
  v25 = v23;
  v44 = v10;
  v42 = v9;
  v22 = 0;
  v26 = 0;
  v27 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v25; i = (char *)i + 1)
    {
      if (*(_QWORD *)v48 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "version"));
      if (v30
        && (v31 = (void *)v30,
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "version")),
            v33 = objc_msgSend(v32, "isEqual:", &off_10025BED8),
            v32,
            v31,
            (v33 & 1) == 0))
      {
        if (!v22
          || (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "version")),
              v35 = objc_msgSend(v22, "compare:", v34),
              v34,
              v35 == (id)1))
        {
          v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "version"));

          v22 = (id)v36;
        }
      }
      else
      {
        v26 = 1;
      }
    }
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v25);

  v9 = v42;
  v10 = v44;
  if (v22)
  {
    if ((v26 & 1) != 0)
    {
      v38 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -(uint64_t)objc_msgSend(v22, "intValue")));

      v22 = (id)v38;
    }
    v39 = (void *)objc_opt_class(v43, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](v43, "applicationID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "selfStatusFlagMetricsKey:name:", v40, CFSTR("OV")));

    v10 = v44;
    objc_msgSend(v44, "setNumberProperty:forKey:", v22, v41);

    goto LABEL_18;
  }
LABEL_19:

}

- (void)reportValidationTime:(unint64_t)a3 initialResult:(unint64_t)a4 result:(unint64_t)a5 idsResponseTime:(id)a6
{
  id v8;
  double Current;
  double v10;
  double v11;
  double v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;

  if (a4 == 2 && a5 != 2)
  {
    v8 = a6;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v11 = v10;

    v12 = Current - v11;
    switch(a3)
    {
      case 0uLL:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v14 = CFSTR("ValidatePeerTime");
        break;
      case 1uLL:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v14 = CFSTR("ValidateSelfTime");
        break;
      case 2uLL:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v14 = CFSTR("ValidateEnrollmentTime");
        break;
      case 4uLL:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v14 = CFSTR("PeerV2Time");
        break;
      case 5uLL:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v14 = CFSTR("PeerV2OptInTime");
        break;
      default:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v14 = CFSTR("UnknownTypeTime");
        break;
    }
    v17 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", v14, v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    objc_msgSend(v15, "logMetric:withName:", v16, v17);

  }
}

+ (BOOL)hasAccountMismatch:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "successfulSync", (_QWORD)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)serverLoggableDatasDiagnostics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext smDataStore](self, "smDataStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pushTokenForService:", kKTApplicationIdentifierIDS));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v12);
        v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", (_QWORD)v25));
        if (!v14)
        {

          v23 = 0;
          goto LABEL_14;
        }
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "build"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("b"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "product"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("p"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "version"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("v"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "result")));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("r"));

        if (v6)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID"));
          v21 = objc_msgSend(v20, "isEqualToData:", v6);

        }
        else
        {
          v21 = 0;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("c"));

        objc_msgSend(v7, "addObject:", v15);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
        continue;
      break;
    }
  }

  v23 = v7;
LABEL_14:

  return v23;
}

- (id)analyticsForType:(unint64_t)a3 uri:(id)a4 accountKey:(id)a5 serverLoggableDatas:(id)a6 syncedLoggableDatas:(id)a7 transparentData:(id)a8 responseTime:(id)a9 result:(unint64_t)a10 failure:(id)a11 responseMetadata:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  KTContext *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t String;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  NSNumber *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  id v76;
  KTContext *v78;
  id v79;
  id v80;
  id v81;
  id v82;

  v81 = a4;
  v17 = a5;
  v18 = a6;
  v76 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a11;
  v82 = a12;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v23, "inResetWindow")));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("inResetWindow"));

  v78 = self;
  v25 = self;
  v26 = v17;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](v25, "optInServer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v27, "optInState")));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("selfOptIn"));

  v75 = v20;
  if (v19)
  {
    String = KTOptInGetString(objc_msgSend(v19, "accountOptInState:", v17));
    v30 = (void *)objc_claimAutoreleasedReturnValue(String);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("peerOptIn"));

    v31 = KTOptInGetString(objc_msgSend(v19, "accountEverOptedIn:", v17));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("peerEverOptedIn"));

    v33 = KTOptInGetString(objc_msgSend(v19, "accountRecentlyOptedIn:", v17));
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("peerRecentlyOptedIn"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "staticKeyEnforced")));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v35, CFSTR("staticKeyEnforced"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "expectedSelfResolutionDate:requestDate:", v17, v20));
    v37 = v36;
    if (v36)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "kt_dateToString"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v38, CFSTR("expectedResolutionDate"));

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "kt_toISO_8601_UTCString"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("expectedResolutionDateReadable"));

      objc_msgSend(v37, "timeIntervalSinceNow");
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v40 / 86400.0)));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v41, CFSTR("daysUntilExpectedResolutionDate"));

    }
    if (v17)
    {
      v42 = v18;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getLogDataForAccountKey:uri:", v26, v81));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v81));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "lastObject"));
      v46 = v45;
      if (v45)
      {
        v47 = v21;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v45, "optIn")));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v48, CFSTR("serverOptIn"));

        v21 = v47;
      }

      v18 = v42;
    }

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "earliestAddedDate:", v26));
  v51 = v49;
  if (v49)
  {
    objc_msgSend(v49, "timeIntervalSince1970");
    v53 = (double)(kKTMaximumResetFailureWindowMs + (unint64_t)(v52 * 1000.0));
    +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v54 < v53));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v55, CFSTR("inHeartbeatWindow"));

  }
  v56 = v76;
  if (v76 && !a10)
  {
    v57 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend((id)objc_opt_class(v78, v50), "hasAccountMismatch:", v76));
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v58, CFSTR("mismatchedAccounts"));

  }
  if (v18)
  {
    if (!a10)
    {
      v59 = +[KTLoggableData isAccountKTCapable:](KTLoggableData, "isAccountKTCapable:", v18);
      v60 = v21;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v59));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v61, CFSTR("ktCapable"));

      v21 = v60;
      if ((v59 & 1) == 0 && a3 <= 5 && ((1 << a3) & 0x31) != 0)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ktSoftFailure"));
    }
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics analyticsErrorData:](TransparencyAnalytics, "analyticsErrorData:", v21));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v62, CFSTR("failure"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext serverLoggableDatasDiagnostics:](v78, "serverLoggableDatasDiagnostics:", v18));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v63, CFSTR("sldd"));

  if (a3 == 1 && objc_msgSend(v21, "code") == (id)-286)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v79 = v21;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "numberPropertyForKey:", CFSTR("stateAtSigFetchStart")));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v65, CFSTR("stateAtSigFetchStart"));

    v66 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "numberPropertyForKey:", CFSTR("stateAtSigFetchEnd")));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v67, CFSTR("stateAtSigFetchEnd"));

    v21 = v79;
  }
  if (+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics"))
  {
    v80 = v18;
    if (!a10)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v81, CFSTR("failedUri"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "base64EncodedStringWithOptions:", 0));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v68, CFSTR("failedAccountKey"));

    }
    v69 = v21;
    v70 = kTransparencyResponseMetadataKeyServerHint;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
    if (v71)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v71, v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("APS")));

    if (v72)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v73, CFSTR("APS"));

    }
    v56 = v76;
    v21 = v69;
    v18 = v80;
  }

  return v22;
}

- (id)analyticsForResponse:(id)a3 type:(unint64_t)a4 uri:(id)a5 result:(unint64_t)a6 ktCapable:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "inResetWindow")));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("inResetWindow"));

  if (a6)
  {
    +[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics");
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("ktCapable"));

    if (!v7 && a4 <= 5 && ((1 << a4) & 0x31) != 0)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ktSoftFailure"));
    if (+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics"))objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("failedUri"));
  }
  v18 = kTransparencyResponseMetadataKeyServerHint;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
  if (v19)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("APS")));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("APS"));

  }
  return v14;
}

+ (void)checkAndLogHardErrorIfNecessary:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 error:(id)a6 applicationID:(id)a7
{
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;

  v15 = a5;
  v11 = a6;
  v12 = a7;
  if (a4 == 1)
  {
    if (a3)
    {
      v13 = a3;
      v14 = v15;
LABEL_6:
      +[KTContext metricsForResult:type:logger:applicationID:](KTContext, "metricsForResult:type:logger:applicationID:", v13, 6, v14, v12);
      goto LABEL_7;
    }
    if (!+[KTContext checkNetworkError:](KTContext, "checkNetworkError:", v11))
    {
      v13 = 0;
      v14 = v15;
      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (BOOL)checkNetworkError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v4 = a3;
  v6 = objc_opt_class(NSError, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v13 = 0;
    goto LABEL_18;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v7, "isEqual:", kTransparencyErrorNetwork))
    goto LABEL_15;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v8, "isEqual:", NSURLErrorDomain))
  {
LABEL_14:

LABEL_15:
LABEL_16:
    v13 = 1;
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v9, "isEqual:", kCFErrorDomainCFNetwork))
  {
LABEL_13:

    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v10, "isEqual:", kTransparencyErrorInternal) && objc_msgSend(v4, "code") == (id)-343)
  {
LABEL_12:

    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v11, "isEqual:", kTransparencyErrorInterface) && objc_msgSend(v4, "code") == (id)-41)
  {
LABEL_11:

    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if ((objc_msgSend(v12, "isEqual:", kTransparencyErrorIDSRegistrationTimeout) & 1) != 0)
  {

    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v16 = objc_msgSend(v15, "isEqual:", kTransparencyErrorBAACertFetch);

  if ((v16 & 1) != 0)
    goto LABEL_16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if ((objc_msgSend(a1, "checkNetworkError:", v18) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSMultipleUnderlyingErrorsKey));

    v22 = objc_opt_class(NSArray, v21);
    if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v23 = v20;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v30;
        while (2)
        {
          v27 = 0;
          v28 = v18;
          do
          {
            if (*(_QWORD *)v30 != v26)
              objc_enumerationMutation(v23);
            v18 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v27);

            if ((objc_msgSend(a1, "checkNetworkError:", v18, (_QWORD)v29) & 1) != 0)
            {
              v13 = 1;
              goto LABEL_34;
            }
            v27 = (char *)v27 + 1;
            v28 = v18;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v25)
            continue;
          break;
        }
      }

      v13 = 0;
      v18 = 0;
LABEL_34:

    }
    else
    {
      v13 = 0;
    }

  }
LABEL_18:

  return v13;
}

+ (BOOL)hasReachedReliabilityThreshold:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = reliabilityKey;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberPropertyForKey:", v3));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberPropertyForKey:", reliabilityVersionKey));
  v8 = objc_msgSend(v7, "longValue");
  v9 = ktReliabilityAnalyticsVersion;

  if ((uint64_t)v8 >= v9)
    return v6;
  else
    return 0;
}

+ (BOOL)isCurrentlyReliable:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;

  v3 = kKTApplicationIdentifierIDS;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext successMetricsKey:forApplicationID:](KTContext, "successMetricsKey:forApplicationID:", 1, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext successMetricsKey:forApplicationID:](KTContext, "successMetricsKey:forApplicationID:", 4, v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fuzzyTimeSinceLastSuccess:", v5));
  v8 = objc_msgSend(v7, "longValue");
  v9 = ktSelfValidateSuccessDays;

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fuzzyTimeSinceLastSuccess:", v6));
  v11 = objc_msgSend((id)v10, "longValue");
  v12 = ktPeerValidateSuccessDays;

  LODWORD(v10) = objc_msgSend(v4, "manateeStatusForReporting");
  v13 = (v10 < 0x18) & (0x804001u >> v10);
  if ((uint64_t)v11 < v12)
    LOBYTE(v13) = 0;
  if ((uint64_t)v8 >= v9)
    v14 = v13;
  else
    v14 = 0;

  return v14;
}

+ (void)updateReliabilityThreshold:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (!+[KTContext hasReachedReliabilityThreshold:](KTContext, "hasReachedReliabilityThreshold:")
    && +[KTContext isCurrentlyReliable:](KTContext, "isCurrentlyReliable:", v4))
  {
    objc_msgSend(v4, "setNumberProperty:forKey:", &__kCFBooleanTrue, reliabilityKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", ktReliabilityAnalyticsVersion));
    objc_msgSend(v4, "setNumberProperty:forKey:", v3, reliabilityVersionKey);

  }
}

- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  id v28;
  _QWORD v29[7];
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;

  v27 = a4;
  v11 = a3;
  v12 = a5;
  v28 = a6;
  v13 = (void (**)(id, void *, id))a7;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uri"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "application")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v16));
    v47 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getLatestSuccessfulSingleQueryForUri:application:requestYoungerThan:error:", v15, v17, v12, &v47));
    v19 = v47;

    if (v18)
    {
      v13[2](v13, v18, v19);

      goto LABEL_14;
    }

  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_100054978;
  v45 = sub_100054988;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100054978;
  v39 = sub_100054988;
  v40 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100054990;
  v30[3] = &unk_10023F050;
  v33 = &v35;
  v30[4] = self;
  v21 = v11;
  v31 = v21;
  v32 = v28;
  v34 = &v41;
  objc_msgSend(v20, "performBlockAndWait:", v30);

  if (v36[5] && !v42[5])
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
    v26 = v36[5];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100054A44;
    v29[3] = &unk_10023F0B8;
    v29[5] = &v41;
    v29[6] = &v35;
    v29[4] = self;
    objc_msgSend(v25, "fetchQuery:uuid:userInitiated:completionHandler:", v21, v26, v27, v29);

    v13[2](v13, (void *)v36[5], (id)v42[5]);
  }
  else
  {
    if (qword_1002A4610 != -1)
      dispatch_once(&qword_1002A4610, &stru_10023F070);
    v22 = qword_1002A4618;
    if (os_log_type_enabled((os_log_t)qword_1002A4618, OS_LOG_TYPE_ERROR))
    {
      v23 = v42[5];
      *(_DWORD *)buf = 138412290;
      v49 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to save single query rpc before fetch: %@", buf, 0xCu);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    objc_msgSend(v24, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("fetchRPCSingleQuery"), v42[5]);

    v13[2](v13, 0, (id)v42[5]);
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

LABEL_14:
}

- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6
{
  -[KTContext fetchRPCSingleQuery:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:](self, "fetchRPCSingleQuery:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id *v23;
  void *v24;
  void (**v25)(id, _QWORD);
  _BOOL4 v26;
  id v27;
  id v28;
  id obj;
  _QWORD v30[6];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];

  v26 = a4;
  v11 = a3;
  v28 = a5;
  v27 = a6;
  v25 = (void (**)(id, _QWORD))a7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100054978;
  v41 = sub_100054988;
  v42 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v18 = (id *)(v38 + 5);
        v32 = (id)v38[5];
        v19 = objc_msgSend(v16, "hasPendingSingleQueryForUri:application:error:", v15, v17, &v32);
        objc_storeStrong(v18, v32);

        if (v19)
        {
          if (qword_1002A4610 != -1)
            dispatch_once(&qword_1002A4610, &stru_10023F0D8);
          v20 = qword_1002A4618;
          if (os_log_type_enabled((os_log_t)qword_1002A4618, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 141558274;
            v44 = 1752392040;
            v45 = 2112;
            v46 = v15;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "queryForUris: skipping fetch for %{mask.hash}@ due to existing pending query", buf, 0x16u);
          }
        }
        else
        {
          if (qword_1002A4610 != -1)
            dispatch_once(&qword_1002A4610, &stru_10023F0F8);
          v21 = qword_1002A4618;
          if (os_log_type_enabled((os_log_t)qword_1002A4618, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 141558274;
            v44 = 1752392040;
            v45 = 2112;
            v46 = v15;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "queryForUris: fetching rpc for uri %{mask.hash}@", buf, 0x16u);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
          v23 = (id *)(v38 + 5);
          v31 = (id)v38[5];
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildQueryRequest:application:error:", v15, v22, &v31));
          objc_storeStrong(v23, v31);

          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1000551AC;
          v30[3] = &unk_10023F160;
          v30[4] = v15;
          v30[5] = &v37;
          -[KTContext fetchRPCSingleQuery:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:](self, "fetchRPCSingleQuery:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:", v24, v26, v28, v27, v30);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v12);
  }

  v25[2](v25, v38[5]);
  _Block_object_dispose(&v37, 8);

}

- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6
{
  -[KTContext queryForUris:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:](self, "queryForUris:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)optInStateForUri:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _BYTE buf[12];
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication addApplicationPrefixForIdentifier:uri:](TransparencyApplication, "addApplicationPrefixForIdentifier:uri:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v23 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildQueryRequest:application:error:", v9, v10, &v23));
  v12 = v23;

  if (v11)
  {
    if (qword_1002A4610 != -1)
      dispatch_once(&qword_1002A4610, &stru_10023F1A0);
    v13 = qword_1002A4618;
    if (os_log_type_enabled((os_log_t)qword_1002A4618, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 141558274;
      *(_QWORD *)&buf[4] = 1752392040;
      v25 = 2112;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "optInStateForUri: querying KT server opt-in state for %{mask.hash}@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100055758;
    v18[3] = &unk_10023F250;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v7;
    v19 = v11;
    v16 = v14;
    v20 = v16;
    objc_msgSend(v15, "fetchQuery:uuid:userInitiated:completionHandler:", v19, v16, 0, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_1002A4610 != -1)
      dispatch_once(&qword_1002A4610, &stru_10023F180);
    v17 = qword_1002A4618;
    if (os_log_type_enabled((os_log_t)qword_1002A4618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "optInStateForUri: failed to check opt-in, no query request: %@", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t, id))v7 + 2))(v7, 2, v12);
  }

}

+ (id)chunkArray:(id)a3 chunkSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)objc_msgSend(v5, "count") / a4 + 1));
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = objc_msgSend(v6, "count");
        if ((unint64_t)v10 + v8 >= a4)
          v11 = a4;
        else
          v11 = (unint64_t)v10 + v8;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v9, v11));
        objc_msgSend(v7, "addObject:", v12);

        v9 += a4;
        v8 -= a4;
      }
      while (v9 < (unint64_t)objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v13));

  }
  return v7;
}

- (BOOL)verifyInclusionProofDownload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100064A5C;
  v24 = sub_100064A6C;
  v25 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100064A74;
  v15[3] = &unk_10023FFC0;
  v17 = &v26;
  v18 = &v20;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  v9 = objc_msgSend(v7, "performAndWaitForDownloadId:error:block:", v8, &v19, v15);
  v10 = v19;

  if ((v9 & 1) != 0)
  {
    if (a4)
    {
      v11 = (void *)v21[5];
      if (v11)
        *a4 = objc_retainAutorelease(v11);
    }
    v12 = *((_BYTE *)v27 + 24) != 0;
  }
  else
  {
    if (qword_1002A4630 != -1)
      dispatch_once(&qword_1002A4630, &stru_10023FFE0);
    v13 = qword_1002A4638;
    if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      v32 = 2112;
      v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to fetch download record for downloadId %{public}@: %@", buf, 0x16u);
    }
    v12 = 0;
    if (a4 && v10)
    {
      v12 = 0;
      *a4 = objc_retainAutorelease(v10);
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)verifyInclusionProofDownloadRecord:(id)a3 error:(id *)a4
{
  id v6;
  RevisionLogInclusionProofResponse *v7;
  void *v8;
  RevisionLogInclusionProofResponse *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = [RevisionLogInclusionProofResponse alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
  v9 = -[TransparencyGPBMessage initWithData:error:](v7, "initWithData:error:", v8, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverHint"));
  -[RevisionLogInclusionProofResponse setMetadataValue:key:](v9, "setMetadataValue:key:", v10, kTransparencyResponseMetadataKeyServerHint);

  if (!v9)
  {
    if (qword_1002A4630 != -1)
      dispatch_once(&qword_1002A4630, &stru_100240020);
    v14 = qword_1002A4638;
    if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v15 = *a4;
      else
        v15 = 0;
      *(_DWORD *)buf = 138412290;
      v24 = (uint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "response failed to parse: %@", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if (-[RevisionLogInclusionProofResponse status](v9, "status") != 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, (int)-[RevisionLogInclusionProofResponse status](v9, "status"), CFSTR("server failed to produce inclusion proof: %d"), -[RevisionLogInclusionProofResponse status](v9, "status")));
    v17 = v16;
    if (a4 && v16)
      *a4 = objc_retainAutorelease(v16);

    goto LABEL_24;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
  v12 = objc_msgSend(v11, "verifyRevisionLogInclusionProofResponse:receivedRevisions:error:", v9, 0, a4);

  if ((v12 & 1) == 0)
  {
    if (qword_1002A4630 != -1)
      dispatch_once(&qword_1002A4630, &stru_100240000);
    v18 = (id)qword_1002A4638;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
      v20 = (void *)v19;
      if (a4)
        v21 = *a4;
      else
        v21 = 0;
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Inclusion proof response verification failed for %{public}@: %@", buf, 0x16u);

    }
LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  v13 = 1;
LABEL_25:

  return v13;
}

- (unint64_t)verifyConsistencyProofDownload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100064A5C;
  v24 = sub_100064A6C;
  v25 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000653D4;
  v15[3] = &unk_10023FFC0;
  v17 = &v26;
  v18 = &v20;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  v9 = objc_msgSend(v7, "performAndWaitForDownloadId:error:block:", v8, &v19, v15);
  v10 = v19;

  if ((v9 & 1) != 0)
  {
    if (a4)
    {
      v11 = (void *)v21[5];
      if (v11)
        *a4 = objc_retainAutorelease(v11);
    }
    v12 = v27[3];
  }
  else
  {
    if (qword_1002A4630 != -1)
      dispatch_once(&qword_1002A4630, &stru_1002400A0);
    v13 = qword_1002A4638;
    if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      v32 = 2112;
      v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to fetch download record for downloadId %{public}@: %@", buf, 0x16u);
    }
    v12 = 0;
    if (a4 && v10)
    {
      v12 = 0;
      *a4 = objc_retainAutorelease(v10);
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (unint64_t)verifyConsistencyProofDownloadRecord:(id)a3 error:(id *)a4
{
  id v6;
  ConsistencyProofResponse *v7;
  void *v8;
  ConsistencyProofResponse *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = [ConsistencyProofResponse alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
  v9 = -[TransparencyGPBMessage initWithData:error:](v7, "initWithData:error:", v8, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverHint"));
  -[ConsistencyProofResponse setMetadataValue:key:](v9, "setMetadataValue:key:", v10, kTransparencyResponseMetadataKeyServerHint);

  if (v9)
  {
    if (-[ConsistencyProofResponse status](v9, "status") == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
      v12 = objc_msgSend(v11, "verifyConsistencyProofResponse:startRevision:receivedRevisions:error:", v9, objc_msgSend(v6, "startSLHRevision"), 0, a4);

      if (v12)
        goto LABEL_27;
      if (qword_1002A4630 != -1)
        dispatch_once(&qword_1002A4630, &stru_1002400C0);
      v13 = (id)qword_1002A4638;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        v15 = (void *)v14;
        if (a4)
          v16 = *a4;
        else
          v16 = 0;
        *(_DWORD *)buf = 138543618;
        v29 = v14;
        v30 = 2112;
        v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Consistency proof response verification failed for %{public}@: %@", buf, 0x16u);

      }
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, (int)-[ConsistencyProofResponse status](v9, "status"), CFSTR("server failed to produce consistency proof: %d"), -[ConsistencyProofResponse status](v9, "status")));
      v13 = v19;
      if (a4 && v19)
        *a4 = objc_retainAutorelease(v19);
      if (qword_1002A4630 != -1)
        dispatch_once(&qword_1002A4630, &stru_1002400E0);
      v20 = (void *)qword_1002A4638;
      if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = -[ConsistencyProofResponse status](v9, "status");
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "server failed to produce consistency proof: %d", buf, 8u);

      }
    }

  }
  else
  {
    if (qword_1002A4630 != -1)
      dispatch_once(&qword_1002A4630, &stru_100240100);
    v17 = qword_1002A4638;
    if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v18 = *a4;
      else
        v18 = 0;
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "response failed to parse: %@", buf, 0xCu);
    }
  }
  v12 = 0;
LABEL_27:
  if (qword_1002A4630 != -1)
    dispatch_once(&qword_1002A4630, &stru_100240120);
  v22 = (void *)qword_1002A4638;
  if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadId"));
    *(_DWORD *)buf = 138543362;
    v29 = (uint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "deleting download record %{public}@", buf, 0xCu);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadId"));
  objc_msgSend(v25, "deleteDownloadId:", v26);

  return (unint64_t)v12;
}

- (id)retrieveTLTSTH:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Gossip *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v6 = kKTApplicationIdentifierTLT;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "latestConsistencyVerifiedTreeHeadSTH:logBeginMs:error:", v6, objc_msgSend(v7, "tltLogBeginningMs"), a3));

  if (v8)
  {
    v9 = objc_alloc_init(Gossip);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
    -[Gossip setVersion:](v9, "setVersion:", objc_msgSend(v10, "tltEarliestVersion"));

    -[Gossip setSth:](v9, "setSth:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v9, "data"));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)parseSTHData:(id)a3 error:(id *)a4
{
  return +[SignedObjectHolder parseFromData:error:](SignedLogHead, "parseFromData:error:", a3, a4);
}

- (void)analyticsForDecodeFailure:(id)a3 error:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = kKTApplicationIdentifierTLT;
  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("GossipDecodeMessageFailure"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v6, "logResultForEvent:hardFailure:result:", v7, 1, v5);

}

- (void)analyticsForUnsupportedProtocol:(int)a3 expected:(int)a4 sth:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = kTransparencyErrorGossip;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unsupported protocol version, message version %d, expected version: %d, sth: %@"), *(_QWORD *)&a3, *(_QWORD *)&a4, a5));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v5, -276, CFSTR("%@"), v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("GossipUnsupportedProtocol"), kKTApplicationIdentifierTLT));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v8, "logResultForEvent:hardFailure:result:", v7, 1, v9);

}

- (void)analyticsForParseFailure:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = kKTApplicationIdentifierTLT;
  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("GossipParseFailure"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", v6, 1, v4);

}

- (void)analyticsForPredateLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = kTransparencyErrorGossip;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("STH predates our TLT's LogBeginningMs, gossiped loghead logBeginningMs %llu, expected logBeginningMs: %llu, sth: %@"), a3, a4, a5));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v5, -277, CFSTR("%@"), v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("GossipOldLogBeginningMS"), kKTApplicationIdentifierTLT));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v8, "logResultForEvent:hardFailure:result:", v7, 1, v9);

}

- (void)analyticsForTooNewLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = kTransparencyErrorGossip;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received gossip from a newer client.  Gossiped logBeginningsMs: %llu, client logBeginningsMs: %llu"), a4, a5, a3, a4));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v5, -279, CFSTR("%@"), v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("GossipLogBeginningMSTooNew"), kKTApplicationIdentifierTLT));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v8, "logResultForEvent:hardFailure:result:", v7, 1, v9);

}

- (void)processSTHsFromPeers:(id)a3 verifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void **p_cache;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  void *v25;
  id v26;
  void *v27;
  signed int v28;
  void *v29;
  signed int v30;
  void *v31;
  NSObject *v32;
  unsigned int v33;
  void *v34;
  unsigned int v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  int v89;
  id v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  _BYTE v98[10];
  _BYTE v99[10];
  void *v100;
  NSErrorUserInfoKey v101;
  const __CFString *v102;
  _BYTE v103[128];

  v8 = a3;
  v81 = a4;
  v80 = a5;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    p_cache = TransparencyGPBUnknownField.cache;
    v14 = *(_QWORD *)v94;
    v89 = kTransparencyProtocolVersion;
    v84 = kTransparencyErrorGossip;
    v87 = v9;
    v88 = *(_QWORD *)v94;
    while (1)
    {
      v15 = 0;
      do
      {
        v16 = v12;
        if (*(_QWORD *)v94 != v14)
          objc_enumerationMutation(v9);
        v17 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v15);
        v18 = objc_alloc((Class)(p_cache + 443));
        v92 = v12;
        v19 = objc_msgSend(v18, "initWithData:error:", v17, &v92);
        v12 = v92;

        if (v19)
          v20 = v12 == 0;
        else
          v20 = 0;
        if (v20)
        {
          if ((int)objc_msgSend(v19, "version") <= v89)
          {
            v28 = objc_msgSend(v19, "version");
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
            v30 = objc_msgSend(v29, "tltEarliestVersion");

            if (v28 >= v30)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
              v91 = 0;
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext parseSTHData:error:](self, "parseSTHData:error:", v41, &v91));
              v43 = v91;

              if (v42 && !v43)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "parsedLogHead"));
                v45 = v44;
                if (v44)
                {
                  v46 = objc_msgSend(v44, "logBeginningMs");
                  v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                  v48 = objc_msgSend(v47, "tltLogBeginningMs");

                  if (v46 < v48)
                  {
                    if (qword_1002A4630 != -1)
                      dispatch_once(&qword_1002A4630, &stru_1002401E0);
                    v85 = v42;
                    v49 = (void *)qword_1002A4638;
                    if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
                    {
                      v50 = v49;
                      v83 = objc_msgSend(v45, "logBeginningMs");
                      v51 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                      v52 = objc_msgSend(v51, "tltLogBeginningMs");
                      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
                      *(_DWORD *)buf = 134218498;
                      *(_QWORD *)v98 = v83;
                      *(_WORD *)&v98[8] = 2048;
                      *(_QWORD *)v99 = v52;
                      *(_WORD *)&v99[8] = 2112;
                      v100 = v53;
                      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "STH predates our TLT's LogBeginningMs, gossiped loghead logBeginningMs %llu, expected logBeginningMs: %llu, sth: %@", buf, 0x20u);

                    }
                    v54 = objc_msgSend(v45, "logBeginningMs");
                    v55 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                    v56 = objc_msgSend(v55, "tltLogBeginningMs");
                    v57 = v45;
                    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
                    -[KTContext analyticsForPredateLogBeginningMs:expectedLogBeginningMS:sth:](self, "analyticsForPredateLogBeginningMs:expectedLogBeginningMS:sth:", v54, v56, v58);

                    v45 = v57;
                    v43 = 0;
                    v9 = v87;
                    p_cache = (void **)(TransparencyGPBUnknownField + 16);
                    v42 = v85;
LABEL_54:

LABEL_55:
                    v14 = v88;
                    goto LABEL_56;
                  }
                  v86 = v45;
                  v62 = objc_msgSend(v45, "logBeginningMs");
                  v63 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                  v64 = objc_msgSend(v63, "tltLogBeginningMs");

                  if (v62 <= v64)
                  {
                    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
                    objc_msgSend(v82, "addObject:", v76);

                    v43 = 0;
                    v9 = v87;
                    p_cache = (void **)(TransparencyGPBUnknownField + 16);
                    v45 = v86;
                    goto LABEL_54;
                  }
                  if (qword_1002A4630 != -1)
                    dispatch_once(&qword_1002A4630, &stru_100240200);
                  v65 = (void *)qword_1002A4638;
                  if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_INFO))
                  {
                    v66 = v65;
                    v67 = objc_msgSend(v86, "logBeginningMs");
                    v68 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                    v69 = objc_msgSend(v68, "tltLogBeginningMs");
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v98 = v67;
                    *(_WORD *)&v98[8] = 2048;
                    *(_QWORD *)v99 = v69;
                    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Received gossip from a newer client.  Gossiped logBeginningsMs: %llu, client logBeginningsMs: %llu", buf, 0x16u);

                  }
                  v70 = objc_msgSend(v86, "logBeginningMs");
                  v71 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                  v72 = objc_msgSend(v71, "tltLogBeginningMs");
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
                  -[KTContext analyticsForTooNewLogBeginningMs:expectedLogBeginningMS:sth:](self, "analyticsForTooNewLogBeginningMs:expectedLogBeginningMS:sth:", v70, v72, v73);

                  v74 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "signedObject"));
                  objc_msgSend(v74, "checkHeadEpoch:", v75);

                  v45 = v86;
                  v43 = 0;
                }
                else
                {
                  if (qword_1002A4630 != -1)
                    dispatch_once(&qword_1002A4630, &stru_1002401C0);
                  v60 = qword_1002A4638;
                  if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v98 = 0;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Failed to parse gossiped sth loghead: %@", buf, 0xCu);
                  }
                  v101 = NSLocalizedDescriptionKey;
                  v102 = CFSTR("Failed to parse gossiped sth loghead");
                  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1));
                  v43 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v84, -278, v61));

                  -[KTContext analyticsForParseFailure:](self, "analyticsForParseFailure:", v43);
                }
                v9 = v87;
                p_cache = (void **)(TransparencyGPBUnknownField + 16);
                goto LABEL_54;
              }
              if (qword_1002A4630 != -1)
                dispatch_once(&qword_1002A4630, &stru_1002401A0);
              v59 = qword_1002A4638;
              if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v98 = v43;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Failed to parse gossiped sth signedLogHead: %@", buf, 0xCu);
              }
              -[KTContext analyticsForParseFailure:](self, "analyticsForParseFailure:", v43);
              goto LABEL_55;
            }
            if (qword_1002A4630 != -1)
              dispatch_once(&qword_1002A4630, &stru_100240180);
            v14 = v88;
            v31 = (void *)qword_1002A4638;
            if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
            {
              v32 = v31;
              v33 = objc_msgSend(v19, "version");
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
              v35 = objc_msgSend(v34, "tltEarliestVersion");
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v98 = v33;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = v35;
              *(_WORD *)v99 = 2112;
              *(_QWORD *)&v99[2] = v36;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unsupported protocol version, message version %d, expected version: %d, sth: %@", buf, 0x18u);

              v14 = v88;
            }
            v37 = objc_msgSend(v19, "version");
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
            v39 = objc_msgSend(v38, "tltEarliestVersion");
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
            -[KTContext analyticsForUnsupportedProtocol:expected:sth:](self, "analyticsForUnsupportedProtocol:expected:sth:", v37, v39, v40);

            v9 = v87;
            p_cache = (void **)(TransparencyGPBUnknownField + 16);
          }
          else
          {
            if (qword_1002A4630 != -1)
              dispatch_once(&qword_1002A4630, &stru_100240160);
            v22 = (void *)qword_1002A4638;
            if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
            {
              v23 = v22;
              v24 = objc_msgSend(v19, "version");
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v98 = v24;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = v89;
              *(_WORD *)v99 = 2112;
              *(_QWORD *)&v99[2] = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Unsupported protocol version, message version %d, expected version: %d, sth: %@", buf, 0x18u);

              v14 = v88;
            }
            v26 = objc_msgSend(v19, "version");
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sth"));
            -[KTContext analyticsForUnsupportedProtocol:expected:sth:](self, "analyticsForUnsupportedProtocol:expected:sth:", v26, v89, v27);

          }
        }
        else
        {
          if (qword_1002A4630 != -1)
            dispatch_once(&qword_1002A4630, &stru_100240140);
          v21 = qword_1002A4638;
          if (os_log_type_enabled((os_log_t)qword_1002A4638, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v98 = v12;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to inflate Gossip message %@", buf, 0xCu);
          }
          -[KTContext analyticsForDecodeFailure:error:](self, "analyticsForDecodeFailure:error:", v19, v12);
        }
LABEL_56:

        v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      if (!v11)
        goto LABEL_60;
    }
  }
  v12 = 0;
LABEL_60:

  if (objc_msgSend(v82, "count")
    && (v77 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier")),
        v90 = 0,
        objc_msgSend(v77, "processSTHsFromGossipPeers:verifier:error:", v82, v81, &v90),
        v78 = v90,
        v77,
        v78))
  {
    v79 = v80;
    (*((void (**)(id, id))v80 + 2))(v80, v78);

  }
  else
  {
    v79 = v80;
    (*((void (**)(id, _QWORD))v80 + 2))(v80, 0);
  }

}

- (void)writeResult:(id)a3 verification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  KTLoggableDataArray *v13;
  void *v14;
  KTLoggableDataArray *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "succeed") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsResponseTime"));
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = v9;
    v11 = (double)kKTMaximumMergeDelayMs / -1000.0;

    if (v10 < v11)
      objc_msgSend(v6, "setSucceed:", 0);
  }
  objc_msgSend(v7, "setUnsigned:value:", "verificationResult", objc_msgSend(v6, "succeed"));
  if (objc_msgSend(v6, "succeed") != (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loggableDatas"));

    if (v12)
    {
      v13 = [KTLoggableDataArray alloc];
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loggableDatas"));
      v15 = -[KTLoggableDataArray initWithLoggableDatas:](v13, "initWithLoggableDatas:", v14);
      objc_msgSend(v7, "setServerLoggableDatas:", v15);

    }
    objc_msgSend(v7, "setOptedIn:", objc_msgSend(v6, "optedIn"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failure"));
    objc_msgSend(v7, "setFailure:", v16);

    objc_msgSend(v7, "setUnsigned:value:", "staticKeyStatus", objc_msgSend(v6, "staticAccountKeyStatus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerState"));
    objc_msgSend(v17, "setEverCompletedVerification:", 1);
    if (objc_msgSend(v6, "optInTernaryState") != (id)2)
      objc_msgSend(v17, "setOptedIn:", objc_msgSend(v6, "optedIn"));
    if (objc_msgSend(v6, "optInTernaryState") == (id)1)
    {
      if (objc_msgSend(v17, "everOptedIn") && objc_msgSend(v17, "turnedOffIgnored"))
        objc_msgSend(v17, "setTurnedOffIgnored:", 0);
      objc_msgSend(v17, "setEverOptedIn:", 1);
    }
    if (objc_msgSend(v17, "setCompletedVerification:", v7))
    {
      if (qword_1002A4640 != -1)
        dispatch_once(&qword_1002A4640, &stru_100240220);
      v18 = (void *)qword_1002A4648;
      if (os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uri"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "application"));
        *(_DWORD *)buf = 138412546;
        v35 = v20;
        v36 = 2112;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Updated cached verifications for uri: %@ application: %@", buf, 0x16u);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext contextStore](self, "contextStore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uri"));
      v33 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "application"));
      objc_msgSend(v22, "handlePeerStateChange:application:", v24, v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v32 = 0;
    v27 = objc_msgSend(v26, "persistWithError:", &v32);
    v28 = v32;

    if ((v27 & 1) == 0)
    {
      if (qword_1002A4640 != -1)
        dispatch_once(&qword_1002A4640, &stru_100240240);
      v29 = (void *)qword_1002A4648;
      if (os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "verificationId"));
        *(_DWORD *)buf = 138543618;
        v35 = v31;
        v36 = 2112;
        v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "failed to persist IDSKTVerification results for id %{public}@: %@", buf, 0x16u);

      }
    }

  }
}

- (void)validatePeerIDSKTVerification:(id)a3 singleQuery:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void (**v39)(id, _QWORD);
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  KTContext *v44;
  id v45;
  __int128 *p_buf;
  uint64_t *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v8 = a3;
  v9 = a4;
  v39 = (void (**)(id, _QWORD))a5;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_100067720;
  v57 = sub_100067730;
  v58 = 0;
  v58 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverLoggableDatas"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v54[5], "loggableDatas"));
  v11 = +[KTLoggableData isAccountKTCapable:](KTLoggableData, "isAccountKTCapable:", v10);

  v52 = 0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getQueryRequest:", &v52));
  v12 = v52;
  v51 = v12;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getQueryResponse:", &v51));
  v13 = v51;

  if (v41 && v40)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
    v50 = 0;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getAggregateOptInState:", &v50));
    v15 = v50;

    if (v38)
    {
      if (objc_msgSend(v38, "state") == (id)1)
        v16 = 5;
      else
        v16 = 4;
    }
    else
    {
      if (qword_1002A4640 != -1)
        dispatch_once(&qword_1002A4640, &stru_100240260);
      v22 = qword_1002A4648;
      if (os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "getAggregateOptInState: %@", (uint8_t *)&buf, 0xCu);
      }
      v16 = 4;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v60 = 0x3032000000;
    v61 = sub_100067720;
    v62 = sub_100067730;
    v63 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "responseTime"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "verificationId"));
    v49 = v13;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100067768;
    v42[3] = &unk_100240308;
    p_buf = &buf;
    v25 = v8;
    v43 = v25;
    v44 = self;
    v47 = &v53;
    v48 = v16;
    v45 = v40;
    v26 = -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:](self, "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:", v45, v41, v23, v24, v16, v11, &v49, v42);
    v27 = v49;

    v13 = v27;
    v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    if (v28)
      goto LABEL_22;
    if (!v26)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rpcId"));
      objc_msgSend(v29, "failRpcId:failure:error:", v30, v13, 0);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    if (objc_msgSend(v31, "isEqual:", kTransparencyErrorServer))
    {
      v32 = objc_msgSend(v13, "code") == (id)7;

      if (v32)
        goto LABEL_21;
    }
    else
    {

    }
    v26 = 2;
LABEL_21:
    v33 = objc_alloc((Class)KTVerifierResult);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uri"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "application"));
    v36 = objc_msgSend(v33, "initWithUri:application:ktResult:failure:", v34, v35, v26, v13);
    v37 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v36;

    v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
LABEL_22:
    -[KTContext writeResult:verification:](self, "writeResult:verification:", v28, v25);
    v39[2](v39, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

    _Block_object_dispose(&buf, 8);
    goto LABEL_23;
  }
  v17 = objc_alloc((Class)KTVerifierResult);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uri"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
  v15 = objc_msgSend(v17, "initWithUri:application:ktResult:failure:", v18, v19, 2, v13);

  -[KTContext writeResult:verification:](self, "writeResult:verification:", v15, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rpcId"));
  objc_msgSend(v20, "failRpcId:failure:error:", v21, v13, 0);

  ((void (**)(id, id))v39)[2](v39, v15);
LABEL_23:

  _Block_object_dispose(&v53, 8);
}

- (void)validatePeerIDSKTVerification:(id)a3 batchQuery:(id)a4 completionBlock:(id)a5
{
  void (**v7)(id, id);
  id v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v7 = (void (**)(id, id))a5;
  v8 = a3;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v15 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError unimplementedError:](TransparencyError, "unimplementedError:", v10));

  v11 = objc_alloc((Class)KTVerifierResult);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uri"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));

  v14 = objc_msgSend(v11, "initWithUri:application:failure:", v12, v13, v15);
  v7[2](v7, v14);

}

- (void)validatePeerIDSKTVerification:(id)a3 serverRPC:(id)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  if (objc_msgSend(v8, "rpcType"))
  {
    if (objc_msgSend(v8, "rpcType") == (id)1)
    {
      -[KTContext validatePeerIDSKTVerification:batchQuery:completionBlock:](self, "validatePeerIDSKTVerification:batchQuery:completionBlock:", v15, v8, v9);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -340, CFSTR("unknown server rpc type: %lld"), objc_msgSend(v8, "rpcType")));
      v11 = objc_alloc((Class)KTVerifierResult);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uri"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "application"));
      v14 = objc_msgSend(v11, "initWithUri:application:failure:", v12, v13, v10);
      v9[2](v9, v14);

    }
  }
  else
  {
    -[KTContext validatePeerIDSKTVerification:singleQuery:completionBlock:](self, "validatePeerIDSKTVerification:singleQuery:completionBlock:", v15, v8, v9);
  }

}

- (void)validatePeer:(id)a3 verificationInfo:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(id *, void *);
  void *v31;
  id v32;
  id v33;
  KTContext *v34;
  id v35;
  id v36;
  id v37;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  v37 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fetchOrCreateVerification:application:verificationInfo:fetchNow:error:", v10, v14, v12, v7, &v37));

  v16 = v37;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    v36 = v16;
    v28 = _NSConcreteStackBlock;
    v29 = 3221225472;
    v30 = sub_100068200;
    v31 = &unk_100240400;
    v32 = v15;
    v18 = v10;
    v33 = v18;
    v34 = self;
    v19 = v11;
    v35 = v19;
    v20 = objc_msgSend(v17, "performAndWaitForVerificationId:error:block:", v32, &v36, &v28);
    v21 = v36;

    if ((v20 & 1) == 0)
    {
      v22 = objc_alloc((Class)KTVerifierResult);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID", v28, v29, v30, v31));
      v24 = objc_msgSend(v22, "initWithUri:application:failure:", v18, v23, v21);

      (*((void (**)(id, id, _QWORD))v19 + 2))(v19, v24, 0);
    }

    v25 = v32;
  }
  else
  {
    v26 = objc_alloc((Class)KTVerifierResult);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    v25 = objc_msgSend(v26, "initWithUri:application:failure:", v10, v27, v16);

    (*((void (**)(id, id, _QWORD))v11 + 2))(v11, v25, 0);
    v21 = v16;
  }

}

- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(id, _QWORD);
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];

  v6 = a4;
  v22 = a3;
  v18 = (void (**)(id, _QWORD))a5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_100067720;
  v43 = sub_100067730;
  v44 = 0;
  v44 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v22, "count")));
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100067720;
  v37 = sub_100067730;
  v38 = 0;
  v38 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v22, "count")));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keyEnumerator"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v51, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v11));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100068DB4;
        v23[3] = &unk_100240448;
        v27 = &v39;
        v24 = v20;
        v25 = v11;
        v28 = &v33;
        v26 = v21;
        -[KTContext validatePeer:verificationInfo:fetchNow:completionBlock:](self, "validatePeer:verificationInfo:fetchNow:completionBlock:", v11, v12, v6, v23);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v51, 16);
    }
    while (v8);
  }

  if (qword_1002A4640 != -1)
    dispatch_once(&qword_1002A4640, &stru_100240468);
  v13 = (id)qword_1002A4648;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v20, "count");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", ")));
    v16 = v40[5];
    *(_DWORD *)buf = 134218498;
    v46 = v14;
    v47 = 2112;
    v48 = v15;
    v49 = 2112;
    v50 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "validatePeers: returning %lu results for %@: %@", buf, 0x20u);

  }
  v18[2](v18, v40[5]);
  if (objc_msgSend((id)v34[5], "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    objc_msgSend(v17, "updateIDSCacheWithResults:", v34[5]);

  }
  if (objc_msgSend(v21, "count"))
    -[KTContext queryForUris:userInitiated:cachedYoungerThan:completionHandler:](self, "queryForUris:userInitiated:cachedYoungerThan:completionHandler:", v21, 1, 0, &stru_100240488);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (void)validatePendingPeersForSingleQuery:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  KTContext *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  NSObject *v32;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseTime"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseTime"));
      v28 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000693FC;
      v25[3] = &unk_10023A1A0;
      v12 = v4;
      v26 = v12;
      v27 = self;
      v13 = objc_msgSend(v8, "performForPendingVerfications:uri:responseOlderThan:error:batchSize:block:", v9, v10, v11, &v28, 20, v25);
      v14 = v28;

      if ((v13 & 1) != 0 || !v14)
      {
        if ((v13 & 1) != 0)
          goto LABEL_19;
        if (qword_1002A4640 != -1)
          dispatch_once(&qword_1002A4640, &stru_100240570);
        v24 = (void *)qword_1002A4648;
        if (!os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        v16 = v24;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rpcId"));
        *(_DWORD *)buf = 138543362;
        v30 = v17;
        v18 = "no pending IDSKTVerifications found for rpcId %{public}@";
        v19 = v16;
        v20 = OS_LOG_TYPE_DEBUG;
        v21 = 12;
      }
      else
      {
        if (qword_1002A4640 != -1)
          dispatch_once(&qword_1002A4640, &stru_100240550);
        v15 = (void *)qword_1002A4648;
        if (!os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rpcId"));
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2112;
        v32 = v14;
        v18 = "no pending IDSKTVerifications found for rpcId %{public}@: %@";
        v19 = v16;
        v20 = OS_LOG_TYPE_ERROR;
        v21 = 22;
      }
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);

LABEL_19:
      goto LABEL_20;
    }
  }
  if (qword_1002A4640 != -1)
    dispatch_once(&qword_1002A4640, &stru_1002404C8);
  v22 = (void *)qword_1002A4648;
  if (os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_ERROR))
  {
    v14 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rpcId"));
    *(_DWORD *)buf = 138543362;
    v30 = v23;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "rpcId %{public}@ missing uri or response time", buf, 0xCu);

LABEL_20:
  }

}

- (void)validatePendingPeersForBatchQuery:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (qword_1002A4640 != -1)
    dispatch_once(&qword_1002A4640, &stru_100240590);
  v4 = qword_1002A4648;
  if (os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "validatePendingPeersForBatchQuery: batch query is unimplemented", v5, 2u);
  }

}

- (void)validatePendingPeersForRpcId:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v9[4] = self;
  v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100069AB8;
  v9[3] = &unk_10023A248;
  v6 = objc_msgSend(v5, "performAndWaitForRpcId:error:block:", v4, &v10, v9);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    if (qword_1002A4640 != -1)
      dispatch_once(&qword_1002A4640, &stru_1002405D0);
    v8 = qword_1002A4648;
    if (os_log_type_enabled((os_log_t)qword_1002A4648, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to find rpc for rpcId %{public}@: %@", buf, 0x16u);
    }
  }

}

@end
