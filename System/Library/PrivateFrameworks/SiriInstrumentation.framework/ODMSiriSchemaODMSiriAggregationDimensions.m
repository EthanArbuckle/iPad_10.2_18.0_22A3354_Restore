@implementation ODMSiriSchemaODMSiriAggregationDimensions

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
  v9.super_class = (Class)ODMSiriSchemaODMSiriAggregationDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODMSiriSchemaODMSiriAggregationDimensions deleteSiriInputLocale](self, "deleteSiriInputLocale");
  return v5;
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteSiriInputLocale
{
  -[ODMSiriSchemaODMSiriAggregationDimensions setSiriInputLocale:](self, "setSiriInputLocale:", 0);
}

- (void)setAggregationIntervalInDays:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aggregationIntervalInDays = a3;
}

- (BOOL)hasAggregationIntervalInDays
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAggregationIntervalInDays:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAggregationIntervalInDays
{
  -[ODMSiriSchemaODMSiriAggregationDimensions setAggregationIntervalInDays:](self, "setAggregationIntervalInDays:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAggregationIntervalStartTimestampInSecondsSince2001:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_aggregationIntervalStartTimestampInSecondsSince2001 = a3;
}

- (BOOL)hasAggregationIntervalStartTimestampInSecondsSince2001
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAggregationIntervalStartTimestampInSecondsSince2001:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAggregationIntervalStartTimestampInSecondsSince2001
{
  -[ODMSiriSchemaODMSiriAggregationDimensions setAggregationIntervalStartTimestampInSecondsSince2001:](self, "setAggregationIntervalStartTimestampInSecondsSince2001:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriAggregationDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
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
  $DD605746C9C0117442BEAFDA18497874 has;
  unsigned int v14;
  unsigned int aggregationIntervalInDays;
  int v16;
  double aggregationIntervalStartTimestampInSecondsSince2001;
  double v18;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "siriInputLocale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_15;
    }
    else
    {

    }
    has = self->_has;
    v14 = v4[32];
    if ((*(_BYTE *)&has & 1) == (v14 & 1))
    {
      if ((*(_BYTE *)&has & 1) != 0)
      {
        aggregationIntervalInDays = self->_aggregationIntervalInDays;
        if (aggregationIntervalInDays != objc_msgSend(v4, "aggregationIntervalInDays"))
          goto LABEL_15;
        has = self->_has;
        v14 = v4[32];
      }
      v16 = (*(unsigned int *)&has >> 1) & 1;
      if (v16 == ((v14 >> 1) & 1))
      {
        if (!v16
          || (aggregationIntervalStartTimestampInSecondsSince2001 = self->_aggregationIntervalStartTimestampInSecondsSince2001,
              objc_msgSend(v4, "aggregationIntervalStartTimestampInSecondsSince2001"),
              aggregationIntervalStartTimestampInSecondsSince2001 == v18))
        {
          v19 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {

  }
LABEL_15:
  v19 = 0;
LABEL_16:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double aggregationIntervalStartTimestampInSecondsSince2001;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[SISchemaISOLocale hash](self->_siriInputLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_aggregationIntervalInDays;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  aggregationIntervalStartTimestampInSecondsSince2001 = self->_aggregationIntervalStartTimestampInSecondsSince2001;
  v6 = -aggregationIntervalStartTimestampInSecondsSince2001;
  if (aggregationIntervalStartTimestampInSecondsSince2001 >= 0.0)
    v6 = self->_aggregationIntervalStartTimestampInSecondsSince2001;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriAggregationDimensions aggregationIntervalInDays](self, "aggregationIntervalInDays"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aggregationIntervalInDays"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[ODMSiriSchemaODMSiriAggregationDimensions aggregationIntervalStartTimestampInSecondsSince2001](self, "aggregationIntervalStartTimestampInSecondsSince2001");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aggregationIntervalStartTimestampInSecondsSince2001"));

  }
  if (self->_siriInputLocale)
  {
    -[ODMSiriSchemaODMSiriAggregationDimensions siriInputLocale](self, "siriInputLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriInputLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("siriInputLocale"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriAggregationDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriAggregationDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriAggregationDimensions *v5;
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
    self = -[ODMSiriSchemaODMSiriAggregationDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriAggregationDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriAggregationDimensions *v5;
  void *v6;
  SISchemaISOLocale *v7;
  void *v8;
  void *v9;
  ODMSiriSchemaODMSiriAggregationDimensions *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriAggregationDimensions;
  v5 = -[ODMSiriSchemaODMSiriAggregationDimensions init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriAggregationDimensions setSiriInputLocale:](v5, "setSiriInputLocale:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationIntervalInDays"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriAggregationDimensions setAggregationIntervalInDays:](v5, "setAggregationIntervalInDays:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationIntervalStartTimestampInSecondsSince2001"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[ODMSiriSchemaODMSiriAggregationDimensions setAggregationIntervalStartTimestampInSecondsSince2001:](v5, "setAggregationIntervalStartTimestampInSecondsSince2001:");
    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setSiriInputLocale:(id)a3
{
  objc_storeStrong((id *)&self->_siriInputLocale, a3);
}

- (unsigned)aggregationIntervalInDays
{
  return self->_aggregationIntervalInDays;
}

- (double)aggregationIntervalStartTimestampInSecondsSince2001
{
  return self->_aggregationIntervalStartTimestampInSecondsSince2001;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
}

@end
