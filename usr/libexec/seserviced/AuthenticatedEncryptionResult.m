@implementation AuthenticatedEncryptionResult

+ (id)withCipherText:(id)a3 authenticationTag:(id)a4
{
  NSData *v5;
  NSData *v6;
  AuthenticatedEncryptionResult *v7;
  NSData *cipherText;
  NSData *v9;
  NSData *authenticationTag;

  v5 = (NSData *)a3;
  v6 = (NSData *)a4;
  v7 = objc_opt_new(AuthenticatedEncryptionResult);
  cipherText = v7->_cipherText;
  v7->_cipherText = v5;
  v9 = v5;

  authenticationTag = v7->_authenticationTag;
  v7->_authenticationTag = v6;

  return v7;
}

- (NSData)cipherText
{
  return self->_cipherText;
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationTag, 0);
  objc_storeStrong((id *)&self->_cipherText, 0);
}

@end
