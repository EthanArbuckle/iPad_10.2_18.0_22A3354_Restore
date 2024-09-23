@implementation WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats

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

- (void)clearNpeers
{
  -[NSMutableArray removeAllObjects](self->_npeers, "removeAllObjects");
}

- (void)addNpeers:(id)a3
{
  id v4;
  NSMutableArray *npeers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  npeers = self->_npeers;
  v8 = v4;
  if (!npeers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_npeers;
    self->_npeers = v6;

    v4 = v8;
    npeers = self->_npeers;
  }
  -[NSMutableArray addObject:](npeers, "addObject:", v4);

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

- (void)setPeerCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_peerCount = a3;
}

- (void)setHasPeerCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPeerCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPeersAdded:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_peersAdded = a3;
}

- (void)setHasPeersAdded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPeersAdded
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPeersRemoved:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_peersRemoved = a3;
}

- (void)setHasPeersRemoved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPeersRemoved
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEnabled:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnabled
{
  return *(_BYTE *)&self->_has & 1;
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

- (void)clearTxLatencyBKs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyBKs, "removeAllObjects");
}

- (void)addTxLatencyBK:(id)a3
{
  id v4;
  NSMutableArray *txLatencyBKs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txLatencyBKs = self->_txLatencyBKs;
  v8 = v4;
  if (!txLatencyBKs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txLatencyBKs;
    self->_txLatencyBKs = v6;

    v4 = v8;
    txLatencyBKs = self->_txLatencyBKs;
  }
  -[NSMutableArray addObject:](txLatencyBKs, "addObject:", v4);

}

- (unint64_t)txLatencyBKsCount
{
  return -[NSMutableArray count](self->_txLatencyBKs, "count");
}

- (id)txLatencyBKAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyBKs, "objectAtIndex:", a3);
}

+ (Class)txLatencyBKType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyBEs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyBEs, "removeAllObjects");
}

- (void)addTxLatencyBE:(id)a3
{
  id v4;
  NSMutableArray *txLatencyBEs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txLatencyBEs = self->_txLatencyBEs;
  v8 = v4;
  if (!txLatencyBEs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txLatencyBEs;
    self->_txLatencyBEs = v6;

    v4 = v8;
    txLatencyBEs = self->_txLatencyBEs;
  }
  -[NSMutableArray addObject:](txLatencyBEs, "addObject:", v4);

}

- (unint64_t)txLatencyBEsCount
{
  return -[NSMutableArray count](self->_txLatencyBEs, "count");
}

- (id)txLatencyBEAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyBEs, "objectAtIndex:", a3);
}

+ (Class)txLatencyBEType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVOs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyVOs, "removeAllObjects");
}

- (void)addTxLatencyVO:(id)a3
{
  id v4;
  NSMutableArray *txLatencyVOs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txLatencyVOs = self->_txLatencyVOs;
  v8 = v4;
  if (!txLatencyVOs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txLatencyVOs;
    self->_txLatencyVOs = v6;

    v4 = v8;
    txLatencyVOs = self->_txLatencyVOs;
  }
  -[NSMutableArray addObject:](txLatencyVOs, "addObject:", v4);

}

- (unint64_t)txLatencyVOsCount
{
  return -[NSMutableArray count](self->_txLatencyVOs, "count");
}

- (id)txLatencyVOAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyVOs, "objectAtIndex:", a3);
}

+ (Class)txLatencyVOType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVIs
{
  -[NSMutableArray removeAllObjects](self->_txLatencyVIs, "removeAllObjects");
}

- (void)addTxLatencyVI:(id)a3
{
  id v4;
  NSMutableArray *txLatencyVIs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txLatencyVIs = self->_txLatencyVIs;
  v8 = v4;
  if (!txLatencyVIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txLatencyVIs;
    self->_txLatencyVIs = v6;

    v4 = v8;
    txLatencyVIs = self->_txLatencyVIs;
  }
  -[NSMutableArray addObject:](txLatencyVIs, "addObject:", v4);

}

- (unint64_t)txLatencyVIsCount
{
  return -[NSMutableArray count](self->_txLatencyVIs, "count");
}

- (id)txLatencyVIAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txLatencyVIs, "objectAtIndex:", a3);
}

+ (Class)txLatencyVIType
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats;
  -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ii;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t kk;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
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
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  role = self->_role;
  if (role)
    objc_msgSend(v3, "setObject:forKey:", role, CFSTR("role"));
  if (-[NSMutableArray count](self->_packets, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v7 = self->_packets;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v97 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("packets"));
  }
  if (-[NSMutableArray count](self->_bytes, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v14 = self->_bytes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v93;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v93 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("bytes"));
  }
  if (-[NSMutableArray count](self->_npeers, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_npeers, "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v21 = self->_npeers;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v88, v105, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v89;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v89 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v88, v105, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("npeers"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerCount);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("peerCount"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_32:
      if ((has & 8) == 0)
        goto LABEL_33;
      goto LABEL_83;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peersAdded);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("peersAdded"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_33:
    if ((has & 1) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peersRemoved);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("peersRemoved"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_34:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabled);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("enabled"));

  }
