@implementation PKPeerPaymentRecurringPaymentActionRowItem

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentActionRowItem;
  -[PKPeerPaymentRecurringPaymentDetailRowItem hash](&v6, sel_hash);
  PKCombinedHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRecurringPaymentActionRowItem *v4;
  PKPeerPaymentRecurringPaymentActionRowItem *v5;
  PKPeerPaymentRecurringPaymentActionRowItem *v6;
  BOOL v7;
  objc_super v9;

  v4 = (PKPeerPaymentRecurringPaymentActionRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentActionRowItem;
    v7 = -[PKPeerPaymentRecurringPaymentDetailRowItem isEqual:](&v9, sel_isEqual_, v6)
      && PKEqualObjects()
      && self->_actionInProgress == v6->_actionInProgress
      && self->_action == v6->_action;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (BOOL)actionInProgress
{
  return self->_actionInProgress;
}

- (void)setActionInProgress:(BOOL)a3
{
  self->_actionInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
