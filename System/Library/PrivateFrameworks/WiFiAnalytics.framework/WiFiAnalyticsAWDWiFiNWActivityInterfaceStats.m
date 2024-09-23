@implementation WiFiAnalyticsAWDWiFiNWActivityInterfaceStats

- (BOOL)hasRole
{
  return self->_role != 0;
}

- (void)clearPackets
{
  -[NSMutableArray removeAllObjects](self->_packets, "removeAllObjects");
}

- (void)addPackets:(id)a3
{
  id v4;
  NSMutableArray *packets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  packets = self->_packets;
  v8 = v4;
  if (!packets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_packets;
    self->_packets = v6;

    v4 = v8;
    packets = self->_packets;
  }
  -[NSMutableArray addObject:](packets, "addObject:", v4);

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
  id v4;
  NSMutableArray *bytes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bytes = self->_bytes;
  v8 = v4;
  if (!bytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_bytes;
    self->_bytes = v6;

    v4 = v8;
    bytes = self->_bytes;
  }
  -[NSMutableArray addObject:](bytes, "addObject:", v4);

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
  id v4;
  NSMutableArray *peers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  peers = self->_peers;
  v8 = v4;
  if (!peers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_peers;
    self->_peers = v6;

    v4 = v8;
    peers = self->_peers;
  }
  -[NSMutableArray addObject:](peers, "addObject:", v4);

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

- (void)clearAwdlModes
{
  -[NSMutableArray removeAllObjects](self->_awdlModes, "removeAllObjects");
}

- (void)addAwdlMode:(id)a3
{
  id v4;
  NSMutableArray *awdlModes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  awdlModes = self->_awdlModes;
  v8 = v4;
  if (!awdlModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_awdlModes;
    self->_awdlModes = v6;

    v4 = v8;
    awdlModes = self->_awdlModes;
  }
  -[NSMutableArray addObject:](awdlModes, "addObject:", v4);

}

- (unint64_t)awdlModesCount
{
  return -[NSMutableArray count](self->_awdlModes, "count");
}

- (id)awdlModeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_awdlModes, "objectAtIndex:", a3);
}

+ (Class)awdlModeType
{
  return (Class)objc_opt_class();
}

- (void)setEnabled:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearEnableStates
{
  -[NSMutableArray removeAllObjects](self->_enableStates, "removeAllObjects");
}

- (void)addEnableState:(id)a3
{
  id v4;
  NSMutableArray *enableStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  enableStates = self->_enableStates;
  v8 = v4;
  if (!enableStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_enableStates;
    self->_enableStates = v6;

    v4 = v8;
    enableStates = self->_enableStates;
  }
  -[NSMutableArray addObject:](enableStates, "addObject:", v4);

}

- (unint64_t)enableStatesCount
{
  return -[NSMutableArray count](self->_enableStates, "count");
}

- (id)enableStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_enableStates, "objectAtIndex:", a3);
}

+ (Class)enableStateType
{
  return (Class)objc_opt_class();
}

- (void)clearNss
{
  -[NSMutableArray removeAllObjects](self->_nss, "removeAllObjects");
}

- (void)addNss:(id)a3
{
  id v4;
  NSMutableArray *nss;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nss = self->_nss;
  v8 = v4;
  if (!nss)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_nss;
    self->_nss = v6;

    v4 = v8;
    nss = self->_nss;
  }
  -[NSMutableArray addObject:](nss, "addObject:", v4);

}

- (unint64_t)nssCount
{
  return -[NSMutableArray count](self->_nss, "count");
}

- (id)nssAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nss, "objectAtIndex:", a3);
}

+ (Class)nssType
{
  return (Class)objc_opt_class();
}

- (void)clearPhymodes
{
  -[NSMutableArray removeAllObjects](self->_phymodes, "removeAllObjects");
}

- (void)addPhymode:(id)a3
{
  id v4;
  NSMutableArray *phymodes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  phymodes = self->_phymodes;
  v8 = v4;
  if (!phymodes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_phymodes;
    self->_phymodes = v6;

    v4 = v8;
    phymodes = self->_phymodes;
  }
  -[NSMutableArray addObject:](phymodes, "addObject:", v4);

}

- (unint64_t)phymodesCount
{
  return -[NSMutableArray count](self->_phymodes, "count");
}

