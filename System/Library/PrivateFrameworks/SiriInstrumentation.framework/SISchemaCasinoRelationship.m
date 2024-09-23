@implementation SISchemaCasinoRelationship

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasViewIDFrom
{
  return self->_viewIDFrom != 0;
}

- (void)deleteViewIDFrom
{
  -[SISchemaCasinoRelationship setViewIDFrom:](self, "setViewIDFrom:", 0);
}

- (BOOL)hasViewIDTo
{
  return self->_viewIDTo != 0;
}

- (void)deleteViewIDTo
{
  -[SISchemaCasinoRelationship setViewIDTo:](self, "setViewIDTo:", 0);
}

- (void)setCasinoFromType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_casinoFromType = a3;
}

- (BOOL)hasCasinoFromType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCasinoFromType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCasinoFromType
{
  -[SISchemaCasinoRelationship setCasinoFromType:](self, "setCasinoFromType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCasinoRelationshipReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaCasinoRelationship viewIDFrom](self, "viewIDFrom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaCasinoRelationship viewIDTo](self, "viewIDTo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int casinoFromType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaCasinoRelationship viewIDFrom](self, "viewIDFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewIDFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaCasinoRelationship viewIDFrom](self, "viewIDFrom");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaCasinoRelationship viewIDFrom](self, "viewIDFrom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewIDFrom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaCasinoRelationship viewIDTo](self, "viewIDTo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewIDTo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SISchemaCasinoRelationship viewIDTo](self, "viewIDTo");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaCasinoRelationship viewIDTo](self, "viewIDTo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewIDTo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (casinoFromType = self->_casinoFromType, casinoFromType == objc_msgSend(v4, "casinoFromType")))
    {
      v17 = 1;
      goto LABEL_13;
    }
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

  v3 = -[NSString hash](self->_viewIDFrom, "hash");
  v4 = -[NSString hash](self->_viewIDTo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_casinoFromType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SISchemaCasinoRelationship casinoFromType](self, "casinoFromType");
    v5 = CFSTR("CASINO_UNKNOWN_CASINO_TYPE");
    if (v4 == 1)
      v5 = CFSTR("CASINO_COMPACT");
    if (v4 == 2)
      v6 = CFSTR("CASINO_FULL");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("casinoFromType"));
  }
  if (self->_viewIDFrom)
  {
    -[SISchemaCasinoRelationship viewIDFrom](self, "viewIDFrom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("viewIDFrom"));

  }
  if (self->_viewIDTo)
  {
    -[SISchemaCasinoRelationship viewIDTo](self, "viewIDTo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("viewIDTo"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaCasinoRelationship dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaCasinoRelationship)initWithJSON:(id)a3
{
  void *v4;
  SISchemaCasinoRelationship *v5;
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
    self = -[SISchemaCasinoRelationship initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaCasinoRelationship)initWithDictionary:(id)a3
{
  id v4;
  SISchemaCasinoRelationship *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaCasinoRelationship *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaCasinoRelationship;
  v5 = -[SISchemaCasinoRelationship init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewIDFrom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaCasinoRelationship setViewIDFrom:](v5, "setViewIDFrom:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewIDTo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaCasinoRelationship setViewIDTo:](v5, "setViewIDTo:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("casinoFromType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCasinoRelationship setCasinoFromType:](v5, "setCasinoFromType:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)viewIDFrom
{
  return self->_viewIDFrom;
}

- (void)setViewIDFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)viewIDTo
{
  return self->_viewIDTo;
}

- (void)setViewIDTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)casinoFromType
{
  return self->_casinoFromType;
}

- (void)setHasViewIDFrom:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasViewIDTo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewIDTo, 0);
  objc_storeStrong((id *)&self->_viewIDFrom, 0);
}

@end
