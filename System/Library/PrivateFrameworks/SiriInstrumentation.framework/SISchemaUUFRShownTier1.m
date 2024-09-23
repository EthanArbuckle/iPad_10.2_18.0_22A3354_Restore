@implementation SISchemaUUFRShownTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUUFRShownTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[SISchemaUUFRShownTier1 deleteDisplayedSiriDialogOutput](self, "deleteDisplayedSiriDialogOutput");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[SISchemaUUFRShownTier1 deleteDisplayedSiriDialogOutput](self, "deleteDisplayedSiriDialogOutput");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[SISchemaUUFRShownTier1 deleteDisplayedSiriDialogOutput](self, "deleteDisplayedSiriDialogOutput");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[SISchemaUUFRShownTier1 deleteDisplayedSiriDialogOutput](self, "deleteDisplayedSiriDialogOutput");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[SISchemaUUFRShownTier1 deleteDisplayedSiriDialogOutput](self, "deleteDisplayedSiriDialogOutput");
  -[SISchemaUUFRShownTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUUFRShownTier1 deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[SISchemaUUFRShownTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasDisplayedSiriDialogOutput
{
  return self->_displayedSiriDialogOutput != 0;
}

- (void)deleteDisplayedSiriDialogOutput
{
  -[SISchemaUUFRShownTier1 setDisplayedSiriDialogOutput:](self, "setDisplayedSiriDialogOutput:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRShownTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaUUFRShownTier1 linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaUUFRShownTier1 linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUUFRShownTier1 displayedSiriDialogOutput](self, "displayedSiriDialogOutput");
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaUUFRShownTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaUUFRShownTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaUUFRShownTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaUUFRShownTier1 displayedSiriDialogOutput](self, "displayedSiriDialogOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSiriDialogOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaUUFRShownTier1 displayedSiriDialogOutput](self, "displayedSiriDialogOutput");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SISchemaUUFRShownTier1 displayedSiriDialogOutput](self, "displayedSiriDialogOutput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedSiriDialogOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
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
  unint64_t v3;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  return -[NSString hash](self->_displayedSiriDialogOutput, "hash") ^ v3;
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
  if (self->_displayedSiriDialogOutput)
  {
    -[SISchemaUUFRShownTier1 displayedSiriDialogOutput](self, "displayedSiriDialogOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("displayedSiriDialogOutput"));

  }
  if (self->_linkId)
  {
    -[SISchemaUUFRShownTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("linkId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUUFRShownTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUUFRShownTier1)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUUFRShownTier1 *v5;
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
    self = -[SISchemaUUFRShownTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUUFRShownTier1)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUUFRShownTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  SISchemaUUFRShownTier1 *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaUUFRShownTier1;
  v5 = -[SISchemaUUFRShownTier1 init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaUUFRShownTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayedSiriDialogOutput"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaUUFRShownTier1 setDisplayedSiriDialogOutput:](v5, "setDisplayedSiriDialogOutput:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSString)displayedSiriDialogOutput
{
  return self->_displayedSiriDialogOutput;
}

- (void)setDisplayedSiriDialogOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasDisplayedSiriDialogOutput:(BOOL)a3
{
  self->_hasDisplayedSiriDialogOutput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedSiriDialogOutput, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
