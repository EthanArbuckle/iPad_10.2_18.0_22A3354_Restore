@implementation NFPeerPaymentEnrollmentResponse

- (NFPeerPaymentEnrollmentResponse)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentResponse *v5;
  uint64_t v6;
  NSData *prePeerPaymentCertificate;
  uint64_t v8;
  NSDictionary *certificate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentEnrollmentResponse;
  v5 = -[NFPeerPaymentEnrollmentResponse init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paymentCertificate")));
    prePeerPaymentCertificate = v5->_prePeerPaymentCertificate;
    v5->_prePeerPaymentCertificate = (NSData *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("certificates")));
    certificate = v5->_certificate;
    v5->_certificate = (NSDictionary *)v8;

  }
  return v5;
}

- (NFPeerPaymentEnrollmentResponse)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentResponse *v5;
  id v6;
  uint64_t v7;
  NSData *prePeerPaymentCertificate;
  id v9;
  uint64_t v10;
  NSDictionary *certificate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPeerPaymentEnrollmentResponse;
  v5 = -[NFPeerPaymentEnrollmentResponse init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("paymentCertificate"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    prePeerPaymentCertificate = v5->_prePeerPaymentCertificate;
    v5->_prePeerPaymentCertificate = (NSData *)v7;

    v9 = +[NFNSCheckedDecoder coder:decodeDictOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeDictOfClass:forKey:", v4, objc_opt_class(NSData), CFSTR("certificates"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    certificate = v5->_certificate;
    v5->_certificate = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *prePeerPaymentCertificate;
  id v5;

  prePeerPaymentCertificate = self->_prePeerPaymentCertificate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", prePeerPaymentCertificate, CFSTR("paymentCertificate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificate, CFSTR("certificates"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)prePeerPaymentCertificate
{
  return self->_prePeerPaymentCertificate;
}

- (NSDictionary)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_prePeerPaymentCertificate, 0);
}

@end
