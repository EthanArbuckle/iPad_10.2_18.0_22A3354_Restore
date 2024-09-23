@implementation PKPaymentTransactionDetailAmountLineItemReceipt

- (PKPaymentTransactionDetailAmountLineItemReceipt)initWithReceiptLineItem:(id)a3
{
  id v5;
  PKPaymentTransactionDetailAmountLineItemReceipt *v6;
  PKPaymentTransactionDetailAmountLineItemReceipt *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionDetailAmountLineItemReceipt;
  v6 = -[PKPaymentTransactionDetailAmountLineItemReceipt init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lineItem, a3);

  return v7;
}

- (NSString)label
{
  return (NSString *)-[PKTransactionReceiptLineItem title](self->_lineItem, "title");
}

- (NSString)value
{
  void *v2;
  void *v3;

  -[PKTransactionReceiptLineItem currencyAmount](self->_lineItem, "currencyAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PKTransactionReceiptLineItem image](self->_lineItem, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIImage *)v3;
}

- (NSString)secondaryLabel
{
  return (NSString *)-[PKTransactionReceiptLineItem subtitle](self->_lineItem, "subtitle");
}

- (NSString)tertiaryLabel
{
  return (NSString *)-[PKTransactionReceiptLineItem secondarySubtitle](self->_lineItem, "secondarySubtitle");
}

- (BOOL)isEmphasized
{
  return 0;
}

- (unint64_t)lineItemType
{
  return 10;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineItem, 0);
}

@end
