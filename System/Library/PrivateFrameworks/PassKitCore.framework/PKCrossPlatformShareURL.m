@implementation PKCrossPlatformShareURL

- (PKCrossPlatformShareURL)initWithURL:(id)a3 expectedPairedReaderIdentifier:(id)a4 expectedProvisioningCredentialHash:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKCrossPlatformShareURL *v12;
  PKCrossPlatformShareURL *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKCrossPlatformShareURL;
  v12 = -[PKCrossPlatformShareURL init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    if (!v10 || !v11)
    {
      objc_storeStrong((id *)&v13->_expectedPairedReaderIdentifier, a4);
      objc_storeStrong((id *)&v13->_expectedProvisioningCredentialHash, a5);
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCrossPlatformShareURL)initWithCoder:(id)a3
{
  id v4;
  PKCrossPlatformShareURL *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *expectedPairedReaderIdentifier;
  uint64_t v10;
  NSString *expectedProvisioningCredentialHash;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCrossPlatformShareURL;
  v5 = -[PKCrossPlatformShareURL init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedPairedReaderIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    expectedPairedReaderIdentifier = v5->_expectedPairedReaderIdentifier;
    v5->_expectedPairedReaderIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedProvisioningCredentialHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    expectedProvisioningCredentialHash = v5->_expectedProvisioningCredentialHash;
    v5->_expectedProvisioningCredentialHash = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedPairedReaderIdentifier, CFSTR("expectedPairedReaderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedProvisioningCredentialHash, CFSTR("expectedProvisioningCredentialHash"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("url: '%@'; "), self->_url);
  objc_msgSend(v6, "appendFormat:", CFSTR("expectedPairedReaderIdentifier: '%@'; "),
    self->_expectedPairedReaderIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("expectedProvisioningCredentialHash: '%@'; "),
    self->_expectedProvisioningCredentialHash);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_url)
    objc_msgSend(v3, "addObject:");
  if (self->_expectedPairedReaderIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_expectedProvisioningCredentialHash)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKCrossPlatformShareURL *v4;
  PKCrossPlatformShareURL *v5;
  BOOL v6;

  v4 = (PKCrossPlatformShareURL *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCrossPlatformShareURL isEqualToCrossPlatformShareURL:](self, "isEqualToCrossPlatformShareURL:", v5);

  return v6;
}

- (BOOL)isEqualToCrossPlatformShareURL:(id)a3
{
  _QWORD *v4;
  NSURL *url;
  NSURL *v6;
  BOOL v7;
  NSString *expectedPairedReaderIdentifier;
  NSString *v9;
  NSString *expectedProvisioningCredentialHash;
  NSString *v11;
  char v12;

  v4 = a3;
  if (!v4)
    goto LABEL_17;
  url = self->_url;
  v6 = (NSURL *)v4[1];
  if (url)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (url != v6)
      goto LABEL_17;
  }
  else if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  expectedPairedReaderIdentifier = self->_expectedPairedReaderIdentifier;
  v9 = (NSString *)v4[2];
  if (!expectedPairedReaderIdentifier || !v9)
  {
    if (expectedPairedReaderIdentifier == v9)
      goto LABEL_13;
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSString isEqual:](expectedPairedReaderIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_13:
  expectedProvisioningCredentialHash = self->_expectedProvisioningCredentialHash;
  v11 = (NSString *)v4[3];
  if (expectedProvisioningCredentialHash && v11)
    v12 = -[NSString isEqual:](expectedProvisioningCredentialHash, "isEqual:");
  else
    v12 = expectedProvisioningCredentialHash == v11;
LABEL_18:

  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)expectedPairedReaderIdentifier
{
  return self->_expectedPairedReaderIdentifier;
}

- (NSString)expectedProvisioningCredentialHash
{
  return self->_expectedProvisioningCredentialHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedProvisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_expectedPairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
