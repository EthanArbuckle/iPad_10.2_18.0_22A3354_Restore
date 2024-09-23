@implementation PKAccountRewardsTierSummary

- (PKAccountRewardsTierSummary)initWithStartDate:(id)a3 endDate:(id)a4 currencyCode:(id)a5 onePercentTotal:(id)a6 twoPercentTotal:(id)a7 threePercentTotal:(id)a8 specialTotal:(id)a9
{
  id v16;
  id v17;
  PKAccountRewardsTierSummary *v18;
  PKAccountRewardsTierSummary *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PKAccountRewardsTierSummary;
  v18 = -[PKAccountRewardsTierSummary init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_currencyCode, a5);
    objc_storeStrong((id *)&v19->_onePercentTotal, a6);
    objc_storeStrong((id *)&v19->_twoPercentTotal, a7);
    objc_storeStrong((id *)&v19->_threePercentTotal, a8);
    objc_storeStrong((id *)&v19->_specialTotal, a9);
  }

  return v19;
}

- (NSCopying)identifier
{
  NSString *uuid;
  void *v4;
  NSString *v5;
  NSString *v6;

  uuid = self->_uuid;
  if (!uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }
  return (NSCopying *)uuid;
}

- (NSDecimalNumber)totalAmount
{
  NSDecimalNumber *onePercentTotal;
  NSDecimalNumber *v4;
  NSDecimalNumber *twoPercentTotal;
  void *v6;
  void *v7;
  NSDecimalNumber *threePercentTotal;
  void *v9;
  NSDecimalNumber *specialTotal;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  onePercentTotal = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v4 = onePercentTotal;
  if (self->_onePercentTotal)
    onePercentTotal = self->_onePercentTotal;
  if (self->_twoPercentTotal)
    twoPercentTotal = self->_twoPercentTotal;
  else
    twoPercentTotal = v4;
  -[NSDecimalNumber decimalNumberByAdding:](onePercentTotal, "decimalNumberByAdding:", twoPercentTotal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_threePercentTotal)
    threePercentTotal = self->_threePercentTotal;
  else
    threePercentTotal = v4;
  objc_msgSend(v6, "decimalNumberByAdding:", threePercentTotal);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_specialTotal)
    specialTotal = self->_specialTotal;
  else
    specialTotal = v4;
  objc_msgSend(v9, "decimalNumberByAdding:", specialTotal);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDecimalNumber *)v11;
}

- (PKCurrencyAmount)totalCurrencyAmount
{
  NSDecimalNumber *v3;
  void *v4;

  if (self->_currencyCode)
  {
    -[PKAccountRewardsTierSummary totalAmount](self, "totalAmount");
    v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PKCurrencyAmount *)v4;
}

