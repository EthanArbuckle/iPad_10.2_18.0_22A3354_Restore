@implementation AWDWiFiUIJoinEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiUIJoinEvent setProcess:](self, "setProcess:", 0);
  -[AWDWiFiUIJoinEvent setSection:](self, "setSection:", 0);
  -[AWDWiFiUIJoinEvent setSectionCounts:](self, "setSectionCounts:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIJoinEvent;
  -[AWDWiFiUIJoinEvent dealloc](&v3, sel_dealloc);
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

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecurityType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setError:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSection
{
  return self->_section != 0;
}

- (void)clearSectionCounts
{
  -[NSMutableArray removeAllObjects](self->_sectionCounts, "removeAllObjects");
}

- (void)addSectionCounts:(id)a3
{
  NSMutableArray *sectionCounts;

  sectionCounts = self->_sectionCounts;
  if (!sectionCounts)
  {
    sectionCounts = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_sectionCounts = sectionCounts;
  }
  -[NSMutableArray addObject:](sectionCounts, "addObject:", a3);
}

- (unint64_t)sectionCountsCount
{
  return -[NSMutableArray count](self->_sectionCounts, "count");
}

- (id)sectionCountsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionCounts, "objectAtIndex:", a3);
}

+ (Class)sectionCountsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIJoinEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiUIJoinEvent description](&v3, sel_description), -[AWDWiFiUIJoinEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *process;
  char has;
  NSString *section;
  void *v7;
  NSMutableArray *sectionCounts;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  process = self->_process;
  if (process)
    objc_msgSend(v3, "setObject:forKey:", process, CFSTR("process"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_error), CFSTR("error"));
  section = self->_section;
  if (section)
    objc_msgSend(v3, "setObject:forKey:", section, CFSTR("section"));
  if (-[NSMutableArray count](self->_sectionCounts, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_sectionCounts, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    sectionCounts = self->_sectionCounts;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sectionCounts, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(sectionCounts);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sectionCounts, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sectionCounts"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIJoinEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *sectionCounts;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_process)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_section)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  sectionCounts = self->_sectionCounts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sectionCounts, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(sectionCounts);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sectionCounts, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 52) |= 1u;
  }
  if (self->_process)
    objc_msgSend(a3, "setProcess:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_securityType;
    *((_BYTE *)a3 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_error;
    *((_BYTE *)a3 + 52) |= 2u;
  }
  if (self->_section)
    objc_msgSend(a3, "setSection:");
  if (-[AWDWiFiUIJoinEvent sectionCountsCount](self, "sectionCountsCount"))
  {
    objc_msgSend(a3, "clearSectionCounts");
    v6 = -[AWDWiFiUIJoinEvent sectionCountsCount](self, "sectionCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addSectionCounts:", -[AWDWiFiUIJoinEvent sectionCountsAtIndex:](self, "sectionCountsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *sectionCounts;
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
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 52) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_securityType;
    *(_BYTE *)(v6 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_error;
    *(_BYTE *)(v6 + 52) |= 2u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_section, "copyWithZone:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  sectionCounts = self->_sectionCounts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sectionCounts, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(sectionCounts);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSectionCounts:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sectionCounts, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *process;
  NSString *section;
  NSMutableArray *sectionCounts;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    process = self->_process;
    if ((unint64_t)process | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](process, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_securityType != *((_DWORD *)a3 + 12))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_error != *((_DWORD *)a3 + 4))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_24;
    }
    section = self->_section;
    if (!((unint64_t)section | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](section, "isEqual:")) != 0)
    {
      sectionCounts = self->_sectionCounts;
      if ((unint64_t)sectionCounts | *((_QWORD *)a3 + 5))
        LOBYTE(v5) = -[NSMutableArray isEqual:](sectionCounts, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_process, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_securityType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_error;
LABEL_9:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_section, "hash");
  return v7 ^ -[NSMutableArray hash](self->_sectionCounts, "hash");
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
  if ((*((_BYTE *)a3 + 52) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiUIJoinEvent setProcess:](self, "setProcess:");
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_securityType = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_error = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDWiFiUIJoinEvent setSection:](self, "setSection:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 5);
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
        -[AWDWiFiUIJoinEvent addSectionCounts:](self, "addSectionCounts:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)error
{
  return self->_error;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)sectionCounts
{
  return self->_sectionCounts;
}

- (void)setSectionCounts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
