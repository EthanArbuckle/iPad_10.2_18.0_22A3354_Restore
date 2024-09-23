@implementation APMediaServiceRequestParameters

- (BOOL)validate
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters context](self, "context"));
  if (!v3)
    return v3;
  v4 = (void *)v3;
  v5 = objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters requestID](self, "requestID"));
  if (!v5)
  {

    goto LABEL_9;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters idAccount](self, "idAccount"));

  if (!v7)
  {
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }
  LOBYTE(v3) = (id)-[APMediaServiceRequestParameters placement](self, "placement") == (id)7005
            || (id)-[APMediaServiceRequestParameters placement](self, "placement") == (id)7006
            || (id)-[APMediaServiceRequestParameters placement](self, "placement") == (id)7007
            || (id)-[APMediaServiceRequestParameters placement](self, "placement") == (id)7008;
  return v3;
}

- (BOOL)hasOdml
{
  return (id)-[APMediaServiceRequestParameters placement](self, "placement") == (id)7005;
}

- (unint64_t)placement
{
  return self->_placement;
}

- (APIDAccount_Private)idAccount
{
  return self->_idAccount;
}

- (NSDate)requestTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("requestTime")));

  return (NSDate *)v4;
}

- (NSDictionary)appMetadataFields
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("appMetadataFields")));

  return (NSDictionary *)v4;
}

- (APContext)context
{
  return self->_context;
}

- (NSString)storeFront
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("storeFront")));

  return (NSString *)v4;
}

- (NSString)storeFrontLocale
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("storeFrontLocale")));

  return (NSString *)v4;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (void)setIdAccount:(id)a3
{
  objc_storeStrong((id *)&self->_idAccount, a3);
}

- (void)setDeliverEntireBatch:(BOOL)a3
{
  self->_deliverEntireBatch = a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (BOOL)deliverEntireBatch
{
  return self->_deliverEntireBatch;
}

- (APClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (NSString)adamId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMediaServiceRequestParameters context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("adamId")));

  return (NSString *)v4;
}

@end
