@implementation AWDIMessageHealthCheckPerformed

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageHealthCheckPerformed;
  -[AWDIMessageHealthCheckPerformed dealloc](&v3, sel_dealloc);
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

- (void)setNumberOfRequests:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfRequests = a3;
}

- (void)setHasNumberOfRequests:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfRequests
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumberOfResponses:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfResponses = a3;
}

- (void)setHasNumberOfResponses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfResponses
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumMessages:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numMessages = a3;
}

- (void)setHasNumMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumMessages
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)numOutOfOrdersCount
{
  return self->_numOutOfOrders.count;
}

- (unsigned)numOutOfOrders
{
  return self->_numOutOfOrders.list;
}

- (void)clearNumOutOfOrders
{
  PBRepeatedUInt32Clear();
}

- (void)addNumOutOfOrder:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numOutOfOrderAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numOutOfOrders;
  unint64_t count;

  p_numOutOfOrders = &self->_numOutOfOrders;
  count = self->_numOutOfOrders.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numOutOfOrders->list[a3];
}

- (void)setNumOutOfOrders:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)numMissedsCount
{
  return self->_numMisseds.count;
}

- (unsigned)numMisseds
{
  return self->_numMisseds.list;
}

- (void)clearNumMisseds
{
  PBRepeatedUInt32Clear();
}

- (void)addNumMissed:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numMissedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numMisseds;
  unint64_t count;

  p_numMisseds = &self->_numMisseds;
  count = self->_numMisseds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numMisseds->list[a3];
}

- (void)setNumMisseds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)aliasesMatchedsCount
{
  return self->_aliasesMatcheds.count;
}

- (unsigned)aliasesMatcheds
{
  return self->_aliasesMatcheds.list;
}

- (void)clearAliasesMatcheds
{
  PBRepeatedUInt32Clear();
}

- (void)addAliasesMatched:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)aliasesMatchedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_aliasesMatcheds;
  unint64_t count;

  p_aliasesMatcheds = &self->_aliasesMatcheds;
  count = self->_aliasesMatcheds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_aliasesMatcheds->list[a3];
}

- (void)setAliasesMatcheds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)coarseMatchedsCount
{
  return self->_coarseMatcheds.count;
}

- (unsigned)coarseMatcheds
{
  return self->_coarseMatcheds.list;
}

- (void)clearCoarseMatcheds
{
  PBRepeatedUInt32Clear();
}

- (void)addCoarseMatched:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)coarseMatchedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_coarseMatcheds;
  unint64_t count;

  p_coarseMatcheds = &self->_coarseMatcheds;
  count = self->_coarseMatcheds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_coarseMatcheds->list[a3];
}

- (void)setCoarseMatcheds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageHealthCheckPerformed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMessageHealthCheckPerformed description](&v3, sel_description), -[AWDIMessageHealthCheckPerformed dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numberOfResponses), CFSTR("numberOfResponses"));
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numberOfRequests), CFSTR("numberOfRequests"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMessages), CFSTR("numMessages"));
LABEL_6:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("numOutOfOrder"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("numMissed"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("aliasesMatched"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("coarseMatched"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageHealthCheckPerformedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_coarseMatcheds;
  unint64_t v9;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_numOutOfOrders.count)
  {
    PBDataWriterPlaceMark();
    if (self->_numOutOfOrders.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_numOutOfOrders.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_numMisseds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_numMisseds.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_numMisseds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_aliasesMatcheds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_aliasesMatcheds.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_aliasesMatcheds.count);
    }
    PBDataWriterRecallMark();
  }
  p_coarseMatcheds = &self->_coarseMatcheds;
  if (p_coarseMatcheds->count)
  {
    PBDataWriterPlaceMark();
    if (p_coarseMatcheds->count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < p_coarseMatcheds->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 13) = self->_timestamp;
    *((_BYTE *)a3 + 124) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_25:
      *((_DWORD *)a3 + 30) = self->_numberOfResponses;
      *((_BYTE *)a3 + 124) |= 8u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 29) = self->_numberOfRequests;
  *((_BYTE *)a3 + 124) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_25;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 28) = self->_numMessages;
    *((_BYTE *)a3 + 124) |= 2u;
  }
