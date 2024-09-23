@implementation PKPaymentProvisioningMethodTypeAppClip

- (PKPaymentProvisioningMethodTypeAppClip)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentProvisioningMethodTypeAppClip *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *appClipLaunchURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  v5 = -[PKPaymentProvisioningMethod initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "PKStringForKey:", CFSTR("appClipLaunchURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    appClipLaunchURL = v5->_appClipLaunchURL;
    v5->_appClipLaunchURL = (NSURL *)v8;

  }
  return v5;
}

- (void)_decorateDescription:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  v4 = a3;
  -[PKPaymentProvisioningMethod _decorateDescription:](&v5, sel__decorateDescription_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("appClipLaunchURL: '%@'; "), self->_appClipLaunchURL);

}

- (PKPaymentProvisioningMethodTypeAppClip)initWithCoder:(id)a3
{
  id v4;
  PKPaymentProvisioningMethodTypeAppClip *v5;
  uint64_t v6;
  NSURL *appClipLaunchURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  v5 = -[PKPaymentProvisioningMethod initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appClipLaunchURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    appClipLaunchURL = v5->_appClipLaunchURL;
    v5->_appClipLaunchURL = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCode:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeAppClip;
  v4 = a3;
  -[PKPaymentProvisioningMethod encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appClipLaunchURL, CFSTR("appClipLaunchURL"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentProvisioningMethodTypeAppClip *v5;
  uint64_t v6;
  NSURL *appClipLaunchURL;

  v5 = objc_alloc_init(PKPaymentProvisioningMethodTypeAppClip);
  -[PKPaymentProvisioningMethod _copyInto:](self, "_copyInto:", v5);
  v6 = -[NSURL copyWithZone:](self->_appClipLaunchURL, "copyWithZone:", a3);
  appClipLaunchURL = v5->_appClipLaunchURL;
  v5->_appClipLaunchURL = (NSURL *)v6;

  return v5;
}

- (NSURL)appClipLaunchURL
{
  return self->_appClipLaunchURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipLaunchURL, 0);
}

@end