- (id)phymodeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_phymodes, "objectAtIndex:", a3);
}

+ (Class)phymodeType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityInterfaceStats;
  -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *role;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  char has;
  void *v28;
  void *v29;
  WiFiAnalyticsAWDWiFiNWActivityAssoc *assoc;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  void *v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t jj;
  void *v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  role = self->_role;
  if (role)
    objc_msgSend(v3, "setObject:forKey:", role, CFSTR("role"));
  if (-[NSMutableArray count](self->_packets, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v7 = self->_packets;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v87 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("packets"));
  }
  if (-[NSMutableArray count](self->_bytes, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v14 = self->_bytes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v83 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("bytes"));
  }
  if (-[NSMutableArray count](self->_peers, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_peers, "count"));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v21 = self->_peers;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v79 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("peer"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dps);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("dps"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_consecutivedps);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("consecutivedps"));

  }
  assoc = self->_assoc;
  if (assoc)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityAssoc dictionaryRepresentation](assoc, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("assoc"));

  }
  if (-[NSMutableArray count](self->_awdlModes, "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_awdlModes, "count"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v33 = self->_awdlModes;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v75;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v75 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * m), "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
      }
      while (v35);
    }

    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("awdlMode"));
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabled);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("enabled"));

  }
  if (-[NSMutableArray count](self->_enableStates, "count"))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_enableStates, "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v41 = self->_enableStates;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v70, v92, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v71;
      do
      {
        for (n = 0; n != v43; ++n)
        {
          if (*(_QWORD *)v71 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * n), "dictionaryRepresentation");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v46);

        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v70, v92, 16);
      }
      while (v43);
    }

    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("enableState"));
  }
  if (-[NSMutableArray count](self->_nss, "count"))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_nss, "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v48 = self->_nss;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v66, v91, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v67;
      do
      {
        for (ii = 0; ii != v50; ++ii)
        {
          if (*(_QWORD *)v67 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * ii), "dictionaryRepresentation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v53);

        }
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v66, v91, 16);
      }
      while (v50);
    }

    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("nss"));
  }
  if (-[NSMutableArray count](self->_phymodes, "count"))
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_phymodes, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v55 = self->_phymodes;
    v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v62, v90, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v63;
      do
      {
        for (jj = 0; jj != v57; ++jj)
        {
          if (*(_QWORD *)v63 != v58)
            objc_enumerationMutation(v55);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * jj), "dictionaryRepresentation", (_QWORD)v62);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v60);

        }
        v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v62, v90, 16);
      }
      while (v57);
    }

    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("phymode"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_role)
    PBDataWriterWriteStringField();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v5 = self->_packets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v66 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v7);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = self->_bytes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v12);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v15 = self->_peers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v17);
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
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = self->_awdlModes;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v54;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    }
    while (v23);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v26 = self->_enableStates;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v50;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v50 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
    }
    while (v28);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v31 = self->_nss;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v46;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    }
    while (v33);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v36 = self->_phymodes;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v42;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteSubmessage();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
    }
    while (v38);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  char has;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  id v33;

  v33 = a3;
  if (self->_role)
    objc_msgSend(v33, "setRole:");
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats packetsCount](self, "packetsCount"))
  {
    objc_msgSend(v33, "clearPackets");
    v4 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats packetsCount](self, "packetsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats packetsAtIndex:](self, "packetsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addPackets:", v7);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats bytesCount](self, "bytesCount"))
  {
    objc_msgSend(v33, "clearBytes");
    v8 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats bytesCount](self, "bytesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats bytesAtIndex:](self, "bytesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addBytes:", v11);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats peersCount](self, "peersCount"))
  {
    objc_msgSend(v33, "clearPeers");
    v12 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats peersCount](self, "peersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats peerAtIndex:](self, "peerAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addPeer:", v15);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v33 + 9) = self->_dps;
    *((_BYTE *)v33 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v33 + 8) = self->_consecutivedps;
    *((_BYTE *)v33 + 96) |= 1u;
  }
  if (self->_assoc)
    objc_msgSend(v33, "setAssoc:");
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats awdlModesCount](self, "awdlModesCount"))
  {
    objc_msgSend(v33, "clearAwdlModes");
    v17 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats awdlModesCount](self, "awdlModesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats awdlModeAtIndex:](self, "awdlModeAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAwdlMode:", v20);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v33 + 12) = self->_enabled;
    *((_BYTE *)v33 + 96) |= 4u;
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats enableStatesCount](self, "enableStatesCount"))
  {
    objc_msgSend(v33, "clearEnableStates");
    v21 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats enableStatesCount](self, "enableStatesCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats enableStateAtIndex:](self, "enableStateAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addEnableState:", v24);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats nssCount](self, "nssCount"))
  {
    objc_msgSend(v33, "clearNss");
    v25 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats nssCount](self, "nssCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats nssAtIndex:](self, "nssAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addNss:", v28);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats phymodesCount](self, "phymodesCount"))
  {
    objc_msgSend(v33, "clearPhymodes");
    v29 = -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats phymodesCount](self, "phymodesCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats phymodeAtIndex:](self, "phymodeAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addPhymode:", v32);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  char has;
  id v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t ii;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t jj;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_role, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v8 = self->_packets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v79 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPackets:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v10);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v14 = self->_bytes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v75 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBytes:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    }
    while (v16);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v20 = self->_peers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v71 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPeer:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_dps;
    *(_BYTE *)(v5 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_consecutivedps;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v27 = -[WiFiAnalyticsAWDWiFiNWActivityAssoc copyWithZone:](self->_assoc, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v27;

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v29 = self->_awdlModes;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v67 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAwdlMode:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    }
    while (v31);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_enabled;
    *(_BYTE *)(v5 + 96) |= 4u;
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v35 = self->_enableStates;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v63;
    do
    {
      for (n = 0; n != v37; ++n)
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnableState:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    }
    while (v37);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v41 = self->_nss;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v43; ++ii)
      {
        if (*(_QWORD *)v59 != v44)
          objc_enumerationMutation(v41);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNss:", v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
    }
    while (v43);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = self->_phymodes;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v55;
    do
    {
      for (jj = 0; jj != v49; ++jj)
      {
        if (*(_QWORD *)v55 != v50)
          objc_enumerationMutation(v47);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * jj), "copyWithZone:", a3, (_QWORD)v54);
        objc_msgSend((id)v5, "addPhymode:", v52);

      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
    }
    while (v49);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *role;
  NSMutableArray *packets;
  NSMutableArray *bytes;
  NSMutableArray *peers;
  WiFiAnalyticsAWDWiFiNWActivityAssoc *assoc;
  NSMutableArray *awdlModes;
  NSMutableArray *enableStates;
  NSMutableArray *nss;
  NSMutableArray *phymodes;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  role = self->_role;
  if ((unint64_t)role | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](role, "isEqual:"))
      goto LABEL_35;
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:"))
      goto LABEL_35;
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:"))
      goto LABEL_35;
  }
  peers = self->_peers;
  if ((unint64_t)peers | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](peers, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_dps != *((_DWORD *)v4 + 9))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_35:
    v14 = 0;
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_consecutivedps != *((_DWORD *)v4 + 8))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_35;
  }
  assoc = self->_assoc;
  if ((unint64_t)assoc | *((_QWORD *)v4 + 1)
    && !-[WiFiAnalyticsAWDWiFiNWActivityAssoc isEqual:](assoc, "isEqual:"))
  {
    goto LABEL_35;
  }
  awdlModes = self->_awdlModes;
  if ((unint64_t)awdlModes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](awdlModes, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_enabled != *((_DWORD *)v4 + 12))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_35;
  }
  enableStates = self->_enableStates;
  if ((unint64_t)enableStates | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](enableStates, "isEqual:"))
  {
    goto LABEL_35;
  }
  nss = self->_nss;
  if ((unint64_t)nss | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](nss, "isEqual:"))
      goto LABEL_35;
  }
  phymodes = self->_phymodes;
  if ((unint64_t)phymodes | *((_QWORD *)v4 + 10))
    v14 = -[NSMutableArray isEqual:](phymodes, "isEqual:");
  else
    v14 = 1;
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[NSString hash](self->_role, "hash");
  v4 = -[NSMutableArray hash](self->_packets, "hash");
  v5 = -[NSMutableArray hash](self->_bytes, "hash");
  v6 = -[NSMutableArray hash](self->_peers, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_dps;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_consecutivedps;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  v9 = -[WiFiAnalyticsAWDWiFiNWActivityAssoc hash](self->_assoc, "hash");
  v10 = -[NSMutableArray hash](self->_awdlModes, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_enabled;
  else
    v11 = 0;
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v13 = v11 ^ -[NSMutableArray hash](self->_enableStates, "hash");
  v14 = v13 ^ -[NSMutableArray hash](self->_nss, "hash");
  return v12 ^ v14 ^ -[NSMutableArray hash](self->_phymodes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char v20;
  WiFiAnalyticsAWDWiFiNWActivityAssoc *assoc;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t n;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ii;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t jj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 11))
    -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats setRole:](self, "setRole:");
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v5 = *((id *)v4 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v68 != v8)
          objc_enumerationMutation(v5);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addPackets:](self, "addPackets:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    }
    while (v7);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v64 != v13)
          objc_enumerationMutation(v10);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addBytes:](self, "addBytes:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v12);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v15 = *((id *)v4 + 9);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v60 != v18)
          objc_enumerationMutation(v15);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addPeer:](self, "addPeer:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    }
    while (v17);
  }

  v20 = *((_BYTE *)v4 + 96);
  if ((v20 & 2) != 0)
  {
    self->_dps = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
    v20 = *((_BYTE *)v4 + 96);
  }
  if ((v20 & 1) != 0)
  {
    self->_consecutivedps = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  assoc = self->_assoc;
  v22 = *((_QWORD *)v4 + 1);
  if (assoc)
  {
    if (v22)
      -[WiFiAnalyticsAWDWiFiNWActivityAssoc mergeFrom:](assoc, "mergeFrom:");
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats setAssoc:](self, "setAssoc:");
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = *((id *)v4 + 2);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v56;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v56 != v26)
          objc_enumerationMutation(v23);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addAwdlMode:](self, "addAwdlMode:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * m));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
    }
    while (v25);
  }

  if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    self->_enabled = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = *((id *)v4 + 5);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v73, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      for (n = 0; n != v30; ++n)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v28);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addEnableState:](self, "addEnableState:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * n));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v73, 16);
    }
    while (v30);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = *((id *)v4 + 7);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (ii = 0; ii != v35; ++ii)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addNss:](self, "addNss:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * ii));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
    }
    while (v35);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = *((id *)v4 + 10);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v71, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v44;
    do
    {
      for (jj = 0; jj != v40; ++jj)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(v38);
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addPhymode:](self, "addPhymode:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * jj), (_QWORD)v43);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v71, 16);
    }
    while (v40);
  }

}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (NSMutableArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
  objc_storeStrong((id *)&self->_packets, a3);
}

