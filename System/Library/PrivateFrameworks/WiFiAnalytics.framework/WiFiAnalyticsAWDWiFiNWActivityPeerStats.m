@implementation WiFiAnalyticsAWDWiFiNWActivityPeerStats

- (int)role
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_role;
  else
    return 0;
}

- (void)setRole:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRole
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 < 3)
    return off_24CDDE580[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRole:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INFRA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEGACYAWDL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LLWAWDL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasHashID
{
  return self->_hashID != 0;
}

- (void)clearRssis
{
  -[NSMutableArray removeAllObjects](self->_rssis, "removeAllObjects");
}

- (void)addRssi:(id)a3
{
  id v4;
  NSMutableArray *rssis;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rssis = self->_rssis;
  v8 = v4;
  if (!rssis)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_rssis;
    self->_rssis = v6;

    v4 = v8;
    rssis = self->_rssis;
  }
  -[NSMutableArray addObject:](rssis, "addObject:", v4);

}

- (unint64_t)rssisCount
{
  return -[NSMutableArray count](self->_rssis, "count");
}

- (id)rssiAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rssis, "objectAtIndex:", a3);
}

+ (Class)rssiType
{
  return (Class)objc_opt_class();
}

- (void)clearCcas
{
  -[NSMutableArray removeAllObjects](self->_ccas, "removeAllObjects");
}

- (void)addCca:(id)a3
{
  id v4;
  NSMutableArray *ccas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ccas = self->_ccas;
  v8 = v4;
  if (!ccas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_ccas;
    self->_ccas = v6;

    v4 = v8;
    ccas = self->_ccas;
  }
  -[NSMutableArray addObject:](ccas, "addObject:", v4);

}

- (unint64_t)ccasCount
{
  return -[NSMutableArray count](self->_ccas, "count");
}

- (id)ccaAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ccas, "objectAtIndex:", a3);
}

+ (Class)ccaType
{
  return (Class)objc_opt_class();
}

- (void)clearSnrs
{
  -[NSMutableArray removeAllObjects](self->_snrs, "removeAllObjects");
}

- (void)addSnr:(id)a3
{
  id v4;
  NSMutableArray *snrs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  snrs = self->_snrs;
  v8 = v4;
  if (!snrs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_snrs;
    self->_snrs = v6;

    v4 = v8;
    snrs = self->_snrs;
  }
  -[NSMutableArray addObject:](snrs, "addObject:", v4);

}

- (unint64_t)snrsCount
{
  return -[NSMutableArray count](self->_snrs, "count");
}

- (id)snrAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_snrs, "objectAtIndex:", a3);
}

+ (Class)snrType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasCompletions
{
  return self->_completions != 0;
}

- (void)clearAcCompletions
{
  -[NSMutableArray removeAllObjects](self->_acCompletions, "removeAllObjects");
}

- (void)addAcCompletions:(id)a3
{
  id v4;
  NSMutableArray *acCompletions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  acCompletions = self->_acCompletions;
  v8 = v4;
  if (!acCompletions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_acCompletions;
    self->_acCompletions = v6;

    v4 = v8;
    acCompletions = self->_acCompletions;
  }
  -[NSMutableArray addObject:](acCompletions, "addObject:", v4);

}

- (unint64_t)acCompletionsCount
{
  return -[NSMutableArray count](self->_acCompletions, "count");
}

- (id)acCompletionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_acCompletions, "objectAtIndex:", a3);
}

+ (Class)acCompletionsType
{
  return (Class)objc_opt_class();
}

- (void)setRssiValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rssiValue = a3;
}

- (void)setHasRssiValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRssiValue
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSnrValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_snrValue = a3;
}

- (void)setHasSnrValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSnrValue
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setCcaValue:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ccaValue = a3;
}

- (void)setHasCcaValue:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCcaValue
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNfValue:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nfValue = a3;
}

- (void)setHasNfValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNfValue
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOfdmDesense:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ofdmDesense = a3;
}

- (void)setHasOfdmDesense:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOfdmDesense
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ibssCCA = a3;
}

- (void)setHasIbssCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIbssCCA
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setObssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_obssCCA = a3;
}

- (void)setHasObssCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasObssCCA
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInterferenceCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_interferenceCCA = a3;
}

- (void)setHasInterferenceCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInterferenceCCA
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setQbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_qbssCCA = a3;
}

- (void)setHasQbssCCA:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQbssCCA
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setQbssSTACount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qbssSTACount = a3;
}

- (void)setHasQbssSTACount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQbssSTACount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRssiValue0:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rssiValue0 = a3;
}

