@implementation CDStorePurchaseGetAuthInfoResponse

- (CDStorePurchaseGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDStorePurchaseGetAuthInfoResponse *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  AMSDelegatePurchaseRequest *purchaseRequest;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDStorePurchaseGetAuthInfoResponse;
  v5 = -[CDStorePurchaseGetAuthInfoResponse init](&v12, "init");
  if (v5)
  {
    v6 = objc_opt_self(AMSDelegatePurchaseRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("purchaseRequest"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    purchaseRequest = v5->_purchaseRequest;
    v5->_purchaseRequest = (AMSDelegatePurchaseRequest *)v9;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = sub_10001A22C((uint64_t)self->_purchaseRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("purchaseRequest"));

  v6 = objc_msgSend(v3, "copy");
  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_purchaseRequest, CFSTR("purchaseRequest"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
}

- (AMSDelegatePurchaseRequest)purchaseRequest
{
  return self->_purchaseRequest;
}

- (void)setPurchaseRequest:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
}

@end
