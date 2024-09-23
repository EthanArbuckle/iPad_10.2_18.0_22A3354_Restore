@implementation OPTINSchemaOPTINStatePropagationEvent

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
  v9.super_class = (Class)OPTINSchemaOPTINStatePropagationEvent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[OPTINSchemaOPTINStatePropagationEvent deleteHashedHomeKitAccessoryId](self, "deleteHashedHomeKitAccessoryId");
  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.siri.optin.OPTINStatePropagationEvent");
}

- (void)setOptInState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_optInState = a3;
}

- (BOOL)hasOptInState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOptInState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteOptInState
{
  -[OPTINSchemaOPTINStatePropagationEvent setOptInState:](self, "setOptInState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPropagationState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_propagationState = a3;
}

- (BOOL)hasPropagationState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPropagationState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePropagationState
{
  -[OPTINSchemaOPTINStatePropagationEvent setPropagationState:](self, "setPropagationState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasHashedHomeKitAccessoryId
{
  return self->_hashedHomeKitAccessoryId != 0;
}

- (void)deleteHashedHomeKitAccessoryId
{
  -[OPTINSchemaOPTINStatePropagationEvent setHashedHomeKitAccessoryId:](self, "setHashedHomeKitAccessoryId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return OPTINSchemaOPTINStatePropagationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $ED48CD6DDAEF413251824BA03510C4C3 has;
  unsigned int v6;
  int optInState;
  int v8;
  int propagationState;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    optInState = self->_optInState;
    if (optInState != objc_msgSend(v4, "optInState"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (propagationState = self->_propagationState,
          propagationState == objc_msgSend(v4, "propagationState")))
    {
      -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hashedHomeKitAccessoryId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hashedHomeKitAccessoryId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_optInState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SISchemaUUID hash](self->_hashedHomeKitAccessoryId, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_propagationState;
  return v3 ^ v2 ^ -[SISchemaUUID hash](self->_hashedHomeKitAccessoryId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hashedHomeKitAccessoryId)
  {
    -[OPTINSchemaOPTINStatePropagationEvent hashedHomeKitAccessoryId](self, "hashedHomeKitAccessoryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hashedHomeKitAccessoryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hashedHomeKitAccessoryId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = -[OPTINSchemaOPTINStatePropagationEvent optInState](self, "optInState") - 1;
    if (v8 > 2)
      v9 = CFSTR("UNKNOWN");
    else
      v9 = off_1E5632358[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("optInState"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = -[OPTINSchemaOPTINStatePropagationEvent propagationState](self, "propagationState") - 1;
    if (v10 > 3)
      v11 = CFSTR("OPTINPROPAGATIONSTATE_UNKNOWN");
    else
      v11 = off_1E5632370[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("propagationState"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[OPTINSchemaOPTINStatePropagationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (OPTINSchemaOPTINStatePropagationEvent)initWithJSON:(id)a3
{
  void *v4;
  OPTINSchemaOPTINStatePropagationEvent *v5;
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
    self = -[OPTINSchemaOPTINStatePropagationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (OPTINSchemaOPTINStatePropagationEvent)initWithDictionary:(id)a3
{
  id v4;
  OPTINSchemaOPTINStatePropagationEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  OPTINSchemaOPTINStatePropagationEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OPTINSchemaOPTINStatePropagationEvent;
  v5 = -[OPTINSchemaOPTINStatePropagationEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optInState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[OPTINSchemaOPTINStatePropagationEvent setOptInState:](v5, "setOptInState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propagationState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[OPTINSchemaOPTINStatePropagationEvent setPropagationState:](v5, "setPropagationState:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hashedHomeKitAccessoryId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[OPTINSchemaOPTINStatePropagationEvent setHashedHomeKitAccessoryId:](v5, "setHashedHomeKitAccessoryId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)optInState
{
  return self->_optInState;
}

- (int)propagationState
{
  return self->_propagationState;
}

- (SISchemaUUID)hashedHomeKitAccessoryId
{
  return self->_hashedHomeKitAccessoryId;
}

- (void)setHashedHomeKitAccessoryId:(id)a3
{
  objc_storeStrong((id *)&self->_hashedHomeKitAccessoryId, a3);
}

- (void)setHasHashedHomeKitAccessoryId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashedHomeKitAccessoryId, 0);
}

- (int)getAnyEventType
{
  return 48;
}

@end
