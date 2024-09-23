@implementation AWDWiFiMetricRssiHistory

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricRssiHistory;
  -[AWDWiFiMetricRssiHistory dealloc](&v3, sel_dealloc);
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

- (unint64_t)rssiHistorysCount
{
  return self->_rssiHistorys.count;
}

- (int)rssiHistorys
{
  return self->_rssiHistorys.list;
}

- (void)clearRssiHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addRssiHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)rssiHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_rssiHistorys;
  unint64_t count;

  p_rssiHistorys = &self->_rssiHistorys;
  count = self->_rssiHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rssiHistorys->list[a3];
}

- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)txPerHistorysCount
{
  return self->_txPerHistorys.count;
}

- (int)txPerHistorys
{
  return self->_txPerHistorys.list;
}

- (void)clearTxPerHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addTxPerHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)txPerHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_txPerHistorys;
  unint64_t count;

  p_txPerHistorys = &self->_txPerHistorys;
  count = self->_txPerHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txPerHistorys->list[a3];
}

- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)txFrmsHistorysCount
{
  return self->_txFrmsHistorys.count;
}

- (int)txFrmsHistorys
{
  return self->_txFrmsHistorys.list;
}

- (void)clearTxFrmsHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addTxFrmsHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)txFrmsHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_txFrmsHistorys;
  unint64_t count;

  p_txFrmsHistorys = &self->_txFrmsHistorys;
  count = self->_txFrmsHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txFrmsHistorys->list[a3];
}

- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)fwTxPerHistorysCount
{
  return self->_fwTxPerHistorys.count;
}

- (int)fwTxPerHistorys
{
  return self->_fwTxPerHistorys.list;
}

- (void)clearFwTxPerHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addFwTxPerHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)fwTxPerHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_fwTxPerHistorys;
  unint64_t count;

  p_fwTxPerHistorys = &self->_fwTxPerHistorys;
  count = self->_fwTxPerHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_fwTxPerHistorys->list[a3];
}

- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)fwTxFrmsHistorysCount
{
  return self->_fwTxFrmsHistorys.count;
}

- (int)fwTxFrmsHistorys
{
  return self->_fwTxFrmsHistorys.list;
}

- (void)clearFwTxFrmsHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addFwTxFrmsHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)fwTxFrmsHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_fwTxFrmsHistorys;
  unint64_t count;

  p_fwTxFrmsHistorys = &self->_fwTxFrmsHistorys;
  count = self->_fwTxFrmsHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_fwTxFrmsHistorys->list[a3];
}

- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)bcnPerHistorysCount
{
  return self->_bcnPerHistorys.count;
}

- (int)bcnPerHistorys
{
  return self->_bcnPerHistorys.list;
}

- (void)clearBcnPerHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addBcnPerHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)bcnPerHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_bcnPerHistorys;
  unint64_t count;

  p_bcnPerHistorys = &self->_bcnPerHistorys;
  count = self->_bcnPerHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_bcnPerHistorys->list[a3];
}

- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)bcnFrmsHistorysCount
{
  return self->_bcnFrmsHistorys.count;
}

- (int)bcnFrmsHistorys
{
  return self->_bcnFrmsHistorys.list;
}

- (void)clearBcnFrmsHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addBcnFrmsHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)bcnFrmsHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_bcnFrmsHistorys;
  unint64_t count;

  p_bcnFrmsHistorys = &self->_bcnFrmsHistorys;
  count = self->_bcnFrmsHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_bcnFrmsHistorys->list[a3];
}

- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setGatewayARPHistory:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_gatewayARPHistory = a3;
}

