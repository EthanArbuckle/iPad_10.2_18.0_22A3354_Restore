@implementation MHSchemaMHSensorControlStatusReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSensorControlStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sensorControlStatus = a3;
}

- (BOOL)hasSensorControlStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSensorControlStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSensorControlStatus
{
  -[MHSchemaMHSensorControlStatusReported setSensorControlStatus:](self, "setSensorControlStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSensorControlStatusReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int sensorControlStatus;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (sensorControlStatus = self->_sensorControlStatus,
            sensorControlStatus == objc_msgSend(v4, "sensorControlStatus")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_sensorControlStatus;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[MHSchemaMHSensorControlStatusReported sensorControlStatus](self, "sensorControlStatus") - 1;
    if (v4 > 2)
      v5 = CFSTR("MHSENSORCONTROLSTATUS_UNKNOWN");
    else
      v5 = off_1E563C900[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sensorControlStatus"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHSensorControlStatusReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHSensorControlStatusReported)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHSensorControlStatusReported *v5;
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
    self = -[MHSchemaMHSensorControlStatusReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHSensorControlStatusReported)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHSensorControlStatusReported *v5;
  void *v6;
  MHSchemaMHSensorControlStatusReported *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHSensorControlStatusReported;
  v5 = -[MHSchemaMHSensorControlStatusReported init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sensorControlStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHSensorControlStatusReported setSensorControlStatus:](v5, "setSensorControlStatus:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)sensorControlStatus
{
  return self->_sensorControlStatus;
}

@end
