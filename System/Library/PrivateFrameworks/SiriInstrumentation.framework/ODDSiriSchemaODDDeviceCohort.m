@implementation ODDSiriSchemaODDDeviceCohort

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
  v9.super_class = (Class)ODDSiriSchemaODDDeviceCohort;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDDeviceCohort deleteCohortInterval](self, "deleteCohortInterval");
  return v5;
}

- (BOOL)hasCohortInterval
{
  return self->_cohortInterval != 0;
}

- (void)deleteCohortInterval
{
  -[ODDSiriSchemaODDDeviceCohort setCohortInterval:](self, "setCohortInterval:", 0);
}

- (void)setCohortType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cohortType = a3;
}

- (BOOL)hasCohortType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCohortType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCohortType
{
  -[ODDSiriSchemaODDDeviceCohort setCohortType:](self, "setCohortType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCohortDataAvailabilityState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cohortDataAvailabilityState = a3;
}

- (BOOL)hasCohortDataAvailabilityState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCohortDataAvailabilityState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCohortDataAvailabilityState
{
  -[ODDSiriSchemaODDDeviceCohort setCohortDataAvailabilityState:](self, "setCohortDataAvailabilityState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDeviceCohortReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval");
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
    PBDataWriterWriteInt32Field();
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
  $5B0C4B9DD1BFBB3D772490AD8DD80003 has;
  unsigned int v14;
  int cohortType;
  int v16;
  int cohortDataAvailabilityState;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cohortInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cohortInterval");
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
    cohortType = self->_cohortType;
    if (cohortType == objc_msgSend(v4, "cohortType"))
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
    cohortDataAvailabilityState = self->_cohortDataAvailabilityState;
    if (cohortDataAvailabilityState != objc_msgSend(v4, "cohortDataAvailabilityState"))
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

  v3 = -[ODDSiriSchemaODDTimeInterval hash](self->_cohortInterval, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_cohortType;
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
  v5 = 2654435761 * self->_cohortDataAvailabilityState;
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
  int v10;
  const __CFString *v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[ODDSiriSchemaODDDeviceCohort cohortDataAvailabilityState](self, "cohortDataAvailabilityState");
    v5 = CFSTR("ODDDATAAVAILABILITYSTATE_UNKNOWN");
    if (v4 == 1)
      v5 = CFSTR("ODDDATAAVAILABILITYSTATE_COMPLETE");
    if (v4 == 2)
      v6 = CFSTR("ODDDATAAVAILABILITYSTATE_INSUFFICIENT_DATA");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cohortDataAvailabilityState"));
  }
  if (self->_cohortInterval)
  {
    -[ODDSiriSchemaODDDeviceCohort cohortInterval](self, "cohortInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cohortInterval"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cohortInterval"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = -[ODDSiriSchemaODDDeviceCohort cohortType](self, "cohortType");
    v11 = CFSTR("ODDDEVICECOHORTTYPE_UNKNOWN");
    if (v10 == 1)
      v11 = CFSTR("ODDDEVICECOHORTTYPE_NONE");
    if (v10 == 2)
      v12 = CFSTR("ODDDEVICECOHORTTYPE_SIRI_HELP");
    else
      v12 = v11;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cohortType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDDeviceCohort dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDDeviceCohort)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDDeviceCohort *v5;
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
    self = -[ODDSiriSchemaODDDeviceCohort initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDDeviceCohort)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDDeviceCohort *v5;
  void *v6;
  ODDSiriSchemaODDTimeInterval *v7;
  void *v8;
  void *v9;
  ODDSiriSchemaODDDeviceCohort *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDDeviceCohort;
  v5 = -[ODDSiriSchemaODDDeviceCohort init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cohortInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDTimeInterval initWithDictionary:]([ODDSiriSchemaODDTimeInterval alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDDeviceCohort setCohortInterval:](v5, "setCohortInterval:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cohortType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceCohort setCohortType:](v5, "setCohortType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cohortDataAvailabilityState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceCohort setCohortDataAvailabilityState:](v5, "setCohortDataAvailabilityState:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDTimeInterval)cohortInterval
{
  return self->_cohortInterval;
}

- (void)setCohortInterval:(id)a3
{
  objc_storeStrong((id *)&self->_cohortInterval, a3);
}

- (int)cohortType
{
  return self->_cohortType;
}

- (int)cohortDataAvailabilityState
{
  return self->_cohortDataAvailabilityState;
}

- (void)setHasCohortInterval:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortInterval, 0);
}

@end
