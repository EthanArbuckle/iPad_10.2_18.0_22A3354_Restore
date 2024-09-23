@implementation APMediaServiceContextTransformer

- (id)_capArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v18[1] = CFSTR("value");
        v19[0] = v9;
        v18[0] = CFSTR("key");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:"));
        v19[1] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
        objc_msgSend(v4, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_adRequestDictionary
{
  void *v3;
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementalContext"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v6, "setObject:forKey:", CFSTR("Regular"), CFSTR("RequestType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("deviceRequestID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _propertiesDictionary](self, "_propertiesDictionary"));
  objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("properties"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _contextDictionary](self, "_contextDictionary"));
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("context"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  if (objc_msgSend(v13, "placement") == (id)7007)
  {

LABEL_4:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "adamId"));
    if (v17)
    {
      objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("sourceAppId"));
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("sourceAppId"));

    }
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v15 = objc_msgSend(v14, "placement");

  if (v15 == (id)7008)
    goto LABEL_4;
LABEL_8:
  -[APMediaServiceContextTransformer _addFrequencyCappingDataToRequestDictionary:fromSupplementalContext:](self, "_addFrequencyCappingDataToRequestDictionary:fromSupplementalContext:", v6, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v20 = objc_msgSend(v19, "hasOdml");

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _odmlProperties](self, "_odmlProperties"));
    objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("odmlProperties"));

  }
  return v6;
}

- (id)_propertiesDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  const __CFString **v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v54;
  const __CFString *v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "DPID"));
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("DPIDString"));
  }
  else
  {
    v7 = objc_alloc_init((Class)NSNull);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("DPIDString"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toroID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("clientId"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceModel"));
  if (v13)
  {
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("deviceModel"));
  }
  else
  {
    v14 = objc_alloc_init((Class)NSNull);
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("deviceModel"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSince1970");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("clientClockTime"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)objc_msgSend(v17, "secondsFromGMT") / 3600.0));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("timezone"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "operatingSystemVersionString"));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("osVersionAndBuild"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "context"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "supplementalContext"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("storeFront")));
  v25 = v24;
  if (v24)
    v26 = v24;
  else
    v26 = objc_alloc_init((Class)NSNull);
  v27 = v26;

  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("iTunesStore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "context"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "supplementalContext"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("storeFrontLocale")));
  v32 = v31;
  if (v31)
    v33 = v31;
  else
    v33 = objc_alloc_init((Class)NSNull);
  v34 = v33;

  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("storeFrontLocaleIdentifier"));
  if ((objc_msgSend(v12, "educationModeEnabled") & 1) != 0)
  {
    v55 = CFSTR("EducationMode");
    v35 = &v55;
  }
  else
  {
    v54 = CFSTR("Default");
    v35 = &v54;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 1));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("deviceMode"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "idAccount"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "iTunesDSID"));
  v41 = objc_msgSend(v40, "isEqualToNumber:", &off_10022A1B8);

  if ((v41 & 1) != 0)
  {
    v42 = CFSTR("NoAccount");
LABEL_29:
    objc_msgSend(v37, "addObject:", v42);
    goto LABEL_30;
  }
  if (objc_msgSend(v39, "isManagedAccount"))
    objc_msgSend(v37, "addObject:", CFSTR("ManagedAccount"));
  if ((objc_msgSend(v39, "ageUnknown") & 1) != 0)
  {
    v42 = CFSTR("AgeUnknown");
    goto LABEL_29;
  }
  if ((objc_msgSend(v39, "isChild") & 1) != 0)
  {
    v42 = CFSTR("U18");
    v43 = CFSTR("U13");
LABEL_28:
    objc_msgSend(v37, "addObject:", v43);
    goto LABEL_29;
  }
  if ((objc_msgSend(v39, "isAdolescent") & 1) != 0)
  {
    v42 = CFSTR("U18");
    goto LABEL_29;
  }
  if ((objc_msgSend(v39, "sensitiveContentEligible") & 1) != 0)
  {
    v42 = CFSTR("Consumer");
    v43 = CFSTR("SensitiveContentEligible");
    goto LABEL_28;
  }
  if ((objc_msgSend(v39, "isAdult") & 1) != 0)
  {
    v42 = CFSTR("Consumer");
    goto LABEL_29;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("accountType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "monthlyIDResetCount"));
  if (v44)
  {
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("advertisingIdentifierMonthResetCount"));
  }
  else
  {
    v45 = objc_alloc_init((Class)NSNull);
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("advertisingIdentifierMonthResetCount"));

  }
  if (objc_msgSend(v12, "personalizedAdsAcknowledged"))
    v46 = objc_msgSend(v12, "personalizedAdsEnabled") ^ 1;
  else
    v46 = 1;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v46));
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("limitAdTracking"));

  v48 = objc_msgSend(v12, "connectionType");
  if ((unint64_t)v48 > 9)
    v49 = CFSTR("UnknownConnection");
  else
    v49 = *(&off_100218FC8 + (_QWORD)v48);
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("connectionType"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _locationDictionary](self, "_locationDictionary"));
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("currentLocation"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _requestDebugInfo](self, "_requestDebugInfo"));
  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _requestDebugInfo](self, "_requestDebugInfo"));
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("requestDebugInfo"));

  }
  return v3;
}

