@implementation PKPeerPaymentRecurringPaymentDetailRowItem

- (PKPeerPaymentRecurringPaymentDetailRowItem)initWithIdentifier:(id)a3 isEditable:(BOOL)a4 titleColor:(id)a5
{
  id v9;
  id v10;
  PKPeerPaymentRecurringPaymentDetailRowItem *v11;
  PKPeerPaymentRecurringPaymentDetailRowItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentRecurringPaymentDetailRowItem;
  v11 = -[PKPeerPaymentRecurringPaymentDetailRowItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_isEditable = a4;
    objc_storeStrong((id *)&v12->_titleColor, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_titleColor);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRecurringPaymentDetailRowItem *v4;
  PKPeerPaymentRecurringPaymentDetailRowItem *v5;
  unsigned __int8 *v6;
  char v7;

  v4 = (PKPeerPaymentRecurringPaymentDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects() && self->_isEditable == v6[8])
      v7 = PKEqualObjects();
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
