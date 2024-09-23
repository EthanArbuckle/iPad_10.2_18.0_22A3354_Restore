@implementation SIRINLUEXTERNALAsrTokenInformation

- (BOOL)hasPostItnText
{
  return self->_postItnText != 0;
}

- (BOOL)hasPhoneSequence
{
  return self->_phoneSequence != 0;
}

- (BOOL)hasIpaPhoneSequence
{
  return self->_ipaPhoneSequence != 0;
}

- (void)setAddSpaceAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_addSpaceAfter = a3;
}

- (void)setHasAddSpaceAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAddSpaceAfter
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_removeSpaceAfter = a3;
}

- (void)setHasRemoveSpaceAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRemoveSpaceAfter
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_removeSpaceBefore = a3;
}

- (void)setHasRemoveSpaceBefore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasRemoveSpaceBefore
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setConfidenceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidenceScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBeginIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_beginIndex = a3;
}

- (void)setHasBeginIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBeginIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endIndex = a3;
}

- (void)setHasEndIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setStartMilliSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_startMilliSeconds = a3;
}

- (void)setHasStartMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEndMilliSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endMilliSeconds = a3;
}

- (void)setHasEndMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)SIRINLUEXTERNALAsrTokenInformation;
  -[SIRINLUEXTERNALAsrTokenInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALAsrTokenInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *postItnText;
  NSString *phoneSequence;
  NSString *ipaPhoneSequence;
  char has;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  postItnText = self->_postItnText;
  if (postItnText)
    objc_msgSend(v3, "setObject:forKey:", postItnText, CFSTR("post_itn_text"));
  phoneSequence = self->_phoneSequence;
  if (phoneSequence)
    objc_msgSend(v4, "setObject:forKey:", phoneSequence, CFSTR("phone_sequence"));
  ipaPhoneSequence = self->_ipaPhoneSequence;
  if (ipaPhoneSequence)
    objc_msgSend(v4, "setObject:forKey:", ipaPhoneSequence, CFSTR("ipa_phone_sequence"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addSpaceAfter);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("add_space_after"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceAfter);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("remove_space_after"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceBefore);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("remove_space_before"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidenceScore);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("confidence_score"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_beginIndex);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("begin_index"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_14;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_startMilliSeconds);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("start_milli_seconds"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v4;
    goto LABEL_15;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endIndex);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("end_index"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_23;
LABEL_14:
  if ((has & 8) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endMilliSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("end_milli_seconds"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALAsrTokenInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_postItnText)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_phoneSequence)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_ipaPhoneSequence)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_14;
LABEL_23:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_23;
LABEL_14:
  if ((has & 8) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_16:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_postItnText)
  {
    objc_msgSend(v4, "setPostItnText:");
    v4 = v6;
  }
  if (self->_phoneSequence)
  {
    objc_msgSend(v6, "setPhoneSequence:");
    v4 = v6;
  }
  if (self->_ipaPhoneSequence)
  {
    objc_msgSend(v6, "setIpaPhoneSequence:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 60) = self->_addSpaceAfter;
    *((_BYTE *)v4 + 64) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 61) = self->_removeSpaceAfter;
  *((_BYTE *)v4 + 64) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 62) = self->_removeSpaceBefore;
  *((_BYTE *)v4 + 64) |= 0x80u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_confidenceScore;
  *((_BYTE *)v4 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 4) = self->_beginIndex;
  *((_BYTE *)v4 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_14;
LABEL_23:
    *((_DWORD *)v4 + 14) = self->_startMilliSeconds;
    *((_BYTE *)v4 + 64) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_22:
  *((_DWORD *)v4 + 5) = self->_endIndex;
  *((_BYTE *)v4 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_23;
LABEL_14:
  if ((has & 8) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 6) = self->_endMilliSeconds;
    *((_BYTE *)v4 + 64) |= 8u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_postItnText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_phoneSequence, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_ipaPhoneSequence, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_addSpaceAfter;
    *(_BYTE *)(v5 + 64) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 61) = self->_removeSpaceAfter;
  *(_BYTE *)(v5 + 64) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_BYTE *)(v5 + 62) = self->_removeSpaceBefore;
  *(_BYTE *)(v5 + 64) |= 0x80u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(double *)(v5 + 8) = self->_confidenceScore;
  *(_BYTE *)(v5 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 16) = self->_beginIndex;
  *(_BYTE *)(v5 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
LABEL_17:
    *(_DWORD *)(v5 + 56) = self->_startMilliSeconds;
    *(_BYTE *)(v5 + 64) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v5;
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 20) = self->_endIndex;
  *(_BYTE *)(v5 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 24) = self->_endMilliSeconds;
    *(_BYTE *)(v5 + 64) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *postItnText;
  NSString *phoneSequence;
  NSString *ipaPhoneSequence;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  postItnText = self->_postItnText;
  if ((unint64_t)postItnText | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](postItnText, "isEqual:"))
      goto LABEL_56;
  }
  phoneSequence = self->_phoneSequence;
  if ((unint64_t)phoneSequence | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](phoneSequence, "isEqual:"))
      goto LABEL_56;
  }
  ipaPhoneSequence = self->_ipaPhoneSequence;
  if ((unint64_t)ipaPhoneSequence | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](ipaPhoneSequence, "isEqual:"))
      goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0)
      goto LABEL_56;
    if (self->_addSpaceAfter)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x40) == 0)
      goto LABEL_56;
    if (self->_removeSpaceAfter)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x80) == 0)
      goto LABEL_26;
