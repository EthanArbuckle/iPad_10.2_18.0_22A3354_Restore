@implementation SOSAccountConfiguration

- (void)clearPendingBackupPeers
{
  -[NSMutableArray removeAllObjects](self->_pendingBackupPeers, "removeAllObjects");
}

- (void)addPendingBackupPeers:(id)a3
{
  id v4;
  NSMutableArray *pendingBackupPeers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pendingBackupPeers = self->_pendingBackupPeers;
  v8 = v4;
  if (!pendingBackupPeers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_pendingBackupPeers;
    self->_pendingBackupPeers = v6;

    v4 = v8;
    pendingBackupPeers = self->_pendingBackupPeers;
  }
  -[NSMutableArray addObject:](pendingBackupPeers, "addObject:", v4);

}

- (unint64_t)pendingBackupPeersCount
{
  return (unint64_t)-[NSMutableArray count](self->_pendingBackupPeers, "count");
}

- (id)pendingBackupPeersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_pendingBackupPeers, "objectAtIndex:", a3);
}

- (void)setRingUpdateFlag:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ringUpdateFlag = a3;
}

- (void)setHasRingUpdateFlag:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRingUpdateFlag
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOSAccountConfiguration;
  v3 = -[SOSAccountConfiguration description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountConfiguration dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *pendingBackupPeers;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  pendingBackupPeers = self->_pendingBackupPeers;
  if (pendingBackupPeers)
    objc_msgSend(v3, "setObject:forKey:", pendingBackupPeers, CFSTR("pendingBackupPeers"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ringUpdateFlag));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("ringUpdateFlag"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  uint64_t String;
  void *v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v20;

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      break;
    if ((v7 >> 3) == 2)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(_BYTE *)&self->_has |= 1u;
      while (1)
      {
        v18 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v18 == -1 || v18 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v19 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_32;
        v15 += 7;
        v10 = v16++ >= 9;
        if (v10)
        {
          v17 = 0;
          goto LABEL_34;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v17 = 0;
LABEL_34:
      self->_ringUpdateFlag = v17 != 0;
    }
    else if ((v7 >> 3) == 1)
    {
      String = PBReaderReadString(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(String);
      if (v14)
        -[SOSAccountConfiguration addPendingBackupPeers:](self, "addPendingBackupPeers:", v14);

    }
    else
    {
      v20 = PBReaderSkipValueWithTag(a3);
      if (!v20)
        return v20;
    }
  }
  LOBYTE(v20) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_pendingBackupPeers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField(v4, self->_ringUpdateFlag, 2);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;

  v8 = a3;
  if (-[SOSAccountConfiguration pendingBackupPeersCount](self, "pendingBackupPeersCount"))
  {
    objc_msgSend(v8, "clearPendingBackupPeers");
    v4 = -[SOSAccountConfiguration pendingBackupPeersCount](self, "pendingBackupPeersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountConfiguration pendingBackupPeersAtIndex:](self, "pendingBackupPeersAtIndex:", i));
        objc_msgSend(v8, "addPendingBackupPeers:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[16] = self->_ringUpdateFlag;
    v8[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_pendingBackupPeers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addPendingBackupPeers:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[16] = self->_ringUpdateFlag;
    v5[20] |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *pendingBackupPeers;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_6;
  pendingBackupPeers = self->_pendingBackupPeers;
  if ((unint64_t)pendingBackupPeers | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](pendingBackupPeers, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_ringUpdateFlag)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = (unint64_t)-[NSMutableArray hash](self->_pendingBackupPeers, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_ringUpdateFlag;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SOSAccountConfiguration addPendingBackupPeers:](self, "addPendingBackupPeers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_ringUpdateFlag = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSMutableArray)pendingBackupPeers
{
  return self->_pendingBackupPeers;
}

- (void)setPendingBackupPeers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBackupPeers, a3);
}

- (BOOL)ringUpdateFlag
{
  return self->_ringUpdateFlag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBackupPeers, 0);
}

+ (Class)pendingBackupPeersType
{
  return (Class)objc_opt_class(NSString);
}

@end
