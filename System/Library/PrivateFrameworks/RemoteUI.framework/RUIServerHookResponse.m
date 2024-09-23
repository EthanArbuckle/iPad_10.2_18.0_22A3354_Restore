@implementation RUIServerHookResponse

- (NSDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setAdditionalPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURLRequest)continuationRequest
{
  return self->_continuationRequest;
}

- (void)setContinuationRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationRequest, 0);
  objc_storeStrong((id *)&self->_additionalPayload, 0);
}

@end
