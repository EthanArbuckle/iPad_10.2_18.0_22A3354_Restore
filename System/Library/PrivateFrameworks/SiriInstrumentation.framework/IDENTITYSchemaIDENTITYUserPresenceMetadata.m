@implementation IDENTITYSchemaIDENTITYUserPresenceMetadata

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
  v9.super_class = (Class)IDENTITYSchemaIDENTITYUserPresenceMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IDENTITYSchemaIDENTITYUserPresenceMetadata deleteUserEphemeralId](self, "deleteUserEphemeralId");
  return v5;
}

- (BOOL)hasLoggableMultiUserSharedUserId
{
  return self->_loggableMultiUserSharedUserId != 0;
}

- (void)deleteLoggableMultiUserSharedUserId
{
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata setLoggableMultiUserSharedUserId:](self, "setLoggableMultiUserSharedUserId:", 0);
}

- (void)setUserLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userLocation = a3;
}

- (BOOL)hasUserLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUserLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUserLocation
{
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserLocation:](self, "setUserLocation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUserLocationSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userLocationSource = a3;
}

- (BOOL)hasUserLocationSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUserLocationSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUserLocationSource
{
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserLocationSource:](self, "setUserLocationSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteUserEphemeralId
{
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserEphemeralId:](self, "setUserEphemeralId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYUserPresenceMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata loggableMultiUserSharedUserId](self, "loggableMultiUserSharedUserId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
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
  $0F6B81A10D08CC7CBD1B3A5B348F6638 has;
  unsigned int v13;
  int userLocation;
  int v15;
  int userLocationSource;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata loggableMultiUserSharedUserId](self, "loggableMultiUserSharedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggableMultiUserSharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata loggableMultiUserSharedUserId](self, "loggableMultiUserSharedUserId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IDENTITYSchemaIDENTITYUserPresenceMetadata loggableMultiUserSharedUserId](self, "loggableMultiUserSharedUserId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggableMultiUserSharedUserId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    userLocation = self->_userLocation;
    if (userLocation != objc_msgSend(v4, "userLocation"))
      goto LABEL_19;
    has = self->_has;
    v13 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v15)
  {
    userLocationSource = self->_userLocationSource;
    if (userLocationSource != objc_msgSend(v4, "userLocationSource"))
      goto LABEL_19;
  }
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

LABEL_22:
    v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEphemeralId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_22;
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_loggableMultiUserSharedUserId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_userLocation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_userEphemeralId, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_userLocationSource;
  return v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_userEphemeralId, "hash");
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
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_loggableMultiUserSharedUserId)
  {
    -[IDENTITYSchemaIDENTITYUserPresenceMetadata loggableMultiUserSharedUserId](self, "loggableMultiUserSharedUserId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("loggableMultiUserSharedUserId"));

  }
  if (self->_userEphemeralId)
  {
    -[IDENTITYSchemaIDENTITYUserPresenceMetadata userEphemeralId](self, "userEphemeralId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("userEphemeralId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("userEphemeralId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v10 = -[IDENTITYSchemaIDENTITYUserPresenceMetadata userLocation](self, "userLocation");
    v11 = CFSTR("IDENTITYUSERLOCATION_UNKNOWN");
    if (v10 == 1)
      v11 = CFSTR("IDENTITYUSERLOCATION_HOME");
    if (v10 == 2)
      v12 = CFSTR("IDENTITYUSERLOCATION_AWAY");
    else
      v12 = v11;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userLocation"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13 = -[IDENTITYSchemaIDENTITYUserPresenceMetadata userLocationSource](self, "userLocationSource");
    v14 = CFSTR("IDENTITYUSERPRESENCESOURCE_UNKNOWN");
    if (v13 == 1)
      v14 = CFSTR("IDENTITYUSERPRESENCESOURCE_GEO_FENCE");
    if (v13 == 2)
      v15 = CFSTR("IDENTITYUSERPRESENCESOURCE_DEVICE_DISCOVERY");
    else
      v15 = v14;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userLocationSource"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IDENTITYSchemaIDENTITYUserPresenceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IDENTITYSchemaIDENTITYUserPresenceMetadata)initWithJSON:(id)a3
{
  void *v4;
  IDENTITYSchemaIDENTITYUserPresenceMetadata *v5;
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
    self = -[IDENTITYSchemaIDENTITYUserPresenceMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IDENTITYSchemaIDENTITYUserPresenceMetadata)initWithDictionary:(id)a3
{
  id v4;
  IDENTITYSchemaIDENTITYUserPresenceMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUUID *v11;
  IDENTITYSchemaIDENTITYUserPresenceMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDENTITYSchemaIDENTITYUserPresenceMetadata;
  v5 = -[IDENTITYSchemaIDENTITYUserPresenceMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggableMultiUserSharedUserId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[IDENTITYSchemaIDENTITYUserPresenceMetadata setLoggableMultiUserSharedUserId:](v5, "setLoggableMultiUserSharedUserId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserLocation:](v5, "setUserLocation:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userLocationSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserLocationSource:](v5, "setUserLocationSource:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEphemeralId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[IDENTITYSchemaIDENTITYUserPresenceMetadata setUserEphemeralId:](v5, "setUserEphemeralId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)loggableMultiUserSharedUserId
{
  return self->_loggableMultiUserSharedUserId;
}

- (void)setLoggableMultiUserSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)userLocation
{
  return self->_userLocation;
}

- (int)userLocationSource
{
  return self->_userLocationSource;
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (void)setUserEphemeralId:(id)a3
{
  objc_storeStrong((id *)&self->_userEphemeralId, a3);
}

- (void)setHasLoggableMultiUserSharedUserId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
  objc_storeStrong((id *)&self->_loggableMultiUserSharedUserId, 0);
}

@end
