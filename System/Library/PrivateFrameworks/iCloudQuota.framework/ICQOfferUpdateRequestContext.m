@implementation ICQOfferUpdateRequestContext

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (NSString)buttonId
{
  return self->_buttonId;
}

- (void)setButtonId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_offerId, a3);
}

- (BOOL)isZeroAction
{
  return self->_zeroAction;
}

- (void)setZeroAction:(BOOL)a3
{
  self->_zeroAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_buttonId, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
