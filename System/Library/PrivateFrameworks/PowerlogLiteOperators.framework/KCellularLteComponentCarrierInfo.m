@implementation KCellularLteComponentCarrierInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPccEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_pccEarfcn = a3;
}

- (void)setHasPccEarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPccEarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setScc0Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_scc0Earfcn = a3;
}

- (void)setHasScc0Earfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScc0Earfcn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setScc1Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_scc1Earfcn = a3;
}

- (void)setHasScc1Earfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScc1Earfcn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)pccBandwidth
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_pccBandwidth;
  else
    return 0;
}

- (void)setPccBandwidth:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pccBandwidth = a3;
}

- (void)setHasPccBandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPccBandwidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)pccBandwidthAsString:(int)a3
{
  if (a3 < 7)
    return off_1E857D2F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPccBandwidth:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N25")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N75")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N100")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_COUNT")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)scc0Bandwidth
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_scc0Bandwidth;
  else
    return 0;
}

- (void)setScc0Bandwidth:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_scc0Bandwidth = a3;
}

- (void)setHasScc0Bandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScc0Bandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)scc0BandwidthAsString:(int)a3
{
  if (a3 < 7)
    return off_1E857D2F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScc0Bandwidth:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N25")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N75")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N100")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_COUNT")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)scc1Bandwidth
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_scc1Bandwidth;
  else
    return 0;
}

- (void)setScc1Bandwidth:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_scc1Bandwidth = a3;
}

- (void)setHasScc1Bandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScc1Bandwidth
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)scc1BandwidthAsString:(int)a3
{
  if (a3 < 7)
    return off_1E857D2F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScc1Bandwidth:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N25")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N75")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N100")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_COUNT")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPccRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pccRfBand = a3;
}

- (void)setHasPccRfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPccRfBand
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScc0RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_scc0RfBand = a3;
}

- (void)setHasScc0RfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScc0RfBand
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setScc1RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scc1RfBand = a3;
}

- (void)setHasScc1RfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScc1RfBand
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearCarrierInfos
{
  -[NSMutableArray removeAllObjects](self->_carrierInfos, "removeAllObjects");
}

- (void)addCarrierInfo:(id)a3
{
  id v4;
  NSMutableArray *carrierInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  carrierInfos = self->_carrierInfos;
  v8 = v4;
  if (!carrierInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_carrierInfos;
    self->_carrierInfos = v6;

    v4 = v8;
    carrierInfos = self->_carrierInfos;
  }
  -[NSMutableArray addObject:](carrierInfos, "addObject:", v4);

}

- (unint64_t)carrierInfosCount
{
  return -[NSMutableArray count](self->_carrierInfos, "count");
}

- (id)carrierInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_carrierInfos, "objectAtIndex:", a3);
}

+ (Class)carrierInfoType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)KCellularLteComponentCarrierInfo;
  -[KCellularLteComponentCarrierInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularLteComponentCarrierInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t pccBandwidth;
  __CFString *v20;
  uint64_t scc0Bandwidth;
  __CFString *v22;
  uint64_t scc1Bandwidth;
  __CFString *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pccEarfcn);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("pcc_earfcn"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scc0Earfcn);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("scc0_earfcn"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scc1Earfcn);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("scc1_earfcn"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_28:
  pccBandwidth = self->_pccBandwidth;
  if (pccBandwidth >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pccBandwidth);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E857D2F0[pccBandwidth];
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("pcc_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_32:
  scc0Bandwidth = self->_scc0Bandwidth;
  if (scc0Bandwidth >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_scc0Bandwidth);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E857D2F0[scc0Bandwidth];
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("scc0_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_36:
  scc1Bandwidth = self->_scc1Bandwidth;
  if (scc1Bandwidth >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_scc1Bandwidth);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_1E857D2F0[scc1Bandwidth];
  }
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("scc1_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pccRfBand);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("pcc_rf_band"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scc0RfBand);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("scc0_rf_band"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scc1RfBand);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scc1_rf_band"));

  }
