@implementation PSESchemaPSEMessage

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHasUserInitiatedFollowup:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasUserInitiatedFollowup = a3;
}

- (BOOL)hasHasUserInitiatedFollowup
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHasUserInitiatedFollowup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHasUserInitiatedFollowup
{
  -[PSESchemaPSEMessage setHasUserInitiatedFollowup:](self, "setHasUserInitiatedFollowup:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUserFollowupEventDonationTimeInSecondsSince2001:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userFollowupEventDonationTimeInSecondsSince2001 = a3;
}

- (BOOL)hasUserFollowupEventDonationTimeInSecondsSince2001
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUserFollowupEventDonationTimeInSecondsSince2001:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUserFollowupEventDonationTimeInSecondsSince2001
{
  -[PSESchemaPSEMessage setUserFollowupEventDonationTimeInSecondsSince2001:](self, "setUserFollowupEventDonationTimeInSecondsSince2001:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMessageUserFollowupAction:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_messageUserFollowupAction = a3;
}

- (BOOL)hasMessageUserFollowupAction
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMessageUserFollowupAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMessageUserFollowupAction
{
  -[PSESchemaPSEMessage setMessageUserFollowupAction:](self, "setMessageUserFollowupAction:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setContactMatch:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_contactMatch = a3;
}

- (BOOL)hasContactMatch
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasContactMatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteContactMatch
{
  -[PSESchemaPSEMessage setContactMatch:](self, "setContactMatch:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setContactFullNamePhoneticScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_contactFullNamePhoneticScore = a3;
}

- (BOOL)hasContactFullNamePhoneticScore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasContactFullNamePhoneticScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteContactFullNamePhoneticScore
{
  -[PSESchemaPSEMessage setContactFullNamePhoneticScore:](self, "setContactFullNamePhoneticScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setContactFirstNamePhoneticScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_contactFirstNamePhoneticScore = a3;
}

- (BOOL)hasContactFirstNamePhoneticScore
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasContactFirstNamePhoneticScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteContactFirstNamePhoneticScore
{
  -[PSESchemaPSEMessage setContactFirstNamePhoneticScore:](self, "setContactFirstNamePhoneticScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setContactLastNamePhoneticScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_contactLastNamePhoneticScore = a3;
}

- (BOOL)hasContactLastNamePhoneticScore
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasContactLastNamePhoneticScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteContactLastNamePhoneticScore
{
  -[PSESchemaPSEMessage setContactLastNamePhoneticScore:](self, "setContactLastNamePhoneticScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $7E2A05B1487CE0D7772F501AE8EE8F39 has;
  unsigned int v6;
  int hasUserInitiatedFollowup;
  int v8;
  double userFollowupEventDonationTimeInSecondsSince2001;
  double v10;
  int v11;
  int messageUserFollowupAction;
  int v13;
  int contactMatch;
  int v15;
  double contactFullNamePhoneticScore;
  double v17;
  int v18;
  double contactFirstNamePhoneticScore;
  double v20;
  int v21;
  double contactLastNamePhoneticScore;
  double v23;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    hasUserInitiatedFollowup = self->_hasUserInitiatedFollowup;
    if (hasUserInitiatedFollowup != objc_msgSend(v4, "hasUserInitiatedFollowup"))
      goto LABEL_29;
    has = self->_has;
    v6 = v4[56];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      userFollowupEventDonationTimeInSecondsSince2001 = self->_userFollowupEventDonationTimeInSecondsSince2001;
      objc_msgSend(v4, "userFollowupEventDonationTimeInSecondsSince2001");
      if (userFollowupEventDonationTimeInSecondsSince2001 != v10)
        goto LABEL_29;
      has = self->_has;
      v6 = v4[56];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        messageUserFollowupAction = self->_messageUserFollowupAction;
        if (messageUserFollowupAction != objc_msgSend(v4, "messageUserFollowupAction"))
          goto LABEL_29;
        has = self->_has;
        v6 = v4[56];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          contactMatch = self->_contactMatch;
          if (contactMatch != objc_msgSend(v4, "contactMatch"))
            goto LABEL_29;
          has = self->_has;
          v6 = v4[56];
        }
        v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
            objc_msgSend(v4, "contactFullNamePhoneticScore");
            if (contactFullNamePhoneticScore != v17)
              goto LABEL_29;
            has = self->_has;
            v6 = v4[56];
          }
          v18 = (*(unsigned int *)&has >> 5) & 1;
          if (v18 == ((v6 >> 5) & 1))
          {
            if (v18)
            {
              contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
              objc_msgSend(v4, "contactFirstNamePhoneticScore");
              if (contactFirstNamePhoneticScore != v20)
                goto LABEL_29;
              has = self->_has;
              v6 = v4[56];
            }
            v21 = (*(unsigned int *)&has >> 6) & 1;
            if (v21 == ((v6 >> 6) & 1))
            {
              if (!v21
                || (contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore,
                    objc_msgSend(v4, "contactLastNamePhoneticScore"),
                    contactLastNamePhoneticScore == v23))
              {
                v24 = 1;
                goto LABEL_30;
              }
            }
          }
        }
      }
    }
  }
LABEL_29:
  v24 = 0;
LABEL_30:

  return v24;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double userFollowupEventDonationTimeInSecondsSince2001;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double contactFullNamePhoneticScore;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double contactFirstNamePhoneticScore;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  double contactLastNamePhoneticScore;
  double v24;
  long double v25;
  double v26;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_hasUserInitiatedFollowup;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  userFollowupEventDonationTimeInSecondsSince2001 = self->_userFollowupEventDonationTimeInSecondsSince2001;
  v6 = -userFollowupEventDonationTimeInSecondsSince2001;
  if (userFollowupEventDonationTimeInSecondsSince2001 >= 0.0)
    v6 = self->_userFollowupEventDonationTimeInSecondsSince2001;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) == 0)
  {
    v10 = 0;
    if ((has & 8) != 0)
      goto LABEL_13;
LABEL_19:
    v11 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_14;
LABEL_20:
    v16 = 0;
    goto LABEL_23;
  }
  v10 = 2654435761 * self->_messageUserFollowupAction;
  if ((has & 8) == 0)
    goto LABEL_19;
