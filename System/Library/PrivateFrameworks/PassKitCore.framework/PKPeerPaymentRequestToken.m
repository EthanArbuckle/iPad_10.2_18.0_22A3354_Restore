@implementation PKPeerPaymentRequestToken

- (PKPeerPaymentRequestToken)initWithRequestToken:(id)a3 deviceScoreIdentifier:(id)a4
{
  return -[PKPeerPaymentRequestToken initWithRequestToken:deviceScoreIdentifier:expiryDate:](self, "initWithRequestToken:deviceScoreIdentifier:expiryDate:", a3, a4, 0);
}

- (PKPeerPaymentRequestToken)initWithRequestToken:(id)a3 deviceScoreIdentifier:(id)a4 expiryDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPeerPaymentRequestToken *v11;
  uint64_t v12;
  NSString *requestToken;
  uint64_t v14;
  NSUUID *deviceScoreIdentifier;
  uint64_t v16;
  NSDate *expiryDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("PKPeerPaymentInformalRequestToken")))
    {

      objc_msgSend((id)objc_opt_class(), "informalRequestToken");
      v11 = (PKPeerPaymentRequestToken *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)PKPeerPaymentRequestToken;
      v11 = -[PKPeerPaymentRequestToken init](&v19, sel_init);
      if (v11)
      {
        v12 = objc_msgSend(v8, "copy");
        requestToken = v11->_requestToken;
        v11->_requestToken = (NSString *)v12;

        v14 = objc_msgSend(v9, "copy");
        deviceScoreIdentifier = v11->_deviceScoreIdentifier;
        v11->_deviceScoreIdentifier = (NSUUID *)v14;

        v16 = objc_msgSend(v10, "copy");
        expiryDate = v11->_expiryDate;
        v11->_expiryDate = (NSDate *)v16;

      }
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

+ (id)informalRequestToken
{
  if (qword_1ECF22350 != -1)
    dispatch_once(&qword_1ECF22350, &__block_literal_global_46);
  return (id)_MergedGlobals_208;
}

void __49__PKPeerPaymentRequestToken_informalRequestToken__block_invoke()
{
  PKPeerPaymentRequestToken *v0;
  void *v1;

  v0 = -[PKPeerPaymentRequestToken initWithRequestToken:deviceScoreIdentifier:expiryDate:]([PKPeerPaymentRequestToken alloc], "initWithRequestToken:deviceScoreIdentifier:expiryDate:", CFSTR("PKPeerPaymentInformalRequestToken"), 0, 0);
  v1 = (void *)_MergedGlobals_208;
  _MergedGlobals_208 = (uint64_t)v0;

}

- (BOOL)isEqualToPeerPaymentRequestToken:(id)a3
{
  _QWORD *v4;
  NSString *requestToken;
  NSString *v6;
  BOOL v7;
  NSUUID *deviceScoreIdentifier;
  NSUUID *v9;
  NSDate *expiryDate;
  NSDate *v11;
  char v12;

  v4 = a3;
  requestToken = self->_requestToken;
  v6 = (NSString *)v4[1];
  if (requestToken)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (requestToken != v6)
      goto LABEL_16;
  }
  else if ((-[NSString isEqual:](requestToken, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  deviceScoreIdentifier = self->_deviceScoreIdentifier;
  v9 = (NSUUID *)v4[2];
  if (!deviceScoreIdentifier || !v9)
  {
    if (deviceScoreIdentifier == v9)
      goto LABEL_12;
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  if ((-[NSUUID isEqual:](deviceScoreIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_12:
  expiryDate = self->_expiryDate;
  v11 = (NSDate *)v4[3];
  if (expiryDate && v11)
    v12 = -[NSDate isEqual:](expiryDate, "isEqual:");
  else
    v12 = expiryDate == v11;
LABEL_17:

  return v12;
}

- (BOOL)isInformalRequestToken
{
  PKPeerPaymentRequestToken *v3;

  +[PKPeerPaymentRequestToken informalRequestToken](PKPeerPaymentRequestToken, "informalRequestToken");
  v3 = (PKPeerPaymentRequestToken *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRequestToken)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRequestToken *v5;
  uint64_t v6;
  NSString *requestToken;
  uint64_t v8;
  NSUUID *deviceScoreIdentifier;
  uint64_t v10;
  NSDate *expiryDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentRequestToken;
  v5 = -[PKPeerPaymentRequestToken init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->_requestToken;
    v5->_requestToken = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceScoreIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceScoreIdentifier = v5->_deviceScoreIdentifier;
    v5->_deviceScoreIdentifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestToken;
  id v5;

  requestToken = self->_requestToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestToken, CFSTR("requestToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceScoreIdentifier, CFSTR("deviceScoreIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("requestToken: '%@'; "), self->_requestToken);
  objc_msgSend(v6, "appendFormat:", CFSTR("deviceScoreIdentifier: '%@'; "), self->_deviceScoreIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("expiryDate: '%@'; "), self->_expiryDate);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_requestToken)
    objc_msgSend(v3, "addObject:");
  if (self->_deviceScoreIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_expiryDate)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRequestToken *v4;
  PKPeerPaymentRequestToken *v5;
  BOOL v6;

  v4 = (PKPeerPaymentRequestToken *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentRequestToken isEqualToPeerPaymentRequestToken:](self, "isEqualToPeerPaymentRequestToken:", v5);

  return v6;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (NSUUID)deviceScoreIdentifier
{
  return self->_deviceScoreIdentifier;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_deviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end
