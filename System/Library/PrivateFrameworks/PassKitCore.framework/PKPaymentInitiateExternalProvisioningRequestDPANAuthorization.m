@implementation PKPaymentInitiateExternalProvisioningRequestDPANAuthorization

- (PKPaymentInitiateExternalProvisioningRequestDPANAuthorization)initWithDPANID:(id)a3 signatureData:(id)a4 signatureInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentInitiateExternalProvisioningRequestDPANAuthorization *v12;
  PKPaymentInitiateExternalProvisioningRequestDPANAuthorization *v13;
  id *p_isa;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentInitiateExternalProvisioningRequestDPANAuthorization;
    v13 = -[PKPaymentInitiateExternalProvisioningRequestDPANAuthorization init](&v16, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_dpanIdentifier, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  NSData *signatureData;
  NSString *dpanIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("type");
  v12[1] = CFSTR("DPANIdentifier");
  dpanIdentifier = self->_dpanIdentifier;
  signatureData = self->_signatureData;
  v13[0] = CFSTR("dpan");
  v13[1] = dpanIdentifier;
  v12[2] = CFSTR("signature");
  -[NSData base64EncodedStringWithOptions:](signatureData, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("ECDSA");
  -[PKSecureElementSignatureInfo certificates](self->_signatureInfo, "certificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "certificateOfType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("RSA");
  -[PKSecureElementSignatureInfo certificates](self->_signatureInfo, "certificates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "certificateOfType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (PKSecureElementSignatureInfo)signatureInfo
{
  return self->_signatureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureInfo, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end
