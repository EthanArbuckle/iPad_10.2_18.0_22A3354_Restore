@implementation AWDSafariContactAutoFillDidShowSetsEvent

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

- (void)setIsShowingMeCardSets:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isShowingMeCardSets = a3;
}

- (void)setHasIsShowingMeCardSets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsShowingMeCardSets
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsShowingPreviouslyCustomizedSet:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isShowingPreviouslyCustomizedSet = a3;
}

- (void)setHasIsShowingPreviouslyCustomizedSet:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsShowingPreviouslyCustomizedSet
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariContactAutoFillDidShowSetsEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariContactAutoFillDidShowSetsEvent description](&v3, sel_description), -[AWDSafariContactAutoFillDidShowSetsEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isShowingMeCardSets), CFSTR("isShowingMeCardSets"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isShowingPreviouslyCustomizedSet), CFSTR("isShowingPreviouslyCustomizedSet"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariContactAutoFillDidShowSetsEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteBOOLField();
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
    *((_BYTE *)a3 + 20) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      *((_BYTE *)a3 + 17) = self->_isShowingPreviouslyCustomizedSet;
      *((_BYTE *)a3 + 20) |= 4u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 16) = self->_isShowingMeCardSets;
  *((_BYTE *)a3 + 20) |= 2u;
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
    *((_BYTE *)result + 20) |= 1u;
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
  *((_BYTE *)result + 16) = self->_isShowingMeCardSets;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 17) = self->_isShowingPreviouslyCustomizedSet;
  *((_BYTE *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 2) != 0)
    {
      if (self->_isShowingMeCardSets)
      {
        if (!*((_BYTE *)a3 + 16))
          goto LABEL_17;
        goto LABEL_15;
      }
      if (!*((_BYTE *)a3 + 16))
        goto LABEL_15;
    }
LABEL_17:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 20) & 2) != 0)
    goto LABEL_17;
LABEL_15:
  LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 4) == 0)
      goto LABEL_17;
    if (self->_isShowingPreviouslyCustomizedSet)
    {
      if (!*((_BYTE *)a3 + 17))
        goto LABEL_17;
    }
    else if (*((_BYTE *)a3 + 17))
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = 1;
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
  v3 = 2654435761 * self->_isShowingMeCardSets;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isShowingPreviouslyCustomizedSet;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 20);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        return;
LABEL_7:
      self->_isShowingPreviouslyCustomizedSet = *((_BYTE *)a3 + 17);
      *(_BYTE *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_isShowingMeCardSets = *((_BYTE *)a3 + 16);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 20) & 4) != 0)
    goto LABEL_7;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isShowingMeCardSets
{
  return self->_isShowingMeCardSets;
}

- (BOOL)isShowingPreviouslyCustomizedSet
{
  return self->_isShowingPreviouslyCustomizedSet;
}

@end
