@implementation PKCreditAccountFeatureDescriptor

- (PKCreditAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountFeatureDescriptor *v5;
  PKCreditAccountFeatureDescriptor *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  __CFString *v35;
  __CFString *v36;
  int v37;
  __CFString *v38;
  __CFString *v39;
  int v40;
  __CFString *v41;
  int v42;
  __CFString *v43;
  int v44;
  __CFString *v45;
  int v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSString *paymentTermsIdentifier;
  uint64_t v51;
  NSArray *supportedFileFormatsForTransactionData;
  uint64_t v53;
  NSArray *supportedDestinations;
  uint64_t v55;
  NSDecimalNumber *savingsAPY;
  uint64_t v57;
  NSDecimalNumber *savingsInterestRate;
  PKCreditAccountFeatureDescriptor *v60;
  void *v61;
  id obj;
  uint64_t v63;
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor initWithDictionary:](&v64, sel_initWithDictionary_, v4);
  v6 = v5;
  if (v5)
  {
    v60 = v5;
    v61 = v4;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentPresets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (!v8)
    {
      v10 = 0;
      goto LABEL_22;
    }
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v66;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v66 != v11)
          objc_enumerationMutation(v7);
        v13 = (__CFString *)*(id *)(*((_QWORD *)&v65 + 1) + 8 * v12);
        if (v13 == CFSTR("fixedAmount"))
          goto LABEL_10;
        v14 = v13;
        if (!v13)
          goto LABEL_11;
        v15 = objc_msgSend(CFSTR("fixedAmount"), "isEqualToString:", v13);

        if (v15)
        {
LABEL_10:
          v10 |= 1uLL;
        }
        else
        {
          v16 = v14;
          if (v16 == CFSTR("minimumDue")
            || (v17 = v16, v18 = objc_msgSend(CFSTR("minimumDue"), "isEqualToString:", v16), v17, v18))
          {
            v10 |= 2uLL;
          }
          else
          {
            v19 = v17;
            if (v19 == CFSTR("statementBalance")
              || (v20 = v19,
                  v21 = objc_msgSend(CFSTR("statementBalance"), "isEqualToString:", v19),
                  v20,
                  v21))
            {
              v10 |= 4uLL;
            }
          }
        }
