@implementation WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats

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

- (void)clearNrtpeers
{
  -[NSMutableArray removeAllObjects](self->_nrtpeers, "removeAllObjects");
}

- (void)addNrtpeers:(id)a3
{
  id v4;
  NSMutableArray *nrtpeers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nrtpeers = self->_nrtpeers;
  v8 = v4;
  if (!nrtpeers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_nrtpeers;
    self->_nrtpeers = v6;

    v4 = v8;
    nrtpeers = self->_nrtpeers;
  }
  -[NSMutableArray addObject:](nrtpeers, "addObject:", v4);

}

- (unint64_t)nrtpeersCount
{
  return -[NSMutableArray count](self->_nrtpeers, "count");
}

- (id)nrtpeersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nrtpeers, "objectAtIndex:", a3);
}

+ (Class)nrtpeersType
{
  return (Class)objc_opt_class();
}

- (void)clearAwdlStates
{
  -[NSMutableArray removeAllObjects](self->_awdlStates, "removeAllObjects");
}

- (void)addAwdlState:(id)a3
{
  id v4;
  NSMutableArray *awdlStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  awdlStates = self->_awdlStates;
  v8 = v4;
  if (!awdlStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_awdlStates;
    self->_awdlStates = v6;

    v4 = v8;
    awdlStates = self->_awdlStates;
  }
  -[NSMutableArray addObject:](awdlStates, "addObject:", v4);

}

- (unint64_t)awdlStatesCount
{
  return -[NSMutableArray count](self->_awdlStates, "count");
}

- (id)awdlStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_awdlStates, "objectAtIndex:", a3);
}

+ (Class)awdlStateType
{
  return (Class)objc_opt_class();
}

- (void)setRtPeerCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rtPeerCount = a3;
}

- (void)setHasRtPeerCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRtPeerCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPeerCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_peerCount = a3;
}

- (void)setHasPeerCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPeerCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPeersAdded:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_peersAdded = a3;
}

- (void)setHasPeersAdded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPeersAdded
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPeersRemoved:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_peersRemoved = a3;
}

- (void)setHasPeersRemoved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPeersRemoved
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEnabled:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (void)setAfCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_afCount = a3;
}

- (void)setHasAfCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAfCount
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats;
  -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  char has;
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
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t mm;
  void *v70;
  void *v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t nn;
  void *v77;
  void *v78;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
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
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  role = self->_role;
  if (role)
    objc_msgSend(v3, "setObject:forKey:", role, CFSTR("role"));
  if (-[NSMutableArray count](self->_packets, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v7 = self->_packets;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v121;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v121 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("packets"));
  }
  if (-[NSMutableArray count](self->_bytes, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v14 = self->_bytes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v117;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v117 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("bytes"));
  }
  if (-[NSMutableArray count](self->_npeers, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_npeers, "count"));
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v21 = self->_npeers;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v113;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v113 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("npeers"));
  }
  if (-[NSMutableArray count](self->_nrtpeers, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_nrtpeers, "count"));
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v28 = self->_nrtpeers;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v109;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v109 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * m), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
      }
      while (v30);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("nrtpeers"));
  }
  if (-[NSMutableArray count](self->_awdlStates, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_awdlStates, "count"));
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v35 = self->_awdlStates;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v104, v129, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v105;
      do
      {
        for (n = 0; n != v37; ++n)
        {
          if (*(_QWORD *)v105 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * n), "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v104, v129, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("awdlState"));
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rtPeerCount);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("rtPeerCount"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_50:
      if ((has & 8) == 0)
        goto LABEL_51;
      goto LABEL_104;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerCount);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("peerCount"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_51:
    if ((has & 0x10) == 0)
      goto LABEL_52;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peersAdded);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("peersAdded"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_52:
    if ((has & 2) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peersRemoved);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("peersRemoved"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_53:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabled);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("enabled"));

  }