- (void)setHasRssiValue0:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRssiValue0
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRssiValue1:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rssiValue1 = a3;
}

- (void)setHasRssiValue1:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRssiValue1
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityPeerStats;
  -[WiFiAnalyticsAWDWiFiNWActivityPeerStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityPeerStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t role;
  __CFString *v5;
  NSString *hashID;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t jj;
  void *v55;
  void *v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t kk;
  void *v62;
  void *v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t mm;
  void *v69;
  WiFiAnalyticsAWDWiFiNWActivityTxCompletions *completions;
  void *v71;
  void *v72;
  NSMutableArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t nn;
  void *v78;
  __int16 has;
  void *v80;
  id v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
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
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    role = self->_role;
    if (role >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_role);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CDDE580[role];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("role"));

  }
  hashID = self->_hashID;
  if (hashID)
    objc_msgSend(v3, "setObject:forKey:", hashID, CFSTR("hashID"));
  if (-[NSMutableArray count](self->_rssis, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rssis, "count"));
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v8 = self->_rssis;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v131 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rssi"));
  }
  if (-[NSMutableArray count](self->_ccas, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_ccas, "count"));
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v15 = self->_ccas;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v126, v142, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v127;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v127 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v126, v142, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cca"));
  }
  if (-[NSMutableArray count](self->_snrs, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_snrs, "count"));
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v22 = self->_snrs;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v122, v141, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v123;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v123 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * k), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v122, v141, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("snr"));
  }
  if (-[NSMutableArray count](self->_packets, "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v29 = self->_packets;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v118, v140, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v119;
      do
      {
        for (m = 0; m != v31; ++m)
        {
          if (*(_QWORD *)v119 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * m), "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v118, v140, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("packets"));
  }
  if (-[NSMutableArray count](self->_bytes, "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v36 = self->_bytes;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v114, v139, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v115;
      do
      {
        for (n = 0; n != v38; ++n)
        {
          if (*(_QWORD *)v115 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * n), "dictionaryRepresentation");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v41);

        }
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v114, v139, 16);
      }
      while (v38);
    }

    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("bytes"));
  }
  if (-[NSMutableArray count](self->_txLatencyBKs, "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v43 = self->_txLatencyBKs;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v110, v138, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v111;
      do
      {
        for (ii = 0; ii != v45; ++ii)
        {
          if (*(_QWORD *)v111 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * ii), "dictionaryRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

        }
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v110, v138, 16);
      }
      while (v45);
    }

    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("txLatencyBK"));
  }
  if (-[NSMutableArray count](self->_txLatencyBEs, "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v50 = self->_txLatencyBEs;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v106, v137, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v107;
      do
      {
        for (jj = 0; jj != v52; ++jj)
        {
          if (*(_QWORD *)v107 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * jj), "dictionaryRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55);

        }
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v106, v137, 16);
      }
      while (v52);
    }

    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("txLatencyBE"));
  }
  if (-[NSMutableArray count](self->_txLatencyVOs, "count"))
  {
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v57 = self->_txLatencyVOs;
    v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v102, v136, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v103;
      do
      {
        for (kk = 0; kk != v59; ++kk)
        {
          if (*(_QWORD *)v103 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * kk), "dictionaryRepresentation");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v62);

        }
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v102, v136, 16);
      }
      while (v59);
    }

    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("txLatencyVO"));
  }
  if (-[NSMutableArray count](self->_txLatencyVIs, "count"))
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v64 = self->_txLatencyVIs;
    v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v98, v135, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v99;
      do
      {
        for (mm = 0; mm != v66; ++mm)
        {
          if (*(_QWORD *)v99 != v67)
            objc_enumerationMutation(v64);
          objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * mm), "dictionaryRepresentation");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addObject:", v69);

        }
        v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v98, v135, 16);
      }
      while (v66);
    }

    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("txLatencyVI"));
  }
  completions = self->_completions;
  if (completions)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions dictionaryRepresentation](completions, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("completions"));

  }
  if (-[NSMutableArray count](self->_acCompletions, "count"))
  {
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_acCompletions, "count"));
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v73 = self->_acCompletions;
    v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v94, v134, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v95;
      do
      {
        for (nn = 0; nn != v75; ++nn)
        {
          if (*(_QWORD *)v95 != v76)
            objc_enumerationMutation(v73);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * nn), "dictionaryRepresentation");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v78);

        }
        v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v94, v134, 16);
      }
      while (v75);
    }

    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("acCompletions"));
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssiValue);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("rssiValue"));

    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_102:
      if ((has & 1) == 0)
        goto LABEL_103;
      goto LABEL_116;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_102;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_snrValue);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("snrValue"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_103:
    if ((has & 8) == 0)
      goto LABEL_104;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaValue);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("ccaValue"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_104:
    if ((has & 0x20) == 0)
      goto LABEL_105;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_nfValue);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("nfValue"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_105:
    if ((has & 2) == 0)
      goto LABEL_106;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ofdmDesense);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("ofdmDesense"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_106:
    if ((has & 0x10) == 0)
      goto LABEL_107;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ibssCCA);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("ibssCCA"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_107:
    if ((has & 4) == 0)
      goto LABEL_108;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_obssCCA);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("obssCCA"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_108:
    if ((has & 0x40) == 0)
      goto LABEL_109;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_interferenceCCA);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("interferenceCCA"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_109:
    if ((has & 0x80) == 0)
      goto LABEL_110;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qbssCCA);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("qbssCCA"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_110:
    if ((has & 0x400) == 0)
      goto LABEL_111;
LABEL_124:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssiValue0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("rssiValue0"));

    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_113;
    goto LABEL_112;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qbssSTACount);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("qbssSTACount"));

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_124;
LABEL_111:
  if ((has & 0x800) != 0)
  {
LABEL_112:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssiValue1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("rssiValue1"));

  }