- (APMediaServiceRequestParameters)params
{
  return self->_params;
}

- (id)_requestDebugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceRequestSettings settings](APMediaServiceRequestSettings, "settings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "campaignNamespaceForPlacement:", objc_msgSend(v5, "placement")));

    if (v6)
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("campaignNamespace"));
    v7 = objc_alloc((Class)NSUserDefaults);
    v8 = objc_msgSend(v7, "initWithSuiteName:", APDefaultsBundleID);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ToroTestClient")));
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = &__kCFBooleanTrue;
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isTest"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_addFrequencyCappingDataToRequestDictionary:(id)a3 fromSupplementalContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v8 = objc_msgSend(v7, "placement");

  if (v8 == (id)7006)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("TodaySlot1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("impressionCap")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("clickCap")));
    -[APMediaServiceContextTransformer _addImpressionCap:clickCap:toDictionary:](self, "_addImpressionCap:clickCap:toDictionary:", v10, v11, v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("additionalImpressionCaps")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("additionalClickCaps")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("TodaySlot2"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", &off_10022A1D0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", &off_10022A1D0));
    -[APMediaServiceContextTransformer _addImpressionCap:clickCap:toDictionary:](self, "_addImpressionCap:clickCap:toDictionary:", v15, v16, v14);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", &off_10022A1E8));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", &off_10022A1E8));
    if (v17 | v18)
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("TodaySlot3"));
      -[APMediaServiceContextTransformer _addImpressionCap:clickCap:toDictionary:](self, "_addImpressionCap:clickCap:toDictionary:", v17, v18, v19);
      v14 = (void *)v19;
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("impressionCap")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("clickCap")));

    -[APMediaServiceContextTransformer _addImpressionCap:clickCap:toDictionary:](self, "_addImpressionCap:clickCap:toDictionary:", v14, v12, v20);
  }

}

- (void)_addImpressionCap:(id)a3 clickCap:(id)a4 toDictionary:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (v16 && (v10 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v16, v10) & 1) != 0))
    v11 = objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _capArray:](self, "_capArray:", v16));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v12 = (void *)v11;
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("impressionCapDataByAdamId"));

  if (v8 && (v13 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v8, v13) & 1) != 0))
    v14 = objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _capArray:](self, "_capArray:", v8));
  else
    v14 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v15 = (void *)v14;
  objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("clickCapDataByAdamId"));

}

- (id)transformedContextJSON:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _typeDictionary](self, "_typeDictionary"));
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("type"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer _adRequestDictionary](self, "_adRequestDictionary"));
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("AdRequest"));

  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 0, &v19));
  v9 = v19;
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    v12 = APLogForCategory(27);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "context"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2114;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error serializing request for context %{public}@: %{public}@", buf, 0x16u);

    }
    v17 = 0;
  }

  return v17;
}

- (APMediaServiceContextTransformer)initWithParams:(id)a3
{
  id v5;
  APMediaServiceContextTransformer *v6;
  APMediaServiceContextTransformer *v7;
  APMediaServiceContextTransformer *v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)APMediaServiceContextTransformer;
    v6 = -[APMediaServiceContextTransformer init](&v12, "init");
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_params, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = APLogForCategory(27);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Required parameter missing.", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)_typeDictionary
{
  void *v3;
  void *v4;
  char *v5;
  const __CFString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKey:", &off_10022A188, CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
  v5 = (char *)objc_msgSend(v4, "placement");

  if ((unint64_t)(v5 - 7006) > 2)
    v6 = CFSTR("SLPAdRequest");
  else
    v6 = *(&off_100218FB0 + (_QWORD)(v5 - 7006));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("value"));
  objc_msgSend(v3, "setObject:forKey:", &off_10022A1A0, CFSTR("version"));
  return v3;
}

- (id)_locationDictionary
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  if ((objc_msgSend(v4, "educationModeEnabled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
    v6 = objc_msgSend(v5, "isManagedAccount");

    if ((v6 & 1) != 0)
      return v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceContextTransformer params](self, "params"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationInfo"));

    if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));
        objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isoCountryCode"));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "postalCode"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "postalCode"));
        objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("postalCode"));

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "administrativeArea"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "administrativeArea"));
        objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("administrativeArea"));

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));
        objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("isoCountryCode"));

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locality"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locality"));
        objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("locality"));

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subAdministrativeArea"));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subAdministrativeArea"));
        objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("subAdministrativeArea"));

      }
    }
  }

  return v3;
}

- (id)_contextDictionary
{
  return +[NSDictionary dictionary](NSDictionary, "dictionary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
}

- (id)_odmlProperties
{
  return +[NSDictionary dictionary](NSDictionary, "dictionary");
}

- (void)setParams:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

@end
