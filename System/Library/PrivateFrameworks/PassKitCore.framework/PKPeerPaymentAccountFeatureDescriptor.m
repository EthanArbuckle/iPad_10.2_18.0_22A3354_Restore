@implementation PKPeerPaymentAccountFeatureDescriptor

- (PKPeerPaymentAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentAccountFeatureDescriptor *v5;
  uint64_t v6;
  NSDecimalNumber *feePercentage;
  uint64_t v8;
  NSDecimalNumber *minimumFee;
  uint64_t v10;
  NSDecimalNumber *maximumFee;
  void *v12;
  uint64_t v13;
  NSArray *amountSuggestions;
  void *v15;
  uint64_t v16;
  NSArray *thresholdSuggestions;
  uint64_t v18;
  NSArray *frequencyOptions;
  void *v20;
  void *v21;
  uint64_t v22;
  NSTimeZone *productTimeZone;
  double v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor initWithDictionary:](&v27, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("feePercentage"));
    v6 = objc_claimAutoreleasedReturnValue();
    feePercentage = v5->_feePercentage;
    v5->_feePercentage = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minimumFee"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumFee = v5->_minimumFee;
    v5->_minimumFee = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("maximumFee"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumFee = v5->_maximumFee;
    v5->_maximumFee = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("amountSuggestions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccountFeatureDescriptor _suggestionsFromStrings:](v5, "_suggestionsFromStrings:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    amountSuggestions = v5->_amountSuggestions;
    v5->_amountSuggestions = (NSArray *)v13;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("thresholdSuggestions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPeerPaymentAccountFeatureDescriptor _suggestionsFromStrings:](v5, "_suggestionsFromStrings:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    thresholdSuggestions = v5->_thresholdSuggestions;
    v5->_thresholdSuggestions = (NSArray *)v16;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("frequencyOptions"));
    v18 = objc_claimAutoreleasedReturnValue();
    frequencyOptions = v5->_frequencyOptions;
    v5->_frequencyOptions = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v4, "PKStringForKey:", CFSTR("productTimeZone"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeZoneWithName:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v22;

    v5->_maximumPayments = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("maximumPayments"));
    v5->_endProcessingHour = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("endProcessingHour"));
    objc_msgSend(v4, "PKDoubleForKey:", CFSTR("proactiveFetchPeriod"));
    v5->_proactiveFetchPeriod = v24;
    -[PKAccountFeatureDescriptor osVersionRange](v5, "osVersionRange");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supported = PKDeviceVersionMeetsRequiredVersion(v25);

  }
  return v5;
}