LABEL_113:
  v81 = v3;

  return v81;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityPeerStatsReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t jj;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t kk;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t mm;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t nn;
  __int16 has;
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_hashID)
    PBDataWriterWriteStringField();
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v5 = self->_rssis;
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
  v10 = self->_ccas;
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
  v15 = self->_snrs;
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
  v20 = self->_packets;
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
  v25 = self->_bytes;
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

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v30 = self->_txLatencyBKs;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v73;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v73 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
    }
    while (v32);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v35 = self->_txLatencyBEs;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v68, v99, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v69;
    do
    {
      for (jj = 0; jj != v37; ++jj)
      {
        if (*(_QWORD *)v69 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v68, v99, 16);
    }
    while (v37);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v40 = self->_txLatencyVOs;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v65;
    do
    {
      for (kk = 0; kk != v42; ++kk)
      {
        if (*(_QWORD *)v65 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
    }
    while (v42);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v45 = self->_txLatencyVIs;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v61;
    do
    {
      for (mm = 0; mm != v47; ++mm)
      {
        if (*(_QWORD *)v61 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage();
      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
    }
    while (v47);
  }

  if (self->_completions)
    PBDataWriterWriteSubmessage();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v50 = self->_acCompletions;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v57;
    do
    {
      for (nn = 0; nn != v52; ++nn)
      {
        if (*(_QWORD *)v57 != v53)
          objc_enumerationMutation(v50);
        PBDataWriterWriteSubmessage();
      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
    }
    while (v52);
  }

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_79:
      if ((has & 1) == 0)
        goto LABEL_80;
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_80:
    if ((has & 8) == 0)
      goto LABEL_81;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_81:
    if ((has & 0x20) == 0)
      goto LABEL_82;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_82:
    if ((has & 2) == 0)
      goto LABEL_83;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_83:
    if ((has & 0x10) == 0)
      goto LABEL_84;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_84:
    if ((has & 4) == 0)
      goto LABEL_85;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_85:
    if ((has & 0x40) == 0)
      goto LABEL_86;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_86:
    if ((has & 0x80) == 0)
      goto LABEL_87;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_87:
    if ((has & 0x400) == 0)
      goto LABEL_88;
LABEL_101:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_90;
    goto LABEL_89;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_101;
LABEL_88:
  if ((has & 0x800) != 0)
LABEL_89:
    PBDataWriterWriteInt32Field();
LABEL_90:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
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
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t nn;
  void *v44;
  __int16 has;
  id v46;

  v4 = a3;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v4[24] = self->_role;
    *((_WORD *)v4 + 84) |= 0x100u;
  }
  v46 = v4;
  if (self->_hashID)
    objc_msgSend(v4, "setHashID:");
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats rssisCount](self, "rssisCount"))
  {
    objc_msgSend(v46, "clearRssis");
    v5 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats rssisCount](self, "rssisCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats rssiAtIndex:](self, "rssiAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addRssi:", v8);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats ccasCount](self, "ccasCount"))
  {
    objc_msgSend(v46, "clearCcas");
    v9 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats ccasCount](self, "ccasCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats ccaAtIndex:](self, "ccaAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addCca:", v12);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats snrsCount](self, "snrsCount"))
  {
    objc_msgSend(v46, "clearSnrs");
    v13 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats snrsCount](self, "snrsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats snrAtIndex:](self, "snrAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addSnr:", v16);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats packetsCount](self, "packetsCount"))
  {
    objc_msgSend(v46, "clearPackets");
    v17 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats packetsCount](self, "packetsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats packetsAtIndex:](self, "packetsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addPackets:", v20);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats bytesCount](self, "bytesCount"))
  {
    objc_msgSend(v46, "clearBytes");
    v21 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats bytesCount](self, "bytesCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats bytesAtIndex:](self, "bytesAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addBytes:", v24);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyBKsCount](self, "txLatencyBKsCount"))
  {
    objc_msgSend(v46, "clearTxLatencyBKs");
    v25 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyBKsCount](self, "txLatencyBKsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyBKAtIndex:](self, "txLatencyBKAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addTxLatencyBK:", v28);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyBEsCount](self, "txLatencyBEsCount"))
  {
    objc_msgSend(v46, "clearTxLatencyBEs");
    v29 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyBEsCount](self, "txLatencyBEsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyBEAtIndex:](self, "txLatencyBEAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addTxLatencyBE:", v32);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyVOsCount](self, "txLatencyVOsCount"))
  {
    objc_msgSend(v46, "clearTxLatencyVOs");
    v33 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyVOsCount](self, "txLatencyVOsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyVOAtIndex:](self, "txLatencyVOAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addTxLatencyVO:", v36);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyVIsCount](self, "txLatencyVIsCount"))
  {
    objc_msgSend(v46, "clearTxLatencyVIs");
    v37 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyVIsCount](self, "txLatencyVIsCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats txLatencyVIAtIndex:](self, "txLatencyVIAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addTxLatencyVI:", v40);

      }
    }
  }
  if (self->_completions)
    objc_msgSend(v46, "setCompletions:");
  if (-[WiFiAnalyticsAWDWiFiNWActivityPeerStats acCompletionsCount](self, "acCompletionsCount"))
  {
    objc_msgSend(v46, "clearAcCompletions");
    v41 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats acCompletionsCount](self, "acCompletionsCount");
    if (v41)
    {
      v42 = v41;
      for (nn = 0; nn != v42; ++nn)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats acCompletionsAtIndex:](self, "acCompletionsAtIndex:", nn);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addAcCompletions:", v44);

      }
    }
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v46 + 25) = self->_rssiValue;
    *((_WORD *)v46 + 84) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_49:
      if ((has & 1) == 0)
        goto LABEL_50;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_49;
  }
  *((_DWORD *)v46 + 30) = self->_snrValue;
  *((_WORD *)v46 + 84) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_50:
    if ((has & 8) == 0)
      goto LABEL_51;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v46 + 6) = self->_ccaValue;
  *((_WORD *)v46 + 84) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_51:
    if ((has & 0x20) == 0)
      goto LABEL_52;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v46 + 16) = self->_nfValue;
  *((_WORD *)v46 + 84) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_52:
    if ((has & 2) == 0)
      goto LABEL_53;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v46 + 18) = self->_ofdmDesense;
  *((_WORD *)v46 + 84) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_53:
    if ((has & 0x10) == 0)
      goto LABEL_54;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v46 + 14) = self->_ibssCCA;
  *((_WORD *)v46 + 84) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_54:
    if ((has & 4) == 0)
      goto LABEL_55;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v46 + 17) = self->_obssCCA;
  *((_WORD *)v46 + 84) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_55:
    if ((has & 0x40) == 0)
      goto LABEL_56;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v46 + 15) = self->_interferenceCCA;
  *((_WORD *)v46 + 84) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_56:
    if ((has & 0x80) == 0)
      goto LABEL_57;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v46 + 22) = self->_qbssCCA;
  *((_WORD *)v46 + 84) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_57:
    if ((has & 0x400) == 0)
      goto LABEL_58;
