@implementation SISchemaEngagedAccessoryContext

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
  v9.super_class = (Class)SISchemaEngagedAccessoryContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaEngagedAccessoryContext deleteAccessoryId](self, "deleteAccessoryId");
  return v5;
}

- (BOOL)hasAccessoryId
{
  return self->_accessoryId != 0;
}

- (void)deleteAccessoryId
{
  -[SISchemaEngagedAccessoryContext setAccessoryId:](self, "setAccessoryId:", 0);
}

- (void)setHomeKitAccessoryType:(int)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) |= 1u;
  self->_homeKitAccessoryType = a3;
}

- (BOOL)hasHomeKitAccessoryType
{
  return *(&self->_isThirdPartyMusicEnabled + 1);
}

- (void)setHasHomeKitAccessoryType:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) = *(&self->_isThirdPartyMusicEnabled + 1) & 0xFE | a3;
}

- (void)deleteHomeKitAccessoryType
{
  -[SISchemaEngagedAccessoryContext setHomeKitAccessoryType:](self, "setHomeKitAccessoryType:", 0);
  *(&self->_isThirdPartyMusicEnabled + 1) &= ~1u;
}

- (BOOL)hasAccessoryBrand
{
  return self->_accessoryBrand != 0;
}

- (void)deleteAccessoryBrand
{
  -[SISchemaEngagedAccessoryContext setAccessoryBrand:](self, "setAccessoryBrand:", 0);
}

- (BOOL)hasAccessoryModel
{
  return self->_accessoryModel != 0;
}

- (void)deleteAccessoryModel
{
  -[SISchemaEngagedAccessoryContext setAccessoryModel:](self, "setAccessoryModel:", 0);
}

- (void)setIsAudioPlaybackCapable:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) |= 2u;
  self->_isAudioPlaybackCapable = a3;
}

- (BOOL)hasIsAudioPlaybackCapable
{
  return (*((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1) >> 1) & 1;
}

- (void)setHasIsAudioPlaybackCapable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isThirdPartyMusicEnabled + 1) = *(&self->_isThirdPartyMusicEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsAudioPlaybackCapable
{
  -[SISchemaEngagedAccessoryContext setIsAudioPlaybackCapable:](self, "setIsAudioPlaybackCapable:", 0);
  *(&self->_isThirdPartyMusicEnabled + 1) &= ~2u;
}

- (void)setIsThirdPartyMusicEnabled:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 1) |= 4u;
  self->_isThirdPartyMusicEnabled = a3;
}

- (BOOL)hasIsThirdPartyMusicEnabled
{
  return (*((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1) >> 2) & 1;
}

- (void)setHasIsThirdPartyMusicEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isThirdPartyMusicEnabled + 1) = *(&self->_isThirdPartyMusicEnabled + 1) & 0xFB | v3;
}

