@implementation PKPeerPaymentTransactionMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentTransactionMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentTransactionMetadata *v5;
  uint64_t v6;
  NSString *dpanIdentifier;
  uint64_t v8;
  NSString *serviceIdentifier;
  uint64_t v10;
  NSUUID *requestDeviceScoreIdentifier;
  uint64_t v12;
  NSUUID *sendDeviceScoreIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentTransactionMetadata;
  v5 = -[PKPeerPaymentTransactionMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestDeviceScoreIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    requestDeviceScoreIdentifier = v5->_requestDeviceScoreIdentifier;
    v5->_requestDeviceScoreIdentifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDeviceScoreIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    sendDeviceScoreIdentifier = v5->_sendDeviceScoreIdentifier;
    v5->_sendDeviceScoreIdentifier = (NSUUID *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *dpanIdentifier;
  id v5;

  dpanIdentifier = self->_dpanIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestDeviceScoreIdentifier, CFSTR("requestDeviceScoreIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sendDeviceScoreIdentifier, CFSTR("sendDeviceScoreIdentifier"));

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

  objc_msgSend(v6, "appendFormat:", CFSTR("dpanIdentifier: '%@'; "), self->_dpanIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("serviceIdentifier: '%@'; "), self->_serviceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("requestDeviceScoreIdentifier: '%@'; "), self->_requestDeviceScoreIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("sendDeviceScoreIdentifier: '%@'; "), self->_sendDeviceScoreIdentifier);
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
  if (self->_dpanIdentifier)
    objc_msgSend(v3, "addObject:");
  if (self->_serviceIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_requestDeviceScoreIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_sendDeviceScoreIdentifier)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentTransactionMetadata *v4;
  PKPeerPaymentTransactionMetadata *v5;
  BOOL v6;

  v4 = (PKPeerPaymentTransactionMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentTransactionMetadata isEqualToPeerPaymentTransactionMetadata:](self, "isEqualToPeerPaymentTransactionMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToPeerPaymentTransactionMetadata:(id)a3
{
  _QWORD *v4;
  NSString *dpanIdentifier;
  NSString *v6;
  BOOL v7;
  NSString *serviceIdentifier;
  NSString *v9;
  NSUUID *requestDeviceScoreIdentifier;
  NSUUID *v11;
  NSUUID *sendDeviceScoreIdentifier;
  NSUUID *v13;
  char v14;

  v4 = a3;
  dpanIdentifier = self->_dpanIdentifier;
  v6 = (NSString *)v4[1];
  if (dpanIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (dpanIdentifier != v6)
      goto LABEL_21;
  }
  else if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_21;
  }
  serviceIdentifier = self->_serviceIdentifier;
  v9 = (NSString *)v4[2];
  if (serviceIdentifier && v9)
  {
    if ((-[NSString isEqual:](serviceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_21;
  }
  else if (serviceIdentifier != v9)
  {
    goto LABEL_21;
  }
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  v11 = (NSUUID *)v4[3];
  if (!requestDeviceScoreIdentifier || !v11)
  {
    if (requestDeviceScoreIdentifier == v11)
      goto LABEL_17;
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  if ((-[NSUUID isEqual:](requestDeviceScoreIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_21;
LABEL_17:
  sendDeviceScoreIdentifier = self->_sendDeviceScoreIdentifier;
  v13 = (NSUUID *)v4[4];
  if (sendDeviceScoreIdentifier && v13)
    v14 = -[NSUUID isEqual:](sendDeviceScoreIdentifier, "isEqual:");
  else
    v14 = sendDeviceScoreIdentifier == v13;
LABEL_22:

  return v14;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)sendDeviceScoreIdentifier
{
  return self->_sendDeviceScoreIdentifier;
}

- (void)setSendDeviceScoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end