LABEL_71:
    *((_DWORD *)v46 + 26) = self->_rssiValue0;
    *((_WORD *)v46 + 84) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_70:
  *((_DWORD *)v46 + 23) = self->_qbssSTACount;
  *((_WORD *)v46 + 84) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_71;
LABEL_58:
  if ((has & 0x800) != 0)
  {
LABEL_59:
    *((_DWORD *)v46 + 27) = self->_rssiValue1;
    *((_WORD *)v46 + 84) |= 0x800u;
  }
LABEL_60:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
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
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t mm;
  void *v62;
  id v63;
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t nn;
  void *v70;
  __int16 has;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_role;
    *(_WORD *)(v5 + 168) |= 0x100u;
  }
  v7 = -[NSString copyWithZone:](self->_hashID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v9 = self->_rssis;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v110 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRssi:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
    }
    while (v11);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v15 = self->_ccas;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v106;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v106 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCca:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    }
    while (v17);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v21 = self->_snrs;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v102 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSnr:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
    }
    while (v23);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v27 = self->_packets;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v98 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPackets:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
    }
    while (v29);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v33 = self->_bytes;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v94;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v94 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addBytes:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
    }
    while (v35);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v39 = self->_txLatencyBKs;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v90;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v90 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyBK:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
    }
    while (v41);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v45 = self->_txLatencyBEs;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v86;
    do
    {
      for (jj = 0; jj != v47; ++jj)
      {
        if (*(_QWORD *)v86 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyBE:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
    }
    while (v47);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v51 = self->_txLatencyVOs;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v81, v115, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v82;
    do
    {
      for (kk = 0; kk != v53; ++kk)
      {
        if (*(_QWORD *)v82 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyVO:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v81, v115, 16);
    }
    while (v53);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v57 = self->_txLatencyVIs;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v77, v114, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v78;
    do
    {
      for (mm = 0; mm != v59; ++mm)
      {
        if (*(_QWORD *)v78 != v60)
          objc_enumerationMutation(v57);
        v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTxLatencyVI:", v62);

      }
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v77, v114, 16);
    }
    while (v59);
  }

  v63 = -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions copyWithZone:](self->_completions, "copyWithZone:", a3);
  v64 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v63;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v65 = self->_acCompletions;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v73, v113, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v74;
    do
    {
      for (nn = 0; nn != v67; ++nn)
      {
        if (*(_QWORD *)v74 != v68)
          objc_enumerationMutation(v65);
        v70 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * nn), "copyWithZone:", a3, (_QWORD)v73);
        objc_msgSend((id)v6, "addAcCompletions:", v70);

      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v73, v113, 16);
    }
    while (v67);
  }

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_rssiValue;
    *(_WORD *)(v6 + 168) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_75:
      if ((has & 1) == 0)
        goto LABEL_76;
      goto LABEL_89;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_75;
  }
  *(_DWORD *)(v6 + 120) = self->_snrValue;
  *(_WORD *)(v6 + 168) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_76:
    if ((has & 8) == 0)
      goto LABEL_77;
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v6 + 24) = self->_ccaValue;
  *(_WORD *)(v6 + 168) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_77:
    if ((has & 0x20) == 0)
      goto LABEL_78;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 64) = self->_nfValue;
  *(_WORD *)(v6 + 168) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_78:
    if ((has & 2) == 0)
      goto LABEL_79;
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 72) = self->_ofdmDesense;
  *(_WORD *)(v6 + 168) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_79:
    if ((has & 0x10) == 0)
      goto LABEL_80;
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 56) = self->_ibssCCA;
  *(_WORD *)(v6 + 168) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_80:
    if ((has & 4) == 0)
      goto LABEL_81;
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 68) = self->_obssCCA;
  *(_WORD *)(v6 + 168) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_81:
    if ((has & 0x40) == 0)
      goto LABEL_82;
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 60) = self->_interferenceCCA;
  *(_WORD *)(v6 + 168) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_82:
    if ((has & 0x80) == 0)
      goto LABEL_83;
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 88) = self->_qbssCCA;
  *(_WORD *)(v6 + 168) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_83:
    if ((has & 0x400) == 0)
      goto LABEL_84;
