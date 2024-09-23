@implementation STSAuxiliaryCredential

- (STSAuxiliaryCredential)initWithType:(int64_t)a3
{
  STSAuxiliaryCredential *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSAuxiliaryCredential;
  result = -[STSAuxiliaryCredential init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (STSAuxiliaryCredential)initWithCoder:(id)a3
{
  id v4;
  STSAuxiliaryCredential *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STSAuxiliaryCredential;
  v5 = -[STSAuxiliaryCredential init](&v7, sel_init);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("STSAuxiliaryCredentialKeyType"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("STSAuxiliaryCredentialKeyType"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

@end
