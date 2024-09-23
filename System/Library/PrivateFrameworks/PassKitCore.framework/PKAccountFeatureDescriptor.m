@implementation PKAccountFeatureDescriptor

- (PKAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4;
  PKAccountFeatureDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKOSVersionRequirementRange *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minimumAmount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMinimumAmount:](v5, "setMinimumAmount:", v7);

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("maximumAmount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMaximumAmount:](v5, "setMaximumAmount:", v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMerchantIdentifier:](v5, "setMerchantIdentifier:", v9);

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedNetworks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setSupportedNetworks:](v5, "setSupportedNetworks:", v10);

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMerchantCapabilities:](v5, "setMerchantCapabilities:", PKMerchantCapabilityFromStrings(v11));

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("osVersionRange"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[PKOSVersionRequirementRange initWithDictionary:]([PKOSVersionRequirementRange alloc], "initWithDictionary:", v12);
      -[PKAccountFeatureDescriptor setOsVersionRange:](v5, "setOsVersionRange:", v13);

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("fundingSourceTermsIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setFundingSourceTermsIdentifier:](v5, "setFundingSourceTermsIdentifier:", v14);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFeatureDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKAccountFeatureDescriptor *v5;
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
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumAmount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMinimumAmount:](v5, "setMinimumAmount:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumAmount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMaximumAmount:](v5, "setMaximumAmount:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMerchantIdentifier:](v5, "setMerchantIdentifier:", v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedNetworks"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setSupportedNetworks:](v5, "setSupportedNetworks:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setMerchantCapabilities:](v5, "setMerchantCapabilities:", objc_msgSend(v14, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersionRange"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setOsVersionRange:](v5, "setOsVersionRange:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSourceTermsIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountFeatureDescriptor setFundingSourceTermsIdentifier:](v5, "setFundingSourceTermsIdentifier:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PKAccountFeatureDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[PKAccountFeatureDescriptor minimumAmount](self, "minimumAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("minimumAmount"));

  -[PKAccountFeatureDescriptor maximumAmount](self, "maximumAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("maximumAmount"));

  -[PKAccountFeatureDescriptor merchantIdentifier](self, "merchantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("merchantIdentifier"));

  -[PKAccountFeatureDescriptor supportedNetworks](self, "supportedNetworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("supportedNetworks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKAccountFeatureDescriptor merchantCapabilities](self, "merchantCapabilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("merchantCapabilities"));

  -[PKAccountFeatureDescriptor osVersionRange](self, "osVersionRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("osVersionRange"));

  -[PKAccountFeatureDescriptor fundingSourceTermsIdentifier](self, "fundingSourceTermsIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("fundingSourceTermsIdentifier"));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "addObject:");
  if (self->_minimumAmount)
    objc_msgSend(v4, "addObject:");
  if (self->_maximumAmount)
    objc_msgSend(v4, "addObject:");
  if (self->_merchantIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_supportedNetworks)
    objc_msgSend(v4, "addObject:");
  if (self->_osVersionRange)
    objc_msgSend(v4, "addObject:");
  if (self->_fundingSourceTermsIdentifier)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_merchantCapabilities - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountFeatureDescriptor *v4;
  PKAccountFeatureDescriptor *v5;
  BOOL v6;

  v4 = (PKAccountFeatureDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountFeatureDescriptor isEqualToAccountFeatureDescriptor:](self, "isEqualToAccountFeatureDescriptor:", v5);

  return v6;
}

- (BOOL)isEqualToAccountFeatureDescriptor:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSDecimalNumber *minimumAmount;
  NSDecimalNumber *v9;
  NSDecimalNumber *maximumAmount;
  NSDecimalNumber *v11;
  NSString *merchantIdentifier;
  NSString *v13;
  NSArray *supportedNetworks;
  NSArray *v15;
  PKOSVersionRequirementRange *osVersionRange;
  PKOSVersionRequirementRange *v17;
  NSString *fundingSourceTermsIdentifier;
  NSString *v19;
  BOOL v20;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_39;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_39;
  }
  minimumAmount = self->_minimumAmount;
  v9 = (NSDecimalNumber *)v4[2];
  if (minimumAmount && v9)
  {
    if ((-[NSDecimalNumber isEqual:](minimumAmount, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (minimumAmount != v9)
  {
    goto LABEL_39;
  }
  maximumAmount = self->_maximumAmount;
  v11 = (NSDecimalNumber *)v4[3];
  if (maximumAmount && v11)
  {
    if ((-[NSDecimalNumber isEqual:](maximumAmount, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (maximumAmount != v11)
  {
    goto LABEL_39;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v13 = (NSString *)v4[4];
  if (merchantIdentifier && v13)
  {
    if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (merchantIdentifier != v13)
  {
    goto LABEL_39;
  }
  supportedNetworks = self->_supportedNetworks;
  v15 = (NSArray *)v4[5];
  if (supportedNetworks && v15)
  {
    if ((-[NSArray isEqual:](supportedNetworks, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (supportedNetworks != v15)
  {
    goto LABEL_39;
  }
  osVersionRange = self->_osVersionRange;
  v17 = (PKOSVersionRequirementRange *)v4[7];
  if (osVersionRange && v17)
  {
    if (!-[PKOSVersionRequirementRange isEqual:](osVersionRange, "isEqual:"))
      goto LABEL_39;
  }
  else if (osVersionRange != v17)
  {
    goto LABEL_39;
  }
  fundingSourceTermsIdentifier = self->_fundingSourceTermsIdentifier;
  v19 = (NSString *)v4[8];
  if (!fundingSourceTermsIdentifier || !v19)
  {
    if (fundingSourceTermsIdentifier == v19)
      goto LABEL_37;
LABEL_39:
    v20 = 0;
    goto LABEL_40;
  }
  if ((-[NSString isEqual:](fundingSourceTermsIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_39;
LABEL_37:
  v20 = self->_merchantCapabilities == v4[6];
LABEL_40:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_minimumAmount, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_maximumAmount, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSArray copyWithZone:](self->_supportedNetworks, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[PKOSVersionRequirementRange copyWithZone:](self->_osVersionRange, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v18 = -[NSString copyWithZone:](self->_fundingSourceTermsIdentifier, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  v5[6] = self->_merchantCapabilities;
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unint64_t)a3
{
  self->_merchantCapabilities = a3;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionRange, a3);
}

- (NSString)fundingSourceTermsIdentifier
{
  return self->_fundingSourceTermsIdentifier;
}

- (void)setFundingSourceTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSourceTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
