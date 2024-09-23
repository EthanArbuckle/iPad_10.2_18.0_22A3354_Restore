@implementation SKPresenceOptions

- (SKPresenceOptions)initWithServiceIdentifier:(id)a3
{
  id v5;
  SKPresenceOptions *v6;
  SKPresenceOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPresenceOptions;
  v6 = -[SKPresenceOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceIdentifier;
  id v5;

  serviceIdentifier = self->_serviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceIdentifier, CFSTR("SKPresenceOptionsEncodingKeyServiceIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPersonal, CFSTR("SKPresenceOptionsEncodingKeyIsPersonal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientSpecifiedURI, CFSTR("SKPresenceOptionsEncodingKeyClientSpecifiedURI"));

}

- (SKPresenceOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKPresenceOptions *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SKPresenceOptionsEncodingKeyServiceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKPresenceOptions initWithServiceIdentifier:](self, "initWithServiceIdentifier:", v5);
  -[SKPresenceOptions setIsPersonal:](v6, "setIsPersonal:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SKPresenceOptionsEncodingKeyIsPersonal")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SKPresenceOptionsEncodingKeyClientSpecifiedURI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKPresenceOptions setClientSpecifiedURI:](v6, "setClientSpecifiedURI:", v7);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SKPresenceOptions serviceIdentifier](self, "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "serviceIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SKPresenceOptions serviceIdentifier](self, "serviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_10;
      }
      else
      {

        if ((v10 & 1) == 0)
        {
LABEL_10:
          v11 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    v12 = -[SKPresenceOptions isPersonal](self, "isPersonal");
    if (v12 != objc_msgSend(v6, "isPersonal"))
      goto LABEL_10;
    -[SKPresenceOptions clientSpecifiedURI](self, "clientSpecifiedURI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend(v6, "clientSpecifiedURI"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SKPresenceOptions clientSpecifiedURI](self, "clientSpecifiedURI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientSpecifiedURI");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "isEqualToURI:", v15);

      if (v13)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_17;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[SKPresenceOptions serviceIdentifier](self, "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[SKPresenceOptions isPersonal](self, "isPersonal");

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKPresenceOptions serviceIdentifier](self, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKPresenceOptions isPersonal](self, "isPersonal");
  -[SKPresenceOptions clientSpecifiedURI](self, "clientSpecifiedURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; serviceIdentifier = %@ isPersonal = %d clientSpecifiedURI = %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isPersonal
{
  return self->_isPersonal;
}

- (void)setIsPersonal:(BOOL)a3
{
  self->_isPersonal = a3;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (IDSURI)clientSpecifiedURI
{
  return self->_clientSpecifiedURI;
}

- (void)setClientSpecifiedURI:(id)a3
{
  objc_storeStrong((id *)&self->_clientSpecifiedURI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSpecifiedURI, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
