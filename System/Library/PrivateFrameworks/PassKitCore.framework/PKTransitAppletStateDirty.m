@implementation PKTransitAppletStateDirty

- (PKTransitAppletStateDirty)initWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4
{
  id v7;
  id v8;
  PKTransitAppletStateDirty *v9;
  PKTransitAppletStateDirty *v10;
  uint64_t v11;
  NSString *applicationIdentifier;
  uint64_t v13;
  NSString *secureElementIdentifier;
  uint64_t v15;
  NSString *dpanIdentifier;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKTransitAppletStateDirty;
  v9 = -[PKTransitAppletStateDirty init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passUniqueIdentifier, a3);
    objc_msgSend(v8, "applicationIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v11;

    objc_msgSend(v8, "secureElementIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v10->_secureElementIdentifier;
    v10->_secureElementIdentifier = (NSString *)v13;

    objc_msgSend(v8, "dpanIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v10->_dpanIdentifier;
    v10->_dpanIdentifier = (NSString *)v15;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKTransitAppletStateDirty *v4;
  PKTransitAppletStateDirty *v5;
  BOOL v6;

  v4 = (PKTransitAppletStateDirty *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransitAppletStateDirty isEqualToPKTransitAppletStateDirty:](self, "isEqualToPKTransitAppletStateDirty:", v5);

  return v6;
}

- (BOOL)isEqualToPKTransitAppletStateDirty:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  NSString *secureElementIdentifier;
  void *v14;
  NSString *v15;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_passUniqueIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    LOBYTE(v10) = 0;
    goto LABEL_21;
  }
  v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

  if (v10)
  {
LABEL_10:
    v11 = (void *)v4[3];
    v6 = self->_applicationIdentifier;
    v12 = v11;
    if (v6 == v12)
    {

LABEL_16:
      secureElementIdentifier = self->_secureElementIdentifier;
      v14 = (void *)v4[2];
      v6 = secureElementIdentifier;
      v15 = v14;
      if (v6 == v15)
      {
        LOBYTE(v10) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v15;
        LOBYTE(v10) = 0;
        if (v6 && v15)
          LOBYTE(v10) = -[NSString isEqualToString:](v6, "isEqualToString:", v15);
      }
      goto LABEL_21;
    }
    v8 = v12;
    LOBYTE(v10) = 0;
    if (v6 && v12)
    {
      v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

      if (!v10)
        goto LABEL_22;
      goto LABEL_16;
    }
LABEL_21:

  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_passUniqueIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_secureElementIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("paymentApplicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementIdentifier, CFSTR("secureElementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));

}

- (PKTransitAppletStateDirty)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletStateDirty *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSString *passUniqueIdentifier;
  uint64_t v10;
  NSString *secureElementIdentifier;
  uint64_t v12;
  NSString *dpanIdentifier;

  v4 = a3;
  v5 = -[PKTransitAppletStateDirty init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentApplicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSString copyWithZone:](self->_dpanIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setDpanIdentifier:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_passUniqueIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setPassUniqueIdentifier:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setApplicationIdentifier:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_secureElementIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setSecureElementIdentifier:", v9);

  return v5;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
