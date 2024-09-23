@implementation IFTSchemaASTFlatExprSearchVariant

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaASTFlatExprSearchVariant;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaASTFlatExprSearchVariant deleteLinkId](self, "deleteLinkId");
  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 1) |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(&self->_isLowConfidenceKnowledge + 1);
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 1) = *(&self->_isLowConfidenceKnowledge + 1) & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaASTFlatExprSearchVariant setExists:](self, "setExists:", 0);
  *(&self->_isLowConfidenceKnowledge + 1) &= ~1u;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[IFTSchemaASTFlatExprSearchVariant setLinkId:](self, "setLinkId:", 0);
}

- (void)setIsLowConfidenceKnowledge:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 1) |= 2u;
  self->_isLowConfidenceKnowledge = a3;
}

- (BOOL)hasIsLowConfidenceKnowledge
{
  return (*((unsigned __int8 *)&self->_isLowConfidenceKnowledge + 1) >> 1) & 1;
}

- (void)setHasIsLowConfidenceKnowledge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isLowConfidenceKnowledge + 1) = *(&self->_isLowConfidenceKnowledge + 1) & 0xFD | v3;
}

- (void)deleteIsLowConfidenceKnowledge
{
  -[IFTSchemaASTFlatExprSearchVariant setIsLowConfidenceKnowledge:](self, "setIsLowConfidenceKnowledge:", 0);
  *(&self->_isLowConfidenceKnowledge + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaASTFlatExprSearchVariantReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (*(&self->_isLowConfidenceKnowledge + 1))
    PBDataWriterWriteBOOLField();
  -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(&self->_isLowConfidenceKnowledge + 1) & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int isLowConfidenceKnowledge;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if (*(&self->_isLowConfidenceKnowledge + 1) != (v4[25] & 1))
    goto LABEL_15;
  if (*(&self->_isLowConfidenceKnowledge + 1))
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_15;
  }
  -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*((unsigned __int8 *)&self->_isLowConfidenceKnowledge + 1) >> 1) & 1;
  if (v14 != ((v4[25] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    isLowConfidenceKnowledge = self->_isLowConfidenceKnowledge;
    if (isLowConfidenceKnowledge != objc_msgSend(v4, "isLowConfidenceKnowledge"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (*(&self->_isLowConfidenceKnowledge + 1))
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(&self->_isLowConfidenceKnowledge + 1) & 2) != 0)
    v5 = 2654435761 * self->_isLowConfidenceKnowledge;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isLowConfidenceKnowledge + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaASTFlatExprSearchVariant exists](self, "exists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("exists"));

    v4 = *(&self->_isLowConfidenceKnowledge + 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaASTFlatExprSearchVariant isLowConfidenceKnowledge](self, "isLowConfidenceKnowledge"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isLowConfidenceKnowledge"));

  }
  if (self->_linkId)
  {
    -[IFTSchemaASTFlatExprSearchVariant linkId](self, "linkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaASTFlatExprSearchVariant dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaASTFlatExprSearchVariant)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaASTFlatExprSearchVariant *v5;
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
    self = -[IFTSchemaASTFlatExprSearchVariant initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaASTFlatExprSearchVariant)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaASTFlatExprSearchVariant *v5;
  void *v6;
  void *v7;
  SISchemaUUID *v8;
  void *v9;
  IFTSchemaASTFlatExprSearchVariant *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaASTFlatExprSearchVariant;
  v5 = -[IFTSchemaASTFlatExprSearchVariant init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaASTFlatExprSearchVariant setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v7);
      -[IFTSchemaASTFlatExprSearchVariant setLinkId:](v5, "setLinkId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLowConfidenceKnowledge"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaASTFlatExprSearchVariant setIsLowConfidenceKnowledge:](v5, "setIsLowConfidenceKnowledge:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (BOOL)isLowConfidenceKnowledge
{
  return self->_isLowConfidenceKnowledge;
}

- (void)setHasLinkId:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
