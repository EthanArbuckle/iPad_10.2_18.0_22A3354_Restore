@implementation APReportDelivery

- (APReportDelivery)initWithDatasource:(id)a3
{
  id v5;
  APReportDelivery *v6;
  APReportDelivery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APReportDelivery;
  v6 = -[APReportDelivery init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_datasource, a3);

  return v7;
}

- (void)prepareDelivery
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDelivery datasource](self, "datasource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "properties"));
  if (objc_msgSend(v4, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v10));
          -[APReportDelivery _sendReportWithProperties:environment:](self, "_sendReportWithProperties:environment:", v11, v10);

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
  }
  else
  {
    v12 = APLogForCategory(39);
    v5 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class(self);
      v14 = v13;
      v15 = (objc_class *)objc_opt_class(v3);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reportDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reportDayString"));
      *(_DWORD *)buf = 138478595;
      v26 = v13;
      v27 = 2160;
      v28 = 1752392040;
      v29 = 2112;
      v30 = v17;
      v31 = 2114;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Skipping Report %{mask.hash}@ for day %{public}@, no data avaliable.", buf, 0x2Au);

    }
  }

}

- (void)_sendReportWithProperties:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APReportDelivery datasource](self, "datasource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appendBytes:", 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "base64FilenameSafeEncoded"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environmentToBranchDic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v7));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v15 = objc_msgSend(objc_alloc((Class)+[MetricsModuleCommon metricClass](MetricsModuleCommon, "metricClass")), "initWithPurpose:metric:contentIdentifier:contextIdentifier:handle:branch:properties:internalProperties:relayData:environment:order:options:", 103, objc_msgSend(v8, "metric"), 0, 0, v11, v13, v6, 0, 0, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleIdentifier"));

  objc_msgSend(v15, "addInternalPropertyValue:forKey:", v17, kAPMetricBundleIdentifierKey);
  if ((objc_opt_respondsToSelector(v15, "updateClientBundleID:") & 1) != 0)
    objc_msgSend(v15, "performSelector:withObject:", "updateClientBundleID:", v17);
  objc_msgSend(v14, "receivedMetric:", v15);
  v18 = APLogForCategory(39);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_opt_class(self);
    v28 = v20;
    v21 = (objc_class *)objc_opt_class(v8);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v30 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reportDate"));
    v29 = v14;
    v25 = v13;
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reportDayString"));
    *(_DWORD *)buf = 138478851;
    v32 = v20;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v23;
    v37 = 2114;
    v38 = v27;
    v39 = 2114;
    v40 = v26;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Report %{mask.hash}@ for day %{public}@ sent to EC with properties %{public}@.", buf, 0x34u);

    v6 = v26;
    v13 = v25;
    v14 = v29;

    v11 = v30;
  }

}

- (APReportDatasource)datasource
{
  return self->_datasource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasource, 0);
}

@end
