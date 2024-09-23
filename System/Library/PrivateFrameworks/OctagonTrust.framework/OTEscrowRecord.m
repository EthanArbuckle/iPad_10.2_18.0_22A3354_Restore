@implementation OTEscrowRecord

- (void)setCreationDate:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_remainingAttempts = a3;
}

- (void)setHasRemainingAttempts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemainingAttempts
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasEscrowInformationMetadata
{
  return self->_escrowInformationMetadata != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setSilentAttemptAllowed:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_silentAttemptAllowed = a3;
}

- (void)setHasSilentAttemptAllowed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSilentAttemptAllowed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)recordStatus
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_recordStatus;
  else
    return 0;
}

- (void)setRecordStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_recordStatus = a3;
}

- (void)setHasRecordStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRecordStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)recordStatusAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("RECORD_STATUS_VALID");
  if (a3 == 1)
  {
    v3 = CFSTR("RECORD_STATUS_INVALID");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRecordStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECORD_STATUS_VALID")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("RECORD_STATUS_INVALID"));

  return v4;
}

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (int)recoveryStatus
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_recoveryStatus;
  else
    return 0;
}

- (void)setRecoveryStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_recoveryStatus = a3;
}

- (void)setHasRecoveryStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRecoveryStatus
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)recoveryStatusAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E3919280 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRecoveryStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOVERY_STATUS_VALID")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOVERY_STATUS_SOFT_LIMIT_REACHED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RECOVERY_STATUS_HARD_LIMIT_REACHED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCoolOffEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coolOffEnd = a3;
}

- (void)setHasCoolOffEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoolOffEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (int)recordViability
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_recordViability;
  else
    return 0;
}

- (void)setRecordViability:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_recordViability = a3;
}

- (void)setHasRecordViability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRecordViability
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)recordViabilityAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E3919298 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRecordViability:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECORD_VIABILITY_FULLY_VIABLE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECORD_VIABILITY_PARTIALLY_VIABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RECORD_VIABILITY_LEGACY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)viabilityStatus
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    return self->_viabilityStatus;
  else
    return 0;
}

- (void)setViabilityStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_viabilityStatus = a3;
}

- (void)setHasViabilityStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasViabilityStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)viabilityStatusAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E39192B0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsViabilityStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOS_VIABLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOS_VIABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SOS_NOT_VIABLE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasFederationId
{
  return self->_federationId != 0;
}

