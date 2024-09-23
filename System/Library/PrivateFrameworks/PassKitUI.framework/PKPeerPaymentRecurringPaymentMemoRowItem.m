@implementation PKPeerPaymentRecurringPaymentMemoRowItem

- (PKPeerPaymentRecurringPaymentMemoRowItem)initWithIdentifier:(id)a3 isEditable:(BOOL)a4 titleColor:(id)a5
{
  PKPeerPaymentRecurringPaymentMemoRowItem *v5;
  PKPeerPaymentRecurringPaymentMemo *v6;
  PKPeerPaymentRecurringPaymentMemo *memo;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRecurringPaymentMemoRowItem;
  v5 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:](&v9, sel_initWithIdentifier_isEditable_titleColor_, a3, a4, a5);
  if (v5)
  {
    v6 = (PKPeerPaymentRecurringPaymentMemo *)objc_alloc_init(MEMORY[0x1E0D67458]);
    memo = v5->_memo;
    v5->_memo = v6;

  }
  return v5;
}

- (void)setMemo:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentMemo *v5;
  PKPeerPaymentRecurringPaymentMemo *memo;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (PKPeerPaymentRecurringPaymentMemo *)v4;
  else
    v5 = (PKPeerPaymentRecurringPaymentMemo *)objc_alloc_init(MEMORY[0x1E0D67458]);
  memo = self->_memo;
  self->_memo = v5;

}

- (BOOL)hasIcon
{
  void *v3;
  BOOL v4;

  -[PKPeerPaymentRecurringPaymentMemo emoji](self->_memo, "emoji");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = 1;
  else
    v4 = -[PKPeerPaymentRecurringPaymentMemo color](self->_memo, "color") != 0;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_memo);
  objc_msgSend(v3, "safelyAddObject:", self->_suggestedText);
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentMemoRowItem;
  -[PKPeerPaymentRecurringPaymentDetailRowItem hash](&v6, sel_hash);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRecurringPaymentMemoRowItem *v4;
  PKPeerPaymentRecurringPaymentMemoRowItem *v5;
  PKPeerPaymentRecurringPaymentMemoRowItem *v6;
  NSString *suggestedText;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  objc_super v14;

  v4 = (PKPeerPaymentRecurringPaymentMemoRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)PKPeerPaymentRecurringPaymentMemoRowItem;
    if (-[PKPeerPaymentRecurringPaymentDetailRowItem isEqual:](&v14, sel_isEqual_, v6)
      && PKEqualObjects())
    {
      suggestedText = self->_suggestedText;
      v8 = v6->_suggestedText;
      v9 = suggestedText;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKPeerPaymentRecurringPaymentMemo)memo
{
  return self->_memo;
}

- (NSString)suggestedText
{
  return self->_suggestedText;
}

- (void)setSuggestedText:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedText, 0);
  objc_storeStrong((id *)&self->_memo, 0);
}

@end
