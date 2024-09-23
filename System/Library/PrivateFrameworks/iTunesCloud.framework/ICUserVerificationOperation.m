@implementation ICUserVerificationOperation

+ (id)operationWithVerificationRequest:(id)a3
{
  id v3;
  void *v4;
  ICACAccountVerificationOperation *v5;
  uint64_t v6;
  ICUserVerificationRequest *verificationRequest;

  v3 = a3;
  objc_msgSend(v3, "verificationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "verificationStyle"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_alloc_init(ICACAccountVerificationOperation);
    if (v5)
    {
      v6 = objc_msgSend(v3, "copy");
      verificationRequest = v5->super._verificationRequest;
      v5->super._verificationRequest = (ICUserVerificationRequest *)v6;

    }
  }

  return v5;
}

- (ICUserVerificationRequest)verificationRequest
{
  return self->_verificationRequest;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_verificationRequest, 0);
}

@end
