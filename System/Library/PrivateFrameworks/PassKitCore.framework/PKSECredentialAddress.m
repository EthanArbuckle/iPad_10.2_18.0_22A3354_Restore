@implementation PKSECredentialAddress

- (PKSECredentialAddress)init
{

  return 0;
}

- (PKSECredentialAddress)initWithType:(unint64_t)a3 identifier:(id)a4
{
  id v7;
  PKSECredentialAddress *v8;
  PKSECredentialAddress *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKSECredentialAddress;
  v8 = -[PKSECredentialAddress init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_identifier, a4);
  }

  return v9;
}

- (id)addressByAppendingType:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  PKSECredentialAddress *v8;
  _QWORD *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)-[PKSECredentialAddress copy](self, "copy");
  v8 = -[PKSECredentialAddress initWithType:identifier:]([PKSECredentialAddress alloc], "initWithType:identifier:", a3, v6);

  -[PKSECredentialAddress _tail](v7);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9[1];
  v9[1] = v8;

  return v7;
}

- (_QWORD)_tail
{
  id v1;
  void *v2;
  void *v3;
  _QWORD *v4;

  if (a1)
  {
    v1 = a1;
    v2 = v1;
    v3 = (void *)*((_QWORD *)v1 + 1);
    if (v3)
    {
      do
      {
        v4 = v3;

        v3 = (void *)v4[1];
        v2 = v4;
      }
      while (v3);
    }
    else
    {
      v4 = v1;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)appendType:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  PKSECredentialAddress *v7;
  void *v8;
  _QWORD *v9;

  v6 = a4;
  v7 = -[PKSECredentialAddress initWithType:identifier:]([PKSECredentialAddress alloc], "initWithType:identifier:", a3, v6);

  -[PKSECredentialAddress _tail](self);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v9[1];
  v9[1] = v7;

}

- (id)firstIdentifierOfType:(unint64_t)a3
{
  PKSECredentialAddress *v4;
  PKSECredentialAddress *v5;
  PKSECredentialAddress *v6;
  NSString *v7;

  v4 = self;
  if (v4)
  {
    v5 = v4;
    while (v5->_type != a3)
    {
      v6 = v5->_next;

      v5 = v6;
      if (!v6)
        goto LABEL_5;
    }
    v7 = v5->_identifier;

  }
  else
  {
LABEL_5:
    v7 = 0;
  }
  return v7;
}

- (NSString)appletIdentifier
{
  return (NSString *)-[PKSECredentialAddress firstIdentifierOfType:](self, "firstIdentifierOfType:", 0);
}

- (NSString)subcredentialIdentifier
{
  return (NSString *)-[PKSECredentialAddress firstIdentifierOfType:](self, "firstIdentifierOfType:", 1);
}

- (NSString)mostSpecificIdentifier
{
  id *v2;
  NSString *v3;

  -[PKSECredentialAddress _tail](self);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (NSString *)v2[2];

  return v3;
}

- (unint64_t)mostSpecificType
{
  _QWORD *v2;
  unint64_t v3;

  -[PKSECredentialAddress _tail](self);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSECredentialAddress shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("address: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)shortDescription
{
  unint64_t type;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  NSString *identifier;
  void *v8;
  void *v9;

  type = self->_type;
  v4 = CFSTR("Subcredential");
  if (type != 1)
    v4 = 0;
  if (type)
    v5 = v4;
  else
    v5 = CFSTR("Applet");
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  identifier = self->_identifier;
  -[PKSECredentialAddress shortDescription](self->_next, "shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("(%@: %@) -> %@"), v5, identifier, v8);

  return v9;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  PKSECredentialAddress *next;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  next = self->_next;
  if (next)
    v5 = -[PKSECredentialAddress hash](next, "hash") - v5 + 32 * v5;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  BOOL v11;
  PKSECredentialAddress *next;
  PKSECredentialAddress *v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)v5[2];
      v7 = self->_identifier;
      v8 = v6;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (!v7 || !v8)
        {

          goto LABEL_15;
        }
        v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        if (!v10)
          goto LABEL_15;
      }
      if (self->_type == v5[3])
      {
        next = self->_next;
        v13 = (PKSECredentialAddress *)v5[1];
        if (next && v13)
          v11 = -[PKSECredentialAddress isEqual:](next, "isEqual:");
        else
          v11 = next == v13;
        goto LABEL_16;
      }
LABEL_15:
      v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSECredentialAddress *v5;
  uint64_t v6;
  NSString *identifier;
  PKSECredentialAddress *v8;
  PKSECredentialAddress *next;

  v5 = +[PKSECredentialAddress allocWithZone:](PKSECredentialAddress, "allocWithZone:");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_type = self->_type;
  v8 = -[PKSECredentialAddress copyWithZone:](self->_next, "copyWithZone:", a3);
  next = v5->_next;
  v5->_next = v8;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

@end
