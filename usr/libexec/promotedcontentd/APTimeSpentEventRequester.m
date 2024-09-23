@implementation APTimeSpentEventRequester

- (APTimeSpentEventRequester)initWithBundleID:(id)a3 idAccount:(id)a4 contentId:(id)a5 contextId:(id)a6 adDataResponseIdentifier:(id)a7 batchId:(id)a8 impressionIdentifierData:(id)a9 timeSpent:(double)a10 databaseManager:(id)a11
{
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char *v23;
  id obj;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v18 = (__CFString *)a3;
  obj = a5;
  v19 = a5;
  v29 = a7;
  v28 = a8;
  v27 = a9;
  v26 = a11;
  if (!v18)
    v18 = CFSTR("com.apple.ap.promotedcontentd");
  v20 = a6;
  v21 = a4;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v30.receiver = self;
  v30.super_class = (Class)APTimeSpentEventRequester;
  v23 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](&v30, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", v18, v22, v20, v19, v21);

  if (v23)
  {
    *(double *)(v23 + 140) = a10;
    objc_storeStrong((id *)(v23 + 148), a8);
    objc_storeStrong((id *)(v23 + 156), a7);
    objc_storeStrong((id *)(v23 + 164), a9);
    objc_storeStrong((id *)(v23 + 180), a11);
    objc_storeStrong((id *)(v23 + 172), obj);
  }

  return (APTimeSpentEventRequester *)v23;
}

- (id)protoBuffer
{
  APPBLogSysEventRequest *v3;
  void *v4;

  v3 = objc_alloc_init(APPBLogSysEventRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentEventRequester logMetadata](self, "logMetadata"));
  -[APPBLogSysEventRequest setMetaData:](v3, "setMetaData:", v4);

  -[APPBLogSysEventRequest setEventType:](v3, "setEventType:", 909);
  return v3;
}

- (id)logMetadata
{
  void *v3;
  APPBLogMetaData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v3 = *(void **)(&self->super._eventType + 1);
  if (!v3)
  {
    v4 = objc_alloc_init(APPBLogMetaData);
    v5 = *(void **)(&self->super._eventType + 1);
    *(_QWORD *)(&self->super._eventType + 1) = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APEncryptedIDProvider provider](APEncryptedIDProvider, "provider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptedIDsForIDAccountPrivate:", v7));

    objc_msgSend(*(id *)(&self->super._eventType + 1), "setBatchId:", *(_QWORD *)((char *)&self->_timeSpent + 4));
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setAdDataResponseIdentifier:", *(NSString **)((char *)&self->_batchId + 4));
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setImpressionIdentifierData:", *(NSString **)((char *)&self->_adDataResponseIdentifier + 4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setTimeStamp:");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iAdID"));
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setIAdID:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anonymousDemandID"));
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setAnonymousDemandiAdID:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentID"));
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setContentiAdID:", v12);

    -[APTimeSpentEventRequester calculateDuration](self, "calculateDuration");
    objc_msgSend(*(id *)(&self->super._eventType + 1), "setDuration:", (int)v13);

    v3 = *(void **)(&self->super._eventType + 1);
  }
  return v3;
}

- (double)calculateDuration
{
  double v2;
  double v3;

  -[APTimeSpentEventRequester timeSpent](self, "timeSpent");
  if (v2 >= 300.0 && v2 < 600.0)
  {
    v3 = 10.0;
LABEL_6:
    v2 = round(v2 / v3) * v3;
    return round(v2);
  }
  if (v2 >= 600.0)
  {
    v3 = 60.0;
    goto LABEL_6;
  }
  return round(v2);
}

- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  APTimeSpentStoreDatabase *v11;
  void *v12;
  APTimeSpentStoreDatabase *v13;
  void *v14;
  void *v15;
  objc_super v16;
  void *v17;

  v16.receiver = self;
  v16.super_class = (Class)APTimeSpentEventRequester;
  v8 = a5;
  v9 = a3;
  -[APLegacyMetricRequester responseReceived:responseProtobuf:error:](&v16, "responseReceived:responseProtobuf:error:", v9, a4, v8);
  v10 = +[APLegacyMetricRetryManager resultForResponse:error:](APLegacyMetricRetryManager, "resultForResponse:error:", v9, v8, v16.receiver, v16.super_class);

  if (v10 == 2)
  {
    v11 = [APTimeSpentStoreDatabase alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentEventRequester databaseManager](self, "databaseManager"));
    v13 = -[APTimeSpentStoreDatabase initWithDatabase:](v11, "initWithDatabase:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentEventRequester contentId](self, "contentId"));
    v17 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    -[APTimeSpentStoreDatabase removeEntriesForContentIds:](v13, "removeEntriesForContentIds:", v15);

  }
}

- (double)timeSpent
{
  return *(double *)((char *)&self->_logMetadata + 4);
}

- (void)setTimeSpent:(double)a3
{
  *(double *)((char *)&self->_logMetadata + 4) = a3;
}

- (NSString)batchId
{
  return *(NSString **)((char *)&self->_timeSpent + 4);
}

- (void)setBatchId:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_timeSpent + 4), a3);
}

- (NSString)adDataResponseIdentifier
{
  return *(NSString **)((char *)&self->_batchId + 4);
}

- (void)setAdDataResponseIdentifier:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_batchId + 4), a3);
}

- (NSData)impressionIdentifierData
{
  return *(NSData **)((char *)&self->_adDataResponseIdentifier + 4);
}

- (void)setImpressionIdentifierData:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_adDataResponseIdentifier + 4), a3);
}

- (NSString)contentId
{
  return *(NSString **)((char *)&self->_impressionIdentifierData + 4);
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_impressionIdentifierData + 4), a3);
}

- (APDatabaseManager)databaseManager
{
  return *(APDatabaseManager **)((char *)&self->_contentId + 4);
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_contentId + 4), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_contentId + 4), 0);
  objc_storeStrong((id *)((char *)&self->_impressionIdentifierData + 4), 0);
  objc_storeStrong((id *)((char *)&self->_adDataResponseIdentifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_batchId + 4), 0);
  objc_storeStrong((id *)((char *)&self->_timeSpent + 4), 0);
  objc_storeStrong((id *)(&self->super._eventType + 1), 0);
}

@end
