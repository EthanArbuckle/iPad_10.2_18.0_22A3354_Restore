@implementation AWDWiFiNWActivityPowerPStats

- (void)setKRadioPhyReportTxDur:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_kRadioPhyReportTxDur = a3;
}

- (void)setHasKRadioPhyReportTxDur:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKRadioPhyReportTxDur
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setKRadioPhyReportRxDur:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_kRadioPhyReportRxDur = a3;
}

- (void)setHasKRadioPhyReportRxDur:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKRadioPhyReportRxDur
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityPowerPStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityPowerPStats description](&v3, sel_description), -[AWDWiFiNWActivityPowerPStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRadioPhyReportTxDur), CFSTR("kRadioPhyReportTxDur"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_kRadioPhyReportRxDur), CFSTR("kRadioPhyReportRxDur"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityPowerPStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return;
LABEL_5:
    *((_QWORD *)a3 + 1) = self->_kRadioPhyReportRxDur;
    *((_BYTE *)a3 + 24) |= 1u;
    return;
  }
  *((_QWORD *)a3 + 2) = self->_kRadioPhyReportTxDur;
  *((_BYTE *)a3 + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_kRadioPhyReportTxDur;
    *((_BYTE *)result + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_kRadioPhyReportRxDur;
    *((_BYTE *)result + 24) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_kRadioPhyReportTxDur != *((_QWORD *)a3 + 2))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_kRadioPhyReportRxDur != *((_QWORD *)a3 + 1))
        goto LABEL_11;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_kRadioPhyReportTxDur;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_kRadioPhyReportRxDur;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 2) == 0)
  {
    if ((*((_BYTE *)a3 + 24) & 1) == 0)
      return;
LABEL_5:
    self->_kRadioPhyReportRxDur = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
  self->_kRadioPhyReportTxDur = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
    goto LABEL_5;
}

- (unint64_t)kRadioPhyReportTxDur
{
  return self->_kRadioPhyReportTxDur;
}

- (unint64_t)kRadioPhyReportRxDur
{
  return self->_kRadioPhyReportRxDur;
}

@end
