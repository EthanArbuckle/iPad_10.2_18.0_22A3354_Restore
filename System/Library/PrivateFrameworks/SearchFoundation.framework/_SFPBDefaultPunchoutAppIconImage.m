@implementation _SFPBDefaultPunchoutAppIconImage

- (_SFPBDefaultPunchoutAppIconImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBDefaultPunchoutAppIconImage *v5;
  void *v6;
  _SFPBPunchout *v7;
  void *v8;
  _SFPBPunchout *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBDefaultPunchoutAppIconImage *v14;

  v4 = a3;
  v5 = -[_SFPBDefaultPunchoutAppIconImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "punchout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBPunchout initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBDefaultPunchoutAppIconImage setPunchout:](v5, "setPunchout:", v9);

    }
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDefaultPunchoutAppIconImage setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v11);

    }
    objc_msgSend(v4, "fileProviderIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "fileProviderIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDefaultPunchoutAppIconImage setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  NSString *v4;
  NSString *coreSpotlightIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  coreSpotlightIdentifier = self->_coreSpotlightIdentifier;
  self->_coreSpotlightIdentifier = v4;

}

- (void)setFileProviderIdentifier:(id)a3
{
  NSString *v4;
  NSString *fileProviderIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fileProviderIdentifier = self->_fileProviderIdentifier;
  self->_fileProviderIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDefaultPunchoutAppIconImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBDefaultPunchoutAppIconImage punchout](self, "punchout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBDefaultPunchoutAppIconImage coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBDefaultPunchoutAppIconImage fileProviderIdentifier](self, "fileProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBDefaultPunchoutAppIconImage punchout](self, "punchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBDefaultPunchoutAppIconImage punchout](self, "punchout");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBDefaultPunchoutAppIconImage punchout](self, "punchout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBDefaultPunchoutAppIconImage coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBDefaultPunchoutAppIconImage coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBDefaultPunchoutAppIconImage coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBDefaultPunchoutAppIconImage fileProviderIdentifier](self, "fileProviderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBDefaultPunchoutAppIconImage fileProviderIdentifier](self, "fileProviderIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBDefaultPunchoutAppIconImage fileProviderIdentifier](self, "fileProviderIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileProviderIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[_SFPBPunchout hash](self->_punchout, "hash");
  v4 = -[NSString hash](self->_coreSpotlightIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_fileProviderIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_coreSpotlightIdentifier)
  {
    -[_SFPBDefaultPunchoutAppIconImage coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coreSpotlightIdentifier"));

  }
  if (self->_fileProviderIdentifier)
  {
    -[_SFPBDefaultPunchoutAppIconImage fileProviderIdentifier](self, "fileProviderIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fileProviderIdentifier"));

  }
  if (self->_punchout)
  {
    -[_SFPBDefaultPunchoutAppIconImage punchout](self, "punchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("punchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("punchout"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDefaultPunchoutAppIconImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDefaultPunchoutAppIconImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDefaultPunchoutAppIconImage *v5;
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
    self = -[_SFPBDefaultPunchoutAppIconImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDefaultPunchoutAppIconImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDefaultPunchoutAppIconImage *v5;
  void *v6;
  _SFPBPunchout *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBDefaultPunchoutAppIconImage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBDefaultPunchoutAppIconImage;
  v5 = -[_SFPBDefaultPunchoutAppIconImage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v6);
      -[_SFPBDefaultPunchoutAppIconImage setPunchout:](v5, "setPunchout:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpotlightIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBDefaultPunchoutAppIconImage setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileProviderIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBDefaultPunchoutAppIconImage setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (_SFPBPunchout)punchout
{
  return self->_punchout;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
}

@end
