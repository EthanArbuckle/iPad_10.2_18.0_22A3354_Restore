@implementation FMDActivationLockFailureAnalytics

- (FMDActivationLockFailureAnalytics)initWithAccountAndError:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  objc_super v10;

  v7 = a4;
  if (self)
  {
    v8 = a3;
    objc_storeWeak((id *)&self->_account, v8);
    objc_storeStrong((id *)&self->_error, a4);
    v10.receiver = self;
    v10.super_class = (Class)FMDActivationLockFailureAnalytics;
    self = -[FMDRequest initWithAccount:](&v10, "initWithAccount:", v8);

  }
  return self;
}

- (id)requestUrl
{
  void *v3;
  void *v4;
  RequestTemplateURL *v5;
  id WeakRetained;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));
  v5 = objc_alloc_init(RequestTemplateURL);
  WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v5, "urlFromTemplate:account:udid:", CFSTR("${scheme}://${hostname}/fmipservice/findme/metrics"), WeakRetained, v4));

  return v7;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FMDActivationLockFailureAnalytics;
  v3 = -[FMDRequest requestBody](&v20, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("findmyd"), CFSTR("source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "fm_epoch")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("timestamp"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceUDID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("udid"), v8);

  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  objc_msgSend(v9, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productType"));
  objc_msgSend(v9, "fm_safelyMapKey:toObject:", CFSTR("productType"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "internationalMobileEquipmentIdentity"));
  objc_msgSend(v9, "fm_safelyMapKey:toObject:", CFSTR("imei"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "internationalMobileEquipmentIdentityTwo"));
  objc_msgSend(v9, "fm_safelyMapKey:toObject:", CFSTR("imei2"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mobileEquipmentIdentifier"));
  objc_msgSend(v9, "fm_safelyMapKey:toObject:", CFSTR("meid"), v14);

  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSError code](self->_error, "code")));
  objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("errorCode"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](self->_error, "description"));
  objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("errorMessage"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self->_error, "domain"));
  objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("errorCategory"), v18);

  objc_msgSend(v9, "fm_safelyMapKey:toObject:", CFSTR("errorDetails"), v15);
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("activationLockFailure"), v9);

  return v4;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDActivationLockFailureAnalytics;
  v2 = -[FMDRequest requestHeaders](&v4, "requestHeaders");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (FMDAccount)account
{
  return (FMDAccount *)objc_loadWeakRetained((id *)&self->_account);
}

- (void)setAccount:(id)a3
{
  objc_storeWeak((id *)&self->_account, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_account);
}

@end