LABEL_97:
    *(_DWORD *)(v6 + 104) = self->_rssiValue0;
    *(_WORD *)(v6 + 168) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      return (id)v6;
    goto LABEL_85;
  }
LABEL_96:
  *(_DWORD *)(v6 + 92) = self->_qbssSTACount;
  *(_WORD *)(v6 + 168) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_97;
LABEL_84:
  if ((has & 0x800) != 0)
  {
LABEL_85:
    *(_DWORD *)(v6 + 108) = self->_rssiValue1;
    *(_WORD *)(v6 + 168) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *hashID;
  NSMutableArray *rssis;
  NSMutableArray *ccas;
  NSMutableArray *snrs;
  NSMutableArray *packets;
  NSMutableArray *bytes;
  NSMutableArray *txLatencyBKs;
  NSMutableArray *txLatencyBEs;
  NSMutableArray *txLatencyVOs;
  NSMutableArray *txLatencyVIs;
  WiFiAnalyticsAWDWiFiNWActivityTxCompletions *completions;
  NSMutableArray *acCompletions;
  __int16 has;
  __int16 v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_91;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x100) == 0 || self->_role != *((_DWORD *)v4 + 24))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 84) & 0x100) != 0)
  {
LABEL_91:
    v19 = 0;
    goto LABEL_92;
  }
  hashID = self->_hashID;
  if ((unint64_t)hashID | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](hashID, "isEqual:"))
    goto LABEL_91;
  rssis = self->_rssis;
  if ((unint64_t)rssis | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](rssis, "isEqual:"))
      goto LABEL_91;
  }
  ccas = self->_ccas;
  if ((unint64_t)ccas | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](ccas, "isEqual:"))
      goto LABEL_91;
  }
  snrs = self->_snrs;
  if ((unint64_t)snrs | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](snrs, "isEqual:"))
      goto LABEL_91;
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:"))
      goto LABEL_91;
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:"))
      goto LABEL_91;
  }
  txLatencyBKs = self->_txLatencyBKs;
  if ((unint64_t)txLatencyBKs | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBKs, "isEqual:"))
      goto LABEL_91;
  }
  txLatencyBEs = self->_txLatencyBEs;
  if ((unint64_t)txLatencyBEs | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBEs, "isEqual:"))
      goto LABEL_91;
  }
  txLatencyVOs = self->_txLatencyVOs;
  if ((unint64_t)txLatencyVOs | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVOs, "isEqual:"))
      goto LABEL_91;
  }
  txLatencyVIs = self->_txLatencyVIs;
  if ((unint64_t)txLatencyVIs | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVIs, "isEqual:"))
      goto LABEL_91;
  }
  completions = self->_completions;
  if ((unint64_t)completions | *((_QWORD *)v4 + 5))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityTxCompletions isEqual:](completions, "isEqual:"))
      goto LABEL_91;
  }
  acCompletions = self->_acCompletions;
  if ((unint64_t)acCompletions | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](acCompletions, "isEqual:"))
      goto LABEL_91;
  }
  has = (__int16)self->_has;
  v18 = *((_WORD *)v4 + 84);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x200) == 0 || self->_rssiValue != *((_DWORD *)v4 + 25))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 84) & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x1000) == 0 || self->_snrValue != *((_DWORD *)v4 + 30))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 84) & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_ccaValue != *((_DWORD *)v4 + 6))
      goto LABEL_91;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_nfValue != *((_DWORD *)v4 + 16))
      goto LABEL_91;
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_ofdmDesense != *((_DWORD *)v4 + 18))
      goto LABEL_91;
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_ibssCCA != *((_DWORD *)v4 + 14))
      goto LABEL_91;
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_obssCCA != *((_DWORD *)v4 + 17))
      goto LABEL_91;
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_interferenceCCA != *((_DWORD *)v4 + 15))
      goto LABEL_91;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_qbssCCA != *((_DWORD *)v4 + 22))
      goto LABEL_91;
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_qbssSTACount != *((_DWORD *)v4 + 23))
      goto LABEL_91;
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x400) == 0 || self->_rssiValue0 != *((_DWORD *)v4 + 26))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 84) & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x800) == 0 || self->_rssiValue1 != *((_DWORD *)v4 + 27))
      goto LABEL_91;
    v19 = 1;
  }
  else
  {
    v19 = (v18 & 0x800) == 0;
  }
