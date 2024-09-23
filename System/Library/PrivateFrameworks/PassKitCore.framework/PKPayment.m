@implementation PKPayment

+ (PKPayment)paymentWithProtobuf:(id)a3
{
  id v3;
  PKPayment *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = objc_alloc_init(PKPayment);
  objc_msgSend(v3, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentToken paymentTokenWithProtobuf:](PKPaymentToken, "paymentTokenWithProtobuf:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayment setToken:](v4, "setToken:", v6);

  objc_msgSend(v3, "billingContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = objc_opt_class();
    objc_msgSend(v3, "billingContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setBillingContact:](v4, "setBillingContact:", v11);

  }
  objc_msgSend(v3, "shippingContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3710];
    v14 = objc_opt_class();
    objc_msgSend(v3, "shippingContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setShippingContact:](v4, "setShippingContact:", v16);

  }
  objc_msgSend(v3, "shippingMethod");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "shippingMethod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setShippingMethod:](v4, "setShippingMethod:", v19);

  }
  return v4;
}

- (id)protobuf
{
  PKProtobufPayment *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(PKProtobufPayment);
  -[PKPayment token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPayment setToken:](v3, "setToken:", v5);

  -[PKPayment billingContact](self, "billingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPayment billingContact](self, "billingContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPayment setBillingContact:](v3, "setBillingContact:", v9);

  }
  -[PKPayment shippingContact](self, "shippingContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPayment shippingContact](self, "shippingContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPayment setShippingContact:](v3, "setShippingContact:", v13);

  }
  -[PKPayment shippingMethod](self, "shippingMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PKPayment shippingMethod](self, "shippingMethod");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shippingMethodProtobuf");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPayment setShippingMethod:](v3, "setShippingMethod:", v16);

  }
  return v3;
}

+ (int64_t)version
{
  return 4;
}

- (PKPayment)initWithToken:(id)a3
{
  id v5;
  PKPayment *v6;
  PKPayment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayment;
  v6 = -[PKPayment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_token, a3);

  return v7;
}

- (ABRecordRef)shippingAddress
{
  void *v2;
  const void *v3;

  -[PKContact cnMutableContact](self->_shippingContact, "cnMutableContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const void *)objc_msgSend(v2, "ABPerson");

  return v3;
}

- (ABRecordRef)billingAddress
{
  void *v2;
  const void *v3;

  -[PKContact cnMutableContact](self->_billingContact, "cnMutableContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const void *)objc_msgSend(v2, "ABPerson");

  return v3;
}

- (PKPayment)initWithCoder:(id)a3
{
  id v4;
  PKPayment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayment;
  v5 = -[PKPayment init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setToken:](v5, "setToken:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingContact"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setShippingContact:](v5, "setShippingContact:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingContact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setBillingContact:](v5, "setBillingContact:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingMethod"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setShippingMethod:](v5, "setShippingMethod:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credential"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setCredential:](v5, "setCredential:", v10);

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("authKitAuthenticationResults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PKPayment setAuthKitAuthenticationResults:](v5, "setAuthKitAuthenticationResults:", v12);

    -[PKPayment setBiometricAuthorizationAttempts:](v5, "setBiometricAuthorizationAttempts:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("biometryAttempts")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAuthorizationToken"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayment setInstallmentAuthorizationToken:](v5, "setInstallmentAuthorizationToken:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PKPayment token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("token"));

  -[PKPayment shippingContact](self, "shippingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("shippingContact"));

  -[PKPayment billingContact](self, "billingContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("billingContact"));

  -[PKPayment shippingMethod](self, "shippingMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("shippingMethod"));

  -[PKPayment credential](self, "credential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("credential"));

  -[PKPayment authKitAuthenticationResults](self, "authKitAuthenticationResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("authKitAuthenticationResults"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKPayment biometricAuthorizationAttempts](self, "biometricAuthorizationAttempts"), CFSTR("biometryAttempts"));
  -[PKPayment installmentAuthorizationToken](self, "installmentAuthorizationToken");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("installmentAuthorizationToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_token)
    objc_msgSend(v3, "appendFormat:", CFSTR("token: %@"), self->_token);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  PKContact *shippingContact;
  void *v5;
  PKContact *billingContact;
  void *v7;
  PKShippingMethod *shippingMethod;
  void *v9;
  PKPaymentToken *token;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  shippingContact = self->_shippingContact;
  if (shippingContact)
  {
    -[PKContact dictionaryRepresentation](shippingContact, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("shippingContact"));

  }
  billingContact = self->_billingContact;
  if (billingContact)
  {
    -[PKContact dictionaryRepresentation](billingContact, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("billingContact"));

  }
  shippingMethod = self->_shippingMethod;
  if (shippingMethod)
  {
    -[PKShippingMethod dictionaryRepresentation](shippingMethod, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("shippingMethod"));

  }
  token = self->_token;
  if (token)
  {
    -[PKPaymentToken dictionaryRepresentation](token, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("paymentToken"));

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (PKPaymentToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (PKContact)billingContact
{
  return self->_billingContact;
}

- (void)setBillingContact:(id)a3
{
  objc_storeStrong((id *)&self->_billingContact, a3);
}

- (PKContact)shippingContact
{
  return self->_shippingContact;
}

- (void)setShippingContact:(id)a3
{
  objc_storeStrong((id *)&self->_shippingContact, a3);
}

- (PKShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (void)setShippingMethod:(id)a3
{
  objc_storeStrong((id *)&self->_shippingMethod, a3);
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (NSMutableDictionary)authKitAuthenticationResults
{
  return self->_authKitAuthenticationResults;
}

- (void)setAuthKitAuthenticationResults:(id)a3
{
  objc_storeStrong((id *)&self->_authKitAuthenticationResults, a3);
}

- (int64_t)biometricAuthorizationAttempts
{
  return self->_biometricAuthorizationAttempts;
}

- (void)setBiometricAuthorizationAttempts:(int64_t)a3
{
  self->_biometricAuthorizationAttempts = a3;
}

- (NSString)installmentAuthorizationToken
{
  return self->_installmentAuthorizationToken;
}

- (void)setInstallmentAuthorizationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_authKitAuthenticationResults, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