- (BOOL)hasExpectedFederationId
{
  return self->_expectedFederationId != 0;
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
  v8.super_class = (Class)OTEscrowRecord;
  -[OTEscrowRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTEscrowRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  OTEscrowRecordMetadata *escrowInformationMetadata;
  void *v8;
  NSString *label;
  char v10;
  void *v11;
  int recordStatus;
  __CFString *v13;
  NSString *recordId;
  char v15;
  uint64_t recoveryStatus;
  void *v17;
  void *v18;
  NSString *serialNumber;
  char v20;
  uint64_t recordViability;
  void *v22;
  uint64_t viabilityStatus;
  void *v24;
  NSString *federationId;
  NSString *expectedFederationId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_creationDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("creation_date"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_remainingAttempts);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("remaining_attempts"));

  }
  escrowInformationMetadata = self->_escrowInformationMetadata;
  if (escrowInformationMetadata)
  {
    -[OTEscrowRecordMetadata dictionaryRepresentation](escrowInformationMetadata, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("escrow_information_metadata"));

  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_silentAttemptAllowed);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("silent_attempt_allowed"));

    v10 = (char)self->_has;
  }
  if ((v10 & 0x10) != 0)
  {
    recordStatus = self->_recordStatus;
    if (recordStatus)
    {
      if (recordStatus == 1)
      {
        v13 = CFSTR("RECORD_STATUS_INVALID");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recordStatus);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = CFSTR("RECORD_STATUS_VALID");
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("record_status"));

  }
  recordId = self->_recordId;
  if (recordId)
    objc_msgSend(v3, "setObject:forKey:", recordId, CFSTR("record_id"));
  v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    recoveryStatus = self->_recoveryStatus;
    if (recoveryStatus >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recoveryStatus);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = *(&off_1E3919280 + recoveryStatus);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("recovery_status"));

    v15 = (char)self->_has;
  }
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_coolOffEnd);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("cool_off_end"));

  }
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v3, "setObject:forKey:", serialNumber, CFSTR("serial_number"));
  v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    recordViability = self->_recordViability;
    if (recordViability >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recordViability);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E3919298 + recordViability);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("record_viability"));

    v20 = (char)self->_has;
  }
  if (v20 < 0)
  {
    viabilityStatus = self->_viabilityStatus;
    if (viabilityStatus >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_viabilityStatus);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = *(&off_1E39192B0 + viabilityStatus);
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("viability_status"));

  }
  federationId = self->_federationId;
  if (federationId)
    objc_msgSend(v3, "setObject:forKey:", federationId, CFSTR("federation_id"));
  expectedFederationId = self->_expectedFederationId;
  if (expectedFederationId)
    objc_msgSend(v3, "setObject:forKey:", expectedFederationId, CFSTR("expected_federation_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  char v7;
  char v8;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  v9 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
  }
  if (self->_escrowInformationMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_recordId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    v7 = (char)self->_has;
  }
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
  }
  if (self->_serialNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    v8 = (char)self->_has;
  }
  if (v8 < 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_federationId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_expectedFederationId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  char v7;
  char v8;
  _QWORD *v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_creationDate;
    *((_BYTE *)v4 + 108) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = self->_remainingAttempts;
    *((_BYTE *)v4 + 108) |= 4u;
  }
  v9 = v4;
  if (self->_escrowInformationMetadata)
  {
    objc_msgSend(v4, "setEscrowInformationMetadata:");
    v4 = v9;
  }
  if (self->_label)
  {
    objc_msgSend(v9, "setLabel:");
    v4 = v9;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[4] = self->_silentAttemptAllowed;
    *((_BYTE *)v4 + 108) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_recordStatus;
    *((_BYTE *)v4 + 108) |= 0x10u;
  }
  if (self->_recordId)
  {
    objc_msgSend(v9, "setRecordId:");
    v4 = v9;
  }
  v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_recoveryStatus;
    *((_BYTE *)v4 + 108) |= 0x40u;
    v7 = (char)self->_has;
  }
  if ((v7 & 1) != 0)
  {
    v4[1] = self->_coolOffEnd;
    *((_BYTE *)v4 + 108) |= 1u;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v9, "setSerialNumber:");
    v4 = v9;
  }
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_recordViability;
    *((_BYTE *)v4 + 108) |= 0x20u;
    v8 = (char)self->_has;
  }
  if (v8 < 0)
  {
    *((_DWORD *)v4 + 26) = self->_viabilityStatus;
    *((_BYTE *)v4 + 108) |= 0x80u;
  }
  if (self->_federationId)
  {
    objc_msgSend(v9, "setFederationId:");
    v4 = v9;
  }
  if (self->_expectedFederationId)
  {
    objc_msgSend(v9, "setExpectedFederationId:");
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_creationDate;
    *(_BYTE *)(v5 + 108) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_remainingAttempts;
    *(_BYTE *)(v5 + 108) |= 4u;
  }
  v8 = -[OTEscrowRecordMetadata copyWithZone:](self->_escrowInformationMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_silentAttemptAllowed;
    *(_BYTE *)(v6 + 108) |= 8u;
    v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_recordStatus;
    *(_BYTE *)(v6 + 108) |= 0x10u;
  }
  v13 = -[NSString copyWithZone:](self->_recordId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v13;

  v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_recoveryStatus;
    *(_BYTE *)(v6 + 108) |= 0x40u;
    v15 = (char)self->_has;
  }
  if ((v15 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_coolOffEnd;
    *(_BYTE *)(v6 + 108) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v16;

  v18 = (char)self->_has;
  if ((v18 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_recordViability;
    *(_BYTE *)(v6 + 108) |= 0x20u;
    v18 = (char)self->_has;
  }
  if (v18 < 0)
  {
    *(_DWORD *)(v6 + 104) = self->_viabilityStatus;
    *(_BYTE *)(v6 + 108) |= 0x80u;
  }
  v19 = -[NSString copyWithZone:](self->_federationId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v19;

  v21 = -[NSString copyWithZone:](self->_expectedFederationId, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OTEscrowRecordMetadata *escrowInformationMetadata;
  NSString *label;
  char has;
  char v8;
  NSString *recordId;
  NSString *serialNumber;
  NSString *federationId;
  NSString *expectedFederationId;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_creationDate != *((_QWORD *)v4 + 2))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_remainingAttempts != *((_QWORD *)v4 + 3))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_55;
  }
  escrowInformationMetadata = self->_escrowInformationMetadata;
  if ((unint64_t)escrowInformationMetadata | *((_QWORD *)v4 + 5)
    && !-[OTEscrowRecordMetadata isEqual:](escrowInformationMetadata, "isEqual:"))
  {
    goto LABEL_55;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_55;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 108);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0 || self->_silentAttemptAllowed != *((_QWORD *)v4 + 4))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x10) == 0 || self->_recordStatus != *((_DWORD *)v4 + 20))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_55;
  }
  recordId = self->_recordId;
  if ((unint64_t)recordId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](recordId, "isEqual:"))
      goto LABEL_55;
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 108);
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_recoveryStatus != *((_DWORD *)v4 + 22))
      goto LABEL_55;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_coolOffEnd != *((_QWORD *)v4 + 1))
      goto LABEL_55;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_55;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:"))
      goto LABEL_55;
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 108);
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_recordViability != *((_DWORD *)v4 + 21))
      goto LABEL_55;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x80) == 0)
  {
    if ((v8 & 0x80) == 0)
      goto LABEL_49;
LABEL_55:
    v13 = 0;
    goto LABEL_56;
  }
  if ((v8 & 0x80) == 0 || self->_viabilityStatus != *((_DWORD *)v4 + 26))
    goto LABEL_55;
