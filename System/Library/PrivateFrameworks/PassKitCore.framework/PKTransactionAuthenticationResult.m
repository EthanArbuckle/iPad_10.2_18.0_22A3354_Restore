@implementation PKTransactionAuthenticationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *encryptedPIN;
  id v5;

  encryptedPIN = self->_encryptedPIN;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encryptedPIN, CFSTR("encryptedPIN"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userConfirmation, CFSTR("userConfirmation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDetailsSignature, CFSTR("transactionDetailsSignature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authenticationContext, CFSTR("authenticationContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionServiceIdentifier, CFSTR("transactionServiceIdentifier"));

}

- (PKTransactionAuthenticationResult)initWithCoder:(id)a3
{
  id v4;
  PKTransactionAuthenticationResult *v5;
  uint64_t v6;
  NSData *encryptedPIN;
  uint64_t v8;
  NSData *userConfirmation;
  uint64_t v10;
  NSData *transactionDetailsSignature;
  uint64_t v12;
  PKTransactionAuthenticationContext *authenticationContext;
  uint64_t v14;
  NSString *transactionServiceIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKTransactionAuthenticationResult;
  v5 = -[PKTransactionAuthenticationResult init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedPIN"));
    v6 = objc_claimAutoreleasedReturnValue();
    encryptedPIN = v5->_encryptedPIN;
    v5->_encryptedPIN = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userConfirmation"));
    v8 = objc_claimAutoreleasedReturnValue();
    userConfirmation = v5->_userConfirmation;
    v5->_userConfirmation = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDetailsSignature"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionDetailsSignature = v5->_transactionDetailsSignature;
    v5->_transactionDetailsSignature = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKTransactionAuthenticationContext *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionServiceIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionServiceIdentifier = v5->_transactionServiceIdentifier;
    v5->_transactionServiceIdentifier = (NSString *)v14;

  }
  return v5;
}

- (BOOL)hasDataForAllRequestedAuthenticationMechanisms
{
  int v3;

  v3 = -[PKTransactionAuthenticationContext requestedAuthenticationMechanisms](self->_authenticationContext, "requestedAuthenticationMechanisms");
  return (v3 & ~-[PKTransactionAuthenticationContext dataCollectedAuthenticationMechanisms](self->_authenticationContext, "dataCollectedAuthenticationMechanisms") & 7) == 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PKTransactionAuthenticationResult, PIN: <%tu bytes>, user confirmation: <%tu bytes>, transaction signature: <%tu bytes>"), -[NSData length](self->_encryptedPIN, "length"), -[NSData length](self->_userConfirmation, "length"), -[NSData length](self->_transactionDetailsSignature, "length"));
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_encryptedPIN);
  objc_msgSend(v3, "safelyAddObject:", self->_userConfirmation);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDetailsSignature);
  objc_msgSend(v3, "safelyAddObject:", self->_authenticationContext);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionServiceIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionAuthenticationResult *v4;
  PKTransactionAuthenticationResult *v5;
  BOOL v6;

  v4 = (PKTransactionAuthenticationResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionAuthenticationResult isEqualToTransactionAuthenticationResult:](self, "isEqualToTransactionAuthenticationResult:", v5);

  return v6;
}

- (BOOL)isEqualToTransactionAuthenticationResult:(id)a3
{
  _QWORD *v4;
  NSData *encryptedPIN;
  NSData *v6;
  BOOL v7;
  NSData *userConfirmation;
  NSData *v9;
  NSData *transactionDetailsSignature;
  NSData *v11;
  PKTransactionAuthenticationContext *authenticationContext;
  PKTransactionAuthenticationContext *v13;
  NSString *transactionServiceIdentifier;
  NSString *v15;
  char v16;

  v4 = a3;
  encryptedPIN = self->_encryptedPIN;
  v6 = (NSData *)v4[2];
  if (encryptedPIN)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (encryptedPIN != v6)
      goto LABEL_26;
  }
  else if ((-[NSData isEqual:](encryptedPIN, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  userConfirmation = self->_userConfirmation;
  v9 = (NSData *)v4[4];
  if (userConfirmation && v9)
  {
    if ((-[NSData isEqual:](userConfirmation, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (userConfirmation != v9)
  {
    goto LABEL_26;
  }
  transactionDetailsSignature = self->_transactionDetailsSignature;
  v11 = (NSData *)v4[3];
  if (transactionDetailsSignature && v11)
  {
    if ((-[NSData isEqual:](transactionDetailsSignature, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (transactionDetailsSignature != v11)
  {
    goto LABEL_26;
  }
  authenticationContext = self->_authenticationContext;
  v13 = (PKTransactionAuthenticationContext *)v4[1];
  if (!authenticationContext || !v13)
  {
    if (authenticationContext == v13)
      goto LABEL_22;
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  if (!-[PKTransactionAuthenticationContext isEqual:](authenticationContext, "isEqual:"))
    goto LABEL_26;
LABEL_22:
  transactionServiceIdentifier = self->_transactionServiceIdentifier;
  v15 = (NSString *)v4[5];
  if (transactionServiceIdentifier && v15)
    v16 = -[NSString isEqual:](transactionServiceIdentifier, "isEqual:");
  else
    v16 = transactionServiceIdentifier == v15;
LABEL_27:

  return v16;
}

- (PKTransactionAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (NSData)encryptedPIN
{
  return self->_encryptedPIN;
}

- (void)setEncryptedPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)transactionDetailsSignature
{
  return self->_transactionDetailsSignature;
}

- (void)setTransactionDetailsSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)userConfirmation
{
  return self->_userConfirmation;
}

- (void)setUserConfirmation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (void)setTransactionServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_userConfirmation, 0);
  objc_storeStrong((id *)&self->_transactionDetailsSignature, 0);
  objc_storeStrong((id *)&self->_encryptedPIN, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
