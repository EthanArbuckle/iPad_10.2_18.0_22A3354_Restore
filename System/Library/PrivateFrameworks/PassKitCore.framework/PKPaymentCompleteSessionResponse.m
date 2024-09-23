@implementation PKPaymentCompleteSessionResponse

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNonce, 0);
}

@end
