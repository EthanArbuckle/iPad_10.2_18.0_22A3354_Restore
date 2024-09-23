@implementation PRTrustedContact

- (PRTrustedContact)init
{
  -[PRTrustedContact doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRTrustedContact)initWithContactKey:(id)a3
{
  id v6;
  PRTrustedContact *v7;
  PRTrustedContact *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRTrustedContact.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactKey"));

  }
  if (objc_msgSend(v6, "length") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRTrustedContact.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[contactKey length] == 6"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PRTrustedContact;
  v7 = -[PRTrustedContact init](&v12, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_contactKey, a3);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRTrustedContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PRTrustedContact *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContactKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PRTrustedContact initWithContactKey:](self, "initWithContactKey:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_contactKey, CFSTR("ContactKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRTrustedContact initWithContactKey:]([PRTrustedContact alloc], "initWithContactKey:", self->_contactKey);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("contact key: %@"), self->_contactKey);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *contactKey;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    contactKey = self->_contactKey;
    objc_msgSend(v4, "contactKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSData isEqualToData:](contactKey, "isEqualToData:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSData)contactKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactKey, 0);
}

@end
