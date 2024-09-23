@implementation CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setProbability:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_probability = a3;
}

- (BOOL)hasProbability
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProbability:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProbability
{
  double v2;

  LODWORD(v2) = 0;
  -[CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded setProbability:](self, "setProbability:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return CLPInstSchemaCLPCurareAppIntentSampleClassificationEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  float probability;
  float v6;
  BOOL v7;

  v4 = a3;
  v7 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (probability = self->_probability, objc_msgSend(v4, "probability"), probability == v6))
      {
        v7 = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t result;
  float probability;
  double v4;
  long double v5;
  double v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
    return 0;
  probability = self->_probability;
  v4 = probability;
  if (probability < 0.0)
    v4 = -probability;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      result += (unint64_t)v6;
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded probability](self, "probability");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("probability"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded *v5;
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
    self = -[CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded *v5;
  void *v6;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded;
  v5 = -[CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("probability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[CLPInstSchemaCLPCurareAppIntentSampleClassificationEnded setProbability:](v5, "setProbability:");
    }
    v7 = v5;

  }
  return v5;
}

- (float)probability
{
  return self->_probability;
}

@end
