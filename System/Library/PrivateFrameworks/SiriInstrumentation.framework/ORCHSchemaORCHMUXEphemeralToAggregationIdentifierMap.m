@implementation ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap

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
  v16.super_class = (Class)ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deleteUserEphemeralId](self, "deleteUserEphemeralId");
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deleteUserAggregationId](self, "deleteUserAggregationId");
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deleteDeviceAggregationId](self, "deleteDeviceAggregationId");

  return v5;
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteUserEphemeralId
{
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserEphemeralId:](self, "setUserEphemeralId:", 0);
}

- (BOOL)hasUserAggregationId
{
  return self->_userAggregationId != 0;
}

- (void)deleteUserAggregationId
{
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationId:](self, "setUserAggregationId:", 0);
}

- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userAggregationIdRotationTimestampMs = a3;
}

- (BOOL)hasUserAggregationIdRotationTimestampMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUserAggregationIdRotationTimestampMs
{
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationIdRotationTimestampMs:](self, "setUserAggregationIdRotationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userAggregationIdExpirationTimestampMs = a3;
}

- (BOOL)hasUserAggregationIdExpirationTimestampMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUserAggregationIdExpirationTimestampMs
{
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationIdExpirationTimestampMs:](self, "setUserAggregationIdExpirationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasDeviceAggregationId
{
  return self->_deviceAggregationId != 0;
}

- (void)deleteDeviceAggregationId
{
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setDeviceAggregationId:](self, "setDeviceAggregationId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  $DBD19EE17EB715C058DA7D16A1F0D83B has;
  unsigned int v18;
  unint64_t userAggregationIdRotationTimestampMs;
  int v20;
  unint64_t userAggregationIdExpirationTimestampMs;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEphemeralId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_24;
  }
  else
  {

  }
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAggregationId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_24;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    userAggregationIdRotationTimestampMs = self->_userAggregationIdRotationTimestampMs;
    if (userAggregationIdRotationTimestampMs != objc_msgSend(v4, "userAggregationIdRotationTimestampMs"))
      goto LABEL_24;
    has = self->_has;
    v18 = v4[48];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_24;
  if (v20)
  {
    userAggregationIdExpirationTimestampMs = self->_userAggregationIdExpirationTimestampMs;
    if (userAggregationIdExpirationTimestampMs != objc_msgSend(v4, "userAggregationIdExpirationTimestampMs"))
      goto LABEL_24;
  }
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {

LABEL_27:
    v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceAggregationId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v27 = 0;
LABEL_25:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[SISchemaUUID hash](self->_userEphemeralId, "hash");
  v4 = -[SISchemaUUID hash](self->_userAggregationId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_userAggregationIdRotationTimestampMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_deviceAggregationId, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761u * self->_userAggregationIdExpirationTimestampMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_deviceAggregationId, "hash");
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
  char has;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceAggregationId)
  {
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceAggregationId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceAggregationId"));

    }
  }
  if (self->_userAggregationId)
  {
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("userAggregationId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("userAggregationId"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationIdExpirationTimestampMs](self, "userAggregationIdExpirationTimestampMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("userAggregationIdExpirationTimestampMs"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userAggregationIdRotationTimestampMs](self, "userAggregationIdRotationTimestampMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userAggregationIdRotationTimestampMs"));

  }
  if (self->_userEphemeralId)
  {
    -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userEphemeralId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userEphemeralId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *v5;
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
    self = -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaUUID *v13;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap;
  v5 = -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEphemeralId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserEphemeralId:](v5, "setUserEphemeralId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationId:](v5, "setUserAggregationId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationIdRotationTimestampMs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationIdRotationTimestampMs:](v5, "setUserAggregationIdRotationTimestampMs:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationIdExpirationTimestampMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setUserAggregationIdExpirationTimestampMs:](v5, "setUserAggregationIdExpirationTimestampMs:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceAggregationId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap setDeviceAggregationId:](v5, "setDeviceAggregationId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (void)setUserEphemeralId:(id)a3
{
  objc_storeStrong((id *)&self->_userEphemeralId, a3);
}

- (SISchemaUUID)userAggregationId
{
  return self->_userAggregationId;
}

- (void)setUserAggregationId:(id)a3
{
  objc_storeStrong((id *)&self->_userAggregationId, a3);
}

- (unint64_t)userAggregationIdRotationTimestampMs
{
  return self->_userAggregationIdRotationTimestampMs;
}

- (unint64_t)userAggregationIdExpirationTimestampMs
{
  return self->_userAggregationIdExpirationTimestampMs;
}

- (SISchemaUUID)deviceAggregationId
{
  return self->_deviceAggregationId;
}

- (void)setDeviceAggregationId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAggregationId, a3);
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUserAggregationId:(BOOL)a3
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
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
}

@end
