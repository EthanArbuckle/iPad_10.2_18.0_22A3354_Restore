@implementation APAdSpaceEventRequester

- (APAdSpaceEventRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 idAccount:(id)a6
{
  APAdSpaceEventRequester *v6;
  APAdSpaceEventRequester *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;

  v18.receiver = self;
  v18.super_class = (Class)APAdSpaceEventRequester;
  v6 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:](&v18, "initWithMetric:internalContent:andContext:clientInfo:idAccount:", a3, a4, a5, 0, a6);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester context](v6, "context"));

    if (!v8)
    {
      v9 = APLogForCategory(21);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v7, "internalContent"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v7, "internalContent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contextIdentifier"));
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        v21 = 2114;
        v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No context for content %{public}@ with context identifier %{public}@", buf, 0x16u);

      }
    }
  }
  return v7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBAdSpaceStatusEventResponse, a2);
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (int)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;

  if (a3 <= 0xE && ((1 << a3) & 0x40E0) != 0
    || (a3 - 3002) <= 9 && ((1 << (a3 + 70)) & 0x213) != 0)
  {
    v5 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Setting obsolete ASE %ld.", (uint8_t *)&v7, 0xCu);
    }

  }
  self->_statusCode = a3;
}

- (void)makeRequest:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[APAdSpaceEventRequester statusCode](self, "statusCode"))
  {
    v12.receiver = self;
    v12.super_class = (Class)APAdSpaceEventRequester;
    -[APServerRequester makeRequest:](&v12, "makeRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    objc_msgSend(v5, "statusEventSent:", -[APAdSpaceEventRequester statusCode](self, "statusCode"));

  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ASE 0 will not be sent for content ID %@"), v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    LOBYTE(v6) = objc_msgSend(v10, "isRunningTests");

    if ((v6 & 1) == 0)
      APSimulateCrash(5, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError invalidRequestErrorWithCode:reason:](APLegacyInterfaceError, "invalidRequestErrorWithCode:reason:", 0, v9));
    v4[2](v4, 0, v11);

  }
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;

  v8 = a4;
  v9 = a5;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v10 = objc_alloc((Class)NSUserDefaults);
    v11 = objc_msgSend(v10, "initWithSuiteName:", APDefaultsBundleID);
    if (objc_msgSend(v11, "BOOLForKey:", CFSTR("disableDelayForRequests")))
    {
      v12 = APLogForCategory(21);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[APAdSpaceEventRequester makeDelayedRequest:requestSentHandler:responseCallback:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}s Overriding delay to 0 seconds", buf, 0xCu);
      }

      a3 = 0.0;
    }

  }
  v15.receiver = self;
  v15.super_class = (Class)APAdSpaceEventRequester;
  -[APServerRequester makeDelayedRequest:requestSentHandler:responseCallback:](&v15, "makeDelayedRequest:requestSentHandler:responseCallback:", v8, v9, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  objc_msgSend(v14, "statusEventSent:", -[APAdSpaceEventRequester statusCode](self, "statusCode"));

}

- (id)headers
{
  NSDictionary *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APAdSpaceEventRequester;
  v3 = -[APServerRequester headers](&v10, "headers");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  -[APServerRequester roundedTimestamp](self, "roundedTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.6f"), v6));
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("timestamp"));

  v8 = objc_msgSend(v5, "copy");
  return v8;
}

