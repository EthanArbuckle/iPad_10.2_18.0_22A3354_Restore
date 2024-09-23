@implementation WiFiAnalyticsAWDWiFiDPSSnapshot

- (BOOL)hasTxCompletionSnapshotBE
{
  return self->_txCompletionSnapshotBE != 0;
}

- (BOOL)hasTxCompletionSnapshotBK
{
  return self->_txCompletionSnapshotBK != 0;
}

- (BOOL)hasTxCompletionSnapshotVO
{
  return self->_txCompletionSnapshotVO != 0;
}

- (BOOL)hasTxCompletionSnapshotVI
{
  return self->_txCompletionSnapshotVI != 0;
}

- (BOOL)hasBtSnapshot
{
  return self->_btSnapshot != 0;
}

- (BOOL)hasAwdlSnapshot
{
  return self->_awdlSnapshot != 0;
}

- (BOOL)hasRc1Snapshot
{
  return self->_rc1Snapshot != 0;
}

- (BOOL)hasRc2Snapshot
{
  return self->_rc2Snapshot != 0;
}

- (BOOL)hasLteSnapshot
{
  return self->_lteSnapshot != 0;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSSnapshot;
  -[WiFiAnalyticsAWDWiFiDPSSnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiDPSSnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBE;
  void *v5;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBK;
  void *v7;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVO;
  void *v9;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVI;
  void *v11;
  WiFiAnalyticsAWDWiFiDPSBTSnapshot *btSnapshot;
  void *v13;
  WiFiAnalyticsAWDWiFiDPSAWDLSnapshot *awdlSnapshot;
  void *v15;
  WiFiAnalyticsAWDWiFiUsageSnapshot *rc1Snapshot;
  void *v17;
  WiFiAnalyticsAWDWiFiUsageSnapshot *rc2Snapshot;
  void *v19;
  WiFiAnalyticsAWDWiFiUsageSnapshot *lteSnapshot;
  void *v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  if (txCompletionSnapshotBE)
  {
    -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotBE, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("txCompletionSnapshotBE"));

  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  if (txCompletionSnapshotBK)
  {
    -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotBK, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("txCompletionSnapshotBK"));

  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  if (txCompletionSnapshotVO)
  {
    -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotVO, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("txCompletionSnapshotVO"));

  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  if (txCompletionSnapshotVI)
  {
    -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotVI, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("txCompletionSnapshotVI"));

  }
  btSnapshot = self->_btSnapshot;
  if (btSnapshot)
  {
    -[WiFiAnalyticsAWDWiFiDPSBTSnapshot dictionaryRepresentation](btSnapshot, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("btSnapshot"));

  }
  awdlSnapshot = self->_awdlSnapshot;
  if (awdlSnapshot)
  {
    -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot dictionaryRepresentation](awdlSnapshot, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("awdlSnapshot"));

  }
  rc1Snapshot = self->_rc1Snapshot;
  if (rc1Snapshot)
  {
    -[WiFiAnalyticsAWDWiFiUsageSnapshot dictionaryRepresentation](rc1Snapshot, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("rc1Snapshot"));

  }
  rc2Snapshot = self->_rc2Snapshot;
  if (rc2Snapshot)
  {
    -[WiFiAnalyticsAWDWiFiUsageSnapshot dictionaryRepresentation](rc2Snapshot, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rc2Snapshot"));

  }
  lteSnapshot = self->_lteSnapshot;
  if (lteSnapshot)
  {
    -[WiFiAnalyticsAWDWiFiUsageSnapshot dictionaryRepresentation](lteSnapshot, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("lteSnapshot"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_txCompletionSnapshotBE)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_txCompletionSnapshotBK)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_txCompletionSnapshotVO)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_txCompletionSnapshotVI)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_btSnapshot)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_awdlSnapshot)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rc1Snapshot)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rc2Snapshot)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_lteSnapshot)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_txCompletionSnapshotBE)
  {
    objc_msgSend(v4, "setTxCompletionSnapshotBE:");
    v4 = v5;
  }
  if (self->_txCompletionSnapshotBK)
  {
    objc_msgSend(v5, "setTxCompletionSnapshotBK:");
    v4 = v5;
  }
  if (self->_txCompletionSnapshotVO)
  {
    objc_msgSend(v5, "setTxCompletionSnapshotVO:");
    v4 = v5;
  }
  if (self->_txCompletionSnapshotVI)
  {
    objc_msgSend(v5, "setTxCompletionSnapshotVI:");
    v4 = v5;
  }
  if (self->_btSnapshot)
  {
    objc_msgSend(v5, "setBtSnapshot:");
    v4 = v5;
  }
  if (self->_awdlSnapshot)
  {
    objc_msgSend(v5, "setAwdlSnapshot:");
    v4 = v5;
  }
  if (self->_rc1Snapshot)
  {
    objc_msgSend(v5, "setRc1Snapshot:");
    v4 = v5;
  }
  if (self->_rc2Snapshot)
  {
    objc_msgSend(v5, "setRc2Snapshot:");
    v4 = v5;
  }
  if (self->_lteSnapshot)
  {
    objc_msgSend(v5, "setLteSnapshot:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotBE, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotBK, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotVO, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotVI, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  v14 = -[WiFiAnalyticsAWDWiFiDPSBTSnapshot copyWithZone:](self->_btSnapshot, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot copyWithZone:](self->_awdlSnapshot, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  v18 = -[WiFiAnalyticsAWDWiFiUsageSnapshot copyWithZone:](self->_rc1Snapshot, "copyWithZone:", a3);
  v19 = (void *)v5[4];
  v5[4] = v18;

  v20 = -[WiFiAnalyticsAWDWiFiUsageSnapshot copyWithZone:](self->_rc2Snapshot, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  v22 = -[WiFiAnalyticsAWDWiFiUsageSnapshot copyWithZone:](self->_lteSnapshot, "copyWithZone:", a3);
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBE;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBK;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVO;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVI;
  WiFiAnalyticsAWDWiFiDPSBTSnapshot *btSnapshot;
  WiFiAnalyticsAWDWiFiDPSAWDLSnapshot *awdlSnapshot;
  WiFiAnalyticsAWDWiFiUsageSnapshot *rc1Snapshot;
  WiFiAnalyticsAWDWiFiUsageSnapshot *rc2Snapshot;
  WiFiAnalyticsAWDWiFiUsageSnapshot *lteSnapshot;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  if ((unint64_t)txCompletionSnapshotBE | v4[6])
  {
    if (!-[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBE, "isEqual:"))
      goto LABEL_20;
  }
  if (((txCompletionSnapshotBK = self->_txCompletionSnapshotBK, !((unint64_t)txCompletionSnapshotBK | v4[7]))
     || -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBK, "isEqual:"))
    && ((txCompletionSnapshotVO = self->_txCompletionSnapshotVO, !((unint64_t)txCompletionSnapshotVO | v4[9]))
     || -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVO, "isEqual:"))
    && ((txCompletionSnapshotVI = self->_txCompletionSnapshotVI, !((unint64_t)txCompletionSnapshotVI | v4[8]))
     || -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVI, "isEqual:"))
    && ((btSnapshot = self->_btSnapshot, !((unint64_t)btSnapshot | v4[2]))
     || -[WiFiAnalyticsAWDWiFiDPSBTSnapshot isEqual:](btSnapshot, "isEqual:"))
    && ((awdlSnapshot = self->_awdlSnapshot, !((unint64_t)awdlSnapshot | v4[1]))
     || -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot isEqual:](awdlSnapshot, "isEqual:"))
    && ((rc1Snapshot = self->_rc1Snapshot, !((unint64_t)rc1Snapshot | v4[4]))
     || -[WiFiAnalyticsAWDWiFiUsageSnapshot isEqual:](rc1Snapshot, "isEqual:"))
    && ((rc2Snapshot = self->_rc2Snapshot, !((unint64_t)rc2Snapshot | v4[5]))
     || -[WiFiAnalyticsAWDWiFiUsageSnapshot isEqual:](rc2Snapshot, "isEqual:")))
  {
    lteSnapshot = self->_lteSnapshot;
    if ((unint64_t)lteSnapshot | v4[3])
      v14 = -[WiFiAnalyticsAWDWiFiUsageSnapshot isEqual:](lteSnapshot, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotBE, "hash");
  v4 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotBK, "hash") ^ v3;
  v5 = -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotVO, "hash");
  v6 = v4 ^ v5 ^ -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotVI, "hash");
  v7 = -[WiFiAnalyticsAWDWiFiDPSBTSnapshot hash](self->_btSnapshot, "hash");
  v8 = v7 ^ -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot hash](self->_awdlSnapshot, "hash");
  v9 = v6 ^ v8 ^ -[WiFiAnalyticsAWDWiFiUsageSnapshot hash](self->_rc1Snapshot, "hash");
  v10 = -[WiFiAnalyticsAWDWiFiUsageSnapshot hash](self->_rc2Snapshot, "hash");
  return v9 ^ v10 ^ -[WiFiAnalyticsAWDWiFiUsageSnapshot hash](self->_lteSnapshot, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBE;
  uint64_t v6;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBK;
  uint64_t v8;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVO;
  uint64_t v10;
  WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVI;
  uint64_t v12;
  WiFiAnalyticsAWDWiFiDPSBTSnapshot *btSnapshot;
  uint64_t v14;
  WiFiAnalyticsAWDWiFiDPSAWDLSnapshot *awdlSnapshot;
  uint64_t v16;
  WiFiAnalyticsAWDWiFiUsageSnapshot *rc1Snapshot;
  uint64_t v18;
  WiFiAnalyticsAWDWiFiUsageSnapshot *rc2Snapshot;
  uint64_t v20;
  WiFiAnalyticsAWDWiFiUsageSnapshot *lteSnapshot;
  uint64_t v22;
  _QWORD *v23;

  v4 = a3;
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  v23 = v4;
  v6 = v4[6];
  if (txCompletionSnapshotBE)
  {
    if (v6)
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBE, "mergeFrom:");
  }
  else if (v6)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotBE:](self, "setTxCompletionSnapshotBE:");
  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  v8 = v23[7];
  if (txCompletionSnapshotBK)
  {
    if (v8)
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBK, "mergeFrom:");
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotBK:](self, "setTxCompletionSnapshotBK:");
  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  v10 = v23[9];
  if (txCompletionSnapshotVO)
  {
    if (v10)
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVO, "mergeFrom:");
  }
  else if (v10)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotVO:](self, "setTxCompletionSnapshotVO:");
  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  v12 = v23[8];
  if (txCompletionSnapshotVI)
  {
    if (v12)
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVI, "mergeFrom:");
  }
  else if (v12)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotVI:](self, "setTxCompletionSnapshotVI:");
  }
  btSnapshot = self->_btSnapshot;
  v14 = v23[2];
  if (btSnapshot)
  {
    if (v14)
      -[WiFiAnalyticsAWDWiFiDPSBTSnapshot mergeFrom:](btSnapshot, "mergeFrom:");
  }
  else if (v14)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setBtSnapshot:](self, "setBtSnapshot:");
  }
  awdlSnapshot = self->_awdlSnapshot;
  v16 = v23[1];
  if (awdlSnapshot)
  {
    if (v16)
      -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot mergeFrom:](awdlSnapshot, "mergeFrom:");
  }
  else if (v16)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setAwdlSnapshot:](self, "setAwdlSnapshot:");
  }
  rc1Snapshot = self->_rc1Snapshot;
  v18 = v23[4];
  if (rc1Snapshot)
  {
    if (v18)
      -[WiFiAnalyticsAWDWiFiUsageSnapshot mergeFrom:](rc1Snapshot, "mergeFrom:");
  }
  else if (v18)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setRc1Snapshot:](self, "setRc1Snapshot:");
  }
  rc2Snapshot = self->_rc2Snapshot;
  v20 = v23[5];
  if (rc2Snapshot)
  {
    if (v20)
      -[WiFiAnalyticsAWDWiFiUsageSnapshot mergeFrom:](rc2Snapshot, "mergeFrom:");
  }
  else if (v20)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setRc2Snapshot:](self, "setRc2Snapshot:");
  }
  lteSnapshot = self->_lteSnapshot;
  v22 = v23[3];
  if (lteSnapshot)
  {
    if (v22)
      -[WiFiAnalyticsAWDWiFiUsageSnapshot mergeFrom:](lteSnapshot, "mergeFrom:");
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setLteSnapshot:](self, "setLteSnapshot:");
  }

}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBE
{
  return self->_txCompletionSnapshotBE;
}

