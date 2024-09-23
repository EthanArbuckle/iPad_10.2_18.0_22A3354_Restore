@implementation PKAppletSubcredentialSharingInvitationMetadata

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  if (self->_shouldRequestInvitation)
    v5 = "yes";
  else
    v5 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("< %@; %p; anonymization salt: %@; request invitation: %s >"),
               v4,
               self,
               self->_anonymizationSalt,
               v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *anonymizationSalt;
  id v5;

  anonymizationSalt = self->_anonymizationSalt;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", anonymizationSalt, CFSTR("anonymizationSalt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRequestInvitation, CFSTR("shouldRequestInvitation"));

}

- (PKAppletSubcredentialSharingInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredentialSharingInvitationMetadata *v5;
  uint64_t v6;
  NSString *anonymizationSalt;

  v4 = a3;
  v5 = -[PKAppletSubcredentialSharingInvitationMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anonymizationSalt"));
    v6 = objc_claimAutoreleasedReturnValue();
    anonymizationSalt = v5->_anonymizationSalt;
    v5->_anonymizationSalt = (NSString *)v6;

    v5->_shouldRequestInvitation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRequestInvitation"));
  }

  return v5;
}

- (NSString)anonymizationSalt
{
  return self->_anonymizationSalt;
}

- (void)setAnonymizationSalt:(id)a3
{
  objc_storeStrong((id *)&self->_anonymizationSalt, a3);
}

- (BOOL)shouldRequestInvitation
{
  return self->_shouldRequestInvitation;
}

- (void)setShouldRequestInvitation:(BOOL)a3
{
  self->_shouldRequestInvitation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizationSalt, 0);
}

@end
