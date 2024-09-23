@implementation PKSpendingInsightTrend

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSpendingInsightTrend)initWithFHFeatureInsight:(id)a3
{
  id v5;
  PKSpendingInsightTrend *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  PKSpendingInsightTrend *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSDecimalNumber *percentageChange;
  NSDecimalNumber *v31;
  uint64_t v32;
  PKCurrencyAmount *totalSpending;
  NSDecimalNumber *v34;
  uint64_t v35;
  PKCurrencyAmount *previousTotalSpending;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  NSDecimalNumber *v42;
  uint64_t v43;
  PKCurrencyAmount *change;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v49;

  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PKSpendingInsightTrend;
  v6 = -[PKSpendingInsightTrend init](&v49, sel_init);
  if (!v6)
  {
LABEL_47:
    v16 = v6;
    goto LABEL_48;
  }
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v5, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_174();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (!v9 || !v10)
    {

      v13 = v9;
      goto LABEL_13;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_14;
  }
  objc_msgSend(v5, "averageAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "pk_isZeroNumber"))
  {
LABEL_13:

LABEL_14:
LABEL_15:
    objc_msgSend(v5, "type");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_174();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = v18;
    if (v20 == v19)
    {

    }
    else
    {
      v21 = v20;
      if (!v19 || !v20)
      {

        goto LABEL_23;
      }
      v22 = objc_msgSend(v19, "isEqualToString:", v20);

      if ((v22 & 1) == 0)
      {
LABEL_23:
        off_1ECF21B50();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v19;
        v26 = v24;
        if (v26 == v25)
        {

        }
        else
        {
          v27 = v26;
          if (!v19 || !v26)
          {

LABEL_31:
            v23 = 0;
LABEL_32:

            v6->_type = v23;
            objc_msgSend(v5, "spendingInsightPercentageValue");
            v29 = objc_claimAutoreleasedReturnValue();
            percentageChange = v6->_percentageChange;
            v6->_percentageChange = (NSDecimalNumber *)v29;

            objc_msgSend(v5, "spendAmount");
            v31 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v31, CFSTR("USD"), 0);
            v32 = objc_claimAutoreleasedReturnValue();
            totalSpending = v6->_totalSpending;
            v6->_totalSpending = (PKCurrencyAmount *)v32;

            objc_msgSend(v5, "averageAmount");
            v34 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v34, CFSTR("USD"), 0);
            v35 = objc_claimAutoreleasedReturnValue();
            previousTotalSpending = v6->_previousTotalSpending;
            v6->_previousTotalSpending = (PKCurrencyAmount *)v35;

            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithInt:", 1);
            objc_msgSend(v5, "spendAmount");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "pk_isZeroNumber");

            v40 = 0;
            if ((v39 & 1) == 0)
            {
              v47 = objc_msgSend(v5, "direction");
              if (v47)
              {
                if (v47 == 2)
                {
                  if (-[NSDecimalNumber pk_isPositiveNumber](v6->_percentageChange, "pk_isPositiveNumber")&& -[NSDecimalNumber compare:](v6->_percentageChange, "compare:", v37) == NSOrderedAscending)
                  {
                    v40 = 3;
                  }
                  else
                  {
                    v40 = 5;
                  }
                }
                else
                {
                  if (v47 != 1)
                    goto LABEL_34;
                  if (-[NSDecimalNumber pk_isPositiveNumber](v6->_percentageChange, "pk_isPositiveNumber")&& -[NSDecimalNumber compare:](v6->_percentageChange, "compare:", v37) == NSOrderedAscending)
                  {
                    v40 = 2;
                  }
                  else
                  {
                    v40 = 4;
                  }
                }
              }
              else
              {
                v40 = 1;
              }
            }
            v6->_direction = v40;
LABEL_34:
            objc_msgSend(v5, "spendingInsightAmount");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "pk_absoluteValue");
            v42 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

            PKCurrencyAmountCreate(v42, CFSTR("USD"), 0);
            v43 = objc_claimAutoreleasedReturnValue();
            change = v6->_change;
            v6->_change = (PKCurrencyAmount *)v43;

            v45 = 0;
            if (v6->_type == 2)
            {
              off_1ECF21B48();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v46 = objc_msgSend(v5, "merchantCategory");
                if ((unint64_t)(v46 - 1) >= 7)
                  v45 = 0;
                else
                  v45 = v46;
              }
              else
              {
                v45 = 0;
              }
            }
            v6->_category = v45;
            objc_storeStrong((id *)&v6->_fhInsight, a3);

            goto LABEL_47;
          }
          v28 = objc_msgSend(v25, "isEqualToString:", v26);

          if (!v28)
            goto LABEL_31;
        }
        v23 = 2;
        goto LABEL_32;
      }
    }
    v23 = 1;
    goto LABEL_32;
  }
  objc_msgSend(v5, "spendAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "pk_isZeroNumber");

  if ((v15 & 1) != 0)
    goto LABEL_15;
LABEL_11:
  v16 = 0;
LABEL_48:

  return v16;
}