- (id)_suggestionsFromStrings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safelyAddObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAccountFeatureDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentAccountFeatureDescriptor *v5;
  uint64_t v6;
  NSDecimalNumber *feePercentage;
  uint64_t v8;
  NSDecimalNumber *minimumFee;
  uint64_t v10;
  NSDecimalNumber *maximumFee;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *amountSuggestions;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *thresholdSuggestions;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *frequencyOptions;
  uint64_t v27;
  NSTimeZone *productTimeZone;
  double v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feePercentage"));
    v6 = objc_claimAutoreleasedReturnValue();
    feePercentage = v5->_feePercentage;
    v5->_feePercentage = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumFee"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumFee = v5->_minimumFee;
    v5->_minimumFee = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumFee"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumFee = v5->_maximumFee;
    v5->_maximumFee = (NSDecimalNumber *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("amountSuggestions"));
    v15 = objc_claimAutoreleasedReturnValue();
    amountSuggestions = v5->_amountSuggestions;
    v5->_amountSuggestions = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("thresholdSuggestions"));
    v20 = objc_claimAutoreleasedReturnValue();
    thresholdSuggestions = v5->_thresholdSuggestions;
    v5->_thresholdSuggestions = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("frequencyOptions"));
    v25 = objc_claimAutoreleasedReturnValue();
    frequencyOptions = v5->_frequencyOptions;
    v5->_frequencyOptions = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productTimeZone"));
    v27 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v27;

    v5->_maximumPayments = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumPayments"));
    v5->_endProcessingHour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endProcessingHour"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("proactiveFetchPeriod"));
    v5->_proactiveFetchPeriod = v29;
    v5->_supported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supported"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  v4 = a3;
  -[PKAccountFeatureDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_feePercentage, CFSTR("feePercentage"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumFee, CFSTR("minimumFee"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumFee, CFSTR("maximumFee"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_amountSuggestions, CFSTR("amountSuggestions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_thresholdSuggestions, CFSTR("thresholdSuggestions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_frequencyOptions, CFSTR("frequencyOptions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_productTimeZone, CFSTR("productTimeZone"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumPayments, CFSTR("maximumPayments"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_endProcessingHour, CFSTR("endProcessingHour"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("proactiveFetchPeriod"), self->_proactiveFetchPeriod);
  objc_msgSend(v4, "encodeBool:forKey:", self->_supported, CFSTR("supported"));

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountFeatureDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);
  -[PKAccountFeatureDescriptor minimumAmount](self, "minimumAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAmount: '%@'; "), v5);

  -[PKAccountFeatureDescriptor maximumAmount](self, "maximumAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAmount: '%@'; "), v6);

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("loadFromCard")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("sendToUser")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("recurringPayments")))
  {
    -[PKAccountFeatureDescriptor merchantIdentifier](self, "merchantIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("merchantIdentifier: '%@'; "), v7);

    -[PKAccountFeatureDescriptor supportedNetworks](self, "supportedNetworks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("supportedNetworks: '%@'; "), v8);

    PKMerchantCapabilityToStrings(-[PKAccountFeatureDescriptor merchantCapabilities](self, "merchantCapabilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("merchantCapabilities: '%@'; "), v9);

  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("instantWithdrawal")))
  {
    -[PKPeerPaymentAccountFeatureDescriptor feePercentage](self, "feePercentage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("feePercentage: '%@'; "), v10);

    -[PKPeerPaymentAccountFeatureDescriptor minimumFee](self, "minimumFee");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("minimumFee: '%@'; "), v11);

    -[PKPeerPaymentAccountFeatureDescriptor maximumFee](self, "maximumFee");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("maximumFee: '%@'; "), v12);

  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("thresholdTopUp")))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("amountSuggestions: '%@'; "), self->_amountSuggestions);
    objc_msgSend(v3, "appendFormat:", CFSTR("thresholdSuggestions: '%@'; "), self->_thresholdSuggestions);
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("recurringPayments")))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("frequencyOptions: '%@'; "), self->_frequencyOptions);
    objc_msgSend(v3, "appendFormat:", CFSTR("productTimeZone: '%@'; "), self->_productTimeZone);
    objc_msgSend(v3, "appendFormat:", CFSTR("maximumPayments: '%ld'; "), self->_maximumPayments);
    objc_msgSend(v3, "appendFormat:", CFSTR("endProcessingHour: '%ld'; "), self->_endProcessingHour);
    objc_msgSend(v3, "appendFormat:", CFSTR("proactiveFetchPeriod: '%lf'; "), *(_QWORD *)&self->_proactiveFetchPeriod);
  }
  -[PKAccountFeatureDescriptor osVersionRange](self, "osVersionRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PKAccountFeatureDescriptor osVersionRange](self, "osVersionRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("osVersionRange: '%@'; "), v15);

  }
  if (self->_supported)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("supported: '%@'; "), v16);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));

  return v3;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  v3 = -[PKAccountFeatureDescriptor hash](&v11, sel_hash);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelyAddObject:", self->_feePercentage);
  objc_msgSend(v4, "safelyAddObject:", self->_minimumFee);
  objc_msgSend(v4, "safelyAddObject:", self->_maximumFee);
  objc_msgSend(v4, "safelyAddObject:", self->_amountSuggestions);
  objc_msgSend(v4, "safelyAddObject:", self->_thresholdSuggestions);
  objc_msgSend(v4, "safelyAddObject:", self->_frequencyOptions);
  objc_msgSend(v4, "safelyAddObject:", self->_productTimeZone);
  v5 = PKCombinedHash((uint64_t)v3, v4);
  v6 = self->_maximumPayments - v5 + 32 * v5;
  v7 = self->_endProcessingHour - v6 + 32 * v6;
  v8 = (unint64_t)self->_proactiveFetchPeriod - v7 + 32 * v7;
  v9 = self->_supported - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentAccountFeatureDescriptor *v4;
  PKPeerPaymentAccountFeatureDescriptor *v5;
  BOOL v6;

  v4 = (PKPeerPaymentAccountFeatureDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentAccountFeatureDescriptor isEqualToPeerPaymentAccountFeatureDescriptor:](self, "isEqualToPeerPaymentAccountFeatureDescriptor:", v5);

  return v6;
}

