@implementation MTKeyRequestData

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_keyData, a3);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NSString)contentAdamId
{
  return self->_contentAdamId;
}

- (void)setContentAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_contentAdamId, a3);
}

- (NSNumber)secureInvalidationDsid
{
  return self->_secureInvalidationDsid;
}

- (void)setSecureInvalidationDsid:(id)a3
{
  objc_storeStrong((id *)&self->_secureInvalidationDsid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureInvalidationDsid, 0);
  objc_storeStrong((id *)&self->_contentAdamId, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
