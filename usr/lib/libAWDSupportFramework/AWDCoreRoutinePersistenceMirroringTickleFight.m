@implementation AWDCoreRoutinePersistenceMirroringTickleFight

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringTickleFight;
  -[AWDCoreRoutinePersistenceMirroringTickleFight dealloc](&v3, sel_dealloc);
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

- (unint64_t)tickleTimesCount
{
  return self->_tickleTimes.count;
}

- (int)tickleTimes
{
  return self->_tickleTimes.list;
}

- (void)clearTickleTimes
{
  PBRepeatedInt32Clear();
}

- (void)addTickleTimes:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)tickleTimesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_tickleTimes;
  unint64_t count;

  p_tickleTimes = &self->_tickleTimes;
  count = self->_tickleTimes.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_tickleTimes->list[a3];
}

- (void)setTickleTimes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setRecordType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_recordType = a3;
}

- (void)setHasRecordType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setOperationType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringTickleFight;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutinePersistenceMirroringTickleFight description](&v3, sel_description), -[AWDCoreRoutinePersistenceMirroringTickleFight dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("tickleTimes"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_recordType), CFSTR("recordType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_operationType), CFSTR("operationType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceMirroringTickleFightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_tickleTimes.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_tickleTimes.count);
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (-[AWDCoreRoutinePersistenceMirroringTickleFight tickleTimesCount](self, "tickleTimesCount"))
  {
    objc_msgSend(a3, "clearTickleTimes");
    v5 = -[AWDCoreRoutinePersistenceMirroringTickleFight tickleTimesCount](self, "tickleTimesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addTickleTimes:", -[AWDCoreRoutinePersistenceMirroringTickleFight tickleTimesAtIndex:](self, "tickleTimesAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordType;
    *((_BYTE *)a3 + 48) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_operationType;
    *((_BYTE *)a3 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 32) = self->_timestamp;
    *(_BYTE *)(v4 + 48) |= 1u;
  }
  PBRepeatedInt32Copy();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_recordType;
    *(_BYTE *)(v5 + 48) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_operationType;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_17:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_recordType != *((_DWORD *)a3 + 11))
          goto LABEL_17;
      }
      else if ((*((_BYTE *)a3 + 48) & 4) != 0)
      {
        goto LABEL_17;
      }
      LOBYTE(IsEqual) = (*((_BYTE *)a3 + 48) & 2) == 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_operationType != *((_DWORD *)a3 + 10))
          goto LABEL_17;
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_recordType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_operationType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;

  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "tickleTimesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDCoreRoutinePersistenceMirroringTickleFight addTickleTimes:](self, "addTickleTimes:", objc_msgSend(a3, "tickleTimesAtIndex:", i));
  }
  v8 = *((_BYTE *)a3 + 48);
  if ((v8 & 4) != 0)
  {
    self->_recordType = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 4u;
    v8 = *((_BYTE *)a3 + 48);
  }
  if ((v8 & 2) != 0)
  {
    self->_operationType = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)recordType
{
  return self->_recordType;
}

- (int)operationType
{
  return self->_operationType;
}

@end
