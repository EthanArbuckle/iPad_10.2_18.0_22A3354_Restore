@implementation AWDSpringBoardClawGesture

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDidPressLock:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_didPressLock = a3;
}

- (void)setHasDidPressLock:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDidPressLock
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDidPressVolumeUp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_didPressVolumeUp = a3;
}

- (void)setHasDidPressVolumeUp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDidPressVolumeUp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDidPressVolumeDown:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_didPressVolumeDown = a3;
}

- (void)setHasDidPressVolumeDown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDidPressVolumeDown
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDidTriggerSOS:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_didTriggerSOS = a3;
}

- (void)setHasDidTriggerSOS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDidTriggerSOS
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardClawGesture;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardClawGesture description](&v3, sel_description), -[AWDSpringBoardClawGesture dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didPressLock), CFSTR("didPressLock"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didPressVolumeUp), CFSTR("didPressVolumeUp"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didTriggerSOS), CFSTR("didTriggerSOS"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didPressVolumeDown), CFSTR("didPressVolumeDown"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardClawGestureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 24) = self->_didPressLock;
  *((_BYTE *)a3 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)a3 + 26) = self->_didPressVolumeUp;
  *((_BYTE *)a3 + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)a3 + 25) = self->_didPressVolumeDown;
  *((_BYTE *)a3 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      return;
LABEL_13:
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_BYTE *)a3 + 28) |= 1u;
    return;
  }
LABEL_12:
  *((_BYTE *)a3 + 27) = self->_didTriggerSOS;
  *((_BYTE *)a3 + 28) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_timestamp;
    *((_BYTE *)result + 28) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 24) = self->_didPressLock;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 26) = self->_didPressVolumeUp;
  *((_BYTE *)result + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 25) = self->_didPressVolumeDown;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 27) = self->_didTriggerSOS;
  *((_BYTE *)result + 28) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 1) = self->_duration;
  *((_BYTE *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)a3 + 28) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 4) == 0)
      goto LABEL_43;
    if (self->_didPressLock)
    {
      if (!*((_BYTE *)a3 + 24))
        goto LABEL_43;
    }
    else if (*((_BYTE *)a3 + 24))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 0x10) == 0)
      goto LABEL_43;
    if (self->_didPressVolumeUp)
    {
      if (!*((_BYTE *)a3 + 26))
        goto LABEL_43;
    }
    else if (*((_BYTE *)a3 + 26))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 8) == 0)
      goto LABEL_43;
    if (self->_didPressVolumeDown)
    {
      if (!*((_BYTE *)a3 + 25))
        goto LABEL_43;
    }
    else if (*((_BYTE *)a3 + 25))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 28) & 0x20) != 0)
      goto LABEL_43;
    goto LABEL_39;
  }
  if ((*((_BYTE *)a3 + 28) & 0x20) == 0)
    goto LABEL_43;
  if (self->_didTriggerSOS)
  {
    if (!*((_BYTE *)a3 + 27))
      goto LABEL_43;
    goto LABEL_39;
  }
  if (*((_BYTE *)a3 + 27))
  {
LABEL_43:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_39:
  LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
      goto LABEL_43;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_didPressLock;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_didPressVolumeUp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_didPressVolumeDown;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_didTriggerSOS;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761u * self->_duration;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_didPressLock = *((_BYTE *)a3 + 24);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_didPressVolumeUp = *((_BYTE *)a3 + 26);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_didPressVolumeDown = *((_BYTE *)a3 + 25);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0)
      return;
LABEL_13:
    self->_duration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
LABEL_12:
  self->_didTriggerSOS = *((_BYTE *)a3 + 27);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 28) & 1) != 0)
    goto LABEL_13;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)didPressLock
{
  return self->_didPressLock;
}

- (BOOL)didPressVolumeUp
{
  return self->_didPressVolumeUp;
}

- (BOOL)didPressVolumeDown
{
  return self->_didPressVolumeDown;
}

- (BOOL)didTriggerSOS
{
  return self->_didTriggerSOS;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end