LABEL_54:
  if (-[NSMutableArray count](self->_enableStates, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_enableStates, "count"));
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v44 = self->_enableStates;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v100, v128, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v101;
      do
      {
        for (ii = 0; ii != v46; ++ii)
        {
          if (*(_QWORD *)v101 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * ii), "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v100, v128, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("enableState"));
  }
  if (-[NSMutableArray count](self->_txLatencyBKs, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v51 = self->_txLatencyBKs;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v96, v127, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v97;
      do
      {
        for (jj = 0; jj != v53; ++jj)
        {
          if (*(_QWORD *)v97 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * jj), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v96, v127, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("txLatencyBK"));
  }
  if (-[NSMutableArray count](self->_txLatencyBEs, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v58 = self->_txLatencyBEs;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v92, v126, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v93;
      do
      {
        for (kk = 0; kk != v60; ++kk)
        {
          if (*(_QWORD *)v93 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * kk), "dictionaryRepresentation");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v92, v126, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("txLatencyBE"));
  }
  if (-[NSMutableArray count](self->_txLatencyVOs, "count"))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v65 = self->_txLatencyVOs;
    v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v88, v125, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v89;
      do
      {
        for (mm = 0; mm != v67; ++mm)
        {
          if (*(_QWORD *)v89 != v68)
            objc_enumerationMutation(v65);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * mm), "dictionaryRepresentation");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v70);

        }
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v88, v125, 16);
      }
      while (v67);
    }

    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("txLatencyVO"));
  }
  if (-[NSMutableArray count](self->_txLatencyVIs, "count"))
  {
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v72 = self->_txLatencyVIs;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v84, v124, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v85;
      do
      {
        for (nn = 0; nn != v74; ++nn)
        {
          if (*(_QWORD *)v85 != v75)
            objc_enumerationMutation(v72);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * nn), "dictionaryRepresentation", (_QWORD)v84);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v77);

        }
        v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v84, v124, 16);
      }
      while (v74);
    }

    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("txLatencyVI"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_afCount);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("afCount"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  char has;
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
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t mm;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t nn;
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
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_role)
    PBDataWriterWriteStringField();
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v5 = self->_packets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v93 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v7);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v10 = self->_bytes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v89 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    }
    while (v12);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v15 = self->_npeers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v85 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    }
    while (v17);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v20 = self->_nrtpeers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v81;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v81 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
    }
    while (v22);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v25 = self->_awdlStates;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v77;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v77 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
    }
    while (v27);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_40:
      if ((has & 8) == 0)
        goto LABEL_41;
      goto LABEL_84;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_41:
    if ((has & 0x10) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_42:
    if ((has & 2) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_43:
    PBDataWriterWriteUint32Field();
LABEL_44:
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v31 = self->_enableStates;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v73;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v73 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
    }
    while (v33);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v36 = self->_txLatencyBKs;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v68, v99, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v69;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v69 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteSubmessage();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v68, v99, 16);
    }
    while (v38);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v41 = self->_txLatencyBEs;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v65;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(v41);
        PBDataWriterWriteSubmessage();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
    }
    while (v43);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v46 = self->_txLatencyVOs;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v61;
    do
    {
      for (mm = 0; mm != v48; ++mm)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(v46);
        PBDataWriterWriteSubmessage();
      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
    }
    while (v48);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v51 = self->_txLatencyVIs;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v57;
    do
    {
      for (nn = 0; nn != v53; ++nn)
      {
        if (*(_QWORD *)v57 != v54)
          objc_enumerationMutation(v51);
        PBDataWriterWriteSubmessage();
      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
    }
    while (v53);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  char has;
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
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t nn;
  void *v44;
  id v45;

  v45 = a3;
  if (self->_role)
    objc_msgSend(v45, "setRole:");
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats packetsCount](self, "packetsCount"))
  {
    objc_msgSend(v45, "clearPackets");
    v4 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats packetsCount](self, "packetsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats packetsAtIndex:](self, "packetsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addPackets:", v7);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats bytesCount](self, "bytesCount"))
  {
    objc_msgSend(v45, "clearBytes");
    v8 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats bytesCount](self, "bytesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats bytesAtIndex:](self, "bytesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addBytes:", v11);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats npeersCount](self, "npeersCount"))
  {
    objc_msgSend(v45, "clearNpeers");
    v12 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats npeersCount](self, "npeersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats npeersAtIndex:](self, "npeersAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addNpeers:", v15);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats nrtpeersCount](self, "nrtpeersCount"))
  {
    objc_msgSend(v45, "clearNrtpeers");
    v16 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats nrtpeersCount](self, "nrtpeersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats nrtpeersAtIndex:](self, "nrtpeersAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addNrtpeers:", v19);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats awdlStatesCount](self, "awdlStatesCount"))
  {
    objc_msgSend(v45, "clearAwdlStates");
    v20 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats awdlStatesCount](self, "awdlStatesCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats awdlStateAtIndex:](self, "awdlStateAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addAwdlState:", v23);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v45 + 24) = self->_rtPeerCount;
    *((_BYTE *)v45 + 136) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_25:
      if ((has & 8) == 0)
        goto LABEL_26;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v45 + 18) = self->_peerCount;
  *((_BYTE *)v45 + 136) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_26:
    if ((has & 0x10) == 0)
      goto LABEL_27;
LABEL_55:
    *((_DWORD *)v45 + 20) = self->_peersRemoved;
    *((_BYTE *)v45 + 136) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_54:
  *((_DWORD *)v45 + 19) = self->_peersAdded;
  *((_BYTE *)v45 + 136) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_55;
LABEL_27:
  if ((has & 2) != 0)
  {
LABEL_28:
    *((_DWORD *)v45 + 10) = self->_enabled;
    *((_BYTE *)v45 + 136) |= 2u;
  }
LABEL_29:
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats enableStatesCount](self, "enableStatesCount"))
  {
    objc_msgSend(v45, "clearEnableStates");
    v25 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats enableStatesCount](self, "enableStatesCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats enableStateAtIndex:](self, "enableStateAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addEnableState:", v28);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyBKsCount](self, "txLatencyBKsCount"))
  {
    objc_msgSend(v45, "clearTxLatencyBKs");
    v29 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyBKsCount](self, "txLatencyBKsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyBKAtIndex:](self, "txLatencyBKAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addTxLatencyBK:", v32);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyBEsCount](self, "txLatencyBEsCount"))
  {
    objc_msgSend(v45, "clearTxLatencyBEs");
    v33 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyBEsCount](self, "txLatencyBEsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyBEAtIndex:](self, "txLatencyBEAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addTxLatencyBE:", v36);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyVOsCount](self, "txLatencyVOsCount"))
  {
    objc_msgSend(v45, "clearTxLatencyVOs");
    v37 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyVOsCount](self, "txLatencyVOsCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyVOAtIndex:](self, "txLatencyVOAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addTxLatencyVO:", v40);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyVIsCount](self, "txLatencyVIsCount"))
  {
    objc_msgSend(v45, "clearTxLatencyVIs");
    v41 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyVIsCount](self, "txLatencyVIsCount");
    if (v41)
    {
      v42 = v41;
      for (nn = 0; nn != v42; ++nn)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats txLatencyVIAtIndex:](self, "txLatencyVIAtIndex:", nn);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addTxLatencyVI:", v44);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v45 + 2) = self->_afCount;
    *((_BYTE *)v45 + 136) |= 1u;
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
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  char has;
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
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t mm;
  void *v62;
  NSMutableArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t nn;
  void *v68;
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
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_role, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v8 = self->_packets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v107 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPackets:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    }
    while (v10);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v14 = self->_bytes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v103 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBytes:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
    }
    while (v16);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v20 = self->_npeers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v99;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v99 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNpeers:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
    }
    while (v22);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v26 = self->_nrtpeers;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v95;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v95 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNrtpeers:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
    }
    while (v28);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v32 = self->_awdlStates;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v91;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v91 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAwdlState:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
    }
    while (v34);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_rtPeerCount;
    *(_BYTE *)(v5 + 136) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_38:
      if ((has & 8) == 0)
        goto LABEL_39;
      goto LABEL_82;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_38;
  }
  *(_DWORD *)(v5 + 72) = self->_peerCount;
  *(_BYTE *)(v5 + 136) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_39:
    if ((has & 0x10) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 76) = self->_peersAdded;
  *(_BYTE *)(v5 + 136) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_40:
    if ((has & 2) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_83:
  *(_DWORD *)(v5 + 80) = self->_peersRemoved;
  *(_BYTE *)(v5 + 136) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 40) = self->_enabled;
    *(_BYTE *)(v5 + 136) |= 2u;
  }
