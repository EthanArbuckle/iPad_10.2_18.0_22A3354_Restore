@implementation AWDMETRICSCellularPowerLogPLMNScanEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)scanResult
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_scanResult;
  else
    return 0;
}

- (void)setScanResult:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_scanResult = a3;
}

- (void)setHasScanResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScanResult
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)scanResultAsString:(int)a3
{
  if (a3 < 3)
    return off_251429D40[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScanResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ABORT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)scanType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_scanType;
  else
    return 0;
}

- (void)setScanType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_scanType = a3;
}

- (void)setHasScanType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScanType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)scanTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("FULL_BAND");
  if (a3 == 1)
  {
    v3 = CFSTR("ACQ_DB");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsScanType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL_BAND")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ACQ_DB"));

  return v4;
}

- (int)reasonForScan
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_reasonForScan;
  else
    return 0;
}

- (void)setReasonForScan:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reasonForScan = a3;
}

- (void)setHasReasonForScan:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReasonForScan
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)reasonForScanAsString:(int)a3
{
  if (a3 < 3)
    return off_251429D58[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReasonForScan:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIMITED_SERV_RECOVERY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANUAL_LIST_REQUESTED_BY_USER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HPPLMN_LIMITED_SERV_RECOVERY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogPLMNScanEvent;
  -[AWDMETRICSCellularPowerLogPLMNScanEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDMETRICSCellularPowerLogPLMNScanEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  uint64_t scanResult;
  __CFString *v9;
  int scanType;
  __CFString *v11;
  uint64_t reasonForScan;
  __CFString *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  scanResult = self->_scanResult;
  if (scanResult >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_scanResult);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_251429D40[scanResult];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("scan_result"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_14:
  scanType = self->_scanType;
  if (scanType)
  {
    if (scanType == 1)
    {
      v11 = CFSTR("ACQ_DB");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_scanType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = CFSTR("FULL_BAND");
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("scan_type"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("duration"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_20:
  reasonForScan = self->_reasonForScan;
  if (reasonForScan >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reasonForScan);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_251429D58[reasonForScan];
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("reason_for_scan"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_24;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subsId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogPLMNScanEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_scanResult;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 7) = self->_scanType;
  *((_BYTE *)v4 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    *((_DWORD *)v4 + 4) = self->_duration;
    *((_BYTE *)v4 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 5) = self->_reasonForScan;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((_BYTE *)v4 + 36) |= 0x20u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_scanResult;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 7) = self->_scanType;
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_reasonForScan;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_duration;
  *((_BYTE *)result + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 8) = self->_subsId;
  *((_BYTE *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_scanResult != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_scanType != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_reasonForScan != *((_DWORD *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 36) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_scanResult;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_scanType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_reasonForScan;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_duration;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_scanResult = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_scanType = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_13:
    self->_duration = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_reasonForScan = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    self->_subsId = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
