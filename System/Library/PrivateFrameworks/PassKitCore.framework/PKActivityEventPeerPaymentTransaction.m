@implementation PKActivityEventPeerPaymentTransaction

- (PKActivityEventPeerPaymentTransaction)initWithTransaction:(id)a3 relatedTopUpWithdrawlTransaction:(id)a4 relatedTopUpDepositTransaction:(id)a5 unread:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  PKActivityEventPeerPaymentTransaction *v13;
  PKActivityEventPeerPaymentTransaction *v14;
  objc_super v16;

  v6 = a6;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKActivityEventPeerPaymentTransaction;
  v13 = -[PKActivityEventTransaction initWithTransaction:unread:](&v16, sel_initWithTransaction_unread_, a3, v6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_relatedTopUpPeerPaymentAccountDepositTransaction, a5);
    objc_storeStrong((id *)&v14->_relatedTopUpFundingSourceWithdrawlTransaction, a4);
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKActivityEventPeerPaymentTransaction;
  v3 = -[PKActivityEventTransaction hash](&v6, sel_hash);
  v4 = -[PKPaymentTransaction hash](self->_relatedTopUpFundingSourceWithdrawlTransaction, "hash") - v3 + 32 * v3;
  return -[PKPaymentTransaction hash](self->_relatedTopUpPeerPaymentAccountDepositTransaction, "hash") - v4 + 32 * v4;
}

- (BOOL)isEqualToActivityEvent:(id)a3
{
  id v4;
  _QWORD *v5;
  PKPaymentTransaction *relatedTopUpFundingSourceWithdrawlTransaction;
  PKPaymentTransaction *v7;
  BOOL v8;
  BOOL v9;
  PKPaymentTransaction *relatedTopUpPeerPaymentAccountDepositTransaction;
  PKPaymentTransaction *v12;
  BOOL v13;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v14.receiver = self;
  v14.super_class = (Class)PKActivityEventPeerPaymentTransaction;
  if (-[PKActivityEventTransaction isEqualToActivityEvent:](&v14, sel_isEqualToActivityEvent_, v5))
  {
    relatedTopUpFundingSourceWithdrawlTransaction = self->_relatedTopUpFundingSourceWithdrawlTransaction;
    v7 = (PKPaymentTransaction *)v5[6];
    if (relatedTopUpFundingSourceWithdrawlTransaction)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      if (relatedTopUpFundingSourceWithdrawlTransaction == v7)
      {
LABEL_14:
        relatedTopUpPeerPaymentAccountDepositTransaction = self->_relatedTopUpPeerPaymentAccountDepositTransaction;
        v12 = (PKPaymentTransaction *)v5[7];
        if (relatedTopUpPeerPaymentAccountDepositTransaction)
          v13 = v12 == 0;
        else
          v13 = 1;
        if (v13)
          v9 = relatedTopUpPeerPaymentAccountDepositTransaction == v12;
        else
          v9 = -[PKPaymentTransaction isEqual:](relatedTopUpPeerPaymentAccountDepositTransaction, "isEqual:");
        goto LABEL_10;
      }
    }
    else if (-[PKPaymentTransaction isEqual:](relatedTopUpFundingSourceWithdrawlTransaction, "isEqual:"))
    {
      goto LABEL_14;
    }
  }
  v9 = 0;
LABEL_10:

LABEL_12:
  return v9;
}

- (id)eventType
{
  return CFSTR("peerPaymentTransaction");
}

- (PKPaymentTransaction)relatedTopUpFundingSourceWithdrawlTransaction
{
  return self->_relatedTopUpFundingSourceWithdrawlTransaction;
}

- (PKPaymentTransaction)relatedTopUpPeerPaymentAccountDepositTransaction
{
  return self->_relatedTopUpPeerPaymentAccountDepositTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedTopUpPeerPaymentAccountDepositTransaction, 0);
  objc_storeStrong((id *)&self->_relatedTopUpFundingSourceWithdrawlTransaction, 0);
}

@end
