@implementation KTVerifyPendingSignaturesOperation

- (KTVerifyPendingSignaturesOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7;
  id v8;
  KTVerifyPendingSignaturesOperation *v9;
  KTVerifyPendingSignaturesOperation *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTVerifyPendingSignaturesOperation;
  v9 = -[KTGroupOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    -[KTVerifyPendingSignaturesOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyPendingSignaturesOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyPendingSignaturesOperation setFailedSigs:](v10, "setFailedSigs:", v12);

    -[KTGroupOperation setName:](v10, "setName:", CFSTR("Signature"));
  }

  return v10;
}

- (void)groupStart
{
  NSObject *v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *i;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  KTVerifyPendingSignaturesOperation *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[2];
  uint8_t buf[4];
  id v89;

  if (qword_1002A4460 != -1)
    dispatch_once(&qword_1002A4460, &stru_10023AA20);
  v3 = qword_1002A4468;
  if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyPendingSignatures: start", buf, 2u);
  }
  v4 = kKTApplicationIdentifierIDS;
  v83 = 0;
  v5 = -[KTVerifyPendingSignaturesOperation verifySMTsWithPendingSignatures:error:](self, "verifySMTsWithPendingSignatures:error:", kKTApplicationIdentifierIDS, &v83);
  v6 = v83;
  if ((v5 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AA40);
    v7 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Verify pending IDS SMT signatures failed: %@", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-SMTs"), v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v8);

    v6 = 0;
  }
  v82 = v6;
  v10 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:](self, "verifyHeadsWithPendingSignatures:error:", v4, &v82);
  v11 = v82;

  if ((v10 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AA60);
    v12 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Verify pending IDS Head signatures failed: %@", buf, 0xCu);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-STHs"), v4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v13);

    v11 = 0;
  }
  v15 = kKTApplicationIdentifierTLT;
  v81 = v11;
  v16 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:](self, "verifyHeadsWithPendingSignatures:error:", kKTApplicationIdentifierTLT, &v81);
  v17 = v81;

  if ((v16 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AA80);
    v18 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Verify pending IDS Head signatures failed: %@", buf, 0xCu);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v15);

    v17 = 0;
  }
  v20 = kKTApplicationIdentifierIDSMultiplex;
  v80 = v17;
  v21 = -[KTVerifyPendingSignaturesOperation verifySMTsWithPendingSignatures:error:](self, "verifySMTsWithPendingSignatures:error:", kKTApplicationIdentifierIDSMultiplex, &v80);
  v22 = v80;

  if ((v21 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AAA0);
    v23 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Verify pending MP SMT signatures failed: %@", buf, 0xCu);
    }

    v22 = 0;
  }
  v79 = v22;
  v24 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:](self, "verifyHeadsWithPendingSignatures:error:", v20, &v79);
  v25 = v79;

  if ((v24 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AAC0);
    v26 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Verify pending MP Head signatures failed: %@", buf, 0xCu);
    }

    v25 = 0;
  }
  v27 = kKTApplicationIdentifierIDSFaceTime;
  v78 = v25;
  v28 = -[KTVerifyPendingSignaturesOperation verifySMTsWithPendingSignatures:error:](self, "verifySMTsWithPendingSignatures:error:", kKTApplicationIdentifierIDSFaceTime, &v78);
  v29 = v78;

  if ((v28 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AAE0);
    v30 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Verify pending FT SMT signatures failed: %@", buf, 0xCu);
    }

    v29 = 0;
  }
  v77 = v29;
  v31 = -[KTVerifyPendingSignaturesOperation verifyHeadsWithPendingSignatures:error:](self, "verifyHeadsWithPendingSignatures:error:", v27, &v77);
  v32 = v77;

  if ((v31 & 1) == 0)
  {
    if (qword_1002A4460 != -1)
      dispatch_once(&qword_1002A4460, &stru_10023AB00);
    v33 = qword_1002A4468;
    if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Verify pending FT Head signatures failed: %@", buf, 0xCu);
    }

    v32 = 0;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v66 = v32;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allKeys"));

    v65 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "componentsJoinedByString:", CFSTR(",")));
    v39 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Pending signatures failed for applications: %@"), v38));

    v86[0] = NSMultipleUnderlyingErrorsKey;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation errors](self, "errors"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allValues"));
    v86[1] = NSLocalizedDescriptionKey;
    v87[0] = v41;
    v64 = (void *)v39;
    v87[1] = v39;
    v42 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 2));

    v63 = (void *)v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorVerify"), -384, v42));
    -[KTResultOperation setError:](self, "setError:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v68 = self;
    obj = (id)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v47)
            objc_enumerationMutation(obj);
          v49 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v44, "appendFormat:", CFSTR("%@:"), v49);
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](v68, "failedSigs"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v49));

          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v70;
            do
            {
              for (j = 0; j != v53; j = (char *)j + 1)
              {
                if (*(_QWORD *)v70 != v54)
                  objc_enumerationMutation(v51);
                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j), "base64EncodedStringWithOptions:", 0));
                objc_msgSend(v44, "appendFormat:", CFSTR("%@;"), v56);

              }
              v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
            }
            while (v53);
          }

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v46);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation backgroundOpId](v68, "backgroundOpId"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](v68, "deps"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "smDataStore"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation name](v68, "name"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v68, "error"));
    +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:](KTBackgroundSystemValidationOperation, "addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:", v57, v59, v44, v60, 0, v61);

    v32 = v66;
  }
  if (qword_1002A4460 != -1)
    dispatch_once(&qword_1002A4460, &stru_10023AB20);
  v62 = qword_1002A4468;
  if (os_log_type_enabled((os_log_t)qword_1002A4468, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "VerifyPendingSignatures: end", buf, 2u);
  }

}

- (BOOL)verifySMTsWithPendingSignatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KTContextVerifier *v10;
  void *v11;
  void *v12;
  KTContextVerifier *v13;
  void *v14;
  void *v15;
  void *v16;
  KTContextVerifier *v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  KTContextVerifier *v28;
  id v29;
  id v30;
  KTVerifyPendingSignaturesOperation *v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10000EDDC;
  v38 = sub_10000EDEC;
  v39 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationPublicKeyStore:", v6));

  v10 = [KTContextVerifier alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataStore"));
  v13 = -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:](v10, "initWithApplicationKeyStore:dataStore:applicationID:", v9, v12, v6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataStore"));
  v33 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000EDF4;
  v27[3] = &unk_10023ABC8;
  v32 = &v34;
  v17 = v13;
  v28 = v17;
  v18 = v6;
  v29 = v18;
  v19 = v14;
  v30 = v19;
  v31 = self;
  objc_msgSend(v16, "performForSMTsWithUnverifiedSignature:error:block:", v18, &v33, v27);
  v20 = v33;

  if (!v20)
  {
    v22 = v35;
    if (a4)
    {
      v23 = (void *)v35[5];
      if (v23)
      {
        *a4 = objc_retainAutorelease(v23);
        v22 = v35;
      }
    }
    if (!v22[5])
    {
      v21 = 1;
      goto LABEL_11;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-SMTs"), v18));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v19, v24);

    goto LABEL_9;
  }
  if (!a4)
  {
LABEL_9:
    v21 = 0;
    goto LABEL_11;
  }
  v21 = 0;
  *a4 = objc_retainAutorelease(v20);
LABEL_11:

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (BOOL)verifyHeadsWithPendingSignatures:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  KTContextVerifier *v12;
  void *v13;
  void *v14;
  KTContextVerifier *v15;
  void *v16;
  void *v17;
  void *v18;
  KTContextVerifier *v19;
  id v20;
  id v21;
  id v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id obj;
  _QWORD v40[4];
  KTContextVerifier *v41;
  id v42;
  id v43;
  KTVerifyPendingSignaturesOperation *v44;
  uint64_t *v45;
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v5 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_10000EDDC;
  v51 = sub_10000EDEC;
  v52 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKeyStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationPublicKeyStore:", v5));

  if (objc_msgSend(v5, "isEqual:", kKTApplicationIdentifierTLT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publicKeyStore"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tltKeyStore"));

    v8 = (void *)v11;
  }
  v12 = [KTContextVerifier alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataStore"));
  v15 = -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:](v12, "initWithApplicationKeyStore:dataStore:applicationID:", v8, v14, v5);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataStore"));
  v46 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000F618;
  v40[3] = &unk_10023ABC8;
  v45 = &v47;
  v19 = v15;
  v41 = v19;
  v20 = v5;
  v42 = v20;
  v21 = v16;
  v43 = v21;
  v44 = self;
  objc_msgSend(v18, "performForSTHsWithUnverifiedSignature:error:block:", v20, &v46, v40);
  v22 = v46;

  v23 = (id *)(v48 + 5);
  obj = (id)v48[5];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextVerifier failExpiredSTHsForType:error:](v19, "failExpiredSTHsForType:error:", 0, &obj));
  objc_storeStrong(v23, obj);
  if (!v24 || !objc_msgSend(v24, "count"))
  {
    if (v22)
    {
      if (a4)
      {
        v31 = 0;
        *a4 = objc_retainAutorelease(v22);
        goto LABEL_19;
      }
    }
    else
    {
      v32 = v48;
      if (a4)
      {
        v33 = (void *)v48[5];
        if (v33)
        {
          *a4 = objc_retainAutorelease(v33);
          v32 = v48;
        }
      }
      if (!v32[5])
      {
        v31 = 1;
        goto LABEL_19;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-STHs"), v20));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v21, v34);

    }
    v31 = 0;
    goto LABEL_19;
  }
  v37 = v8;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-STHs"), v20));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation deps](self, "deps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dataStore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "failedHeadSignaturesWithRevisions:application:", v24, v20));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyPendingSignaturesOperation failedSigs](self, "failedSigs"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v25);

  if (a4)
  {
    v30 = (void *)v48[5];
    if (v30)
      *a4 = objc_retainAutorelease(v30);
  }

  v31 = 0;
  v8 = v37;
LABEL_19:

  _Block_object_dispose(&v47, 8);
  return v31;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSUUID)backgroundOpId
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBackgroundOpId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableDictionary)failedSigs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFailedSigs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSigs, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
