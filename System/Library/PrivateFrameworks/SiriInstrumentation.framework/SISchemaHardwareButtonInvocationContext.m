@implementation SISchemaHardwareButtonInvocationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHardwareButtonLongPressBehavior:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hardwareButtonLongPressBehavior = a3;
}

- (BOOL)hasHardwareButtonLongPressBehavior
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHardwareButtonLongPressBehavior:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHardwareButtonLongPressBehavior
{
  -[SISchemaHardwareButtonInvocationContext setHardwareButtonLongPressBehavior:](self, "setHardwareButtonLongPressBehavior:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHardwareButtonActivationThresholdInSec:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hardwareButtonActivationThresholdInSec = a3;
}

- (BOOL)hasHardwareButtonActivationThresholdInSec
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHardwareButtonActivationThresholdInSec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHardwareButtonActivationThresholdInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[SISchemaHardwareButtonInvocationContext setHardwareButtonActivationThresholdInSec:](self, "setHardwareButtonActivationThresholdInSec:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return SISchemaHardwareButtonInvocationContextReadFrom(self, (uint64_t)a3, v3);
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
  $74EDE333D1A56CDE9A612C359051CBBC has;
  unsigned int v6;
  int hardwareButtonLongPressBehavior;
  int v8;
  float hardwareButtonActivationThresholdInSec;
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
    hardwareButtonLongPressBehavior = self->_hardwareButtonLongPressBehavior;
    if (hardwareButtonLongPressBehavior != objc_msgSend(v4, "hardwareButtonLongPressBehavior"))
      goto LABEL_9;
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (hardwareButtonActivationThresholdInSec = self->_hardwareButtonActivationThresholdInSec,
          objc_msgSend(v4, "hardwareButtonActivationThresholdInSec"),
          hardwareButtonActivationThresholdInSec == v10))
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
  float hardwareButtonActivationThresholdInSec;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_hardwareButtonLongPressBehavior;
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
  hardwareButtonActivationThresholdInSec = self->_hardwareButtonActivationThresholdInSec;
  v4 = hardwareButtonActivationThresholdInSec;
  if (hardwareButtonActivationThresholdInSec < 0.0)
    v4 = -hardwareButtonActivationThresholdInSec;
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
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaHardwareButtonInvocationContext hardwareButtonActivationThresholdInSec](self, "hardwareButtonActivationThresholdInSec");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hardwareButtonActivationThresholdInSec"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[SISchemaHardwareButtonInvocationContext hardwareButtonLongPressBehavior](self, "hardwareButtonLongPressBehavior")- 1;
    if (v7 > 2)
      v8 = CFSTR("SIRIHARDWAREBUTTONLONGPRESSBEHAVIOR_UNKNOWN");
    else
      v8 = off_1E56359E8[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hardwareButtonLongPressBehavior"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaHardwareButtonInvocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaHardwareButtonInvocationContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaHardwareButtonInvocationContext *v5;
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
    self = -[SISchemaHardwareButtonInvocationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaHardwareButtonInvocationContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaHardwareButtonInvocationContext *v5;
  void *v6;
  void *v7;
  SISchemaHardwareButtonInvocationContext *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaHardwareButtonInvocationContext;
  v5 = -[SISchemaHardwareButtonInvocationContext init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareButtonLongPressBehavior"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaHardwareButtonInvocationContext setHardwareButtonLongPressBehavior:](v5, "setHardwareButtonLongPressBehavior:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareButtonActivationThresholdInSec"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[SISchemaHardwareButtonInvocationContext setHardwareButtonActivationThresholdInSec:](v5, "setHardwareButtonActivationThresholdInSec:");
    }
    v8 = v5;

  }
  return v5;
}

- (int)hardwareButtonLongPressBehavior
{
  return self->_hardwareButtonLongPressBehavior;
}

- (float)hardwareButtonActivationThresholdInSec
{
  return self->_hardwareButtonActivationThresholdInSec;
}

@end