- (id)protoBuffer
{
  APPBAdSpaceStatusEventRequest *v3;
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
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD block[4];
  APPBAdSpaceStatusEventRequest *v54;
  uint8_t buf[4];
  void *v56;
  const __CFString *v57;
  void *v58;

  v3 = objc_alloc_init(APPBAdSpaceStatusEventRequest);
  -[APPBAdSpaceStatusEventRequest setStatusCode:](v3, "setStatusCode:", -[APAdSpaceEventRequester statusCode](self, "statusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "adResponseIdentifier"));
  -[APPBAdSpaceStatusEventRequest setAdServerResponseIdentifier:](v3, "setAdServerResponseIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  -[APPBAdSpaceStatusEventRequest setAdOriginIdentifier:](v3, "setAdOriginIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APEncryptedIDProvider provider](APEncryptedIDProvider, "provider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encryptedIDsForIDAccountPrivate:", v11));

  if (-[APAdSpaceEventRequester statusCode](self, "statusCode") != 360)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "anonymousDemandID"));
    -[APPBAdSpaceStatusEventRequest setAnonymousDemandiAdID:](v3, "setAnonymousDemandiAdID:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentID"));
    -[APPBAdSpaceStatusEventRequest setContentiAdID:](v3, "setContentiAdID:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "DPID"));
    -[APPBAdSpaceStatusEventRequest setDPID:](v3, "setDPID:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iAdID"));
    -[APPBAdSpaceStatusEventRequest setIAdID:](v3, "setIAdID:", v24);

    if (!-[APPBAdSpaceStatusEventRequest hasAnonymousDemandiAdID](v3, "hasAnonymousDemandiAdID")
      || !-[APPBAdSpaceStatusEventRequest hasContentiAdID](v3, "hasContentiAdID")
      || !-[APPBAdSpaceStatusEventRequest hasIAdID](v3, "hasIAdID"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C9738;
      block[3] = &unk_100212FE0;
      v54 = v3;
      if (qword_100269710 != -1)
        dispatch_once(&qword_100269710, block);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](self, "metric"));
    v26 = metricPropertyValue(v25, (void *)0x15);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](self, "metric"));
      v30 = metricPropertyValue(v29, (void *)0x15);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      LODWORD(v32) = objc_msgSend(v31, "intValue");

      if ((_DWORD)v32 != -1)
      {
        v32 = (int)v32;
        goto LABEL_22;
      }
    }
    else
    {

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "content"));
    if (v34)
    {
      v35 = (void *)v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "content"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "representations"));
      v39 = objc_msgSend(v38, "count");

      if (!v39)
      {
        v32 = -1;
        goto LABEL_22;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "content"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "getRepresentation"));
      v32 = (uint64_t)objc_msgSend(v41, "placementType");

    }
    else
    {
      v32 = -1;
    }

LABEL_22:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester context](self, "context"));
    v19 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject content](v19, "content"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contextJSONForRequest:andPlacementType:", v43, v32));
    -[APPBAdSpaceStatusEventRequest setContextJSON:](v3, "setContextJSON:", v44);

    goto LABEL_23;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceNewsPlusSubscriberID"));
  -[APPBAdSpaceStatusEventRequest setIAdID:](v3, "setIAdID:", v13);

  if (!-[APPBAdSpaceStatusEventRequest hasIAdID](v3, "hasIAdID"))
  {
    v57 = CFSTR("hasIAdID");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[APPBAdSpaceStatusEventRequest hasIAdID](v3, "hasIAdID")));
    v58 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    CreateDiagnosticReport(v16, v15, CFSTR("ASE"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v18 = APLogForCategory(21);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceNewsPlusSubscriberID"));
    *(_DWORD *)buf = 138543362;
    v56 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting iAdID to deviceNewsPlusSubscriberID %{public}@", buf, 0xCu);

  }
LABEL_23:

  -[APServerRequester roundedTimestamp](self, "roundedTimestamp");
  -[APPBAdSpaceStatusEventRequest setTimestamp:](v3, "setTimestamp:");
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "privateContent"));
  objc_msgSend(v46, "responseTime");
  -[APPBAdSpaceStatusEventRequest setResponseTime:](v3, "setResponseTime:");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  -[APPBAdSpaceStatusEventRequest setFirstMessage:](v3, "setFirstMessage:", objc_msgSend(v47, "isFirstMessage:", -[APAdSpaceEventRequester statusCode](self, "statusCode")));

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "osVersionAndBuild"));
  -[APPBAdSpaceStatusEventRequest setOsVersionAndBuild:](v3, "setOsVersionAndBuild:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](self, "metric"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bundleIdentifier"));
  -[APPBAdSpaceStatusEventRequest setBundleID:](v3, "setBundleID:", v51);

  return v3;
}

@end