LABEL_92:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int16 has;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v29 = 2654435761 * self->_role;
  else
    v29 = 0;
  v28 = -[NSString hash](self->_hashID, "hash");
  v27 = -[NSMutableArray hash](self->_rssis, "hash");
  v26 = -[NSMutableArray hash](self->_ccas, "hash");
  v25 = -[NSMutableArray hash](self->_snrs, "hash");
  v3 = -[NSMutableArray hash](self->_packets, "hash");
  v4 = -[NSMutableArray hash](self->_bytes, "hash");
  v5 = -[NSMutableArray hash](self->_txLatencyBKs, "hash");
  v6 = -[NSMutableArray hash](self->_txLatencyBEs, "hash");
  v7 = -[NSMutableArray hash](self->_txLatencyVOs, "hash");
  v8 = -[NSMutableArray hash](self->_txLatencyVIs, "hash");
  v9 = -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions hash](self->_completions, "hash");
  v10 = -[NSMutableArray hash](self->_acCompletions, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v12 = 2654435761 * self->_rssiValue;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_6:
      v13 = 2654435761 * self->_snrValue;
      if ((has & 1) != 0)
        goto LABEL_7;
      goto LABEL_19;
    }
  }
  else
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_6;
  }
  v13 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v14 = 2654435761 * self->_ccaValue;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v15 = 2654435761 * self->_nfValue;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v16 = 2654435761 * self->_ofdmDesense;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v16 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v17 = 2654435761 * self->_ibssCCA;
    if ((has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v17 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    v18 = 2654435761 * self->_obssCCA;
    if ((has & 4) != 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_12:
    v19 = 2654435761 * self->_interferenceCCA;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  v19 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v20 = 2654435761 * self->_qbssCCA;
    if ((has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  v20 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    v21 = 2654435761 * self->_qbssSTACount;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_15;
LABEL_27:
    v22 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_16;
LABEL_28:
    v23 = 0;
    return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_26:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_27;
LABEL_15:
  v22 = 2654435761 * self->_rssiValue0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_28;
LABEL_16:
  v23 = 2654435761 * self->_rssiValue1;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
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
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t mm;
  WiFiAnalyticsAWDWiFiNWActivityTxCompletions *completions;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t nn;
  __int16 v58;
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
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[42] & 0x100) != 0)
  {
    self->_role = v4[24];
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 6))
    -[WiFiAnalyticsAWDWiFiNWActivityPeerStats setHashID:](self, "setHashID:");
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v6 = *((id *)v5 + 14);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v96 != v9)
          objc_enumerationMutation(v6);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addRssi:](self, "addRssi:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v8);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v11 = *((id *)v5 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v92 != v14)
          objc_enumerationMutation(v11);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addCca:](self, "addCca:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    }
    while (v13);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v16 = *((id *)v5 + 16);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v88 != v19)
          objc_enumerationMutation(v16);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addSnr:](self, "addSnr:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    }
    while (v18);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v21 = *((id *)v5 + 10);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v84 != v24)
          objc_enumerationMutation(v21);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addPackets:](self, "addPackets:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
    }
    while (v23);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v26 = *((id *)v5 + 2);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v80;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v80 != v29)
          objc_enumerationMutation(v26);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addBytes:](self, "addBytes:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
    }
    while (v28);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v31 = *((id *)v5 + 18);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v103, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v76;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v76 != v34)
          objc_enumerationMutation(v31);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addTxLatencyBK:](self, "addTxLatencyBK:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * ii));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v103, 16);
    }
    while (v33);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v36 = *((id *)v5 + 17);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v102, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v72;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v72 != v39)
          objc_enumerationMutation(v36);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addTxLatencyBE:](self, "addTxLatencyBE:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * jj));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v102, 16);
    }
    while (v38);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v41 = *((id *)v5 + 20);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v101, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v68;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v68 != v44)
          objc_enumerationMutation(v41);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addTxLatencyVO:](self, "addTxLatencyVO:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * kk));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v101, 16);
    }
    while (v43);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v46 = *((id *)v5 + 19);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v100, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v64;
    do
    {
      for (mm = 0; mm != v48; ++mm)
      {
        if (*(_QWORD *)v64 != v49)
          objc_enumerationMutation(v46);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addTxLatencyVI:](self, "addTxLatencyVI:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * mm));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v100, 16);
    }
    while (v48);
  }

  completions = self->_completions;
  v52 = *((_QWORD *)v5 + 5);
  if (completions)
  {
    if (v52)
      -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions mergeFrom:](completions, "mergeFrom:");
  }
  else if (v52)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityPeerStats setCompletions:](self, "setCompletions:");
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v53 = *((id *)v5 + 1);
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v59, v99, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v60;
    do
    {
      for (nn = 0; nn != v55; ++nn)
      {
        if (*(_QWORD *)v60 != v56)
          objc_enumerationMutation(v53);
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addAcCompletions:](self, "addAcCompletions:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * nn), (_QWORD)v59);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v59, v99, 16);
    }
    while (v55);
  }

  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x200) != 0)
  {
    self->_rssiValue = *((_DWORD *)v5 + 25);
    *(_WORD *)&self->_has |= 0x200u;
    v58 = *((_WORD *)v5 + 84);
    if ((v58 & 0x1000) == 0)
    {
LABEL_82:
      if ((v58 & 1) == 0)
        goto LABEL_83;
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)v5 + 84) & 0x1000) == 0)
  {
    goto LABEL_82;
  }
  self->_snrValue = *((_DWORD *)v5 + 30);
  *(_WORD *)&self->_has |= 0x1000u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 1) == 0)
  {
LABEL_83:
    if ((v58 & 8) == 0)
      goto LABEL_84;
    goto LABEL_97;
  }
