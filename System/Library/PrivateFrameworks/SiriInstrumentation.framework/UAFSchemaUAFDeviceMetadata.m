@implementation UAFSchemaUAFDeviceMetadata

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
  v9.super_class = (Class)UAFSchemaUAFDeviceMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[UAFSchemaUAFDeviceMetadata deleteDeviceId](self, "deleteDeviceId");
  return v5;
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

- (void)deleteDeviceId
{
  -[UAFSchemaUAFDeviceMetadata setDeviceId:](self, "setDeviceId:", 0);
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceType
{
  -[UAFSchemaUAFDeviceMetadata setDeviceType:](self, "setDeviceType:", 0);
}

- (void)setProgramCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_programCode = a3;
}

- (BOOL)hasProgramCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProgramCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProgramCode
{
  -[UAFSchemaUAFDeviceMetadata setProgramCode:](self, "setProgramCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[UAFSchemaUAFDeviceMetadata setSystemBuild:](self, "setSystemBuild:", 0);
}

- (void)setInputLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_inputLocale = a3;
}

- (BOOL)hasInputLocale
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasInputLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteInputLocale
{
  -[UAFSchemaUAFDeviceMetadata setInputLocale:](self, "setInputLocale:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNanoSecondsSinceLastBoot:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nanoSecondsSinceLastBoot = a3;
}

- (BOOL)hasNanoSecondsSinceLastBoot
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNanoSecondsSinceLastBoot:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNanoSecondsSinceLastBoot
{
  -[UAFSchemaUAFDeviceMetadata setNanoSecondsSinceLastBoot:](self, "setNanoSecondsSinceLastBoot:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFDeviceMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  id v10;

  v10 = a3;
  -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[UAFSchemaUAFDeviceMetadata deviceType](self, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[UAFSchemaUAFDeviceMetadata systemBuild](self, "systemBuild");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v9 = v10;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int programCode;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  $B55BE137D096B817EB4BC92F4D083786 has;
  int v26;
  unsigned int v27;
  int inputLocale;
  int v29;
  unint64_t nanoSecondsSinceLastBoot;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[UAFSchemaUAFDeviceMetadata deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[UAFSchemaUAFDeviceMetadata deviceType](self, "deviceType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[UAFSchemaUAFDeviceMetadata deviceType](self, "deviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    programCode = self->_programCode;
    if (programCode != objc_msgSend(v4, "programCode"))
      goto LABEL_20;
  }
  -[UAFSchemaUAFDeviceMetadata systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[UAFSchemaUAFDeviceMetadata systemBuild](self, "systemBuild");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[UAFSchemaUAFDeviceMetadata systemBuild](self, "systemBuild");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
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
      inputLocale = self->_inputLocale;
      if (inputLocale != objc_msgSend(v4, "inputLocale"))
        goto LABEL_20;
      has = self->_has;
      v27 = v4[56];
    }
    v29 = (*(unsigned int *)&has >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (nanoSecondsSinceLastBoot = self->_nanoSecondsSinceLastBoot,
            nanoSecondsSinceLastBoot == objc_msgSend(v4, "nanoSecondsSinceLastBoot")))
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
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaUUID hash](self->_deviceId, "hash");
  v4 = -[NSString hash](self->_deviceType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_programCode;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_systemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_inputLocale;
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
  v8 = 2654435761u * self->_nanoSecondsSinceLastBoot;
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
  char has;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceId)
  {
    -[UAFSchemaUAFDeviceMetadata deviceId](self, "deviceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceId"));

    }
  }
  if (self->_deviceType)
  {
    -[UAFSchemaUAFDeviceMetadata deviceType](self, "deviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceType"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_10;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[UAFSchemaUAFDeviceMetadata nanoSecondsSinceLastBoot](self, "nanoSecondsSinceLastBoot"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nanoSecondsSinceLastBoot"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_21;
LABEL_17:
    v13 = -[UAFSchemaUAFDeviceMetadata programCode](self, "programCode") - 1;
    if (v13 > 4)
      v14 = CFSTR("PROGRAMCODE_UNKNOWN");
    else
      v14 = *(&off_1E563E3F8 + v13);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("programCode"));
    goto LABEL_21;
  }
  v10 = -[UAFSchemaUAFDeviceMetadata inputLocale](self, "inputLocale") - 1;
  if (v10 > 0x3D)
    v11 = CFSTR("LOCALE_UNKNOWN_LOCALE");
  else
    v11 = *(&off_1E563E208 + v10);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("inputLocale"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_16;
LABEL_10:
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_21:
  if (self->_systemBuild)
  {
    -[UAFSchemaUAFDeviceMetadata systemBuild](self, "systemBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("systemBuild"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFDeviceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (UAFSchemaUAFDeviceMetadata)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFDeviceMetadata *v5;
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
    self = -[UAFSchemaUAFDeviceMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFDeviceMetadata)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFDeviceMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UAFSchemaUAFDeviceMetadata *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UAFSchemaUAFDeviceMetadata;
  v5 = -[UAFSchemaUAFDeviceMetadata init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[UAFSchemaUAFDeviceMetadata setDeviceId:](v5, "setDeviceId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[UAFSchemaUAFDeviceMetadata setDeviceType:](v5, "setDeviceType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("programCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFDeviceMetadata setProgramCode:](v5, "setProgramCode:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[UAFSchemaUAFDeviceMetadata setSystemBuild:](v5, "setSystemBuild:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputLocale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFDeviceMetadata setInputLocale:](v5, "setInputLocale:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nanoSecondsSinceLastBoot"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFDeviceMetadata setNanoSecondsSinceLastBoot:](v5, "setNanoSecondsSinceLastBoot:", objc_msgSend(v14, "unsignedLongLongValue"));
    v15 = v5;

  }
  return v5;
}

- (SISchemaUUID)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)programCode
{
  return self->_programCode;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)inputLocale
{
  return self->_inputLocale;
}

- (unint64_t)nanoSecondsSinceLastBoot
{
  return self->_nanoSecondsSinceLastBoot;
}

- (void)setHasDeviceId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
