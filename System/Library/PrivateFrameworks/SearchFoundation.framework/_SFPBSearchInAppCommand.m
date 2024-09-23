@implementation _SFPBSearchInAppCommand

- (_SFPBSearchInAppCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBSearchInAppCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBSearchInAppCommand *v10;

  v4 = a3;
  v5 = -[_SFPBSearchInAppCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchInAppCommand setSearchString:](v5, "setSearchString:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchInAppCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    if (objc_msgSend(v4, "hasSearchInAppType"))
      -[_SFPBSearchInAppCommand setSearchInAppType:](v5, "setSearchInAppType:", objc_msgSend(v4, "searchInAppType"));
    v10 = v5;
  }

  return v5;
}

- (void)setSearchString:(id)a3
{
  NSString *v4;
  NSString *searchString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  searchString = self->_searchString;
  self->_searchString = v4;

}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (void)setSearchInAppType:(int)a3
{
  self->_searchInAppType = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSearchInAppCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBSearchInAppCommand searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  v6 = -[_SFPBSearchInAppCommand searchInAppType](self, "searchInAppType");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int searchInAppType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBSearchInAppCommand searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBSearchInAppCommand searchString](self, "searchString");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSearchInAppCommand searchString](self, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      searchInAppType = self->_searchInAppType;
      v17 = searchInAppType == objc_msgSend(v4, "searchInAppType");
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_searchString, "hash");
  return -[NSString hash](self->_applicationBundleIdentifier, "hash") ^ v3 ^ (2654435761 * self->_searchInAppType);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationBundleIdentifier)
  {
    -[_SFPBSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_searchInAppType)
  {
    v6 = -[_SFPBSearchInAppCommand searchInAppType](self, "searchInAppType");
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 1)
      {
        v7 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("searchInAppType"));

  }
  if (self->_searchString)
  {
    -[_SFPBSearchInAppCommand searchString](self, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("searchString"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSearchInAppCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSearchInAppCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSearchInAppCommand *v5;
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
    self = -[_SFPBSearchInAppCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSearchInAppCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSearchInAppCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBSearchInAppCommand *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBSearchInAppCommand;
  v5 = -[_SFPBSearchInAppCommand init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBSearchInAppCommand setSearchString:](v5, "setSearchString:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBSearchInAppCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchInAppType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSearchInAppCommand setSearchInAppType:](v5, "setSearchInAppType:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (int)searchInAppType
{
  return self->_searchInAppType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
