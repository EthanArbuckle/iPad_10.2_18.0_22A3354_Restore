@implementation AWDTransportHistoryRecord

- (void)dealloc
{
  objc_super v3;

  -[AWDTransportHistoryRecord setConnectionInfos:](self, "setConnectionInfos:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDTransportHistoryRecord;
  -[AWDTransportHistoryRecord dealloc](&v3, sel_dealloc);
}

- (int)transport
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_transport;
  else
    return 1;
}

- (void)setTransport:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_transport = a3;
}

- (void)setHasTransport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTransport
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)transportAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E430[a3 - 1];
}

- (int)StringAsTransport:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("None")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("BT")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Cellular")))
    return 4;
  return 1;
}

- (int)connectionMethod
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_connectionMethod;
  else
    return 1;
}

- (void)setConnectionMethod:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionMethod = a3;
}

- (void)setHasConnectionMethod:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionMethod
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)connectionMethodAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E450[a3 - 1];
}

- (int)StringAsConnectionMethod:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Peer")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TCP")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MPTCP")))
    return 3;
  return 1;
}

- (void)clearConnectionInfos
{
  -[NSMutableArray removeAllObjects](self->_connectionInfos, "removeAllObjects");
}

- (void)addConnectionInfo:(id)a3
{
  NSMutableArray *connectionInfos;

  connectionInfos = self->_connectionInfos;
  if (!connectionInfos)
  {
    connectionInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_connectionInfos = connectionInfos;
  }
  -[NSMutableArray addObject:](connectionInfos, "addObject:", a3);
}

- (unint64_t)connectionInfosCount
{
  return -[NSMutableArray count](self->_connectionInfos, "count");
}

- (id)connectionInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_connectionInfos, "objectAtIndex:", a3);
}

+ (Class)connectionInfoType
{
  return (Class)objc_opt_class();
}

- (int)transportSwitchReasonErrorDomain
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_transportSwitchReasonErrorDomain;
  else
    return 1;
}

- (void)setTransportSwitchReasonErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_transportSwitchReasonErrorDomain = a3;
}

- (void)setHasTransportSwitchReasonErrorDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTransportSwitchReasonErrorDomain
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)transportSwitchReasonErrorDomainAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E468[a3 - 1];
}

- (int)StringAsTransportSwitchReasonErrorDomain:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("assistantErrorDomain")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("connectionErrorDomain")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("posixErrorDomain")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("peerErrorDomain")))
    return 4;
  return 1;
}

- (void)setTransportSwitchReasonErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_transportSwitchReasonErrorCode = a3;
}

- (void)setHasTransportSwitchReasonErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTransportSwitchReasonErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTimestampFailure:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampFailure = a3;
}

