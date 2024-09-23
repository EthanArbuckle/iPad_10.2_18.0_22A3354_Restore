@implementation ORCHSchemaORCHMUXRequestEnded

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
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHMUXRequestEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHMUXRequestEnded userScores](self, "userScores", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHMUXRequestEnded setUserScores:](self, "setUserScores:", v7);

  -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[ORCHSchemaORCHMUXRequestEnded deleteSelectedUserEphemeralId](self, "deleteSelectedUserEphemeralId");
  return v5;
}

- (void)setIsMultiUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isMultiUser = a3;
}

- (BOOL)hasIsMultiUser
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsMultiUser:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsMultiUser
{
  -[ORCHSchemaORCHMUXRequestEnded setIsMultiUser:](self, "setIsMultiUser:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNlRerunTimeInMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nlRerunTimeInMs = a3;
}

- (BOOL)hasNlRerunTimeInMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNlRerunTimeInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNlRerunTimeInMs
{
  -[ORCHSchemaORCHMUXRequestEnded setNlRerunTimeInMs:](self, "setNlRerunTimeInMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearUserScores
{
  -[NSArray removeAllObjects](self->_userScores, "removeAllObjects");
}

- (void)addUserScores:(id)a3
{
  id v4;
  NSArray *userScores;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  userScores = self->_userScores;
  v8 = v4;
  if (!userScores)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_userScores;
    self->_userScores = v6;

    v4 = v8;
    userScores = self->_userScores;
  }
  -[NSArray addObject:](userScores, "addObject:", v4);

}

- (unint64_t)userScoresCount
{
  return -[NSArray count](self->_userScores, "count");
}

- (id)userScoresAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_userScores, "objectAtIndexedSubscript:", a3);
}

- (void)setORCHUserIdentityClassification:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ORCHUserIdentityClassification = a3;
}

