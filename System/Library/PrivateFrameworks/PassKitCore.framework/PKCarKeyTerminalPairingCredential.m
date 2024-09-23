@implementation PKCarKeyTerminalPairingCredential

- (PKCarKeyTerminalPairingCredential)initWithConfiguration:(id)a3 productIdentifier:(id)a4
{
  id v7;
  id v8;
  PKCarKeyTerminalPairingCredential *v9;
  PKCarKeyTerminalPairingCredential *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPaymentCredential init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_productIdentifier, a4);
    -[PKPaymentCredential setDeletable:](v10, "setDeletable:", 1);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("carKey")))
      -[PKPaymentCredential setCredentialType:](v10, "setCredentialType:", 301);
    objc_msgSend(v7, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setLongDescription:](v10, "setLongDescription:", v11);

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("configuration: '%@'; "), self->_configuration);
  objc_msgSend(v3, "appendFormat:", CFSTR("productIdentifier: '%@'; "), self->_productIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKCarKeyTerminalPairingCredential *v4;
  BOOL v5;

  v4 = (PKCarKeyTerminalPairingCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKCarKeyTerminalPairingCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  PKAddCarKeyPassConfiguration *configuration;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char v10;

  if (!a3)
    return 0;
  configuration = self->_configuration;
  v4 = a3;
  -[PKAddCarKeyPassConfiguration pairedReaderIdentifier](configuration, "pairedReaderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[13];

  objc_msgSend(v6, "pairedReaderIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = v5 == (void *)v7;
  else
    v10 = objc_msgSend(v5, "isEqual:", v7);

  return v10;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
