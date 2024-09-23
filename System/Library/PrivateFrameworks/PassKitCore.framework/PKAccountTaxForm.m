@implementation PKAccountTaxForm

- (PKAccountTaxForm)initWithDictionary:(id)a3
{
  id v4;
  PKAccountTaxForm *v5;
  uint64_t v6;
  NSString *identifier;
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
  int v23;
  uint64_t v24;
  NSDate *openingDate;
  uint64_t v26;
  NSDate *closingDate;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountTaxForm;
  v5 = -[PKAccountTaxForm init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("taxFormType"));
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 != CFSTR("1099-int"))
    {
      if (v8)
      {
        v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("1099-int"));

        if ((v10 & 1) != 0)
          goto LABEL_5;
        v12 = v9;
        if (v12 == CFSTR("1099-div")
          || (v13 = v12,
              v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("1099-div")),
              v13,
              (v14 & 1) != 0))
        {
          v11 = 2;
          goto LABEL_19;
        }
        v15 = v13;
        if (v15 == CFSTR("1099-b")
          || (v16 = v15,
              v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("1099-b")),
              v16,
              (v17 & 1) != 0))
        {
          v11 = 3;
          goto LABEL_19;
        }
        v18 = v16;
        if (v18 == CFSTR("1099-misc")
          || (v19 = v18,
              v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("1099-misc")),
              v19,
              (v20 & 1) != 0))
        {
          v11 = 4;
          goto LABEL_19;
        }
        v21 = v19;
        if (v21 == CFSTR("1099-consolidated")
          || (v22 = v21,
              v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("1099-consolidated")),
              v22,
              v23))
        {
          v11 = 5;
          goto LABEL_19;
        }
      }
      v11 = 0;
      goto LABEL_19;
    }
LABEL_5:
    v11 = 1;
LABEL_19:

    v5->_type = v11;
    objc_msgSend(v4, "PKDateForKey:", CFSTR("openingDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v24;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("closingDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v26;

  }
  return v5;
}

- (id)displayableTaxFormString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t vars0;

  v7 = self->_type - 1;
  if (v7 > 4)
  {
    v8 = 0;
  }
  else
  {
    PKLocalizedFeatureString(off_1E2AD3080[v7], 5, 0, v2, v3, v4, v5, v6, vars0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTaxForm)initWithCoder:(id)a3
{
  id v4;
  PKAccountTaxForm *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openingDate;
  uint64_t v10;
  NSDate *closingDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountTaxForm;
  v5 = -[PKAccountTaxForm init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taxFormType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("taxFormType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openingDate, CFSTR("openingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_closingDate, CFSTR("closingDate"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSDate *openingDate;
  NSDate *v8;
  NSDate *closingDate;
  NSDate *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (identifier != v6)
  {
    goto LABEL_15;
  }
  if (self->_type != v4[2])
    goto LABEL_15;
  openingDate = self->_openingDate;
  v8 = (NSDate *)v4[3];
  if (!openingDate || !v8)
  {
    if (openingDate == v8)
      goto LABEL_11;
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0)
    goto LABEL_15;
LABEL_11:
  closingDate = self->_closingDate;
  v10 = (NSDate *)v4[4];
  if (closingDate && v10)
    v11 = -[NSDate isEqual:](closingDate, "isEqual:");
  else
    v11 = closingDate == v10;
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = self->_type + 527;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelyAddObject:", self->_identifier);
  objc_msgSend(v4, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v4, "safelyAddObject:", self->_closingDate);
  v5 = PKCombinedHash(v3, v4);

  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  v4 = self->_type - 1;
  if (v4 > 4)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD30A8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  -[NSDate description](self->_openingDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), v6);

  -[NSDate description](self->_closingDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("closingDate: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
