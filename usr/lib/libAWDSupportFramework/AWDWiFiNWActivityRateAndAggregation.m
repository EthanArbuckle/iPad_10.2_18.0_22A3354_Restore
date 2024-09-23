@implementation AWDWiFiNWActivityRateAndAggregation

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityRateAndAggregation;
  -[AWDWiFiNWActivityRateAndAggregation dealloc](&v3, sel_dealloc);
}

- (unint64_t)rxVHTSuccessCount
{
  return self->_rxVHTSuccess.count;
}

- (unint64_t)rxVHTSuccess
{
  return self->_rxVHTSuccess.list;
}

- (void)clearRxVHTSuccess
{
  PBRepeatedUInt64Clear();
}

- (void)addRxVHTSuccess:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxVHTSuccessAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxVHTSuccess;
  unint64_t count;

  p_rxVHTSuccess = &self->_rxVHTSuccess;
  count = self->_rxVHTSuccess.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rxVHTSuccess->list[a3];
}

- (void)setRxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txVHTSuccessCount
{
  return self->_txVHTSuccess.count;
}

- (unint64_t)txVHTSuccess
{
  return self->_txVHTSuccess.list;
}

- (void)clearTxVHTSuccess
{
  PBRepeatedUInt64Clear();
}

- (void)addTxVHTSuccess:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txVHTSuccessAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txVHTSuccess;
  unint64_t count;

  p_txVHTSuccess = &self->_txVHTSuccess;
  count = self->_txVHTSuccess.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txVHTSuccess->list[a3];
}

- (void)setTxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)rxMCSSuccessCount
{
  return self->_rxMCSSuccess.count;
}

- (unint64_t)rxMCSSuccess
{
  return self->_rxMCSSuccess.list;
}

- (void)clearRxMCSSuccess
{
  PBRepeatedUInt64Clear();
}

- (void)addRxMCSSuccess:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxMCSSuccessAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxMCSSuccess;
  unint64_t count;

  p_rxMCSSuccess = &self->_rxMCSSuccess;
  count = self->_rxMCSSuccess.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rxMCSSuccess->list[a3];
}

- (void)setRxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txMCSSuccessCount
{
  return self->_txMCSSuccess.count;
}

- (unint64_t)txMCSSuccess
{
  return self->_txMCSSuccess.list;
}

- (void)clearTxMCSSuccess
{
  PBRepeatedUInt64Clear();
}

- (void)addTxMCSSuccess:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txMCSSuccessAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txMCSSuccess;
  unint64_t count;

  p_txMCSSuccess = &self->_txMCSSuccess;
  count = self->_txMCSSuccess.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txMCSSuccess->list[a3];
}

- (void)setTxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)ampduAGGsCount
{
  return self->_ampduAGGs.count;
}

- (unint64_t)ampduAGGs
{
  return self->_ampduAGGs.list;
}

- (void)clearAmpduAGGs
{
  PBRepeatedUInt64Clear();
}

- (void)addAmpduAGG:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)ampduAGGAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_ampduAGGs;
  unint64_t count;

  p_ampduAGGs = &self->_ampduAGGs;
  count = self->_ampduAGGs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_ampduAGGs->list[a3];
}

