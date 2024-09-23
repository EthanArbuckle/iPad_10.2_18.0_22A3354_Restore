@implementation DIMSchemaDIMEphemeralToAggregationIdentifierMap

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DIMSchemaDIMEphemeralToAggregationIdentifierMap;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deleteUserEphemeralId](self, "deleteUserEphemeralId");
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deleteUserAggregationId](self, "deleteUserAggregationId");
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deleteDeviceAggregationId](self, "deleteDeviceAggregationId");
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deleteUserSamplingId](self, "deleteUserSamplingId");

  return v5;
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteUserEphemeralId
{
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserEphemeralId:](self, "setUserEphemeralId:", 0);
}

- (BOOL)hasUserAggregationId
{
  return self->_userAggregationId != 0;
}

- (void)deleteUserAggregationId
{
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationId:](self, "setUserAggregationId:", 0);
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
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationIdRotationTimestampMs:](self, "setUserAggregationIdRotationTimestampMs:", 0);
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
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationIdExpirationTimestampMs:](self, "setUserAggregationIdExpirationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasDeviceAggregationId
{
  return self->_deviceAggregationId != 0;
}

- (void)deleteDeviceAggregationId
{
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setDeviceAggregationId:](self, "setDeviceAggregationId:", 0);
}

- (BOOL)hasUserSamplingId
{
  return self->_userSamplingId != 0;
}

- (void)deleteUserSamplingId
{
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingId:](self, "setUserSamplingId:", 0);
}

- (void)setUserSamplingIdRotationTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userSamplingIdRotationTimestampMs = a3;
}

- (BOOL)hasUserSamplingIdRotationTimestampMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasUserSamplingIdRotationTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteUserSamplingIdRotationTimestampMs
{
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingIdRotationTimestampMs:](self, "setUserSamplingIdRotationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setUserSamplingIdExpirationTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userSamplingIdExpirationTimestampMs = a3;
}

- (BOOL)hasUserSamplingIdExpirationTimestampMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasUserSamplingIdExpirationTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteUserSamplingIdExpirationTimestampMs
{
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingIdExpirationTimestampMs:](self, "setUserSamplingIdExpirationTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMEphemeralToAggregationIdentifierMapReadFrom(self, (uint64_t)a3);
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
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
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
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v13 = (char)self->_has;
  }
  v14 = v15;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v14 = v15;
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
  $A43B0B0B3A7EF5FDA9C5377DBC124AA6 has;
  unsigned int v18;
  unint64_t userAggregationIdRotationTimestampMs;
  int v20;
  unint64_t userAggregationIdExpirationTimestampMs;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  $A43B0B0B3A7EF5FDA9C5377DBC124AA6 v34;
  int v35;
  unsigned int v36;
  unint64_t userSamplingIdRotationTimestampMs;
  int v38;
  unint64_t userSamplingIdExpirationTimestampMs;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEphemeralId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAggregationId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    userAggregationIdRotationTimestampMs = self->_userAggregationIdRotationTimestampMs;
    if (userAggregationIdRotationTimestampMs != objc_msgSend(v4, "userAggregationIdRotationTimestampMs"))
      goto LABEL_29;
    has = self->_has;
    v18 = v4[72];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_29;
  if (v20)
  {
    userAggregationIdExpirationTimestampMs = self->_userAggregationIdExpirationTimestampMs;
    if (userAggregationIdExpirationTimestampMs != objc_msgSend(v4, "userAggregationIdExpirationTimestampMs"))
      goto LABEL_29;
  }
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceAggregationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceAggregationId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_29;
  }
  else
  {

  }
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSamplingId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSamplingId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_29;
  }
  else
  {

  }
  v34 = self->_has;
  v35 = (*(unsigned int *)&v34 >> 2) & 1;
  v36 = v4[72];
  if (v35 == ((v36 >> 2) & 1))
  {
    if (v35)
    {
      userSamplingIdRotationTimestampMs = self->_userSamplingIdRotationTimestampMs;
      if (userSamplingIdRotationTimestampMs != objc_msgSend(v4, "userSamplingIdRotationTimestampMs"))
        goto LABEL_29;
      v34 = self->_has;
      v36 = v4[72];
    }
    v38 = (*(unsigned int *)&v34 >> 3) & 1;
    if (v38 == ((v36 >> 3) & 1))
    {
      if (!v38
        || (userSamplingIdExpirationTimestampMs = self->_userSamplingIdExpirationTimestampMs,
            userSamplingIdExpirationTimestampMs == objc_msgSend(v4, "userSamplingIdExpirationTimestampMs")))
      {
        v32 = 1;
        goto LABEL_30;
      }
    }
  }
