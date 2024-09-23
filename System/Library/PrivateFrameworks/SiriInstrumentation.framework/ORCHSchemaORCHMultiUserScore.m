@implementation ORCHSchemaORCHMultiUserScore

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaORCHMultiUserScore;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
    -[ORCHSchemaORCHMultiUserScore deleteLoggableSharedUserId](self, "deleteLoggableSharedUserId");
  -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHMultiUserScore deleteUserEphemeralId](self, "deleteUserEphemeralId");

  return v5;
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deleteLoggableSharedUserId
{
  -[ORCHSchemaORCHMultiUserScore setLoggableSharedUserId:](self, "setLoggableSharedUserId:", 0);
}

- (void)setScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteScore
{
  -[ORCHSchemaORCHMultiUserScore setScore:](self, "setScore:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteUserEphemeralId
{
  -[ORCHSchemaORCHMultiUserScore setUserEphemeralId:](self, "setUserEphemeralId:", 0);
}

- (void)setUserScoreIdHash:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userScoreIdHash = a3;
}

- (BOOL)hasUserScoreIdHash
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUserScoreIdHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUserScoreIdHash
{
  -[ORCHSchemaORCHMultiUserScore setUserScoreIdHash:](self, "setUserScoreIdHash:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMultiUserScoreReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ORCHSchemaORCHMultiUserScore loggableSharedUserId](self, "loggableSharedUserId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

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
  unsigned int score;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int v20;
  unsigned int userScoreIdHash;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[ORCHSchemaORCHMultiUserScore loggableSharedUserId](self, "loggableSharedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggableSharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[ORCHSchemaORCHMultiUserScore loggableSharedUserId](self, "loggableSharedUserId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ORCHSchemaORCHMultiUserScore loggableSharedUserId](self, "loggableSharedUserId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggableSharedUserId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[36] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    if (score != objc_msgSend(v4, "score"))
      goto LABEL_15;
  }
  -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEphemeralId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEphemeralId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  else
  {

  }
  v20 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20
      || (userScoreIdHash = self->_userScoreIdHash, userScoreIdHash == objc_msgSend(v4, "userScoreIdHash")))
    {
      v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_loggableSharedUserId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_score;
  else
    v4 = 0;
  v5 = -[SISchemaUUID hash](self->_userEphemeralId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_userScoreIdHash;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_loggableSharedUserId)
  {
    -[ORCHSchemaORCHMultiUserScore loggableSharedUserId](self, "loggableSharedUserId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("loggableSharedUserId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ORCHSchemaORCHMultiUserScore score](self, "score"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("score"));

  }
  if (self->_userEphemeralId)
  {
    -[ORCHSchemaORCHMultiUserScore userEphemeralId](self, "userEphemeralId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("userEphemeralId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("userEphemeralId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ORCHSchemaORCHMultiUserScore userScoreIdHash](self, "userScoreIdHash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userScoreIdHash"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHMultiUserScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHMultiUserScore)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHMultiUserScore *v5;
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
    self = -[ORCHSchemaORCHMultiUserScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHMultiUserScore)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHMultiUserScore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaUUID *v10;
  void *v11;
  ORCHSchemaORCHMultiUserScore *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ORCHSchemaORCHMultiUserScore;
  v5 = -[ORCHSchemaORCHMultiUserScore init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggableSharedUserId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ORCHSchemaORCHMultiUserScore setLoggableSharedUserId:](v5, "setLoggableSharedUserId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMultiUserScore setScore:](v5, "setScore:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEphemeralId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v9);
      -[ORCHSchemaORCHMultiUserScore setUserEphemeralId:](v5, "setUserEphemeralId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userScoreIdHash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHMultiUserScore setUserScoreIdHash:](v5, "setUserScoreIdHash:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void)setLoggableSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)score
{
  return self->_score;
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (void)setUserEphemeralId:(id)a3
{
  objc_storeStrong((id *)&self->_userEphemeralId, a3);
}

- (unsigned)userScoreIdHash
{
  return self->_userScoreIdHash;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
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
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
}

@end
