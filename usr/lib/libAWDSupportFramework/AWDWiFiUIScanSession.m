@implementation AWDWiFiUIScanSession

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiUIScanSession setCounts:](self, "setCounts:", 0);
  -[AWDWiFiUIScanSession setProcess:](self, "setProcess:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIScanSession;
  -[AWDWiFiUIScanSession dealloc](&v3, sel_dealloc);
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

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearCounts
{
  -[NSMutableArray removeAllObjects](self->_counts, "removeAllObjects");
}

- (void)addCounts:(id)a3
{
  NSMutableArray *counts;

  counts = self->_counts;
  if (!counts)
  {
    counts = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_counts = counts;
  }
  -[NSMutableArray addObject:](counts, "addObject:", a3);
}

- (unint64_t)countsCount
{
  return -[NSMutableArray count](self->_counts, "count");
}

- (id)countsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_counts, "objectAtIndex:", a3);
}

+ (Class)countsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIScanSession;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiUIScanSession description](&v3, sel_description), -[AWDWiFiUIScanSession dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *counts;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *process;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration), CFSTR("duration"));
  if (-[NSMutableArray count](self->_counts, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_counts, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    counts = self->_counts;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](counts, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(counts);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](counts, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("counts"));

  }
  process = self->_process;
  if (process)
    objc_msgSend(v3, "setObject:forKey:", process, CFSTR("process"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIScanSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *counts;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  counts = self->_counts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](counts, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(counts);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](counts, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if (self->_process)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_duration;
    *((_BYTE *)a3 + 40) |= 2u;
  }
  if (-[AWDWiFiUIScanSession countsCount](self, "countsCount"))
  {
    objc_msgSend(a3, "clearCounts");
    v6 = -[AWDWiFiUIScanSession countsCount](self, "countsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addCounts:", -[AWDWiFiUIScanSession countsAtIndex:](self, "countsAtIndex:", i));
    }
  }
  if (self->_process)
    objc_msgSend(a3, "setProcess:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  char has;
  NSMutableArray *counts;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_duration;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  counts = self->_counts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](counts, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(counts);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addCounts:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](counts, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v6[4] = (id)-[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *counts;
  NSString *process;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_duration != *((_DWORD *)a3 + 6))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_16;
    }
    counts = self->_counts;
    if (!((unint64_t)counts | *((_QWORD *)a3 + 2)) || (v5 = -[NSMutableArray isEqual:](counts, "isEqual:")) != 0)
    {
      process = self->_process;
      if ((unint64_t)process | *((_QWORD *)a3 + 4))
        LOBYTE(v5) = -[NSString isEqual:](process, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_duration;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSMutableArray hash](self->_counts, "hash");
  return v5 ^ -[NSString hash](self->_process, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_duration = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AWDWiFiUIScanSession addCounts:](self, "addCounts:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDWiFiUIScanSession setProcess:](self, "setProcess:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSMutableArray)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