LABEL_11:
        ++v12;
      }
      while (v9 != v12);
      v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      v9 = v22;
      if (!v22)
      {
LABEL_22:
        v60->_paymentPresets = v10;

        objc_msgSend(v61, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentFrequencies"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        obj = v23;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        if (!v24)
        {
          v26 = 0;
          goto LABEL_53;
        }
        v25 = v24;
        v26 = 0;
        v63 = *(_QWORD *)v66;
        v27 = CFSTR("once");
        v28 = CFSTR("weekly");
        while (1)
        {
          v29 = 0;
          do
          {
            v30 = (__CFString *)v27;
            v31 = (__CFString *)v28;
            if (*(_QWORD *)v66 != v63)
              objc_enumerationMutation(obj);
            v32 = (__CFString *)*(id *)(*((_QWORD *)&v65 + 1) + 8 * v29);
            if (v32 == CFSTR("now"))
              goto LABEL_30;
            v33 = v32;
            if (!v32)
              goto LABEL_31;
            v34 = objc_msgSend(CFSTR("now"), "isEqualToString:", v32);

            if (v34)
            {
LABEL_30:
              v26 |= 1uLL;
              goto LABEL_31;
            }
            v35 = v33;
            v27 = v30;
            if (v35 != v30)
            {
              v36 = v35;
              v37 = -[__CFString isEqualToString:](v30, "isEqualToString:", v35);

              v27 = v30;
              if (!v37)
              {
                v38 = v36;
                v28 = v31;
                if (v38 == v31
                  || (v39 = v38,
                      v40 = -[__CFString isEqualToString:](v31, "isEqualToString:", v38),
                      v39,
                      v28 = v31,
                      v40))
                {
                  v26 |= 4uLL;
                }
                else
                {
                  v41 = v39;
                  if (v41 == CFSTR("biweekly")
                    || (v42 = objc_msgSend(CFSTR("biweekly"), "isEqualToString:", v41), v41, v42))
                  {
                    v26 |= 8uLL;
                  }
                  else
                  {
                    v43 = v41;
                    if (v43 == CFSTR("monthly")
                      || (v44 = objc_msgSend(CFSTR("monthly"), "isEqualToString:", v43), v43, v44))
                    {
                      v26 |= 0x10uLL;
                    }
                    else
                    {
                      v45 = v43;
                      if (v45 == CFSTR("paymentDueDate")
                        || (v46 = objc_msgSend(CFSTR("paymentDueDate"), "isEqualToString:", v45), v45, v46))
                      {
                        v26 |= 0x20uLL;
                      }
                    }
                  }
LABEL_31:
                  v28 = v31;
                }
                v27 = v30;
                goto LABEL_33;
              }
            }
            v26 |= 2uLL;
            v28 = v31;
LABEL_33:
            ++v29;
          }
          while (v25 != v29);
          v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
          v25 = v47;
          v27 = v30;
          v28 = v31;
          if (!v47)
          {
LABEL_53:
            v6 = v60;
            v60->_paymentFrequencies = v26;

            v4 = v61;
            objc_msgSend(v61, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentFundingSourceTypes"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v60->_paymentFundingSourceTypes = PKAccountFundingSourceTypeFromStrings(v48);

            objc_msgSend(v61, "PKStringForKey:", CFSTR("paymentTermsIdentifier"));
            v49 = objc_claimAutoreleasedReturnValue();
            paymentTermsIdentifier = v60->_paymentTermsIdentifier;
            v60->_paymentTermsIdentifier = (NSString *)v49;

            objc_msgSend(v61, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedFileFormatsForTransactionData"));
            v51 = objc_claimAutoreleasedReturnValue();
            supportedFileFormatsForTransactionData = v60->_supportedFileFormatsForTransactionData;
            v60->_supportedFileFormatsForTransactionData = (NSArray *)v51;

            v60->_maximumAccountUsers = objc_msgSend(v61, "PKIntegerForKey:", CFSTR("maximumAccountUsers"));
            v60->_minimumOwnerAge = objc_msgSend(v61, "PKIntegerForKey:", CFSTR("minimumOwnerAge"));
            v60->_minimumParticipantAge = objc_msgSend(v61, "PKIntegerForKey:", CFSTR("minimumParticipantAge"));
            objc_msgSend(v61, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedDestinations"));
            v53 = objc_claimAutoreleasedReturnValue();
            supportedDestinations = v60->_supportedDestinations;
            v60->_supportedDestinations = (NSArray *)v53;

            objc_msgSend(v61, "PKDecimalNumberFromStringForKey:", CFSTR("savingsApy"));
            v55 = objc_claimAutoreleasedReturnValue();
            savingsAPY = v60->_savingsAPY;
            v60->_savingsAPY = (NSDecimalNumber *)v55;

            objc_msgSend(v61, "PKDecimalNumberFromStringForKey:", CFSTR("savingsInterestRate"));
            v57 = objc_claimAutoreleasedReturnValue();
            savingsInterestRate = v60->_savingsInterestRate;
            v60->_savingsInterestRate = (NSDecimalNumber *)v57;

            goto LABEL_54;
          }
        }
      }
    }
  }
LABEL_54:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountFeatureDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountFeatureDescriptor *v5;
  uint64_t v6;
  NSString *paymentTermsIdentifier;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *supportedFileFormatsForTransactionData;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *supportedDestinations;
  uint64_t v18;
  NSDecimalNumber *savingsAPY;
  uint64_t v20;
  NSDecimalNumber *savingsInterestRate;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_paymentPresets = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentPresets"));
    v5->_paymentFrequencies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentFrequencies"));
    v5->_paymentFundingSourceTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentFundingSourceTypes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentTermsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentTermsIdentifier = v5->_paymentTermsIdentifier;
    v5->_paymentTermsIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedFileFormatsForTransactionData"));
    v11 = objc_claimAutoreleasedReturnValue();
    supportedFileFormatsForTransactionData = v5->_supportedFileFormatsForTransactionData;
    v5->_supportedFileFormatsForTransactionData = (NSArray *)v11;

    v5->_maximumAccountUsers = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumAccountUsers"));
    v5->_minimumOwnerAge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumOwnerAge"));
    v5->_minimumParticipantAge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumParticipantAge"));
    v13 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("supportedDestinations"));
    v16 = objc_claimAutoreleasedReturnValue();
    supportedDestinations = v5->_supportedDestinations;
    v5->_supportedDestinations = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("savingsApy"));
    v18 = objc_claimAutoreleasedReturnValue();
    savingsAPY = v5->_savingsAPY;
    v5->_savingsAPY = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("savingsInterestRate"));
    v20 = objc_claimAutoreleasedReturnValue();
    savingsInterestRate = v5->_savingsInterestRate;
    v5->_savingsInterestRate = (NSDecimalNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v4 = a3;
  -[PKAccountFeatureDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_paymentPresets, CFSTR("paymentPresets"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_paymentFrequencies, CFSTR("paymentFrequencies"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_paymentFundingSourceTypes, CFSTR("paymentFundingSourceTypes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentTermsIdentifier, CFSTR("paymentTermsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedFileFormatsForTransactionData, CFSTR("supportedFileFormatsForTransactionData"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumAccountUsers, CFSTR("maximumAccountUsers"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumOwnerAge, CFSTR("minimumOwnerAge"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumParticipantAge, CFSTR("minimumParticipantAge"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedDestinations, CFSTR("supportedDestinations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_savingsAPY, CFSTR("savingsApy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_savingsInterestRate, CFSTR("savingsInterestRate"));

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
  unint64_t paymentPresets;
  void *v12;
  void *v13;
  void *v14;
  unint64_t paymentFrequencies;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountFeatureDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("schedulePayment")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("scheduleRecurringPayments")))
  {
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

    PKMerchantCapabilityToStrings(-[PKAccountFeatureDescriptor merchantCapabilities](self, "merchantCapabilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("merchantCapabilities: '%@'; "), v9);

    PKAccountFundingSourceTypeToStrings(self->_paymentFundingSourceTypes);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("fundingSourceTypes: '%@'; "), v10);

    paymentPresets = self->_paymentPresets;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((paymentPresets & 1) != 0)
    {
      objc_msgSend(v12, "addObject:", CFSTR("fixedAmount"));
      if ((paymentPresets & 2) == 0)
      {
LABEL_5:
        if ((paymentPresets & 4) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }
    }
    else if ((paymentPresets & 2) == 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(v13, "addObject:", CFSTR("minimumDue"));
    if ((paymentPresets & 4) == 0)
    {
LABEL_7:
      v14 = (void *)objc_msgSend(v13, "copy");

      objc_msgSend(v3, "appendFormat:", CFSTR("paymentPresets: '%@'; "), v14);
      paymentFrequencies = self->_paymentFrequencies;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((paymentFrequencies & 1) != 0)
      {
        objc_msgSend(v16, "addObject:", CFSTR("now"));
        if ((paymentFrequencies & 2) == 0)
        {
LABEL_9:
          if ((paymentFrequencies & 4) == 0)
            goto LABEL_10;
          goto LABEL_21;
        }
      }
      else if ((paymentFrequencies & 2) == 0)
      {
        goto LABEL_9;
      }
      objc_msgSend(v17, "addObject:", CFSTR("once"));
      if ((paymentFrequencies & 4) == 0)
      {
LABEL_10:
        if ((paymentFrequencies & 8) == 0)
          goto LABEL_11;
        goto LABEL_22;
      }
LABEL_21:
      objc_msgSend(v17, "addObject:", CFSTR("weekly"));
      if ((paymentFrequencies & 8) == 0)
      {
LABEL_11:
        if ((paymentFrequencies & 0x10) == 0)
          goto LABEL_12;
        goto LABEL_23;
      }
LABEL_22:
      objc_msgSend(v17, "addObject:", CFSTR("biweekly"));
      if ((paymentFrequencies & 0x10) == 0)
      {
LABEL_12:
        if ((paymentFrequencies & 0x20) == 0)
        {
LABEL_14:
          v18 = (void *)objc_msgSend(v17, "copy");

          objc_msgSend(v3, "appendFormat:", CFSTR("paymentFrequencies: '%@'; "), v18);
          objc_msgSend(v3, "appendFormat:", CFSTR("paymentTermsIdentifier: '%@'; "), self->_paymentTermsIdentifier);
          goto LABEL_15;
        }
LABEL_13:
        objc_msgSend(v17, "addObject:", CFSTR("paymentDueDate"));
        goto LABEL_14;
      }
LABEL_23:
      objc_msgSend(v17, "addObject:", CFSTR("monthly"));
      if ((paymentFrequencies & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
LABEL_6:
    objc_msgSend(v13, "addObject:", CFSTR("statementBalance"));
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("addFundingSource")))
  {
    -[PKAccountFeatureDescriptor fundingSourceTermsIdentifier](self, "fundingSourceTermsIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("fundingSourceTermsIdentifier: '%@'; "), v20);
LABEL_27:

    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("exportTransactionData")))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("supportedFileFormatsForTransactionData: '%@'; "),
      self->_supportedFileFormatsForTransactionData);
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("accountUserInvitationAllowed")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumAccountUsers);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("maximumAccountUsers: '%@'; "), v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumOwnerAge);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("minimumOwnerAge: '%@'; "), v22);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumParticipantAge);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("minimumParticipantAge: '%@'; "), v23);

    -[PKAccountFeatureDescriptor osVersionRange](self, "osVersionRange");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_15;
    -[PKAccountFeatureDescriptor osVersionRange](self, "osVersionRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "asDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("osVersionRange: '%@'; "), v25);

    goto LABEL_27;
  }
  v26 = v4;
  if (v26 == CFSTR("redeemRewards")
    || (v27 = v26) != 0
    && (v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("redeemRewards")), v27, v28))
  {
    -[NSArray componentsJoinedByString:](self->_supportedDestinations, "componentsJoinedByString:", CFSTR(", "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("supportedDestinations: '%@'; "), v29);

    -[NSDecimalNumber stringValue](self->_savingsAPY, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("savingsAPY: '%@'; "), v30);

    -[NSDecimalNumber stringValue](self->_savingsInterestRate, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("savingsInterestRate: '%@'; "), v20);
    goto LABEL_27;
  }
LABEL_15:
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v3 = -[PKAccountFeatureDescriptor hash](&v13, sel_hash);
  v4 = self->_paymentFundingSourceTypes - v3 + 32 * v3;
  v5 = self->_paymentPresets - v4 + 32 * v4;
  v6 = self->_paymentFrequencies - v5 + 32 * v5;
  v7 = self->_maximumAccountUsers - v6 + 32 * v6;
  v8 = self->_minimumOwnerAge - v7 + 32 * v7;
  v9 = self->_minimumParticipantAge - v8 + 32 * v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelyAddObject:", self->_paymentTermsIdentifier);
  objc_msgSend(v10, "safelyAddObject:", self->_supportedFileFormatsForTransactionData);
  objc_msgSend(v10, "safelyAddObject:", self->_supportedDestinations);
  objc_msgSend(v10, "safelyAddObject:", self->_savingsAPY);
  objc_msgSend(v10, "safelyAddObject:", self->_savingsInterestRate);
  v11 = PKCombinedHash(v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditAccountFeatureDescriptor *v4;
  PKCreditAccountFeatureDescriptor *v5;
  BOOL v6;

  v4 = (PKCreditAccountFeatureDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditAccountFeatureDescriptor isEqualToCreditAccountFeatureDescriptor:](self, "isEqualToCreditAccountFeatureDescriptor:", v5);

  return v6;
}

- (BOOL)isEqualToCreditAccountFeatureDescriptor:(id)a3
{
  _QWORD *v4;
  NSString *paymentTermsIdentifier;
  NSString *v6;
  BOOL v7;
  NSArray *supportedFileFormatsForTransactionData;
  NSArray *v9;
  BOOL v10;
  NSArray *supportedDestinations;
  NSArray *v12;
  NSDecimalNumber *savingsAPY;
  NSDecimalNumber *v14;
  char v15;
  NSDecimalNumber *v17;

  v4 = a3;
  if (!-[PKAccountFeatureDescriptor isEqualToAccountFeatureDescriptor:](self, "isEqualToAccountFeatureDescriptor:", v4)
    || self->_paymentFundingSourceTypes != v4[9]
    || self->_paymentPresets != v4[10]
    || self->_paymentFrequencies != v4[11])
  {
    goto LABEL_34;
  }
  paymentTermsIdentifier = self->_paymentTermsIdentifier;
  v6 = (NSString *)v4[13];
  if (paymentTermsIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (paymentTermsIdentifier != v6)
      goto LABEL_34;
  }
  else if ((-[NSString isEqual:](paymentTermsIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_34;
  }
  supportedFileFormatsForTransactionData = self->_supportedFileFormatsForTransactionData;
  v9 = (NSArray *)v4[12];
  if (supportedFileFormatsForTransactionData)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (supportedFileFormatsForTransactionData != v9)
      goto LABEL_34;
  }
  else if ((-[NSArray isEqual:](supportedFileFormatsForTransactionData, "isEqual:") & 1) == 0)
  {
    goto LABEL_34;
  }
  if (self->_maximumAccountUsers != v4[14]
    || self->_minimumOwnerAge != v4[15]
    || self->_minimumParticipantAge != v4[16])
  {
    goto LABEL_34;
  }
  supportedDestinations = self->_supportedDestinations;
  v12 = (NSArray *)v4[17];
  if (supportedDestinations && v12)
  {
    if ((-[NSArray isEqual:](supportedDestinations, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (supportedDestinations != v12)
  {
    goto LABEL_34;
  }
  savingsAPY = self->_savingsAPY;
  v14 = (NSDecimalNumber *)v4[18];
  if (!savingsAPY || !v14)
  {
    if (savingsAPY == v14)
      goto LABEL_36;
LABEL_34:
    v15 = 0;
    goto LABEL_35;
  }
  if (!-[NSDecimalNumber isEqual:](savingsAPY, "isEqual:"))
    goto LABEL_34;
  savingsAPY = self->_savingsAPY;
LABEL_36:
  v17 = (NSDecimalNumber *)v4[19];
  if (savingsAPY && v17)
    v15 = -[NSDecimalNumber isEqual:](savingsAPY, "isEqual:");
  else
    v15 = savingsAPY == v17;
LABEL_35:

  return v15;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v5 = -[PKAccountFeatureDescriptor copyWithZone:](&v17, sel_copyWithZone_);
  v5[9] = self->_paymentFundingSourceTypes;
  v5[10] = self->_paymentPresets;
  v5[11] = self->_paymentFrequencies;
  v6 = -[NSString copyWithZone:](self->_paymentTermsIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[13];
  v5[13] = v6;

  v8 = -[NSArray copyWithZone:](self->_supportedFileFormatsForTransactionData, "copyWithZone:", a3);
  v9 = (void *)v5[12];
  v5[12] = v8;

  v5[14] = self->_maximumAccountUsers;
  v5[15] = self->_minimumOwnerAge;
  v5[16] = self->_minimumParticipantAge;
  v10 = -[NSArray copyWithZone:](self->_supportedDestinations, "copyWithZone:", a3);
  v11 = (void *)v5[17];
  v5[17] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_savingsAPY, "copyWithZone:", a3);
  v13 = (void *)v5[18];
  v5[18] = v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_savingsInterestRate, "copyWithZone:", a3);
  v15 = (void *)v5[19];
  v5[19] = v14;

  return v5;
}

- (id)productForFeature:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKDynamicProvisioningPageContent *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  PKDynamicProvisioningPageContent *v40;
  PKPaymentSetupProduct *v41;
  NSDecimalNumber *savingsAPY;
  NSDecimalNumber *savingsInterestRate;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  if (a3 != 5 || !self->_savingsAPY)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PKPassKitBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyServicePreferredLanguageForFeatureIdentifier:mainLanguageBundle:", 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (PKDynamicProvisioningPageContent *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicProvisioningPageContent languageCode](v9, "languageCode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = v11;
  if (v10 == v11)
  {

    v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (!v11 || !v10)
  {

    goto LABEL_11;
  }
  v13 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v13 & 1) == 0)
  {
LABEL_11:
    v9 = objc_alloc_init(PKDynamicProvisioningPageContent);
    -[PKDynamicProvisioningPageContent setPageNumber:](v9, "setPageNumber:", 0);
    PKLocalizedFeatureString(CFSTR("LANGUAGE_NOTICE_TITLE"), 5, 0, v16, v17, v18, v19, v20, v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicProvisioningPageContent setTitle:](v9, "setTitle:", v21);

    PKLocalizedFeatureString(CFSTR("LANGUAGE_NOTICE_BODY"), 5, 0, v22, v23, v24, v25, v26, v47);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicProvisioningPageContent setSubtitle:](v9, "setSubtitle:", v27);

    PKLocalizedFeatureString(CFSTR("CONTINUE"), 5, 0, v28, v29, v30, v31, v32, v48);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicProvisioningPageContent setPrimaryActionTitle:](v9, "setPrimaryActionTitle:", v33);

    PKLocalizedFeatureString(CFSTR("CANCEL"), 5, 0, v34, v35, v36, v37, v38, v49);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicProvisioningPageContent setSecondaryActionTitle:](v9, "setSecondaryActionTitle:", v39);

    -[PKDynamicProvisioningPageContent setIdentifier:](v9, "setIdentifier:", CFSTR("languageNotice"));
    -[PKDynamicProvisioningPageContent setHeroImageURL:](v9, "setHeroImageURL:", &stru_1E2ADF4C0);
    -[PKDynamicProvisioningPageContent setContentAlignment:](v9, "setContentAlignment:", 2);
    objc_msgSend(v4, "addObject:", v9);
    v14 = 1;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:
  v40 = objc_alloc_init(PKDynamicProvisioningPageContent);
  -[PKDynamicProvisioningPageContent setPageNumber:](v40, "setPageNumber:", v14);
  -[PKDynamicProvisioningPageContent setIdentifier:](v40, "setIdentifier:", CFSTR("mainFeatureOnboardingPageIdentifier"));
  objc_msgSend(v4, "addObject:", v40);
  v41 = -[PKPaymentSetupProduct initWithFeatureIdentifier:]([PKPaymentSetupProduct alloc], "initWithFeatureIdentifier:", 5);
  savingsAPY = self->_savingsAPY;
  v51[0] = savingsAPY;
  v50[0] = CFSTR("apy");
  v50[1] = CFSTR("interestRate");
  savingsInterestRate = self->_savingsInterestRate;
  v44 = savingsInterestRate;
  if (!savingsInterestRate)
  {
    PKAPRFromAPY(savingsAPY, 365);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProduct setClientInfo:](v41, "setClientInfo:", v45);

  if (!savingsInterestRate)
  -[PKPaymentSetupProduct setOnboardingItems:](v41, "setOnboardingItems:", v4);

  return v41;
}

- (unint64_t)paymentFundingSourceTypes
{
  return self->_paymentFundingSourceTypes;
}

- (void)setPaymentFundingSourceTypes:(unint64_t)a3
{
  self->_paymentFundingSourceTypes = a3;
}

- (unint64_t)paymentPresets
{
  return self->_paymentPresets;
}

- (void)setPaymentPresets:(unint64_t)a3
{
  self->_paymentPresets = a3;
}

- (unint64_t)paymentFrequencies
{
  return self->_paymentFrequencies;
}

- (void)setPaymentFrequencies:(unint64_t)a3
{
  self->_paymentFrequencies = a3;
}

- (NSArray)supportedFileFormatsForTransactionData
{
  return self->_supportedFileFormatsForTransactionData;
}

- (void)setSupportedFileFormatsForTransactionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)paymentTermsIdentifier
{
  return self->_paymentTermsIdentifier;
}

- (void)setPaymentTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)maximumAccountUsers
{
  return self->_maximumAccountUsers;
}

- (void)setMaximumAccountUsers:(unint64_t)a3
{
  self->_maximumAccountUsers = a3;
}

- (unint64_t)minimumOwnerAge
{
  return self->_minimumOwnerAge;
}

- (void)setMinimumOwnerAge:(unint64_t)a3
{
  self->_minimumOwnerAge = a3;
}

- (unint64_t)minimumParticipantAge
{
  return self->_minimumParticipantAge;
}

- (void)setMinimumParticipantAge:(unint64_t)a3
{
  self->_minimumParticipantAge = a3;
}

- (NSArray)supportedDestinations
{
  return self->_supportedDestinations;
}

- (void)setSupportedDestinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDecimalNumber)savingsAPY
{
  return self->_savingsAPY;
}

- (void)setSavingsAPY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDecimalNumber)savingsInterestRate
{
  return self->_savingsInterestRate;
}

- (void)setSavingsInterestRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingsInterestRate, 0);
  objc_storeStrong((id *)&self->_savingsAPY, 0);
  objc_storeStrong((id *)&self->_supportedDestinations, 0);
  objc_storeStrong((id *)&self->_paymentTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedFileFormatsForTransactionData, 0);
}

@end
