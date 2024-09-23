@implementation PLUSSchemaPLUSRECTIFIPatternConstraint

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setConstraintType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_constraintType = a3;
}

- (BOOL)hasConstraintType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConstraintType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteConstraintType
{
  -[PLUSSchemaPLUSRECTIFIPatternConstraint setConstraintType:](self, "setConstraintType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConstraintValue:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_constraintValue = a3;
}

- (BOOL)hasConstraintValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConstraintValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConstraintValue
{
  double v2;

  LODWORD(v2) = 0;
  -[PLUSSchemaPLUSRECTIFIPatternConstraint setConstraintValue:](self, "setConstraintValue:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return PLUSSchemaPLUSRECTIFIPatternConstraintReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $BDB5CAD5ED013E22AC66059FD456E3CC has;
  unsigned int v6;
  int constraintType;
  int v8;
  float constraintValue;
  float v10;
  BOOL v11;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_9;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    constraintType = self->_constraintType;
    if (constraintType != objc_msgSend(v4, "constraintType"))
      goto LABEL_9;
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (constraintValue = self->_constraintValue, objc_msgSend(v4, "constraintValue"), constraintValue == v10))
    {
      v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  float constraintValue;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_constraintType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    return v7 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  constraintValue = self->_constraintValue;
  v4 = constraintValue;
  if (constraintValue < 0.0)
    v4 = -constraintValue;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[PLUSSchemaPLUSRECTIFIPatternConstraint constraintType](self, "constraintType");
    v6 = CFSTR("PLUSRECTIFIPATTERNCONSTRAINTTYPE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("PLUSRECTIFIPATTERNCONSTRAINTTYPE_ENTITY_SIMILARITY");
    if (v5 == 2)
      v7 = CFSTR("PLUSRECTIFIPATTERNCONSTRAINTTYPE_SUPPORT_THRESHOLD");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("constraintType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[PLUSSchemaPLUSRECTIFIPatternConstraint constraintValue](self, "constraintValue");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("constraintValue"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSRECTIFIPatternConstraint dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSRECTIFIPatternConstraint)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSRECTIFIPatternConstraint *v5;
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
    self = -[PLUSSchemaPLUSRECTIFIPatternConstraint initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSRECTIFIPatternConstraint)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSRECTIFIPatternConstraint *v5;
  void *v6;
  void *v7;
  PLUSSchemaPLUSRECTIFIPatternConstraint *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternConstraint;
  v5 = -[PLUSSchemaPLUSRECTIFIPatternConstraint init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("constraintType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSRECTIFIPatternConstraint setConstraintType:](v5, "setConstraintType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("constraintValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[PLUSSchemaPLUSRECTIFIPatternConstraint setConstraintValue:](v5, "setConstraintValue:");
    }
    v8 = v5;

  }
  return v5;
}

- (int)constraintType
{
  return self->_constraintType;
}

- (float)constraintValue
{
  return self->_constraintValue;
}

@end
