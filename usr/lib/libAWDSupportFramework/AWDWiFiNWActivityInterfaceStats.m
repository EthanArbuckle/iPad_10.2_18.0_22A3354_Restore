@implementation AWDWiFiNWActivityInterfaceStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivityInterfaceStats setPackets:](self, "setPackets:", 0);
  -[AWDWiFiNWActivityInterfaceStats setBytes:](self, "setBytes:", 0);
  -[AWDWiFiNWActivityInterfaceStats setPeers:](self, "setPeers:", 0);
  -[AWDWiFiNWActivityInterfaceStats setNpeers:](self, "setNpeers:", 0);
  -[AWDWiFiNWActivityInterfaceStats setAssoc:](self, "setAssoc:", 0);
  -[AWDWiFiNWActivityInterfaceStats setAwdlMode:](self, "setAwdlMode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityInterfaceStats;
  -[AWDWiFiNWActivityInterfaceStats dealloc](&v3, sel_dealloc);
}

- (int)role
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_role;
  else
    return 0;
}

- (void)setRole:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRole
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E640 + a3);
}

- (int)StringAsRole:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INFRA")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("LEGACYAWDL")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LLWAWDL")))
    return 2;
  return 0;
}

- (void)clearPackets
{
  -[NSMutableArray removeAllObjects](self->_packets, "removeAllObjects");
}

- (void)addPackets:(id)a3
{
  NSMutableArray *packets;

  packets = self->_packets;
  if (!packets)
  {
    packets = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_packets = packets;
  }
  -[NSMutableArray addObject:](packets, "addObject:", a3);
}

- (unint64_t)packetsCount
{
  return -[NSMutableArray count](self->_packets, "count");
}

- (id)packetsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_packets, "objectAtIndex:", a3);
}

+ (Class)packetsType
{
  return (Class)objc_opt_class();
}

- (void)clearBytes
{
  -[NSMutableArray removeAllObjects](self->_bytes, "removeAllObjects");
}

- (void)addBytes:(id)a3
{
  NSMutableArray *bytes;

  bytes = self->_bytes;
  if (!bytes)
  {
    bytes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_bytes = bytes;
  }
  -[NSMutableArray addObject:](bytes, "addObject:", a3);
}

- (unint64_t)bytesCount
{
  return -[NSMutableArray count](self->_bytes, "count");
}

- (id)bytesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bytes, "objectAtIndex:", a3);
}

+ (Class)bytesType
{
  return (Class)objc_opt_class();
}

- (void)clearPeers
{
  -[NSMutableArray removeAllObjects](self->_peers, "removeAllObjects");
}

- (void)addPeer:(id)a3
{
  NSMutableArray *peers;

  peers = self->_peers;
  if (!peers)
  {
    peers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_peers = peers;
  }
  -[NSMutableArray addObject:](peers, "addObject:", a3);
}

- (unint64_t)peersCount
{
  return -[NSMutableArray count](self->_peers, "count");
}

- (id)peerAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_peers, "objectAtIndex:", a3);
}

+ (Class)peerType
{
  return (Class)objc_opt_class();
}

- (void)clearNpeers
{
  -[NSMutableArray removeAllObjects](self->_npeers, "removeAllObjects");
}

- (void)addNpeers:(id)a3
{
  NSMutableArray *npeers;

  npeers = self->_npeers;
  if (!npeers)
  {
    npeers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_npeers = npeers;
  }
  -[NSMutableArray addObject:](npeers, "addObject:", a3);
}

- (unint64_t)npeersCount
{
  return -[NSMutableArray count](self->_npeers, "count");
}

- (id)npeersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_npeers, "objectAtIndex:", a3);
}

+ (Class)npeersType
{
  return (Class)objc_opt_class();
}

- (void)setDps:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dps = a3;
}

- (void)setHasDps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDps
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConsecutivedps:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_consecutivedps = a3;
}

- (void)setHasConsecutivedps:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConsecutivedps
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAssoc
{
  return self->_assoc != 0;
}