- (void)setHasTimestampFailure:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampFailure
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDTransportHistoryRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDTransportHistoryRecord description](&v3, sel_description), -[AWDTransportHistoryRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  NSMutableArray *connectionInfos;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  unsigned int v16;
  __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = self->_transport - 1;
    if (v5 >= 4)
      v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transport);
    else
      v6 = off_24C10E430[v5];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("transport"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = self->_connectionMethod - 1;
    if (v7 >= 3)
      v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionMethod);
    else
      v8 = off_24C10E450[v7];
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("connectionMethod"));
  }
  if (-[NSMutableArray count](self->_connectionInfos, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_connectionInfos, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    connectionInfos = self->_connectionInfos;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionInfos, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(connectionInfos);
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionInfos, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("connectionInfo"));

  }
  v15 = (char)self->_has;
  if ((v15 & 0x10) != 0)
  {
    v16 = self->_transportSwitchReasonErrorDomain - 1;
    if (v16 >= 4)
      v17 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportSwitchReasonErrorDomain);
    else
      v17 = off_24C10E468[v16];
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("transportSwitchReasonErrorDomain"));
    v15 = (char)self->_has;
  }
  if ((v15 & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_transportSwitchReasonErrorCode), CFSTR("transportSwitchReasonErrorCode"));
    v15 = (char)self->_has;
  }
  if ((v15 & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestampFailure), CFSTR("timestampFailure"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDTransportHistoryRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *connectionInfos;
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  connectionInfos = self->_connectionInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionInfos, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(connectionInfos);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionInfos, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = (char)self->_has;
  if ((v10 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_14:
      if ((v10 & 1) == 0)
        return;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return;
LABEL_15:
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  char v9;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_transport;
    *((_BYTE *)a3 + 40) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_connectionMethod;
    *((_BYTE *)a3 + 40) |= 2u;
  }
  if (-[AWDTransportHistoryRecord connectionInfosCount](self, "connectionInfosCount"))
  {
    objc_msgSend(a3, "clearConnectionInfos");
    v6 = -[AWDTransportHistoryRecord connectionInfosCount](self, "connectionInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addConnectionInfo:", -[AWDTransportHistoryRecord connectionInfoAtIndex:](self, "connectionInfoAtIndex:", i));
    }
  }
  v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_transportSwitchReasonErrorDomain;
    *((_BYTE *)a3 + 40) |= 0x10u;
    v9 = (char)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_11:
      if ((v9 & 1) == 0)
        return;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 8) = self->_transportSwitchReasonErrorCode;
  *((_BYTE *)a3 + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return;
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_timestampFailure;
  *((_BYTE *)a3 + 40) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *connectionInfos;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_transport;
    *(_BYTE *)(v5 + 40) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_connectionMethod;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  connectionInfos = self->_connectionInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionInfos, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(connectionInfos);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addConnectionInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionInfos, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  v14 = (char)self->_has;
  if ((v14 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_18:
    *(_DWORD *)(v6 + 32) = self->_transportSwitchReasonErrorCode;
    *(_BYTE *)(v6 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v6;
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 36) = self->_transportSwitchReasonErrorDomain;
  *(_BYTE *)(v6 + 40) |= 0x10u;
  v14 = (char)self->_has;
  if ((v14 & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v14 & 1) != 0)
  {
LABEL_15:
    *(_QWORD *)(v6 + 8) = self->_timestampFailure;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSMutableArray *connectionInfos;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_transport != *((_DWORD *)a3 + 7))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_connectionMethod != *((_DWORD *)a3 + 6))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_29;
    }
    connectionInfos = self->_connectionInfos;
    if ((unint64_t)connectionInfos | *((_QWORD *)a3 + 2))
    {
      v5 = -[NSMutableArray isEqual:](connectionInfos, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_transportSwitchReasonErrorDomain != *((_DWORD *)a3 + 9))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_transportSwitchReasonErrorCode != *((_DWORD *)a3 + 8))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 8) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestampFailure != *((_QWORD *)a3 + 1))
        goto LABEL_29;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_transport;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_connectionMethod;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_connectionInfos, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  v6 = 2654435761 * self->_transportSwitchReasonErrorDomain;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761 * self->_transportSwitchReasonErrorCode;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761u * self->_timestampFailure;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_transport = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_connectionMethod = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AWDTransportHistoryRecord addConnectionInfo:](self, "addConnectionInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11 = *((_BYTE *)a3 + 40);
  if ((v11 & 0x10) != 0)
  {
    self->_transportSwitchReasonErrorDomain = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x10u;
    v11 = *((_BYTE *)a3 + 40);
    if ((v11 & 8) == 0)
    {
LABEL_14:
      if ((v11 & 1) == 0)
        return;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_transportSwitchReasonErrorCode = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 40) & 1) == 0)
    return;
LABEL_15:
  self->_timestampFailure = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
}

- (NSMutableArray)connectionInfos
{
  return self->_connectionInfos;
}

- (void)setConnectionInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)transportSwitchReasonErrorCode
{
  return self->_transportSwitchReasonErrorCode;
}

- (unint64_t)timestampFailure
{
  return self->_timestampFailure;
}

@end
