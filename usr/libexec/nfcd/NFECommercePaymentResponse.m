@implementation NFECommercePaymentResponse

- (NFECommercePaymentResponse)initWithDictionary:(id)a3
{
  id v4;
  NFECommercePaymentResponse *v5;
  uint64_t v6;
  NSString *transactionIdentifier;
  uint64_t v8;
  NSData *transactionData;
  uint64_t v10;
  NSData *confirmationBlobHash;
  uint64_t v12;
  NSData *confirmationBlobSignature;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFECommercePaymentResponse;
  v5 = -[NFECommercePaymentResponse init](&v16, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionIdentifier")));
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionData")));
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationBlobHash")));
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationBlobHashSignature")));
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationBlobVersion")));
    v5->_confirmationBlobVersion = (int64_t)objc_msgSend(v14, "integerValue");

  }
  return v5;
}

- (NFECommercePaymentResponse)initWithCoder:(id)a3
{
  id v4;
  NFECommercePaymentResponse *v5;
  id v6;
  uint64_t v7;
  NSString *transactionIdentifier;
  id v9;
  uint64_t v10;
  NSData *transactionData;
  id v12;
  uint64_t v13;
  NSDictionary *certs;
  id v15;
  uint64_t v16;
  NSData *confirmationBlobHash;
  id v18;
  uint64_t v19;
  NSData *confirmationBlobSignature;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSArray *SEPcerts;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NFECommercePaymentResponse;
  v5 = -[NFECommercePaymentResponse init](&v27, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("transactionIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("transactionData"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v10;

    v12 = +[NFNSCheckedDecoder coder:decodeDictOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeDictOfClass:forKey:", v4, objc_opt_class(NSString), CFSTR("certs"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    certs = v5->_certs;
    v5->_certs = (NSDictionary *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("confirmationBlobHash"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("confirmationBlobHashSignature"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("confirmationBlobVersion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v5->_confirmationBlobVersion = (int64_t)objc_msgSend(v22, "integerValue");

    v23 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSData), CFSTR("sepCerts"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    SEPcerts = v5->_SEPcerts;
    v5->_SEPcerts = (NSArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *confirmationBlobHash;
  NSData *confirmationBlobSignature;
  void *v6;
  NSArray *SEPcerts;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_transactionData, CFSTR("transactionData"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_certs, CFSTR("certs"));
  confirmationBlobHash = self->_confirmationBlobHash;
  if (confirmationBlobHash)
    objc_msgSend(v8, "encodeObject:forKey:", confirmationBlobHash, CFSTR("confirmationBlobHash"));
  confirmationBlobSignature = self->_confirmationBlobSignature;
  if (confirmationBlobSignature)
    objc_msgSend(v8, "encodeObject:forKey:", confirmationBlobSignature, CFSTR("confirmationBlobHashSignature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_confirmationBlobVersion));
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("confirmationBlobVersion"));

  SEPcerts = self->_SEPcerts;
  if (SEPcerts)
    objc_msgSend(v8, "encodeObject:forKey:", SEPcerts, CFSTR("sepCerts"));

}

- (void)setCerts:(id)a3
{
  objc_storeStrong((id *)&self->_certs, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setConfirmationBlobHash:(id)a3 withSignature:(id)a4 version:(unint64_t)a5
{
  NSData *v8;
  NSData *v9;
  NSData *confirmationBlobHash;
  NSData *v11;
  NSData *confirmationBlobSignature;

  v8 = (NSData *)a3;
  v9 = (NSData *)a4;
  confirmationBlobHash = self->_confirmationBlobHash;
  self->_confirmationBlobHash = v8;
  v11 = v8;

  confirmationBlobSignature = self->_confirmationBlobSignature;
  self->_confirmationBlobSignature = v9;

  self->_confirmationBlobVersion = a5;
}

- (void)setSEPCerts:(id)a3
{
  objc_storeStrong((id *)&self->_SEPcerts, a3);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certs
{
  return self->_certs;
}

- (NSArray)SEPcerts
{
  return self->_SEPcerts;
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (NSData)confirmationBlobSignature
{
  return self->_confirmationBlobSignature;
}

- (int64_t)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobSignature, 0);
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_SEPcerts, 0);
  objc_storeStrong((id *)&self->_certs, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
