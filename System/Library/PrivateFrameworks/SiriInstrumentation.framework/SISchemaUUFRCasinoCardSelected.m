@implementation SISchemaUUFRCasinoCardSelected

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasCardSectionId
{
  return self->_cardSectionId != 0;
}

- (void)deleteCardSectionId
{
  -[SISchemaUUFRCasinoCardSelected setCardSectionId:](self, "setCardSectionId:", 0);
}

- (void)setOrdinalCardSectionPosition:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ordinalCardSectionPosition = a3;
}

- (BOOL)hasOrdinalCardSectionPosition
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOrdinalCardSectionPosition:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteOrdinalCardSectionPosition
{
  -[SISchemaUUFRCasinoCardSelected setOrdinalCardSectionPosition:](self, "setOrdinalCardSectionPosition:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSnippetAceId
{
  return self->_snippetAceId != 0;
}

- (void)deleteSnippetAceId
{
  -[SISchemaUUFRCasinoCardSelected setSnippetAceId:](self, "setSnippetAceId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRCasinoCardSelectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaUUFRCasinoCardSelected cardSectionId](self, "cardSectionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaUUFRCasinoCardSelected snippetAceId](self, "snippetAceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int ordinalCardSectionPosition;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[SISchemaUUFRCasinoCardSelected cardSectionId](self, "cardSectionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[SISchemaUUFRCasinoCardSelected cardSectionId](self, "cardSectionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaUUFRCasinoCardSelected cardSectionId](self, "cardSectionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    ordinalCardSectionPosition = self->_ordinalCardSectionPosition;
    if (ordinalCardSectionPosition != objc_msgSend(v4, "ordinalCardSectionPosition"))
      goto LABEL_15;
  }
  -[SISchemaUUFRCasinoCardSelected snippetAceId](self, "snippetAceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snippetAceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaUUFRCasinoCardSelected snippetAceId](self, "snippetAceId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SISchemaUUFRCasinoCardSelected snippetAceId](self, "snippetAceId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snippetAceId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_cardSectionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_ordinalCardSectionPosition;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_snippetAceId, "hash");
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
  if (self->_cardSectionId)
  {
    -[SISchemaUUFRCasinoCardSelected cardSectionId](self, "cardSectionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cardSectionId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaUUFRCasinoCardSelected ordinalCardSectionPosition](self, "ordinalCardSectionPosition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ordinalCardSectionPosition"));

  }
  if (self->_snippetAceId)
  {
    -[SISchemaUUFRCasinoCardSelected snippetAceId](self, "snippetAceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("snippetAceId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUUFRCasinoCardSelected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUUFRCasinoCardSelected)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUUFRCasinoCardSelected *v5;
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
    self = -[SISchemaUUFRCasinoCardSelected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUUFRCasinoCardSelected)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUUFRCasinoCardSelected *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUUFRCasinoCardSelected *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRCasinoCardSelected;
  v5 = -[SISchemaUUFRCasinoCardSelected init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardSectionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaUUFRCasinoCardSelected setCardSectionId:](v5, "setCardSectionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ordinalCardSectionPosition"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRCasinoCardSelected setOrdinalCardSectionPosition:](v5, "setOrdinalCardSectionPosition:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snippetAceId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SISchemaUUFRCasinoCardSelected setSnippetAceId:](v5, "setSnippetAceId:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)ordinalCardSectionPosition
{
  return self->_ordinalCardSectionPosition;
}

- (NSString)snippetAceId
{
  return self->_snippetAceId;
}

- (void)setSnippetAceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasCardSectionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSnippetAceId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetAceId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
}

@end
