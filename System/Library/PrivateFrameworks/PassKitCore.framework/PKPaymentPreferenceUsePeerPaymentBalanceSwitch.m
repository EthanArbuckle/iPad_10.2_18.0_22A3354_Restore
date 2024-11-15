@implementation PKPaymentPreferenceUsePeerPaymentBalanceSwitch

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (void)setPeerPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentPass, a3);
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, a3);
}

- (BOOL)isOn
{
  return self->_on;
}

- (void)setOn:(BOOL)a3
{
  self->_on = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
}

@end