LABEL_56:
    v8 = 0;
    goto LABEL_57;
  }
  if ((*((_BYTE *)v4 + 64) & 0x80) == 0)
    goto LABEL_56;
  if (self->_removeSpaceBefore)
  {
    if (!*((_BYTE *)v4 + 62))
      goto LABEL_56;
  }
  else if (*((_BYTE *)v4 + 62))
  {
    goto LABEL_56;
  }
LABEL_26:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_confidenceScore != *((double *)v4 + 1))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_beginIndex != *((_DWORD *)v4 + 4))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_endIndex != *((_DWORD *)v4 + 5))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_startMilliSeconds != *((_DWORD *)v4 + 14))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  v8 = (*((_BYTE *)v4 + 64) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_endMilliSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_56;
    v8 = 1;
  }
LABEL_57:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  char has;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double confidenceScore;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = -[NSString hash](self->_postItnText, "hash");
  v4 = -[NSString hash](self->_phoneSequence, "hash");
  v5 = -[NSString hash](self->_ipaPhoneSequence, "hash");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v7 = 2654435761 * self->_addSpaceAfter;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_removeSpaceAfter;
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
        goto LABEL_4;
LABEL_11:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v14 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_11;
LABEL_4:
  v9 = 2654435761 * self->_removeSpaceBefore;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_5:
  confidenceScore = self->_confidenceScore;
  v11 = -confidenceScore;
  if (confidenceScore >= 0.0)
    v11 = self->_confidenceScore;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_15:
  if ((has & 2) != 0)
  {
    v15 = 2654435761 * self->_beginIndex;
    if ((has & 4) != 0)
    {
LABEL_17:
      v16 = 2654435761 * self->_endIndex;
      if ((has & 0x10) != 0)
        goto LABEL_18;
LABEL_22:
      v17 = 0;
      if ((has & 8) != 0)
        goto LABEL_19;
LABEL_23:
      v18 = 0;
      return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    v15 = 0;
    if ((has & 4) != 0)
      goto LABEL_17;
  }
  v16 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_22;
LABEL_18:
  v17 = 2654435761 * self->_startMilliSeconds;
  if ((has & 8) == 0)
    goto LABEL_23;
LABEL_19:
  v18 = 2654435761 * self->_endMilliSeconds;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[SIRINLUEXTERNALAsrTokenInformation setPostItnText:](self, "setPostItnText:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SIRINLUEXTERNALAsrTokenInformation setPhoneSequence:](self, "setPhoneSequence:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SIRINLUEXTERNALAsrTokenInformation setIpaPhoneSequence:](self, "setIpaPhoneSequence:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 0x20) != 0)
  {
    self->_addSpaceAfter = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 64);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_removeSpaceAfter = *((_BYTE *)v4 + 61);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  self->_removeSpaceBefore = *((_BYTE *)v4 + 62);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  self->_confidenceScore = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  self->_beginIndex = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0)
      goto LABEL_14;
LABEL_23:
    self->_startMilliSeconds = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 64) & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_22:
  self->_endIndex = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 0x10) != 0)
    goto LABEL_23;
LABEL_14:
  if ((v5 & 8) != 0)
  {
LABEL_15:
    self->_endMilliSeconds = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_16:

}

- (NSString)postItnText
{
  return self->_postItnText;
}

- (void)setPostItnText:(id)a3
{
  objc_storeStrong((id *)&self->_postItnText, a3);
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSequence, a3);
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setIpaPhoneSequence:(id)a3
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, a3);
}

- (BOOL)addSpaceAfter
{
  return self->_addSpaceAfter;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (unsigned)beginIndex
{
  return self->_beginIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postItnText, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
}

@end
