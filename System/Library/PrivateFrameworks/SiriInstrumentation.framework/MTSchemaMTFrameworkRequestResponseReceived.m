@implementation MTSchemaMTFrameworkRequestResponseReceived

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
  v9.super_class = (Class)MTSchemaMTFrameworkRequestResponseReceived;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[MTSchemaMTFrameworkRequestResponseReceived deleteFrameworkRequestId](self, "deleteFrameworkRequestId");
  return v5;
}

- (BOOL)hasFrameworkRequestId
{
  return self->_frameworkRequestId != 0;
}

- (void)deleteFrameworkRequestId
{
  -[MTSchemaMTFrameworkRequestResponseReceived setFrameworkRequestId:](self, "setFrameworkRequestId:", 0);
}

- (void)setRequestRoute:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestRoute = a3;
}

- (BOOL)hasRequestRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequestRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRequestRoute
{
  -[MTSchemaMTFrameworkRequestResponseReceived setRequestRoute:](self, "setRequestRoute:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumSentences:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numSentences = a3;
}

- (BOOL)hasNumSentences
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumSentences:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumSentences
{
  -[MTSchemaMTFrameworkRequestResponseReceived setNumSentences:](self, "setNumSentences:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTFrameworkRequestResponseReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $EDCF6F106FE77D3F58EB31B13DA77F24 has;
  unsigned int v14;
  int requestRoute;
  int v16;
  unsigned int numSentences;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameworkRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameworkRequestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    requestRoute = self->_requestRoute;
    if (requestRoute == objc_msgSend(v4, "requestRoute"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    numSentences = self->_numSentences;
    if (numSentences != objc_msgSend(v4, "numSentences"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_frameworkRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_requestRoute;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_numSentences;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_frameworkRequestId)
  {
    -[MTSchemaMTFrameworkRequestResponseReceived frameworkRequestId](self, "frameworkRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("frameworkRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("frameworkRequestId"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MTSchemaMTFrameworkRequestResponseReceived numSentences](self, "numSentences"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numSentences"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v9 = -[MTSchemaMTFrameworkRequestResponseReceived requestRoute](self, "requestRoute");
    v10 = CFSTR("MTFRAMEWORKREQUESTROUTE_UNKNOWN");
    if (v9 == 1)
      v10 = CFSTR("MTFRAMEWORKREQUESTROUTE_NETWORK");
    if (v9 == 2)
      v11 = CFSTR("MTFRAMEWORKREQUESTROUTE_ON_DEVICE");
    else
      v11 = v10;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requestRoute"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTFrameworkRequestResponseReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTFrameworkRequestResponseReceived)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTFrameworkRequestResponseReceived *v5;
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
    self = -[MTSchemaMTFrameworkRequestResponseReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTFrameworkRequestResponseReceived)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTFrameworkRequestResponseReceived *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  MTSchemaMTFrameworkRequestResponseReceived *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTSchemaMTFrameworkRequestResponseReceived;
  v5 = -[MTSchemaMTFrameworkRequestResponseReceived init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameworkRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[MTSchemaMTFrameworkRequestResponseReceived setFrameworkRequestId:](v5, "setFrameworkRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestRoute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTFrameworkRequestResponseReceived setRequestRoute:](v5, "setRequestRoute:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentences"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTFrameworkRequestResponseReceived setNumSentences:](v5, "setNumSentences:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)frameworkRequestId
{
  return self->_frameworkRequestId;
}

- (void)setFrameworkRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkRequestId, a3);
}

- (int)requestRoute
{
  return self->_requestRoute;
}

- (unsigned)numSentences
{
  return self->_numSentences;
}

- (void)setHasFrameworkRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkRequestId, 0);
}

@end