LABEL_42:
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v39 = self->_enableStates;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v86, v114, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v87;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v87 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnableState:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v86, v114, 16);
    }
    while (v41);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v45 = self->_txLatencyBKs;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v82, v113, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v83;
    do
    {
      for (jj = 0; jj != v47; ++jj)
      {
        if (*(_QWORD *)v83 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxLatencyBK:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v82, v113, 16);
    }
    while (v47);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v51 = self->_txLatencyBEs;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v78, v112, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v79;
    do
    {
      for (kk = 0; kk != v53; ++kk)
      {
        if (*(_QWORD *)v79 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxLatencyBE:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v78, v112, 16);
    }
    while (v53);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v57 = self->_txLatencyVOs;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v74, v111, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v75;
    do
    {
      for (mm = 0; mm != v59; ++mm)
      {
        if (*(_QWORD *)v75 != v60)
          objc_enumerationMutation(v57);
        v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxLatencyVO:", v62);

      }
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v74, v111, 16);
    }
    while (v59);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v63 = self->_txLatencyVIs;
  v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v70, v110, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v71;
    do
    {
      for (nn = 0; nn != v65; ++nn)
      {
        if (*(_QWORD *)v71 != v66)
          objc_enumerationMutation(v63);
        v68 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * nn), "copyWithZone:", a3, (_QWORD)v70);
        objc_msgSend((id)v5, "addTxLatencyVI:", v68);

      }
      v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v70, v110, 16);
    }
    while (v65);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_afCount;
    *(_BYTE *)(v5 + 136) |= 1u;
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
  NSMutableArray *nrtpeers;
  NSMutableArray *awdlStates;
  NSMutableArray *enableStates;
  NSMutableArray *txLatencyBKs;
  NSMutableArray *txLatencyBEs;
  NSMutableArray *txLatencyVOs;
  NSMutableArray *txLatencyVIs;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  role = self->_role;
  if ((unint64_t)role | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](role, "isEqual:"))
      goto LABEL_54;
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:"))
      goto LABEL_54;
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:"))
      goto LABEL_54;
  }
  npeers = self->_npeers;
  if ((unint64_t)npeers | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](npeers, "isEqual:"))
      goto LABEL_54;
  }
  nrtpeers = self->_nrtpeers;
  if ((unint64_t)nrtpeers | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](nrtpeers, "isEqual:"))
      goto LABEL_54;
  }
  awdlStates = self->_awdlStates;
  if ((unint64_t)awdlStates | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](awdlStates, "isEqual:"))
      goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 0x20) == 0 || self->_rtPeerCount != *((_DWORD *)v4 + 24))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 136) & 0x20) != 0)
  {
LABEL_54:
    v16 = 0;
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 4) == 0 || self->_peerCount != *((_DWORD *)v4 + 18))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 136) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 8) == 0 || self->_peersAdded != *((_DWORD *)v4 + 19))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 136) & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 0x10) == 0 || self->_peersRemoved != *((_DWORD *)v4 + 20))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 136) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 2) == 0 || self->_enabled != *((_DWORD *)v4 + 10))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 136) & 2) != 0)
  {
    goto LABEL_54;
  }
  enableStates = self->_enableStates;
  if ((unint64_t)enableStates | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](enableStates, "isEqual:"))
  {
    goto LABEL_54;
  }
  txLatencyBKs = self->_txLatencyBKs;
  if ((unint64_t)txLatencyBKs | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBKs, "isEqual:"))
      goto LABEL_54;
  }
  txLatencyBEs = self->_txLatencyBEs;
  if ((unint64_t)txLatencyBEs | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBEs, "isEqual:"))
      goto LABEL_54;
  }
  txLatencyVOs = self->_txLatencyVOs;
  if ((unint64_t)txLatencyVOs | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVOs, "isEqual:"))
      goto LABEL_54;
  }
  txLatencyVIs = self->_txLatencyVIs;
  if ((unint64_t)txLatencyVIs | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVIs, "isEqual:"))
      goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 1) == 0 || self->_afCount != *((_DWORD *)v4 + 2))
      goto LABEL_54;
    v16 = 1;
  }
  else
  {
    v16 = (*((_BYTE *)v4 + 136) & 1) == 0;
  }
