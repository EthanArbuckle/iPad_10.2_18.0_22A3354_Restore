@implementation PKAccountBeneficiary

- (PKAccountBeneficiary)initWithDictionary:(id)a3
{
  id v4;
  PKAccountBeneficiary *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  NSDecimalNumber *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CNContact *contact;
  void *v36;
  NSDecimalNumber *allocation;
  NSDecimalNumber *v38;
  NSString *identifier;
  PKAccountBeneficiary *v40;
  NSObject *v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v48;
  void *v49;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKAccountBeneficiary;
  v5 = -[PKAccountBeneficiary init](&v51, sel_init);
  if (!v5)
    goto LABEL_27;
  v50 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("firstName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("lastName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("relationshipType"));
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == CFSTR("child"))
    goto LABEL_5;
  if (!v8)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("child"));

  if ((v10 & 1) == 0)
  {
    v12 = v9;
    if (v12 == CFSTR("spouse")
      || (v13 = v12,
          v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("spouse")),
          v13,
          (v14 & 1) != 0))
    {
      v11 = 2;
      goto LABEL_22;
    }
    v15 = v13;
    if (v15 == CFSTR("domestic-partner")
      || (v16 = v15,
          v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("domestic-partner")),
          v16,
          (v17 & 1) != 0))
    {
      v11 = 3;
      goto LABEL_22;
    }
    v18 = v16;
    if (v18 == CFSTR("parent")
      || (v19 = v18,
          v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("parent")),
          v19,
          (v20 & 1) != 0))
    {
      v11 = 4;
      goto LABEL_22;
    }
    v21 = v19;
    if (v21 == CFSTR("sibling")
      || (v22 = v21,
          v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("sibling")),
          v22,
          (v23 & 1) != 0))
    {
      v11 = 5;
      goto LABEL_22;
    }
    v24 = v22;
    if (v24 == CFSTR("other")
      || (v25 = v24,
          v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("other")),
          v25,
          v26))
    {
      v11 = 6;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_5:
  v11 = 1;
LABEL_22:

  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("allocation"));
  v27 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "length");
  v30 = v7;
  v31 = objc_msgSend(v7, "length");
  v32 = objc_msgSend(v28, "length");
  v33 = v32;
  if (v29 && v31 && v27 && v32)
  {
    objc_msgSend(v50, "setGivenName:", v6);
    objc_msgSend(v50, "setFamilyName:", v30);
    v34 = objc_msgSend(v50, "copy");
    contact = v5->_contact;
    v5->_contact = (CNContact *)v34;

    v36 = v6;
    allocation = v5->_allocation;
    v5->_relationshipType = v11;
    v5->_allocation = v27;
    v38 = v27;

    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v28;

LABEL_27:
    v40 = v5;
    goto LABEL_39;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    if (v29)
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    v48 = v6;
    if (v31)
      v43 = CFSTR("YES");
    else
      v43 = CFSTR("NO");
    -[NSDecimalNumber stringValue](v27, "stringValue", v48);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    *(_DWORD *)buf = 138413058;
    v46 = CFSTR("NO");
    if (v33)
      v46 = CFSTR("YES");
    v53 = v42;
    v54 = 2112;
    v55 = v43;
    v6 = v49;
    v56 = 2112;
    v57 = v44;
    v58 = 2112;
    v59 = v46;
    _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "Account beneficiary field is missing; firstName present: %@ lastName present: %@ allocation: %@ identifier present: %@",
      buf,
      0x2Au);

  }
  v40 = 0;
LABEL_39:

  return v40;
}

- (id)displayableRelationshipString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t vars0;

  v7 = self->_relationshipType - 1;
  if (v7 > 5)
  {
    v8 = 0;
  }
  else
  {
    PKLocalizedFeatureString(off_1E2AD9D78[v7], 5, 0, v2, v3, v4, v5, v6, vars0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *contact;
  id v5;

  contact = self->_contact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_relationshipType, CFSTR("relationshipType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allocation, CFSTR("allocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (PKAccountBeneficiary)initWithCoder:(id)a3
{
  id v4;
  PKAccountBeneficiary *v5;
  uint64_t v6;
  CNContact *contact;
  uint64_t v8;
  NSDecimalNumber *allocation;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountBeneficiary;
  v5 = -[PKAccountBeneficiary init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v6 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v5->_relationshipType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("relationshipType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allocation"));
    v8 = objc_claimAutoreleasedReturnValue();
    allocation = v5->_allocation;
    v5->_allocation = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

  }
  return v5;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CNContact copyWithZone:](self->_contact, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_relationshipType;
  v8 = -[NSDecimalNumber copyWithZone:](self->_allocation, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("contact"), self->_contact);
  v4 = self->_relationshipType - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD9DA8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("relationshipType"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("allocation"), self->_allocation);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("identifier"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)relationshipType
{
  return self->_relationshipType;
}

- (NSDecimalNumber)allocation
{
  return self->_allocation;
}

- (void)setAllocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allocation, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
