@implementation PNROnDeviceProvisionalPNRIntervalDurationMetric

- (void)setMetricValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_metricValue = a3;
}

- (BOOL)hasMetricValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMetricValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMetricValue
{
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric setMetricValue:](self, "setMetricValue:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setStartTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startTimestamp = a3;
}

- (BOOL)hasStartTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteStartTimestamp
{
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric setStartTimestamp:](self, "setStartTimestamp:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasStartTimestampEventName
{
  return self->_startTimestampEventName != 0;
}

- (void)deleteStartTimestampEventName
{
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric setStartTimestampEventName:](self, "setStartTimestampEventName:", 0);
}

- (void)setEndTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endTimestamp = a3;
}

- (BOOL)hasEndTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEndTimestamp
{
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric setEndTimestamp:](self, "setEndTimestamp:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasEndTimestampEventName
{
  return self->_endTimestampEventName != 0;
}

- (void)deleteEndTimestampEventName
{
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric setEndTimestampEventName:](self, "setEndTimestampEventName:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPNRIntervalDurationMetricReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestampEventName](self, "startTimestampEventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestampEventName](self, "endTimestampEventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $0E3904E41AD40F9058634FC779834D22 has;
  unsigned int v6;
  double metricValue;
  double v8;
  int v9;
  int64_t startTimestamp;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int64_t endTimestamp;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    metricValue = self->_metricValue;
    objc_msgSend(v4, "metricValue");
    if (metricValue != v8)
      goto LABEL_22;
    has = self->_has;
    v6 = v4[48];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v9)
  {
    startTimestamp = self->_startTimestamp;
    if (startTimestamp != objc_msgSend(v4, "startTimestamp"))
      goto LABEL_22;
  }
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestampEventName](self, "startTimestampEventName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTimestampEventName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_21;
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestampEventName](self, "startTimestampEventName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestampEventName](self, "startTimestampEventName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTimestampEventName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_22;
  }
  else
  {

  }
  v18 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v18 != ((v4[48] >> 2) & 1))
    goto LABEL_22;
  if (v18)
  {
    endTimestamp = self->_endTimestamp;
    if (endTimestamp != objc_msgSend(v4, "endTimestamp"))
      goto LABEL_22;
  }
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestampEventName](self, "endTimestampEventName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTimestampEventName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) != (v12 != 0))
  {
    -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestampEventName](self, "endTimestampEventName");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_25:
      v25 = 1;
      goto LABEL_23;
    }
    v21 = (void *)v20;
    -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestampEventName](self, "endTimestampEventName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTimestampEventName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v25 = 0;
LABEL_23:

  return v25;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double metricValue;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    metricValue = self->_metricValue;
    v6 = -metricValue;
    if (metricValue >= 0.0)
      v6 = self->_metricValue;
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
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_startTimestamp;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_startTimestampEventName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_endTimestamp;
  else
    v11 = 0;
  return v9 ^ v4 ^ v11 ^ v10 ^ -[NSString hash](self->_endTimestampEventName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestamp](self, "endTimestamp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("endTimestamp"));

  }
  if (self->_endTimestampEventName)
  {
    -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestampEventName](self, "endTimestampEventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("endTimestampEventName"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[PNROnDeviceProvisionalPNRIntervalDurationMetric metricValue](self, "metricValue");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("metricValue"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestamp](self, "startTimestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("startTimestamp"));

  }
  if (self->_startTimestampEventName)
  {
    -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestampEventName](self, "startTimestampEventName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startTimestampEventName"));

  }
  -[PNROnDeviceProvisionalPNRIntervalDurationMetric willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNROnDeviceProvisionalPNRIntervalDurationMetric dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (PNROnDeviceProvisionalPNRIntervalDurationMetric)initWithJSON:(id)a3
{
  void *v4;
  PNROnDeviceProvisionalPNRIntervalDurationMetric *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[PNROnDeviceProvisionalPNRIntervalDurationMetric initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPNRIntervalDurationMetric)initWithDictionary:(id)a3
{
  id v4;
  PNROnDeviceProvisionalPNRIntervalDurationMetric *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PNROnDeviceProvisionalPNRIntervalDurationMetric *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PNROnDeviceProvisionalPNRIntervalDurationMetric;
  v5 = -[PNROnDeviceProvisionalPNRIntervalDurationMetric init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setMetricValue:](v5, "setMetricValue:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setStartTimestamp:](v5, "setStartTimestamp:", objc_msgSend(v7, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimestampEventName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setStartTimestampEventName:](v5, "setStartTimestampEventName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTimestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setEndTimestamp:](v5, "setEndTimestamp:", objc_msgSend(v10, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTimestampEventName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setEndTimestampEventName:](v5, "setEndTimestampEventName:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (double)metricValue
{
  return self->_metricValue;
}

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (NSString)startTimestampEventName
{
  return self->_startTimestampEventName;
}

- (void)setStartTimestampEventName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (NSString)endTimestampEventName
{
  return self->_endTimestampEventName;
}

- (void)setEndTimestampEventName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasStartTimestampEventName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasEndTimestampEventName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestampEventName, 0);
  objc_storeStrong((id *)&self->_startTimestampEventName, 0);
}

@end
