@implementation SFAppleIDPersonInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDPersonInfo)initWithCoder:(id)a3
{
  id v4;
  SFAppleIDPersonInfo *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *altDSID;
  uint64_t v10;
  NSString *matchedValue;
  uint64_t v12;
  NSDate *validUntilDate;
  SFAppleIDPersonInfo *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFAppleIDPersonInfo;
  v5 = -[SFAppleIDPersonInfo init](&v16, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AccountIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AltDSID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AltDSID"));
      v8 = objc_claimAutoreleasedReturnValue();
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CertificateStatus")))
      v5->_certificateStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CertificateStatus"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DidMatchEmail")))
      v5->_didMatchEmail = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidMatchEmail"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DidMatchPhone")))
      v5->_didMatchPhone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidMatchPhone"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MatchedValue")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MatchedValue"));
      v10 = objc_claimAutoreleasedReturnValue();
      matchedValue = v5->_matchedValue;
      v5->_matchedValue = (NSString *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MatchedValue")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ValidUntilDate"));
      v12 = objc_claimAutoreleasedReturnValue();
      validUntilDate = v5->_validUntilDate;
      v5->_validUntilDate = (NSDate *)v12;

    }
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *accountIdentifier;
  NSString *altDSID;
  NSString *matchedValue;
  NSDate *validUntilDate;
  id v9;

  v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  v9 = v4;
  if (accountIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", accountIdentifier, CFSTR("AccountIdentifier"));
    v4 = v9;
  }
  altDSID = self->_altDSID;
  if (altDSID)
  {
    objc_msgSend(v9, "encodeObject:forKey:", altDSID, CFSTR("AltDSID"));
    v4 = v9;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_certificateStatus, CFSTR("CertificateStatus"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_didMatchEmail, CFSTR("DidMatchEmail"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_didMatchPhone, CFSTR("DidMatchPhone"));
  matchedValue = self->_matchedValue;
  if (matchedValue)
    objc_msgSend(v9, "encodeObject:forKey:", matchedValue, CFSTR("MatchedValue"));
  validUntilDate = self->_validUntilDate;
  if (validUntilDate)
    objc_msgSend(v9, "encodeObject:forKey:", validUntilDate, CFSTR("ValidUntilDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_accountIdentifier);
    objc_storeStrong((id *)(v5 + 24), self->_altDSID);
    *(_QWORD *)(v5 + 32) = self->_certificateStatus;
    *(_BYTE *)(v5 + 8) = self->_didMatchEmail;
    *(_BYTE *)(v5 + 9) = self->_didMatchPhone;
    objc_storeStrong((id *)(v5 + 40), self->_matchedValue);
    objc_storeStrong((id *)(v5 + 48), self->_validUntilDate);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  SFAppleIDPersonInfo *v4;
  SFAppleIDPersonInfo *v5;
  BOOL v6;

  v4 = (SFAppleIDPersonInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SFAppleIDPersonInfo isEqualToPersonInfo:](self, "isEqualToPersonInfo:", v5);

  return v6;
}

- (BOOL)isEqualToPersonInfo:(id)a3
{
  SFAppleIDPersonInfo *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  int64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (SFAppleIDPersonInfo *)a3;
  if (self == v4)
  {
    v17 = 1;
    goto LABEL_17;
  }
  -[SFAppleIDPersonInfo accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDPersonInfo accountIdentifier](v4, "accountIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[SFAppleIDPersonInfo accountIdentifier](self, "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDPersonInfo accountIdentifier](v4, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[SFAppleIDPersonInfo altDSID](self, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDPersonInfo altDSID](v4, "altDSID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[SFAppleIDPersonInfo altDSID](self, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDPersonInfo altDSID](v4, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_17;
    }
  }
  v18 = -[SFAppleIDPersonInfo certificateStatus](self, "certificateStatus");
  if (v18 != -[SFAppleIDPersonInfo certificateStatus](v4, "certificateStatus"))
    goto LABEL_8;
  v19 = -[SFAppleIDPersonInfo didMatchEmail](self, "didMatchEmail");
  if (v19 != -[SFAppleIDPersonInfo didMatchEmail](v4, "didMatchEmail"))
    goto LABEL_8;
  v20 = -[SFAppleIDPersonInfo didMatchPhone](self, "didMatchPhone");
  if (v20 != -[SFAppleIDPersonInfo didMatchPhone](v4, "didMatchPhone"))
    goto LABEL_8;
  -[SFAppleIDPersonInfo validUntilDate](self, "validUntilDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDPersonInfo validUntilDate](v4, "validUntilDate");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v21 == (void *)v22)
  {
    v17 = 1;
    v23 = v21;
  }
  else
  {
    v23 = (void *)v22;
    -[SFAppleIDPersonInfo validUntilDate](self, "validUntilDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDPersonInfo validUntilDate](v4, "validUntilDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v24, "isEqual:", v25);

  }
LABEL_17:

  return v17;
}

- (SFAppleIDPersonInfo)initWithDictionary:(id)a3
{
  id v4;
  SFAppleIDPersonInfo *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *altDSID;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *matchedValue;
  uint64_t v14;
  NSDate *validUntilDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFAppleIDPersonInfo;
  v5 = -[SFAppleIDPersonInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AccountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    v5->_certificateStatus = CFDictionaryGetInt64();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Matched"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("email")) & 1) != 0)
    {
      v11 = 8;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("phone")))
      {
LABEL_7:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MatchedValue"));
        v12 = objc_claimAutoreleasedReturnValue();
        matchedValue = v5->_matchedValue;
        v5->_matchedValue = (NSString *)v12;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidUntil"));
        v14 = objc_claimAutoreleasedReturnValue();
        validUntilDate = v5->_validUntilDate;
        v5->_validUntilDate = (NSDate *)v14;

        goto LABEL_8;
      }
      v11 = 9;
    }
    *((_BYTE *)&v5->super.isa + v11) = 1;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (id)description
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;

  NSAppendPrintF();
  v10 = 0;
  NSAppendPrintF();
  v2 = v10;

  NSAppendPrintF();
  v3 = v2;

  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  NSAppendPrintF();
  v6 = v5;

  NSAppendPrintF();
  v7 = v6;

  NSAppendPrintF();
  v8 = v7;

  return v8;
}

- (BOOL)isStale
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:", self->_validUntilDate) == 1;

  return (char)self;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (int64_t)certificateStatus
{
  return self->_certificateStatus;
}

- (BOOL)didMatchEmail
{
  return self->_didMatchEmail;
}

- (BOOL)didMatchPhone
{
  return self->_didMatchPhone;
}

- (NSString)matchedValue
{
  return self->_matchedValue;
}

- (NSDate)validUntilDate
{
  return self->_validUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntilDate, 0);
  objc_storeStrong((id *)&self->_matchedValue, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
