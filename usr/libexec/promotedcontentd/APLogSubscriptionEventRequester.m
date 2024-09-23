@implementation APLogSubscriptionEventRequester

- (APLogSubscriptionEventRequester)initWithMetric:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  APLogSubscriptionEventRequester *v10;
  id v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSMutableArray *parameters;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v10 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](self, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", v7, v8, 0, 0, v9);

  if (v10)
  {
    v11 = metricPropertyValue(v6, (void *)0x24);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);
    if ((isKindOfClass & 1) != 0)
    {
      v15 = metricPropertyValue(v6, (void *)0x24);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong((id *)&v10->_qToken, v16);
    if ((isKindOfClass & 1) != 0)

    v17 = metricPropertyValue(v6, (void *)0x23);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_opt_class(NSString);
    v20 = objc_opt_isKindOfClass(v18, v19);
    if ((v20 & 1) != 0)
    {
      v21 = metricPropertyValue(v6, (void *)0x23);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    }
    else
    {
      v22 = 0;
    }
    objc_storeStrong((id *)&v10->_subscriptionSourceID, v22);
    if ((v20 & 1) != 0)

    v39 = v7;
    v23 = metricPropertyValue(v6, (void *)0x25);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
    {
      v26 = metricPropertyValue(v6, (void *)0x25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v10->_subscriptionType = objc_msgSend(v27, "intValue");

    }
    else
    {
      v10->_subscriptionType = 0;
    }

    v28 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    parameters = v10->_parameters;
    v10->_parameters = (NSMutableArray *)v28;

    v45[0] = kAPMetricSubscriptionPrice;
    v45[1] = kAPMetricSubscriptionCurrency;
    v45[2] = kAPMetricSubscriptionPurchase;
    v45[3] = kAPMetricSubscriptionIdentifier;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4));
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v41;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internalProperties"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v35));

          if (v37)
            -[APLogSubscriptionEventRequester addParameter:value:parameters:](v10, "addParameter:value:parameters:", v35, v37, v10->_parameters);

          v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v32);
    }

    v7 = v39;
  }

  return v10;
}

- (void)addParameter:(id)a3 value:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  APPBParameter *v10;

  if (a3)
  {
    if (a4)
    {
      v7 = a5;
      v8 = a4;
      v9 = a3;
      v10 = objc_alloc_init(APPBParameter);
      -[APPBParameter setKey:](v10, "setKey:", v9);

      -[APPBParameter setValue:](v10, "setValue:", v8);
      objc_msgSend(v7, "addObject:", v10);

    }
  }
}

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBLogSubscriptionEventResponse, a2);
}

- (id)protoBuffer
{
  APPBLogSubscriptionEventRequest *v3;
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

  v3 = objc_alloc_init(APPBLogSubscriptionEventRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APEncryptedIDProvider provider](APEncryptedIDProvider, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedIDsForIDAccountPrivate:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anonymousDemandID"));
  -[APPBLogSubscriptionEventRequest setAnonymousDemandiAdID:](v3, "setAnonymousDemandiAdID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentID"));
  -[APPBLogSubscriptionEventRequest setContentiAdID:](v3, "setContentiAdID:", v8);

  -[APPBLogSubscriptionEventRequest setEvent:](v3, "setEvent:", -[APLogSubscriptionEventRequester subscriptionType](self, "subscriptionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSince1970");
  -[APPBLogSubscriptionEventRequest setEventTime:](v3, "setEventTime:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iAdID"));
  -[APPBLogSubscriptionEventRequest setIAdID:](v3, "setIAdID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APLogSubscriptionEventRequester qToken](self, "qToken"));
  -[APPBLogSubscriptionEventRequest setQToken:](v3, "setQToken:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APLogSubscriptionEventRequester subscriptionSourceID](self, "subscriptionSourceID"));
  -[APPBLogSubscriptionEventRequest setSubscriptionSourceID:](v3, "setSubscriptionSourceID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APLogSubscriptionEventRequester parameters](self, "parameters"));
  -[APPBLogSubscriptionEventRequest setInfos:](v3, "setInfos:", v13);

  return v3;
}

- (NSString)qToken
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)subscriptionSourceID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSubscriptionSourceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

- (NSMutableArray)parameters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_subscriptionSourceID, 0);
  objc_storeStrong((id *)&self->_qToken, 0);
}

@end
