@implementation PKBillPaymentSuggestedAmount

- (PKBillPaymentSuggestedAmount)initWithAmount:(id)a3 category:(unint64_t)a4
{
  id v6;
  PKBillPaymentSuggestedAmount *v7;
  uint64_t v8;
  NSDecimalNumber *amount;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBillPaymentSuggestedAmount;
  v7 = -[PKBillPaymentSuggestedAmount init](&v11, sel_init);
  if (v7)
  {
    +[PKBillPaymentSuggestedAmount roundingAmount:](PKBillPaymentSuggestedAmount, "roundingAmount:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v7->_amount;
    v7->_amount = (NSDecimalNumber *)v8;

    v7->_category = a4;
  }

  return v7;
}

+ (id)roundingAmount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB35A0];
  v4 = a3;
  objc_msgSend(v3, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberByRoundingAccordingToBehavior:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *amount;
  NSDecimalNumber *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    amount = self->_amount;
    v6 = (NSDecimalNumber *)v4[4];
    if (amount && v6)
      v7 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    else
      v7 = amount == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  NSDecimalNumber *amount;
  void *v4;
  int64_t v5;

  amount = self->_amount;
  objc_msgSend(a3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDecimalNumber compare:](amount, "compare:", v4);

  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_message);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_category - v4 + 32 * v4;
  v6 = self->_priority - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  PKBillPaymentSuggestedAmountCategoryToString(self->_category);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("category: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("message: '%@'; "), self->_message);
  objc_msgSend(v3, "appendFormat:", CFSTR("priority: %ld; "), self->_priority);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
