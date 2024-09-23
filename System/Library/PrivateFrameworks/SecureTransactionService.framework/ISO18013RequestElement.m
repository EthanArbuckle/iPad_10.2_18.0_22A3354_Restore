@implementation ISO18013RequestElement

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_retentionIntent, CFSTR("retentionIntent"));

}

- (ISO18013RequestElement)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  unsigned __int16 v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retentionIntent"));
  self->_retentionIntent = v7;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
