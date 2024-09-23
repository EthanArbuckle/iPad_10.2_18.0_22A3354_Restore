@implementation PKSecureElementCertificateSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSecureElementCertificateSet)init
{

  return 0;
}

- (PKSecureElementCertificateSet)initWithDictionary:(id)a3
{
  id v4;
  PKSecureElementCertificateSet *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKSecureElementCertificateSet;
    v5 = -[PKSecureElementCertificateSet init](&v9, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v6;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (PKSecureElementCertificateSet)initWithRSACertificate:(id)a3 ECDSACertificate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PKSecureElementCertificateSet *v12;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  PKGetConstantStringNFSecureElementManagerSessionECDSACertificateKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v11);

  v12 = -[PKSecureElementCertificateSet initWithDictionary:](self, "initWithDictionary:", v9);
  return v12;
}

- (PKSecureElementCertificateSet)initWithCoder:(id)a3
{
  id v4;
  PKSecureElementCertificateSet *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSecureElementCertificateSet;
  v5 = -[PKSecureElementCertificateSet init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("dictionary"));
    v6 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v5->_supportsLegacyFormats = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsLegacyFormats"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSDictionary copyWithZone:](self->_dictionary, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_BYTE *)(v5 + 8) = self->_supportsLegacyFormats;
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *dictionary;
  id v5;

  dictionary = self->_dictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dictionary, CFSTR("dictionary"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsLegacyFormats, CFSTR("supportsLegacyFormats"));

}

- (id)certificateOfType:(unint64_t)a3
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  NSDictionary *dictionary;
  void *v8;

  if (a3 == 1)
  {
    dictionary = self->_dictionary;
    PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (a3)
    goto LABEL_6;
  v4 = self->_dictionary;
  PKGetConstantStringNFSecureElementManagerSessionECDSACertificateKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (self->_supportsLegacyFormats)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("ECC"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
LABEL_6:
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (BOOL)supportsLegacyFormats
{
  return self->_supportsLegacyFormats;
}

- (void)setSupportsLegacyFormats:(BOOL)a3
{
  self->_supportsLegacyFormats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
