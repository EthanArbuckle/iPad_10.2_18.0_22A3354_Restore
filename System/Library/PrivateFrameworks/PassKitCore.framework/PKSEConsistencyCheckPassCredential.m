@implementation PKSEConsistencyCheckPassCredential

- (PKSEConsistencyCheckPassCredential)init
{

  return 0;
}

- (PKSEConsistencyCheckPassCredential)initWithPassCredential:(id)a3 address:(id)a4 paymentMethod:(unint64_t)a5
{
  id v9;
  id v10;
  PKSEConsistencyCheckPassCredential *v11;
  id v12;
  void *v13;
  PKSEConsistencyCheckPassCredential *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKSEConsistencyCheckPassCredential;
  v11 = -[PKSEConsistencyCheckPassCredential init](&v16, sel_init);
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11->_type = 0;
      v12 = v9;
      v11->_state = objc_msgSend(v12, "state");
      objc_msgSend(v12, "subcredentials");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11->_containsSubkeys = objc_msgSend(v13, "count") != 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
        goto LABEL_8;
      }
      v11->_type = 1;
      v11->_state = objc_msgSend(v9, "state");
    }
    objc_storeStrong(&v11->_underlyingpassCredential, a3);
    objc_storeStrong((id *)&v11->_address, a4);
    v11->_paymentMethod = a5;
  }
  v14 = v11;
LABEL_8:

  return v14;
}

- (PKPaymentApplication)paymentApplication
{
  if (self->_type)
    return (PKPaymentApplication *)0;
  else
    return (PKPaymentApplication *)self->_underlyingpassCredential;
}

- (PKAppletSubcredential)subcredential
{
  if (self->_type == 1)
    return (PKAppletSubcredential *)self->_underlyingpassCredential;
  else
    return (PKAppletSubcredential *)0;
}

- (id)description
{
  unint64_t type;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSDictionary *keyMaterialHashForDeviceCredentialType;
  id v10;
  _QWORD v12[4];
  id v13;

  type = self->_type;
  v4 = CFSTR("AppletSubcredential");
  if (type != 1)
    v4 = 0;
  if (type)
    v5 = v4;
  else
    v5 = CFSTR("PaymentApplication");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%@'; "), v5);
  objc_msgSend(v6, "appendFormat:", CFSTR("state: '%lu'; "), self->_state);
  -[PKSECredentialAddress shortDescription](self->_address, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("address: '%@'; "), v7);

  if (self->_containsSubkeys)
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  objc_msgSend(v6, "appendFormat:", CFSTR("containsSubkeys: '%@'; "), v8);
  if (self->_keyMaterialHashForDeviceCredentialType)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("keyMaterialHashes: {"));
    keyMaterialHashForDeviceCredentialType = self->_keyMaterialHashForDeviceCredentialType;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PKSEConsistencyCheckPassCredential_description__block_invoke;
    v12[3] = &unk_1E2AD3228;
    v10 = v6;
    v13 = v10;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](keyMaterialHashForDeviceCredentialType, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(v10, "appendFormat:", CFSTR("}; "));

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  return v6;
}

void __49__PKSEConsistencyCheckPassCredential_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@, "), v5, v6);

}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (PKSECredentialAddress)address
{
  return self->_address;
}

- (unint64_t)paymentMethod
{
  return self->_paymentMethod;
}

- (BOOL)containsSubkeys
{
  return self->_containsSubkeys;
}

- (NSDictionary)keyMaterialHashForDeviceCredentialType
{
  return self->_keyMaterialHashForDeviceCredentialType;
}

- (void)setKeyMaterialHashForDeviceCredentialType:(id)a3
{
  objc_storeStrong((id *)&self->_keyMaterialHashForDeviceCredentialType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMaterialHashForDeviceCredentialType, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong(&self->_underlyingpassCredential, 0);
}

@end
