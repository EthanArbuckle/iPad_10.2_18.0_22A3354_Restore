@implementation PKPayLaterFinancingOptionInstallment

- (PKPayLaterFinancingOptionInstallment)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionInstallment *v5;
  PKPayLaterFinancingAmount *v6;
  void *v7;
  uint64_t v8;
  PKPayLaterFinancingAmount *dueAmount;
  uint64_t v10;
  NSDate *dueDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingOptionInstallment;
  v5 = -[PKPayLaterFinancingOptionInstallment init](&v13, sel_init);
  if (v5)
  {
    v6 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("dueAmount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPayLaterFinancingAmount initWithDictionary:](v6, "initWithDictionary:", v7);
    dueAmount = v5->_dueAmount;
    v5->_dueAmount = (PKPayLaterFinancingAmount *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("dueDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v10;

  }
  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_dueAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_dueDate);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingOptionInstallment *v4;
  PKPayLaterFinancingOptionInstallment *v5;
  PKPayLaterFinancingOptionInstallment *v6;
  PKPayLaterFinancingAmount *dueAmount;
  PKPayLaterFinancingAmount *v8;
  NSDate *dueDate;
  NSDate *v10;
  char v11;

  v4 = (PKPayLaterFinancingOptionInstallment *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        dueAmount = self->_dueAmount;
        v8 = v6->_dueAmount;
        if (dueAmount && v8)
        {
          if (-[PKPayLaterFinancingAmount isEqual:](dueAmount, "isEqual:"))
          {
LABEL_7:
            dueDate = self->_dueDate;
            v10 = v6->_dueDate;
            if (dueDate && v10)
              v11 = -[NSDate isEqual:](dueDate, "isEqual:");
            else
              v11 = dueDate == v10;
            goto LABEL_15;
          }
        }
        else if (dueAmount == v8)
        {
          goto LABEL_7;
        }
        v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingOptionInstallment)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionInstallment *v5;
  uint64_t v6;
  PKPayLaterFinancingAmount *dueAmount;
  uint64_t v8;
  NSDate *dueDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingOptionInstallment;
  v5 = -[PKPayLaterFinancingOptionInstallment init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    dueAmount = v5->_dueAmount;
    v5->_dueAmount = (PKPayLaterFinancingAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPayLaterFinancingAmount *dueAmount;
  id v5;

  dueAmount = self->_dueAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dueAmount, CFSTR("dueAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDate, CFSTR("dueDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[PKPayLaterFinancingAmount copyWithZone:](self->_dueAmount, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDate copyWithZone:](self->_dueDate, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dueAmount: '%@'; "), self->_dueAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("dueDate: '%@'; "), self->_dueDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKPayLaterFinancingAmount)dueAmount
{
  return self->_dueAmount;
}

- (void)setDueAmount:(id)a3
{
  objc_storeStrong((id *)&self->_dueAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueAmount, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end
