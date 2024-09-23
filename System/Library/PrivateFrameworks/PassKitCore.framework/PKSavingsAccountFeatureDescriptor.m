@implementation PKSavingsAccountFeatureDescriptor

- (PKSavingsAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4;
  PKSavingsAccountFeatureDescriptor *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *transferTermsIdentifier;
  uint64_t v10;
  NSArray *supportedFileFormatsForTransactionData;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor initWithDictionary:](&v14, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("fundingSourceTypes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fundingSourceTypes = PKAccountFundingSourceTypeFromStrings(v6);

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("transferFrequencies"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transferFrequencies = PKAccountTransferFrequencyFromStrings(v7);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("transferTermsIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    transferTermsIdentifier = v5->_transferTermsIdentifier;
    v5->_transferTermsIdentifier = (NSString *)v8;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedFileFormatsForTransactionData"));
    v10 = objc_claimAutoreleasedReturnValue();
    supportedFileFormatsForTransactionData = v5->_supportedFileFormatsForTransactionData;
    v5->_supportedFileFormatsForTransactionData = (NSArray *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("contactMethod"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contactMethod = PKAccountAddBeneficiariesContactMethodFromString(v12);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountFeatureDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSavingsAccountFeatureDescriptor *v5;
  uint64_t v6;
  NSString *transferTermsIdentifier;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *supportedFileFormatsForTransactionData;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_fundingSourceTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fundingSourceTypes"));
    v5->_transferFrequencies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferFrequencies"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferTermsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transferTermsIdentifier = v5->_transferTermsIdentifier;
    v5->_transferTermsIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedFileFormatsForTransactionData"));
    v11 = objc_claimAutoreleasedReturnValue();
    supportedFileFormatsForTransactionData = v5->_supportedFileFormatsForTransactionData;
    v5->_supportedFileFormatsForTransactionData = (NSArray *)v11;

    v5->_contactMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contactMethod"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v4 = a3;
  -[PKAccountFeatureDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_fundingSourceTypes, CFSTR("fundingSourceTypes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transferFrequencies, CFSTR("transferFrequencies"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferTermsIdentifier, CFSTR("transferTermsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedFileFormatsForTransactionData, CFSTR("supportedFileFormatsForTransactionData"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contactMethod, CFSTR("contactMethod"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountFeatureDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("scheduleOneTimeDeposit")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("scheduleOneTimeWithdrawal")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("addFundingSource")))
    {
      -[PKAccountFeatureDescriptor fundingSourceTermsIdentifier](self, "fundingSourceTermsIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("fundingSourceTermsIdentifier: '%@'; "), v12);
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("exportTransactionData")))
      {
        objc_msgSend(v3, "appendFormat:", CFSTR("supportedFileFormatsForTransactionData: '%@'; "),
          self->_supportedFileFormatsForTransactionData);
        goto LABEL_4;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("addBeneficiaries")))
        goto LABEL_4;
      PKAccountAddBeneficiariesContactMethodToString(self->_contactMethod);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("contactMethod: '%@'"), v12);
    }

    goto LABEL_4;
  }
  -[PKAccountFeatureDescriptor minimumAmount](self, "minimumAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAmount: '%@'; "), v5);

  -[PKAccountFeatureDescriptor maximumAmount](self, "maximumAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAmount: '%@'; "), v6);

  -[PKAccountFeatureDescriptor merchantIdentifier](self, "merchantIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantIdentifier: '%@'; "), v7);

  -[PKAccountFeatureDescriptor supportedNetworks](self, "supportedNetworks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedNetworks: '%@'; "), v8);

  PKAccountFundingSourceTypeToStrings(self->_fundingSourceTypes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSourceTypes: '%@'; "), v9);

  PKAccountTransferFrequencyToStrings(self->_transferFrequencies);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transferFrequencies: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("transferTermsIdentifier: '%@'; "), self->_transferTermsIdentifier);
