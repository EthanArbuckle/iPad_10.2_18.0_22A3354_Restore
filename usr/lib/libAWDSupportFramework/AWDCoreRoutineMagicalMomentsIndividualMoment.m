@implementation AWDCoreRoutineMagicalMomentsIndividualMoment

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicalMomentsIndividualMoment setSuggestionId:](self, "setSuggestionId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsIndividualMoment;
  -[AWDCoreRoutineMagicalMomentsIndividualMoment dealloc](&v3, sel_dealloc);
}

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

- (void)setModelType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modelType = a3;
}

- (void)setHasModelType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModelType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setExpertType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expertType = a3;
}

- (void)setHasExpertType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpertType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsIndividualMoment;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicalMomentsIndividualMoment description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsIndividualMoment dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *suggestionId;

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
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_modelType), CFSTR("modelType"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_expertType), CFSTR("expertType"));
LABEL_5:
  suggestionId = self->_suggestionId;
  if (suggestionId)
    objc_msgSend(v3, "setObject:forKey:", suggestionId, CFSTR("suggestionId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsIndividualMomentReadFrom((uint64_t)self, (uint64_t)a3);
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
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_suggestionId)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSString *suggestionId;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_modelType;
  *((_BYTE *)a3 + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_expertType;
    *((_BYTE *)a3 + 32) |= 2u;
  }
LABEL_5:
  suggestionId = self->_suggestionId;
  if (suggestionId)
    objc_msgSend(a3, "setSuggestionId:", suggestionId);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_modelType;
    *(_BYTE *)(v5 + 32) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_timestamp;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_expertType;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
LABEL_5:

  v6[3] = -[NSString copyWithZone:](self->_suggestionId, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *suggestionId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_modelType != *((_DWORD *)a3 + 5))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
      goto LABEL_19;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_expertType != *((_DWORD *)a3 + 4))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
      goto LABEL_19;
    }
    suggestionId = self->_suggestionId;
    if ((unint64_t)suggestionId | *((_QWORD *)a3 + 3))
      LOBYTE(v5) = -[NSString isEqual:](suggestionId, "isEqual:");
    else
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
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_suggestionId, "hash");
  }
  v2 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_modelType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_expertType;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_suggestionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_modelType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
  {
LABEL_4:
    self->_expertType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 3))
    -[AWDCoreRoutineMagicalMomentsIndividualMoment setSuggestionId:](self, "setSuggestionId:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)modelType
{
  return self->_modelType;
}

- (int)expertType
{
  return self->_expertType;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
