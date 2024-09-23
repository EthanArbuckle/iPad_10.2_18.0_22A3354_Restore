@implementation FMDRepairDeviceRequest

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDRepairDeviceRequest;
  v2 = -[FMDRequest requestHeaders](&v4, "requestHeaders");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (FMDRepairDeviceRequest)initWithDeviceIdentifier:(id)a3 ephemeralToken:(id)a4 dsid:(id)a5 callingClient:(id)a6 mode:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FMDRepairDeviceRequest *v17;
  FMDRepairDeviceRequest *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FMDRepairDeviceRequest;
  v17 = -[FMDRequest initWithAccount:](&v20, "initWithAccount:", v13);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountForRepair, a3);
    objc_storeStrong((id *)&v18->_ephemeralToken, a4);
    objc_storeStrong((id *)&v18->_dsid, a5);
    objc_storeStrong((id *)&v18->_callingClient, a6);
    v18->_mode = a7;
  }

  return v18;
}

- (id)requestUrl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  RequestTemplateURL *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRepairDeviceRequest dsid](self, "dsid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("${scheme}://${hostname}/fmipservice/findme/%@/${udid}/repairDeviceV2"), v5));

  v7 = objc_alloc_init(RequestTemplateURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRepairDeviceRequest accountForRepair](self, "accountForRepair"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v7, "urlFromTemplate:account:udid:", v6, v8, v4));

  return v9;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FMDRepairDeviceRequest;
  v3 = -[FMDRequest requestBody](&v11, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRepairDeviceRequest ephemeralToken](self, "ephemeralToken"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("authToken"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceUDID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("device"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authId](self, "authId"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("requestingUserPrsId"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_callingClient, CFSTR("originClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRepairDeviceRequest repairContextString:](self, "repairContextString:", self->_mode));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));

  return v4;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (id)repairContextString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("repair");
  if (a3 == 2)
    v3 = CFSTR("tradeIn");
  if (a3)
    return (id)v3;
  else
    return CFSTR("unknown");
}

- (FMDAccount)accountForRepair
{
  return self->_accountForRepair;
}

- (void)setAccountForRepair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)ephemeralToken
{
  return self->_ephemeralToken;
}

- (void)setEphemeralToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)callingClient
{
  return self->_callingClient;
}

- (void)setCallingClient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingClient, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_ephemeralToken, 0);
  objc_storeStrong((id *)&self->_accountForRepair, 0);
}

@end
