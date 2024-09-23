@implementation PKRefreshVPANPaymentCredentialRequest

- (id)endpointComponents
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  -[PKRetrieveVPANPaymentCredentialRequest deviceIdentifier](self, "deviceIdentifier", CFSTR("devices"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v2;
  v5[2] = CFSTR("virtualCardRefresh");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKRefreshVPANPaymentCredentialRequest)initWithPaymentPass:(id)a3 vpanIdentifier:(id)a4 deviceIdentifier:(id)a5 nonce:(id)a6 encryptionFields:(id)a7
{
  return -[PKRetrieveVPANPaymentCredentialRequest initWithPaymentPass:vpanIdentifier:deviceIdentifier:nonce:encryptionFields:merchantHost:](self, "initWithPaymentPass:vpanIdentifier:deviceIdentifier:nonce:encryptionFields:merchantHost:", a3, a4, a5, a6, a7, 0);
}

@end
