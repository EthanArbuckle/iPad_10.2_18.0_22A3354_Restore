@implementation AWDCoreRoutineLMPScoreBoardInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLMPScoreBoardInstance setKeyword:](self, "setKeyword:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoardInstance;
  -[AWDCoreRoutineLMPScoreBoardInstance dealloc](&v3, sel_dealloc);
}

- (BOOL)hasKeyword
{
  return self->_keyword != 0;
}

- (void)setCorrects:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_corrects = a3;
}

- (void)setHasCorrects:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCorrects
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIncorrects:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_incorrects = a3;
}

- (void)setHasIncorrects:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIncorrects
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUnknowns:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_unknowns = a3;
}

- (void)setHasUnknowns:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUnknowns
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setInvalids:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_invalids = a3;
}

- (void)setHasInvalids:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInvalids
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoardInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLMPScoreBoardInstance description](&v3, sel_description), -[AWDCoreRoutineLMPScoreBoardInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *keyword;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  keyword = self->_keyword;
  if (keyword)
    objc_msgSend(v3, "setObject:forKey:", keyword, CFSTR("keyword"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_corrects), CFSTR("corrects"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_unknowns), CFSTR("unknowns"));
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_incorrects), CFSTR("incorrects"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
LABEL_7:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_invalids), CFSTR("invalids"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPScoreBoardInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_keyword)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
LABEL_11:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_keyword)
    objc_msgSend(a3, "setKeyword:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_corrects;
    *((_BYTE *)a3 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 3) = self->_incorrects;
  *((_BYTE *)a3 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_unknowns;
  *((_BYTE *)a3 + 36) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_7:
  *((_DWORD *)a3 + 4) = self->_invalids;
  *((_BYTE *)a3 + 36) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_keyword, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_corrects;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 32) = self->_unknowns;
      *(_BYTE *)(v5 + 36) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_incorrects;
  *(_BYTE *)(v5 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 16) = self->_invalids;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *keyword;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    keyword = self->_keyword;
    if (!((unint64_t)keyword | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](keyword, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_corrects != *((_DWORD *)a3 + 2))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 36) & 1) != 0)
      {
LABEL_23:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_incorrects != *((_DWORD *)a3 + 3))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 36) & 2) != 0)
      {
        goto LABEL_23;
      }
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_unknowns != *((_DWORD *)a3 + 8))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 36) & 8) != 0)
      {
        goto LABEL_23;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 4) == 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_invalids != *((_DWORD *)a3 + 4))
          goto LABEL_23;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_keyword, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_corrects;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_incorrects;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_unknowns;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_invalids;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[AWDCoreRoutineLMPScoreBoardInstance setKeyword:](self, "setKeyword:");
  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 1) != 0)
  {
    self->_corrects = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_incorrects = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  self->_unknowns = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 36) & 4) == 0)
    return;
LABEL_7:
  self->_invalids = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)corrects
{
  return self->_corrects;
}

- (int)incorrects
{
  return self->_incorrects;
}

- (int)unknowns
{
  return self->_unknowns;
}

- (int)invalids
{
  return self->_invalids;
}

@end
