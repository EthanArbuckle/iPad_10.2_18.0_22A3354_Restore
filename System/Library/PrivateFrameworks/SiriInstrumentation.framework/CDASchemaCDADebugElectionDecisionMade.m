@implementation CDASchemaCDADebugElectionDecisionMade

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
  v9.super_class = (Class)CDASchemaCDADebugElectionDecisionMade;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDADebugElectionDecisionMade advertisementDatas](self, "advertisementDatas", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDASchemaCDADebugElectionDecisionMade setAdvertisementDatas:](self, "setAdvertisementDatas:", v7);
  return v5;
}

- (void)setIsCrossDeviceArbitrationAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isCrossDeviceArbitrationAllowed = a3;
}

- (BOOL)hasIsCrossDeviceArbitrationAllowed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsCrossDeviceArbitrationAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsCrossDeviceArbitrationAllowed
{
  -[CDASchemaCDADebugElectionDecisionMade setIsCrossDeviceArbitrationAllowed:](self, "setIsCrossDeviceArbitrationAllowed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearAdvertisementData
{
  -[NSArray removeAllObjects](self->_advertisementDatas, "removeAllObjects");
}

- (void)addAdvertisementData:(id)a3
{
  id v4;
  NSArray *advertisementDatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  advertisementDatas = self->_advertisementDatas;
  v8 = v4;
  if (!advertisementDatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_advertisementDatas;
    self->_advertisementDatas = v6;

    v4 = v8;
    advertisementDatas = self->_advertisementDatas;
  }
  -[NSArray addObject:](advertisementDatas, "addObject:", v4);

}

- (unint64_t)advertisementDataCount
{
  return -[NSArray count](self->_advertisementDatas, "count");
}

- (id)advertisementDataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_advertisementDatas, "objectAtIndexedSubscript:", a3);
}

- (void)setDeviceGroup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deviceGroup = a3;
}

- (BOOL)hasDeviceGroup
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDeviceGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDeviceGroup
{
  -[CDASchemaCDADebugElectionDecisionMade setDeviceGroup:](self, "setDeviceGroup:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDADebugElectionDecisionMadeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_advertisementDatas;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isCrossDeviceArbitrationAllowed;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  unsigned int deviceGroup;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[28] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isCrossDeviceArbitrationAllowed = self->_isCrossDeviceArbitrationAllowed;
    if (isCrossDeviceArbitrationAllowed != objc_msgSend(v4, "isCrossDeviceArbitrationAllowed"))
      goto LABEL_15;
  }
  -[CDASchemaCDADebugElectionDecisionMade advertisementDatas](self, "advertisementDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "advertisementDatas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[CDASchemaCDADebugElectionDecisionMade advertisementDatas](self, "advertisementDatas");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[CDASchemaCDADebugElectionDecisionMade advertisementDatas](self, "advertisementDatas");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "advertisementDatas");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    deviceGroup = self->_deviceGroup;
    if (deviceGroup != objc_msgSend(v4, "deviceGroup"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isCrossDeviceArbitrationAllowed;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_advertisementDatas, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_deviceGroup;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char has;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_advertisementDatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_advertisementDatas;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("advertisementData"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDADebugElectionDecisionMade deviceGroup](self, "deviceGroup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("deviceGroup"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDADebugElectionDecisionMade isCrossDeviceArbitrationAllowed](self, "isCrossDeviceArbitrationAllowed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isCrossDeviceArbitrationAllowed"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDADebugElectionDecisionMade dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDADebugElectionDecisionMade)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDADebugElectionDecisionMade *v5;
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
    self = -[CDASchemaCDADebugElectionDecisionMade initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDADebugElectionDecisionMade)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDADebugElectionDecisionMade *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CDASchemaCDAAdvertisementData *v14;
  void *v15;
  CDASchemaCDADebugElectionDecisionMade *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CDASchemaCDADebugElectionDecisionMade;
  v5 = -[CDASchemaCDADebugElectionDecisionMade init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCrossDeviceArbitrationAllowed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDADebugElectionDecisionMade setIsCrossDeviceArbitrationAllowed:](v5, "setIsCrossDeviceArbitrationAllowed:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertisementData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[CDASchemaCDAAdvertisementData initWithDictionary:]([CDASchemaCDAAdvertisementData alloc], "initWithDictionary:", v13);
              -[CDASchemaCDADebugElectionDecisionMade addAdvertisementData:](v5, "addAdvertisementData:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v10);
      }

      v6 = v18;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceGroup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDADebugElectionDecisionMade setDeviceGroup:](v5, "setDeviceGroup:", objc_msgSend(v15, "unsignedIntValue"));
    v16 = v5;

  }
  return v5;
}

- (BOOL)isCrossDeviceArbitrationAllowed
{
  return self->_isCrossDeviceArbitrationAllowed;
}

- (NSArray)advertisementDatas
{
  return self->_advertisementDatas;
}

- (void)setAdvertisementDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementDatas, 0);
}

@end
