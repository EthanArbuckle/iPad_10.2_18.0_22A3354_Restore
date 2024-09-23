@implementation AWDSpringBoardSwitcherToAppTransition

- (void)dealloc
{
  objc_super v3;

  -[AWDSpringBoardSwitcherToAppTransition setSwitcherName:](self, "setSwitcherName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSwitcherToAppTransition;
  -[AWDSpringBoardSwitcherToAppTransition dealloc](&v3, sel_dealloc);
}

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

- (BOOL)hasSwitcherName
{
  return self->_switcherName != 0;
}

- (void)setAbsoluteDistanceInList:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteDistanceInList = a3;
}

- (void)setHasAbsoluteDistanceInList:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteDistanceInList
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsGoingToHomeScreen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isGoingToHomeScreen = a3;
}

- (void)setHasIsGoingToHomeScreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsGoingToHomeScreen
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSwitcherToAppTransition;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardSwitcherToAppTransition description](&v3, sel_description), -[AWDSpringBoardSwitcherToAppTransition dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *switcherName;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  switcherName = self->_switcherName;
  if (switcherName)
    objc_msgSend(v3, "setObject:forKey:", switcherName, CFSTR("switcherName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_absoluteDistanceInList), CFSTR("absoluteDistanceInList"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGoingToHomeScreen), CFSTR("isGoingToHomeScreen"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSwitcherToAppTransitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_switcherName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 2u;
  }
  if (self->_switcherName)
    objc_msgSend(a3, "setSwitcherName:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_absoluteDistanceInList;
    *((_BYTE *)a3 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)a3 + 32) = self->_isGoingToHomeScreen;
    *((_BYTE *)a3 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 36) |= 2u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_switcherName, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_absoluteDistanceInList;
    *(_BYTE *)(v6 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_isGoingToHomeScreen;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *switcherName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
      goto LABEL_17;
    }
    switcherName = self->_switcherName;
    if ((unint64_t)switcherName | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](switcherName, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_absoluteDistanceInList != *((_QWORD *)a3 + 1))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0)
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_isGoingToHomeScreen)
      {
        if (!*((_BYTE *)a3 + 32))
          goto LABEL_17;
      }
      else if (*((_BYTE *)a3 + 32))
      {
        goto LABEL_17;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_switcherName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_absoluteDistanceInList;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_isGoingToHomeScreen;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDSpringBoardSwitcherToAppTransition setSwitcherName:](self, "setSwitcherName:");
  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 1) != 0)
  {
    self->_absoluteDistanceInList = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 4) != 0)
  {
    self->_isGoingToHomeScreen = *((_BYTE *)a3 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)switcherName
{
  return self->_switcherName;
}

- (void)setSwitcherName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)absoluteDistanceInList
{
  return self->_absoluteDistanceInList;
}

- (BOOL)isGoingToHomeScreen
{
  return self->_isGoingToHomeScreen;
}

@end
