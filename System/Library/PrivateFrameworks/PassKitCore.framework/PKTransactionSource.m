@implementation PKTransactionSource

- (PKTransactionSource)initWithPaymentPass:(id)a3
{
  id v5;
  PKTransactionSource *v6;
  PKTransactionSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = -[PKTransactionSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentPass, a3);
    v7->_type = 0;
  }

  return v7;
}

- (PKTransactionSource)initWithPeerPaymentAccount:(id)a3
{
  id v5;
  PKTransactionSource *v6;
  PKTransactionSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = -[PKTransactionSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peerPaymentAccount, a3);
    v7->_type = 1;
  }

  return v7;
}

- (PKTransactionSource)initWithAccountUser:(id)a3
{
  id v5;
  PKTransactionSource *v6;
  PKTransactionSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = -[PKTransactionSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountUser, a3);
    v7->_type = 2;
  }

  return v7;
}

- (PKTransactionSource)initWithAccount:(id)a3
{
  id v5;
  PKTransactionSource *v6;
  PKTransactionSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = -[PKTransactionSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_type = 3;
  }

  return v7;
}

- (NSSet)transactionSourceIdentifiers
{
  uint64_t v2;
  void *v3;
  void *peerPaymentAccount;
  void *v5;

  switch(self->_type)
  {
    case 0uLL:
      -[PKSecureElementPass deviceTransactionSourceIdentifiers](self->_paymentPass, "deviceTransactionSourceIdentifiers");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      peerPaymentAccount = self->_peerPaymentAccount;
      goto LABEL_8;
    case 2uLL:
      -[PKAccountUser transactionSourceIdentifiers](self->_accountUser, "transactionSourceIdentifiers");
      v2 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v3 = (void *)v2;
      return (NSSet *)v3;
    case 3uLL:
      peerPaymentAccount = self->_account;
LABEL_8:
      objc_msgSend(peerPaymentAccount, "transactionSourceIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

      break;
    default:
      v3 = 0;
      break;
  }
  return (NSSet *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionSource)initWithCoder:(id)a3
{
  id v4;
  PKTransactionSource *v5;
  uint64_t v6;
  PKPaymentPass *paymentPass;
  uint64_t v8;
  PKPeerPaymentAccount *peerPaymentAccount;
  uint64_t v10;
  PKAccountUser *accountUser;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionSource;
  v5 = -[PKTransactionSource init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentPass"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentPass = v5->_paymentPass;
    v5->_paymentPass = (PKPaymentPass *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentAccount"));
    v8 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccount = v5->_peerPaymentAccount;
    v5->_peerPaymentAccount = (PKPeerPaymentAccount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUser"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v10;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentPass *paymentPass;
  id v5;

  paymentPass = self->_paymentPass;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paymentPass, CFSTR("paymentPass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerPaymentAccount, CFSTR("peerPaymentAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUser, CFSTR("accountUser"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ADA118[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  switch(self->_type)
  {
    case 0uLL:
      -[PKObject uniqueID](self->_paymentPass, "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("paymentPass uniqueID: '%@'; "), v7);
      goto LABEL_9;
    case 1uLL:
      -[PKPeerPaymentAccount identifier](self->_peerPaymentAccount, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("peerPaymentAccount identifier: '%@'; "), v7);
      goto LABEL_9;
    case 2uLL:
      -[PKAccountUser altDSID](self->_accountUser, "altDSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("accountUser altDSID: '%@'; "), v7);
      goto LABEL_9;
    case 3uLL:
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("account identifier: '%@'; "), v7);
LABEL_9:

      break;
    default:
      break;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[1])
  {
    -[PKTransactionSource transactionSourceIdentifiers](self, "transactionSourceIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionSourceIdentifiers");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqual:", v6);
    else
      v8 = v5 == (void *)v6;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionSource transactionSourceIdentifiers](self, "transactionSourceIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash(17, v3);
  v6 = (unint64_t)(double)self->_type - v5 + 32 * v5;

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
}

@end