- (void)setTxCompletionSnapshotBE:(id)a3
{
  objc_storeStrong((id *)&self->_txCompletionSnapshotBE, a3);
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBK
{
  return self->_txCompletionSnapshotBK;
}

- (void)setTxCompletionSnapshotBK:(id)a3
{
  objc_storeStrong((id *)&self->_txCompletionSnapshotBK, a3);
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVO
{
  return self->_txCompletionSnapshotVO;
}

- (void)setTxCompletionSnapshotVO:(id)a3
{
  objc_storeStrong((id *)&self->_txCompletionSnapshotVO, a3);
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVI
{
  return self->_txCompletionSnapshotVI;
}

- (void)setTxCompletionSnapshotVI:(id)a3
{
  objc_storeStrong((id *)&self->_txCompletionSnapshotVI, a3);
}

- (WiFiAnalyticsAWDWiFiDPSBTSnapshot)btSnapshot
{
  return self->_btSnapshot;
}

- (void)setBtSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_btSnapshot, a3);
}

- (WiFiAnalyticsAWDWiFiDPSAWDLSnapshot)awdlSnapshot
{
  return self->_awdlSnapshot;
}

- (void)setAwdlSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_awdlSnapshot, a3);
}

- (WiFiAnalyticsAWDWiFiUsageSnapshot)rc1Snapshot
{
  return self->_rc1Snapshot;
}

- (void)setRc1Snapshot:(id)a3
{
  objc_storeStrong((id *)&self->_rc1Snapshot, a3);
}

- (WiFiAnalyticsAWDWiFiUsageSnapshot)rc2Snapshot
{
  return self->_rc2Snapshot;
}

- (void)setRc2Snapshot:(id)a3
{
  objc_storeStrong((id *)&self->_rc2Snapshot, a3);
}

- (WiFiAnalyticsAWDWiFiUsageSnapshot)lteSnapshot
{
  return self->_lteSnapshot;
}

- (void)setLteSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_lteSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txCompletionSnapshotVO, 0);
  objc_storeStrong((id *)&self->_txCompletionSnapshotVI, 0);
  objc_storeStrong((id *)&self->_txCompletionSnapshotBK, 0);
  objc_storeStrong((id *)&self->_txCompletionSnapshotBE, 0);
  objc_storeStrong((id *)&self->_rc2Snapshot, 0);
  objc_storeStrong((id *)&self->_rc1Snapshot, 0);
  objc_storeStrong((id *)&self->_lteSnapshot, 0);
  objc_storeStrong((id *)&self->_btSnapshot, 0);
  objc_storeStrong((id *)&self->_awdlSnapshot, 0);
}

@end
