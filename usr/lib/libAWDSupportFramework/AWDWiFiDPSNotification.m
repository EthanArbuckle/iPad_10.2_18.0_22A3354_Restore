@implementation AWDWiFiDPSNotification

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

- (int)symptom
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_symptom;
  else
    return 0;
}

- (void)setSymptom:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_symptom = a3;
}

- (void)setHasSymptom:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSymptom
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)symptomAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E5E8 + a3);
}

- (int)StringAsSymptom:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDriverDetectedStall")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDriverDetectedSlow")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kUserToggleOff")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kUserToggleOn")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kSymptomsdTrigger")))
    return 4;
  return 0;
}

- (void)setProblemAC:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_problemAC = a3;
}

- (void)setHasProblemAC:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProblemAC
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFacetimeCallInProgress:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_facetimeCallInProgress = a3;
}

- (void)setHasFacetimeCallInProgress:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFacetimeCallInProgress
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSNotification;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiDPSNotification description](&v3, sel_description), -[AWDWiFiDPSNotification dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t symptom;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_problemAC), CFSTR("problemAC"));
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  symptom = self->_symptom;
  if (symptom >= 5)
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_symptom);
  else
    v7 = (uint64_t)*(&off_24C10E5E8 + symptom);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("symptom"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_12;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_facetimeCallInProgress), CFSTR("facetimeCallInProgress"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return;
LABEL_9:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_8:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_9;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_symptom;
  *((_BYTE *)a3 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return;
LABEL_9:
    *((_BYTE *)a3 + 24) = self->_facetimeCallInProgress;
    *((_BYTE *)a3 + 28) |= 8u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 4) = self->_problemAC;
  *((_BYTE *)a3 + 28) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_9;
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
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_symptom;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_problemAC;
  *((_BYTE *)result + 28) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_5:
  *((_BYTE *)result + 24) = self->_facetimeCallInProgress;
  *((_BYTE *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
      goto LABEL_19;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_symptom != *((_DWORD *)a3 + 5))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 28) & 4) != 0)
    {
      goto LABEL_19;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_problemAC != *((_DWORD *)a3 + 4))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 28) & 2) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 8) == 0)
      {
LABEL_19:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_facetimeCallInProgress)
      {
        if (!*((_BYTE *)a3 + 24))
          goto LABEL_19;
      }
      else if (*((_BYTE *)a3 + 24))
      {
        goto LABEL_19;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_symptom;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_problemAC;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_facetimeCallInProgress;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_symptom = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      return;
LABEL_9:
    self->_facetimeCallInProgress = *((_BYTE *)a3 + 24);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
LABEL_8:
  self->_problemAC = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 28) & 8) != 0)
    goto LABEL_9;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)problemAC
{
  return self->_problemAC;
}

- (BOOL)facetimeCallInProgress
{
  return self->_facetimeCallInProgress;
}

@end
