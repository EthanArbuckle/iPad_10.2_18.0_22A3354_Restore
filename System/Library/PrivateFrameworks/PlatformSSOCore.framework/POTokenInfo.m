@implementation POTokenInfo

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)tokenId
{
  return self->_tokenId;
}

- (void)setTokenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void)setKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)wrapHash
{
  return self->_wrapHash;
}

- (void)setWrapHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)canLogin
{
  return self->_canLogin;
}

- (void)setCanLogin:(BOOL)a3
{
  self->_canLogin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapHash, 0);
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_tokenId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
