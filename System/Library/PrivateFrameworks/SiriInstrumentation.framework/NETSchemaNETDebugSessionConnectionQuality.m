@implementation NETSchemaNETDebugSessionConnectionQuality

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSymptomsCellularHistorical:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_symptomsCellularHistorical = a3;
}

- (BOOL)hasSymptomsCellularHistorical
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSymptomsCellularHistorical:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSymptomsCellularHistorical
{
  -[NETSchemaNETDebugSessionConnectionQuality setSymptomsCellularHistorical:](self, "setSymptomsCellularHistorical:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSymptomsCellularInstant:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_symptomsCellularInstant = a3;
}

- (BOOL)hasSymptomsCellularInstant
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSymptomsCellularInstant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSymptomsCellularInstant
{
  -[NETSchemaNETDebugSessionConnectionQuality setSymptomsCellularInstant:](self, "setSymptomsCellularInstant:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSymptomsWiFiHistorical:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_symptomsWiFiHistorical = a3;
}

- (BOOL)hasSymptomsWiFiHistorical
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSymptomsWiFiHistorical:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSymptomsWiFiHistorical
{
  -[NETSchemaNETDebugSessionConnectionQuality setSymptomsWiFiHistorical:](self, "setSymptomsWiFiHistorical:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setSymptomsWiFiInstant:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_symptomsWiFiInstant = a3;
}

- (BOOL)hasSymptomsWiFiInstant
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSymptomsWiFiInstant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteSymptomsWiFiInstant
{
  -[NETSchemaNETDebugSessionConnectionQuality setSymptomsWiFiInstant:](self, "setSymptomsWiFiInstant:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionQualityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1C39BD4F6CB9A54C5A986A3946D95EF5 has;
  unsigned int v6;
  int symptomsCellularHistorical;
  int v8;
  int symptomsCellularInstant;
  int v10;
  int symptomsWiFiHistorical;
  int v12;
  int symptomsWiFiInstant;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    symptomsCellularHistorical = self->_symptomsCellularHistorical;
    if (symptomsCellularHistorical != objc_msgSend(v4, "symptomsCellularHistorical"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    symptomsCellularInstant = self->_symptomsCellularInstant;
    if (symptomsCellularInstant != objc_msgSend(v4, "symptomsCellularInstant"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    symptomsWiFiHistorical = self->_symptomsWiFiHistorical;
    if (symptomsWiFiHistorical == objc_msgSend(v4, "symptomsWiFiHistorical"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    symptomsWiFiInstant = self->_symptomsWiFiInstant;
    if (symptomsWiFiInstant != objc_msgSend(v4, "symptomsWiFiInstant"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_symptomsCellularHistorical;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_symptomsCellularInstant;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_symptomsWiFiHistorical;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_symptomsWiFiInstant;
  return v3 ^ v2 ^ v4 ^ v5;
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
  unsigned int v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[NETSchemaNETDebugSessionConnectionQuality symptomsCellularHistorical](self, "symptomsCellularHistorical") - 1;
    if (v5 > 2)
      v6 = CFSTR("NETQUALITY_UNKNOWN");
    else
      v6 = off_1E56316F0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("symptomsCellularHistorical"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[NETSchemaNETDebugSessionConnectionQuality symptomsCellularInstant](self, "symptomsCellularInstant") - 1;
  if (v7 > 2)
    v8 = CFSTR("NETQUALITY_UNKNOWN");
  else
    v8 = off_1E56316F0[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("symptomsCellularInstant"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_22;
    goto LABEL_18;
  }
LABEL_14:
  v9 = -[NETSchemaNETDebugSessionConnectionQuality symptomsWiFiHistorical](self, "symptomsWiFiHistorical") - 1;
  if (v9 > 2)
    v10 = CFSTR("NETQUALITY_UNKNOWN");
  else
    v10 = off_1E56316F0[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("symptomsWiFiHistorical"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_18:
    v11 = -[NETSchemaNETDebugSessionConnectionQuality symptomsWiFiInstant](self, "symptomsWiFiInstant") - 1;
    if (v11 > 2)
      v12 = CFSTR("NETQUALITY_UNKNOWN");
    else
      v12 = off_1E56316F0[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("symptomsWiFiInstant"));
  }
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugSessionConnectionQuality dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETDebugSessionConnectionQuality)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugSessionConnectionQuality *v5;
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
    self = -[NETSchemaNETDebugSessionConnectionQuality initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugSessionConnectionQuality)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugSessionConnectionQuality *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NETSchemaNETDebugSessionConnectionQuality *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETDebugSessionConnectionQuality;
  v5 = -[NETSchemaNETDebugSessionConnectionQuality init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symptomsCellularHistorical"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsCellularHistorical:](v5, "setSymptomsCellularHistorical:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symptomsCellularInstant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsCellularInstant:](v5, "setSymptomsCellularInstant:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symptomsWiFiHistorical"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsWiFiHistorical:](v5, "setSymptomsWiFiHistorical:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symptomsWiFiInstant"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsWiFiInstant:](v5, "setSymptomsWiFiInstant:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int)symptomsCellularHistorical
{
  return self->_symptomsCellularHistorical;
}

- (int)symptomsCellularInstant
{
  return self->_symptomsCellularInstant;
}

- (int)symptomsWiFiHistorical
{
  return self->_symptomsWiFiHistorical;
}

- (int)symptomsWiFiInstant
{
  return self->_symptomsWiFiInstant;
}

@end
