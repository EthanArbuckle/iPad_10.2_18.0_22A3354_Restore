@implementation PKBarcodeEventMetadataResponse

- (PKBarcodeEventMetadataResponse)initWithPaymentInformation:(NSData *)paymentInformation
{
  NSData *v5;
  PKBarcodeEventMetadataResponse *v6;
  PKBarcodeEventMetadataResponse *v7;
  objc_super v9;

  v5 = paymentInformation;
  v9.receiver = self;
  v9.super_class = (Class)PKBarcodeEventMetadataResponse;
  v6 = -[PKBarcodeEventMetadataResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paymentInformation, paymentInformation);

  return v7;
}

- (PKBarcodeEventMetadataResponse)initWithCoder:(id)a3
{
  id v4;
  PKBarcodeEventMetadataResponse *v5;
  uint64_t v6;
  NSData *paymentInformation;
  PKBarcodeEventMetadataResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKBarcodeEventMetadataResponse;
  v5 = -[PKBarcodeEventMetadataResponse init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentInformation"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentInformation = v5->_paymentInformation;
    v5->_paymentInformation = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_paymentInformation, CFSTR("paymentInformation"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; paymentInformation: %@>"),
               objc_opt_class(),
               self,
               self->_paymentInformation);
}

- (NSData)paymentInformation
{
  return self->_paymentInformation;
}

- (void)setPaymentInformation:(NSData *)paymentInformation
{
  objc_setProperty_nonatomic_copy(self, a2, paymentInformation, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentInformation, 0);
}

@end
