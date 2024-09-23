@implementation SISchemaViewContainer

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasViewID
{
  return self->_viewID != 0;
}

- (void)deleteViewID
{
  -[SISchemaViewContainer setViewID:](self, "setViewID:", 0);
}

- (BOOL)hasSnippetClass
{
  return self->_snippetClass != 0;
}

- (void)deleteSnippetClass
{
  -[SISchemaViewContainer setSnippetClass:](self, "setSnippetClass:", 0);
}

- (BOOL)hasDialogIdentifier
{
  return self->_dialogIdentifier != 0;
}

- (void)deleteDialogIdentifier
{
  -[SISchemaViewContainer setDialogIdentifier:](self, "setDialogIdentifier:", 0);
}

- (BOOL)hasDialogPhase
{
  return self->_dialogPhase != 0;
}

- (void)deleteDialogPhase
{
  -[SISchemaViewContainer setDialogPhase:](self, "setDialogPhase:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaViewContainerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SISchemaViewContainer viewID](self, "viewID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaViewContainer snippetClass](self, "snippetClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaViewContainer dialogIdentifier](self, "dialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SISchemaViewContainer dialogPhase](self, "dialogPhase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[SISchemaViewContainer viewID](self, "viewID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[SISchemaViewContainer viewID](self, "viewID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaViewContainer viewID](self, "viewID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[SISchemaViewContainer snippetClass](self, "snippetClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snippetClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[SISchemaViewContainer snippetClass](self, "snippetClass");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaViewContainer snippetClass](self, "snippetClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snippetClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[SISchemaViewContainer dialogIdentifier](self, "dialogIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[SISchemaViewContainer dialogIdentifier](self, "dialogIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaViewContainer dialogIdentifier](self, "dialogIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[SISchemaViewContainer dialogPhase](self, "dialogPhase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogPhase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaViewContainer dialogPhase](self, "dialogPhase");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[SISchemaViewContainer dialogPhase](self, "dialogPhase");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogPhase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_viewID, "hash");
  v4 = -[NSString hash](self->_snippetClass, "hash") ^ v3;
  v5 = -[NSString hash](self->_dialogIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_dialogPhase, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dialogIdentifier)
  {
    -[SISchemaViewContainer dialogIdentifier](self, "dialogIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dialogIdentifier"));

  }
  if (self->_dialogPhase)
  {
    -[SISchemaViewContainer dialogPhase](self, "dialogPhase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dialogPhase"));

  }
  if (self->_snippetClass)
  {
    -[SISchemaViewContainer snippetClass](self, "snippetClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("snippetClass"));

  }
  if (self->_viewID)
  {
    -[SISchemaViewContainer viewID](self, "viewID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("viewID"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaViewContainer dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaViewContainer)initWithJSON:(id)a3
{
  void *v4;
  SISchemaViewContainer *v5;
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
    self = -[SISchemaViewContainer initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaViewContainer)initWithDictionary:(id)a3
{
  id v4;
  SISchemaViewContainer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SISchemaViewContainer *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaViewContainer;
  v5 = -[SISchemaViewContainer init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaViewContainer setViewID:](v5, "setViewID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snippetClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaViewContainer setSnippetClass:](v5, "setSnippetClass:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaViewContainer setDialogIdentifier:](v5, "setDialogIdentifier:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogPhase"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[SISchemaViewContainer setDialogPhase:](v5, "setDialogPhase:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)viewID
{
  return self->_viewID;
}

- (void)setViewID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)snippetClass
{
  return self->_snippetClass;
}

- (void)setSnippetClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (void)setDialogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (void)setDialogPhase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasViewID:(BOOL)a3
{
  self->_hasViewID = a3;
}

- (void)setHasSnippetClass:(BOOL)a3
{
  self->_hasSnippetClass = a3;
}

- (void)setHasDialogIdentifier:(BOOL)a3
{
  self->_hasDialogIdentifier = a3;
}

- (void)setHasDialogPhase:(BOOL)a3
{
  self->_hasDialogPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetClass, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

@end
