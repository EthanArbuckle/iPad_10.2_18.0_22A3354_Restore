@implementation AWDCoreRoutineDeletionGroupStats

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineDeletionGroupStats setRecords:](self, "setRecords:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionGroupStats;
  -[AWDCoreRoutineDeletionGroupStats dealloc](&v3, sel_dealloc);
}

- (void)setItemType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasItemType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setOldestRecordAgeInDays:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_oldestRecordAgeInDays = a3;
}

- (void)setHasOldestRecordAgeInDays:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOldestRecordAgeInDays
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearRecords
{
  -[NSMutableArray removeAllObjects](self->_records, "removeAllObjects");
}

- (void)addRecords:(id)a3
{
  NSMutableArray *records;

  records = self->_records;
  if (!records)
  {
    records = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_records = records;
  }
  -[NSMutableArray addObject:](records, "addObject:", a3);
}

- (unint64_t)recordsCount
{
  return -[NSMutableArray count](self->_records, "count");
}

- (id)recordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_records, "objectAtIndex:", a3);
}

+ (Class)recordsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionGroupStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineDeletionGroupStats description](&v3, sel_description), -[AWDCoreRoutineDeletionGroupStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *records;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_itemType), CFSTR("itemType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_oldestRecordAgeInDays), CFSTR("oldestRecordAgeInDays"));
  if (-[NSMutableArray count](self->_records, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    records = self->_records;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](records, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(records);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](records, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("records"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineDeletionGroupStatsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *records;
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
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  records = self->_records;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](records, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(records);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](records, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
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
    *((_DWORD *)a3 + 2) = self->_itemType;
    *((_BYTE *)a3 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_oldestRecordAgeInDays;
    *((_BYTE *)a3 + 24) |= 2u;
  }
  if (-[AWDCoreRoutineDeletionGroupStats recordsCount](self, "recordsCount"))
  {
    objc_msgSend(a3, "clearRecords");
    v6 = -[AWDCoreRoutineDeletionGroupStats recordsCount](self, "recordsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addRecords:", -[AWDCoreRoutineDeletionGroupStats recordsAtIndex:](self, "recordsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *records;
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
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_itemType;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_oldestRecordAgeInDays;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  records = self->_records;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](records, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(records);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addRecords:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](records, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *records;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_itemType != *((_DWORD *)a3 + 2))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_oldestRecordAgeInDays != *((_DWORD *)a3 + 3))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
      goto LABEL_14;
    }
    records = self->_records;
    if ((unint64_t)records | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSMutableArray isEqual:](records, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_itemType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSMutableArray hash](self->_records, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_oldestRecordAgeInDays;
  return v3 ^ v2 ^ -[NSMutableArray hash](self->_records, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v4;
  void *v5;
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
  v4 = *((_BYTE *)a3 + 24);
  if ((v4 & 1) != 0)
  {
    self->_itemType = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v4 = *((_BYTE *)a3 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_oldestRecordAgeInDays = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AWDCoreRoutineDeletionGroupStats addRecords:](self, "addRecords:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (unsigned)oldestRecordAgeInDays
{
  return self->_oldestRecordAgeInDays;
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
