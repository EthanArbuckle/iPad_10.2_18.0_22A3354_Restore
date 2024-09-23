@implementation APLegacyMetricRequester

- (APLegacyMetricRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v13;
  APContentDataInternal *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  APContentDataInternal *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  APLegacyMetricRequester *v29;
  id obj;
  id v32;
  id v33;
  void *v34;
  void *v35;
  objc_super v36;

  v13 = a3;
  v14 = (APContentDataInternal *)a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32 = a5;
  v33 = a6;
  v34 = v16;
  obj = a3;
  if (v14
    && (v18 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](v14, "content")),
        v18,
        v18))
  {
    v19 = v14;
  }
  else
  {
    v19 = objc_alloc_init(APContentDataInternal);

    if (v15)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](v19, "content"));
      objc_msgSend(v21, "setContextIdentifier:", v20);

    }
  }
  v35 = v13;
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
  if (v22)
    v23 = (__CFString *)v22;
  else
    v23 = CFSTR("com.apple.ap.promotedcontentd");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](v19, "content"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
  v36.receiver = self;
  v36.super_class = (Class)APLegacyMetricRequester;
  v29 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](&v36, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", v23, v24, v26, v28, v17);

  if (v29)
  {
    objc_storeStrong((id *)&v29->_metric, obj);
    objc_storeStrong((id *)&v29->_internalContent, v19);
    objc_storeStrong((id *)&v29->_context, v32);
    objc_storeStrong((id *)&v29->_clientInfo, v33);
  }

  return v29;
}

- (APPBLogMetaData)logMetadata
{
  APPBLogMetaData *logMetadata;
  APPBLogMetaData *v4;
  APPBLogMetaData *v5;
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
  APPBAdSize *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;

  logMetadata = self->_logMetadata;
  if (!logMetadata)
  {
    v4 = objc_alloc_init(APPBLogMetaData);
    v5 = self->_logMetadata;
    self->_logMetadata = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester clientInfo](self, "clientInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APEncryptedIDProvider provider](APEncryptedIDProvider, "provider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encryptedIDsForIDAccountPrivate:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self->_internalContent, "privateContent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "batchResponseID"));
    -[APPBLogMetaData setBatchId:](self->_logMetadata, "setBatchId:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self->_internalContent, "privateContent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "adResponseIdentifier"));
    -[APPBLogMetaData setAdDataResponseIdentifier:](self->_logMetadata, "setAdDataResponseIdentifier:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self->_internalContent, "privateContent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "impressionIdentifier"));
    -[APPBLogMetaData setImpressionIdentifierData:](self->_logMetadata, "setImpressionIdentifierData:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self->_internalContent, "privateContent"));
    -[APPBLogMetaData setMessageSequence:](self->_logMetadata, "setMessageSequence:", objc_msgSend(v16, "sequenceNumber"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self->_internalContent, "transientContent"));
    -[APPBLogMetaData setImpressionSequence:](self->_logMetadata, "setImpressionSequence:", objc_msgSend(v17, "impressionSequenceNumber"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v18, "timeIntervalSince1970");
    -[APPBLogMetaData setTimeStamp:](self->_logMetadata, "setTimeStamp:");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
    -[APPBLogMetaData setConnectionType:](self->_logMetadata, "setConnectionType:", +[APLegacyTypeTranslator connectionTypeToAPPBAdConnection:](APLegacyTypeTranslator, "connectionTypeToAPPBAdConnection:", objc_msgSend(v19, "connectionType")));

    v20 = objc_alloc_init(APPBAdSize);
    -[APPBLogMetaData setScreenSize:](self->_logMetadata, "setScreenSize:", v20);

    if (v6)
    {
      v21 = objc_msgSend(v6, "screenWidth");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData screenSize](self->_logMetadata, "screenSize"));
      objc_msgSend(v22, "setWidth:", v21);

      v23 = objc_msgSend(v6, "screenHeight");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData screenSize](self->_logMetadata, "screenSize"));
      objc_msgSend(v24, "setHeight:", v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scale"));
      -[APPBLogMetaData setScreenScale:](self->_logMetadata, "setScreenScale:", (double)(int)objc_msgSend(v25, "intValue"));

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iAdID"));
    -[APPBLogMetaData setIAdID:](self->_logMetadata, "setIAdID:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anonymousDemandID"));
    -[APPBLogMetaData setAnonymousDemandiAdID:](self->_logMetadata, "setAnonymousDemandiAdID:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentID"));
    -[APPBLogMetaData setContentiAdID:](self->_logMetadata, "setContentiAdID:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "DPID"));
    -[APPBLogMetaData setDPID:](self->_logMetadata, "setDPID:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self->_internalContent, "privateContent"));
    v31 = objc_msgSend(v30, "isCarouselAd");

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self->_internalContent, "transientContent"));
      -[APPBLogMetaData setSlotPosition:](self->_logMetadata, "setSlotPosition:", objc_msgSend(v32, "clickedCarouselElement"));

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "transientContent"));
    v35 = objc_msgSend(v34, "clickCount");

    if (v35 >= 2)
      -[APPBLogMetaData setOverclickCount:](self->_logMetadata, "setOverclickCount:", (v35 - 1));

    logMetadata = self->_logMetadata;
  }
  return logMetadata;
}

- (void)requestWillSend:(id)a3 headers:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  APServerRequest *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)APLegacyMetricRequester;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[APServerRequester requestWillSend:headers:request:](&v17, "requestWillSend:headers:request:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo", v17.receiver, v17.super_class));
  objc_msgSend(v11, "isRunningTests");

  v12 = [APServerRequest alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
  v15 = sub_100103214((id *)&v12->super.isa, v13, v14, v10, v9, v8, -[APServerRequester responseClass](self, "responseClass"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester retryManager](self, "retryManager"));
  objc_msgSend(v16, "registerMetricRequest:", v15);

}

- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  objc_msgSend(v11, "isRunningTests");

  v16.receiver = self;
  v16.super_class = (Class)APLegacyMetricRequester;
  -[APServerRequester responseReceived:responseProtobuf:error:](&v16, "responseReceived:responseProtobuf:error:", v10, v9, v8);

  v12 = +[APLegacyMetricRetryManager resultForResponse:error:](APLegacyMetricRetryManager, "resultForResponse:error:", v10, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester retryManager](self, "retryManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester requestIdentifier](self, "requestIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  objc_msgSend(v13, "completeServerRequestId:result:", v15, v12);

}

- (APMetricProtocol)metric
{
  return (APMetricProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetric:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (APContentDataInternal)internalContent
{
  return (APContentDataInternal *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (APContext)context
{
  return (APContext *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (APClientInfo)clientInfo
{
  return (APClientInfo *)objc_getProperty(self, a2, 112, 1);
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (APLegacyMetricRetryManagerProtocol)retryManager
{
  return (APLegacyMetricRetryManagerProtocol *)objc_loadWeakRetained((id *)&self->_retryManager);
}

- (void)setRetryManager:(id)a3
{
  objc_storeWeak((id *)&self->_retryManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_retryManager);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_internalContent, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_logMetadata, 0);
}

@end
