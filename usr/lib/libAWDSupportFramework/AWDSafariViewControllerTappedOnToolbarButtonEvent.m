@implementation AWDSafariViewControllerTappedOnToolbarButtonEvent

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

- (int)button
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_button;
  else
    return 0;
}

- (void)setButton:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_button = a3;
}

- (void)setHasButton:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasButton
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)buttonAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E398[a3];
}

- (int)StringAsButton:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_BACK_BUTTON")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_FORWARD_BUTTON")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_SHARE_BUTTON")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_OPEN_IN_SAFARI_BUTTON")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_RELOAD_BUTTON")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_STOP_BUTTON")) & 1) != 0)
    return 5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SFVC_FORMAT_MENU_BUTTON")))
    return 6;
  return 0;
}

- (void)setUsedLongTap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_usedLongTap = a3;
}

- (void)setHasUsedLongTap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsedLongTap
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariViewControllerTappedOnToolbarButtonEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariViewControllerTappedOnToolbarButtonEvent description](&v3, sel_description), -[AWDSafariViewControllerTappedOnToolbarButtonEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t button;
  __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    button = self->_button;
    if (button >= 7)
      v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_button);
    else
      v7 = off_24C10E398[button];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("button"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    return v3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_usedLongTap), CFSTR("usedLongTap"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariViewControllerTappedOnToolbarButtonEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      PBDataWriterWriteBOOLField();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      *((_BYTE *)a3 + 20) = self->_usedLongTap;
      *((_BYTE *)a3 + 24) |= 4u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_button;
  *((_BYTE *)a3 + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
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
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_button;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 20) = self->_usedLongTap;
  *((_BYTE *)result + 24) |= 4u;
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
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
      goto LABEL_14;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_button != *((_DWORD *)a3 + 4))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
      goto LABEL_14;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 4) == 0)
      {
LABEL_14:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_usedLongTap)
      {
        if (!*((_BYTE *)a3 + 20))
          goto LABEL_14;
      }
      else if (*((_BYTE *)a3 + 20))
      {
        goto LABEL_14;
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

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_button;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_usedLongTap;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 24);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        return;
LABEL_7:
      self->_usedLongTap = *((_BYTE *)a3 + 20);
      *(_BYTE *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_button = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 24) & 4) != 0)
    goto LABEL_7;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)usedLongTap
{
  return self->_usedLongTap;
}

@end
