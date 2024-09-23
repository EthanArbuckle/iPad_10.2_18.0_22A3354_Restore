@implementation ODMSiriSchemaODMSiriTurnRestatementScore

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
  v13.super_class = (Class)ODMSiriSchemaODMSiriTurnRestatementScore;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODMSiriSchemaODMSiriTurnRestatementScore deleteCurrentTurnId](self, "deleteCurrentTurnId");
  -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODMSiriSchemaODMSiriTurnRestatementScore deleteNextTurnId](self, "deleteNextTurnId");

  return v5;
}

- (BOOL)hasCurrentTurnId
{
  return self->_currentTurnId != 0;
}

- (void)deleteCurrentTurnId
{
  -[ODMSiriSchemaODMSiriTurnRestatementScore setCurrentTurnId:](self, "setCurrentTurnId:", 0);
}

- (BOOL)hasNextTurnId
{
  return self->_nextTurnId != 0;
}

- (void)deleteNextTurnId
{
  -[ODMSiriSchemaODMSiriTurnRestatementScore setNextTurnId:](self, "setNextTurnId:", 0);
}

- (void)setIsUserRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isUserRequest = a3;
}

- (BOOL)hasIsUserRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsUserRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsUserRequest
{
  -[ODMSiriSchemaODMSiriTurnRestatementScore setIsUserRequest:](self, "setIsUserRequest:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUtteranceRestatementScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_utteranceRestatementScore = a3;
}

- (BOOL)hasUtteranceRestatementScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUtteranceRestatementScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUtteranceRestatementScore
{
  -[ODMSiriSchemaODMSiriTurnRestatementScore setUtteranceRestatementScore:](self, "setUtteranceRestatementScore:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPhoneticRestatementScore:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_phoneticRestatementScore = a3;
}

- (BOOL)hasPhoneticRestatementScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPhoneticRestatementScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePhoneticRestatementScore
{
  -[ODMSiriSchemaODMSiriTurnRestatementScore setPhoneticRestatementScore:](self, "setPhoneticRestatementScore:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriTurnRestatementScoreReadFrom(self, (uint64_t)a3);
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
  -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = v10;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = v10;
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
  BOOL v17;
  $E8B7EBF99993A588C4E081FB19679AA2 has;
  unsigned int v20;
  int isUserRequest;
  int v22;
  double utteranceRestatementScore;
  double v24;
  int v25;
  double phoneticRestatementScore;
  double v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTurnId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextTurnId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[48];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      isUserRequest = self->_isUserRequest;
      if (isUserRequest != objc_msgSend(v4, "isUserRequest"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[48];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        utteranceRestatementScore = self->_utteranceRestatementScore;
        objc_msgSend(v4, "utteranceRestatementScore");
        if (utteranceRestatementScore != v24)
          goto LABEL_12;
        has = self->_has;
        v20 = v4[48];
      }
      v25 = (*(unsigned int *)&has >> 2) & 1;
      if (v25 == ((v20 >> 2) & 1))
      {
        if (!v25
          || (phoneticRestatementScore = self->_phoneticRestatementScore,
              objc_msgSend(v4, "phoneticRestatementScore"),
              phoneticRestatementScore == v27))
        {
          v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  char has;
  uint64_t v6;
  double utteranceRestatementScore;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double phoneticRestatementScore;
  double v14;
  long double v15;
  double v16;

  v3 = -[SISchemaUUID hash](self->_currentTurnId, "hash");
  v4 = -[SISchemaUUID hash](self->_nextTurnId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v6 = 2654435761 * self->_isUserRequest;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  utteranceRestatementScore = self->_utteranceRestatementScore;
  v8 = -utteranceRestatementScore;
  if (utteranceRestatementScore >= 0.0)
    v8 = self->_utteranceRestatementScore;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    phoneticRestatementScore = self->_phoneticRestatementScore;
    v14 = -phoneticRestatementScore;
    if (phoneticRestatementScore >= 0.0)
      v14 = self->_phoneticRestatementScore;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12;
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
  char has;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentTurnId)
  {
    -[ODMSiriSchemaODMSiriTurnRestatementScore currentTurnId](self, "currentTurnId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentTurnId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("currentTurnId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODMSiriSchemaODMSiriTurnRestatementScore isUserRequest](self, "isUserRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isUserRequest"));

  }
  if (self->_nextTurnId)
  {
    -[ODMSiriSchemaODMSiriTurnRestatementScore nextTurnId](self, "nextTurnId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("nextTurnId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("nextTurnId"));

    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[ODMSiriSchemaODMSiriTurnRestatementScore phoneticRestatementScore](self, "phoneticRestatementScore");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("phoneticRestatementScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[ODMSiriSchemaODMSiriTurnRestatementScore utteranceRestatementScore](self, "utteranceRestatementScore");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("utteranceRestatementScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriTurnRestatementScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriTurnRestatementScore)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriTurnRestatementScore *v5;
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
    self = -[ODMSiriSchemaODMSiriTurnRestatementScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriTurnRestatementScore)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriTurnRestatementScore *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  ODMSiriSchemaODMSiriTurnRestatementScore *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODMSiriSchemaODMSiriTurnRestatementScore;
  v5 = -[ODMSiriSchemaODMSiriTurnRestatementScore init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTurnId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriTurnRestatementScore setCurrentTurnId:](v5, "setCurrentTurnId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nextTurnId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[ODMSiriSchemaODMSiriTurnRestatementScore setNextTurnId:](v5, "setNextTurnId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUserRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTurnRestatementScore setIsUserRequest:](v5, "setIsUserRequest:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceRestatementScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      -[ODMSiriSchemaODMSiriTurnRestatementScore setUtteranceRestatementScore:](v5, "setUtteranceRestatementScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneticRestatementScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[ODMSiriSchemaODMSiriTurnRestatementScore setPhoneticRestatementScore:](v5, "setPhoneticRestatementScore:");
    }
    v13 = v5;

  }
  return v5;
}

- (SISchemaUUID)currentTurnId
{
  return self->_currentTurnId;
}

- (void)setCurrentTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurnId, a3);
}

- (SISchemaUUID)nextTurnId
{
  return self->_nextTurnId;
}

- (void)setNextTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_nextTurnId, a3);
}

- (BOOL)isUserRequest
{
  return self->_isUserRequest;
}

- (double)utteranceRestatementScore
{
  return self->_utteranceRestatementScore;
}

- (double)phoneticRestatementScore
{
  return self->_phoneticRestatementScore;
}

- (void)setHasCurrentTurnId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasNextTurnId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTurnId, 0);
  objc_storeStrong((id *)&self->_currentTurnId, 0);
}

@end
