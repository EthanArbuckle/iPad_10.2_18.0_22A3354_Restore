@implementation RCChangeTag

- (RCChangeTag)initWithIdentifier:(id)a3 contentHash:(id)a4 lastModifiedString:(id)a5
{
  id v9;
  id v10;
  id v11;
  RCChangeTag *v12;
  RCChangeTag *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCChangeTag;
  v12 = -[RCChangeTag init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_contentHash, a4);
    objc_storeStrong((id *)&v13->_lastModifiedString, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[RCChangeTag identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[RCChangeTag contentHash](self, "contentHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[RCChangeTag lastModifiedString](self, "lastModifiedString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastModifiedString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[RCChangeTag identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RCChangeTag contentHash](self, "contentHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RCChangeTag lastModifiedString](self, "lastModifiedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCChangeTag identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCChangeTag contentHash](self, "contentHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCChangeTag lastModifiedString](self, "lastModifiedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@\n contentHash: %@\n lastModified: %@"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCChangeTag identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("id"));

  -[RCChangeTag contentHash](self, "contentHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("changeTag"));

  -[RCChangeTag lastModifiedString](self, "lastModifiedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lastModified"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RCChangeTag identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[RCChangeTag contentHash](self, "contentHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("changeTag"));

  -[RCChangeTag lastModifiedString](self, "lastModifiedString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lastModified"));

}

- (RCChangeTag)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RCChangeTag *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeTag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModified"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RCChangeTag initWithIdentifier:contentHash:lastModifiedString:](self, "initWithIdentifier:contentHash:lastModifiedString:", v5, v6, v7);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contentHash
{
  return self->_contentHash;
}

- (NSString)lastModifiedString
{
  return self->_lastModifiedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedString, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
