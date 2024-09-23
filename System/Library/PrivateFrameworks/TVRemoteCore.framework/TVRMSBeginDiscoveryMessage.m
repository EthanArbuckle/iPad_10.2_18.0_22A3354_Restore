@implementation TVRMSBeginDiscoveryMessage

- (void)setDiscoveryTypes:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_discoveryTypes = a3;
}

- (void)setHasDiscoveryTypes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscoveryTypes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearPairedNetworkNames
{
  -[NSMutableArray removeAllObjects](self->_pairedNetworkNames, "removeAllObjects");
}

- (void)addPairedNetworkNames:(id)a3
{
  id v4;
  NSMutableArray *pairedNetworkNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pairedNetworkNames = self->_pairedNetworkNames;
  v8 = v4;
  if (!pairedNetworkNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_pairedNetworkNames;
    self->_pairedNetworkNames = v6;

    v4 = v8;
    pairedNetworkNames = self->_pairedNetworkNames;
  }
  -[NSMutableArray addObject:](pairedNetworkNames, "addObject:", v4);

}

- (unint64_t)pairedNetworkNamesCount
{
  return -[NSMutableArray count](self->_pairedNetworkNames, "count");
}

- (id)pairedNetworkNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pairedNetworkNames, "objectAtIndex:", a3);
}

- (void)setHasPairedNetworkNames:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasPairedNetworkNames = a3;
}

- (void)setHasHasPairedNetworkNames:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasPairedNetworkNames
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVRMSBeginDiscoveryMessage;
  -[TVRMSBeginDiscoveryMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSBeginDiscoveryMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *pairedNetworkNames;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_discoveryTypes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("discoveryTypes"));

  }
  pairedNetworkNames = self->_pairedNetworkNames;
  if (pairedNetworkNames)
    objc_msgSend(v3, "setObject:forKey:", pairedNetworkNames, CFSTR("pairedNetworkNames"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasPairedNetworkNames);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("hasPairedNetworkNames"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSBeginDiscoveryMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_pairedNetworkNames;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_discoveryTypes;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v9 = v4;
  if (-[TVRMSBeginDiscoveryMessage pairedNetworkNamesCount](self, "pairedNetworkNamesCount"))
  {
    objc_msgSend(v9, "clearPairedNetworkNames");
    v5 = -[TVRMSBeginDiscoveryMessage pairedNetworkNamesCount](self, "pairedNetworkNamesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[TVRMSBeginDiscoveryMessage pairedNetworkNamesAtIndex:](self, "pairedNetworkNamesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addPairedNetworkNames:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9[24] = self->_hasPairedNetworkNames;
    v9[28] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _BYTE *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_BYTE *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_discoveryTypes;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_pairedNetworkNames;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addPairedNetworkNames:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[24] = self->_hasPairedNetworkNames;
    v6[28] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  char has;
  NSMutableArray *pairedNetworkNames;
  BOOL v7;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((v4[28] & 1) == 0 || self->_discoveryTypes != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((v4[28] & 1) != 0)
  {
    goto LABEL_14;
  }
  pairedNetworkNames = self->_pairedNetworkNames;
  if ((unint64_t)pairedNetworkNames | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](pairedNetworkNames, "isEqual:"))
    {
LABEL_14:
      v7 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
  }
  v7 = (v4[28] & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v4[28] & 2) == 0 || self->_hasPairedNetworkNames != v4[24])
      goto LABEL_14;
    v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_discoveryTypes;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_pairedNetworkNames, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_hasPairedNetworkNames;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BOOL *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (BOOL *)v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_discoveryTypes = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TVRMSBeginDiscoveryMessage addPairedNetworkNames:](self, "addPairedNetworkNames:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((v5[28] & 2) != 0)
  {
    self->_hasPairedNetworkNames = v5[24];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int)discoveryTypes
{
  return self->_discoveryTypes;
}

- (NSMutableArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void)setPairedNetworkNames:(id)a3
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, a3);
}

- (BOOL)hasPairedNetworkNames
{
  return self->_hasPairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
}

@end
