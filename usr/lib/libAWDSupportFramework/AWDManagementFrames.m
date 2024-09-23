@implementation AWDManagementFrames

- (void)setAssocRequest:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_assocRequest = a3;
}

- (void)setHasAssocRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAssocRequest
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAssocResponse:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_assocResponse = a3;
}

- (void)setHasAssocResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAssocResponse
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setReassocRequest:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_reassocRequest = a3;
}

- (void)setHasReassocRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasReassocRequest
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setReassocResponse:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_reassocResponse = a3;
}

- (void)setHasReassocResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasReassocResponse
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setProbeRequest:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_probeRequest = a3;
}

- (void)setHasProbeRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasProbeRequest
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setProbeResponse:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_probeResponse = a3;
}

- (void)setHasProbeResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasProbeResponse
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBeacon:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_beacon = a3;
}

- (void)setHasBeacon:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBeacon
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setATIM:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_aTIM = a3;
}

- (void)setHasATIM:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasATIM
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDisassoc:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_disassoc = a3;
}

- (void)setHasDisassoc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDisassoc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAuth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_auth = a3;
}

- (void)setHasAuth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAuth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDeauth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deauth = a3;
}

- (void)setHasDeauth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDeauth
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAction:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAction
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDManagementFrames;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDManagementFrames description](&v3, sel_description), -[AWDManagementFrames dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_assocRequest), CFSTR("assocRequest"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_assocResponse), CFSTR("assocResponse"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_reassocRequest), CFSTR("reassocRequest"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_reassocResponse), CFSTR("reassocResponse"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_probeRequest), CFSTR("probeRequest"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_probeResponse), CFSTR("probeResponse"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beacon), CFSTR("beacon"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_aTIM), CFSTR("ATIM"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_disassoc), CFSTR("disassoc"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_deauth), CFSTR("deauth"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_auth), CFSTR("auth"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 2) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_action), CFSTR("action"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDManagementFramesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      return;
LABEL_25:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_25;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_assocRequest;
    *((_WORD *)a3 + 52) |= 4u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_assocResponse;
  *((_WORD *)a3 + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 11) = self->_reassocRequest;
  *((_WORD *)a3 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 12) = self->_reassocResponse;
  *((_WORD *)a3 + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 9) = self->_probeRequest;
  *((_WORD *)a3 + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 10) = self->_probeResponse;
  *((_WORD *)a3 + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 6) = self->_beacon;
  *((_WORD *)a3 + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 1) = self->_aTIM;
  *((_WORD *)a3 + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 8) = self->_disassoc;
  *((_WORD *)a3 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 5) = self->_auth;
  *((_WORD *)a3 + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      return;
LABEL_25:
    *((_QWORD *)a3 + 2) = self->_action;
    *((_WORD *)a3 + 52) |= 2u;
    return;
  }
LABEL_24:
  *((_QWORD *)a3 + 7) = self->_deauth;
  *((_WORD *)a3 + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_assocRequest;
    *((_WORD *)result + 52) |= 4u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_assocResponse;
  *((_WORD *)result + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 11) = self->_reassocRequest;
  *((_WORD *)result + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 12) = self->_reassocResponse;
  *((_WORD *)result + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 9) = self->_probeRequest;
  *((_WORD *)result + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 10) = self->_probeResponse;
  *((_WORD *)result + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 6) = self->_beacon;
  *((_WORD *)result + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 1) = self->_aTIM;
  *((_WORD *)result + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 8) = self->_disassoc;
  *((_WORD *)result + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 5) = self->_auth;
  *((_WORD *)result + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_QWORD *)result + 7) = self->_deauth;
  *((_WORD *)result + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_13:
  *((_QWORD *)result + 2) = self->_action;
  *((_WORD *)result + 52) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 52);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_assocRequest != *((_QWORD *)a3 + 3))
        goto LABEL_61;
    }
    else if ((v7 & 4) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_assocResponse != *((_QWORD *)a3 + 4))
        goto LABEL_61;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_reassocRequest != *((_QWORD *)a3 + 11))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_reassocResponse != *((_QWORD *)a3 + 12))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_probeRequest != *((_QWORD *)a3 + 9))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_probeResponse != *((_QWORD *)a3 + 10))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_beacon != *((_QWORD *)a3 + 6))
        goto LABEL_61;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_aTIM != *((_QWORD *)a3 + 1))
        goto LABEL_61;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_disassoc != *((_QWORD *)a3 + 8))
        goto LABEL_61;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_auth != *((_QWORD *)a3 + 5))
        goto LABEL_61;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_deauth != *((_QWORD *)a3 + 7))
        goto LABEL_61;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_action != *((_QWORD *)a3 + 2))
        goto LABEL_61;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v3 = 2654435761u * self->_assocRequest;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_assocResponse;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_reassocRequest;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_reassocResponse;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_probeRequest;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_probeResponse;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_beacon;
    if ((has & 1) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 1) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_aTIM;
    if ((has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_disassoc;
    if ((has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_auth;
    if ((has & 0x40) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((has & 2) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761u * self->_deauth;
  if ((has & 2) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761u * self->_action;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 4) != 0)
  {
    self->_assocRequest = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    v3 = *((_WORD *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_assocResponse = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_4:
    if ((v3 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_reassocRequest = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_reassocResponse = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_probeRequest = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_probeResponse = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_beacon = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_aTIM = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_disassoc = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_11:
    if ((v3 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_auth = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_12:
    if ((v3 & 2) == 0)
      return;
LABEL_25:
    self->_action = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_24:
  self->_deauth = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 52) & 2) != 0)
    goto LABEL_25;
}

- (unint64_t)assocRequest
{
  return self->_assocRequest;
}

- (unint64_t)assocResponse
{
  return self->_assocResponse;
}

- (unint64_t)reassocRequest
{
  return self->_reassocRequest;
}

- (unint64_t)reassocResponse
{
  return self->_reassocResponse;
}

- (unint64_t)probeRequest
{
  return self->_probeRequest;
}

- (unint64_t)probeResponse
{
  return self->_probeResponse;
}

- (unint64_t)beacon
{
  return self->_beacon;
}

- (unint64_t)aTIM
{
  return self->_aTIM;
}

- (unint64_t)disassoc
{
  return self->_disassoc;
}

- (unint64_t)auth
{
  return self->_auth;
}

- (unint64_t)deauth
{
  return self->_deauth;
}

- (unint64_t)action
{
  return self->_action;
}

@end
