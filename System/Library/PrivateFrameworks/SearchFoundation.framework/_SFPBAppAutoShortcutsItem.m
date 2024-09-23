@implementation _SFPBAppAutoShortcutsItem

- (_SFPBAppAutoShortcutsItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBAppAutoShortcutsItem *v5;
  void *v6;
  void *v7;
  _SFPBAppAutoShortcutsItem *v8;

  v4 = a3;
  v5 = -[_SFPBAppAutoShortcutsItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAppAutoShortcutsItem setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppAutoShortcutsItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleIdentifier)
  {
    -[_SFPBAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAppAutoShortcutsItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBAppAutoShortcutsItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAppAutoShortcutsItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBAppAutoShortcutsItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAppAutoShortcutsItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAppAutoShortcutsItem *v5;
  void *v6;
  void *v7;
  _SFPBAppAutoShortcutsItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBAppAutoShortcutsItem;
  v5 = -[_SFPBAppAutoShortcutsItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBAppAutoShortcutsItem setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
