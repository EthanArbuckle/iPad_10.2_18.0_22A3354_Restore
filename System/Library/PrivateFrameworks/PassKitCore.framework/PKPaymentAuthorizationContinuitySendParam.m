@implementation PKPaymentAuthorizationContinuitySendParam

+ (id)paramWithRemotePaymentRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemotePaymentRequest:", v4);

  return v5;
}

- (PKRemotePaymentRequest)remotePaymentRequest
{
  return self->_remotePaymentRequest;
}

- (void)setRemotePaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_remotePaymentRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePaymentRequest, 0);
}

@end