LABEL_35:
  if (-[NSMutableArray count](self->_enableStates, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_enableStates, "count"));
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v30 = self->_enableStates;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v85;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v85 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * m), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("enableState"));
  }
  if (-[NSMutableArray count](self->_txLatencyBKs, "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v37 = self->_txLatencyBKs;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v80, v103, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v81;
      do
      {
        for (n = 0; n != v39; ++n)
        {
          if (*(_QWORD *)v81 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * n), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v80, v103, 16);
      }
      while (v39);
    }

    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("txLatencyBK"));
  }
  if (-[NSMutableArray count](self->_txLatencyBEs, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v44 = self->_txLatencyBEs;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v76, v102, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v77;
      do
      {
        for (ii = 0; ii != v46; ++ii)
        {
          if (*(_QWORD *)v77 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * ii), "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v76, v102, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("txLatencyBE"));
  }
  if (-[NSMutableArray count](self->_txLatencyVOs, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v51 = self->_txLatencyVOs;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v72, v101, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v73;
      do
      {
        for (jj = 0; jj != v53; ++jj)
        {
          if (*(_QWORD *)v73 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * jj), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v72, v101, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("txLatencyVO"));
  }
  if (-[NSMutableArray count](self->_txLatencyVIs, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v58 = self->_txLatencyVIs;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v68, v100, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v69;
      do
      {
        for (kk = 0; kk != v60; ++kk)
        {
          if (*(_QWORD *)v69 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * kk), "dictionaryRepresentation", (_QWORD)v68);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v68, v100, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("txLatencyVI"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_role)
    PBDataWriterWriteStringField();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v5 = self->_packets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v75 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v7);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = self->_bytes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    }
    while (v12);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v15 = self->_npeers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v67 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    }
    while (v17);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_26:
      if ((has & 8) == 0)
        goto LABEL_27;
      goto LABEL_67;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 1) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_28:
    PBDataWriterWriteUint32Field();
LABEL_29:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v21 = self->_enableStates;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v63 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    }
    while (v23);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = self->_txLatencyBKs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
    }
    while (v28);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = self->_txLatencyBEs;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v55;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
    }
    while (v33);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = self->_txLatencyVOs;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v51;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteSubmessage();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
    }
    while (v38);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = self->_txLatencyVIs;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v47;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v41);
        PBDataWriterWriteSubmessage();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
    }
    while (v43);
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
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  id v37;

  v37 = a3;
  if (self->_role)
    objc_msgSend(v37, "setRole:");
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats packetsCount](self, "packetsCount"))
  {
    objc_msgSend(v37, "clearPackets");
    v4 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats packetsCount](self, "packetsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats packetsAtIndex:](self, "packetsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addPackets:", v7);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats bytesCount](self, "bytesCount"))
  {
    objc_msgSend(v37, "clearBytes");
    v8 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats bytesCount](self, "bytesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats bytesAtIndex:](self, "bytesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addBytes:", v11);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats npeersCount](self, "npeersCount"))
  {
    objc_msgSend(v37, "clearNpeers");
    v12 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats npeersCount](self, "npeersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats npeersAtIndex:](self, "npeersAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addNpeers:", v15);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v37 + 12) = self->_peerCount;
    *((_BYTE *)v37 + 104) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
LABEL_43:
      *((_DWORD *)v37 + 14) = self->_peersRemoved;
      *((_BYTE *)v37 + 104) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v37 + 13) = self->_peersAdded;
  *((_BYTE *)v37 + 104) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_43;
LABEL_18:
  if ((has & 1) != 0)
  {
LABEL_19:
    *((_DWORD *)v37 + 6) = self->_enabled;
    *((_BYTE *)v37 + 104) |= 1u;
  }
LABEL_20:
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats enableStatesCount](self, "enableStatesCount"))
  {
    objc_msgSend(v37, "clearEnableStates");
    v17 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats enableStatesCount](self, "enableStatesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats enableStateAtIndex:](self, "enableStateAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addEnableState:", v20);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyBKsCount](self, "txLatencyBKsCount"))
  {
    objc_msgSend(v37, "clearTxLatencyBKs");
    v21 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyBKsCount](self, "txLatencyBKsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyBKAtIndex:](self, "txLatencyBKAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTxLatencyBK:", v24);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyBEsCount](self, "txLatencyBEsCount"))
  {
    objc_msgSend(v37, "clearTxLatencyBEs");
    v25 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyBEsCount](self, "txLatencyBEsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyBEAtIndex:](self, "txLatencyBEAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTxLatencyBE:", v28);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyVOsCount](self, "txLatencyVOsCount"))
  {
    objc_msgSend(v37, "clearTxLatencyVOs");
    v29 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyVOsCount](self, "txLatencyVOsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyVOAtIndex:](self, "txLatencyVOAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTxLatencyVO:", v32);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyVIsCount](self, "txLatencyVIsCount"))
  {
    objc_msgSend(v37, "clearTxLatencyVIs");
    v33 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyVIsCount](self, "txLatencyVIsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats txLatencyVIAtIndex:](self, "txLatencyVIAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTxLatencyVI:", v36);

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
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t jj;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t kk;
  void *v56;
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
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_role, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v8 = self->_packets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v87 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPackets:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
    }
    while (v10);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v14 = self->_bytes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
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
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBytes:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    }
    while (v16);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v20 = self->_npeers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v79 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNpeers:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_peerCount;
    *(_BYTE *)(v5 + 104) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_24:
      if ((has & 8) == 0)
        goto LABEL_25;
      goto LABEL_65;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(v5 + 52) = self->_peersAdded;
  *(_BYTE *)(v5 + 104) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_65:
  *(_DWORD *)(v5 + 56) = self->_peersRemoved;
  *(_BYTE *)(v5 + 104) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_26:
    *(_DWORD *)(v5 + 24) = self->_enabled;
    *(_BYTE *)(v5 + 104) |= 1u;
  }
LABEL_27:
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v27 = self->_enableStates;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v75;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v75 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnableState:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
    }
    while (v29);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v33 = self->_txLatencyBKs;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v71;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v71 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxLatencyBK:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
    }
    while (v35);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v39 = self->_txLatencyBEs;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v66, v92, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v67;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v67 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxLatencyBE:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v66, v92, 16);
    }
    while (v41);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v45 = self->_txLatencyVOs;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v62, v91, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v63;
    do
    {
      for (jj = 0; jj != v47; ++jj)
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxLatencyVO:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v62, v91, 16);
    }
    while (v47);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v51 = self->_txLatencyVIs;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v58, v90, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v59;
    do
    {
      for (kk = 0; kk != v53; ++kk)
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * kk), "copyWithZone:", a3, (_QWORD)v58);
        objc_msgSend((id)v5, "addTxLatencyVI:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v58, v90, 16);
    }
    while (v53);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *role;
  NSMutableArray *packets;
  NSMutableArray *bytes;
  NSMutableArray *npeers;
  NSMutableArray *enableStates;
  NSMutableArray *txLatencyBKs;
  NSMutableArray *txLatencyBEs;
  NSMutableArray *txLatencyVOs;
  NSMutableArray *txLatencyVIs;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  role = self->_role;
  if ((unint64_t)role | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](role, "isEqual:"))
      goto LABEL_40;
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:"))
      goto LABEL_40;
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:"))
      goto LABEL_40;
  }
  npeers = self->_npeers;
  if ((unint64_t)npeers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](npeers, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_peerCount != *((_DWORD *)v4 + 12))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
