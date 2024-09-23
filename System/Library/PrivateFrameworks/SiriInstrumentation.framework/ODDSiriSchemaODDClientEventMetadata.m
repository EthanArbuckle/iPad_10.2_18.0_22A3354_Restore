@implementation ODDSiriSchemaODDClientEventMetadata

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
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODDSiriSchemaODDClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDClientEventMetadata deleteOddId](self, "deleteOddId");
  -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDClientEventMetadata deleteAggregationInterval](self, "deleteAggregationInterval");
  -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDClientEventMetadata deleteDeviceAggregationId](self, "deleteDeviceAggregationId");

  return v5;
}

- (BOOL)hasOddId
{
  return self->_oddId != 0;
}

- (void)deleteOddId
{
  -[ODDSiriSchemaODDClientEventMetadata setOddId:](self, "setOddId:", 0);
}

- (void)setEventTimestampInMsSince1970:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventTimestampInMsSince1970 = a3;
}

- (BOOL)hasEventTimestampInMsSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventTimestampInMsSince1970
{
  -[ODDSiriSchemaODDClientEventMetadata setEventTimestampInMsSince1970:](self, "setEventTimestampInMsSince1970:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAggregationInterval
{
  return self->_aggregationInterval != 0;
}

- (void)deleteAggregationInterval
{
  -[ODDSiriSchemaODDClientEventMetadata setAggregationInterval:](self, "setAggregationInterval:", 0);
}

- (BOOL)hasDeviceAggregationId
{
  return self->_deviceAggregationId != 0;
}

- (void)deleteDeviceAggregationId
{
  -[ODDSiriSchemaODDClientEventMetadata setDeviceAggregationId:](self, "setDeviceAggregationId:", 0);
}

- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userAggregationIdRotationTimestampMs = a3;
}

- (BOOL)hasUserAggregationIdRotationTimestampMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUserAggregationIdRotationTimestampMs
{
  -[ODDSiriSchemaODDClientEventMetadata setUserAggregationIdRotationTimestampMs:](self, "setUserAggregationIdRotationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userAggregationIdExpirationTimestampMs = a3;
}

- (BOOL)hasUserAggregationIdExpirationTimestampMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteUserAggregationIdExpirationTimestampMs
{
  -[ODDSiriSchemaODDClientEventMetadata setUserAggregationIdExpirationTimestampMs:](self, "setUserAggregationIdExpirationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  id v12;

  v12 = a3;
  -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  v11 = v12;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v11 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t eventTimestampInMsSince1970;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  $36CD028B83635B9499CC517BEB088AD4 has;
  int v26;
  unsigned int v27;
  unint64_t userAggregationIdRotationTimestampMs;
  int v29;
  unint64_t userAggregationIdExpirationTimestampMs;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oddId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oddId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970;
    if (eventTimestampInMsSince1970 != objc_msgSend(v4, "eventTimestampInMsSince1970"))
      goto LABEL_20;
  }
  -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregationInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aggregationInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceAggregationId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v26 = (*(unsigned int *)&has >> 1) & 1;
  v27 = v4[56];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      userAggregationIdRotationTimestampMs = self->_userAggregationIdRotationTimestampMs;
      if (userAggregationIdRotationTimestampMs != objc_msgSend(v4, "userAggregationIdRotationTimestampMs"))
        goto LABEL_20;
      has = self->_has;
      v27 = v4[56];
    }
    v29 = (*(unsigned int *)&has >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (userAggregationIdExpirationTimestampMs = self->_userAggregationIdExpirationTimestampMs,
            userAggregationIdExpirationTimestampMs == objc_msgSend(v4, "userAggregationIdExpirationTimestampMs")))
      {
        v23 = 1;
        goto LABEL_21;
      }
    }
  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaUUID hash](self->_oddId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_eventTimestampInMsSince1970;
  else
    v4 = 0;
  v5 = -[ODDSiriSchemaODDTimeInterval hash](self->_aggregationInterval, "hash");
  v6 = -[SISchemaUUID hash](self->_deviceAggregationId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761u * self->_userAggregationIdRotationTimestampMs;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761u * self->_userAggregationIdExpirationTimestampMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char has;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aggregationInterval)
  {
    -[ODDSiriSchemaODDClientEventMetadata aggregationInterval](self, "aggregationInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aggregationInterval"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aggregationInterval"));

    }
  }
  if (self->_deviceAggregationId)
  {
    -[ODDSiriSchemaODDClientEventMetadata deviceAggregationId](self, "deviceAggregationId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceAggregationId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceAggregationId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDClientEventMetadata eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("eventTimestampInMsSince1970"));

  }
  if (self->_oddId)
  {
    -[ODDSiriSchemaODDClientEventMetadata oddId](self, "oddId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("oddId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("oddId"));

    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDClientEventMetadata userAggregationIdExpirationTimestampMs](self, "userAggregationIdExpirationTimestampMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userAggregationIdExpirationTimestampMs"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDClientEventMetadata userAggregationIdRotationTimestampMs](self, "userAggregationIdRotationTimestampMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("userAggregationIdRotationTimestampMs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDClientEventMetadata *v5;
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
    self = -[ODDSiriSchemaODDClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  ODDSiriSchemaODDTimeInterval *v10;
  void *v11;
  SISchemaUUID *v12;
  void *v13;
  void *v14;
  ODDSiriSchemaODDClientEventMetadata *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDClientEventMetadata;
  v5 = -[ODDSiriSchemaODDClientEventMetadata init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("oddId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDClientEventMetadata setOddId:](v5, "setOddId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTimestampInMsSince1970"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDClientEventMetadata setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationInterval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[ODDSiriSchemaODDTimeInterval initWithDictionary:]([ODDSiriSchemaODDTimeInterval alloc], "initWithDictionary:", v9);
      -[ODDSiriSchemaODDClientEventMetadata setAggregationInterval:](v5, "setAggregationInterval:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceAggregationId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[ODDSiriSchemaODDClientEventMetadata setDeviceAggregationId:](v5, "setDeviceAggregationId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationIdRotationTimestampMs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDClientEventMetadata setUserAggregationIdRotationTimestampMs:](v5, "setUserAggregationIdRotationTimestampMs:", objc_msgSend(v13, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationIdExpirationTimestampMs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDClientEventMetadata setUserAggregationIdExpirationTimestampMs:](v5, "setUserAggregationIdExpirationTimestampMs:", objc_msgSend(v14, "unsignedLongLongValue"));
    v15 = v5;

  }
  return v5;
}

- (SISchemaUUID)oddId
{
  return self->_oddId;
}

- (void)setOddId:(id)a3
{
  objc_storeStrong((id *)&self->_oddId, a3);
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (ODDSiriSchemaODDTimeInterval)aggregationInterval
{
  return self->_aggregationInterval;
}

- (void)setAggregationInterval:(id)a3
{
  objc_storeStrong((id *)&self->_aggregationInterval, a3);
}

- (SISchemaUUID)deviceAggregationId
{
  return self->_deviceAggregationId;
}

- (void)setDeviceAggregationId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAggregationId, a3);
}

- (unint64_t)userAggregationIdRotationTimestampMs
{
  return self->_userAggregationIdRotationTimestampMs;
}

- (unint64_t)userAggregationIdExpirationTimestampMs
{
  return self->_userAggregationIdExpirationTimestampMs;
}

- (void)setHasOddId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAggregationInterval:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasDeviceAggregationId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
  objc_storeStrong((id *)&self->_aggregationInterval, 0);
  objc_storeStrong((id *)&self->_oddId, 0);
}

@end