- (void)deleteIsThirdPartyMusicEnabled
{
  -[SISchemaEngagedAccessoryContext setIsThirdPartyMusicEnabled:](self, "setIsThirdPartyMusicEnabled:", 0);
  *(&self->_isThirdPartyMusicEnabled + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEngagedAccessoryContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_isThirdPartyMusicEnabled + 1))
    PBDataWriterWriteInt32Field();
  -[SISchemaEngagedAccessoryContext accessoryBrand](self, "accessoryBrand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SISchemaEngagedAccessoryContext accessoryModel](self, "accessoryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v8 = *(&self->_isThirdPartyMusicEnabled + 1);
  v9 = v10;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v9 = v10;
    v8 = *(&self->_isThirdPartyMusicEnabled + 1);
  }
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  int homeKitAccessoryType;
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
  unsigned int v25;
  int v26;
  unsigned int v27;
  int isAudioPlaybackCapable;
  int v29;
  int isThirdPartyMusicEnabled;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if (*(&self->_isThirdPartyMusicEnabled + 1) != (v4[42] & 1))
    goto LABEL_20;
  if (*(&self->_isThirdPartyMusicEnabled + 1))
  {
    homeKitAccessoryType = self->_homeKitAccessoryType;
    if (homeKitAccessoryType != objc_msgSend(v4, "homeKitAccessoryType"))
      goto LABEL_20;
  }
  -[SISchemaEngagedAccessoryContext accessoryBrand](self, "accessoryBrand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryBrand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[SISchemaEngagedAccessoryContext accessoryBrand](self, "accessoryBrand");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaEngagedAccessoryContext accessoryBrand](self, "accessoryBrand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryBrand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[SISchemaEngagedAccessoryContext accessoryModel](self, "accessoryModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[SISchemaEngagedAccessoryContext accessoryModel](self, "accessoryModel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SISchemaEngagedAccessoryContext accessoryModel](self, "accessoryModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  else
  {

  }
  v25 = *((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1);
  v26 = (v25 >> 1) & 1;
  v27 = v4[42];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      isAudioPlaybackCapable = self->_isAudioPlaybackCapable;
      if (isAudioPlaybackCapable != objc_msgSend(v4, "isAudioPlaybackCapable"))
        goto LABEL_20;
      v25 = *((unsigned __int8 *)&self->_isThirdPartyMusicEnabled + 1);
      v27 = v4[42];
    }
    v29 = (v25 >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (isThirdPartyMusicEnabled = self->_isThirdPartyMusicEnabled,
            isThirdPartyMusicEnabled == objc_msgSend(v4, "isThirdPartyMusicEnabled")))
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
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[SISchemaUUID hash](self->_accessoryId, "hash");
  if (*(&self->_isThirdPartyMusicEnabled + 1))
    v4 = 2654435761 * self->_homeKitAccessoryType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_accessoryBrand, "hash");
  v6 = -[NSString hash](self->_accessoryModel, "hash");
  if ((*(&self->_isThirdPartyMusicEnabled + 1) & 2) != 0)
  {
    v7 = 2654435761 * self->_isAudioPlaybackCapable;
    if ((*(&self->_isThirdPartyMusicEnabled + 1) & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(&self->_isThirdPartyMusicEnabled + 1) & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_isThirdPartyMusicEnabled;
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
  char v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accessoryBrand)
  {
    -[SISchemaEngagedAccessoryContext accessoryBrand](self, "accessoryBrand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryBrand"));

  }
  if (self->_accessoryId)
  {
    -[SISchemaEngagedAccessoryContext accessoryId](self, "accessoryId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accessoryId"));

    }
  }
  if (self->_accessoryModel)
  {
    -[SISchemaEngagedAccessoryContext accessoryModel](self, "accessoryModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("accessoryModel"));

  }
  v11 = *(&self->_isThirdPartyMusicEnabled + 1);
  if ((v11 & 1) != 0)
  {
    v12 = -[SISchemaEngagedAccessoryContext homeKitAccessoryType](self, "homeKitAccessoryType") - 1;
    if (v12 > 0x26)
      v13 = CFSTR("HOMEKITACCESSORYTYPE_UNKNOWN_HOMEKIT_ACCESSORY_TYPE");
    else
      v13 = off_1E5635830[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("homeKitAccessoryType"));
    v11 = *(&self->_isThirdPartyMusicEnabled + 1);
  }
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEngagedAccessoryContext isAudioPlaybackCapable](self, "isAudioPlaybackCapable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isAudioPlaybackCapable"));

    v11 = *(&self->_isThirdPartyMusicEnabled + 1);
  }
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEngagedAccessoryContext isThirdPartyMusicEnabled](self, "isThirdPartyMusicEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isThirdPartyMusicEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaEngagedAccessoryContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaEngagedAccessoryContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaEngagedAccessoryContext *v5;
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
    self = -[SISchemaEngagedAccessoryContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaEngagedAccessoryContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaEngagedAccessoryContext *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SISchemaEngagedAccessoryContext *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SISchemaEngagedAccessoryContext;
  v5 = -[SISchemaEngagedAccessoryContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaEngagedAccessoryContext setAccessoryId:](v5, "setAccessoryId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitAccessoryType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEngagedAccessoryContext setHomeKitAccessoryType:](v5, "setHomeKitAccessoryType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryBrand"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SISchemaEngagedAccessoryContext setAccessoryBrand:](v5, "setAccessoryBrand:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[SISchemaEngagedAccessoryContext setAccessoryModel:](v5, "setAccessoryModel:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAudioPlaybackCapable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEngagedAccessoryContext setIsAudioPlaybackCapable:](v5, "setIsAudioPlaybackCapable:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isThirdPartyMusicEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEngagedAccessoryContext setIsThirdPartyMusicEnabled:](v5, "setIsThirdPartyMusicEnabled:", objc_msgSend(v14, "BOOLValue"));
    v15 = v5;

  }
  return v5;
}

- (SISchemaUUID)accessoryId
{
  return self->_accessoryId;
}

- (void)setAccessoryId:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryId, a3);
}

- (int)homeKitAccessoryType
{
  return self->_homeKitAccessoryType;
}

- (NSString)accessoryBrand
{
  return self->_accessoryBrand;
}

- (void)setAccessoryBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accessoryModel
{
  return self->_accessoryModel;
}

- (void)setAccessoryModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isAudioPlaybackCapable
{
  return self->_isAudioPlaybackCapable;
}

- (BOOL)isThirdPartyMusicEnabled
{
  return self->_isThirdPartyMusicEnabled;
}

- (void)setHasAccessoryId:(BOOL)a3
{
  *(&self->_isThirdPartyMusicEnabled + 2) = a3;
}

- (void)setHasAccessoryBrand:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasAccessoryModel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_accessoryBrand, 0);
  objc_storeStrong((id *)&self->_accessoryId, 0);
}

@end
