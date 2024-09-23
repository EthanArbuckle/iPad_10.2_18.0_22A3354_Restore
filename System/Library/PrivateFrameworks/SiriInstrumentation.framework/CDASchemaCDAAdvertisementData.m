@implementation CDASchemaCDAAdvertisementData

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAudioHash:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 1u;
  self->_audioHash = a3;
}

- (BOOL)hasAudioHash
{
  return *(_WORD *)(&self->_isSelf + 1) & 1;
}

- (void)setHasAudioHash:(BOOL)a3
{
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFFE | a3;
}

- (void)deleteAudioHash
{
  -[CDASchemaCDAAdvertisementData setAudioHash:](self, "setAudioHash:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~1u;
}

- (void)setGoodnessScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 2u;
  self->_goodnessScore = a3;
}

- (BOOL)hasGoodnessScore
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 1) & 1;
}

- (void)setHasGoodnessScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFFD | v3;
}

- (void)deleteGoodnessScore
{
  -[CDASchemaCDAAdvertisementData setGoodnessScore:](self, "setGoodnessScore:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~2u;
}

- (void)setConfidenceScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 4u;
  self->_confidenceScore = a3;
}

- (BOOL)hasConfidenceScore
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 2) & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFFB | v3;
}

- (void)deleteConfidenceScore
{
  -[CDASchemaCDAAdvertisementData setConfidenceScore:](self, "setConfidenceScore:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~4u;
}

- (void)setDeviceClass:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 8u;
  self->_deviceClass = a3;
}

- (BOOL)hasDeviceClass
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 3) & 1;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFF7 | v3;
}

- (void)deleteDeviceClass
{
  -[CDASchemaCDAAdvertisementData setDeviceClass:](self, "setDeviceClass:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~8u;
}

- (void)setDeviceGroup:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x10u;
  self->_deviceGroup = a3;
}

- (BOOL)hasDeviceGroup
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 4) & 1;
}

- (void)setHasDeviceGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFEF | v3;
}

- (void)deleteDeviceGroup
{
  -[CDASchemaCDAAdvertisementData setDeviceGroup:](self, "setDeviceGroup:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~0x10u;
}

- (void)setProductType:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x20u;
  self->_productType = a3;
}

- (BOOL)hasProductType
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 5) & 1;
}

- (void)setHasProductType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFDF | v3;
}

- (void)deleteProductType
{
  -[CDASchemaCDAAdvertisementData setProductType:](self, "setProductType:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~0x20u;
}

- (void)setTieBreaker:(unsigned int)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x40u;
  self->_tieBreaker = a3;
}

- (BOOL)hasTieBreaker
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 6) & 1;
}

- (void)setHasTieBreaker:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFFBF | v3;
}

- (void)deleteTieBreaker
{
  -[CDASchemaCDAAdvertisementData setTieBreaker:](self, "setTieBreaker:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~0x40u;
}

- (void)setIsFromContextCollector:(BOOL)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x80u;
  self->_isFromContextCollector = a3;
}

- (BOOL)hasIsFromContextCollector
{
  return (*(unsigned __int16 *)(&self->_isSelf + 1) >> 7) & 1;
}

- (void)setHasIsFromContextCollector:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFF7F | v3;
}

- (void)deleteIsFromContextCollector
{
  -[CDASchemaCDAAdvertisementData setIsFromContextCollector:](self, "setIsFromContextCollector:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~0x80u;
}

- (void)setIsSelf:(BOOL)a3
{
  *(_WORD *)(&self->_isSelf + 1) |= 0x100u;
  self->_isSelf = a3;
}

- (BOOL)hasIsSelf
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isSelf + 1)) & 1;
}

- (void)setHasIsSelf:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)(&self->_isSelf + 1) = *(_WORD *)(&self->_isSelf + 1) & 0xFEFF | v3;
}

