@implementation PKAccountHistoricalBalance

- (PKAccountHistoricalBalance)initWithBalance:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  PKAccountHistoricalBalance *v9;
  PKAccountHistoricalBalance *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountHistoricalBalance;
  v9 = -[PKAccountHistoricalBalance init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_balance, a3);
    objc_storeStrong((id *)&v10->_date, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *balance;
  id v5;

  balance = self->_balance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (PKAccountHistoricalBalance)initWithCoder:(id)a3
{
  id v4;
  PKAccountHistoricalBalance *v5;
  uint64_t v6;
  NSDecimalNumber *balance;
  uint64_t v8;
  NSDate *date;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountHistoricalBalance;
  v5 = -[PKAccountHistoricalBalance init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v6 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_balance, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v5[3] = self->_type;
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("balance"), self->_balance);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("date"), self->_date);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("type"), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_balance, 0);
}

@end
