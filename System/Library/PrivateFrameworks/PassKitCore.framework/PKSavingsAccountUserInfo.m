@implementation PKSavingsAccountUserInfo

- (PKSavingsAccountUserInfo)initWithDictionary:(id)a3
{
  id v4;
  PKSavingsAccountUserInfo *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CNContact *primaryUser;
  PKAccountBeneficiaryInfo *v31;
  void *v32;
  uint64_t v33;
  PKAccountBeneficiaryInfo *beneficiaryInfo;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PKSavingsAccountUserInfo;
  v5 = -[PKSavingsAccountUserInfo init](&v44, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v7, CFSTR("firstName"));
    v8 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v7;
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v7, CFSTR("lastName"));
    v9 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v8;
    objc_msgSend(v6, "setGivenName:", v8);
    v41 = (void *)v9;
    objc_msgSend(v6, "setFamilyName:", v9);
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v4, CFSTR("email"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C97338]);
      v12 = (void *)objc_msgSend(v11, "initWithLabel:value:", *MEMORY[0x1E0C96FF0], v10);
      v46[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEmailAddresses:", v13);

    }
    v39 = v4;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("billingAddress"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v14, CFSTR("addressLine1"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "PKStringForKey:", CFSTR("addressLine2"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v14, CFSTR("city"));
    v17 = objc_claimAutoreleasedReturnValue();
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v14, CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v14, CFSTR("postalCode"));
    v19 = objc_claimAutoreleasedReturnValue();
    -[PKSavingsAccountUserInfo _pkRequiredStringFromDictionary:forKey:](v5, "_pkRequiredStringFromDictionary:forKey:", v14, CFSTR("countryCode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v10;
    v38 = v16;
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("\n%@"), v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v21;
    }
    v37 = v15;
    v22 = objc_alloc_init(MEMORY[0x1E0C97378]);
    objc_msgSend(v22, "setStreet:", v15);
    objc_msgSend(v22, "setCity:", v17);
    objc_msgSend(v22, "setState:", v18);
    v23 = (void *)v19;
    objc_msgSend(v22, "setPostalCode:", v19);
    objc_msgSend(v22, "setISOCountryCode:", v20);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedStringForCountryCode(v24, v20);
    v36 = (void *)v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCountry:", v25);

    v26 = objc_alloc(MEMORY[0x1E0C97338]);
    v27 = (void *)objc_msgSend(v26, "initWithLabel:value:", *MEMORY[0x1E0C96FF8], v22);
    v45 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPostalAddresses:", v28);

    v29 = objc_msgSend(v6, "copy");
    primaryUser = v5->_primaryUser;
    v5->_primaryUser = (CNContact *)v29;

    v31 = [PKAccountBeneficiaryInfo alloc];
    v4 = v39;
    objc_msgSend(v39, "PKDictionaryForKey:", CFSTR("beneficiaryInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PKAccountBeneficiaryInfo initWithDictionary:](v31, "initWithDictionary:", v32);
    beneficiaryInfo = v5->_beneficiaryInfo;
    v5->_beneficiaryInfo = (PKAccountBeneficiaryInfo *)v33;

  }
  return v5;
}

- (id)_pkRequiredStringFromDictionary:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "PKStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Account user info '%@' field is missing", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *primaryUser;
  id v5;

  primaryUser = self->_primaryUser;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primaryUser, CFSTR("primaryUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryInfo, CFSTR("beneficiaryInfo"));

}

- (PKSavingsAccountUserInfo)initWithCoder:(id)a3
{
  id v4;
  PKSavingsAccountUserInfo *v5;
  uint64_t v6;
  CNContact *primaryUser;
  uint64_t v8;
  PKAccountBeneficiaryInfo *beneficiaryInfo;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSavingsAccountUserInfo;
  v5 = -[PKSavingsAccountUserInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryUser"));
    v6 = objc_claimAutoreleasedReturnValue();
    primaryUser = v5->_primaryUser;
    v5->_primaryUser = (CNContact *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beneficiaryInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    beneficiaryInfo = v5->_beneficiaryInfo;
    v5->_beneficiaryInfo = (PKAccountBeneficiaryInfo *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CNContact copyWithZone:](self->_primaryUser, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKAccountBeneficiaryInfo copyWithZone:](self->_beneficiaryInfo, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("primaryUser"), self->_primaryUser);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("beneficiaryInfo"), self->_beneficiaryInfo);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (CNContact)primaryUser
{
  return self->_primaryUser;
}

- (void)setPrimaryUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKAccountBeneficiaryInfo)beneficiaryInfo
{
  return self->_beneficiaryInfo;
}

- (void)setBeneficiaryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryInfo, 0);
  objc_storeStrong((id *)&self->_primaryUser, 0);
}

@end
