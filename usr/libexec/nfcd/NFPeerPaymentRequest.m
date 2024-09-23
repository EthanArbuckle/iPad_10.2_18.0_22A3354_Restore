@implementation NFPeerPaymentRequest

- (NFPeerPaymentRequest)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentRequest *v5;
  uint64_t v6;
  NFECommercePaymentRequest *topUpRequest;
  uint64_t v8;
  NFPeerPaymentTransferRequest *transferRequest;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentRequest;
  v5 = -[NFPeerPaymentRequest init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topUpRequest")));
    topUpRequest = v5->_topUpRequest;
    v5->_topUpRequest = (NFECommercePaymentRequest *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferRequest")));
    transferRequest = v5->_transferRequest;
    v5->_transferRequest = (NFPeerPaymentTransferRequest *)v8;

  }
  return v5;
}

- (NFPeerPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentRequest *v5;
  id v6;
  uint64_t v7;
  NFECommercePaymentRequest *topUpRequest;
  id v9;
  uint64_t v10;
  NFPeerPaymentTransferRequest *transferRequest;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPeerPaymentRequest;
  v5 = -[NFPeerPaymentRequest init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NFECommercePaymentRequest), CFSTR("topUpRequest"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    topUpRequest = v5->_topUpRequest;
    v5->_topUpRequest = (NFECommercePaymentRequest *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NFPeerPaymentTransferRequest), CFSTR("transferRequest"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    transferRequest = v5->_transferRequest;
    v5->_transferRequest = (NFPeerPaymentTransferRequest *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NFECommercePaymentRequest *topUpRequest;
  id v5;

  topUpRequest = self->_topUpRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", topUpRequest, CFSTR("topUpRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferRequest, CFSTR("transferRequest"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFECommercePaymentRequest)topUpRequest
{
  return self->_topUpRequest;
}

- (void)setTopUpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_topUpRequest, a3);
}

- (NFPeerPaymentTransferRequest)transferRequest
{
  return self->_transferRequest;
}

- (void)setTransferRequest:(id)a3
{
  objc_storeStrong((id *)&self->_transferRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferRequest, 0);
  objc_storeStrong((id *)&self->_topUpRequest, 0);
}

@end
