@implementation PKPaymentRequestPaymentMethodUpdate

- (PKPaymentRequestPaymentMethodUpdate)initWithPaymentSummaryItems:(id)a3
{
  return -[PKPaymentRequestPaymentMethodUpdate initWithErrors:paymentSummaryItems:](self, "initWithErrors:paymentSummaryItems:", 0, a3);
}

- (PKPaymentRequestPaymentMethodUpdate)initWithErrors:(NSArray *)errors paymentSummaryItems:(NSArray *)paymentSummaryItems
{
  NSArray *v6;
  PKPaymentRequestPaymentMethodUpdate *v7;
  NSArray *v8;
  NSArray *v9;
  objc_super v11;

  v6 = errors;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRequestPaymentMethodUpdate;
  v7 = -[PKPaymentRequestUpdate initWithPaymentSummaryItems:](&v11, sel_initWithPaymentSummaryItems_, paymentSummaryItems);
  if (v7)
  {
    if (v6)
    {
      +[PKPaymentAuthorizationResult sanitizedErrors:](PKPaymentAuthorizationResult, "sanitizedErrors:", v6);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    v9 = v7->_errors;
    v7->_errors = v8;

  }
  return v7;
}

- (void)setErrors:(NSArray *)errors
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  v4 = errors;
  v5 = v4;
  v6 = self->_errors;
  if (v6 != v4)
  {
    v8 = v4;
    if (v4)
    {
      +[PKPaymentAuthorizationResult sanitizedErrors:](PKPaymentAuthorizationResult, "sanitizedErrors:", v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_errors;
    }
    else
    {
      v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    }
    self->_errors = v7;

    v5 = v8;
  }

}

- (PKPaymentRequestPaymentMethodUpdate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRequestPaymentMethodUpdate *v5;
  uint64_t v6;
  PKPeerPaymentQuote *peerPaymentQuote;
  uint64_t v8;
  NSString *installmentGroupIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRequestPaymentMethodUpdate;
  v5 = -[PKPaymentRequestUpdate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentQuote"));
    v6 = objc_claimAutoreleasedReturnValue();
    peerPaymentQuote = v5->_peerPaymentQuote;
    v5->_peerPaymentQuote = (PKPeerPaymentQuote *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentGroupIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    installmentGroupIdentifier = v5->_installmentGroupIdentifier;
    v5->_installmentGroupIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRequestPaymentMethodUpdate;
  v4 = a3;
  -[PKPaymentRequestUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerPaymentQuote, CFSTR("peerPaymentQuote"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentGroupIdentifier, CFSTR("installmentGroupIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)errors
{
  return self->_errors;
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (void)setPeerPaymentQuote:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentQuote, a3);
}

- (NSString)installmentGroupIdentifier
{
  return self->_installmentGroupIdentifier;
}

- (void)setInstallmentGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
