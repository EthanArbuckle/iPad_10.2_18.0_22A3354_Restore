@implementation PKPeerPaymentCredential

- (PKPeerPaymentCredential)initWithPeerPaymentAccount:(id)a3
{
  id v5;
  PKPeerPaymentCredential *v6;
  PKPeerPaymentCredential *v7;
  objc_super v9;

  v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentCredential;
    v6 = -[PKPaymentCredential init](&v9, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_account, a3);
      -[PKPaymentCredential setCardType:](v7, "setCardType:", 1);
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentCredential *v4;
  BOOL v5;

  v4 = (PKPeerPaymentCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPeerPaymentCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  PKPeerPaymentAccount *account;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  char v12;

  account = self->_account;
  v4 = a3;
  -[PKPeerPaymentAccount associatedPassSerialNumber](account, "associatedPassSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "associatedPassSerialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    v12 = 1;
  }
  else
  {
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11)
      v12 = 0;
    else
      v12 = objc_msgSend(v8, "isEqualToString:", v9);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount associatedPassSerialNumber](self->_account, "associatedPassSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash(17, v3);
  return v5;
}

- (id)longDescription
{
  return PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_TITLE"), 0);
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[PKPeerPaymentAccount currentBalance](self->_account, "currentBalance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqual:", v5),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(v3, "minimalFormattedStringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ON_FILE_SUBTITLE"), CFSTR("%@"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)ownershipTokenIdentifier
{
  return -[PKPeerPaymentPassDetailsResponse ownershipTokenIdentifier](self->_passDetailsResponse, "ownershipTokenIdentifier");
}

- (NSString)pendingPaymentSenderName
{
  NSString *pendingPaymentSenderAddress;
  id v4;
  NSString *v5;
  NSString *pendingPaymentSenderName;

  if (-[NSString length](self->_pendingPaymentSenderAddress, "length")
    && !-[NSString length](self->_pendingPaymentSenderName, "length"))
  {
    pendingPaymentSenderAddress = self->_pendingPaymentSenderAddress;
    if (qword_1EE1DB5B0 != -1)
      dispatch_once(&qword_1EE1DB5B0, &__block_literal_global_877);
    v4 = (id)qword_1EE1DB5B8;
    +[PKPeerPaymentController displayNameForAddress:contactResolver:](PKPeerPaymentController, "displayNameForAddress:contactResolver:", pendingPaymentSenderAddress, v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    pendingPaymentSenderName = self->_pendingPaymentSenderName;
    self->_pendingPaymentSenderName = v5;

  }
  return self->_pendingPaymentSenderName;
}

- (BOOL)supportsSuperEasyProvisioning
{
  PKPeerPaymentAccount *account;

  account = self->_account;
  if (account)
    LOBYTE(account) = !-[PKPeerPaymentAccount termsAcceptanceRequired](account, "termsAcceptanceRequired");
  return (char)account;
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKPeerPaymentPassDetailsResponse)passDetailsResponse
{
  return self->_passDetailsResponse;
}

- (void)setPassDetailsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_passDetailsResponse, a3);
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (unint64_t)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(unint64_t)a3
{
  self->_flowState = a3;
}

- (NSString)pendingPaymentSenderAddress
{
  return self->_pendingPaymentSenderAddress;
}

- (void)setPendingPaymentSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_paymentMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPaymentSenderAddress, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_passDetailsResponse, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_pendingPaymentSenderName, 0);
}

@end
