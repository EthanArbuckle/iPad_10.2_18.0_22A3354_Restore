@implementation VUIStoreAcquisitionProperties

+ (id)metricsAugumentedBuyParamsWithBuyParams:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendFormat:", CFSTR("&mtApp=%@"), v7);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifierForVendor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("&vid=%@"), v10);

    v4 = (void *)objc_msgSend(v5, "copy");
  }

  return v4;
}

+ (id)acquisitionPropertiesWithBuyParams:(id)a3 urlbagKey:(id)a4
{
  id v5;
  id v6;
  VUIStoreAcquisitionProperties *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(VUIStoreAcquisitionProperties);
  -[VUIStoreAcquisitionProperties setBuyParams:](v7, "setBuyParams:", v6);

  -[VUIStoreAcquisitionProperties setUrlBagKey:](v7, "setUrlBagKey:", v5);
  return v7;
}

- (VUIStoreAcquisitionProperties)init
{
  VUIStoreAcquisitionProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIStoreAcquisitionProperties;
  result = -[VUIStoreAcquisitionProperties init](&v3, sel_init);
  if (result)
    result->_ignoresForcedPasswordRestriction = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  +[VUIStoreAcquisitionProperties acquisitionPropertiesWithBuyParams:urlbagKey:](VUIStoreAcquisitionProperties, "acquisitionPropertiesWithBuyParams:urlbagKey:", self->_buyParams, self->_urlBagKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDsid:", self->_dsid);
  objc_msgSend(v4, "setUserAgent:", self->_userAgent);
  objc_msgSend(v4, "setStrongToken:", self->_strongToken);
  objc_msgSend(v4, "setIgnoresForcedPasswordRestriction:", self->_ignoresForcedPasswordRestriction);
  return v4;
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)urlBagKey
{
  return self->_urlBagKey;
}

- (void)setUrlBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)strongToken
{
  return self->_strongToken;
}

- (void)setStrongToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)ignoresForcedPasswordRestriction
{
  return self->_ignoresForcedPasswordRestriction;
}

- (void)setIgnoresForcedPasswordRestriction:(BOOL)a3
{
  self->_ignoresForcedPasswordRestriction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
}

@end
