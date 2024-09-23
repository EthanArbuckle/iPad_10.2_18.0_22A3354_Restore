@implementation USOSchemaUSOAsrAlternativeTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSOAsrAlternativeTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[USOSchemaUSOAsrAlternativeTier1 deleteAlternative](self, "deleteAlternative");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[USOSchemaUSOAsrAlternativeTier1 deleteAlternative](self, "deleteAlternative");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[USOSchemaUSOAsrAlternativeTier1 deleteAlternative](self, "deleteAlternative");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[USOSchemaUSOAsrAlternativeTier1 deleteAlternative](self, "deleteAlternative");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[USOSchemaUSOAsrAlternativeTier1 deleteAlternative](self, "deleteAlternative");

  return v5;
}

- (BOOL)hasAlternative
{
  return self->_alternative != 0;
}

- (void)deleteAlternative
{
  -[USOSchemaUSOAsrAlternativeTier1 setAlternative:](self, "setAlternative:", 0);
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
  -[USOSchemaUSOAsrAlternativeTier1 setProbability:](self, "setProbability:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return USOSchemaUSOAsrAlternativeTier1ReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[USOSchemaUSOAsrAlternativeTier1 alternative](self, "alternative");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  float probability;
  float v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[USOSchemaUSOAsrAlternativeTier1 alternative](self, "alternative");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternative");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[USOSchemaUSOAsrAlternativeTier1 alternative](self, "alternative");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[USOSchemaUSOAsrAlternativeTier1 alternative](self, "alternative");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alternative");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_11;
    }
    else
    {

    }
    if ((*(_BYTE *)&self->_has & 1) == (v4[20] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (probability = self->_probability, objc_msgSend(v4, "probability"), probability == v14))
      {
        v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {

  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  float probability;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_alternative, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    probability = self->_probability;
    v6 = probability;
    if (probability < 0.0)
      v6 = -probability;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alternative)
  {
    -[USOSchemaUSOAsrAlternativeTier1 alternative](self, "alternative");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alternative"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[USOSchemaUSOAsrAlternativeTier1 probability](self, "probability");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("probability"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOAsrAlternativeTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOAsrAlternativeTier1)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOAsrAlternativeTier1 *v5;
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
    self = -[USOSchemaUSOAsrAlternativeTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOAsrAlternativeTier1)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOAsrAlternativeTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  USOSchemaUSOAsrAlternativeTier1 *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)USOSchemaUSOAsrAlternativeTier1;
  v5 = -[USOSchemaUSOAsrAlternativeTier1 init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternative"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[USOSchemaUSOAsrAlternativeTier1 setAlternative:](v5, "setAlternative:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("probability"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[USOSchemaUSOAsrAlternativeTier1 setProbability:](v5, "setProbability:");
    }
    v9 = v5;

  }
  return v5;
}

- (NSString)alternative
{
  return self->_alternative;
}

- (void)setAlternative:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)probability
{
  return self->_probability;
}

- (void)setHasAlternative:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternative, 0);
}

@end
