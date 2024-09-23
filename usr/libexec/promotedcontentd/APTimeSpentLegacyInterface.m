@implementation APTimeSpentLegacyInterface

- (APTimeSpentLegacyInterface)initWithDbManager:(id)a3 retryManager:(id)a4
{
  id v7;
  id v8;
  APTimeSpentLegacyInterface *v9;
  APTimeSpentLegacyInterface *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APTimeSpentLegacyInterface;
  v9 = -[APTimeSpentLegacyInterface init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricRetryManager, a4);
    objc_storeStrong((id *)&v10->_dbManager, a3);
  }

  return v10;
}

- (void)cancel:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentLegacyInterface activeDataTask](self, "activeDataTask"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentLegacyInterface activeDataTask](self, "activeDataTask"));
    objc_msgSend(v5, "cancel");

    -[APTimeSpentLegacyInterface setActiveDataTask:](self, "setActiveDataTask:", 0);
  }
  v6[2]();

}

- (void)sendTimeSpentMetricFor:(id)a3 contentId:(id)a4 contextId:(id)a5 adDataResponseIdentifier:(id)a6 batchId:(id)a7 impressionIdentifierData:(id)a8 timeSpent:(double)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  APTimeSpentEventRequester *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  APTimeSpentEventRequester *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v35 = a10;
  v23 = [APTimeSpentEventRequester alloc];
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentLegacyInterface dbManager](self, "dbManager"));
  v33 = v19;
  v34 = v17;
  v26 = v19;
  v27 = v20;
  v28 = -[APTimeSpentEventRequester initWithBundleID:idAccount:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:databaseManager:](v23, "initWithBundleID:idAccount:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:databaseManager:", v17, v24, v18, v26, v20, v21, a9, v22, v25);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[APTimeSpentLegacyInterface metricRetryManager](self, "metricRetryManager"));
  -[APLegacyMetricRequester setRetryManager:](v28, "setRetryManager:", v29);

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000E3264;
  v36[3] = &unk_100214BA8;
  v39 = v40;
  v30 = v35;
  v38 = v30;
  v31 = v18;
  v37 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester makeNetworkRequest:](v28, "makeNetworkRequest:", v36));
  -[APTimeSpentLegacyInterface setActiveDataTask:](self, "setActiveDataTask:", v32);

  _Block_object_dispose(v40, 8);
}

- (APLegacyMetricRetryManagerProtocol)metricRetryManager
{
  return (APLegacyMetricRetryManagerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (APDatabaseManager)dbManager
{
  return (APDatabaseManager *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSessionDataTask)activeDataTask
{
  return self->_activeDataTask;
}

- (void)setActiveDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_activeDataTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDataTask, 0);
  objc_storeStrong((id *)&self->_dbManager, 0);
  objc_storeStrong((id *)&self->_metricRetryManager, 0);
}

@end
