@implementation AWDDuetExpertCenterZKWOutcome

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setExpert:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expert = a3;
}

- (void)setHasExpert:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpert
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEngaged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_engaged = a3;
}

- (void)setHasEngaged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEngaged
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setItemsShown:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_itemsShown = a3;
}

- (void)setHasItemsShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasItemsShown
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTypedQuery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_typedQuery = a3;
}

- (void)setHasTypedQuery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasTypedQuery
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setItemSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_itemSelected = a3;
}

- (void)setHasItemSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasItemSelected
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEgress:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_egress = a3;
}

- (void)setHasEgress:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEgress
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSameCategorySelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sameCategorySelected = a3;
}

- (void)setHasSameCategorySelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSameCategorySelected
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDDuetExpertCenterZKWOutcome;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDDuetExpertCenterZKWOutcome description](&v3, sel_description), -[AWDDuetExpertCenterZKWOutcome dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_expert), CFSTR("expert"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_engaged), CFSTR("engaged"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_itemsShown), CFSTR("itemsShown"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_typedQuery), CFSTR("typedQuery"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_egress), CFSTR("egress"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_itemSelected), CFSTR("itemSelected"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x40) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sameCategorySelected), CFSTR("sameCategorySelected"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDuetExpertCenterZKWOutcomeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return;
LABEL_17:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_expert;
  *((_BYTE *)a3 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)a3 + 36) = self->_engaged;
  *((_BYTE *)a3 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 8) = self->_itemsShown;
  *((_BYTE *)a3 + 40) |= 8u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)a3 + 39) = self->_typedQuery;
  *((_BYTE *)a3 + 40) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)a3 + 37) = self->_itemSelected;
  *((_BYTE *)a3 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return;
LABEL_17:
    *((_BYTE *)a3 + 38) = self->_sameCategorySelected;
    *((_BYTE *)a3 + 40) |= 0x40u;
    return;
  }
LABEL_16:
  *((_QWORD *)a3 + 1) = self->_egress;
  *((_BYTE *)a3 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_timestamp;
    *((_BYTE *)result + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_expert;
  *((_BYTE *)result + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 36) = self->_engaged;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_itemsShown;
  *((_BYTE *)result + 40) |= 8u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)result + 39) = self->_typedQuery;
  *((_BYTE *)result + 40) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)result + 37) = self->_itemSelected;
  *((_BYTE *)result + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_QWORD *)result + 1) = self->_egress;
  *((_BYTE *)result + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_9:
  *((_BYTE *)result + 38) = self->_sameCategorySelected;
  *((_BYTE *)result + 40) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)a3 + 40) & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_expert != *((_QWORD *)a3 + 2))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 0x10) == 0)
      goto LABEL_48;
    if (self->_engaged)
    {
      if (!*((_BYTE *)a3 + 36))
        goto LABEL_48;
    }
    else if (*((_BYTE *)a3 + 36))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_itemsShown != *((_DWORD *)a3 + 8))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)a3 + 40) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 0x80) == 0)
      goto LABEL_48;
    if (self->_typedQuery)
    {
      if (!*((_BYTE *)a3 + 39))
        goto LABEL_48;
    }
    else if (*((_BYTE *)a3 + 39))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 0x80) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 0x20) != 0)
    {
      if (self->_itemSelected)
      {
        if (!*((_BYTE *)a3 + 37))
          goto LABEL_48;
        goto LABEL_41;
      }
      if (!*((_BYTE *)a3 + 37))
        goto LABEL_41;
    }
LABEL_48:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 40) & 0x20) != 0)
    goto LABEL_48;
LABEL_41:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_egress != *((_QWORD *)a3 + 1))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    goto LABEL_48;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 0x40) == 0)
      goto LABEL_48;
    if (self->_sameCategorySelected)
    {
      if (!*((_BYTE *)a3 + 38))
        goto LABEL_48;
    }
    else if (*((_BYTE *)a3 + 38))
    {
      goto LABEL_48;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_expert;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_engaged;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_itemsShown;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_typedQuery;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_itemSelected;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761u * self->_egress;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_sameCategorySelected;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 40);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expert = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_engaged = *((_BYTE *)a3 + 36);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_itemsShown = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_typedQuery = *((_BYTE *)a3 + 39);
  *(_BYTE *)&self->_has |= 0x80u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_itemSelected = *((_BYTE *)a3 + 37);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      return;
LABEL_17:
    self->_sameCategorySelected = *((_BYTE *)a3 + 38);
    *(_BYTE *)&self->_has |= 0x40u;
    return;
  }
LABEL_16:
  self->_egress = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 40) & 0x40) != 0)
    goto LABEL_17;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)expert
{
  return self->_expert;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (unsigned)itemsShown
{
  return self->_itemsShown;
}

- (BOOL)typedQuery
{
  return self->_typedQuery;
}

- (BOOL)itemSelected
{
  return self->_itemSelected;
}

- (unint64_t)egress
{
  return self->_egress;
}

- (BOOL)sameCategorySelected
{
  return self->_sameCategorySelected;
}

@end
