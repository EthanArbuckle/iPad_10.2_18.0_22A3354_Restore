@implementation PKBankAccountDataItem

+ (int64_t)dataType
{
  return 9;
}

- (PKBankAccountDataItem)initWithModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKBankAccountDataItem;
  return -[PKPaymentDataItem initWithModel:](&v4, sel_initWithModel_, a3);
}

- (int64_t)context
{
  return 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (PKBankAccountInformation)bankAccountInformation
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bankAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKBankAccountInformation *)v3;
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, a3);
}

- (BOOL)showPeerPaymentBalance
{
  return self->_showPeerPaymentBalance;
}

- (void)setShowPeerPaymentBalance:(BOOL)a3
{
  self->_showPeerPaymentBalance = a3;
}

- (PKBankAccountInformation)PKBankAccountInformation
{
  return self->_PKBankAccountInformation;
}

- (void)setPKBankAccountInformation:(id)a3
{
  objc_storeStrong((id *)&self->_PKBankAccountInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PKBankAccountInformation, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
}

@end
