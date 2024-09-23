@implementation PKJapanIndividualNumberCardMetadata

- (PKJapanIndividualNumberCardMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardTemplateIdentifier:(id)a5 preview:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  return -[PKIdentityDocumentMetadata initWithProvisioningCredentialIdentifier:sharingInstanceIdentifier:cardConfigurationIdentifier:cardTemplateIdentifier:requiresSimultaneousRequestRouting:preview:](&v7, sel_initWithProvisioningCredentialIdentifier_sharingInstanceIdentifier_cardConfigurationIdentifier_cardTemplateIdentifier_requiresSimultaneousRequestRouting_preview_, a3, a4, 0, a5, 1, a6);
}

- (PKJapanIndividualNumberCardMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardConfigurationIdentifier:(id)a5 preview:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  return -[PKIdentityDocumentMetadata initWithProvisioningCredentialIdentifier:sharingInstanceIdentifier:cardConfigurationIdentifier:cardTemplateIdentifier:requiresSimultaneousRequestRouting:preview:](&v7, sel_initWithProvisioningCredentialIdentifier_sharingInstanceIdentifier_cardConfigurationIdentifier_cardTemplateIdentifier_requiresSimultaneousRequestRouting_preview_, a3, a4, a5, 0, 1, a6);
}

- (void)setAuthenticationPassword:(id)a3
{
  NSString *v4;
  NSString *authenticationPassword;

  objc_msgSend(a3, "pk_zString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  authenticationPassword = self->_authenticationPassword;
  self->_authenticationPassword = v4;

}

- (void)setSigningPassword:(id)a3
{
  NSString *v4;
  NSString *signingPassword;

  objc_msgSend(a3, "pk_zString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  signingPassword = self->_signingPassword;
  self->_signingPassword = v4;

}

- (id)supportDataRepresentation
{
  return -[PKProvisioningJPKISupportData initWithPIN:password:type:sid:]([PKProvisioningJPKISupportData alloc], "initWithPIN:password:type:sid:", self->_authenticationPassword, self->_signingPassword, 0, 0);
}

- (void)_extendableDescription:(id)a3
{
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  v4 = a3;
  -[PKIdentityDocumentMetadata _extendableDescription:](&v7, sel__extendableDescription_, v4);
  if (-[NSString length](self->_authenticationPassword, "length"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("authenticationPassword is non-empty: '%@'; "), v5);
  if (-[NSString length](self->_signingPassword, "length"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("signingPassword is non-empty: '%@'; "), v6);

}

- (PKJapanIndividualNumberCardMetadata)initWithCoder:(id)a3
{
  id v4;
  PKJapanIndividualNumberCardMetadata *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  v5 = -[PKIdentityDocumentMetadata initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authentication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKJapanIndividualNumberCardMetadata setAuthenticationPassword:](v5, "setAuthenticationPassword:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKJapanIndividualNumberCardMetadata setSigningPassword:](v5, "setSigningPassword:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  v4 = a3;
  -[PKIdentityDocumentMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationPassword, CFSTR("authentication"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_signingPassword, CFSTR("signing"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  v4 = -[PKIdentityDocumentMetadata copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_authenticationPassword, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSString copy](self->_signingPassword, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (NSString)authenticationPassword
{
  return self->_authenticationPassword;
}

- (NSString)signingPassword
{
  return self->_signingPassword;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_signingPassword, 0);
  objc_storeStrong((id *)&self->_authenticationPassword, 0);
}

@end