- (void)deleteIsSelf
{
  -[CDASchemaCDAAdvertisementData setIsSelf:](self, "setIsSelf:", 0);
  *(_WORD *)(&self->_isSelf + 1) &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAAdvertisementDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 v4;
  id v5;

  v5 = a3;
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = *(_WORD *)(&self->_isSelf + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)(&self->_isSelf + 1) & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v4 & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int audioHash;
  int v8;
  unsigned int goodnessScore;
  int v10;
  unsigned int confidenceScore;
  int v12;
  unsigned int deviceClass;
  int v14;
  unsigned int deviceGroup;
  int v16;
  unsigned int productType;
  int v18;
  unsigned int tieBreaker;
  int v20;
  int isFromContextCollector;
  int v22;
  int isSelf;
  BOOL v24;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
  v6 = v4[19];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_38;
  if ((v5 & 1) != 0)
  {
    audioHash = self->_audioHash;
    if (audioHash != objc_msgSend(v4, "audioHash"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_38;
  if (v8)
  {
    goodnessScore = self->_goodnessScore;
    if (goodnessScore != objc_msgSend(v4, "goodnessScore"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_38;
  if (v10)
  {
    confidenceScore = self->_confidenceScore;
    if (confidenceScore != objc_msgSend(v4, "confidenceScore"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_38;
  if (v12)
  {
    deviceClass = self->_deviceClass;
    if (deviceClass != objc_msgSend(v4, "deviceClass"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_38;
  if (v14)
  {
    deviceGroup = self->_deviceGroup;
    if (deviceGroup != objc_msgSend(v4, "deviceGroup"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_38;
  if (v16)
  {
    productType = self->_productType;
    if (productType != objc_msgSend(v4, "productType"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v18 = (v5 >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_38;
  if (v18)
  {
    tieBreaker = self->_tieBreaker;
    if (tieBreaker != objc_msgSend(v4, "tieBreaker"))
      goto LABEL_38;
    v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
    v6 = v4[19];
  }
  v20 = (v5 >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_38;
  if (v20)
  {
    isFromContextCollector = self->_isFromContextCollector;
    if (isFromContextCollector == objc_msgSend(v4, "isFromContextCollector"))
    {
      v5 = *(unsigned __int16 *)(&self->_isSelf + 1);
      v6 = v4[19];
      goto LABEL_34;
    }
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  v22 = (v5 >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_38;
  if (v22)
  {
    isSelf = self->_isSelf;
    if (isSelf != objc_msgSend(v4, "isSelf"))
      goto LABEL_38;
  }
  v24 = 1;
LABEL_39:

  return v24;
}

- (unint64_t)hash
{
  __int16 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_WORD *)(&self->_isSelf + 1);
  if ((v2 & 1) != 0)
  {
    v3 = 2654435761 * self->_audioHash;
    if ((v2 & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_goodnessScore;
      if ((v2 & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((v2 & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((v2 & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_confidenceScore;
    if ((v2 & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((v2 & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_deviceClass;
    if ((v2 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_deviceGroup;
    if ((v2 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_productType;
    if ((v2 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((v2 & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_tieBreaker;
    if ((v2 & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((*(_WORD *)(&self->_isSelf + 1) & 0x100) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((v2 & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_isFromContextCollector;
  if ((*(_WORD *)(&self->_isSelf + 1) & 0x100) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_isSelf;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData audioHash](self, "audioHash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioHash"));

    v4 = *(_WORD *)(&self->_isSelf + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData confidenceScore](self, "confidenceScore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("confidenceScore"));

  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData deviceClass](self, "deviceClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceClass"));

  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData deviceGroup](self, "deviceGroup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("deviceGroup"));

  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData goodnessScore](self, "goodnessScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("goodnessScore"));

  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDAAdvertisementData isFromContextCollector](self, "isFromContextCollector"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isFromContextCollector"));

  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x100) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData productType](self, "productType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("productType"));

    if ((*(_WORD *)(&self->_isSelf + 1) & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDAAdvertisementData isSelf](self, "isSelf"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isSelf"));

  v4 = *(_WORD *)(&self->_isSelf + 1);
  if ((v4 & 0x20) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v4 & 0x40) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAAdvertisementData tieBreaker](self, "tieBreaker"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("tieBreaker"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAAdvertisementData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAAdvertisementData)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAAdvertisementData *v5;
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
    self = -[CDASchemaCDAAdvertisementData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAAdvertisementData)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAAdvertisementData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CDASchemaCDAAdvertisementData *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDASchemaCDAAdvertisementData;
  v5 = -[CDASchemaCDAAdvertisementData init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setAudioHash:](v5, "setAudioHash:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("goodnessScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setGoodnessScore:](v5, "setGoodnessScore:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidenceScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setConfidenceScore:](v5, "setConfidenceScore:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setDeviceClass:](v5, "setDeviceClass:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceGroup"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setDeviceGroup:](v5, "setDeviceGroup:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setProductType:](v5, "setProductType:", objc_msgSend(v11, "unsignedIntValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tieBreaker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setTieBreaker:](v5, "setTieBreaker:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFromContextCollector"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setIsFromContextCollector:](v5, "setIsFromContextCollector:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSelf"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAAdvertisementData setIsSelf:](v5, "setIsSelf:", objc_msgSend(v15, "BOOLValue"));
    v16 = v5;

  }
  return v5;
}

- (unsigned)audioHash
{
  return self->_audioHash;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)confidenceScore
{
  return self->_confidenceScore;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)productType
{
  return self->_productType;
}

- (unsigned)tieBreaker
{
  return self->_tieBreaker;
}

- (BOOL)isFromContextCollector
{
  return self->_isFromContextCollector;
}

- (BOOL)isSelf
{
  return self->_isSelf;
}

@end