LABEL_12:
  if (-[NSMutableArray count](self->_carrierInfos, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_carrierInfos, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_carrierInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("carrier_info"));
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLteComponentCarrierInfoReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_carrierInfos;
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
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_pccEarfcn;
  *((_WORD *)v4 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 10) = self->_scc0Earfcn;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 13) = self->_scc1Earfcn;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 6) = self->_pccBandwidth;
  *((_WORD *)v4 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 9) = self->_scc0Bandwidth;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 12) = self->_scc1Bandwidth;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_27:
    *((_DWORD *)v4 + 11) = self->_scc0RfBand;
    *((_WORD *)v4 + 32) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_26:
  *((_DWORD *)v4 + 8) = self->_pccRfBand;
  *((_WORD *)v4 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_27;
LABEL_10:
  if ((has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 14) = self->_scc1RfBand;
    *((_WORD *)v4 + 32) |= 0x200u;
  }
LABEL_12:
  v10 = v4;
  if (-[KCellularLteComponentCarrierInfo carrierInfosCount](self, "carrierInfosCount"))
  {
    objc_msgSend(v10, "clearCarrierInfos");
    v6 = -[KCellularLteComponentCarrierInfo carrierInfosCount](self, "carrierInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[KCellularLteComponentCarrierInfo carrierInfoAtIndex:](self, "carrierInfoAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addCarrierInfo:", v9);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v10 + 15) = self->_subsId;
    *((_WORD *)v10 + 32) |= 0x400u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  NSMutableArray *v8;
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

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_pccEarfcn;
  *(_WORD *)(v5 + 64) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 40) = self->_scc0Earfcn;
  *(_WORD *)(v5 + 64) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 52) = self->_scc1Earfcn;
  *(_WORD *)(v5 + 64) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 24) = self->_pccBandwidth;
  *(_WORD *)(v5 + 64) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 36) = self->_scc0Bandwidth;
  *(_WORD *)(v5 + 64) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 48) = self->_scc1Bandwidth;
  *(_WORD *)(v5 + 64) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 32) = self->_pccRfBand;
  *(_WORD *)(v5 + 64) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  *(_DWORD *)(v5 + 44) = self->_scc0RfBand;
  *(_WORD *)(v5 + 64) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 56) = self->_scc1RfBand;
    *(_WORD *)(v5 + 64) |= 0x200u;
  }
LABEL_12:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_carrierInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addCarrierInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_subsId;
    *(_WORD *)(v6 + 64) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSMutableArray *carrierInfos;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 32);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_60;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_pccEarfcn != *((_DWORD *)v4 + 7))
      goto LABEL_60;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_scc0Earfcn != *((_DWORD *)v4 + 10))
      goto LABEL_60;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_scc1Earfcn != *((_DWORD *)v4 + 13))
      goto LABEL_60;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_pccBandwidth != *((_DWORD *)v4 + 6))
      goto LABEL_60;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_scc0Bandwidth != *((_DWORD *)v4 + 9))
      goto LABEL_60;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_scc1Bandwidth != *((_DWORD *)v4 + 12))
      goto LABEL_60;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_pccRfBand != *((_DWORD *)v4 + 8))
      goto LABEL_60;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_scc0RfBand != *((_DWORD *)v4 + 11))
      goto LABEL_60;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_scc1RfBand != *((_DWORD *)v4 + 14))
      goto LABEL_60;
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_60;
  }
  carrierInfos = self->_carrierInfos;
  if ((unint64_t)carrierInfos | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](carrierInfos, "isEqual:"))
    {
LABEL_60:
      v8 = 0;
      goto LABEL_61;
    }
    has = (__int16)self->_has;
    v6 = *((_WORD *)v4 + 32);
  }
  if ((has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 15))
      goto LABEL_60;
    v8 = 1;
  }
  else
  {
    v8 = (v6 & 0x400) == 0;
  }
LABEL_61:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v16 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_pccEarfcn;
      if ((has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    v14 = 2654435761 * self->_scc0Earfcn;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_scc1Earfcn;
    if ((has & 2) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_pccBandwidth;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_scc0Bandwidth;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_scc1Bandwidth;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_pccRfBand;
    if ((has & 0x40) != 0)
      goto LABEL_10;
LABEL_20:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_20;
LABEL_10:
  v9 = 2654435761 * self->_scc0RfBand;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_scc1RfBand;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
LABEL_22:
  v11 = -[NSMutableArray hash](self->_carrierInfos, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v12 = 2654435761 * self->_subsId;
  else
    v12 = 0;
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _DWORD *v5;
  __int16 v6;
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

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_pccEarfcn = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_scc0Earfcn = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_5:
    if ((v6 & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_scc1Earfcn = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 2) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_pccBandwidth = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_scc0Bandwidth = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_scc1Bandwidth = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_pccRfBand = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  self->_scc0RfBand = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_11:
    self->_scc1RfBand = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_12:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
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
        -[KCellularLteComponentCarrierInfo addCarrierInfo:](self, "addCarrierInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((v5[16] & 0x400) != 0)
  {
    self->_subsId = v5[15];
    *(_WORD *)&self->_has |= 0x400u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)pccEarfcn
{
  return self->_pccEarfcn;
}

- (unsigned)scc0Earfcn
{
  return self->_scc0Earfcn;
}

- (unsigned)scc1Earfcn
{
  return self->_scc1Earfcn;
}

- (unsigned)pccRfBand
{
  return self->_pccRfBand;
}

- (unsigned)scc0RfBand
{
  return self->_scc0RfBand;
}

- (unsigned)scc1RfBand
{
  return self->_scc1RfBand;
}

- (NSMutableArray)carrierInfos
{
  return self->_carrierInfos;
}

- (void)setCarrierInfos:(id)a3
{
  objc_storeStrong((id *)&self->_carrierInfos, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierInfos, 0);
}

@end
