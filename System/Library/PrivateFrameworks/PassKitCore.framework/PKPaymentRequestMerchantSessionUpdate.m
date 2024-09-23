@implementation PKPaymentRequestMerchantSessionUpdate

- (PKPaymentRequestMerchantSessionUpdate)initWithStatus:(PKPaymentAuthorizationStatus)status merchantSession:(PKPaymentMerchantSession *)session
{
  PKPaymentMerchantSession *v7;
  PKPaymentRequestMerchantSessionUpdate *v8;
  PKPaymentRequestMerchantSessionUpdate *v9;
  objc_super v11;

  v7 = session;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRequestMerchantSessionUpdate;
  v8 = -[PKPaymentRequestMerchantSessionUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_status = status;
    objc_storeStrong((id *)&v8->_session, session);
  }

  return v9;
}

- (PKPaymentRequestMerchantSessionUpdate)init
{
  return -[PKPaymentRequestMerchantSessionUpdate initWithStatus:merchantSession:](self, "initWithStatus:merchantSession:", 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRequestMerchantSessionUpdate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRequestMerchantSessionUpdate *v5;
  uint64_t v6;
  PKPaymentMerchantSession *session;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentRequestMerchantSessionUpdate;
  v5 = -[PKPaymentRequestMerchantSessionUpdate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session"));
    v6 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (PKPaymentMerchantSession *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentMerchantSession *session;
  id v5;

  session = self->_session;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", session, CFSTR("session"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));

}

- (PKPaymentAuthorizationStatus)status
{
  return self->_status;
}

- (void)setStatus:(PKPaymentAuthorizationStatus)status
{
  self->_status = status;
}

- (PKPaymentMerchantSession)session
{
  return self->_session;
}

- (void)setSession:(PKPaymentMerchantSession *)session
{
  objc_storeStrong((id *)&self->_session, session);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
