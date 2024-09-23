@implementation PKAccountUserNotificationSettings

- (PKAccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3
{
  id v4;
  PKAccountUserNotificationSettings *v5;
  uint64_t v6;
  NSDecimalNumber *transactionNotificationThreshold;
  uint64_t v8;
  NSDecimalNumber *monthlySpendNotificationThreshold;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserNotificationSettings;
  v5 = -[PKAccountUserNotificationSettings init](&v11, sel_init);
  if (v5)
  {
    v5->_transactionNotificationsEnabled = objc_msgSend(v4, "transactionNotificationsEnabled");
    objc_msgSend(v4, "transactionNotificationThreshold");
    v6 = objc_claimAutoreleasedReturnValue();
    transactionNotificationThreshold = v5->_transactionNotificationThreshold;
    v5->_transactionNotificationThreshold = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "monthlySpendNotificationThreshold");
    v8 = objc_claimAutoreleasedReturnValue();
    monthlySpendNotificationThreshold = v5->_monthlySpendNotificationThreshold;
    v5->_monthlySpendNotificationThreshold = (NSDecimalNumber *)v8;

  }
  return v5;
}

+ (id)defaultNotificationSettings
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[8] = 1;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountUserNotificationSettings *v4;
  PKAccountUserNotificationSettings *v5;
  BOOL v6;

  v4 = (PKAccountUserNotificationSettings *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountUserNotificationSettings _isEqualToAccountUserNotificationSettings:](self, "_isEqualToAccountUserNotificationSettings:", v5);

  return v6;
}

- (BOOL)_isEqualToAccountUserNotificationSettings:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSDecimalNumber *transactionNotificationThreshold;
  NSDecimalNumber *v7;
  NSDecimalNumber *monthlySpendNotificationThreshold;
  NSDecimalNumber *v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_transactionNotificationsEnabled != *((unsigned __int8 *)v4 + 8))
    goto LABEL_10;
  transactionNotificationThreshold = self->_transactionNotificationThreshold;
  v7 = (NSDecimalNumber *)v5[2];
  if (!transactionNotificationThreshold || !v7)
  {
    if (transactionNotificationThreshold == v7)
      goto LABEL_6;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if ((-[NSDecimalNumber isEqual:](transactionNotificationThreshold, "isEqual:") & 1) == 0)
    goto LABEL_10;
LABEL_6:
  monthlySpendNotificationThreshold = self->_monthlySpendNotificationThreshold;
  v9 = (NSDecimalNumber *)v5[3];
  if (monthlySpendNotificationThreshold && v9)
    v10 = -[NSDecimalNumber isEqual:](monthlySpendNotificationThreshold, "isEqual:");
  else
    v10 = monthlySpendNotificationThreshold == v9;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionNotificationThreshold);
  objc_msgSend(v3, "safelyAddObject:", self->_monthlySpendNotificationThreshold);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_transactionNotificationsEnabled - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserNotificationSettings)initWithCoder:(id)a3
{
  id v4;
  PKAccountUserNotificationSettings *v5;
  uint64_t v6;
  NSDecimalNumber *transactionNotificationThreshold;
  uint64_t v8;
  NSDecimalNumber *monthlySpendNotificationThreshold;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserNotificationSettings;
  v5 = -[PKAccountUserNotificationSettings init](&v11, sel_init);
  if (v5)
  {
    v5->_transactionNotificationsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transactionNotificationsEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionNotificationThreshold"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionNotificationThreshold = v5->_transactionNotificationThreshold;
    v5->_transactionNotificationThreshold = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monthlySpendNotificationThreshold"));
    v8 = objc_claimAutoreleasedReturnValue();
    monthlySpendNotificationThreshold = v5->_monthlySpendNotificationThreshold;
    v5->_monthlySpendNotificationThreshold = (NSDecimalNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 transactionNotificationsEnabled;
  id v5;

  transactionNotificationsEnabled = self->_transactionNotificationsEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", transactionNotificationsEnabled, CFSTR("transactionNotificationsEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionNotificationThreshold, CFSTR("transactionNotificationThreshold"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_monthlySpendNotificationThreshold, CFSTR("monthlySpendNotificationThreshold"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PKAccountUserNotificationSettings initWithAccountUserNotificationSettings:](+[PKMutableAccountUserNotificationSettings allocWithZone:](PKMutableAccountUserNotificationSettings, "allocWithZone:", a3), "initWithAccountUserNotificationSettings:", self);
}

- (BOOL)transactionNotificationsEnabled
{
  return self->_transactionNotificationsEnabled;
}

- (void)setTransactionNotificationsEnabled:(BOOL)a3
{
  self->_transactionNotificationsEnabled = a3;
}

- (NSDecimalNumber)transactionNotificationThreshold
{
  return self->_transactionNotificationThreshold;
}

- (void)setTransactionNotificationThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_transactionNotificationThreshold, a3);
}

- (NSDecimalNumber)monthlySpendNotificationThreshold
{
  return self->_monthlySpendNotificationThreshold;
}

- (void)setMonthlySpendNotificationThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_monthlySpendNotificationThreshold, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlySpendNotificationThreshold, 0);
  objc_storeStrong((id *)&self->_transactionNotificationThreshold, 0);
}

@end
