@implementation PKPeerPaymentRecurringPaymentFundingSource

+ (id)fundingSourceWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (PKPeerPaymentRecurringPaymentFundingSource)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentFundingSource *v5;
  void *v6;
  uint64_t v7;
  NSString *dpanIdentifier;
  void *v9;
  uint64_t v10;
  NSString *fpanIdentifier;
  void *v12;
  uint64_t v13;
  NSString *mpanIdentifier;
  void *v15;
  uint64_t v16;
  NSString *name;
  void *v18;
  uint64_t v19;
  NSString *suffix;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSource;
  v5 = -[PKPeerPaymentRecurringPaymentFundingSource init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("dpanIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("fpanIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("mpanIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    mpanIdentifier = v5->_mpanIdentifier;
    v5->_mpanIdentifier = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v16;

    v5->_type = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("type"));
    v5->_network = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("network"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("suffix"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v19;

  }
  return v5;
}

+ (id)fundingSourceWithPass:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPass:", v4);

  return v5;
}

- (PKPeerPaymentRecurringPaymentFundingSource)initWithPass:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentFundingSource *v5;
  void *v6;
  uint64_t v7;
  NSString *dpanIdentifier;
  uint64_t v9;
  NSString *fpanIdentifier;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *suffix;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSource;
  v5 = -[PKPeerPaymentRecurringPaymentFundingSource init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "devicePrimaryInAppPaymentApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dpanIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v7;

    objc_msgSend(v4, "primaryAccountIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v9;

    objc_msgSend(v4, "localizedDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v11;

    v5->_type = objc_msgSend(v6, "paymentType");
    v5->_network = objc_msgSend(v6, "paymentNetworkIdentifier");
    objc_msgSend(v4, "primaryAccountNumberSuffix");
    v13 = objc_claimAutoreleasedReturnValue();
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPaymentFundingSource)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentFundingSource *v5;
  uint64_t v6;
  NSString *dpanIdentifier;
  uint64_t v8;
  NSString *fpanIdentifier;
  uint64_t v10;
  NSString *mpanIdentifier;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *suffix;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSource;
  v5 = -[PKPeerPaymentRecurringPaymentFundingSource init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpanIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mpanIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    mpanIdentifier = v5->_mpanIdentifier;
    v5->_mpanIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_network = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("network"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suffix"));
    v14 = objc_claimAutoreleasedReturnValue();
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v14;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mpanIdentifier, CFSTR("mpanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_network, CFSTR("network"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suffix, CFSTR("suffix"));

}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_fpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_mpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_suffix);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_network - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *dpanIdentifier;
  NSString *v6;
  NSString *fpanIdentifier;
  NSString *v8;
  NSString *mpanIdentifier;
  NSString *v10;
  NSString *name;
  NSString *v12;
  NSString *suffix;
  NSString *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  dpanIdentifier = self->_dpanIdentifier;
  v6 = (NSString *)v4[1];
  if (dpanIdentifier && v6)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (dpanIdentifier != v6)
  {
    goto LABEL_29;
  }
  fpanIdentifier = self->_fpanIdentifier;
  v8 = (NSString *)v4[2];
  if (fpanIdentifier && v8)
  {
    if ((-[NSString isEqual:](fpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (fpanIdentifier != v8)
  {
    goto LABEL_29;
  }
  mpanIdentifier = self->_mpanIdentifier;
  v10 = (NSString *)v4[3];
  if (mpanIdentifier && v10)
  {
    if ((-[NSString isEqual:](mpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (mpanIdentifier != v10)
  {
    goto LABEL_29;
  }
  name = self->_name;
  v12 = (NSString *)v4[4];
  if (name && v12)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (name != v12)
  {
    goto LABEL_29;
  }
  suffix = self->_suffix;
  v14 = (NSString *)v4[7];
  if (!suffix || !v14)
  {
    if (suffix == v14)
      goto LABEL_27;
LABEL_29:
    v15 = 0;
    goto LABEL_30;
  }
  if ((-[NSString isEqual:](suffix, "isEqual:") & 1) == 0)
    goto LABEL_29;
LABEL_27:
  if (self->_type != v4[5])
    goto LABEL_29;
  v15 = self->_network == v4[6];
LABEL_30:

  return v15;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dpanIdentifier: '%@'; "), self->_dpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: '%@'; "), self->_fpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("mpanIdentifier: '%@'; "), self->_mpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("cardName: '%@'; "), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("cardType: '%ld'; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("cardNetwork: '%ld'; "), self->_network);
  objc_msgSend(v3, "appendFormat:", CFSTR("cardSuffix: '%@'; "), self->_suffix);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentRecurringPaymentFundingSource *v5;
  uint64_t v6;
  NSString *dpanIdentifier;
  uint64_t v8;
  NSString *fpanIdentifier;
  uint64_t v10;
  NSString *mpanIdentifier;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *suffix;

  v5 = -[PKPeerPaymentRecurringPaymentFundingSource init](+[PKPeerPaymentRecurringPaymentFundingSource allocWithZone:](PKPeerPaymentRecurringPaymentFundingSource, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_dpanIdentifier, "copyWithZone:", a3);
  dpanIdentifier = v5->_dpanIdentifier;
  v5->_dpanIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_fpanIdentifier, "copyWithZone:", a3);
  fpanIdentifier = v5->_fpanIdentifier;
  v5->_fpanIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_mpanIdentifier, "copyWithZone:", a3);
  mpanIdentifier = v5->_mpanIdentifier;
  v5->_mpanIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v12;

  v5->_type = self->_type;
  v5->_network = self->_network;
  v14 = -[NSString copyWithZone:](self->_suffix, "copyWithZone:", a3);
  suffix = v5->_suffix;
  v5->_suffix = (NSString *)v14;

  return v5;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)mpanIdentifier
{
  return self->_mpanIdentifier;
}

- (void)setMPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (int64_t)network
{
  return self->_network;
}

- (void)setNetwork:(int64_t)a3
{
  self->_network = a3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mpanIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end