LABEL_40:
    v14 = 0;
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_peersAdded != *((_DWORD *)v4 + 13))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 8) == 0 || self->_peersRemoved != *((_DWORD *)v4 + 14))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_enabled != *((_DWORD *)v4 + 6))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    goto LABEL_40;
  }
  enableStates = self->_enableStates;
  if ((unint64_t)enableStates | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](enableStates, "isEqual:"))
  {
    goto LABEL_40;
  }
  txLatencyBKs = self->_txLatencyBKs;
  if ((unint64_t)txLatencyBKs | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBKs, "isEqual:"))
      goto LABEL_40;
  }
  txLatencyBEs = self->_txLatencyBEs;
  if ((unint64_t)txLatencyBEs | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBEs, "isEqual:"))
      goto LABEL_40;
  }
  txLatencyVOs = self->_txLatencyVOs;
  if ((unint64_t)txLatencyVOs | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVOs, "isEqual:"))
      goto LABEL_40;
  }
  txLatencyVIs = self->_txLatencyVIs;
  if ((unint64_t)txLatencyVIs | *((_QWORD *)v4 + 11))
    v14 = -[NSMutableArray isEqual:](txLatencyVIs, "isEqual:");
  else
    v14 = 1;
LABEL_41:

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
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[NSString hash](self->_role, "hash");
  v4 = -[NSMutableArray hash](self->_packets, "hash");
  v5 = -[NSMutableArray hash](self->_bytes, "hash");
  v6 = -[NSMutableArray hash](self->_npeers, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_peerCount;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_peersAdded;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v9 = 2654435761 * self->_peersRemoved;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v10 = 2654435761 * self->_enabled;
LABEL_10:
  v11 = v4 ^ v3 ^ v5 ^ v6;
  v12 = v7 ^ v8 ^ v9 ^ v10 ^ -[NSMutableArray hash](self->_enableStates, "hash");
  v13 = v11 ^ v12 ^ -[NSMutableArray hash](self->_txLatencyBKs, "hash");
  v14 = -[NSMutableArray hash](self->_txLatencyBEs, "hash");
  v15 = v14 ^ -[NSMutableArray hash](self->_txLatencyVOs, "hash");
  return v13 ^ v15 ^ -[NSMutableArray hash](self->_txLatencyVIs, "hash");
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats setRole:](self, "setRole:");
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v75 != v8)
          objc_enumerationMutation(v5);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addPackets:](self, "addPackets:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v7);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = *((id *)v4 + 1);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addBytes:](self, "addBytes:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    }
    while (v12);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v15 = *((id *)v4 + 4);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v67 != v18)
          objc_enumerationMutation(v15);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addNpeers:](self, "addNpeers:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    }
    while (v17);
  }

  v20 = *((_BYTE *)v4 + 104);
  if ((v20 & 2) != 0)
  {
    self->_peerCount = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v20 = *((_BYTE *)v4 + 104);
    if ((v20 & 4) == 0)
    {
LABEL_26:
      if ((v20 & 8) == 0)
        goto LABEL_27;
      goto LABEL_67;
    }
  }
  else if ((*((_BYTE *)v4 + 104) & 4) == 0)
  {
    goto LABEL_26;
  }
  self->_peersAdded = *((_DWORD *)v4 + 13);
  *(_BYTE *)&self->_has |= 4u;
  v20 = *((_BYTE *)v4 + 104);
  if ((v20 & 8) == 0)
  {
LABEL_27:
    if ((v20 & 1) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_67:
  self->_peersRemoved = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
LABEL_28:
    self->_enabled = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_29:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v21 = *((id *)v4 + 2);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v63 != v24)
          objc_enumerationMutation(v21);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addEnableState:](self, "addEnableState:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    }
    while (v23);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = *((id *)v4 + 10);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addTxLatencyBK:](self, "addTxLatencyBK:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
    }
    while (v28);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = *((id *)v4 + 9);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v55;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v31);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addTxLatencyBE:](self, "addTxLatencyBE:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * ii));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
    }
    while (v33);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = *((id *)v4 + 12);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v51;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(v36);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addTxLatencyVO:](self, "addTxLatencyVO:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * jj));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
    }
    while (v38);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = *((id *)v4 + 11);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v47;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v41);
        -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats addTxLatencyVI:](self, "addTxLatencyVI:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * kk), (_QWORD)v46);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
    }
    while (v43);
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

