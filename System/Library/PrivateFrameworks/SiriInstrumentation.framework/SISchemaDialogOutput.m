@implementation SISchemaDialogOutput

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDialogOutput;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaDialogOutput deleteSpokenDialogOutput](self, "deleteSpokenDialogOutput");
  -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaDialogOutput deleteDisplayedDialogOutput](self, "deleteDisplayedDialogOutput");

  return v5;
}

- (BOOL)hasViewID
{
  return self->_viewID != 0;
}

- (void)deleteViewID
{
  -[SISchemaDialogOutput setViewID:](self, "setViewID:", 0);
}

- (BOOL)hasSpokenDialogOutput
{
  return self->_spokenDialogOutput != 0;
}

- (void)deleteSpokenDialogOutput
{
  -[SISchemaDialogOutput setSpokenDialogOutput:](self, "setSpokenDialogOutput:", 0);
}

- (BOOL)hasDisplayedDialogOutput
{
  return self->_displayedDialogOutput != 0;
}

- (void)deleteDisplayedDialogOutput
{
  -[SISchemaDialogOutput setDisplayedDialogOutput:](self, "setDisplayedDialogOutput:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDialogOutputReadFrom(self, (uint64_t)a3);
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
  -[SISchemaDialogOutput viewID](self, "viewID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SISchemaDialogOutput viewID](self, "viewID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaDialogOutput viewID](self, "viewID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaDialogOutput viewID](self, "viewID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spokenDialogOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spokenDialogOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedDialogOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedDialogOutput");
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
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_viewID, "hash");
  v4 = -[SISchemaRedactableString hash](self->_spokenDialogOutput, "hash") ^ v3;
  return v4 ^ -[SISchemaRedactableString hash](self->_displayedDialogOutput, "hash");
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
  if (self->_displayedDialogOutput)
  {
    -[SISchemaDialogOutput displayedDialogOutput](self, "displayedDialogOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("displayedDialogOutput"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("displayedDialogOutput"));

    }
  }
  if (self->_spokenDialogOutput)
  {
    -[SISchemaDialogOutput spokenDialogOutput](self, "spokenDialogOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("spokenDialogOutput"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("spokenDialogOutput"));

    }
  }
  if (self->_viewID)
  {
    -[SISchemaDialogOutput viewID](self, "viewID");
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

  -[SISchemaDialogOutput dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDialogOutput)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDialogOutput *v5;
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
    self = -[SISchemaDialogOutput initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDialogOutput)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDialogOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaRedactableString *v9;
  void *v10;
  SISchemaRedactableString *v11;
  SISchemaDialogOutput *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaDialogOutput;
  v5 = -[SISchemaDialogOutput init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaDialogOutput setViewID:](v5, "setViewID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenDialogOutput"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaRedactableString initWithDictionary:]([SISchemaRedactableString alloc], "initWithDictionary:", v8);
      -[SISchemaDialogOutput setSpokenDialogOutput:](v5, "setSpokenDialogOutput:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayedDialogOutput"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaRedactableString initWithDictionary:]([SISchemaRedactableString alloc], "initWithDictionary:", v10);
      -[SISchemaDialogOutput setDisplayedDialogOutput:](v5, "setDisplayedDialogOutput:", v11);

    }
    v12 = v5;

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

- (SISchemaRedactableString)spokenDialogOutput
{
  return self->_spokenDialogOutput;
}

- (void)setSpokenDialogOutput:(id)a3
{
  objc_storeStrong((id *)&self->_spokenDialogOutput, a3);
}

- (SISchemaRedactableString)displayedDialogOutput
{
  return self->_displayedDialogOutput;
}

- (void)setDisplayedDialogOutput:(id)a3
{
  objc_storeStrong((id *)&self->_displayedDialogOutput, a3);
}

- (void)setHasViewID:(BOOL)a3
{
  self->_hasViewID = a3;
}

- (void)setHasSpokenDialogOutput:(BOOL)a3
{
  self->_hasSpokenDialogOutput = a3;
}

- (void)setHasDisplayedDialogOutput:(BOOL)a3
{
  self->_hasDisplayedDialogOutput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedDialogOutput, 0);
  objc_storeStrong((id *)&self->_spokenDialogOutput, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

@end
