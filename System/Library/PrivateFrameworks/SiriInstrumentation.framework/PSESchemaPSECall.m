@implementation PSESchemaPSECall

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCallDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_callDurationInSeconds = a3;
}

- (BOOL)hasCallDurationInSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasCallDurationInSeconds:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteCallDurationInSeconds
{
  -[PSESchemaPSECall setCallDurationInSeconds:](self, "setCallDurationInSeconds:", 0.0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasUserInitiatedFollowup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hasUserInitiatedFollowup = a3;
}

- (BOOL)hasHasUserInitiatedFollowup
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasHasUserInitiatedFollowup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteHasUserInitiatedFollowup
{
  -[PSESchemaPSECall setHasUserInitiatedFollowup:](self, "setHasUserInitiatedFollowup:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setTimeToEstablishInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeToEstablishInSeconds = a3;
}

- (BOOL)hasTimeToEstablishInSeconds
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasTimeToEstablishInSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteTimeToEstablishInSeconds
{
  -[PSESchemaPSECall setTimeToEstablishInSeconds:](self, "setTimeToEstablishInSeconds:", 0.0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setRecentCallStatus:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recentCallStatus = a3;
}

- (BOOL)hasRecentCallStatus
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRecentCallStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteRecentCallStatus
{
  -[PSESchemaPSECall setRecentCallStatus:](self, "setRecentCallStatus:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setDisconnectedReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_disconnectedReason = a3;
}

- (BOOL)hasDisconnectedReason
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDisconnectedReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteDisconnectedReason
{
  -[PSESchemaPSECall setDisconnectedReason:](self, "setDisconnectedReason:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setContactMatch:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_contactMatch = a3;
}

- (BOOL)hasContactMatch
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasContactMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteContactMatch
{
  -[PSESchemaPSECall setContactMatch:](self, "setContactMatch:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setContactFullNamePhoneticScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_contactFullNamePhoneticScore = a3;
}

- (BOOL)hasContactFullNamePhoneticScore
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasContactFullNamePhoneticScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteContactFullNamePhoneticScore
{
  -[PSESchemaPSECall setContactFullNamePhoneticScore:](self, "setContactFullNamePhoneticScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setContactFirstNamePhoneticScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_contactFirstNamePhoneticScore = a3;
}

- (BOOL)hasContactFirstNamePhoneticScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasContactFirstNamePhoneticScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteContactFirstNamePhoneticScore
{
  -[PSESchemaPSECall setContactFirstNamePhoneticScore:](self, "setContactFirstNamePhoneticScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setContactLastNamePhoneticScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_contactLastNamePhoneticScore = a3;
}

- (BOOL)hasContactLastNamePhoneticScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasContactLastNamePhoneticScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteContactLastNamePhoneticScore
{
  -[PSESchemaPSECall setContactLastNamePhoneticScore:](self, "setContactLastNamePhoneticScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSECallReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteDoubleField();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $AB42235949FEB2A84C82C63A61872421 has;
  unsigned int v6;
  double callDurationInSeconds;
  double v8;
  int v9;
  int hasUserInitiatedFollowup;
  int v11;
  double timeToEstablishInSeconds;
  double v13;
  int v14;
  int recentCallStatus;
  int v16;
  int disconnectedReason;
  int v18;
  int contactMatch;
  int v20;
  double contactFullNamePhoneticScore;
  double v22;
  int v23;
  double contactFirstNamePhoneticScore;
  double v25;
  int v26;
  double contactLastNamePhoneticScore;
  double v28;
  BOOL v29;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_37;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    callDurationInSeconds = self->_callDurationInSeconds;
    objc_msgSend(v4, "callDurationInSeconds");
    if (callDurationInSeconds != v8)
      goto LABEL_37;
    has = self->_has;
    v6 = v4[36];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      hasUserInitiatedFollowup = self->_hasUserInitiatedFollowup;
      if (hasUserInitiatedFollowup != objc_msgSend(v4, "hasUserInitiatedFollowup"))
        goto LABEL_37;
      has = self->_has;
      v6 = v4[36];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        timeToEstablishInSeconds = self->_timeToEstablishInSeconds;
        objc_msgSend(v4, "timeToEstablishInSeconds");
        if (timeToEstablishInSeconds != v13)
          goto LABEL_37;
        has = self->_has;
        v6 = v4[36];
      }
      v14 = (*(unsigned int *)&has >> 3) & 1;
      if (v14 == ((v6 >> 3) & 1))
      {
        if (v14)
        {
          recentCallStatus = self->_recentCallStatus;
          if (recentCallStatus != objc_msgSend(v4, "recentCallStatus"))
            goto LABEL_37;
          has = self->_has;
          v6 = v4[36];
        }
        v16 = (*(unsigned int *)&has >> 4) & 1;
        if (v16 == ((v6 >> 4) & 1))
        {
          if (v16)
          {
            disconnectedReason = self->_disconnectedReason;
            if (disconnectedReason != objc_msgSend(v4, "disconnectedReason"))
              goto LABEL_37;
            has = self->_has;
            v6 = v4[36];
          }
          v18 = (*(unsigned int *)&has >> 5) & 1;
          if (v18 == ((v6 >> 5) & 1))
          {
            if (v18)
            {
              contactMatch = self->_contactMatch;
              if (contactMatch != objc_msgSend(v4, "contactMatch"))
                goto LABEL_37;
              has = self->_has;
              v6 = v4[36];
            }
            v20 = (*(unsigned int *)&has >> 6) & 1;
            if (v20 == ((v6 >> 6) & 1))
            {
              if (v20)
              {
                contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
                objc_msgSend(v4, "contactFullNamePhoneticScore");
                if (contactFullNamePhoneticScore != v22)
                  goto LABEL_37;
                has = self->_has;
                v6 = v4[36];
              }
              v23 = (*(unsigned int *)&has >> 7) & 1;
              if (v23 == ((v6 >> 7) & 1))
              {
                if (v23)
                {
                  contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
                  objc_msgSend(v4, "contactFirstNamePhoneticScore");
                  if (contactFirstNamePhoneticScore != v25)
                    goto LABEL_37;
                  has = self->_has;
                  v6 = v4[36];
                }
                v26 = (*(unsigned int *)&has >> 8) & 1;
                if (v26 == ((v6 >> 8) & 1))
                {
                  if (!v26
                    || (contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore,
                        objc_msgSend(v4, "contactLastNamePhoneticScore"),
                        contactLastNamePhoneticScore == v28))
                  {
                    v29 = 1;
                    goto LABEL_38;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_37:
  v29 = 0;
LABEL_38:

  return v29;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double callDurationInSeconds;
  double v6;
  long double v7;
  double v8;
  double timeToEstablishInSeconds;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double contactFullNamePhoneticScore;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  double contactFirstNamePhoneticScore;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  double contactLastNamePhoneticScore;
  double v29;
  long double v30;
  double v31;
  uint64_t v33;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    callDurationInSeconds = self->_callDurationInSeconds;
    v6 = -callDurationInSeconds;
    if (callDurationInSeconds >= 0.0)
      v6 = self->_callDurationInSeconds;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    v33 = 2654435761 * self->_hasUserInitiatedFollowup;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
  v33 = 0;
  if ((has & 4) == 0)
    goto LABEL_16;
LABEL_11:
  timeToEstablishInSeconds = self->_timeToEstablishInSeconds;
  v10 = -timeToEstablishInSeconds;
  if (timeToEstablishInSeconds >= 0.0)
    v10 = self->_timeToEstablishInSeconds;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 8) != 0)
  {
    v14 = 2654435761 * self->_recentCallStatus;
    if ((has & 0x10) != 0)
    {
LABEL_21:
      v15 = 2654435761 * self->_disconnectedReason;
      if ((has & 0x20) != 0)
        goto LABEL_22;
LABEL_29:
      v16 = 0;
      if ((has & 0x40) != 0)
        goto LABEL_23;
LABEL_30:
      v21 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    v14 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_21;
  }
  v15 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_29;
LABEL_22:
  v16 = 2654435761 * self->_contactMatch;
  if ((has & 0x40) == 0)
    goto LABEL_30;
LABEL_23:
  contactFullNamePhoneticScore = self->_contactFullNamePhoneticScore;
  v18 = -contactFullNamePhoneticScore;
  if (contactFullNamePhoneticScore >= 0.0)
    v18 = self->_contactFullNamePhoneticScore;
  v19 = floor(v18 + 0.5);
  v20 = (v18 - v19) * 1.84467441e19;
  v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0)
      v21 += (unint64_t)v20;
  }
  else
  {
    v21 -= (unint64_t)fabs(v20);
  }
LABEL_33:
  if ((has & 0x80) != 0)
  {
    contactFirstNamePhoneticScore = self->_contactFirstNamePhoneticScore;
    v24 = -contactFirstNamePhoneticScore;
    if (contactFirstNamePhoneticScore >= 0.0)
      v24 = self->_contactFirstNamePhoneticScore;
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
  if ((has & 0x100) != 0)
  {
    contactLastNamePhoneticScore = self->_contactLastNamePhoneticScore;
    v29 = -contactLastNamePhoneticScore;
    if (contactLastNamePhoneticScore >= 0.0)
      v29 = self->_contactLastNamePhoneticScore;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  return v33 ^ v4 ^ v13 ^ v14 ^ v15 ^ v16 ^ v21 ^ v22 ^ v27;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[PSESchemaPSECall callDurationInSeconds](self, "callDurationInSeconds");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("callDurationInSeconds"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PSESchemaPSECall contactFirstNamePhoneticScore](self, "contactFirstNamePhoneticScore");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("contactFirstNamePhoneticScore"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PSESchemaPSECall contactFullNamePhoneticScore](self, "contactFullNamePhoneticScore");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("contactFullNamePhoneticScore"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[PSESchemaPSECall contactLastNamePhoneticScore](self, "contactLastNamePhoneticScore");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("contactLastNamePhoneticScore"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_16:
  v16 = -[PSESchemaPSECall contactMatch](self, "contactMatch") - 1;
  if (v16 > 2)
    v17 = CFSTR("PSEMESSAGECONTACTMATCH_UNKNOWN");
  else
    v17 = off_1E5638CF8[v16];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("contactMatch"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_63;
  }
LABEL_20:
  v18 = -[PSESchemaPSECall disconnectedReason](self, "disconnectedReason");
  switch(v18)
  {
    case 1:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_REMOTEHANGUP");
      break;
    case 2:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_DECLINED");
      break;
    case 3:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_DECLINED_ELSEWHERE");
      break;
    case 4:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_ANSWERED_ELSEWHERE");
      break;
    case 5:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_RELAY_FAILED_RELAY_DEVICE_RELAY_NOT_ENABLED");
      break;
    case 6:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_REMOTE_UNAVAILABLE");
      break;
    case 7:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_REMOTE_BUSY");
      break;
    case 8:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_NO_LOCAL_LINK");
      break;
    case 9:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_ACCOUNT_UNSUPPORTED");
      break;
    case 10:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_NETWORK_UNSUPPORTED");
      break;
    case 11:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_CALL_FAILED");
      break;
    case 12:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_DIAL_FAILED");
      break;
    case 13:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_COMPONENT_CRASHED");
      break;
    case 14:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_RELAY_FAILED_CONFERENCE_FAILED");
      break;
    case 15:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_RELAY_FAILED_NO_RELAY_DEVICE");
      break;
    case 16:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_HOST_DEVICE_BUSY");
      break;
    case 17:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_CLIENT_DEVICE_BUSY");
      break;
    case 18:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_DECLINED_WITH_TEXT");
      break;
    case 19:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_HANDED_OFF");
      break;
    case 20:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_MMI_OR_USSD_LIKELY");
      break;
    case 21:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_FILTERED_OUT");
      break;
    case 22:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_PROVIDER_CRASHED");
      break;
    case 23:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_MEDIA_START_FAILED");
      break;
    case 24:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_MEDIA_SERVER_CRASHED");
      break;
    case 25:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_MANAGED_DEVICE_POLICY_RESTRICTED");
      break;
    case 26:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_KICKED");
      break;
    case 27:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_LET_ME_IN_REQUEST_REJECTED");
      break;
    case 28:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_INVALID_CONVERSATION_LINK");
      break;
    case 29:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_CONVERSATION_LINKS_DISABLED");
      break;
    case 30:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_NO_DESTINATIONS_AVAILABLE");
      break;
    case 31:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_CALL_FAILED_NIL_CALL_PROVIDER");
      break;
    case 32:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_APPLICATION_NOT_FOREGROUNDED");
      break;
    case 33:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_AVCONFERENCED_CRASHED");
      break;
    case 34:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_CALL_AGAIN");
      break;
    case 35:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_UNKNOWN_PARTICIPANT_ADDED");
      break;
    case 36:
      v19 = CFSTR("PSECALLDISCONNECTEDREASON_CALL_SCREENING_TIMEOUT");
      break;
    default:
      v20 = CFSTR("PSECALLDISCONNECTEDREASON_UNKNOWN");
      if (v18 == 1001)
        v20 = CFSTR("PSECALLDISCONNECTEDREASON_IDS_QUERY_RATE_LIMITED");
      if (v18 == 1000)
        v19 = CFSTR("PSECALLDISCONNECTEDREASON_DECRYPTION_TIMEOUT");
      else
        v19 = v20;
      break;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("disconnectedReason"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_64:
    v22 = -[PSESchemaPSECall recentCallStatus](self, "recentCallStatus") - 1;
    if (v22 > 9)
      v23 = CFSTR("PSECALLSTATUS_UNKNOWN");
    else
      v23 = off_1E5638D10[v22];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("recentCallStatus"));
    if ((*(_WORD *)&self->_has & 4) != 0)
      goto LABEL_10;
    goto LABEL_11;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSECall hasUserInitiatedFollowup](self, "hasUserInitiatedFollowup"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("hasUserInitiatedFollowup"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_64;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PSESchemaPSECall timeToEstablishInSeconds](self, "timeToEstablishInSeconds");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timeToEstablishInSeconds"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSECall dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSECall)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSECall *v5;
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
    self = -[PSESchemaPSECall initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSECall)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSECall *v5;
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
  PSESchemaPSECall *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PSESchemaPSECall;
  v5 = -[PSESchemaPSECall init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callDurationInSeconds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[PSESchemaPSECall setCallDurationInSeconds:](v5, "setCallDurationInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasUserInitiatedFollowup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECall setHasUserInitiatedFollowup:](v5, "setHasUserInitiatedFollowup:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToEstablishInSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[PSESchemaPSECall setTimeToEstablishInSeconds:](v5, "setTimeToEstablishInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recentCallStatus"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECall setRecentCallStatus:](v5, "setRecentCallStatus:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disconnectedReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECall setDisconnectedReason:](v5, "setDisconnectedReason:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactMatch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECall setContactMatch:](v5, "setContactMatch:", objc_msgSend(v11, "intValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactFullNamePhoneticScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[PSESchemaPSECall setContactFullNamePhoneticScore:](v5, "setContactFullNamePhoneticScore:");
    }
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactFirstNamePhoneticScore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[PSESchemaPSECall setContactFirstNamePhoneticScore:](v5, "setContactFirstNamePhoneticScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactLastNamePhoneticScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "doubleValue");
      -[PSESchemaPSECall setContactLastNamePhoneticScore:](v5, "setContactLastNamePhoneticScore:");
    }
    v16 = v5;

  }
  return v5;
}

- (double)callDurationInSeconds
{
  return self->_callDurationInSeconds;
}

- (BOOL)hasUserInitiatedFollowup
{
  return self->_hasUserInitiatedFollowup;
}

- (double)timeToEstablishInSeconds
{
  return self->_timeToEstablishInSeconds;
}

- (int)recentCallStatus
{
  return self->_recentCallStatus;
}

- (int)disconnectedReason
{
  return self->_disconnectedReason;
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
