@implementation PKPeerPaymentPurchaseData

- (PKPeerPaymentPurchaseData)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentPurchaseData *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentPurchaseData;
  v5 = -[PKServiceProviderPurchaseData initWithDictionary:](&v8, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentPurchaseDataStatusFromString(v6);

    v5->_requiresInteraction = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresInteraction"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPurchaseData)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPurchaseData *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentPurchaseData;
  v5 = -[PKPeerPaymentPurchaseData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentPurchaseDataStatusFromString(v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresInteraction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresInteraction = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  id v6;
  id v7;

  v4 = self->_status - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ACBD40[v4];
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresInteraction);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("requiresInteraction"));

}

- (unint64_t)hash
{
  return self->_requiresInteraction - self->_status + 32 * self->_status + 16337;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[PKPeerPaymentPurchaseData isEqualToPKPeerPaymentPurchaseData:](self, "isEqualToPKPeerPaymentPurchaseData:", v4);

  return v5;
}

- (BOOL)isEqualToPKPeerPaymentPurchaseData:(id)a3
{
  PKPeerPaymentPurchaseData *v4;
  BOOL v5;

  v4 = (PKPeerPaymentPurchaseData *)a3;
  v5 = self == v4 || self->_status == v4->_status && self->_requiresInteraction == v4->_requiresInteraction;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = CFSTR("pending");
  switch(self->_status)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      v5 = CFSTR("complete");
      goto LABEL_8;
    case 3uLL:
      v5 = CFSTR("rejected");
      goto LABEL_8;
    case 4uLL:
      v5 = CFSTR("canceled");
      goto LABEL_8;
    case 5uLL:
      v5 = CFSTR("expired");
      goto LABEL_8;
    case 6uLL:
      v5 = CFSTR("failed");
      goto LABEL_8;
    default:
      v5 = CFSTR("unknown");
LABEL_8:
      objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v5);
LABEL_9:
      if (self->_requiresInteraction)
        objc_msgSend(v4, "appendFormat:", CFSTR("requiredInteraction: '%@'; "), CFSTR("YES"));
      objc_msgSend(v4, "appendFormat:", CFSTR(">"));
      return v4;
  }
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)requiresInteraction
{
  return self->_requiresInteraction;
}

- (void)setRequiresInteraction:(BOOL)a3
{
  self->_requiresInteraction = a3;
}

@end