LABEL_49:
  federationId = self->_federationId;
  if ((unint64_t)federationId | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](federationId, "isEqual:"))
  {
    goto LABEL_55;
  }
  expectedFederationId = self->_expectedFederationId;
  if ((unint64_t)expectedFederationId | *((_QWORD *)v4 + 6))
    v13 = -[NSString isEqual:](expectedFederationId, "isEqual:");
  else
    v13 = 1;
LABEL_56:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  unint64_t v20;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_creationDate;
  else
    v3 = 0;
  v20 = v3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761u * self->_remainingAttempts;
  else
    v4 = 0;
  v5 = -[OTEscrowRecordMetadata hash](self->_escrowInformationMetadata, "hash");
  v6 = -[NSString hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v7 = 2654435761u * self->_silentAttemptAllowed;
  else
    v7 = 0;
  v8 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_recordStatus;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_recordId, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v11 = 2654435761 * self->_recoveryStatus;
  else
    v11 = 0;
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761u * self->_coolOffEnd;
  else
    v13 = 0;
  v14 = -[NSString hash](self->_serialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v15 = 2654435761 * self->_recordViability;
  else
    v15 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v16 = 2654435761 * self->_viabilityStatus;
  else
    v16 = 0;
  v17 = v4 ^ v20 ^ v5 ^ v8 ^ v7 ^ v9 ^ v12 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
  v18 = -[NSString hash](self->_federationId, "hash");
  return v17 ^ v18 ^ -[NSString hash](self->_expectedFederationId, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;
  char v6;
  OTEscrowRecordMetadata *escrowInformationMetadata;
  unint64_t v8;
  char v9;
  char v10;
  char v11;
  unint64_t *v12;

  v4 = (unint64_t *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 108);
  if ((v6 & 2) != 0)
  {
    self->_creationDate = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 108);
  }
  if ((v6 & 4) != 0)
  {
    self->_remainingAttempts = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  escrowInformationMetadata = self->_escrowInformationMetadata;
  v8 = v5[5];
  v12 = v5;
  if (escrowInformationMetadata)
  {
    if (!v8)
      goto LABEL_11;
    -[OTEscrowRecordMetadata mergeFrom:](escrowInformationMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    -[OTEscrowRecord setEscrowInformationMetadata:](self, "setEscrowInformationMetadata:");
  }
  v5 = v12;
LABEL_11:
  if (v5[8])
  {
    -[OTEscrowRecord setLabel:](self, "setLabel:");
    v5 = v12;
  }
  v9 = *((_BYTE *)v5 + 108);
  if ((v9 & 8) != 0)
  {
    self->_silentAttemptAllowed = v5[4];
    *(_BYTE *)&self->_has |= 8u;
    v9 = *((_BYTE *)v5 + 108);
  }
  if ((v9 & 0x10) != 0)
  {
    self->_recordStatus = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (v5[9])
  {
    -[OTEscrowRecord setRecordId:](self, "setRecordId:");
    v5 = v12;
  }
  v10 = *((_BYTE *)v5 + 108);
  if ((v10 & 0x40) != 0)
  {
    self->_recoveryStatus = *((_DWORD *)v5 + 22);
    *(_BYTE *)&self->_has |= 0x40u;
    v10 = *((_BYTE *)v5 + 108);
  }
  if ((v10 & 1) != 0)
  {
    self->_coolOffEnd = v5[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v5[12])
  {
    -[OTEscrowRecord setSerialNumber:](self, "setSerialNumber:");
    v5 = v12;
  }
  v11 = *((_BYTE *)v5 + 108);
  if ((v11 & 0x20) != 0)
  {
    self->_recordViability = *((_DWORD *)v5 + 21);
    *(_BYTE *)&self->_has |= 0x20u;
    v11 = *((_BYTE *)v5 + 108);
  }
  if (v11 < 0)
  {
    self->_viabilityStatus = *((_DWORD *)v5 + 26);
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (v5[7])
  {
    -[OTEscrowRecord setFederationId:](self, "setFederationId:");
    v5 = v12;
  }
  if (v5[6])
  {
    -[OTEscrowRecord setExpectedFederationId:](self, "setExpectedFederationId:");
    v5 = v12;
  }

}

- (unint64_t)creationDate
{
  return self->_creationDate;
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (OTEscrowRecordMetadata)escrowInformationMetadata
{
  return self->_escrowInformationMetadata;
}

- (void)setEscrowInformationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_escrowInformationMetadata, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (unint64_t)silentAttemptAllowed
{
  return self->_silentAttemptAllowed;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
  objc_storeStrong((id *)&self->_recordId, a3);
}

- (unint64_t)coolOffEnd
{
  return self->_coolOffEnd;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)federationId
{
  return self->_federationId;
}

- (void)setFederationId:(id)a3
{
  objc_storeStrong((id *)&self->_federationId, a3);
}

- (NSString)expectedFederationId
{
  return self->_expectedFederationId;
}

- (void)setExpectedFederationId:(id)a3
{
  objc_storeStrong((id *)&self->_expectedFederationId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_federationId, 0);
  objc_storeStrong((id *)&self->_expectedFederationId, 0);
  objc_storeStrong((id *)&self->_escrowInformationMetadata, 0);
}

@end
