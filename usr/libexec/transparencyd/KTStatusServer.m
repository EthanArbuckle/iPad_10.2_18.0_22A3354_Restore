@implementation KTStatusServer

+ (void)errorsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  _objc_msgSend(a4, "errorsForFailedEvents:completionBlock:", a3, a5);
}

+ (void)ignoreFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  _objc_msgSend(a4, "clearFailureEvents:completionBlock:", a3, a5);
}

+ (id)auditorReportForKTRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = objc_msgSend(v3, "type");
  if ((unint64_t)v5 <= 2)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)*(&off_100249E58 + (_QWORD)v5), kTransparencyAuditorReportType);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uri"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kTransparencyAuditorReportURI);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kTransparencyAuditorReportAccountKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "application"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, kTransparencyAuditorReportApplication);

  objc_msgSend(v3, "requestTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  objc_msgSend(v10, "timeIntervalSince1970");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, kTransparencyAuditorReportRequestTime);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverLoggableDatas"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, kTransparencyAuditorReportServerLoggableDatas);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientLoggableDatas"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientLoggableDatas"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, kTransparencyAuditorReportTrustedLoggableDatas);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverHint"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serverHint"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, kTransparencyAuditorReportServerHint);

  }
  if (objc_msgSend(v3, "usedReversePush"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_10025BFB0, kTransparencyAuditorReportUsedReversePush);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queryRequest"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queryRequest"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, kTransparencyAuditorReportQueryRequest);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queryResponse"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queryResponse"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, kTransparencyAuditorReportQueryResponse);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responseTime"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responseTime"));
    objc_msgSend(v26, "timeIntervalSince1970");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, kTransparencyAuditorReportResponseTime);

  }
  if (objc_msgSend(v3, "type") == (id)1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "application"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountKeyServer sharedKeyServiceForApplication:](KTAccountKeyServer, "sharedKeyServiceForApplication:", v28));

    if (v29)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = sub_10016CC34;
      v37 = sub_10016CC44;
      v38 = 0;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10016CC4C;
      v32[3] = &unk_100249DC8;
      v32[4] = &v33;
      objc_msgSend(v29, "signData:completionBlock:", 0, v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v34[5], "base64EncodedStringWithOptions:", 0));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, kTransparencyAuditorReportPCSIdentity);

      _Block_object_dispose(&v33, 8);
    }

  }
  return v4;
}

+ (id)auditorReportForKTSMT:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", kTransparencyAuditorReportTypeSMT, kTransparencyAuditorReportType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uri"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, kTransparencyAuditorReportURI);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "application"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kTransparencyAuditorReportApplication);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receiptTime"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kTransparencyAuditorReportRequestTime);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, kTransparencyAuditorReportSMT);

  if (objc_msgSend(v3, "signatureResult") != (id)1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kTransparencyAuditorReportSignatureFailed);
  if (objc_msgSend(v3, "mergeResult") != (id)1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kTransparencyAuditorReportMMDFailed);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "failureEvent"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "failureEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "encodedError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, kTransparencyAuditorReportNSError);

  }
  return v4;
}

+ (id)auditorReportForSTH:(id)a3
{
  id v3;
  void *v4;
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
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v3, "isMapHead"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", kTransparencyAuditorReportTypeSMH, kTransparencyAuditorReportType);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "populating")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, kTransparencyAuditorReportMapPopulating);

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", kTransparencyAuditorReportTypeSLH, kTransparencyAuditorReportType);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "application"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kTransparencyAuditorReportApplication);

  objc_msgSend(v3, "receiptTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kTransparencyAuditorReportRequestTime);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sth"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, kTransparencyAuditorReportSTH);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "gossip")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, kTransparencyAuditorReportGossip);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "logBeginTime")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kTransparencyAuditorReportTreeEpoch);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "revision")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, kTransparencyAuditorReportRevision);

  if (objc_msgSend(v3, "signatureVerified") != (id)1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kTransparencyAuditorReportSignatureFailed);
  if (objc_msgSend(v3, "inclusionVerified") != (id)1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kTransparencyAuditorReportInclusionFailed);
  if (objc_msgSend(v3, "consistencyVerified") != (id)1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kTransparencyAuditorReportConsistencyFailed);
  if (objc_msgSend(v3, "mmdVerified") != (id)1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kTransparencyAuditorReportMMDFailed);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "failureEvent"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "failureEvent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "encodedError"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, kTransparencyAuditorReportNSError);

  }
  return v4;
}

+ (void)auditorReportsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id *v14;
  id v15;
  unsigned __int8 v16;
  void *v17;
  id *v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void (**v24)(id, _QWORD);
  id obj;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  id v29;
  _QWORD v30[5];
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
  _BYTE v43[128];

  v7 = a3;
  v8 = a4;
  v24 = (void (**)(id, _QWORD))a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_10016CC34;
  v41 = sub_10016CC44;
  v42 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v14 = (id *)(v38 + 5);
        v32 = (id)v38[5];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10016D510;
        v30[3] = &unk_100249DF0;
        v30[4] = v13;
        v15 = v9;
        v31 = v15;
        v16 = objc_msgSend(v8, "performAndWaitForRequestId:error:block:", v13, &v32, v30);
        objc_storeStrong(v14, v32);
        if ((v16 & 1) == 0)
        {
          v18 = (id *)(v38 + 5);
          v17 = (void *)v38[5];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10016D58C;
          v26[3] = &unk_100249E38;
          v28 = &v37;
          v29 = v17;
          v26[4] = v13;
          v27 = v15;
          v19 = objc_msgSend(v8, "performAndWaitForFailedEventId:error:block:", v13, &v29, v26);
          objc_storeStrong(v18, v29);

          if ((v19 & 1) == 0)
          {

            goto LABEL_12;
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

  if (objc_msgSend(v9, "count"))
  {
    v20 = 0;
    v21 = v9;
  }
  else
  {
    if (v38[5])
    {
      v24[2](v24, 0);
      goto LABEL_17;
    }
    v22 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDatabase, -299, CFSTR("no auditor reports for eventIds: %@"), obj));
    v23 = (void *)v38[5];
    v38[5] = v22;

    v21 = 0;
    v20 = v38[5];
  }
  ((void (*)(void (**)(id, _QWORD), void *, uint64_t))v24[2])(v24, v21, v20);
LABEL_17:

  _Block_object_dispose(&v37, 8);
}

@end