LABEL_96:
  self->_ccaValue = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 1u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 8) == 0)
  {
LABEL_84:
    if ((v58 & 0x20) == 0)
      goto LABEL_85;
    goto LABEL_98;
  }
LABEL_97:
  self->_nfValue = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_has |= 8u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x20) == 0)
  {
LABEL_85:
    if ((v58 & 2) == 0)
      goto LABEL_86;
    goto LABEL_99;
  }
LABEL_98:
  self->_ofdmDesense = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 2) == 0)
  {
LABEL_86:
    if ((v58 & 0x10) == 0)
      goto LABEL_87;
    goto LABEL_100;
  }
LABEL_99:
  self->_ibssCCA = *((_DWORD *)v5 + 14);
  *(_WORD *)&self->_has |= 2u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x10) == 0)
  {
LABEL_87:
    if ((v58 & 4) == 0)
      goto LABEL_88;
    goto LABEL_101;
  }
LABEL_100:
  self->_obssCCA = *((_DWORD *)v5 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 4) == 0)
  {
LABEL_88:
    if ((v58 & 0x40) == 0)
      goto LABEL_89;
    goto LABEL_102;
  }
LABEL_101:
  self->_interferenceCCA = *((_DWORD *)v5 + 15);
  *(_WORD *)&self->_has |= 4u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x40) == 0)
  {
LABEL_89:
    if ((v58 & 0x80) == 0)
      goto LABEL_90;
    goto LABEL_103;
  }
