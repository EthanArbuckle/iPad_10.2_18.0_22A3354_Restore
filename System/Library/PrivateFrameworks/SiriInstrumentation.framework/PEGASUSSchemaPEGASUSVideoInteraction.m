@implementation PEGASUSSchemaPEGASUSVideoInteraction

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setInteractionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_interactionType = a3;
}

- (BOOL)hasInteractionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInteractionType
{
  -[PEGASUSSchemaPEGASUSVideoInteraction setInteractionType:](self, "setInteractionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasClientComponentName
{
  return self->_clientComponentName != 0;
}

- (void)deleteClientComponentName
{
  -[PEGASUSSchemaPEGASUSVideoInteraction setClientComponentName:](self, "setClientComponentName:", 0);
}

- (BOOL)hasDialogId
{
  return self->_dialogId != 0;
}

- (void)deleteDialogId
{
  -[PEGASUSSchemaPEGASUSVideoInteraction setDialogId:](self, "setDialogId:", 0);
}

- (void)setClientInteractionVideoVerb:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_clientInteractionVideoVerb = a3;
}

- (BOOL)hasClientInteractionVideoVerb
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasClientInteractionVideoVerb:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteClientInteractionVideoVerb
{
  -[PEGASUSSchemaPEGASUSVideoInteraction setClientInteractionVideoVerb:](self, "setClientInteractionVideoVerb:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoInteractionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PEGASUSSchemaPEGASUSVideoInteraction clientComponentName](self, "clientComponentName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSVideoInteraction dialogId](self, "dialogId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int interactionType;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int v20;
  int clientInteractionVideoVerb;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[36] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    interactionType = self->_interactionType;
    if (interactionType != objc_msgSend(v4, "interactionType"))
      goto LABEL_15;
  }
  -[PEGASUSSchemaPEGASUSVideoInteraction clientComponentName](self, "clientComponentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientComponentName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[PEGASUSSchemaPEGASUSVideoInteraction clientComponentName](self, "clientComponentName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PEGASUSSchemaPEGASUSVideoInteraction clientComponentName](self, "clientComponentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientComponentName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSVideoInteraction dialogId](self, "dialogId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[PEGASUSSchemaPEGASUSVideoInteraction dialogId](self, "dialogId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PEGASUSSchemaPEGASUSVideoInteraction dialogId](self, "dialogId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  else
  {

  }
  v20 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20
      || (clientInteractionVideoVerb = self->_clientInteractionVideoVerb,
          clientInteractionVideoVerb == objc_msgSend(v4, "clientInteractionVideoVerb")))
    {
      v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_interactionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_clientComponentName, "hash");
  v5 = -[NSString hash](self->_dialogId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_clientInteractionVideoVerb;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientComponentName)
  {
    -[PEGASUSSchemaPEGASUSVideoInteraction clientComponentName](self, "clientComponentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientComponentName"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = -[PEGASUSSchemaPEGASUSVideoInteraction clientInteractionVideoVerb](self, "clientInteractionVideoVerb") - 1;
    if (v6 > 8)
      v7 = CFSTR("PEGASUSVIDEOVERB_UNKNOWN");
    else
      v7 = off_1E563B900[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("clientInteractionVideoVerb"));
  }
  if (self->_dialogId)
  {
    -[PEGASUSSchemaPEGASUSVideoInteraction dialogId](self, "dialogId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dialogId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = -[PEGASUSSchemaPEGASUSVideoInteraction interactionType](self, "interactionType");
    v11 = CFSTR("PEGASUSVIDEOINTERACTIONTYPE_UNKNOWN");
    if (v10 == 1)
      v11 = CFSTR("PEGASUSVIDEOINTERACTIONTYPE_CLIENT");
    if (v10 == 2)
      v12 = CFSTR("PEGASUSVIDEOINTERACTIONTYPE_SERVER");
    else
      v12 = v11;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("interactionType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSVideoInteraction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSVideoInteraction)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSVideoInteraction *v5;
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
    self = -[PEGASUSSchemaPEGASUSVideoInteraction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSVideoInteraction)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSVideoInteraction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PEGASUSSchemaPEGASUSVideoInteraction *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSVideoInteraction;
  v5 = -[PEGASUSSchemaPEGASUSVideoInteraction init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSVideoInteraction setInteractionType:](v5, "setInteractionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientComponentName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[PEGASUSSchemaPEGASUSVideoInteraction setClientComponentName:](v5, "setClientComponentName:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PEGASUSSchemaPEGASUSVideoInteraction setDialogId:](v5, "setDialogId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientInteractionVideoVerb"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSVideoInteraction setClientInteractionVideoVerb:](v5, "setClientInteractionVideoVerb:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (NSString)clientComponentName
{
  return self->_clientComponentName;
}

- (void)setClientComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)clientInteractionVideoVerb
{
  return self->_clientInteractionVideoVerb;
}

- (void)setHasClientComponentName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDialogId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_clientComponentName, 0);
}

@end