LABEL_55:

  return v16;
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
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;

  v21 = -[NSString hash](self->_role, "hash");
  v20 = -[NSMutableArray hash](self->_packets, "hash");
  v19 = -[NSMutableArray hash](self->_bytes, "hash");
  v18 = -[NSMutableArray hash](self->_npeers, "hash");
  v17 = -[NSMutableArray hash](self->_nrtpeers, "hash");
  v16 = -[NSMutableArray hash](self->_awdlStates, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v15 = 2654435761 * self->_rtPeerCount;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v13 = 2654435761 * self->_peerCount;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v13 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v3 = 2654435761 * self->_peersAdded;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v4 = 2654435761 * self->_peersRemoved;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_enabled;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
LABEL_12:
  v6 = -[NSMutableArray hash](self->_enableStates, "hash", v13);
  v7 = -[NSMutableArray hash](self->_txLatencyBKs, "hash");
  v8 = -[NSMutableArray hash](self->_txLatencyBEs, "hash");
  v9 = -[NSMutableArray hash](self->_txLatencyVOs, "hash");
  v10 = -[NSMutableArray hash](self->_txLatencyVIs, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_afCount;
  else
    v11 = 0;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
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
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  char v30;
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
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t mm;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t nn;
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
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 11))
    -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats setRole:](self, "setRole:");
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v5 = *((id *)v4 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v93 != v8)
          objc_enumerationMutation(v5);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addPackets:](self, "addPackets:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v7);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v89 != v13)
          objc_enumerationMutation(v10);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addBytes:](self, "addBytes:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    }
    while (v12);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v15 = *((id *)v4 + 6);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v85 != v18)
          objc_enumerationMutation(v15);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addNpeers:](self, "addNpeers:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    }
    while (v17);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v20 = *((id *)v4 + 7);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v81;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v81 != v23)
          objc_enumerationMutation(v20);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addNrtpeers:](self, "addNrtpeers:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
    }
    while (v22);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v25 = *((id *)v4 + 2);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v77;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v77 != v28)
          objc_enumerationMutation(v25);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addAwdlState:](self, "addAwdlState:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
    }
    while (v27);
  }

  v30 = *((_BYTE *)v4 + 136);
  if ((v30 & 0x20) != 0)
  {
    self->_rtPeerCount = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 0x20u;
    v30 = *((_BYTE *)v4 + 136);
    if ((v30 & 4) == 0)
    {
LABEL_40:
      if ((v30 & 8) == 0)
        goto LABEL_41;
      goto LABEL_84;
    }
  }
  else if ((*((_BYTE *)v4 + 136) & 4) == 0)
  {
    goto LABEL_40;
  }
  self->_peerCount = *((_DWORD *)v4 + 18);
  *(_BYTE *)&self->_has |= 4u;
  v30 = *((_BYTE *)v4 + 136);
  if ((v30 & 8) == 0)
  {
LABEL_41:
    if ((v30 & 0x10) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  self->_peersAdded = *((_DWORD *)v4 + 19);
  *(_BYTE *)&self->_has |= 8u;
  v30 = *((_BYTE *)v4 + 136);
  if ((v30 & 0x10) == 0)
  {
LABEL_42:
    if ((v30 & 2) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_85:
  self->_peersRemoved = *((_DWORD *)v4 + 20);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 136) & 2) != 0)
  {
LABEL_43:
    self->_enabled = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_44:
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v31 = *((id *)v4 + 4);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v73;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v73 != v34)
          objc_enumerationMutation(v31);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addEnableState:](self, "addEnableState:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * ii));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
    }
    while (v33);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v36 = *((id *)v4 + 14);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v99, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v69;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v69 != v39)
          objc_enumerationMutation(v36);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addTxLatencyBK:](self, "addTxLatencyBK:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * jj));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v99, 16);
    }
    while (v38);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v41 = *((id *)v4 + 13);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v65;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(v41);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addTxLatencyBE:](self, "addTxLatencyBE:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * kk));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
    }
    while (v43);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v46 = *((id *)v4 + 16);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v61;
    do
    {
      for (mm = 0; mm != v48; ++mm)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(v46);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addTxLatencyVO:](self, "addTxLatencyVO:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * mm));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
    }
    while (v48);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v51 = *((id *)v4 + 15);
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v57;
    do
    {
      for (nn = 0; nn != v53; ++nn)
      {
        if (*(_QWORD *)v57 != v54)
          objc_enumerationMutation(v51);
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addTxLatencyVI:](self, "addTxLatencyVI:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * nn), (_QWORD)v56);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
    }
    while (v53);
  }

  if ((*((_BYTE *)v4 + 136) & 1) != 0)
  {
    self->_afCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
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

- (NSMutableArray)nrtpeers
{
  return self->_nrtpeers;
}

- (void)setNrtpeers:(id)a3
{
  objc_storeStrong((id *)&self->_nrtpeers, a3);
}

- (NSMutableArray)awdlStates
{
  return self->_awdlStates;
}

- (void)setAwdlStates:(id)a3
{
  objc_storeStrong((id *)&self->_awdlStates, a3);
}

- (unsigned)rtPeerCount
{
  return self->_rtPeerCount;
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

- (unsigned)afCount
{
  return self->_afCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txLatencyVOs, 0);
  objc_storeStrong((id *)&self->_txLatencyVIs, 0);
  objc_storeStrong((id *)&self->_txLatencyBKs, 0);
  objc_storeStrong((id *)&self->_txLatencyBEs, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_nrtpeers, 0);
  objc_storeStrong((id *)&self->_npeers, 0);
  objc_storeStrong((id *)&self->_enableStates, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_awdlStates, 0);
}

@end
