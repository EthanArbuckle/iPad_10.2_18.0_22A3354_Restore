@implementation PKPaymentSetupProductImageAssetURLs

- (PKPaymentSetupProductImageAssetURLs)initWithImageAssetsDictionary:(id)a3
{
  id v4;
  PKPaymentSetupProductImageAssetURLs *v5;
  double v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *digitalCardImageUrl;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *thumbnailImageUrl;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *logoImageUrl;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupProductImageAssetURLs;
  v5 = -[PKPaymentSetupProductImageAssetURLs init](&v25, sel_init);
  if (v5)
  {
    v6 = PKScreenScale();
    v7 = CFSTR("2x");
    if (v6 > 2.0)
      v7 = CFSTR("3x");
    v8 = (void *)MEMORY[0x1E0C99E98];
    v9 = v7;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("digitalCardImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    digitalCardImageUrl = v5->_digitalCardImageUrl;
    v5->_digitalCardImageUrl = (NSURL *)v12;

    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("thumbnailImage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    thumbnailImageUrl = v5->_thumbnailImageUrl;
    v5->_thumbnailImageUrl = (NSURL *)v17;

    v19 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("logoImage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "URLWithString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    logoImageUrl = v5->_logoImageUrl;
    v5->_logoImageUrl = (NSURL *)v22;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentSetupProductImageAssetURLs *v5;
  uint64_t v6;
  NSURL *digitalCardImageUrl;
  uint64_t v8;
  NSURL *thumbnailImageUrl;
  uint64_t v10;
  NSURL *logoImageUrl;

  v5 = -[PKPaymentSetupProductImageAssetURLs init](+[PKPaymentSetupProductImageAssetURLs allocWithZone:](PKPaymentSetupProductImageAssetURLs, "allocWithZone:"), "init");
  v6 = -[NSURL copyWithZone:](self->_digitalCardImageUrl, "copyWithZone:", a3);
  digitalCardImageUrl = v5->_digitalCardImageUrl;
  v5->_digitalCardImageUrl = (NSURL *)v6;

  v8 = -[NSURL copyWithZone:](self->_thumbnailImageUrl, "copyWithZone:", a3);
  thumbnailImageUrl = v5->_thumbnailImageUrl;
  v5->_thumbnailImageUrl = (NSURL *)v8;

  v10 = -[NSURL copyWithZone:](self->_logoImageUrl, "copyWithZone:", a3);
  logoImageUrl = v5->_logoImageUrl;
  v5->_logoImageUrl = (NSURL *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProductImageAssetURLs)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupProductImageAssetURLs *v5;
  uint64_t v6;
  NSURL *digitalCardImageUrl;
  uint64_t v8;
  NSURL *thumbnailImageUrl;
  uint64_t v10;
  NSURL *logoImageUrl;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupProductImageAssetURLs;
  v5 = -[PKPaymentSetupProductImageAssetURLs init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("digitalCardImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    digitalCardImageUrl = v5->_digitalCardImageUrl;
    v5->_digitalCardImageUrl = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailImage"));
    v8 = objc_claimAutoreleasedReturnValue();
    thumbnailImageUrl = v5->_thumbnailImageUrl;
    v5->_thumbnailImageUrl = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    logoImageUrl = v5->_logoImageUrl;
    v5->_logoImageUrl = (NSURL *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *digitalCardImageUrl;
  id v5;

  digitalCardImageUrl = self->_digitalCardImageUrl;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", digitalCardImageUrl, CFSTR("digitalCardImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailImageUrl, CFSTR("thumbnailImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logoImageUrl, CFSTR("logoImage"));

}

- (NSURL)digitalCardImageUrl
{
  return self->_digitalCardImageUrl;
}

- (NSURL)thumbnailImageUrl
{
  return self->_thumbnailImageUrl;
}

- (NSURL)logoImageUrl
{
  return self->_logoImageUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoImageUrl, 0);
  objc_storeStrong((id *)&self->_thumbnailImageUrl, 0);
  objc_storeStrong((id *)&self->_digitalCardImageUrl, 0);
}

@end