- (NSMutableArray)npeers
{
  return self->_npeers;
}

- (void)setNpeers:(id)a3
{
  objc_storeStrong((id *)&self->_npeers, a3);
}

- (unsigned)peerCount
{
  return self->_peerCount;
}

- (unsigned)peersAdded
{
  return self->_peersAdded;
}

- (unsigned)peersRemoved
{
  return self->_peersRemoved;
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

- (NSMutableArray)txLatencyBKs
{
  return self->_txLatencyBKs;
}

- (void)setTxLatencyBKs:(id)a3
{
  objc_storeStrong((id *)&self->_txLatencyBKs, a3);
}

- (NSMutableArray)txLatencyBEs
{
  return self->_txLatencyBEs;
}

- (void)setTxLatencyBEs:(id)a3
{
  objc_storeStrong((id *)&self->_txLatencyBEs, a3);
}

- (NSMutableArray)txLatencyVOs
{
  return self->_txLatencyVOs;
}

- (void)setTxLatencyVOs:(id)a3
{
  objc_storeStrong((id *)&self->_txLatencyVOs, a3);
}

- (NSMutableArray)txLatencyVIs
{
  return self->_txLatencyVIs;
}

- (void)setTxLatencyVIs:(id)a3
{
  objc_storeStrong((id *)&self->_txLatencyVIs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txLatencyVOs, 0);
  objc_storeStrong((id *)&self->_txLatencyVIs, 0);
  objc_storeStrong((id *)&self->_txLatencyBKs, 0);
  objc_storeStrong((id *)&self->_txLatencyBEs, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_npeers, 0);
  objc_storeStrong((id *)&self->_enableStates, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
}

@end