- (BOOL)hasORCHUserIdentityClassification
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasORCHUserIdentityClassification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteORCHUserIdentityClassification
{
  -[ORCHSchemaORCHMUXRequestEnded setORCHUserIdentityClassification:](self, "setORCHUserIdentityClassification:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsOutsider:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isOutsider = a3;
}

- (BOOL)hasIsOutsider
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsOutsider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsOutsider
{
  -[ORCHSchemaORCHMUXRequestEnded setIsOutsider:](self, "setIsOutsider:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasVoiceIdAssetVersion
{
  return self->_voiceIdAssetVersion != 0;
}

- (void)deleteVoiceIdAssetVersion
{
  -[ORCHSchemaORCHMUXRequestEnded setVoiceIdAssetVersion:](self, "setVoiceIdAssetVersion:", 0);
}

- (void)setIsSelectedUserPartOfMultipleHomes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isSelectedUserPartOfMultipleHomes = a3;
}

- (BOOL)hasIsSelectedUserPartOfMultipleHomes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsSelectedUserPartOfMultipleHomes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsSelectedUserPartOfMultipleHomes
{
  -[ORCHSchemaORCHMUXRequestEnded setIsSelectedUserPartOfMultipleHomes:](self, "setIsSelectedUserPartOfMultipleHomes:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasSelectedSharedUserId
{
  return self->_selectedSharedUserId != 0;
}

- (void)deleteSelectedSharedUserId
{
  -[ORCHSchemaORCHMUXRequestEnded setSelectedSharedUserId:](self, "setSelectedSharedUserId:", 0);
}

- (void)setNlRerunLatencyInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_nlRerunLatencyInMs = a3;
}

- (BOOL)hasNlRerunLatencyInMs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNlRerunLatencyInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteNlRerunLatencyInMs
{
  -[ORCHSchemaORCHMUXRequestEnded setNlRerunLatencyInMs:](self, "setNlRerunLatencyInMs:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)hasSelectedUserEphemeralId
{
  return self->_selectedUserEphemeralId != 0;
}

- (void)deleteSelectedUserEphemeralId
{
  -[ORCHSchemaORCHMUXRequestEnded setSelectedUserEphemeralId:](self, "setSelectedUserEphemeralId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_userScores;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0)
    PBDataWriterWriteBOOLField();
  -[ORCHSchemaORCHMUXRequestEnded voiceIdAssetVersion](self, "voiceIdAssetVersion", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  -[ORCHSchemaORCHMUXRequestEnded selectedSharedUserId](self, "selectedSharedUserId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint64Field();
  -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $909C2B06A8EBC8E210EDA1F4529ED3E9 has;
  unsigned int v6;
  int isMultiUser;
  int v8;
  unsigned int nlRerunTimeInMs;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  $909C2B06A8EBC8E210EDA1F4529ED3E9 v17;
  int v18;
  unsigned int v19;
  int ORCHUserIdentityClassification;
  int v21;
  int isOutsider;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int isSelectedUserPartOfMultipleHomes;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  unint64_t nlRerunLatencyInMs;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = self->_has;
  v6 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isMultiUser = self->_isMultiUser;
    if (isMultiUser != objc_msgSend(v4, "isMultiUser"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[72];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_42;
  if (v8)
  {
    nlRerunTimeInMs = self->_nlRerunTimeInMs;
    if (nlRerunTimeInMs != objc_msgSend(v4, "nlRerunTimeInMs"))
      goto LABEL_42;
  }
  -[ORCHSchemaORCHMUXRequestEnded userScores](self, "userScores");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userScores");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_41;
  -[ORCHSchemaORCHMUXRequestEnded userScores](self, "userScores");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ORCHSchemaORCHMUXRequestEnded userScores](self, "userScores");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userScores");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  v17 = self->_has;
  v18 = (*(unsigned int *)&v17 >> 2) & 1;
  v19 = v4[72];
  if (v18 != ((v19 >> 2) & 1))
    goto LABEL_42;
  if (v18)
  {
    ORCHUserIdentityClassification = self->_ORCHUserIdentityClassification;
    if (ORCHUserIdentityClassification != objc_msgSend(v4, "ORCHUserIdentityClassification"))
      goto LABEL_42;
    v17 = self->_has;
    v19 = v4[72];
  }
  v21 = (*(unsigned int *)&v17 >> 3) & 1;
  if (v21 != ((v19 >> 3) & 1))
    goto LABEL_42;
  if (v21)
  {
    isOutsider = self->_isOutsider;
    if (isOutsider != objc_msgSend(v4, "isOutsider"))
      goto LABEL_42;
  }
  -[ORCHSchemaORCHMUXRequestEnded voiceIdAssetVersion](self, "voiceIdAssetVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceIdAssetVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_41;
  -[ORCHSchemaORCHMUXRequestEnded voiceIdAssetVersion](self, "voiceIdAssetVersion");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ORCHSchemaORCHMUXRequestEnded voiceIdAssetVersion](self, "voiceIdAssetVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceIdAssetVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_42;
  }
  else
  {

  }
  v28 = (*(_BYTE *)&self->_has >> 4) & 1;
  if (v28 != ((v4[72] >> 4) & 1))
    goto LABEL_42;
  if (v28)
  {
    isSelectedUserPartOfMultipleHomes = self->_isSelectedUserPartOfMultipleHomes;
    if (isSelectedUserPartOfMultipleHomes != objc_msgSend(v4, "isSelectedUserPartOfMultipleHomes"))
      goto LABEL_42;
  }
  -[ORCHSchemaORCHMUXRequestEnded selectedSharedUserId](self, "selectedSharedUserId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedSharedUserId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_41;
  -[ORCHSchemaORCHMUXRequestEnded selectedSharedUserId](self, "selectedSharedUserId");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[ORCHSchemaORCHMUXRequestEnded selectedSharedUserId](self, "selectedSharedUserId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedSharedUserId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_42;
  }
  else
  {

  }
  v35 = (*(_BYTE *)&self->_has >> 5) & 1;
  if (v35 != ((v4[72] >> 5) & 1))
    goto LABEL_42;
  if (v35)
  {
    nlRerunLatencyInMs = self->_nlRerunLatencyInMs;
    if (nlRerunLatencyInMs != objc_msgSend(v4, "nlRerunLatencyInMs"))
      goto LABEL_42;
  }
  -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedUserEphemeralId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
  {

LABEL_45:
    v42 = 1;
    goto LABEL_43;
  }
  v38 = (void *)v37;
  -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedUserEphemeralId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "isEqual:", v40);

  if ((v41 & 1) != 0)
    goto LABEL_45;
LABEL_42:
  v42 = 0;
LABEL_43:

  return v42;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_isMultiUser;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_nlRerunTimeInMs;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSArray hash](self->_userScores, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_ORCHUserIdentityClassification;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_isOutsider;
      goto LABEL_11;
    }
  }
  v7 = 0;
LABEL_11:
  v8 = -[NSString hash](self->_voiceIdAssetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_isSelectedUserPartOfMultipleHomes;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_selectedSharedUserId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v11 = 2654435761u * self->_nlRerunLatencyInMs;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[SISchemaUUID hash](self->_selectedUserEphemeralId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = -[ORCHSchemaORCHMUXRequestEnded ORCHUserIdentityClassification](self, "ORCHUserIdentityClassification") - 1;
    if (v5 > 5)
      v6 = CFSTR("ORCHUSERIDENTITYCLASSIFICATION_UNKNOWN");
    else
      v6 = off_1E5632778[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ORCHUserIdentityClassification"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHMUXRequestEnded isMultiUser](self, "isMultiUser"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isMultiUser"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHMUXRequestEnded isOutsider](self, "isOutsider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isOutsider"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHMUXRequestEnded isSelectedUserPartOfMultipleHomes](self, "isSelectedUserPartOfMultipleHomes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isSelectedUserPartOfMultipleHomes"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ORCHSchemaORCHMUXRequestEnded nlRerunLatencyInMs](self, "nlRerunLatencyInMs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nlRerunLatencyInMs"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ORCHSchemaORCHMUXRequestEnded nlRerunTimeInMs](self, "nlRerunTimeInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("nlRerunTimeInMs"));

  }
LABEL_12:
  if (self->_selectedSharedUserId)
  {
    -[ORCHSchemaORCHMUXRequestEnded selectedSharedUserId](self, "selectedSharedUserId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("selectedSharedUserId"));

  }
  if (self->_selectedUserEphemeralId)
  {
    -[ORCHSchemaORCHMUXRequestEnded selectedUserEphemeralId](self, "selectedUserEphemeralId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("selectedUserEphemeralId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("selectedUserEphemeralId"));

    }
  }
  if (-[NSArray count](self->_userScores, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = self->_userScores;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("userScores"));
  }
  if (self->_voiceIdAssetVersion)
  {
    -[ORCHSchemaORCHMUXRequestEnded voiceIdAssetVersion](self, "voiceIdAssetVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("voiceIdAssetVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v28);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHMUXRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHMUXRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHMUXRequestEnded *v5;
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
    self = -[ORCHSchemaORCHMUXRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHMUXRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHMUXRequestEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ORCHSchemaORCHMultiUserScore *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SISchemaUUID *v25;
  ORCHSchemaORCHMUXRequestEnded *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ORCHSchemaORCHMUXRequestEnded;
  v5 = -[ORCHSchemaORCHMUXRequestEnded init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMultiUser"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXRequestEnded setIsMultiUser:](v5, "setIsMultiUser:", objc_msgSend(v6, "BOOLValue"));
    v31 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRerunTimeInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXRequestEnded setNlRerunTimeInMs:](v5, "setNlRerunTimeInMs:", objc_msgSend(v7, "unsignedIntValue"));
    v30 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userScores"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v33;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v33 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[ORCHSchemaORCHMultiUserScore initWithDictionary:]([ORCHSchemaORCHMultiUserScore alloc], "initWithDictionary:", v14);
              -[ORCHSchemaORCHMUXRequestEnded addUserScores:](v5, "addUserScores:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ORCHUserIdentityClassification"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXRequestEnded setORCHUserIdentityClassification:](v5, "setORCHUserIdentityClassification:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOutsider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXRequestEnded setIsOutsider:](v5, "setIsOutsider:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceIdAssetVersion"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[ORCHSchemaORCHMUXRequestEnded setVoiceIdAssetVersion:](v5, "setVoiceIdAssetVersion:", v19);

    }
    v29 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSelectedUserPartOfMultipleHomes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXRequestEnded setIsSelectedUserPartOfMultipleHomes:](v5, "setIsSelectedUserPartOfMultipleHomes:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedSharedUserId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[ORCHSchemaORCHMUXRequestEnded setSelectedSharedUserId:](v5, "setSelectedSharedUserId:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRerunLatencyInMs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMUXRequestEnded setNlRerunLatencyInMs:](v5, "setNlRerunLatencyInMs:", objc_msgSend(v23, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedUserEphemeralId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v24);
      -[ORCHSchemaORCHMUXRequestEnded setSelectedUserEphemeralId:](v5, "setSelectedUserEphemeralId:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (unsigned)nlRerunTimeInMs
{
  return self->_nlRerunTimeInMs;
}

- (NSArray)userScores
{
  return self->_userScores;
}

- (void)setUserScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)ORCHUserIdentityClassification
{
  return self->_ORCHUserIdentityClassification;
}

- (BOOL)isOutsider
{
  return self->_isOutsider;
}

- (NSString)voiceIdAssetVersion
{
  return self->_voiceIdAssetVersion;
}

- (void)setVoiceIdAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSelectedUserPartOfMultipleHomes
{
  return self->_isSelectedUserPartOfMultipleHomes;
}

- (NSString)selectedSharedUserId
{
  return self->_selectedSharedUserId;
}

- (void)setSelectedSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)nlRerunLatencyInMs
{
  return self->_nlRerunLatencyInMs;
}

- (SISchemaUUID)selectedUserEphemeralId
{
  return self->_selectedUserEphemeralId;
}

- (void)setSelectedUserEphemeralId:(id)a3
{
  objc_storeStrong((id *)&self->_selectedUserEphemeralId, a3);
}

- (void)setHasVoiceIdAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSelectedSharedUserId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSelectedUserEphemeralId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedUserEphemeralId, 0);
  objc_storeStrong((id *)&self->_selectedSharedUserId, 0);
  objc_storeStrong((id *)&self->_voiceIdAssetVersion, 0);
  objc_storeStrong((id *)&self->_userScores, 0);
}

@end