LABEL_29:
  v32 = 0;
LABEL_30:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[SISchemaUUID hash](self->_userEphemeralId, "hash");
  v4 = -[SISchemaUUID hash](self->_userAggregationId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_userAggregationIdRotationTimestampMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761u * self->_userAggregationIdExpirationTimestampMs;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[SISchemaUUID hash](self->_deviceAggregationId, "hash");
  v8 = -[SISchemaUUID hash](self->_userSamplingId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v9 = 2654435761u * self->_userSamplingIdRotationTimestampMs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v10 = 2654435761u * self->_userSamplingIdExpirationTimestampMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceAggregationId)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap deviceAggregationId](self, "deviceAggregationId");
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
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationId](self, "userAggregationId");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationIdExpirationTimestampMs](self, "userAggregationIdExpirationTimestampMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("userAggregationIdExpirationTimestampMs"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userAggregationIdRotationTimestampMs](self, "userAggregationIdRotationTimestampMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userAggregationIdRotationTimestampMs"));

  }
  if (self->_userEphemeralId)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userEphemeralId](self, "userEphemeralId");
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
  if (self->_userSamplingId)
  {
    -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingId](self, "userSamplingId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("userSamplingId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("userSamplingId"));

    }
  }
  v19 = (char)self->_has;
  if ((v19 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingIdExpirationTimestampMs](self, "userSamplingIdExpirationTimestampMs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("userSamplingIdExpirationTimestampMs"));

    v19 = (char)self->_has;
  }
  if ((v19 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralToAggregationIdentifierMap userSamplingIdRotationTimestampMs](self, "userSamplingIdRotationTimestampMs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("userSamplingIdRotationTimestampMs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaDIMEphemeralToAggregationIdentifierMap dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *v5;
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
    self = -[DIMSchemaDIMEphemeralToAggregationIdentifierMap initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  SISchemaUUID *v15;
  void *v16;
  void *v17;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIMSchemaDIMEphemeralToAggregationIdentifierMap;
  v5 = -[DIMSchemaDIMEphemeralToAggregationIdentifierMap init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEphemeralId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserEphemeralId:](v5, "setUserEphemeralId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationId:](v5, "setUserAggregationId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationIdRotationTimestampMs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationIdRotationTimestampMs:](v5, "setUserAggregationIdRotationTimestampMs:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAggregationIdExpirationTimestampMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserAggregationIdExpirationTimestampMs:](v5, "setUserAggregationIdExpirationTimestampMs:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceAggregationId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setDeviceAggregationId:](v5, "setDeviceAggregationId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSamplingId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingId:](v5, "setUserSamplingId:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSamplingIdRotationTimestampMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingIdRotationTimestampMs:](v5, "setUserSamplingIdRotationTimestampMs:", objc_msgSend(v16, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSamplingIdExpirationTimestampMs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMEphemeralToAggregationIdentifierMap setUserSamplingIdExpirationTimestampMs:](v5, "setUserSamplingIdExpirationTimestampMs:", objc_msgSend(v17, "unsignedLongLongValue"));
    v18 = v5;

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

- (SISchemaUUID)userSamplingId
{
  return self->_userSamplingId;
}

- (void)setUserSamplingId:(id)a3
{
  objc_storeStrong((id *)&self->_userSamplingId, a3);
}

- (unint64_t)userSamplingIdRotationTimestampMs
{
  return self->_userSamplingIdRotationTimestampMs;
}

- (unint64_t)userSamplingIdExpirationTimestampMs
{
  return self->_userSamplingIdExpirationTimestampMs;
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

- (void)setHasUserSamplingId:(BOOL)a3
{
  self->_hasUserEphemeralId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSamplingId, 0);
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
}

@end
