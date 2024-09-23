@implementation PKAccountFundingSourceVerificationAction

- (PKAccountFundingSourceVerificationAction)initWithDictionary:(id)a3
{
  id v4;
  PKAccountFundingSourceVerificationAction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *verificationOptions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountFundingSourceVerificationAction;
  v5 = -[PKAccountFundingSourceVerificationAction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKAccountFundingSourceVerificationActionTypeFromString(v6);

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_165);
    v8 = objc_claimAutoreleasedReturnValue();
    verificationOptions = v5->_verificationOptions;
    v5->_verificationOptions = (NSArray *)v8;

  }
  return v5;
}

uint64_t __63__PKAccountFundingSourceVerificationAction_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKApplyVerificationTypeFromString(a2));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFundingSourceVerificationAction)initWithCoder:(id)a3
{
  id v4;
  PKAccountFundingSourceVerificationAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *verificationOptions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountFundingSourceVerificationAction;
  v5 = -[PKAccountFundingSourceVerificationAction init](&v12, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("options"));
    v9 = objc_claimAutoreleasedReturnValue();
    verificationOptions = v5->_verificationOptions;
    v5->_verificationOptions = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verificationOptions, CFSTR("options"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *verificationOptions;
  NSArray *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  verificationOptions = self->_verificationOptions;
  v6 = (NSArray *)v4[2];
  if (!verificationOptions || !v6)
  {
    if (verificationOptions == v6)
      goto LABEL_5;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if ((-[NSArray isEqual:](verificationOptions, "isEqual:") & 1) == 0)
    goto LABEL_7;
LABEL_5:
  v7 = self->_type == v4[1];
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_verificationOptions);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type > 2)
    v6 = 0;
  else
    v6 = off_1E2AD5978[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("verificationOptions: '%@'; "), self->_verificationOptions);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountFundingSourceVerificationAction *v5;
  uint64_t v6;
  NSArray *verificationOptions;

  v5 = -[PKAccountFundingSourceVerificationAction init](+[PKAccountFundingSourceVerificationAction allocWithZone:](PKAccountFundingSourceVerificationAction, "allocWithZone:"), "init");
  v5->_type = self->_type;
  v6 = -[NSArray copyWithZone:](self->_verificationOptions, "copyWithZone:", a3);
  verificationOptions = v5->_verificationOptions;
  v5->_verificationOptions = (NSArray *)v6;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)verificationOptions
{
  return self->_verificationOptions;
}

- (void)setVerificationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationOptions, 0);
}

@end
