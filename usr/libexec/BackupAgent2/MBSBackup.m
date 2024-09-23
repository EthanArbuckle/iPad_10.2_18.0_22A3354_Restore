@implementation MBSBackup

- (void)dealloc
{
  objc_super v3;

  -[MBSBackup setBackupUDID:](self, "setBackupUDID:", 0);
  -[MBSBackup setSnapshots:](self, "setSnapshots:", 0);
  -[MBSBackup setAttributes:](self, "setAttributes:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MBSBackup;
  -[MBSBackup dealloc](&v3, "dealloc");
}

- (BOOL)hasBackupUDID
{
  return self->_backupUDID != 0;
}

- (void)setQuotaUsed:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_quotaUsed = a3;
}

- (void)setHasQuotaUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQuotaUsed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearSnapshots
{
  -[NSMutableArray removeAllObjects](self->_snapshots, "removeAllObjects");
}

- (void)addSnapshot:(id)a3
{
  NSMutableArray *snapshots;

  snapshots = self->_snapshots;
  if (!snapshots)
  {
    snapshots = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_snapshots = snapshots;
  }
  -[NSMutableArray addObject:](snapshots, "addObject:", a3);
}

- (unint64_t)snapshotsCount
{
  return (unint64_t)-[NSMutableArray count](self->_snapshots, "count");
}

- (id)snapshotAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_snapshots, "objectAtIndex:", a3);
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (void)setKeysLastModified:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_keysLastModified = a3;
}

- (void)setHasKeysLastModified:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeysLastModified
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBSBackup;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[MBSBackup description](&v3, "description"), -[MBSBackup dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSData *backupUDID;
  id v6;
  NSMutableArray *snapshots;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  MBSBackupAttributes *attributes;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  backupUDID = self->_backupUDID;
  if (backupUDID)
    objc_msgSend(v3, "setObject:forKey:", backupUDID, CFSTR("backupUDID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_quotaUsed), CFSTR("quotaUsed"));
  if (-[NSMutableArray count](self->_snapshots, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_snapshots, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    snapshots = self->_snapshots;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(snapshots);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("snapshot"));

  }
  attributes = self->_attributes;
  if (attributes)
    objc_msgSend(v4, "setObject:forKey:", -[MBSBackupAttributes dictionaryRepresentation](attributes, "dictionaryRepresentation"), CFSTR("attributes"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_keysLastModified), CFSTR("keysLastModified"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000FA88((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *backupUDID;
  NSMutableArray *snapshots;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  MBSBackupAttributes *attributes;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  backupUDID = self->_backupUDID;
  if (backupUDID)
    PBDataWriterWriteDataField(a3, backupUDID, 1);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field(a3, self->_quotaUsed, 2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  snapshots = self->_snapshots;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(snapshots);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 3);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  attributes = self->_attributes;
  if (attributes)
    PBDataWriterWriteSubmessage(a3, attributes, 4);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(a3, self->_keysLastModified, 5);
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_backupUDID)
    objc_msgSend(a3, "setBackupUDID:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_quotaUsed;
    *((_BYTE *)a3 + 48) |= 2u;
  }
  if (-[MBSBackup snapshotsCount](self, "snapshotsCount"))
  {
    objc_msgSend(a3, "clearSnapshots");
    v5 = -[MBSBackup snapshotsCount](self, "snapshotsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSnapshot:", -[MBSBackup snapshotAtIndex:](self, "snapshotAtIndex:", i));
    }
  }
  if (self->_attributes)
    objc_msgSend(a3, "setAttributes:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_keysLastModified;
    *((_BYTE *)a3 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *snapshots;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");

  v5[4] = -[NSData copyWithZone:](self->_backupUDID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[2] = (id)self->_quotaUsed;
    *((_BYTE *)v5 + 48) |= 2u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  snapshots = self->_snapshots;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(snapshots);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addSnapshot:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v5[3] = -[MBSBackupAttributes copyWithZone:](self->_attributes, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = (id)self->_keysLastModified;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSData *backupUDID;
  NSMutableArray *snapshots;
  MBSBackupAttributes *attributes;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    backupUDID = self->_backupUDID;
    if (!((unint64_t)backupUDID | *((_QWORD *)a3 + 4))
      || (v5 = -[NSData isEqual:](backupUDID, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_quotaUsed != *((_QWORD *)a3 + 2))
          goto LABEL_17;
      }
      else if ((*((_BYTE *)a3 + 48) & 2) != 0)
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      snapshots = self->_snapshots;
      if (!((unint64_t)snapshots | *((_QWORD *)a3 + 5))
        || (v5 = -[NSMutableArray isEqual:](snapshots, "isEqual:")) != 0)
      {
        attributes = self->_attributes;
        if (!((unint64_t)attributes | *((_QWORD *)a3 + 3))
          || (v5 = -[MBSBackupAttributes isEqual:](attributes, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 1) == 0;
          if ((*(_BYTE *)&self->_has & 1) != 0)
          {
            if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_keysLastModified != *((_QWORD *)a3 + 1))
              goto LABEL_17;
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (unint64_t)-[NSData hash](self->_backupUDID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761u * self->_quotaUsed;
  else
    v4 = 0;
  v5 = (unint64_t)-[NSMutableArray hash](self->_snapshots, "hash");
  v6 = -[MBSBackupAttributes hash](self->_attributes, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_keysLastModified;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  MBSBackupAttributes *attributes;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (*((_QWORD *)a3 + 4))
    -[MBSBackup setBackupUDID:](self, "setBackupUDID:");
  if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
    self->_quotaUsed = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[MBSBackup addSnapshot:](self, "addSnapshot:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  attributes = self->_attributes;
  v11 = *((_QWORD *)a3 + 3);
  if (attributes)
  {
    if (v11)
      -[MBSBackupAttributes mergeFrom:](attributes, "mergeFrom:");
  }
  else if (v11)
  {
    -[MBSBackup setAttributes:](self, "setAttributes:");
  }
  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_keysLastModified = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSData)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)quotaUsed
{
  return self->_quotaUsed;
}

- (NSMutableArray)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (MBSBackupAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)keysLastModified
{
  return self->_keysLastModified;
}

@end