- (BOOL)isEqualToPeerPaymentAccountFeatureDescriptor:(id)a3
{
  double *v4;
  NSDecimalNumber *feePercentage;
  NSDecimalNumber *v6;
  BOOL v7;
  NSDecimalNumber *minimumFee;
  NSDecimalNumber *v9;
  BOOL v10;
  NSDecimalNumber *maximumFee;
  NSDecimalNumber *v12;
  BOOL v13;
  NSArray *amountSuggestions;
  NSArray *v15;
  NSArray *thresholdSuggestions;
  NSArray *v17;
  NSArray *frequencyOptions;
  NSArray *v19;
  NSTimeZone *productTimeZone;
  NSTimeZone *v21;
  BOOL v22;

  v4 = (double *)a3;
  if (!-[PKAccountFeatureDescriptor isEqualToAccountFeatureDescriptor:](self, "isEqualToAccountFeatureDescriptor:", v4))
    goto LABEL_50;
  feePercentage = self->_feePercentage;
  v6 = (NSDecimalNumber *)*((_QWORD *)v4 + 10);
  if (feePercentage)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (feePercentage != v6)
      goto LABEL_50;
  }
  else if ((-[NSDecimalNumber isEqual:](feePercentage, "isEqual:") & 1) == 0)
  {
    goto LABEL_50;
  }
  minimumFee = self->_minimumFee;
  v9 = (NSDecimalNumber *)*((_QWORD *)v4 + 11);
  if (minimumFee)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (minimumFee != v9)
      goto LABEL_50;
  }
  else if ((-[NSDecimalNumber isEqual:](minimumFee, "isEqual:") & 1) == 0)
  {
    goto LABEL_50;
  }
  maximumFee = self->_maximumFee;
  v12 = (NSDecimalNumber *)*((_QWORD *)v4 + 12);
  if (maximumFee)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (maximumFee != v12)
      goto LABEL_50;
  }
  else if ((-[NSDecimalNumber isEqual:](maximumFee, "isEqual:") & 1) == 0)
  {
    goto LABEL_50;
  }
  amountSuggestions = self->_amountSuggestions;
  v15 = (NSArray *)*((_QWORD *)v4 + 13);
  if (amountSuggestions && v15)
  {
    if ((-[NSArray isEqual:](amountSuggestions, "isEqual:") & 1) == 0)
      goto LABEL_50;
  }
  else if (amountSuggestions != v15)
  {
    goto LABEL_50;
  }
  thresholdSuggestions = self->_thresholdSuggestions;
  v17 = (NSArray *)*((_QWORD *)v4 + 14);
  if (thresholdSuggestions && v17)
  {
    if ((-[NSArray isEqual:](thresholdSuggestions, "isEqual:") & 1) == 0)
      goto LABEL_50;
  }
  else if (thresholdSuggestions != v17)
  {
    goto LABEL_50;
  }
  frequencyOptions = self->_frequencyOptions;
  v19 = (NSArray *)*((_QWORD *)v4 + 15);
  if (frequencyOptions && v19)
  {
    if ((-[NSArray isEqual:](frequencyOptions, "isEqual:") & 1) == 0)
      goto LABEL_50;
  }
  else if (frequencyOptions != v19)
  {
    goto LABEL_50;
  }
  productTimeZone = self->_productTimeZone;
  v21 = (NSTimeZone *)*((_QWORD *)v4 + 16);
  if (!productTimeZone || !v21)
  {
    if (productTimeZone == v21)
      goto LABEL_46;
LABEL_50:
    v22 = 0;
    goto LABEL_51;
  }
  if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0)
    goto LABEL_50;
LABEL_46:
  if (self->_maximumPayments != *((_QWORD *)v4 + 17)
    || self->_endProcessingHour != *((_QWORD *)v4 + 18)
    || self->_proactiveFetchPeriod != v4[19])
  {
    goto LABEL_50;
  }
  v22 = self->_supported == *((unsigned __int8 *)v4 + 72);
LABEL_51:

  return v22;
}

- (NSDecimalNumber)feePercentage
{
  return self->_feePercentage;
}

- (void)setFeePercentage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)minimumFee
{
  return self->_minimumFee;
}

- (void)setMinimumFee:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDecimalNumber)maximumFee
{
  return self->_maximumFee;
}

- (void)setMaximumFee:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)amountSuggestions
{
  return self->_amountSuggestions;
}

- (void)setAmountSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)thresholdSuggestions
{
  return self->_thresholdSuggestions;
}

- (void)setThresholdSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)frequencyOptions
{
  return self->_frequencyOptions;
}

- (void)setFrequencyOptions:(id)a3
{
  objc_storeStrong((id *)&self->_frequencyOptions, a3);
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)maximumPayments
{
  return self->_maximumPayments;
}

- (void)setMaximumPayments:(int64_t)a3
{
  self->_maximumPayments = a3;
}

- (int64_t)endProcessingHour
{
  return self->_endProcessingHour;
}

- (void)setEndProcessingHour:(int64_t)a3
{
  self->_endProcessingHour = a3;
}

- (double)proactiveFetchPeriod
{
  return self->_proactiveFetchPeriod;
}

- (void)setProactiveFetchPeriod:(double)a3
{
  self->_proactiveFetchPeriod = a3;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_frequencyOptions, 0);
  objc_storeStrong((id *)&self->_thresholdSuggestions, 0);
  objc_storeStrong((id *)&self->_amountSuggestions, 0);
  objc_storeStrong((id *)&self->_maximumFee, 0);
  objc_storeStrong((id *)&self->_minimumFee, 0);
  objc_storeStrong((id *)&self->_feePercentage, 0);
}

@end
