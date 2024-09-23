@implementation PBBProtoWarrantySentinel

- (void)setSentinelExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sentinelExists = a3;
}

- (void)setHasSentinelExists:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSentinelExists
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRemoveSentinel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_removeSentinel = a3;
}

- (void)setHasRemoveSentinel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRemoveSentinel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAppleLanguages
{
  -[NSMutableArray removeAllObjects](self->_appleLanguages, "removeAllObjects");
}

- (void)addAppleLanguages:(id)a3
{
  id v4;
  NSMutableArray *appleLanguages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appleLanguages = self->_appleLanguages;
  v8 = v4;
  if (!appleLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_appleLanguages;
    self->_appleLanguages = v6;

    v4 = v8;
    appleLanguages = self->_appleLanguages;
  }
  -[NSMutableArray addObject:](appleLanguages, "addObject:", v4);

}

- (unint64_t)appleLanguagesCount
{
  return -[NSMutableArray count](self->_appleLanguages, "count");
}

- (id)appleLanguagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appleLanguages, "objectAtIndex:", a3);
}

+ (Class)appleLanguagesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppleLocale
{
  return self->_appleLocale != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
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
  v8.super_class = (Class)PBBProtoWarrantySentinel;
  -[PBBProtoWarrantySentinel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoWarrantySentinel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSMutableArray *appleLanguages;
  NSString *appleLocale;
  NSString *deviceName;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sentinelExists);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sentinelExists"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_removeSentinel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("removeSentinel"));

  }
  appleLanguages = self->_appleLanguages;
  if (appleLanguages)
    objc_msgSend(v3, "setObject:forKey:", appleLanguages, CFSTR("appleLanguages"));
  appleLocale = self->_appleLocale;
  if (appleLocale)
    objc_msgSend(v3, "setObject:forKey:", appleLocale, CFSTR("appleLocale"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoWarrantySentinelReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
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
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_appleLanguages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_appleLocale)
    PBDataWriterWriteStringField();
  if (self->_deviceName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_sentinelExists;
    v4[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[32] = self->_removeSentinel;
    v4[36] |= 1u;
  }
  v11 = v4;
  if (-[PBBProtoWarrantySentinel appleLanguagesCount](self, "appleLanguagesCount"))
  {
    objc_msgSend(v11, "clearAppleLanguages");
    v6 = -[PBBProtoWarrantySentinel appleLanguagesCount](self, "appleLanguagesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[PBBProtoWarrantySentinel appleLanguagesAtIndex:](self, "appleLanguagesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAppleLanguages:", v9);

      }
    }
  }
  if (self->_appleLocale)
    objc_msgSend(v11, "setAppleLocale:");
  v10 = v11;
  if (self->_deviceName)
  {
    objc_msgSend(v11, "setDeviceName:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _QWORD *v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[33] = self->_sentinelExists;
    v5[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[32] = self->_removeSentinel;
    v5[36] |= 1u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_appleLanguages;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v6, "addAppleLanguages:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_appleLocale, "copyWithZone:", a3);
  v15 = (void *)v6[2];
  v6[2] = v14;

  v16 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v17 = (void *)v6[3];
  v6[3] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *appleLanguages;
  NSString *appleLocale;
  NSString *deviceName;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_24;
    if (self->_sentinelExists)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0)
    {
      if (self->_removeSentinel)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_24;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_18;
    }
LABEL_24:
    v8 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
    goto LABEL_24;
LABEL_18:
  appleLanguages = self->_appleLanguages;
  if ((unint64_t)appleLanguages | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](appleLanguages, "isEqual:"))
  {
    goto LABEL_24;
  }
  appleLocale = self->_appleLocale;
  if ((unint64_t)appleLocale | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appleLocale, "isEqual:"))
      goto LABEL_24;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](deviceName, "isEqual:");
  else
    v8 = 1;
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_sentinelExists;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_removeSentinel;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSMutableArray hash](self->_appleLanguages, "hash");
  v6 = -[NSString hash](self->_appleLocale, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_deviceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 36);
  if ((v6 & 2) != 0)
  {
    self->_sentinelExists = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((v6 & 1) != 0)
  {
    self->_removeSentinel = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[PBBProtoWarrantySentinel addAppleLanguages:](self, "addAppleLanguages:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (v5[2])
    -[PBBProtoWarrantySentinel setAppleLocale:](self, "setAppleLocale:");
  if (v5[3])
    -[PBBProtoWarrantySentinel setDeviceName:](self, "setDeviceName:");

}

- (BOOL)sentinelExists
{
  return self->_sentinelExists;
}

- (BOOL)removeSentinel
{
  return self->_removeSentinel;
}

- (NSMutableArray)appleLanguages
{
  return self->_appleLanguages;
}

- (void)setAppleLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_appleLanguages, a3);
}

- (NSString)appleLocale
{
  return self->_appleLocale;
}

- (void)setAppleLocale:(id)a3
{
  objc_storeStrong((id *)&self->_appleLocale, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_appleLocale, 0);
  objc_storeStrong((id *)&self->_appleLanguages, 0);
}

@end