- (void)setHasGatewayARPHistory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGatewayARPHistory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricRssiHistory;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricRssiHistory description](&v3, sel_description), -[AWDWiFiMetricRssiHistory dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("rssiHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("txPerHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("txFrmsHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("fwTxPerHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("fwTxFrmsHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("bcnPerHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("bcnFrmsHistory"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gatewayARPHistory), CFSTR("gatewayARPHistory"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricRssiHistoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_rssiHistorys.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_rssiHistorys.count);
  }
  if (self->_txPerHistorys.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_txPerHistorys.count);
  }
  if (self->_txFrmsHistorys.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_txFrmsHistorys.count);
  }
  if (self->_fwTxPerHistorys.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_fwTxPerHistorys.count);
  }
  if (self->_fwTxFrmsHistorys.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_fwTxFrmsHistorys.count);
  }
  if (self->_bcnPerHistorys.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_bcnPerHistorys.count);
  }
  if (self->_bcnFrmsHistorys.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_bcnFrmsHistorys.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
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
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  unint64_t v23;
  unint64_t v24;
  uint64_t jj;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 22) = self->_timestamp;
    *((_BYTE *)a3 + 188) |= 1u;
  }
  if (-[AWDWiFiMetricRssiHistory rssiHistorysCount](self, "rssiHistorysCount"))
  {
    objc_msgSend(a3, "clearRssiHistorys");
    v5 = -[AWDWiFiMetricRssiHistory rssiHistorysCount](self, "rssiHistorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRssiHistory:", -[AWDWiFiMetricRssiHistory rssiHistoryAtIndex:](self, "rssiHistoryAtIndex:", i));
    }
  }
  if (-[AWDWiFiMetricRssiHistory txPerHistorysCount](self, "txPerHistorysCount"))
  {
    objc_msgSend(a3, "clearTxPerHistorys");
    v8 = -[AWDWiFiMetricRssiHistory txPerHistorysCount](self, "txPerHistorysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addTxPerHistory:", -[AWDWiFiMetricRssiHistory txPerHistoryAtIndex:](self, "txPerHistoryAtIndex:", j));
    }
  }
  if (-[AWDWiFiMetricRssiHistory txFrmsHistorysCount](self, "txFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearTxFrmsHistorys");
    v11 = -[AWDWiFiMetricRssiHistory txFrmsHistorysCount](self, "txFrmsHistorysCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addTxFrmsHistory:", -[AWDWiFiMetricRssiHistory txFrmsHistoryAtIndex:](self, "txFrmsHistoryAtIndex:", k));
    }
  }
  if (-[AWDWiFiMetricRssiHistory fwTxPerHistorysCount](self, "fwTxPerHistorysCount"))
  {
    objc_msgSend(a3, "clearFwTxPerHistorys");
    v14 = -[AWDWiFiMetricRssiHistory fwTxPerHistorysCount](self, "fwTxPerHistorysCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addFwTxPerHistory:", -[AWDWiFiMetricRssiHistory fwTxPerHistoryAtIndex:](self, "fwTxPerHistoryAtIndex:", m));
    }
  }
  if (-[AWDWiFiMetricRssiHistory fwTxFrmsHistorysCount](self, "fwTxFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearFwTxFrmsHistorys");
    v17 = -[AWDWiFiMetricRssiHistory fwTxFrmsHistorysCount](self, "fwTxFrmsHistorysCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addFwTxFrmsHistory:", -[AWDWiFiMetricRssiHistory fwTxFrmsHistoryAtIndex:](self, "fwTxFrmsHistoryAtIndex:", n));
    }
  }
  if (-[AWDWiFiMetricRssiHistory bcnPerHistorysCount](self, "bcnPerHistorysCount"))
  {
    objc_msgSend(a3, "clearBcnPerHistorys");
    v20 = -[AWDWiFiMetricRssiHistory bcnPerHistorysCount](self, "bcnPerHistorysCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(a3, "addBcnPerHistory:", -[AWDWiFiMetricRssiHistory bcnPerHistoryAtIndex:](self, "bcnPerHistoryAtIndex:", ii));
    }
  }
  if (-[AWDWiFiMetricRssiHistory bcnFrmsHistorysCount](self, "bcnFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearBcnFrmsHistorys");
    v23 = -[AWDWiFiMetricRssiHistory bcnFrmsHistorysCount](self, "bcnFrmsHistorysCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
        objc_msgSend(a3, "addBcnFrmsHistory:", -[AWDWiFiMetricRssiHistory bcnFrmsHistoryAtIndex:](self, "bcnFrmsHistoryAtIndex:", jj));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 46) = self->_gatewayARPHistory;
    *((_BYTE *)a3 + 188) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 176) = self->_timestamp;
    *(_BYTE *)(v4 + 188) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_gatewayARPHistory;
    *(_BYTE *)(v5 + 188) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 188) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 22))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 188) & 1) != 0)
    {
LABEL_18:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        IsEqual = PBRepeatedInt32IsEqual();
        if (IsEqual)
        {
          IsEqual = PBRepeatedInt32IsEqual();
          if (IsEqual)
          {
            IsEqual = PBRepeatedInt32IsEqual();
            if (IsEqual)
            {
              IsEqual = PBRepeatedInt32IsEqual();
              if (IsEqual)
              {
                IsEqual = PBRepeatedInt32IsEqual();
                if (IsEqual)
                {
                  LOBYTE(IsEqual) = (*((_BYTE *)a3 + 188) & 2) == 0;
                  if ((*(_BYTE *)&self->_has & 2) != 0)
                  {
                    if ((*((_BYTE *)a3 + 188) & 2) == 0 || self->_gatewayARPHistory != *((_DWORD *)a3 + 46))
                      goto LABEL_18;
                    LOBYTE(IsEqual) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  v5 = PBRepeatedInt32Hash();
  v6 = PBRepeatedInt32Hash();
  v7 = PBRepeatedInt32Hash();
  v8 = PBRepeatedInt32Hash();
  v9 = PBRepeatedInt32Hash();
  v10 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_gatewayARPHistory;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  uint64_t v20;
  uint64_t v21;
  uint64_t ii;
  uint64_t v23;
  uint64_t v24;
  uint64_t jj;

  if ((*((_BYTE *)a3 + 188) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 22);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "rssiHistorysCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetricRssiHistory addRssiHistory:](self, "addRssiHistory:", objc_msgSend(a3, "rssiHistoryAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "txPerHistorysCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWiFiMetricRssiHistory addTxPerHistory:](self, "addTxPerHistory:", objc_msgSend(a3, "txPerHistoryAtIndex:", j));
  }
  v11 = objc_msgSend(a3, "txFrmsHistorysCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[AWDWiFiMetricRssiHistory addTxFrmsHistory:](self, "addTxFrmsHistory:", objc_msgSend(a3, "txFrmsHistoryAtIndex:", k));
  }
  v14 = objc_msgSend(a3, "fwTxPerHistorysCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[AWDWiFiMetricRssiHistory addFwTxPerHistory:](self, "addFwTxPerHistory:", objc_msgSend(a3, "fwTxPerHistoryAtIndex:", m));
  }
  v17 = objc_msgSend(a3, "fwTxFrmsHistorysCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[AWDWiFiMetricRssiHistory addFwTxFrmsHistory:](self, "addFwTxFrmsHistory:", objc_msgSend(a3, "fwTxFrmsHistoryAtIndex:", n));
  }
  v20 = objc_msgSend(a3, "bcnPerHistorysCount");
  if (v20)
  {
    v21 = v20;
    for (ii = 0; ii != v21; ++ii)
      -[AWDWiFiMetricRssiHistory addBcnPerHistory:](self, "addBcnPerHistory:", objc_msgSend(a3, "bcnPerHistoryAtIndex:", ii));
  }
  v23 = objc_msgSend(a3, "bcnFrmsHistorysCount");
  if (v23)
  {
    v24 = v23;
    for (jj = 0; jj != v24; ++jj)
      -[AWDWiFiMetricRssiHistory addBcnFrmsHistory:](self, "addBcnFrmsHistory:", objc_msgSend(a3, "bcnFrmsHistoryAtIndex:", jj));
  }
  if ((*((_BYTE *)a3 + 188) & 2) != 0)
  {
    self->_gatewayARPHistory = *((_DWORD *)a3 + 46);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)gatewayARPHistory
{
  return self->_gatewayARPHistory;
}

@end
