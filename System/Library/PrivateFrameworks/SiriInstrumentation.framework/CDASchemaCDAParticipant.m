@implementation CDASchemaCDAParticipant

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDASchemaCDAParticipant;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CDASchemaCDAParticipant deleteElectionParticipantId](self, "deleteElectionParticipantId");
  -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CDASchemaCDAParticipant deleteRotatedElectionParticipantId](self, "deleteRotatedElectionParticipantId");

  return v5;
}

- (void)setGoodnessScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_goodnessScore = a3;
}

- (BOOL)hasGoodnessScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasGoodnessScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteGoodnessScore
{
  -[CDASchemaCDAParticipant setGoodnessScore:](self, "setGoodnessScore:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDeviceClass:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deviceClass = a3;
}

- (BOOL)hasDeviceClass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDeviceClass
{
  -[CDASchemaCDAParticipant setDeviceClass:](self, "setDeviceClass:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setProductType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_productType = a3;
}

- (BOOL)hasProductType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProductType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProductType
{
  -[CDASchemaCDAParticipant setProductType:](self, "setProductType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasElectionParticipantId
{
  return self->_electionParticipantId != 0;
}

- (void)deleteElectionParticipantId
{
  -[CDASchemaCDAParticipant setElectionParticipantId:](self, "setElectionParticipantId:", 0);
}

- (BOOL)hasRotatedElectionParticipantId
{
  return self->_rotatedElectionParticipantId != 0;
}

- (void)deleteRotatedElectionParticipantId
{
  -[CDASchemaCDAParticipant setRotatedElectionParticipantId:](self, "setRotatedElectionParticipantId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAParticipantReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9F3D01B5CE01E8F52C53159BF086F1CB has;
  unsigned int v6;
  unsigned int goodnessScore;
  int v8;
  int deviceClass;
  int v10;
  unsigned int productType;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_23;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    goodnessScore = self->_goodnessScore;
    if (goodnessScore != objc_msgSend(v4, "goodnessScore"))
      goto LABEL_23;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      deviceClass = self->_deviceClass;
      if (deviceClass != objc_msgSend(v4, "deviceClass"))
        goto LABEL_23;
      has = self->_has;
      v6 = v4[40];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1))
      goto LABEL_23;
    if (v10)
    {
      productType = self->_productType;
      if (productType != objc_msgSend(v4, "productType"))
        goto LABEL_23;
    }
    -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "electionParticipantId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_22;
    -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "electionParticipantId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_23;
    }
    else
    {

    }
    -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rotatedElectionParticipantId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) != (v13 != 0))
    {
      -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {

LABEL_26:
        v24 = 1;
        goto LABEL_24;
      }
      v20 = (void *)v19;
      -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rotatedElectionParticipantId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if ((v23 & 1) != 0)
        goto LABEL_26;
    }
    else
    {
LABEL_22:

    }
  }
LABEL_23:
  v24 = 0;
LABEL_24:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_goodnessScore;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_deviceClass;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_productType;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_electionParticipantId, "hash");
  return v6 ^ -[SISchemaUUID hash](self->_rotatedElectionParticipantId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[CDASchemaCDAParticipant deviceClass](self, "deviceClass") - 1;
    if (v4 > 9)
      v5 = CFSTR("CDADEVICECLASS_UNKNOWN");
    else
      v5 = off_1E562BE80[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceClass"));
  }
  if (self->_electionParticipantId)
  {
    -[CDASchemaCDAParticipant electionParticipantId](self, "electionParticipantId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("electionParticipantId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("electionParticipantId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAParticipant goodnessScore](self, "goodnessScore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("goodnessScore"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAParticipant productType](self, "productType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("productType"));

  }
  if (self->_rotatedElectionParticipantId)
  {
    -[CDASchemaCDAParticipant rotatedElectionParticipantId](self, "rotatedElectionParticipantId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("rotatedElectionParticipantId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rotatedElectionParticipantId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAParticipant dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAParticipant)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAParticipant *v5;
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
    self = -[CDASchemaCDAParticipant initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAParticipant)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAParticipant *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaUUID *v10;
  void *v11;
  SISchemaUUID *v12;
  CDASchemaCDAParticipant *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDASchemaCDAParticipant;
  v5 = -[CDASchemaCDAParticipant init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("goodnessScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAParticipant setGoodnessScore:](v5, "setGoodnessScore:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAParticipant setDeviceClass:](v5, "setDeviceClass:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAParticipant setProductType:](v5, "setProductType:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("electionParticipantId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v9);
      -[CDASchemaCDAParticipant setElectionParticipantId:](v5, "setElectionParticipantId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rotatedElectionParticipantId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[CDASchemaCDAParticipant setRotatedElectionParticipantId:](v5, "setRotatedElectionParticipantId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)productType
{
  return self->_productType;
}

- (SISchemaUUID)electionParticipantId
{
  return self->_electionParticipantId;
}

- (void)setElectionParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_electionParticipantId, a3);
}

- (SISchemaUUID)rotatedElectionParticipantId
{
  return self->_rotatedElectionParticipantId;
}

- (void)setRotatedElectionParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_rotatedElectionParticipantId, a3);
}

- (void)setHasElectionParticipantId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRotatedElectionParticipantId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedElectionParticipantId, 0);
  objc_storeStrong((id *)&self->_electionParticipantId, 0);
}

@end
