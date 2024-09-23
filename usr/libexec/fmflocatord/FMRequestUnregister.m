@implementation FMRequestUnregister

- (id)requestUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formattedURLForTemplate:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/unregister")));

  return v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FMRequestUnregister;
  v3 = -[FMRequest requestBody](&v17, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardDeviceContext"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceUDID"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("udid"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "productType"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("productType"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buildVersion"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "productVersion"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v15);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("deviceInfo"));
  return v4;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v6 = objc_opt_class(FMRequest, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    v9 = v7 == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