- (id)totalForRewardsTier:(unint64_t)a3
{
  NSDecimalNumber *v3;
  NSDecimalNumber *onePercentTotal;

  switch(a3)
  {
    case 1uLL:
      onePercentTotal = self->_onePercentTotal;
      goto LABEL_7;
    case 2uLL:
      onePercentTotal = self->_twoPercentTotal;
      goto LABEL_7;
    case 3uLL:
      onePercentTotal = self->_threePercentTotal;
      goto LABEL_7;
    case 4uLL:
      onePercentTotal = self->_specialTotal;
LABEL_7:
      v3 = onePercentTotal;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (id)currencyAmountForRewardsTier:(unint64_t)a3
{
  NSDecimalNumber *v4;
  void *v5;

  if (self->_currencyCode)
  {
    -[PKAccountRewardsTierSummary totalForRewardsTier:](self, "totalForRewardsTier:", a3);
    v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v4, self->_currencyCode, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  PKLongDateString(self->_startDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), v4);

  PKLongDateString(self->_endDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  -[NSDecimalNumber doubleValue](self->_onePercentTotal, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("onePercent: '%f'; "), v6);
  -[NSDecimalNumber doubleValue](self->_twoPercentTotal, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("twoPercent: '%f'; "), v7);
  -[NSDecimalNumber doubleValue](self->_threePercentTotal, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("threePercent: '%f'; "), v8);
  -[NSDecimalNumber doubleValue](self->_specialTotal, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("special: '%f'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountRewardsTierSummary *v4;
  PKAccountRewardsTierSummary *v5;
  BOOL v6;

  v4 = (PKAccountRewardsTierSummary *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountRewardsTierSummary isEqualToRewardsTierSummary:](self, "isEqualToRewardsTierSummary:", v5);

  return v6;
}

- (BOOL)isEqualToRewardsTierSummary:(id)a3
{
  _QWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  BOOL v7;
  char v8;
  NSDate *endDate;
  NSDate *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _BOOL4 v15;
  NSDecimalNumber *onePercentTotal;
  NSDecimalNumber *v17;
  NSDecimalNumber *twoPercentTotal;
  NSDecimalNumber *v19;
  NSDecimalNumber *threePercentTotal;
  NSDecimalNumber *v21;
  NSDecimalNumber *specialTotal;
  NSDecimalNumber *v23;
  char v24;

  v4 = a3;
  if (!v4)
    goto LABEL_39;
  startDate = self->_startDate;
  v6 = (NSDate *)v4[2];
  if (startDate)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (startDate != v6)
      goto LABEL_39;
  }
  else
  {
    v8 = -[NSDate isEqual:](startDate, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_39;
  }
  endDate = self->_endDate;
  v10 = (NSDate *)v4[3];
  if (endDate && v10)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (endDate != v10)
  {
    goto LABEL_39;
  }
  v11 = (void *)v4[4];
  v12 = self->_currencyCode;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_39;
    }
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_39;
  }
  onePercentTotal = self->_onePercentTotal;
  v17 = (NSDecimalNumber *)v4[5];
  if (onePercentTotal && v17)
  {
    if ((-[NSDecimalNumber isEqual:](onePercentTotal, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (onePercentTotal != v17)
  {
    goto LABEL_39;
  }
  twoPercentTotal = self->_twoPercentTotal;
  v19 = (NSDecimalNumber *)v4[6];
  if (twoPercentTotal && v19)
  {
    if ((-[NSDecimalNumber isEqual:](twoPercentTotal, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (twoPercentTotal != v19)
  {
    goto LABEL_39;
  }
  threePercentTotal = self->_threePercentTotal;
  v21 = (NSDecimalNumber *)v4[7];
  if (!threePercentTotal || !v21)
  {
    if (threePercentTotal == v21)
      goto LABEL_35;
LABEL_39:
    v24 = 0;
    goto LABEL_40;
  }
  if ((-[NSDecimalNumber isEqual:](threePercentTotal, "isEqual:") & 1) == 0)
    goto LABEL_39;
LABEL_35:
  specialTotal = self->_specialTotal;
  v23 = (NSDecimalNumber *)v4[8];
  if (specialTotal && v23)
    v24 = -[NSDecimalNumber isEqual:](specialTotal, "isEqual:");
  else
    v24 = specialTotal == v23;
LABEL_40:

  return v24;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_onePercentTotal);
  objc_msgSend(v3, "safelyAddObject:", self->_twoPercentTotal);
  objc_msgSend(v3, "safelyAddObject:", self->_threePercentTotal);
  objc_msgSend(v3, "safelyAddObject:", self->_specialTotal);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountRewardsTierSummary)initWithCoder:(id)a3
{
  id v4;
  PKAccountRewardsTierSummary *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  NSString *currencyCode;
  uint64_t v12;
  NSDecimalNumber *onePercentTotal;
  uint64_t v14;
  NSDecimalNumber *twoPercentTotal;
  uint64_t v16;
  NSDecimalNumber *threePercentTotal;
  uint64_t v18;
  NSDecimalNumber *specialTotal;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountRewardsTierSummary;
  v5 = -[PKAccountRewardsTierSummary init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onePercentTotal"));
    v12 = objc_claimAutoreleasedReturnValue();
    onePercentTotal = v5->_onePercentTotal;
    v5->_onePercentTotal = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("twoPercentTotal"));
    v14 = objc_claimAutoreleasedReturnValue();
    twoPercentTotal = v5->_twoPercentTotal;
    v5->_twoPercentTotal = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threePercentTotal"));
    v16 = objc_claimAutoreleasedReturnValue();
    threePercentTotal = v5->_threePercentTotal;
    v5->_threePercentTotal = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specialTotal"));
    v18 = objc_claimAutoreleasedReturnValue();
    specialTotal = v5->_specialTotal;
    v5->_specialTotal = (NSDecimalNumber *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_onePercentTotal, CFSTR("onePercentTotal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_twoPercentTotal, CFSTR("twoPercentTotal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_threePercentTotal, CFSTR("threePercentTotal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specialTotal, CFSTR("specialTotal"));

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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_onePercentTotal, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_twoPercentTotal, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_threePercentTotal, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_specialTotal, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSDecimalNumber)onePercentTotal
{
  return self->_onePercentTotal;
}

- (void)setOnePercentTotal:(id)a3
{
  objc_storeStrong((id *)&self->_onePercentTotal, a3);
}

- (NSDecimalNumber)twoPercentTotal
{
  return self->_twoPercentTotal;
}

- (void)setTwoPercentTotal:(id)a3
{
  objc_storeStrong((id *)&self->_twoPercentTotal, a3);
}

- (NSDecimalNumber)threePercentTotal
{
  return self->_threePercentTotal;
}

- (void)setThreePercentTotal:(id)a3
{
  objc_storeStrong((id *)&self->_threePercentTotal, a3);
}

- (NSDecimalNumber)specialTotal
{
  return self->_specialTotal;
}

- (void)setSpecialTotal:(id)a3
{
  objc_storeStrong((id *)&self->_specialTotal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialTotal, 0);
  objc_storeStrong((id *)&self->_threePercentTotal, 0);
  objc_storeStrong((id *)&self->_twoPercentTotal, 0);
  objc_storeStrong((id *)&self->_onePercentTotal, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
