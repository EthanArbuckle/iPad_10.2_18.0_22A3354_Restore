@implementation OTCDPRecoveryInformation

- (BOOL)hasRecoverySecret
{
  return self->_recoverySecret != 0;
}

- (void)setUseCachedSecret:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_useCachedSecret = a3;
}

- (void)setHasUseCachedSecret:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUseCachedSecret
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasRecoveryKey
{
  return self->_recoveryKey != 0;
}

- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_usePreviouslyCachedRecoveryKey = a3;
}

- (void)setHasUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUsePreviouslyCachedRecoveryKey
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSilentRecoveryAttempt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_silentRecoveryAttempt = a3;
}

- (void)setHasSilentRecoveryAttempt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSilentRecoveryAttempt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setContainsIcdpData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containsIcdpData = a3;
}

- (void)setHasContainsIcdpData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainsIcdpData
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUsesMultipleIcsc:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_usesMultipleIcsc = a3;
}

- (void)setHasUsesMultipleIcsc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUsesMultipleIcsc
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNonViableRepair:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nonViableRepair = a3;
}

- (void)setHasNonViableRepair:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNonViableRepair
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
  v8.super_class = (Class)OTCDPRecoveryInformation;
  -[OTCDPRecoveryInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTCDPRecoveryInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recoverySecret;
  void *v6;
  NSString *recoveryKey;
  char has;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  recoverySecret = self->_recoverySecret;
  if (recoverySecret)
    objc_msgSend(v3, "setObject:forKey:", recoverySecret, CFSTR("recovery_secret"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useCachedSecret);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("use_cached_secret"));

  }
  recoveryKey = self->_recoveryKey;
  if (recoveryKey)
    objc_msgSend(v4, "setObject:forKey:", recoveryKey, CFSTR("recovery_key"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_usePreviouslyCachedRecoveryKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("use_previously_cached_recovery_key"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_silentRecoveryAttempt);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("silent_recovery_attempt"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_usesMultipleIcsc);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("uses_multiple_icsc"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_12;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsIcdpData);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("contains_icdp_data"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nonViableRepair);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("non_viable_repair"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTCDPRecoveryInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_recoverySecret)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_recoveryKey)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_17:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_13:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_recoverySecret)
  {
    objc_msgSend(v4, "setRecoverySecret:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[27] = self->_useCachedSecret;
    v4[32] |= 8u;
  }
  if (self->_recoveryKey)
  {
    objc_msgSend(v6, "setRecoveryKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[28] = self->_usePreviouslyCachedRecoveryKey;
    v4[32] |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v4[26] = self->_silentRecoveryAttempt;
  v4[32] |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_17:
    v4[29] = self->_usesMultipleIcsc;
    v4[32] |= 0x20u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_16:
  v4[24] = self->_containsIcdpData;
  v4[32] |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    v4[25] = self->_nonViableRepair;
    v4[32] |= 2u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_recoverySecret, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 27) = self->_useCachedSecret;
    *(_BYTE *)(v5 + 32) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_recoveryKey, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 28) = self->_usePreviouslyCachedRecoveryKey;
    *(_BYTE *)(v5 + 32) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v5 + 26) = self->_silentRecoveryAttempt;
  *(_BYTE *)(v5 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_13:
    *(_BYTE *)(v5 + 29) = self->_usesMultipleIcsc;
    *(_BYTE *)(v5 + 32) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_8;
  }
LABEL_12:
  *(_BYTE *)(v5 + 24) = self->_containsIcdpData;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 25) = self->_nonViableRepair;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *recoverySecret;
  char has;
  char v7;
  NSString *recoveryKey;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  recoverySecret = self->_recoverySecret;
  if ((unint64_t)recoverySecret | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](recoverySecret, "isEqual:"))
      goto LABEL_49;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 32);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_49;
    if (self->_useCachedSecret)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_49;
  }
  recoveryKey = self->_recoveryKey;
  if ((unint64_t)recoveryKey | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](recoveryKey, "isEqual:"))
      goto LABEL_49;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 32);
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_49;
    if (self->_usePreviouslyCachedRecoveryKey)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0)
      goto LABEL_49;
    if (self->_silentRecoveryAttempt)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_49;
    if (self->_containsIcdpData)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_49;
    if (self->_usesMultipleIcsc)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  v9 = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) != 0)
    {
      if (self->_nonViableRepair)
      {
        if (!*((_BYTE *)v4 + 25))
          goto LABEL_49;
      }
      else if (*((_BYTE *)v4 + 25))
      {
        goto LABEL_49;
      }
      v9 = 1;
      goto LABEL_50;
    }
LABEL_49:
    v9 = 0;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_recoverySecret, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v4 = 2654435761 * self->_useCachedSecret;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_recoveryKey, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = 2654435761 * self->_usePreviouslyCachedRecoveryKey;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_silentRecoveryAttempt;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_containsIcdpData;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_14:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_12:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_8:
  v9 = 2654435761 * self->_usesMultipleIcsc;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_14;
LABEL_9:
  v10 = 2654435761 * self->_nonViableRepair;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[OTCDPRecoveryInformation setRecoverySecret:](self, "setRecoverySecret:");
    v4 = v6;
  }
  if ((v4[32] & 8) != 0)
  {
    self->_useCachedSecret = v4[27];
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[OTCDPRecoveryInformation setRecoveryKey:](self, "setRecoveryKey:");
    v4 = v6;
  }
  v5 = v4[32];
  if ((v5 & 0x10) != 0)
  {
    self->_usePreviouslyCachedRecoveryKey = v4[28];
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = v4[32];
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if (!v5)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((v4[32] & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_silentRecoveryAttempt = v4[26];
  *(_BYTE *)&self->_has |= 4u;
  v5 = v4[32];
  if (!v5)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
LABEL_17:
    self->_usesMultipleIcsc = v4[29];
    *(_BYTE *)&self->_has |= 0x20u;
    if ((v4[32] & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_16:
  self->_containsIcdpData = v4[24];
  *(_BYTE *)&self->_has |= 1u;
  v5 = v4[32];
  if ((v5 & 0x20) != 0)
    goto LABEL_17;
LABEL_11:
  if ((v5 & 2) != 0)
  {
LABEL_12:
    self->_nonViableRepair = v4[25];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_13:

}

- (NSString)recoverySecret
{
  return self->_recoverySecret;
}

- (void)setRecoverySecret:(id)a3
{
  objc_storeStrong((id *)&self->_recoverySecret, a3);
}

- (BOOL)useCachedSecret
{
  return self->_useCachedSecret;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryKey, a3);
}

- (BOOL)usePreviouslyCachedRecoveryKey
{
  return self->_usePreviouslyCachedRecoveryKey;
}

- (BOOL)silentRecoveryAttempt
{
  return self->_silentRecoveryAttempt;
}

- (BOOL)containsIcdpData
{
  return self->_containsIcdpData;
}

- (BOOL)usesMultipleIcsc
{
  return self->_usesMultipleIcsc;
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoverySecret, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
}

@end
