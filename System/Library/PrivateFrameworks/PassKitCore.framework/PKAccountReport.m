@implementation PKAccountReport

- (PKAccountReport)initWithAccountIdentifier:(id)a3 reportType:(unint64_t)a4
{
  id v7;
  PKAccountReport *v8;
  PKAccountReport *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountReport;
  v8 = -[PKAccountReport init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_reportType = a4;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t reportType;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  reportType = self->_reportType;
  if (reportType > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC6590[reportType];
  objc_msgSend(v3, "safelySetObject:forKey:", v6, CFSTR("reportType"));
  objc_msgSend(v4, "safelySetObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountReport)initWithCoder:(id)a3
{
  id v4;
  PKAccountReport *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountReport;
  v5 = -[PKAccountReport init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v5->_reportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reportType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reportType, CFSTR("reportType"));

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
  v5 = (void *)v4[1];
  v6 = self->_accountIdentifier;
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
  v10 = self->_reportType == v4[2];
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
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_reportType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  unint64_t reportType;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  reportType = self->_reportType;
  if (reportType > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC6590[reportType];
  objc_msgSend(v3, "appendFormat:", CFSTR("reportType: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_reportType;
  return v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)reportType
{
  return self->_reportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