- (PKSpendingInsightTrend)initWithCoder:(id)a3
{
  id v4;
  PKSpendingInsightTrend *v5;
  uint64_t v6;
  NSDecimalNumber *percentageChange;
  uint64_t v8;
  PKCurrencyAmount *change;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSpendingInsightTrend;
  v5 = -[PKSpendingInsightTrend init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_direction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("percentageChange"));
    v6 = objc_claimAutoreleasedReturnValue();
    percentageChange = v5->_percentageChange;
    v5->_percentageChange = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("change"));
    v8 = objc_claimAutoreleasedReturnValue();
    change = v5->_change;
    v5->_change = (PKCurrencyAmount *)v8;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_percentageChange, CFSTR("percentageChange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_change, CFSTR("change"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));

}

- (id)formattedPercentage
{
  float v2;
  double v3;
  BOOL v4;
  double v5;

  -[NSDecimalNumber floatValue](self->_percentageChange, "floatValue");
  if (v2 <= 1000.0)
  {
    v3 = v2;
    v4 = v2 >= 1.0 || v2 <= 0.0;
    v5 = 1.0;
    if (v4)
      v5 = v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f%%"), *(_QWORD *)&v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f%%+"), 0x408F400000000000);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%lu'; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("direction: '%lu'; "), self->_direction);
  objc_msgSend(v3, "appendFormat:", CFSTR("percentageChange: '%@'; "), self->_percentageChange);
  objc_msgSend(v3, "appendFormat:", CFSTR("change: '%@'; "), self->_change);
  PKMerchantCategoryToString(self->_category);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("category: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("fhInsight: '%@'; "), self->_fhInsight);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *percentageChange;
  NSDecimalNumber *v6;
  PKCurrencyAmount *change;
  PKCurrencyAmount *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  percentageChange = self->_percentageChange;
  v6 = (NSDecimalNumber *)v4[4];
  if (percentageChange && v6)
  {
    if ((-[NSDecimalNumber isEqual:](percentageChange, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (percentageChange != v6)
  {
    goto LABEL_15;
  }
  change = self->_change;
  v8 = (PKCurrencyAmount *)v4[5];
  if (!change || !v8)
  {
    if (change == v8)
      goto LABEL_12;
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  if (!-[PKCurrencyAmount isEqual:](change, "isEqual:"))
    goto LABEL_15;
LABEL_12:
  if (self->_type != v4[2] || self->_direction != v4[3])
    goto LABEL_15;
  v9 = self->_category == v4[6];
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_percentageChange);
  objc_msgSend(v3, "safelyAddObject:", self->_change);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_direction - v5 + 32 * v5;
  v7 = self->_category - v6 + 32 * v6;

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (NSDecimalNumber)percentageChange
{
  return self->_percentageChange;
}

- (PKCurrencyAmount)change
{
  return self->_change;
}

- (int64_t)category
{
  return self->_category;
}

- (PKCurrencyAmount)totalSpending
{
  return self->_totalSpending;
}

- (PKCurrencyAmount)previousTotalSpending
{
  return self->_previousTotalSpending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTotalSpending, 0);
  objc_storeStrong((id *)&self->_totalSpending, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_percentageChange, 0);
  objc_storeStrong((id *)&self->_fhInsight, 0);
}

@end
