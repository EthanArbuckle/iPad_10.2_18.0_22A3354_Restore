@implementation DonationSchemaSDSpeechDonationEventMetaData

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DonationSchemaSDSpeechDonationEventMetaData;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[DonationSchemaSDSpeechDonationEventMetaData deleteSdId](self, "deleteSdId");
  return v5;
}

- (BOOL)hasSdId
{
  return self->_sdId != 0;
}

- (void)deleteSdId
{
  -[DonationSchemaSDSpeechDonationEventMetaData setSdId:](self, "setSdId:", 0);
}

- (void)setDeviceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceType = a3;
}

- (BOOL)hasDeviceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDeviceType
{
  -[DonationSchemaSDSpeechDonationEventMetaData setDeviceType:](self, "setDeviceType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[DonationSchemaSDSpeechDonationEventMetaData setSystemBuild:](self, "setSystemBuild:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return DonationSchemaSDSpeechDonationEventMetaDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[DonationSchemaSDSpeechDonationEventMetaData systemBuild](self, "systemBuild");
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
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int deviceType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sdId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sdId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    deviceType = self->_deviceType;
    if (deviceType != objc_msgSend(v4, "deviceType"))
      goto LABEL_15;
  }
  -[DonationSchemaSDSpeechDonationEventMetaData systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[DonationSchemaSDSpeechDonationEventMetaData systemBuild](self, "systemBuild");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[DonationSchemaSDSpeechDonationEventMetaData systemBuild](self, "systemBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_sdId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_deviceType;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_systemBuild, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[DonationSchemaSDSpeechDonationEventMetaData deviceType](self, "deviceType") - 1;
    if (v4 > 7)
      v5 = CFSTR("DEVICEFAMILY_UNKNOWN");
    else
      v5 = off_1E563C4E0[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceType"));
  }
  if (self->_sdId)
  {
    -[DonationSchemaSDSpeechDonationEventMetaData sdId](self, "sdId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sdId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sdId"));

    }
  }
  if (self->_systemBuild)
  {
    -[DonationSchemaSDSpeechDonationEventMetaData systemBuild](self, "systemBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("systemBuild"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DonationSchemaSDSpeechDonationEventMetaData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DonationSchemaSDSpeechDonationEventMetaData)initWithJSON:(id)a3
{
  void *v4;
  DonationSchemaSDSpeechDonationEventMetaData *v5;
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
    self = -[DonationSchemaSDSpeechDonationEventMetaData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DonationSchemaSDSpeechDonationEventMetaData)initWithDictionary:(id)a3
{
  id v4;
  DonationSchemaSDSpeechDonationEventMetaData *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  DonationSchemaSDSpeechDonationEventMetaData *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DonationSchemaSDSpeechDonationEventMetaData;
  v5 = -[DonationSchemaSDSpeechDonationEventMetaData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sdId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DonationSchemaSDSpeechDonationEventMetaData setSdId:](v5, "setSdId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DonationSchemaSDSpeechDonationEventMetaData setDeviceType:](v5, "setDeviceType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[DonationSchemaSDSpeechDonationEventMetaData setSystemBuild:](v5, "setSystemBuild:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)sdId
{
  return self->_sdId;
}

- (void)setSdId:(id)a3
{
  objc_storeStrong((id *)&self->_sdId, a3);
}

- (int)deviceType
{
  return self->_deviceType;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasSdId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_sdId, 0);
}

@end
