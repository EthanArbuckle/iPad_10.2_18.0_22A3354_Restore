@implementation STSCredentialRequest

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));

}

- (STSCredentialRequest)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *credentialIdentifier;

  v4 = a3;
  self->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  credentialIdentifier = self->_credentialIdentifier;
  self->_credentialIdentifier = v5;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
