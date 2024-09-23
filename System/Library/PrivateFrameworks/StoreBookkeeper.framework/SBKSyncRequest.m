@implementation SBKSyncRequest

+ (id)requestForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "syncRequestURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestWithRequestURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMethod:", 1);
  +[SBKRequestData propertyListBodyWithTransaction:](SBKSyncRequestData, "propertyListBodyWithTransaction:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBodyDataWithPropertyList:", v7);

  objc_msgSend(v6, "setTransaction:", v4);
  objc_msgSend(v6, "setIncludeDeviceGUID:", 1);
  return v6;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBKRequest transaction](self, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKSyncResponse responseWithResponse:transaction:](SBKSyncResponse, "responseWithResponse:transaction:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
