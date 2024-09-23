@implementation PKSearchPassResult

- (unint64_t)tokenType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
}

- (PKSearchPassResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchPassResult *v5;
  uint64_t v6;
  NSString *passUniqueIdentifier;

  v4 = a3;
  v5 = -[PKSearchPassResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchPassResult;
  -[PKSearchPassResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("passUniqueIdentifier: '%@'; "), self->_passUniqueIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *passUniqueIdentifier;
  NSString *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    passUniqueIdentifier = self->_passUniqueIdentifier;
    v6 = (NSString *)v4[1];
    if (passUniqueIdentifier && v6)
      v7 = -[NSString isEqual:](passUniqueIdentifier, "isEqual:");
    else
      v7 = passUniqueIdentifier == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_passUniqueIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
