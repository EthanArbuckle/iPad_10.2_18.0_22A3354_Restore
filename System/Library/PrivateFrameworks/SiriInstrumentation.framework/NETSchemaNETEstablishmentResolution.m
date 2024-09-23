@implementation NETSchemaNETEstablishmentResolution

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
  v13.super_class = (Class)NETSchemaNETEstablishmentResolution;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NETSchemaNETEstablishmentResolution deleteSuccessfulEndpoint](self, "deleteSuccessfulEndpoint");
  -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NETSchemaNETEstablishmentResolution deletePreferredEndpoint](self, "deletePreferredEndpoint");

  return v5;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDuration
{
  -[NETSchemaNETEstablishmentResolution setDuration:](self, "setDuration:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResolutionSource:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resolutionSource = a3;
}

- (BOOL)hasResolutionSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResolutionSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResolutionSource
{
  -[NETSchemaNETEstablishmentResolution setResolutionSource:](self, "setResolutionSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasSuccessfulEndpoint
{
  return self->_successfulEndpoint != 0;
}

- (void)deleteSuccessfulEndpoint
{
  -[NETSchemaNETEstablishmentResolution setSuccessfulEndpoint:](self, "setSuccessfulEndpoint:", 0);
}

- (BOOL)hasPreferredEndpoint
{
  return self->_preferredEndpoint != 0;
}

- (void)deletePreferredEndpoint
{
  -[NETSchemaNETEstablishmentResolution setPreferredEndpoint:](self, "setPreferredEndpoint:", 0);
}

- (void)setEndpointCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endpointCount = a3;
}

- (BOOL)hasEndpointCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEndpointCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEndpointCount
{
  -[NETSchemaNETEstablishmentResolution setEndpointCount:](self, "setEndpointCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETEstablishmentResolutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $774C9EF78E5B1D149F19EE7077FF2BC2 has;
  unsigned int v6;
  unint64_t duration;
  int v8;
  unsigned int resolutionSource;
  void *v10;
  void *v11;
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
  BOOL v22;
  int v24;
  unsigned int endpointCount;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[44];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    duration = self->_duration;
    if (duration != objc_msgSend(v4, "duration"))
      goto LABEL_19;
    has = self->_has;
    v6 = v4[44];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    resolutionSource = self->_resolutionSource;
    if (resolutionSource != objc_msgSend(v4, "resolutionSource"))
      goto LABEL_19;
  }
  -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "successfulEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_18;
  -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "successfulEndpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_19;
  }
  else
  {

  }
  -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredEndpoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_19;
  }
  else
  {

  }
  v24 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v24 == ((v4[44] >> 2) & 1))
  {
    if (!v24
      || (endpointCount = self->_endpointCount, endpointCount == objc_msgSend(v4, "endpointCount")))
    {
      v22 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_duration;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_resolutionSource;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NETSchemaNETEndpoint hash](self->_successfulEndpoint, "hash");
  v6 = -[NETSchemaNETEndpoint hash](self->_preferredEndpoint, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_endpointCount;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETEstablishmentResolution duration](self, "duration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETEstablishmentResolution endpointCount](self, "endpointCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("endpointCount"));

  }
  if (self->_preferredEndpoint)
  {
    -[NETSchemaNETEstablishmentResolution preferredEndpoint](self, "preferredEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("preferredEndpoint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("preferredEndpoint"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETEstablishmentResolution resolutionSource](self, "resolutionSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("resolutionSource"));

  }
  if (self->_successfulEndpoint)
  {
    -[NETSchemaNETEstablishmentResolution successfulEndpoint](self, "successfulEndpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("successfulEndpoint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("successfulEndpoint"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETEstablishmentResolution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETEstablishmentResolution)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETEstablishmentResolution *v5;
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
    self = -[NETSchemaNETEstablishmentResolution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETEstablishmentResolution)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETEstablishmentResolution *v5;
  void *v6;
  void *v7;
  void *v8;
  NETSchemaNETEndpoint *v9;
  void *v10;
  NETSchemaNETEndpoint *v11;
  void *v12;
  NETSchemaNETEstablishmentResolution *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NETSchemaNETEstablishmentResolution;
  v5 = -[NETSchemaNETEstablishmentResolution init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETEstablishmentResolution setDuration:](v5, "setDuration:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETEstablishmentResolution setResolutionSource:](v5, "setResolutionSource:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("successfulEndpoint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NETSchemaNETEndpoint initWithDictionary:]([NETSchemaNETEndpoint alloc], "initWithDictionary:", v8);
      -[NETSchemaNETEstablishmentResolution setSuccessfulEndpoint:](v5, "setSuccessfulEndpoint:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preferredEndpoint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NETSchemaNETEndpoint initWithDictionary:]([NETSchemaNETEndpoint alloc], "initWithDictionary:", v10);
      -[NETSchemaNETEstablishmentResolution setPreferredEndpoint:](v5, "setPreferredEndpoint:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETEstablishmentResolution setEndpointCount:](v5, "setEndpointCount:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)resolutionSource
{
  return self->_resolutionSource;
}

- (NETSchemaNETEndpoint)successfulEndpoint
{
  return self->_successfulEndpoint;
}

- (void)setSuccessfulEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_successfulEndpoint, a3);
}

- (NETSchemaNETEndpoint)preferredEndpoint
{
  return self->_preferredEndpoint;
}

- (void)setPreferredEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_preferredEndpoint, a3);
}

- (unsigned)endpointCount
{
  return self->_endpointCount;
}

- (void)setHasSuccessfulEndpoint:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPreferredEndpoint:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredEndpoint, 0);
  objc_storeStrong((id *)&self->_successfulEndpoint, 0);
}

@end
