@implementation FMDRequestMissingDevice

- (FMDRequestMissingDevice)initWithAccount:(id)a3 token:(id)a4 andMissingDeviceInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDRequestMissingDevice *v11;
  FMDRequestMissingDevice *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestMissingDevice;
  v11 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v8);
  v12 = v11;
  if (v11)
  {
    -[FMDRequestMissingDevice setAccount:](v11, "setAccount:", v8);
    objc_storeStrong((id *)&v12->_missingDeviceInfo, a5);
    objc_storeStrong((id *)&v12->_shortLivedToken, a4);
  }

  return v12;
}

- (id)urlTemplateType
{
  return CFSTR("missingDevice");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  FMDActingRequestDecorator *v5;
  void *v6;
  void *v7;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FMDRequestMissingDevice;
  v3 = -[FMDRequest requestBody](&v19, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc_init(FMDActingRequestDecorator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](v5, "standardDeviceContext"));

  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestMissingDevice missingDeviceInfo](self, "missingDeviceInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "udid"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("udid"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "productType"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("productType"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buildVersion"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "productVersion"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v12);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("deviceInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imei"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("imei"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "meid"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("meid"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceUDID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("hostDeviceUdid"), v17);

  return v4;
}

- (id)authToken
{
  return -[FMDRequestMissingDevice shortLivedToken](self, "shortLivedToken");
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  v9 = 1;
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v8 = objc_opt_class(FMDRequestMissingDevice, v7);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
      v9 = 0;
  }

  return v9;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FMDFMIPMissingDeviceInfo)missingDeviceInfo
{
  return self->_missingDeviceInfo;
}

- (void)setMissingDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_missingDeviceInfo, a3);
}

- (NSString)shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)setShortLivedToken:(id)a3
{
  objc_storeStrong((id *)&self->_shortLivedToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_missingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
