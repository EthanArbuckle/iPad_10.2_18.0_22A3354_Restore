@implementation PKPayLaterAccountTermsDetails

- (PKPayLaterAccountTermsDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountTermsDetails *v5;
  uint64_t v6;
  NSString *termsIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterAccountTermsDetails;
  v5 = -[PKPayLaterAccountTermsDetails init](&v9, sel_init);
  if (v5)
  {
    v5->_termsAcceptanceRequired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("termsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountTermsDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountTermsDetails *v5;
  uint64_t v6;
  NSString *termsIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterAccountTermsDetails;
  v5 = -[PKPayLaterAccountTermsDetails init](&v9, sel_init);
  if (v5)
  {
    v5->_termsAcceptanceRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 termsAcceptanceRequired;
  id v5;

  termsAcceptanceRequired = self->_termsAcceptanceRequired;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", termsAcceptanceRequired, CFSTR("termsAcceptanceRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v5 = (void *)v4[2];
  v6 = self->_termsIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_10;
  }
  v10 = self->_termsAcceptanceRequired == *((unsigned __int8 *)v4 + 8);
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_termsIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_termsAcceptanceRequired - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
  if (self->_termsAcceptanceRequired)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("termsAcceptanceRequired: '%@'; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountTermsDetails *v5;
  uint64_t v6;
  NSString *termsIdentifier;

  v5 = -[PKPayLaterAccountTermsDetails init](+[PKPayLaterAccountTermsDetails allocWithZone:](PKPayLaterAccountTermsDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_termsIdentifier, "copyWithZone:", a3);
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v6;

  v5->_termsAcceptanceRequired = self->_termsAcceptanceRequired;
  return v5;
}

- (BOOL)termsAcceptanceRequired
{
  return self->_termsAcceptanceRequired;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
}

@end