- (NSMutableArray)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
  objc_storeStrong((id *)&self->_bytes, a3);
}

- (NSMutableArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_storeStrong((id *)&self->_peers, a3);
}

- (unsigned)dps
{
  return self->_dps;
}

- (unsigned)consecutivedps
{
  return self->_consecutivedps;
}

- (WiFiAnalyticsAWDWiFiNWActivityAssoc)assoc
{
  return self->_assoc;
}

- (void)setAssoc:(id)a3
{
  objc_storeStrong((id *)&self->_assoc, a3);
}

- (NSMutableArray)awdlModes
{
  return self->_awdlModes;
}

- (void)setAwdlModes:(id)a3
{
  objc_storeStrong((id *)&self->_awdlModes, a3);
}

- (unsigned)enabled
{
  return self->_enabled;
}

- (NSMutableArray)enableStates
{
  return self->_enableStates;
}

- (void)setEnableStates:(id)a3
{
  objc_storeStrong((id *)&self->_enableStates, a3);
}

- (NSMutableArray)nss
{
  return self->_nss;
}

- (void)setNss:(id)a3
{
  objc_storeStrong((id *)&self->_nss, a3);
}

- (NSMutableArray)phymodes
{
  return self->_phymodes;
}

- (void)setPhymodes:(id)a3
{
  objc_storeStrong((id *)&self->_phymodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_phymodes, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_nss, 0);
  objc_storeStrong((id *)&self->_enableStates, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_awdlModes, 0);
  objc_storeStrong((id *)&self->_assoc, 0);
}

@end