LABEL_6:
  if (-[AWDIMessageHealthCheckPerformed numOutOfOrdersCount](self, "numOutOfOrdersCount"))
  {
    objc_msgSend(a3, "clearNumOutOfOrders");
    v6 = -[AWDIMessageHealthCheckPerformed numOutOfOrdersCount](self, "numOutOfOrdersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addNumOutOfOrder:", -[AWDIMessageHealthCheckPerformed numOutOfOrderAtIndex:](self, "numOutOfOrderAtIndex:", i));
    }
  }
  if (-[AWDIMessageHealthCheckPerformed numMissedsCount](self, "numMissedsCount"))
  {
    objc_msgSend(a3, "clearNumMisseds");
    v9 = -[AWDIMessageHealthCheckPerformed numMissedsCount](self, "numMissedsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addNumMissed:", -[AWDIMessageHealthCheckPerformed numMissedAtIndex:](self, "numMissedAtIndex:", j));
    }
  }
  if (-[AWDIMessageHealthCheckPerformed aliasesMatchedsCount](self, "aliasesMatchedsCount"))
  {
    objc_msgSend(a3, "clearAliasesMatcheds");
    v12 = -[AWDIMessageHealthCheckPerformed aliasesMatchedsCount](self, "aliasesMatchedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addAliasesMatched:", -[AWDIMessageHealthCheckPerformed aliasesMatchedAtIndex:](self, "aliasesMatchedAtIndex:", k));
    }
  }
  if (-[AWDIMessageHealthCheckPerformed coarseMatchedsCount](self, "coarseMatchedsCount"))
  {
    objc_msgSend(a3, "clearCoarseMatcheds");
    v15 = -[AWDIMessageHealthCheckPerformed coarseMatchedsCount](self, "coarseMatchedsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addCoarseMatched:", -[AWDIMessageHealthCheckPerformed coarseMatchedAtIndex:](self, "coarseMatchedAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v4 + 104) = self->_timestamp;
    *(_BYTE *)(v4 + 124) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v4 + 120) = self->_numberOfResponses;
      *(_BYTE *)(v4 + 124) |= 8u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 116) = self->_numberOfRequests;
  *(_BYTE *)(v4 + 124) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 112) = self->_numMessages;
    *(_BYTE *)(v4 + 124) |= 2u;
  }
LABEL_6:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 124) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 13))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 124) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 124) & 4) == 0 || self->_numberOfRequests != *((_DWORD *)a3 + 29))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 124) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 124) & 8) == 0 || self->_numberOfResponses != *((_DWORD *)a3 + 30))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 124) & 8) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 124) & 2) == 0 || self->_numMessages != *((_DWORD *)a3 + 28))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 124) & 2) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    return PBRepeatedUInt32IsEqual();
  }
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_numberOfRequests;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
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
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_numberOfResponses;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_numMessages;
LABEL_10:
  v6 = v3 ^ v2 ^ v4 ^ v5 ^ PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt32Hash();
  v8 = v6 ^ v7 ^ PBRepeatedUInt32Hash();
  return v8 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  uint64_t v15;
  uint64_t v16;
  uint64_t m;

  v5 = *((_BYTE *)a3 + 124);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 13);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 124);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)a3 + 124) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfRequests = *((_DWORD *)a3 + 29);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 124);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_21:
  self->_numberOfResponses = *((_DWORD *)a3 + 30);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 124) & 2) != 0)
  {
LABEL_5:
    self->_numMessages = *((_DWORD *)a3 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:
  v6 = objc_msgSend(a3, "numOutOfOrdersCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDIMessageHealthCheckPerformed addNumOutOfOrder:](self, "addNumOutOfOrder:", objc_msgSend(a3, "numOutOfOrderAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "numMissedsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDIMessageHealthCheckPerformed addNumMissed:](self, "addNumMissed:", objc_msgSend(a3, "numMissedAtIndex:", j));
  }
  v12 = objc_msgSend(a3, "aliasesMatchedsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[AWDIMessageHealthCheckPerformed addAliasesMatched:](self, "addAliasesMatched:", objc_msgSend(a3, "aliasesMatchedAtIndex:", k));
  }
  v15 = objc_msgSend(a3, "coarseMatchedsCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[AWDIMessageHealthCheckPerformed addCoarseMatched:](self, "addCoarseMatched:", objc_msgSend(a3, "coarseMatchedAtIndex:", m));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)numberOfRequests
{
  return self->_numberOfRequests;
}

- (unsigned)numberOfResponses
{
  return self->_numberOfResponses;
}

- (unsigned)numMessages
{
  return self->_numMessages;
}

@end
