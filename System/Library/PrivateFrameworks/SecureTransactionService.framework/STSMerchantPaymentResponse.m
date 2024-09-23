@implementation STSMerchantPaymentResponse

- (id)initFromNFECommercePaymentResponse:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSMerchantPaymentResponse;
  v5 = -[STSPaymentResponseBase initFromNFECommercePaymentResponse:](&v15, sel_initFromNFECommercePaymentResponse_, v4);
  if (v5)
  {
    objc_msgSend(v4, "confirmationBlobHash");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[5];
    v5[5] = v6;

    objc_msgSend(v4, "confirmationBlobSignature");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v5[6];
    v5[6] = v8;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "confirmationBlobVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v5[7];
    v5[7] = v10;

    objc_msgSend(v4, "SEPcerts");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v5[4];
    v5[4] = v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSMerchantPaymentResponse)initWithCoder:(id)a3
{
  id v4;
  STSMerchantPaymentResponse *v5;
  uint64_t v6;
  NSNumber *confirmationBlobVersion;
  uint64_t v8;
  NSData *confirmationBlobHash;
  uint64_t v10;
  NSData *confirmationBlobSignature;
  uint64_t v12;
  NSArray *sepCerts;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSMerchantPaymentResponse;
  v5 = -[STSPaymentResponseBase initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    confirmationBlobVersion = v5->_confirmationBlobVersion;
    v5->_confirmationBlobVersion = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobHashSignature"));
    v10 = objc_claimAutoreleasedReturnValue();
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("sepCerts"));
    v12 = objc_claimAutoreleasedReturnValue();
    sepCerts = v5->_sepCerts;
    v5->_sepCerts = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSMerchantPaymentResponse;
  v4 = a3;
  -[STSPaymentResponseBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_confirmationBlobVersion, CFSTR("confirmationBlobVersion"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_confirmationBlobHash, CFSTR("confirmationBlobHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_confirmationBlobSignature, CFSTR("confirmationBlobHashSignature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sepCerts, CFSTR("sepCerts"));

}

- (NSArray)sepCerts
{
  return self->_sepCerts;
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (NSData)confirmationBlobSignature
{
  return self->_confirmationBlobSignature;
}

- (NSNumber)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobVersion, 0);
  objc_storeStrong((id *)&self->_confirmationBlobSignature, 0);
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_sepCerts, 0);
}

@end
