@implementation APMetric

- (id)ecServerDictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APMetric metric](self, "metric")));
  v4 = kAPMetricEvent;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric handle](self, "handle"));
  v6 = kAPMetricHandle;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APMetric order](self, "order")));
  v8 = kAPMetricOrder;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[APMetric source](self, "source")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, v9, kAPMetricSource, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric properties](self, "properties"));
  v12 = objc_msgSend(v11, "mutableCopy");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));
    objc_msgSend(v10, "setObject:forKey:", v13, kAPMetricPropertiesKey);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric relayData](self, "relayData"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v14));
    objc_msgSend(v10, "setObject:forKey:", v15, kAPMetricRelaydata);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric environment](self, "environment"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric environment](self, "environment"));
    objc_msgSend(v10, "setObject:forKey:", v17, kAPMetricEnvironment);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric trace](self, "trace"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric trace](self, "trace"));
    objc_msgSend(v10, "setObject:forKey:", v19, kAPMetricTrace);

  }
  v20 = objc_claimAutoreleasedReturnValue(-[APMetric branch](self, "branch"));
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric branch](self, "branch"));
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric branch](self, "branch"));
      objc_msgSend(v10, "setObject:forKey:", v24, kAPMetricBranch);

    }
  }

  return v10;
}

- (id)_descriptionWithFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  void *v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apLocalSharedFormatter](NSISO8601DateFormatter, "apLocalSharedFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric timestamp](self, "timestamp"));
  v35 = v5;
  v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _purpose](self, "_purpose"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _metric](self, "_metric"));
  v7 = objc_claimAutoreleasedReturnValue(-[APMetric handle](self, "handle"));
  v8 = (void *)v7;
  v9 = CFSTR("none");
  if (v7)
    v10 = (__CFString *)v7;
  else
    v10 = CFSTR("none");
  v39 = v10;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _options](self, "_options"));
  v11 = objc_claimAutoreleasedReturnValue(-[APMetric contentIdentifier](self, "contentIdentifier"));
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = CFSTR("none");
  v37 = v13;

  v14 = objc_claimAutoreleasedReturnValue(-[APMetric contextIdentifier](self, "contextIdentifier"));
  v15 = (void *)v14;
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = CFSTR("none");
  v17 = v16;

  v18 = objc_claimAutoreleasedReturnValue(-[APMetric bundleIdentifier](self, "bundleIdentifier"));
  v19 = (void *)v18;
  if (v18)
    v20 = (__CFString *)v18;
  else
    v20 = CFSTR("none");
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _properties](self, "_properties"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _internalProperties](self, "_internalProperties"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _relayData](self, "_relayData"));
  v25 = -[APMetric order](self, "order");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric environment](self, "environment"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric environment](self, "environment"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", CFSTR(",")));

  }
  v42 = 0;
  v28 = (void *)v36;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@%@%@%@%@%@%@%@%@%@%@%ld%@"), &v42, v36, v41, v40, v39, v38, v37, v17, v21, v22, v23, v24, v25, v9));

  v30 = v42;
  if (v30)
  {
    v31 = APLogForCategory(29);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v44 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error retrieving description for metric: %{public}@", buf, 0xCu);

      v28 = (void *)v36;
    }

  }
  return v29;
}

- (id)_metric
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric metricRoute](self, "metricRoute"));
  v4 = -[APMetric metric](self, "metric");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForMetric:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld)"), v5, v4));

  return v6;
}

- (id)_purpose
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric metricRoute](self, "metricRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld)"), v4, -[APMetric purpose](self, "purpose")));

  return v5;
}

- (id)metricRoute
{
  return +[APMetricPurposeRegistry metricRouteForPurpose:](APMetricPurposeRegistry, "metricRouteForPurpose:", -[APMetric purpose](self, "purpose"));
}

