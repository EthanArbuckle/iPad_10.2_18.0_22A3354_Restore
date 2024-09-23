@implementation _SFPBPerformIntentCommand

- (_SFPBPerformIntentCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBPerformIntentCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBPerformIntentCommand *v14;

  v4 = a3;
  v5 = -[_SFPBPerformIntentCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "intentMessageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "intentMessageName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformIntentCommand setIntentMessageName:](v5, "setIntentMessageName:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformIntentCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "intentMessageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "intentMessageData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformIntentCommand setIntentMessageData:](v5, "setIntentMessageData:", v11);

    }
    if (objc_msgSend(v4, "hasIsRunnableWorkflow"))
      -[_SFPBPerformIntentCommand setIsRunnableWorkflow:](v5, "setIsRunnableWorkflow:", objc_msgSend(v4, "isRunnableWorkflow"));
    objc_msgSend(v4, "biomeStreamIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "biomeStreamIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformIntentCommand setBiomeStreamIdentifier:](v5, "setBiomeStreamIdentifier:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setIntentMessageName:(id)a3
{
  NSString *v4;
  NSString *intentMessageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  intentMessageName = self->_intentMessageName;
  self->_intentMessageName = v4;

}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (void)setIntentMessageData:(id)a3
{
  NSData *v4;
  NSData *intentMessageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  intentMessageData = self->_intentMessageData;
  self->_intentMessageData = v4;

}

- (void)setIsRunnableWorkflow:(BOOL)a3
{
  self->_isRunnableWorkflow = a3;
}

- (void)setBiomeStreamIdentifier:(id)a3
{
  NSString *v4;
  NSString *biomeStreamIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  biomeStreamIdentifier = self->_biomeStreamIdentifier;
  self->_biomeStreamIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPerformIntentCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBPerformIntentCommand intentMessageName](self, "intentMessageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBPerformIntentCommand intentMessageData](self, "intentMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteDataField();

  if (-[_SFPBPerformIntentCommand isRunnableWorkflow](self, "isRunnableWorkflow"))
    PBDataWriterWriteBOOLField();
  -[_SFPBPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
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
  int v21;
  int isRunnableWorkflow;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[_SFPBPerformIntentCommand intentMessageName](self, "intentMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMessageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBPerformIntentCommand intentMessageName](self, "intentMessageName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPerformIntentCommand intentMessageName](self, "intentMessageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMessageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_23;
  }
  else
  {

  }
  -[_SFPBPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_23;
  }
  else
  {

  }
  -[_SFPBPerformIntentCommand intentMessageData](self, "intentMessageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBPerformIntentCommand intentMessageData](self, "intentMessageData");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBPerformIntentCommand intentMessageData](self, "intentMessageData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMessageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_23;
  }
  else
  {

  }
  isRunnableWorkflow = self->_isRunnableWorkflow;
  if (isRunnableWorkflow != objc_msgSend(v4, "isRunnableWorkflow"))
    goto LABEL_23;
  -[_SFPBPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "biomeStreamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[_SFPBPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {

LABEL_26:
    v28 = 1;
    goto LABEL_24;
  }
  v24 = (void *)v23;
  -[_SFPBPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "biomeStreamIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if ((v27 & 1) != 0)
    goto LABEL_26;
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_intentMessageName, "hash");
  v4 = -[NSString hash](self->_applicationBundleIdentifier, "hash");
  v5 = -[NSData hash](self->_intentMessageData, "hash");
  if (self->_isRunnableWorkflow)
    v6 = 2654435761;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_biomeStreamIdentifier, "hash");
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
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationBundleIdentifier)
  {
    -[_SFPBPerformIntentCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_biomeStreamIdentifier)
  {
    -[_SFPBPerformIntentCommand biomeStreamIdentifier](self, "biomeStreamIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("biomeStreamIdentifier"));

  }
  if (self->_intentMessageData)
  {
    -[_SFPBPerformIntentCommand intentMessageData](self, "intentMessageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMessageData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("intentMessageData"));

    }
  }
  if (self->_intentMessageName)
  {
    -[_SFPBPerformIntentCommand intentMessageName](self, "intentMessageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("intentMessageName"));

  }
  if (self->_isRunnableWorkflow)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPerformIntentCommand isRunnableWorkflow](self, "isRunnableWorkflow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isRunnableWorkflow"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPerformIntentCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPerformIntentCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPerformIntentCommand *v5;
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
    self = -[_SFPBPerformIntentCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPerformIntentCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPerformIntentCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFPBPerformIntentCommand *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFPBPerformIntentCommand;
  v5 = -[_SFPBPerformIntentCommand init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentMessageName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBPerformIntentCommand setIntentMessageName:](v5, "setIntentMessageName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBPerformIntentCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentMessageData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
      -[_SFPBPerformIntentCommand setIntentMessageData:](v5, "setIntentMessageData:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRunnableWorkflow"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPerformIntentCommand setIsRunnableWorkflow:](v5, "setIsRunnableWorkflow:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("biomeStreamIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[_SFPBPerformIntentCommand setBiomeStreamIdentifier:](v5, "setBiomeStreamIdentifier:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (BOOL)isRunnableWorkflow
{
  return self->_isRunnableWorkflow;
}

- (NSString)biomeStreamIdentifier
{
  return self->_biomeStreamIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
}

@end
