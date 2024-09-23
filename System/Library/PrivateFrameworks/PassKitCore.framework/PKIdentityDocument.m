@implementation PKIdentityDocument

- (PKIdentityDocument)initWithDIIdentityDocument:(id)a3
{
  id v5;
  PKIdentityDocument *v6;
  PKIdentityDocument *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityDocument;
  v6 = -[PKIdentityDocument init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrapped, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKIdentityDocument encryptedData](self, "encryptedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptedData: %@ "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSData)encryptedData
{
  return (NSData *)-[DIIdentityDocument encryptedData](self->_wrapped, "encryptedData");
}

- (DIIdentityDocument)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
  objc_storeStrong((id *)&self->_wrapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
