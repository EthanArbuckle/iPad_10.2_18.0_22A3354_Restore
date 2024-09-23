@implementation PKPassBarcodeSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeServiceURL, 0);
}

- (PKPassBarcodeSettings)initWithDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPassBarcodeSettings;
    v5 = -[PKPassBarcodeSettings init](&v8, sel_init);
    if (v5)
    {
      *((_QWORD *)v5 + 1) = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("initialBarcodeFetchCount"));
      objc_msgSend(v4, "PKURLForKey:", CFSTR("barcodeServiceURL"));
      v6 = objc_claimAutoreleasedReturnValue();
      self = (PKPassBarcodeSettings *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v6;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return (PKPassBarcodeSettings *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassBarcodeSettings)initWithCoder:(id)a3
{
  id v4;
  PKPassBarcodeSettings *v5;
  uint64_t v6;
  NSURL *barcodeServiceURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassBarcodeSettings;
  v5 = -[PKPassBarcodeSettings init](&v9, sel_init);
  if (v5)
  {
    v5->_initialBarcodeFetchCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialBarcodeFetchCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeServiceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    barcodeServiceURL = v5->_barcodeServiceURL;
    v5->_barcodeServiceURL = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t initialBarcodeFetchCount;
  id v5;

  initialBarcodeFetchCount = self->_initialBarcodeFetchCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", initialBarcodeFetchCount, CFSTR("initialBarcodeFetchCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_barcodeServiceURL, CFSTR("barcodeServiceURL"));

}

- (int64_t)initialBarcodeFetchCount
{
  return self->_initialBarcodeFetchCount;
}

- (NSURL)barcodeServiceURL
{
  return self->_barcodeServiceURL;
}

@end
