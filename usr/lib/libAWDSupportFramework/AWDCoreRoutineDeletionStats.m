@implementation AWDCoreRoutineDeletionStats

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineDeletionStats setGroups:](self, "setGroups:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionStats;
  -[AWDCoreRoutineDeletionStats dealloc](&v3, sel_dealloc);
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

- (void)setSyncEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_syncEnabled = a3;
}

- (void)setHasSyncEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDeleteType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deleteType = a3;
}

- (void)setHasDeleteType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleteType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearGroups
{
  -[NSMutableArray removeAllObjects](self->_groups, "removeAllObjects");
}

- (void)addGroups:(id)a3
{
  NSMutableArray *groups;

  groups = self->_groups;
  if (!groups)
  {
    groups = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_groups = groups;
  }
  -[NSMutableArray addObject:](groups, "addObject:", a3);
}

- (unint64_t)groupsCount
{
  return -[NSMutableArray count](self->_groups, "count");
}

- (id)groupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3);
}

+ (Class)groupsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineDeletionStats description](&v3, sel_description), -[AWDCoreRoutineDeletionStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *groups;
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
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncEnabled), CFSTR("syncEnabled"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deleteType), CFSTR("deleteType"));
LABEL_5:
  if (-[NSMutableArray count](self->_groups, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    groups = self->_groups;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(groups);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("groups"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineDeletionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *groups;
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
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  groups = self->_groups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(groups);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_11:
    *((_BYTE *)a3 + 32) = self->_syncEnabled;
    *((_BYTE *)a3 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)a3 + 1) = self->_timestamp;
  *((_BYTE *)a3 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_deleteType;
    *((_BYTE *)a3 + 36) |= 2u;
  }
LABEL_5:
  if (-[AWDCoreRoutineDeletionStats groupsCount](self, "groupsCount"))
  {
    objc_msgSend(a3, "clearGroups");
    v6 = -[AWDCoreRoutineDeletionStats groupsCount](self, "groupsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addGroups:", -[AWDCoreRoutineDeletionStats groupsAtIndex:](self, "groupsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *groups;
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
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 36) |= 1u;
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
  *(_BYTE *)(v5 + 32) = self->_syncEnabled;
  *(_BYTE *)(v5 + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_deleteType;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
LABEL_5:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  groups = self->_groups;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(groups);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addGroups:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *groups;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)a3 + 36) & 4) != 0)
      goto LABEL_22;
    goto LABEL_15;
  }
  if ((*((_BYTE *)a3 + 36) & 4) == 0)
    goto LABEL_22;
  if (self->_syncEnabled)
  {
    if (!*((_BYTE *)a3 + 32))
      goto LABEL_22;
    goto LABEL_15;
  }
  if (*((_BYTE *)a3 + 32))
  {
LABEL_22:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_deleteType != *((_DWORD *)a3 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  groups = self->_groups;
  if ((unint64_t)groups | *((_QWORD *)a3 + 3))
    LOBYTE(v5) = -[NSMutableArray isEqual:](groups, "isEqual:");
  else
    LOBYTE(v5) = 1;
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
    return v3 ^ v2 ^ v4 ^ -[NSMutableArray hash](self->_groups, "hash");
  }
  v2 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_syncEnabled;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_deleteType;
  return v3 ^ v2 ^ v4 ^ -[NSMutableArray hash](self->_groups, "hash");
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
  v4 = *((_BYTE *)a3 + 36);
  if ((v4 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v4 = *((_BYTE *)a3 + 36);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_syncEnabled = *((_BYTE *)a3 + 32);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
LABEL_4:
    self->_deleteType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
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
        -[AWDCoreRoutineDeletionStats addGroups:](self, "addGroups:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (unsigned)deleteType
{
  return self->_deleteType;
}

- (NSMutableArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
