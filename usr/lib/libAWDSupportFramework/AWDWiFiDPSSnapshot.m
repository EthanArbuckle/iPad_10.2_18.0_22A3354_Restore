@implementation AWDWiFiDPSSnapshot

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiDPSSnapshot setTxCompletionSnapshotBE:](self, "setTxCompletionSnapshotBE:", 0);
  -[AWDWiFiDPSSnapshot setTxCompletionSnapshotBK:](self, "setTxCompletionSnapshotBK:", 0);
  -[AWDWiFiDPSSnapshot setTxCompletionSnapshotVO:](self, "setTxCompletionSnapshotVO:", 0);
  -[AWDWiFiDPSSnapshot setTxCompletionSnapshotVI:](self, "setTxCompletionSnapshotVI:", 0);
  -[AWDWiFiDPSSnapshot setBtSnapshot:](self, "setBtSnapshot:", 0);
  -[AWDWiFiDPSSnapshot setAwdlSnapshot:](self, "setAwdlSnapshot:", 0);
  -[AWDWiFiDPSSnapshot setRc1Snapshot:](self, "setRc1Snapshot:", 0);
  -[AWDWiFiDPSSnapshot setRc2Snapshot:](self, "setRc2Snapshot:", 0);
  -[AWDWiFiDPSSnapshot setLteSnapshot:](self, "setLteSnapshot:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSSnapshot;
  -[AWDWiFiDPSSnapshot dealloc](&v3, sel_dealloc);
}

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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSSnapshot;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiDPSSnapshot description](&v3, sel_description), -[AWDWiFiDPSSnapshot dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBE;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBK;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVO;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVI;
  AWDWiFiDPSBTSnapshot *btSnapshot;
  AWDWiFiDPSAWDLSnapshot *awdlSnapshot;
  AWDWiFiUsageSnapshot *rc1Snapshot;
  AWDWiFiUsageSnapshot *rc2Snapshot;
  AWDWiFiUsageSnapshot *lteSnapshot;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  if (txCompletionSnapshotBE)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotBE, "dictionaryRepresentation"), CFSTR("txCompletionSnapshotBE"));
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  if (txCompletionSnapshotBK)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotBK, "dictionaryRepresentation"), CFSTR("txCompletionSnapshotBK"));
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  if (txCompletionSnapshotVO)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotVO, "dictionaryRepresentation"), CFSTR("txCompletionSnapshotVO"));
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  if (txCompletionSnapshotVI)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotVI, "dictionaryRepresentation"), CFSTR("txCompletionSnapshotVI"));
  btSnapshot = self->_btSnapshot;
  if (btSnapshot)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSBTSnapshot dictionaryRepresentation](btSnapshot, "dictionaryRepresentation"), CFSTR("btSnapshot"));
  awdlSnapshot = self->_awdlSnapshot;
  if (awdlSnapshot)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSAWDLSnapshot dictionaryRepresentation](awdlSnapshot, "dictionaryRepresentation"), CFSTR("awdlSnapshot"));
  rc1Snapshot = self->_rc1Snapshot;
  if (rc1Snapshot)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiUsageSnapshot dictionaryRepresentation](rc1Snapshot, "dictionaryRepresentation"), CFSTR("rc1Snapshot"));
  rc2Snapshot = self->_rc2Snapshot;
  if (rc2Snapshot)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiUsageSnapshot dictionaryRepresentation](rc2Snapshot, "dictionaryRepresentation"), CFSTR("rc2Snapshot"));
  lteSnapshot = self->_lteSnapshot;
  if (lteSnapshot)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiUsageSnapshot dictionaryRepresentation](lteSnapshot, "dictionaryRepresentation"), CFSTR("lteSnapshot"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSSnapshotReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_txCompletionSnapshotBE)
    PBDataWriterWriteSubmessage();
  if (self->_txCompletionSnapshotBK)
    PBDataWriterWriteSubmessage();
  if (self->_txCompletionSnapshotVO)
    PBDataWriterWriteSubmessage();
  if (self->_txCompletionSnapshotVI)
    PBDataWriterWriteSubmessage();
  if (self->_btSnapshot)
    PBDataWriterWriteSubmessage();
  if (self->_awdlSnapshot)
    PBDataWriterWriteSubmessage();
  if (self->_rc1Snapshot)
    PBDataWriterWriteSubmessage();
  if (self->_rc2Snapshot)
    PBDataWriterWriteSubmessage();
  if (self->_lteSnapshot)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  if (self->_txCompletionSnapshotBE)
    objc_msgSend(a3, "setTxCompletionSnapshotBE:");
  if (self->_txCompletionSnapshotBK)
    objc_msgSend(a3, "setTxCompletionSnapshotBK:");
  if (self->_txCompletionSnapshotVO)
    objc_msgSend(a3, "setTxCompletionSnapshotVO:");
  if (self->_txCompletionSnapshotVI)
    objc_msgSend(a3, "setTxCompletionSnapshotVI:");
  if (self->_btSnapshot)
    objc_msgSend(a3, "setBtSnapshot:");
  if (self->_awdlSnapshot)
    objc_msgSend(a3, "setAwdlSnapshot:");
  if (self->_rc1Snapshot)
    objc_msgSend(a3, "setRc1Snapshot:");
  if (self->_rc2Snapshot)
    objc_msgSend(a3, "setRc2Snapshot:");
  if (self->_lteSnapshot)
    objc_msgSend(a3, "setLteSnapshot:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[6] = -[AWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotBE, "copyWithZone:", a3);
  v5[7] = -[AWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotBK, "copyWithZone:", a3);

  v5[9] = -[AWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotVO, "copyWithZone:", a3);
  v5[8] = -[AWDWiFiDPSPerACTxCompletionSnapshot copyWithZone:](self->_txCompletionSnapshotVI, "copyWithZone:", a3);

  v5[2] = -[AWDWiFiDPSBTSnapshot copyWithZone:](self->_btSnapshot, "copyWithZone:", a3);
  v5[1] = -[AWDWiFiDPSAWDLSnapshot copyWithZone:](self->_awdlSnapshot, "copyWithZone:", a3);

  v5[4] = -[AWDWiFiUsageSnapshot copyWithZone:](self->_rc1Snapshot, "copyWithZone:", a3);
  v5[5] = -[AWDWiFiUsageSnapshot copyWithZone:](self->_rc2Snapshot, "copyWithZone:", a3);

  v5[3] = -[AWDWiFiUsageSnapshot copyWithZone:](self->_lteSnapshot, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBE;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBK;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVO;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVI;
  AWDWiFiDPSBTSnapshot *btSnapshot;
  AWDWiFiDPSAWDLSnapshot *awdlSnapshot;
  AWDWiFiUsageSnapshot *rc1Snapshot;
  AWDWiFiUsageSnapshot *rc2Snapshot;
  AWDWiFiUsageSnapshot *lteSnapshot;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
    if (!((unint64_t)txCompletionSnapshotBE | *((_QWORD *)a3 + 6))
      || (v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBE, "isEqual:")) != 0)
    {
      txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
      if (!((unint64_t)txCompletionSnapshotBK | *((_QWORD *)a3 + 7))
        || (v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBK, "isEqual:")) != 0)
      {
        txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
        if (!((unint64_t)txCompletionSnapshotVO | *((_QWORD *)a3 + 9))
          || (v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVO, "isEqual:")) != 0)
        {
          txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
          if (!((unint64_t)txCompletionSnapshotVI | *((_QWORD *)a3 + 8))
            || (v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVI, "isEqual:")) != 0)
          {
            btSnapshot = self->_btSnapshot;
            if (!((unint64_t)btSnapshot | *((_QWORD *)a3 + 2))
              || (v5 = -[AWDWiFiDPSBTSnapshot isEqual:](btSnapshot, "isEqual:")) != 0)
            {
              awdlSnapshot = self->_awdlSnapshot;
              if (!((unint64_t)awdlSnapshot | *((_QWORD *)a3 + 1))
                || (v5 = -[AWDWiFiDPSAWDLSnapshot isEqual:](awdlSnapshot, "isEqual:")) != 0)
              {
                rc1Snapshot = self->_rc1Snapshot;
                if (!((unint64_t)rc1Snapshot | *((_QWORD *)a3 + 4))
                  || (v5 = -[AWDWiFiUsageSnapshot isEqual:](rc1Snapshot, "isEqual:")) != 0)
                {
                  rc2Snapshot = self->_rc2Snapshot;
                  if (!((unint64_t)rc2Snapshot | *((_QWORD *)a3 + 5))
                    || (v5 = -[AWDWiFiUsageSnapshot isEqual:](rc2Snapshot, "isEqual:")) != 0)
                  {
                    lteSnapshot = self->_lteSnapshot;
                    if ((unint64_t)lteSnapshot | *((_QWORD *)a3 + 3))
                      LOBYTE(v5) = -[AWDWiFiUsageSnapshot isEqual:](lteSnapshot, "isEqual:");
                    else
                      LOBYTE(v5) = 1;
                  }
                }
              }
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[AWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotBE, "hash");
  v4 = -[AWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotBK, "hash") ^ v3;
  v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotVO, "hash");
  v6 = v4 ^ v5 ^ -[AWDWiFiDPSPerACTxCompletionSnapshot hash](self->_txCompletionSnapshotVI, "hash");
  v7 = -[AWDWiFiDPSBTSnapshot hash](self->_btSnapshot, "hash");
  v8 = v7 ^ -[AWDWiFiDPSAWDLSnapshot hash](self->_awdlSnapshot, "hash");
  v9 = v6 ^ v8 ^ -[AWDWiFiUsageSnapshot hash](self->_rc1Snapshot, "hash");
  v10 = -[AWDWiFiUsageSnapshot hash](self->_rc2Snapshot, "hash");
  return v9 ^ v10 ^ -[AWDWiFiUsageSnapshot hash](self->_lteSnapshot, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBE;
  uint64_t v6;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotBK;
  uint64_t v8;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVO;
  uint64_t v10;
  AWDWiFiDPSPerACTxCompletionSnapshot *txCompletionSnapshotVI;
  uint64_t v12;
  AWDWiFiDPSBTSnapshot *btSnapshot;
  uint64_t v14;
  AWDWiFiDPSAWDLSnapshot *awdlSnapshot;
  uint64_t v16;
  AWDWiFiUsageSnapshot *rc1Snapshot;
  uint64_t v18;
  AWDWiFiUsageSnapshot *rc2Snapshot;
  uint64_t v20;
  AWDWiFiUsageSnapshot *lteSnapshot;
  uint64_t v22;

  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  v6 = *((_QWORD *)a3 + 6);
  if (txCompletionSnapshotBE)
  {
    if (v6)
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBE, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotBE:](self, "setTxCompletionSnapshotBE:");
  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  v8 = *((_QWORD *)a3 + 7);
  if (txCompletionSnapshotBK)
  {
    if (v8)
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBK, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotBK:](self, "setTxCompletionSnapshotBK:");
  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  v10 = *((_QWORD *)a3 + 9);
  if (txCompletionSnapshotVO)
  {
    if (v10)
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVO, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotVO:](self, "setTxCompletionSnapshotVO:");
  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  v12 = *((_QWORD *)a3 + 8);
  if (txCompletionSnapshotVI)
  {
    if (v12)
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVI, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotVI:](self, "setTxCompletionSnapshotVI:");
  }
  btSnapshot = self->_btSnapshot;
  v14 = *((_QWORD *)a3 + 2);
  if (btSnapshot)
  {
    if (v14)
      -[AWDWiFiDPSBTSnapshot mergeFrom:](btSnapshot, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDWiFiDPSSnapshot setBtSnapshot:](self, "setBtSnapshot:");
  }
  awdlSnapshot = self->_awdlSnapshot;
  v16 = *((_QWORD *)a3 + 1);
  if (awdlSnapshot)
  {
    if (v16)
      -[AWDWiFiDPSAWDLSnapshot mergeFrom:](awdlSnapshot, "mergeFrom:");
  }
  else if (v16)
  {
    -[AWDWiFiDPSSnapshot setAwdlSnapshot:](self, "setAwdlSnapshot:");
  }
  rc1Snapshot = self->_rc1Snapshot;
  v18 = *((_QWORD *)a3 + 4);
  if (rc1Snapshot)
  {
    if (v18)
      -[AWDWiFiUsageSnapshot mergeFrom:](rc1Snapshot, "mergeFrom:");
  }
  else if (v18)
  {
    -[AWDWiFiDPSSnapshot setRc1Snapshot:](self, "setRc1Snapshot:");
  }
  rc2Snapshot = self->_rc2Snapshot;
  v20 = *((_QWORD *)a3 + 5);
  if (rc2Snapshot)
  {
    if (v20)
      -[AWDWiFiUsageSnapshot mergeFrom:](rc2Snapshot, "mergeFrom:");
  }
  else if (v20)
  {
    -[AWDWiFiDPSSnapshot setRc2Snapshot:](self, "setRc2Snapshot:");
  }
  lteSnapshot = self->_lteSnapshot;
  v22 = *((_QWORD *)a3 + 3);
  if (lteSnapshot)
  {
    if (v22)
      -[AWDWiFiUsageSnapshot mergeFrom:](lteSnapshot, "mergeFrom:");
  }
  else if (v22)
  {
    -[AWDWiFiDPSSnapshot setLteSnapshot:](self, "setLteSnapshot:");
  }
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBE
{
  return self->_txCompletionSnapshotBE;
}

- (void)setTxCompletionSnapshotBE:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBK
{
  return self->_txCompletionSnapshotBK;
}

- (void)setTxCompletionSnapshotBK:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVO
{
  return self->_txCompletionSnapshotVO;
}

- (void)setTxCompletionSnapshotVO:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVI
{
  return self->_txCompletionSnapshotVI;
}

- (void)setTxCompletionSnapshotVI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDWiFiDPSBTSnapshot)btSnapshot
{
  return self->_btSnapshot;
}

- (void)setBtSnapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AWDWiFiDPSAWDLSnapshot)awdlSnapshot
{
  return self->_awdlSnapshot;
}

- (void)setAwdlSnapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AWDWiFiUsageSnapshot)rc1Snapshot
{
  return self->_rc1Snapshot;
}

- (void)setRc1Snapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AWDWiFiUsageSnapshot)rc2Snapshot
{
  return self->_rc2Snapshot;
}

- (void)setRc2Snapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDWiFiUsageSnapshot)lteSnapshot
{
  return self->_lteSnapshot;
}

- (void)setLteSnapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
