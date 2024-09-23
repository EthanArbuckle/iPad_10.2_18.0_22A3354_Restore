@implementation APMetricReceiver

- (void)receivedMetric:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;

  v4 = (__CFString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricReceiver connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricReceiver connection](self, "connection"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));

  }
  else
  {
    v9 = CFSTR("nil");
  }
  -[__CFString addInternalPropertyValue:forKey:](v4, "addInternalPropertyValue:forKey:", v9, kAPMetricBundleIdentifierKey);
  if ((objc_opt_respondsToSelector(v4, "updateClientBundleID:") & 1) != 0)
    -[__CFString performSelector:withObject:](v4, "performSelector:withObject:", "updateClientBundleID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString internalProperties](v4, "internalProperties"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kAPMetricClientSourceKey));

  if (v11)
  {
    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v9, CFSTR("."), v11));

        v9 = (__CFString *)v13;
      }
    }
  }
  v14 = APLogForCategory(29);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v7)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478339;
      v34 = (id)objc_opt_class(self);
      v35 = 2114;
      v36 = v9;
      v37 = 2114;
      v38 = v4;
      v17 = v34;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{private}@] Received metric from %{public}@: %{public}@", buf, 0x20u);

    }
    v18 = -[__CFString purpose](v4, "purpose");
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[APECPurposeConfig purposeConfig:](APECPurposeConfig, "purposeConfig:", v18));
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricReceiver connection](self, "connection"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleID"));

        if (!v21)
        {
          v32 = APLogForCategory(29);
          v24 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v4;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error missing BundleID for metric %{public}@", buf, 0xCu);
          }
          goto LABEL_24;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricReceiver connection](self, "connection"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleID"));
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dataUsingEncoding:", 4));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sha256](v24, "sha256"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asHexString"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF contains %@"), v26));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allowedSources"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "filteredArrayUsingPredicate:", v27));

        if (!v29 || objc_msgSend(v29, "count") != (id)1)
        {
          v30 = APLogForCategory(29);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v34 = v9;
            v35 = 2114;
            v36 = v4;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Metric %{public}@ from client %{public}@ not allowed ", buf, 0x16u);
          }

          goto LABEL_24;
        }

      }
    }
    else
    {
      v19 = 0;
    }
    v24 = objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
    -[NSObject receivedMetric:](v24, "receivedMetric:", v4);
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to get bundle ID for connection. Terminating the connection.", buf, 2u);
  }

  -[APMetricReceiver terminateConnection](self, "terminateConnection");
LABEL_25:

}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (APMetricReceiver)initWithConnection:(id)a3
{
  id v5;
  APMetricReceiver *v6;
  APMetricReceiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APMetricReceiver;
  v6 = -[APMetricReceiver init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", +[MetricsModuleCommon metricClass](MetricsModuleCommon, "metricClass"), 0));
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, "receivedMetric:", 0, 0);

}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APMetricReceiving;
}

- (void)terminateConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricReceiver connection](self, "connection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricReceiver connection](self, "connection"));
    objc_msgSend(v4, "invalidate");

    -[APMetricReceiver setConnection:](self, "setConnection:", 0);
  }
}

- (void)connectionInvalidated
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;

  v3 = APLogForCategory(29);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138477827;
    v7 = (id)objc_opt_class(self);
    v5 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Connection from the client was invalidated", (uint8_t *)&v6, 0xCu);

  }
  -[APMetricReceiver terminateConnection](self, "terminateConnection");
}

- (void)connectionInterrupted
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;

  v3 = APLogForCategory(29);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138477827;
    v7 = (id)objc_opt_class(self);
    v5 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Connection from the client was interrupted", (uint8_t *)&v6, 0xCu);

  }
  -[APMetricReceiver terminateConnection](self, "terminateConnection");
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
