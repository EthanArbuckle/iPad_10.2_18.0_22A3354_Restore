@implementation PLUSSchemaPLUSSuggesterMediaSuggestionMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLocality:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_locality = a3;
}

- (BOOL)hasLocality
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLocality:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLocality
{
  -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setLocality:](self, "setLocality:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setServerTreatment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_serverTreatment = a3;
}

- (BOOL)hasServerTreatment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasServerTreatment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteServerTreatment
{
  -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setServerTreatment:](self, "setServerTreatment:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setClientTreatment:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_clientTreatment = a3;
}

- (BOOL)hasClientTreatment
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasClientTreatment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteClientTreatment
{
  -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setClientTreatment:](self, "setClientTreatment:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterMediaSuggestionMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $C71143984B562F5DA6BBC15D783F3493 has;
  unsigned int v6;
  int locality;
  int v8;
  int serverTreatment;
  int v10;
  int clientTreatment;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    locality = self->_locality;
    if (locality != objc_msgSend(v4, "locality"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    serverTreatment = self->_serverTreatment;
    if (serverTreatment == objc_msgSend(v4, "serverTreatment"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    clientTreatment = self->_clientTreatment;
    if (clientTreatment != objc_msgSend(v4, "clientTreatment"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_locality;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_serverTreatment;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_clientTreatment;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata clientTreatment](self, "clientTreatment") - 1;
    if (v5 > 0xD)
      v6 = CFSTR("PLUSMEDIASUGGESTIONCLIENTTREATMENT_UNKNOWN");
    else
      v6 = off_1E563A560[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientTreatment"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata locality](self, "locality") - 1;
  if (v7 > 2)
    v8 = CFSTR("PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN");
  else
    v8 = off_1E563A5D0[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("locality"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_13:
    v9 = -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata serverTreatment](self, "serverTreatment") - 1;
    if (v9 > 0xB)
      v10 = CFSTR("PLUSMEDIASUGGESTIONSERVERTREATMENT_UNKNOWN");
    else
      v10 = off_1E563A5E8[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("serverTreatment"));
  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *v5;
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
    self = -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSSuggesterMediaSuggestionMetadata;
  v5 = -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setLocality:](v5, "setLocality:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverTreatment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setServerTreatment:](v5, "setServerTreatment:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientTreatment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata setClientTreatment:](v5, "setClientTreatment:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)locality
{
  return self->_locality;
}

- (int)serverTreatment
{
  return self->_serverTreatment;
}

- (int)clientTreatment
{
  return self->_clientTreatment;
}

@end