LABEL_102:
  self->_qbssCCA = *((_DWORD *)v5 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x80) == 0)
  {
LABEL_90:
    if ((v58 & 0x400) == 0)
      goto LABEL_91;
LABEL_104:
    self->_rssiValue0 = *((_DWORD *)v5 + 26);
    *(_WORD *)&self->_has |= 0x400u;
    if ((*((_WORD *)v5 + 84) & 0x800) == 0)
      goto LABEL_93;
    goto LABEL_92;
  }
LABEL_103:
  self->_qbssSTACount = *((_DWORD *)v5 + 23);
  *(_WORD *)&self->_has |= 0x80u;
  v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x400) != 0)
    goto LABEL_104;
LABEL_91:
  if ((v58 & 0x800) != 0)
  {
LABEL_92:
    self->_rssiValue1 = *((_DWORD *)v5 + 27);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_93:

}

- (NSString)hashID
{
  return self->_hashID;
}

- (void)setHashID:(id)a3
{
  objc_storeStrong((id *)&self->_hashID, a3);
}

- (NSMutableArray)rssis
{
  return self->_rssis;
}

- (void)setRssis:(id)a3
{
  objc_storeStrong((id *)&self->_rssis, a3);
}

- (NSMutableArray)ccas
{
  return self->_ccas;
}

- (void)setCcas:(id)a3
{
  objc_storeStrong((id *)&self->_ccas, a3);
}

- (NSMutableArray)snrs
{
  return self->_snrs;
}

- (void)setSnrs:(id)a3
{
  objc_storeStrong((id *)&self->_snrs, a3);
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

- (WiFiAnalyticsAWDWiFiNWActivityTxCompletions)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (NSMutableArray)acCompletions
{
  return self->_acCompletions;
}

- (void)setAcCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_acCompletions, a3);
}

- (int)rssiValue
{
  return self->_rssiValue;
}

- (int)snrValue
{
  return self->_snrValue;
}

- (unsigned)ccaValue
{
  return self->_ccaValue;
}

- (int)nfValue
{
  return self->_nfValue;
}

- (unsigned)ofdmDesense
{
  return self->_ofdmDesense;
}

- (unsigned)ibssCCA
{
  return self->_ibssCCA;
}

- (unsigned)obssCCA
{
  return self->_obssCCA;
}

- (unsigned)interferenceCCA
{
  return self->_interferenceCCA;
}

- (unsigned)qbssCCA
{
  return self->_qbssCCA;
}

- (unsigned)qbssSTACount
{
  return self->_qbssSTACount;
}

- (int)rssiValue0
{
  return self->_rssiValue0;
}

- (int)rssiValue1
{
  return self->_rssiValue1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txLatencyVOs, 0);
  objc_storeStrong((id *)&self->_txLatencyVIs, 0);
  objc_storeStrong((id *)&self->_txLatencyBKs, 0);
  objc_storeStrong((id *)&self->_txLatencyBEs, 0);
  objc_storeStrong((id *)&self->_snrs, 0);
  objc_storeStrong((id *)&self->_rssis, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_hashID, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_ccas, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_acCompletions, 0);
}

@end
