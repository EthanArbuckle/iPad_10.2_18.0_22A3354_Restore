@implementation TVPSecureKeyResponse

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_keyData, a3);
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRenewalDate:(id)a3
{
  objc_storeStrong((id *)&self->_renewalDate, a3);
}

- (TVPSecureKeyRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
