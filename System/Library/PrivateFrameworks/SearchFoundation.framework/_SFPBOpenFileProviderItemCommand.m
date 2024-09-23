@implementation _SFPBOpenFileProviderItemCommand

- (_SFPBOpenFileProviderItemCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBOpenFileProviderItemCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBOpenFileProviderItemCommand *v10;

  v4 = a3;
  v5 = -[_SFPBOpenFileProviderItemCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBOpenFileProviderItemCommand setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v7);

    }
    objc_msgSend(v4, "fileProviderIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "fileProviderIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBOpenFileProviderItemCommand setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v9);

    }
    if (objc_msgSend(v4, "hasShouldRevealFile"))
      -[_SFPBOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", objc_msgSend(v4, "shouldRevealFile"));
    v10 = v5;
  }

  return v5;
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

- (void)setShouldRevealFile:(BOOL)a3
{
  self->_shouldRevealFile = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBOpenFileProviderItemCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile"))
    PBDataWriterWriteBOOLField();

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
  int shouldRevealFile;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      shouldRevealFile = self->_shouldRevealFile;
      v17 = shouldRevealFile == objc_msgSend(v4, "shouldRevealFile");
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileProviderIdentifier");
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
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_coreSpotlightIdentifier, "hash");
  v4 = -[NSString hash](self->_fileProviderIdentifier, "hash");
  v5 = 2654435761;
  if (!self->_shouldRevealFile)
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_coreSpotlightIdentifier)
  {
    -[_SFPBOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coreSpotlightIdentifier"));

  }
  if (self->_fileProviderIdentifier)
  {
    -[_SFPBOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fileProviderIdentifier"));

  }
  if (self->_shouldRevealFile)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("shouldRevealFile"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBOpenFileProviderItemCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBOpenFileProviderItemCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBOpenFileProviderItemCommand *v5;
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
    self = -[_SFPBOpenFileProviderItemCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBOpenFileProviderItemCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBOpenFileProviderItemCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBOpenFileProviderItemCommand *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBOpenFileProviderItemCommand;
  v5 = -[_SFPBOpenFileProviderItemCommand init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpotlightIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBOpenFileProviderItemCommand setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileProviderIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBOpenFileProviderItemCommand setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldRevealFile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (BOOL)shouldRevealFile
{
  return self->_shouldRevealFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

@end