LABEL_4:
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v3 = -[PKAccountFeatureDescriptor hash](&v10, sel_hash);
  v4 = self->_fundingSourceTypes - v3 + 32 * v3;
  v5 = self->_transferFrequencies - v4 + 32 * v4;
  v6 = self->_contactMethod - v5 + 32 * v5;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "safelyAddObject:", self->_transferTermsIdentifier);
  objc_msgSend(v7, "safelyAddObject:", self->_supportedFileFormatsForTransactionData);
  v8 = PKCombinedHash(v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKSavingsAccountFeatureDescriptor *v4;
  PKSavingsAccountFeatureDescriptor *v5;
  BOOL v6;

  v4 = (PKSavingsAccountFeatureDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKSavingsAccountFeatureDescriptor isEqualToSavingsAccountFeatureDescriptor:](self, "isEqualToSavingsAccountFeatureDescriptor:", v5);

  return v6;
}

- (BOOL)isEqualToSavingsAccountFeatureDescriptor:(id)a3
{
  _QWORD *v4;
  NSString *transferTermsIdentifier;
  NSString *v6;
  BOOL v7;
  NSArray *supportedFileFormatsForTransactionData;
  NSArray *v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  if (!-[PKAccountFeatureDescriptor isEqualToAccountFeatureDescriptor:](self, "isEqualToAccountFeatureDescriptor:", v4)
    || self->_fundingSourceTypes != v4[9]
    || self->_transferFrequencies != v4[10])
  {
    goto LABEL_18;
  }
  transferTermsIdentifier = self->_transferTermsIdentifier;
  v6 = (NSString *)v4[11];
  if (transferTermsIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (transferTermsIdentifier != v6)
      goto LABEL_18;
  }
  else if ((-[NSString isEqual:](transferTermsIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_18;
  }
  supportedFileFormatsForTransactionData = self->_supportedFileFormatsForTransactionData;
  v9 = (NSArray *)v4[12];
  if (supportedFileFormatsForTransactionData)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (supportedFileFormatsForTransactionData == v9)
    {
LABEL_21:
      v11 = self->_contactMethod == v4[13];
      goto LABEL_19;
    }
  }
  else if ((-[NSArray isEqual:](supportedFileFormatsForTransactionData, "isEqual:") & 1) != 0)
  {
    goto LABEL_21;
  }
LABEL_18:
  v11 = 0;
LABEL_19:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor copyWithZone:](&v11, sel_copyWithZone_);
  v5[9] = self->_fundingSourceTypes;
  v5[10] = self->_transferFrequencies;
  v6 = -[NSString copyWithZone:](self->_transferTermsIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[11];
  v5[11] = v6;

  v8 = -[NSArray copyWithZone:](self->_supportedFileFormatsForTransactionData, "copyWithZone:", a3);
  v9 = (void *)v5[12];
  v5[12] = v8;

  v5[13] = self->_contactMethod;
  return v5;
}

- (unint64_t)fundingSourceTypes
{
  return self->_fundingSourceTypes;
}

- (void)setFundingSourceTypes:(unint64_t)a3
{
  self->_fundingSourceTypes = a3;
}

- (unint64_t)transferFrequencies
{
  return self->_transferFrequencies;
}

- (void)setTransferFrequencies:(unint64_t)a3
{
  self->_transferFrequencies = a3;
}

- (NSString)transferTermsIdentifier
{
  return self->_transferTermsIdentifier;
}

- (void)setTransferTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)supportedFileFormatsForTransactionData
{
  return self->_supportedFileFormatsForTransactionData;
}

- (void)setSupportedFileFormatsForTransactionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)contactMethod
{
  return self->_contactMethod;
}

- (void)setContactMethod:(unint64_t)a3
{
  self->_contactMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFileFormatsForTransactionData, 0);
  objc_storeStrong((id *)&self->_transferTermsIdentifier, 0);
}

@end
