@implementation PKBarcodeEventSignatureResponse

- (PKBarcodeEventSignatureResponse)initWithSignedData:(NSData *)signedData
{
  NSData *v5;
  PKBarcodeEventSignatureResponse *v6;
  PKBarcodeEventSignatureResponse *v7;
  objc_super v9;

  v5 = signedData;
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodeEventSignatureResponse;
  v6 = -[PKBarcodeEventSignatureResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signedData, signedData);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_signedData, CFSTR("signedData"));
}

- (PKBarcodeEventSignatureResponse)initWithCoder:(id)a3
{
  id v4;
  PKBarcodeEventSignatureResponse *v5;
  uint64_t v6;
  NSData *signedData;
  PKBarcodeEventSignatureResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKBarcodeEventSignatureResponse;
  v5 = -[PKBarcodeEventSignatureResponse init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedData"));
    v6 = objc_claimAutoreleasedReturnValue();
    signedData = v5->_signedData;
    v5->_signedData = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; signedData: %tu bytes>"),
               objc_opt_class(),
               self,
               -[NSData length](self->_signedData, "length"));
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(NSData *)signedData
{
  objc_setProperty_nonatomic_copy(self, a2, signedData, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedData, 0);
}

@end