LABEL_13:
  v11 = 2654435761 * self->_contactMatch;
  if ((has & 0x10) == 0)
    goto LABEL_20;
LABEL_14:
  contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
  v13 = -contactFullNamePhoneticScore;
  if (contactFullNamePhoneticScore >= 0.0)
    v13 = self->_contactFullNamePhoneticScore;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_23:
  if ((has & 0x20) != 0)
  {
    contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
    v19 = -contactFirstNamePhoneticScore;
    if (contactFirstNamePhoneticScore >= 0.0)
      v19 = self->_contactFirstNamePhoneticScore;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((has & 0x40) != 0)
  {
    contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore;
    v24 = -contactLastNamePhoneticScore;
    if (contactLastNamePhoneticScore >= 0.0)
      v24 = self->_contactLastNamePhoneticScore;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v11 ^ v16 ^ v17 ^ v22;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[PSESchemaPSEMessage contactFirstNamePhoneticScore](self, "contactFirstNamePhoneticScore");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactFirstNamePhoneticScore"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PSESchemaPSEMessage contactFullNamePhoneticScore](self, "contactFullNamePhoneticScore");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("contactFullNamePhoneticScore"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PSESchemaPSEMessage contactLastNamePhoneticScore](self, "contactLastNamePhoneticScore");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("contactLastNamePhoneticScore"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_13:
  v14 = -[PSESchemaPSEMessage contactMatch](self, "contactMatch") - 1;
  if (v14 > 2)
    v15 = CFSTR("PSEMESSAGECONTACTMATCH_UNKNOWN");
  else
    v15 = off_1E5639428[v14];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("contactMatch"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_18:
    v17 = -[PSESchemaPSEMessage messageUserFollowupAction](self, "messageUserFollowupAction") - 1;
    if (v17 > 3)
      v18 = CFSTR("PSEMESSAGEUSERFOLLOWUPACTION_UNKNOWN");
    else
      v18 = off_1E5639440[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("messageUserFollowupAction"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
    goto LABEL_9;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMessage hasUserInitiatedFollowup](self, "hasUserInitiatedFollowup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasUserInitiatedFollowup"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_18;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PSESchemaPSEMessage userFollowupEventDonationTimeInSecondsSince2001](self, "userFollowupEventDonationTimeInSecondsSince2001");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("userFollowupEventDonationTimeInSecondsSince2001"));

  }
LABEL_9:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEMessage)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEMessage *v5;
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
    self = -[PSESchemaPSEMessage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEMessage)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PSESchemaPSEMessage *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSESchemaPSEMessage;
  v5 = -[PSESchemaPSEMessage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasUserInitiatedFollowup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMessage setHasUserInitiatedFollowup:](v5, "setHasUserInitiatedFollowup:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFollowupEventDonationTimeInSecondsSince2001"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[PSESchemaPSEMessage setUserFollowupEventDonationTimeInSecondsSince2001:](v5, "setUserFollowupEventDonationTimeInSecondsSince2001:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageUserFollowupAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMessage setMessageUserFollowupAction:](v5, "setMessageUserFollowupAction:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactMatch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMessage setContactMatch:](v5, "setContactMatch:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactFullNamePhoneticScore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[PSESchemaPSEMessage setContactFullNamePhoneticScore:](v5, "setContactFullNamePhoneticScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactFirstNamePhoneticScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      -[PSESchemaPSEMessage setContactFirstNamePhoneticScore:](v5, "setContactFirstNamePhoneticScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactLastNamePhoneticScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[PSESchemaPSEMessage setContactLastNamePhoneticScore:](v5, "setContactLastNamePhoneticScore:");
    }
    v13 = v5;

  }
  return v5;
}

- (BOOL)hasUserInitiatedFollowup
{
  return self->_hasUserInitiatedFollowup;
}

- (double)userFollowupEventDonationTimeInSecondsSince2001
{
  return self->_userFollowupEventDonationTimeInSecondsSince2001;
}

- (int)messageUserFollowupAction
{
  return self->_messageUserFollowupAction;
}

- (int)contactMatch
{
  return self->_contactMatch;
}

- (double)contactFullNamePhoneticScore
{
  return self->_contactFullNamePhoneticScore;
}

- (double)contactFirstNamePhoneticScore
{
  return self->_contactFirstNamePhoneticScore;
}

- (double)contactLastNamePhoneticScore
{
  return self->_contactLastNamePhoneticScore;
}

@end
