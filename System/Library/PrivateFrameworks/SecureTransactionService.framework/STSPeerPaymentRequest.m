@implementation STSPeerPaymentRequest

- (STSPeerPaymentRequest)initWithTransferRequest:(id)a3 topUpRequest:(id)a4
{
  id v7;
  id v8;
  STSPeerPaymentRequest *v9;
  STSPeerPaymentRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STSPeerPaymentRequest;
  v9 = -[STSPeerPaymentRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transferRequest, a3);
    objc_storeStrong((id *)&v10->_topUpRequest, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPeerPaymentRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSPeerPaymentRequest;
  return -[STSPeerPaymentRequest init](&v3, sel_init);
}

- (STSPeerPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  STSPeerPaymentRequest *v5;
  uint64_t v6;
  STSPeerPaymentTransferRequest *transferRequest;
  uint64_t v8;
  STSMerchantPaymentRequest *topUpRequest;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSPeerPaymentRequest;
  v5 = -[STSPeerPaymentRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    transferRequest = v5->_transferRequest;
    v5->_transferRequest = (STSPeerPaymentTransferRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topUpRequest"));
    v8 = objc_claimAutoreleasedReturnValue();
    topUpRequest = v5->_topUpRequest;
    v5->_topUpRequest = (STSMerchantPaymentRequest *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  STSPeerPaymentTransferRequest *transferRequest;
  id v5;

  transferRequest = self->_transferRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transferRequest, CFSTR("transferRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topUpRequest, CFSTR("topUpRequest"));

}

- (id)toNFPeerPaymentRequest:(id)a3
{
  id v4;
  STSMerchantPaymentRequest *topUpRequest;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  STSMerchantPaymentRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v4 = objc_alloc_init(MEMORY[0x24BE6B5A8]);
  topUpRequest = self->_topUpRequest;
  if (topUpRequest)
  {
    -[STSMerchantPaymentRequest appletIdentifier](topUpRequest, "appletIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSPeerPaymentRequest toNFPeerPaymentRequest:]", 127, self, CFSTR("The topup object is missing the applet identifier."), v7, v8, v14);
    v9 = self->_topUpRequest;
    -[STSMerchantPaymentRequest appletIdentifier](v9, "appletIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSMerchantPaymentRequest toNFECommercePaymentRequest:](v9, "toNFECommercePaymentRequest:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopUpRequest:", v11);

  }
  -[STSPeerPaymentTransferRequest toNFPeerPaymentTransferRequest](self->_transferRequest, "toNFPeerPaymentTransferRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransferRequest:", v12);

  return v4;
}

- (STSMerchantPaymentRequest)topUpRequest
{
  return self->_topUpRequest;
}

- (void)setTopUpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_topUpRequest, a3);
}

- (STSPeerPaymentTransferRequest)transferRequest
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
