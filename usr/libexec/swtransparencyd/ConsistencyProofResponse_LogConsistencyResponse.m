@implementation ConsistencyProofResponse_LogConsistencyResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6C8;
  if (!qword_10012A6C8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ConsistencyProofResponse_LogConsistencyResponse, CFSTR("LogConsistencyResponse"), &unk_100126088, &off_100126160, 3, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB405);
    objc_msgSend(v2, "setupContainingMessageClass:", ConsistencyProofResponse);
    qword_10012A6C8 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyConsistencyProofVerifier)verifier
{
  return (TransparencyConsistencyProofVerifier *)objc_getAssociatedObject(self, CFSTR("verifierKey"));
}

- (void)setVerifier:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("verifierKey"), a3, (void *)1);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, CFSTR("dataStoreKey"));
}

- (void)setDataStore:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("dataStoreKey"), a3, (void *)1);
}

- (NSNumber)startRevision
{
  return (NSNumber *)objc_getAssociatedObject(self, CFSTR("startRevisionKey"));
}

- (void)setStartRevision:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("startRevisionKey"), a3, (void *)1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("metadata"), a3, (void *)1);
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[ConsistencyProofResponse_LogConsistencyResponse setMetadata:](self, "setMetadata:", v8);

  }
}

- (BOOL)forwards
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, CFSTR("directionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setForwards:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, CFSTR("directionKey"), v4, (void *)1);

}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, CFSTR("optInServerKey"));
}

- (void)setOptInServer:(id)a3
{
  if (a3)
    objc_setAssociatedObject(self, CFSTR("optInServerKey"), a3, (void *)1);
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, CFSTR("followUpKey"));
}

- (void)setFollowUp:(id)a3
{
  if (a3)
    objc_setAssociatedObject(self, CFSTR("followUpKey"), a3, (void *)1);
}

- (void)setResult:(unint64_t)a3 treeHead:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double Current;
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
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "setUnsigned:value:", "consistencyVerified", a3);
  if (a3 || !v8)
  {
    objc_msgSend(v8, "receiptTime");
    v14 = v13;
    Current = CFAbsoluteTimeGetCurrent();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("ConsistencyProofTime"), v18));
    objc_msgSend(v16, "logMetric:withName:", v17, v19);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
    NSLog(CFSTR("%@"), v11);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "createSignedTreeHeadFailure"));

    if (v9)
    {
      objc_msgSend(v11, "setErrorCode:", objc_msgSend(v9, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      objc_msgSend(v11, "setErrorDomain:", v12);

    }
    else
    {
      objc_msgSend(v11, "setErrorCode:", -120);
      objc_msgSend(v11, "setErrorDomain:", kTransparencyErrorUnknown);
    }
    objc_msgSend(v11, "setSth:", v8);
    objc_msgSend(v11, "setVerificationType:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse optInServer](self, "optInServer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "createFailureEvent:application:optInServer:", v9, v21, v22));

    objc_msgSend(v8, "setFailureEvent:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse optInServer](self, "optInServer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getAggregateOptInState:", 0));

    if (qword_10012A798 != -1)
      dispatch_once(&qword_10012A798, &stru_1001063F8);
    v26 = (void *)qword_10012A7A0;
    if (os_log_type_enabled((os_log_t)qword_10012A7A0, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "eventId"));
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Created failure eventId %{public}@ for STH consistency validation, optInState %@", buf, 0x16u);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse followUp](self, "followUp"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "eventId"));
    objc_msgSend(v29, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:", v30, 2, v31, objc_msgSend(v9, "code"), v25, 0, 0, 0);

  }
}

- (void)checkSplitsFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ConsistencyProofResponse_LogConsistencyResponse *v17;
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
  unsigned __int8 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  ConsistencyProofResponse_LogConsistencyResponse *v43;
  id obj;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logHeadHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v51 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchTreeHeadsWithoutHash:isMapHead:application:logBeginTime:logType:revision:error:", v6, 0, v7, objc_msgSend(v4, "getUnsigned:"), objc_msgSend(v4, "logType"), objc_msgSend(v4, "getUnsigned:"), &v51));
  v39 = v51;

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -189, CFSTR("duplicate revision found with different head hash from consistent SLH")));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v48;
    v42 = v4;
    v43 = self;
    v40 = kTransparencyResponseMetadataKeyServerHint;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sth"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SignedObjectHolder parseFromData:error:](SignedLogHead, "parseFromData:error:", v11, 0));

        if (v12)
        {
          v13 = v4;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse verifier](self, "verifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trustedKeyStore"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signatureVerifier"));
          objc_msgSend(v12, "setVerifier:", v16);

          if (objc_msgSend(v12, "verifyWithError:", 0) == (id)1)
          {
            v17 = self;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parsedLogHead"));
            v19 = v13;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "application"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v18, "application")));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v21));
            if (objc_msgSend(v20, "isEqual:", v22))
            {
              v23 = objc_msgSend(v13, "getUnsigned:", "logBeginTime");
              if (v23 == objc_msgSend(v18, "logBeginningMs")
                && (v24 = objc_msgSend(v19, "logType"), v24 == (id)(int)objc_msgSend(v18, "logType"))
                && (v25 = objc_msgSend(v19, "getUnsigned:", "revision"), v25 == objc_msgSend(v18, "revision")))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logHeadHash"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logHeadHash"));
                v28 = objc_msgSend(v26, "isEqual:", v27);

                if ((v28 & 1) != 0)
                {
                  v4 = v42;
                  self = v43;
                  goto LABEL_20;
                }
                self = v43;
                if (qword_10012A798 != -1)
                  dispatch_once(&qword_10012A798, &stru_100106418);
                v29 = (void *)qword_10012A7A0;
                if (os_log_type_enabled((os_log_t)qword_10012A7A0, OS_LOG_TYPE_ERROR))
                {
                  v30 = v29;
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logHeadHash"));
                  v32 = objc_msgSend(v42, "revision");
                  *(_DWORD *)buf = 138412546;
                  v53 = v31;
                  v54 = 2048;
                  v55 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "found inconsistent head hash %@ for revision %llu with consistent head hash", buf, 0x16u);

                }
                -[ConsistencyProofResponse_LogConsistencyResponse setResult:treeHead:error:](v43, "setResult:treeHead:error:", 0, v10, v41);
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "application"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyConsistencyProofEvent"), v33));

                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse metadata](v43, "metadata"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v40));

                if (v35)
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse metadata](v43, "metadata"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v40));
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v37, v40);

                }
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
                objc_msgSend(v22, "logResultForEvent:hardFailure:result:withAttributes:", v20, 1, v41, v21);
                v13 = v42;
              }
              else
              {
                v13 = v19;
                self = v43;
              }
            }
            else
            {
              self = v17;
            }

          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
            objc_msgSend(v18, "deleteObject:", v10);
          }
          v4 = v13;
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
          objc_msgSend(v18, "deleteObject:", v10);
        }
LABEL_20:

        v9 = (char *)v9 + 1;
      }
      while (v46 != v9);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      v46 = v38;
    }
    while (v38);
  }

}

- (unint64_t)verifyWithError:(id *)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010948;
  v14[3] = &unk_100105E28;
  v14[4] = self;
  v5 = objc_retainBlock(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse startSlh](self, "startSlh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parsedLogHead"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "application")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyConsistencyProofEvent"), v10));
  v12 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v11, 3, a3, v5);

  return (unint64_t)v12;
}

@end