- (BOOL)validateMetricAndSetupIdentifiers:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  int v15;

  v4 = (unint64_t)-[APMetric purpose](self, "purpose", a3);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = v4;
    v6 = -[APMetric metric](self, "metric");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricPurposeRegistry metricRouteForPurpose:](APMetricPurposeRegistry, "metricRouteForPurpose:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricPurposeRegistry metricRouteForPurpose:](APMetricPurposeRegistry, "metricRouteForPurpose:", v5));
    v9 = objc_msgSend(v8, "metricIsDefined:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = APLogForCategory(29);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109376;
        v13[1] = (_DWORD)v6;
        v14 = 1024;
        v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Metric (%d) for purpose (%d) is not known!", (uint8_t *)v13, 0xEu);
      }

    }
  }
  return 1;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __CFString *v50;
  void *v51;
  id v52;
  void *v53;
  __CFString *v54;
  void *v55;
  _QWORD v56[13];
  _QWORD v57[13];

  if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))return (id)objc_claimAutoreleasedReturnValue(-[APMetric _descriptionWithFormat:](self, "_descriptionWithFormat:", CFSTR("%@ R: %@ M: %@ H: %@ O: %@, CI: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@")));
  v3 = objc_alloc((Class)NSUserDefaults);
  v4 = objc_msgSend(v3, "initWithSuiteName:", APDefaultsBundleID);
  if (objc_msgSend(v4, "BOOLForKey:", kAPAutomationLoggingEnabled))
  {
    v49 = v4;
    if ((objc_opt_respondsToSelector(self, "ecServerDictionaryRepresentation") & 1) != 0)
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric ecServerDictionaryRepresentation](self, "ecServerDictionaryRepresentation"));
    else
      v5 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apDefaultSharedFormatter](NSISO8601DateFormatter, "apDefaultSharedFormatter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric timestamp](self, "timestamp"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v9));

    v11 = -[APMetric purpose](self, "purpose");
    v52 = -[APMetric metric](self, "metric");
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kAPMetricHandle));
    v13 = objc_claimAutoreleasedReturnValue(-[APMetric _optionsArray](self, "_optionsArray"));
    v14 = objc_claimAutoreleasedReturnValue(-[APMetric contentIdentifier](self, "contentIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric contextIdentifier](self, "contextIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue(-[APMetric bundleIdentifier](self, "bundleIdentifier"));
    v17 = (void *)v16;
    v18 = &stru_100219118;
    if (v16)
      v18 = (__CFString *)v16;
    v54 = v18;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kAPMetricPropertiesKey));
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v55 = v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric internalProperties](self, "internalProperties"));
    v23 = v22;
    if (v22)
      v24 = v22;
    else
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v25 = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric relayData](self, "relayData"));
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v51 = v28;

    v44 = -[APMetric order](self, "order");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric environment](self, "environment"));
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric environment](self, "environment"));
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "componentsJoinedByString:", CFSTR(",")));

    }
    else
    {
      v50 = &stru_100219118;
    }

    v56[0] = CFSTR("TS");
    v31 = v10;
    if (!v10)
      v31 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v48 = (void *)v10;
    v42 = (void *)v31;
    v57[0] = v31;
    v56[1] = CFSTR("R");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
    v57[1] = v45;
    v56[2] = CFSTR("M");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v52));
    v57[2] = v43;
    v56[3] = CFSTR("H");
    v32 = v12;
    if (!v12)
      v32 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v47 = (void *)v12;
    v41 = (void *)v32;
    v57[3] = v32;
    v56[4] = CFSTR("O");
    v33 = (void *)v13;
    if (!v13)
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v53 = v25;
    v46 = (void *)v13;
    v57[4] = v33;
    v56[5] = CFSTR("CI");
    v34 = (void *)v14;
    if (!v14)
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v35 = (void *)v14;
    v57[5] = v34;
    v56[6] = CFSTR("CX");
    v36 = v15;
    if (!v15)
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[6] = v36;
    v57[7] = v54;
    v56[7] = CFSTR("BID");
    v56[8] = CFSTR("P");
    v37 = v55;
    if (!v55)
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[8] = v37;
    v56[9] = CFSTR("IP");
    v38 = v53;
    if (!v53)
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[9] = v38;
    v56[10] = CFSTR("ORD");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v44));
    v57[10] = v39;
    v57[11] = v51;
    v56[11] = CFSTR("REL");
    v56[12] = CFSTR("ENV");
    v57[12] = v50;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 13));

    if (!v53)
    if (!v55)

    if (v15)
    {
      if (v35)
      {
LABEL_42:
        if (!v46)

        if (!v47)
        if (!v48)

        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "jsonStringWithOptions:", 1));
        v4 = v49;
        goto LABEL_49;
      }
    }
    else
    {

      if (v35)
        goto LABEL_42;
    }

    goto LABEL_42;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _descriptionWithFormat:](self, "_descriptionWithFormat:", CFSTR("%@ Purpose: %@ Metric: %@ H: %@ Options: %@, CID: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@")));
LABEL_49:

  return v7;
}

- (void)updateClientBundleID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sha256"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asHexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric _clientSourceIDMap](self, "_clientSourceIDMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
  -[APMetric setSource:](self, "setSource:", objc_msgSend(v7, "unsignedIntValue"));

}

- (id)_clientSourceIDMap
{
  return &off_10022B1E0;
}

- (id)additives:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[APMetric timestamp](self, "timestamp"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apUTCSharedFormatter](NSISO8601DateFormatter, "apUTCSharedFormatter"));
  v23 = (void *)v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringFromDate:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSystemInfo osIdentifier](APSystemInfo, "osIdentifier"));
  v6 = kAPMetricOS;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APSystemInfo osVersion](APSystemInfo, "osVersion"));
  v8 = kAPMetricOSVersion;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APSystemInfo longBuildVersion](APSystemInfo, "longBuildVersion"));
  v10 = kAPMetricOSBuild;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, v6, v7, v8, v9, v10, v12, kAPMetricDeviceModel, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric bundleIdentifier](self, "bundleIdentifier"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric bundleIdentifier](self, "bundleIdentifier"));
    objc_msgSend(v13, "setObject:forKey:", v15, kAPMetricClientIdentifierKey);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric handle](self, "handle"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric handle](self, "handle"));
    objc_msgSend(v13, "setObject:forKey:", v17, kAPMetricIdentifierKey);

  }
  if (v21)
    objc_msgSend(v13, "setObject:forKey:", v21, kAPMetricTimestampKey);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APMetric internalProperties](self, "internalProperties"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v18));
  objc_msgSend(v24, "setObject:forKey:", v19, kAPMetricInternalPropertiesKey);

  objc_msgSend(v24, "setObject:forKey:", v13, CFSTR("additives"));
  return v24;
}

@end