- (BOOL)hasAwdlMode
{
  return self->_awdlMode != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityInterfaceStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityInterfaceStats description](&v3, sel_description), -[AWDWiFiNWActivityInterfaceStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t role;
  uint64_t v5;
  void *v6;
  NSMutableArray *packets;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *bytes;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *peers;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *npeers;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  char has;
  AWDWiFiNWActivityAssoc *assoc;
  AWDWiFiNWActivityStateBin *awdlMode;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    role = self->_role;
    if (role >= 3)
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_role);
    else
      v5 = (uint64_t)*(&off_24C10E640 + role);
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("role"));
  }
  if (-[NSMutableArray count](self->_packets, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    packets = self->_packets;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(packets);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      }
      while (v9);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("packets"));

  }
  if (-[NSMutableArray count](self->_bytes, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    bytes = self->_bytes;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(bytes);
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v15);
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("bytes"));

  }
  if (-[NSMutableArray count](self->_peers, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_peers, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    peers = self->_peers;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(peers);
          objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      }
      while (v21);
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("peer"));

  }
  if (-[NSMutableArray count](self->_npeers, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_npeers, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    npeers = self->_npeers;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](npeers, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (m = 0; m != v27; ++m)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(npeers);
          objc_msgSend(v24, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](npeers, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
      }
      while (v27);
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("npeers"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dps), CFSTR("dps"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_consecutivedps), CFSTR("consecutivedps"));
  assoc = self->_assoc;
  if (assoc)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityAssoc dictionaryRepresentation](assoc, "dictionaryRepresentation"), CFSTR("assoc"));
  awdlMode = self->_awdlMode;
  if (awdlMode)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityStateBin dictionaryRepresentation](awdlMode, "dictionaryRepresentation"), CFSTR("awdlMode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *packets;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *bytes;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *peers;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *npeers;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  char has;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  packets = self->_packets;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(packets);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v6);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  bytes = self->_bytes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(bytes);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v11);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  peers = self->_peers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(peers);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v16);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  npeers = self->_npeers;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](npeers, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(npeers);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](npeers, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v21);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_assoc)
    PBDataWriterWriteSubmessage();
  if (self->_awdlMode)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_role;
    *((_BYTE *)a3 + 68) |= 4u;
  }
  if (-[AWDWiFiNWActivityInterfaceStats packetsCount](self, "packetsCount"))
  {
    objc_msgSend(a3, "clearPackets");
    v5 = -[AWDWiFiNWActivityInterfaceStats packetsCount](self, "packetsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addPackets:", -[AWDWiFiNWActivityInterfaceStats packetsAtIndex:](self, "packetsAtIndex:", i));
    }
  }
  if (-[AWDWiFiNWActivityInterfaceStats bytesCount](self, "bytesCount"))
  {
    objc_msgSend(a3, "clearBytes");
    v8 = -[AWDWiFiNWActivityInterfaceStats bytesCount](self, "bytesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addBytes:", -[AWDWiFiNWActivityInterfaceStats bytesAtIndex:](self, "bytesAtIndex:", j));
    }
  }
  if (-[AWDWiFiNWActivityInterfaceStats peersCount](self, "peersCount"))
  {
    objc_msgSend(a3, "clearPeers");
    v11 = -[AWDWiFiNWActivityInterfaceStats peersCount](self, "peersCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addPeer:", -[AWDWiFiNWActivityInterfaceStats peerAtIndex:](self, "peerAtIndex:", k));
    }
  }
  if (-[AWDWiFiNWActivityInterfaceStats npeersCount](self, "npeersCount"))
  {
    objc_msgSend(a3, "clearNpeers");
    v14 = -[AWDWiFiNWActivityInterfaceStats npeersCount](self, "npeersCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addNpeers:", -[AWDWiFiNWActivityInterfaceStats npeersAtIndex:](self, "npeersAtIndex:", m));
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_dps;
    *((_BYTE *)a3 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_consecutivedps;
    *((_BYTE *)a3 + 68) |= 1u;
  }
  if (self->_assoc)
    objc_msgSend(a3, "setAssoc:");
  if (self->_awdlMode)
    objc_msgSend(a3, "setAwdlMode:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *packets;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *bytes;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *peers;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *npeers;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  char has;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_role;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  packets = self->_packets;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(packets);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPackets:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](packets, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v9);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  bytes = self->_bytes;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(bytes);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addBytes:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bytes, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v15);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  peers = self->_peers;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(peers);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPeer:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v21);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  npeers = self->_npeers;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](npeers, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(npeers);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNpeers:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](npeers, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v27);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_dps;
    *(_BYTE *)(v6 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_consecutivedps;
    *(_BYTE *)(v6 + 68) |= 1u;
  }

  *(_QWORD *)(v6 + 8) = -[AWDWiFiNWActivityAssoc copyWithZone:](self->_assoc, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[AWDWiFiNWActivityStateBin copyWithZone:](self->_awdlMode, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *packets;
  NSMutableArray *bytes;
  NSMutableArray *peers;
  NSMutableArray *npeers;
  AWDWiFiNWActivityAssoc *assoc;
  AWDWiFiNWActivityStateBin *awdlMode;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 4) == 0 || self->_role != *((_DWORD *)a3 + 16))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 68) & 4) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    packets = self->_packets;
    if (!((unint64_t)packets | *((_QWORD *)a3 + 6))
      || (v5 = -[NSMutableArray isEqual:](packets, "isEqual:")) != 0)
    {
      bytes = self->_bytes;
      if (!((unint64_t)bytes | *((_QWORD *)a3 + 3)) || (v5 = -[NSMutableArray isEqual:](bytes, "isEqual:")) != 0)
      {
        peers = self->_peers;
        if (!((unint64_t)peers | *((_QWORD *)a3 + 7))
          || (v5 = -[NSMutableArray isEqual:](peers, "isEqual:")) != 0)
        {
          npeers = self->_npeers;
          if (!((unint64_t)npeers | *((_QWORD *)a3 + 5))
            || (v5 = -[NSMutableArray isEqual:](npeers, "isEqual:")) != 0)
          {
            if ((*(_BYTE *)&self->_has & 2) != 0)
            {
              if ((*((_BYTE *)a3 + 68) & 2) == 0 || self->_dps != *((_DWORD *)a3 + 9))
                goto LABEL_29;
            }
            else if ((*((_BYTE *)a3 + 68) & 2) != 0)
            {
              goto LABEL_29;
            }
            if ((*(_BYTE *)&self->_has & 1) != 0)
            {
              if ((*((_BYTE *)a3 + 68) & 1) == 0 || self->_consecutivedps != *((_DWORD *)a3 + 8))
                goto LABEL_29;
            }
            else if ((*((_BYTE *)a3 + 68) & 1) != 0)
            {
              goto LABEL_29;
            }
            assoc = self->_assoc;
            if (!((unint64_t)assoc | *((_QWORD *)a3 + 1))
              || (v5 = -[AWDWiFiNWActivityAssoc isEqual:](assoc, "isEqual:")) != 0)
            {
              awdlMode = self->_awdlMode;
              if ((unint64_t)awdlMode | *((_QWORD *)a3 + 2))
                LOBYTE(v5) = -[AWDWiFiNWActivityStateBin isEqual:](awdlMode, "isEqual:");
              else
                LOBYTE(v5) = 1;
            }
          }
        }
      }
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_role;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_packets, "hash");
  v5 = -[NSMutableArray hash](self->_bytes, "hash");
  v6 = -[NSMutableArray hash](self->_peers, "hash");
  v7 = -[NSMutableArray hash](self->_npeers, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_dps;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 2654435761 * self->_consecutivedps;
LABEL_9:
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = -[AWDWiFiNWActivityAssoc hash](self->_assoc, "hash");
  return v10 ^ v11 ^ -[AWDWiFiNWActivityStateBin hash](self->_awdlMode, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  char v25;
  AWDWiFiNWActivityAssoc *assoc;
  uint64_t v27;
  AWDWiFiNWActivityStateBin *awdlMode;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 68) & 4) != 0)
  {
    self->_role = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v5);
        -[AWDWiFiNWActivityInterfaceStats addPackets:](self, "addPackets:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v7);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        -[AWDWiFiNWActivityInterfaceStats addBytes:](self, "addBytes:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v12);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 7);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        -[AWDWiFiNWActivityInterfaceStats addPeer:](self, "addPeer:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v17);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = (void *)*((_QWORD *)a3 + 5);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        -[AWDWiFiNWActivityInterfaceStats addNpeers:](self, "addNpeers:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v22);
  }
  v25 = *((_BYTE *)a3 + 68);
  if ((v25 & 2) != 0)
  {
    self->_dps = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 2u;
    v25 = *((_BYTE *)a3 + 68);
  }
  if ((v25 & 1) != 0)
  {
    self->_consecutivedps = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  assoc = self->_assoc;
  v27 = *((_QWORD *)a3 + 1);
  if (assoc)
  {
    if (v27)
      -[AWDWiFiNWActivityAssoc mergeFrom:](assoc, "mergeFrom:");
  }
  else if (v27)
  {
    -[AWDWiFiNWActivityInterfaceStats setAssoc:](self, "setAssoc:");
  }
  awdlMode = self->_awdlMode;
  v29 = *((_QWORD *)a3 + 2);
  if (awdlMode)
  {
    if (v29)
      -[AWDWiFiNWActivityStateBin mergeFrom:](awdlMode, "mergeFrom:");
  }
  else if (v29)
  {
    -[AWDWiFiNWActivityInterfaceStats setAwdlMode:](self, "setAwdlMode:");
  }
}

- (NSMutableArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)npeers
{
  return self->_npeers;
}

- (void)setNpeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)dps
{
  return self->_dps;
}

- (unsigned)consecutivedps
{
  return self->_consecutivedps;
}

- (AWDWiFiNWActivityAssoc)assoc
{
  return self->_assoc;
}

- (void)setAssoc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AWDWiFiNWActivityStateBin)awdlMode
{
  return self->_awdlMode;
}

- (void)setAwdlMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