- (void)setAmpduAGGs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityRateAndAggregation;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityRateAndAggregation description](&v3, sel_description), -[AWDWiFiNWActivityRateAndAggregation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v2, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("rxVHTSuccess"));
  objc_msgSend(v2, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("txVHTSuccess"));
  objc_msgSend(v2, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("rxMCSSuccess"));
  objc_msgSend(v2, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("txMCSSuccess"));
  objc_msgSend(v2, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("ampduAGG"));
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityRateAndAggregationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxVHTSuccess;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $D9041E0417540B7714261C3B5E8BB314 *p_ampduAGGs;
  unint64_t v10;

  p_rxVHTSuccess = &self->_rxVHTSuccess;
  if (self->_rxVHTSuccess.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v5;
    }
    while (v5 < p_rxVHTSuccess->count);
  }
  if (self->_txVHTSuccess.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_txVHTSuccess.count);
  }
  if (self->_rxMCSSuccess.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v7;
    }
    while (v7 < self->_rxMCSSuccess.count);
  }
  if (self->_txMCSSuccess.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v8;
    }
    while (v8 < self->_txMCSSuccess.count);
  }
  p_ampduAGGs = &self->_ampduAGGs;
  if (p_ampduAGGs->count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v10;
    }
    while (v10 < p_ampduAGGs->count);
  }
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

  if (-[AWDWiFiNWActivityRateAndAggregation rxVHTSuccessCount](self, "rxVHTSuccessCount"))
  {
    objc_msgSend(a3, "clearRxVHTSuccess");
    v5 = -[AWDWiFiNWActivityRateAndAggregation rxVHTSuccessCount](self, "rxVHTSuccessCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRxVHTSuccess:", -[AWDWiFiNWActivityRateAndAggregation rxVHTSuccessAtIndex:](self, "rxVHTSuccessAtIndex:", i));
    }
  }
  if (-[AWDWiFiNWActivityRateAndAggregation txVHTSuccessCount](self, "txVHTSuccessCount"))
  {
    objc_msgSend(a3, "clearTxVHTSuccess");
    v8 = -[AWDWiFiNWActivityRateAndAggregation txVHTSuccessCount](self, "txVHTSuccessCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addTxVHTSuccess:", -[AWDWiFiNWActivityRateAndAggregation txVHTSuccessAtIndex:](self, "txVHTSuccessAtIndex:", j));
    }
  }
  if (-[AWDWiFiNWActivityRateAndAggregation rxMCSSuccessCount](self, "rxMCSSuccessCount"))
  {
    objc_msgSend(a3, "clearRxMCSSuccess");
    v11 = -[AWDWiFiNWActivityRateAndAggregation rxMCSSuccessCount](self, "rxMCSSuccessCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addRxMCSSuccess:", -[AWDWiFiNWActivityRateAndAggregation rxMCSSuccessAtIndex:](self, "rxMCSSuccessAtIndex:", k));
    }
  }
  if (-[AWDWiFiNWActivityRateAndAggregation txMCSSuccessCount](self, "txMCSSuccessCount"))
  {
    objc_msgSend(a3, "clearTxMCSSuccess");
    v14 = -[AWDWiFiNWActivityRateAndAggregation txMCSSuccessCount](self, "txMCSSuccessCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addTxMCSSuccess:", -[AWDWiFiNWActivityRateAndAggregation txMCSSuccessAtIndex:](self, "txMCSSuccessAtIndex:", m));
    }
  }
  if (-[AWDWiFiNWActivityRateAndAggregation ampduAGGsCount](self, "ampduAGGsCount"))
  {
    objc_msgSend(a3, "clearAmpduAGGs");
    v17 = -[AWDWiFiNWActivityRateAndAggregation ampduAGGsCount](self, "ampduAGGsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addAmpduAGG:", -[AWDWiFiNWActivityRateAndAggregation ampduAGGAtIndex:](self, "ampduAGGAtIndex:", n));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class())
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual())
  {
    return PBRepeatedUInt64IsEqual();
  }
  else
  {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = PBRepeatedUInt64Hash();
  v3 = PBRepeatedUInt64Hash() ^ v2;
  v4 = PBRepeatedUInt64Hash();
  v5 = v3 ^ v4 ^ PBRepeatedUInt64Hash();
  return v5 ^ PBRepeatedUInt64Hash();
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

  v5 = objc_msgSend(a3, "rxVHTSuccessCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiNWActivityRateAndAggregation addRxVHTSuccess:](self, "addRxVHTSuccess:", objc_msgSend(a3, "rxVHTSuccessAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "txVHTSuccessCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWiFiNWActivityRateAndAggregation addTxVHTSuccess:](self, "addTxVHTSuccess:", objc_msgSend(a3, "txVHTSuccessAtIndex:", j));
  }
  v11 = objc_msgSend(a3, "rxMCSSuccessCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[AWDWiFiNWActivityRateAndAggregation addRxMCSSuccess:](self, "addRxMCSSuccess:", objc_msgSend(a3, "rxMCSSuccessAtIndex:", k));
  }
  v14 = objc_msgSend(a3, "txMCSSuccessCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[AWDWiFiNWActivityRateAndAggregation addTxMCSSuccess:](self, "addTxMCSSuccess:", objc_msgSend(a3, "txMCSSuccessAtIndex:", m));
  }
  v17 = objc_msgSend(a3, "ampduAGGsCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[AWDWiFiNWActivityRateAndAggregation addAmpduAGG:](self, "addAmpduAGG:", objc_msgSend(a3, "ampduAGGAtIndex:", n));
  }
}

@end
