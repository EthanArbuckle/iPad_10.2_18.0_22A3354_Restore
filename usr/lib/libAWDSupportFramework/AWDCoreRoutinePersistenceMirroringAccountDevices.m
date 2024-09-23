@implementation AWDCoreRoutinePersistenceMirroringAccountDevices

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutinePersistenceMirroringAccountDevices setProfiles:](self, "setProfiles:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringAccountDevices;
  -[AWDCoreRoutinePersistenceMirroringAccountDevices dealloc](&v3, sel_dealloc);
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

- (void)clearProfiles
{
  -[NSMutableArray removeAllObjects](self->_profiles, "removeAllObjects");
}

- (void)addProfiles:(id)a3
{
  NSMutableArray *profiles;

  profiles = self->_profiles;
  if (!profiles)
  {
    profiles = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_profiles = profiles;
  }
  -[NSMutableArray addObject:](profiles, "addObject:", a3);
}

- (unint64_t)profilesCount
{
  return -[NSMutableArray count](self->_profiles, "count");
}

- (id)profilesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_profiles, "objectAtIndex:", a3);
}

+ (Class)profilesType
{
  return (Class)objc_opt_class();
}

- (void)setTopDeviceClass:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_topDeviceClass = a3;
}

- (void)setHasTopDeviceClass:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTopDeviceClass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalVisits:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_totalVisits = a3;
}

- (void)setHasTotalVisits:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalVisits
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTotalPlaces:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalPlaces = a3;
}

- (void)setHasTotalPlaces:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalPlaces
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalTransitions:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalTransitions = a3;
}

- (void)setHasTotalTransitions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalTransitions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringAccountDevices;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutinePersistenceMirroringAccountDevices description](&v3, sel_description), -[AWDCoreRoutinePersistenceMirroringAccountDevices dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *profiles;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_profiles, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_profiles, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    profiles = self->_profiles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](profiles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(profiles);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](profiles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("profiles"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topDeviceClass), CFSTR("topDeviceClass"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_14:
      if ((has & 4) == 0)
        goto LABEL_15;
LABEL_20:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalPlaces), CFSTR("totalPlaces"));
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalVisits), CFSTR("totalVisits"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_20;
LABEL_15:
  if ((has & 8) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalTransitions), CFSTR("totalTransitions"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceMirroringAccountDevicesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *profiles;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char has;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  profiles = self->_profiles;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](profiles, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(profiles);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](profiles, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 4) == 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      return;
    goto LABEL_14;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return;
LABEL_14:
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
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (-[AWDCoreRoutinePersistenceMirroringAccountDevices profilesCount](self, "profilesCount"))
  {
    objc_msgSend(a3, "clearProfiles");
    v5 = -[AWDCoreRoutinePersistenceMirroringAccountDevices profilesCount](self, "profilesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addProfiles:", -[AWDCoreRoutinePersistenceMirroringAccountDevices profilesAtIndex:](self, "profilesAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_topDeviceClass;
    *((_BYTE *)a3 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 9) = self->_totalVisits;
  *((_BYTE *)a3 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      return;
    goto LABEL_11;
  }
LABEL_15:
  *((_DWORD *)a3 + 7) = self->_totalPlaces;
  *((_BYTE *)a3 + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return;
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_totalTransitions;
  *((_BYTE *)a3 + 40) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *profiles;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  profiles = self->_profiles;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](profiles, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(profiles);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addProfiles:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](profiles, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_topDeviceClass;
    *(_BYTE *)(v6 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 4) == 0)
        goto LABEL_13;
LABEL_18:
      *(_DWORD *)(v6 + 28) = self->_totalPlaces;
      *(_BYTE *)(v6 + 40) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 36) = self->_totalVisits;
  *(_BYTE *)(v6 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 32) = self->_totalTransitions;
    *(_BYTE *)(v6 + 40) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSMutableArray *profiles;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    profiles = self->_profiles;
    if ((unint64_t)profiles | *((_QWORD *)a3 + 2))
    {
      v5 = -[NSMutableArray isEqual:](profiles, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_topDeviceClass != *((_DWORD *)a3 + 6))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_totalVisits != *((_DWORD *)a3 + 9))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_totalPlaces != *((_DWORD *)a3 + 7))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_totalTransitions != *((_DWORD *)a3 + 8))
        goto LABEL_29;
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_profiles, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_topDeviceClass;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_totalVisits;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_totalPlaces;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_totalTransitions;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[AWDCoreRoutinePersistenceMirroringAccountDevices addProfiles:](self, "addProfiles:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = *((_BYTE *)a3 + 40);
  if ((v10 & 2) != 0)
  {
    self->_topDeviceClass = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)a3 + 40);
    if ((v10 & 0x10) == 0)
    {
LABEL_12:
      if ((v10 & 4) == 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 0x10) == 0)
  {
    goto LABEL_12;
  }
  self->_totalVisits = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v10 = *((_BYTE *)a3 + 40);
  if ((v10 & 4) == 0)
  {
LABEL_13:
    if ((v10 & 8) == 0)
      return;
    goto LABEL_14;
  }
LABEL_18:
  self->_totalPlaces = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 40) & 8) == 0)
    return;
LABEL_14:
  self->_totalTransitions = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)topDeviceClass
{
  return self->_topDeviceClass;
}

- (int)totalVisits
{
  return self->_totalVisits;
}

- (int)totalPlaces
{
  return self->_totalPlaces;
}

- (int)totalTransitions
{
  return self->_totalTransitions;
}

@end
