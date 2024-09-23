@implementation CAPContactFillerUserEvent

- (void)setHighConfidenceRuleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_highConfidenceRuleCount = a3;
}

- (void)setHasHighConfidenceRuleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHighConfidenceRuleCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMediumConfidenceRuleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mediumConfidenceRuleCount = a3;
}

- (void)setHasMediumConfidenceRuleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMediumConfidenceRuleCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLowConfidenceRuleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lowConfidenceRuleCount = a3;
}

- (void)setHasLowConfidenceRuleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLowConfidenceRuleCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CAPContactFillerUserEvent;
  -[CAPContactFillerUserEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAPContactFillerUserEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_textInteractionsSent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("textInteractionsSent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_textInteractionsReceived);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("textInteractionsReceived"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shareInteractionsSent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("shareInteractionsSent"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediumConfidenceRuleCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mediumConfidenceRuleCount"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_highConfidenceRuleCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("highConfidenceRuleCount"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lowConfidenceRuleCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lowConfidenceRuleCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CAPContactFillerUserEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[7] = self->_textInteractionsSent;
  v4[6] = self->_textInteractionsReceived;
  v4[5] = self->_shareInteractionsSent;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[4] = self->_mediumConfidenceRuleCount;
    *((_BYTE *)v4 + 32) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[2] = self->_highConfidenceRuleCount;
  *((_BYTE *)v4 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_lowConfidenceRuleCount;
    *((_BYTE *)v4 + 32) |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 7) = self->_textInteractionsSent;
  *((_DWORD *)result + 6) = self->_textInteractionsReceived;
  *((_DWORD *)result + 5) = self->_shareInteractionsSent;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_highConfidenceRuleCount;
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_mediumConfidenceRuleCount;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 3) = self->_lowConfidenceRuleCount;
  *((_BYTE *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_textInteractionsSent != *((_DWORD *)v4 + 7)
    || self->_textInteractionsReceived != *((_DWORD *)v4 + 6)
    || self->_shareInteractionsSent != *((_DWORD *)v4 + 5))
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_highConfidenceRuleCount != *((_DWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_19:
    v5 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_mediumConfidenceRuleCount != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  v5 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_lowConfidenceRuleCount != *((_DWORD *)v4 + 3))
      goto LABEL_19;
    v5 = 1;
  }
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_highConfidenceRuleCount;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_mediumConfidenceRuleCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v4 = 0;
    return (2654435761 * self->_textInteractionsReceived) ^ (2654435761 * self->_textInteractionsSent) ^ (2654435761 * self->_shareInteractionsSent) ^ v2 ^ v3 ^ v4;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v4 = 2654435761 * self->_lowConfidenceRuleCount;
  return (2654435761 * self->_textInteractionsReceived) ^ (2654435761 * self->_textInteractionsSent) ^ (2654435761 * self->_shareInteractionsSent) ^ v2 ^ v3 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;

  v4 = a3;
  self->_textInteractionsSent = v4[7];
  self->_textInteractionsReceived = v4[6];
  self->_shareInteractionsSent = v4[5];
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) == 0)
  {
    if ((v4[8] & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_mediumConfidenceRuleCount = v4[4];
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[8] & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_highConfidenceRuleCount = v4[2];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_lowConfidenceRuleCount = v4[3];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (unsigned)textInteractionsSent
{
  return self->_textInteractionsSent;
}

- (void)setTextInteractionsSent:(unsigned int)a3
{
  self->_textInteractionsSent = a3;
}

- (unsigned)textInteractionsReceived
{
  return self->_textInteractionsReceived;
}

- (void)setTextInteractionsReceived:(unsigned int)a3
{
  self->_textInteractionsReceived = a3;
}

- (unsigned)shareInteractionsSent
{
  return self->_shareInteractionsSent;
}

- (void)setShareInteractionsSent:(unsigned int)a3
{
  self->_shareInteractionsSent = a3;
}

- (unsigned)highConfidenceRuleCount
{
  return self->_highConfidenceRuleCount;
}

- (unsigned)mediumConfidenceRuleCount
{
  return self->_mediumConfidenceRuleCount;
}

- (unsigned)lowConfidenceRuleCount
{
  return self->_lowConfidenceRuleCount;
}

@end
