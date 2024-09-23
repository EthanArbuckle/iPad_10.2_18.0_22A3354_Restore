@implementation PKPeerPaymentAccountResolutionControllerConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  unint64_t paymentMode;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  PKPeerPaymentRegistrationFlowStateToString(self->_registrationFlowState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("registrationFlowState: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("senderAddress: '%@'; "), self->_senderAddress);
  PKPeerPaymentIdentityVerificationContextToString(self->_verificationContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("verificationContext: '%@'; "), v5);

  if (self->_graduation)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("graduation: '%@'; "), v6);
  paymentMode = self->_paymentMode;
  v8 = CFSTR("unknown");
  if (paymentMode == 1)
    v8 = CFSTR("messages");
  if (paymentMode == 2)
    v9 = CFSTR("deviceTap");
  else
    v9 = v8;
  objc_msgSend(v3, "appendFormat:", CFSTR("peerPaymentPaymentMode: '%@'; "), v9);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (unint64_t)registrationFlowState
{
  return self->_registrationFlowState;
}

- (void)setRegistrationFlowState:(unint64_t)a3
{
  self->_registrationFlowState = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)verificationContext
{
  return self->_verificationContext;
}

- (void)setVerificationContext:(int64_t)a3
{
  self->_verificationContext = a3;
}

- (BOOL)isGraduation
{
  return self->_graduation;
}

- (void)setGraduation:(BOOL)a3
{
  self->_graduation = a3;
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
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end
