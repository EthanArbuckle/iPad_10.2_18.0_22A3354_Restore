@implementation _REAppKey

- (_REAppKey)initWithIdentifier:(id)a3 remote:(BOOL)a4
{
  id v6;
  _REAppKey *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REAppKey;
  v7 = -[_REAppKey init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_remote = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash") ^ self->_remote;
}

- (BOOL)isEqual:(id)a3
{
  _REAppKey *v4;
  _REAppKey *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;

  v4 = (_REAppKey *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v11 = self->_remote == v5->_remote;
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:remote:", self->_identifier, self->_remote);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)remote
{
  return self->_remote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
