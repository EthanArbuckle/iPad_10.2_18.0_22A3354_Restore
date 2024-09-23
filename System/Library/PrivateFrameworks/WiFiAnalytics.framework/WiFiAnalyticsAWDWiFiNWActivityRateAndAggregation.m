@implementation WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation;
  -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation dealloc](&v3, sel_dealloc);
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rxVHTSuccess = &self->_rxVHTSuccess;
  count = self->_rxVHTSuccess.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_txVHTSuccess = &self->_txVHTSuccess;
  count = self->_txVHTSuccess.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rxMCSSuccess = &self->_rxMCSSuccess;
  count = self->_rxMCSSuccess.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_txMCSSuccess = &self->_txMCSSuccess;
  count = self->_txMCSSuccess.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ampduAGGs = &self->_ampduAGGs;
  count = self->_ampduAGGs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ampduAGGs->list[a3];
}

- (void)setAmpduAGGs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)rxHESuccessCount
{
  return self->_rxHESuccess.count;
}

- (unint64_t)rxHESuccess
{
  return self->_rxHESuccess.list;
}

- (void)clearRxHESuccess
{
  PBRepeatedUInt64Clear();
}

- (void)addRxHESuccess:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxHESuccessAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxHESuccess;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rxHESuccess = &self->_rxHESuccess;
  count = self->_rxHESuccess.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_rxHESuccess->list[a3];
}

- (void)setRxHESuccess:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txHESuccessCount
{
  return self->_txHESuccess.count;
}

- (unint64_t)txHESuccess
{
  return self->_txHESuccess.list;
}

- (void)clearTxHESuccess
{
  PBRepeatedUInt64Clear();
}

- (void)addTxHESuccess:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txHESuccessAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txHESuccess;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_txHESuccess = &self->_txHESuccess;
  count = self->_txHESuccess.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_txHESuccess->list[a3];
}

- (void)setTxHESuccess:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)rxampduSUsCount
{
  return self->_rxampduSUs.count;
}

- (unint64_t)rxampduSUs
{
  return self->_rxampduSUs.list;
}

- (void)clearRxampduSUs
{
  PBRepeatedUInt64Clear();
}

- (void)addRxampduSU:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxampduSUAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxampduSUs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rxampduSUs = &self->_rxampduSUs;
  count = self->_rxampduSUs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_rxampduSUs->list[a3];
}

- (void)setRxampduSUs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txampduSUsCount
{
  return self->_txampduSUs.count;
}

- (unint64_t)txampduSUs
{
  return self->_txampduSUs.list;
}

- (void)clearTxampduSUs
{
  PBRepeatedUInt64Clear();
}

- (void)addTxampduSU:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txampduSUAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txampduSUs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_txampduSUs = &self->_txampduSUs;
  count = self->_txampduSUs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_txampduSUs->list[a3];
}

- (void)setTxampduSUs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)rxampduOFDMAsCount
{
  return self->_rxampduOFDMAs.count;
}

- (unint64_t)rxampduOFDMAs
{
  return self->_rxampduOFDMAs.list;
}

- (void)clearRxampduOFDMAs
{
  PBRepeatedUInt64Clear();
}

- (void)addRxampduOFDMA:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxampduOFDMAAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxampduOFDMAs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rxampduOFDMAs = &self->_rxampduOFDMAs;
  count = self->_rxampduOFDMAs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_rxampduOFDMAs->list[a3];
}

- (void)setRxampduOFDMAs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txampduOFDMAsCount
{
  return self->_txampduOFDMAs.count;
}

- (unint64_t)txampduOFDMAs
{
  return self->_txampduOFDMAs.list;
}

- (void)clearTxampduOFDMAs
{
  PBRepeatedUInt64Clear();
}

- (void)addTxampduOFDMA:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txampduOFDMAAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txampduOFDMAs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_txampduOFDMAs = &self->_txampduOFDMAs;
  count = self->_txampduOFDMAs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_txampduOFDMAs->list[a3];
}

- (void)setTxampduOFDMAs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)rxampduMUMIMOsCount
{
  return self->_rxampduMUMIMOs.count;
}

- (unint64_t)rxampduMUMIMOs
{
  return self->_rxampduMUMIMOs.list;
}

- (void)clearRxampduMUMIMOs
{
  PBRepeatedUInt64Clear();
}

- (void)addRxampduMUMIMO:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rxampduMUMIMOAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rxampduMUMIMOs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rxampduMUMIMOs = &self->_rxampduMUMIMOs;
  count = self->_rxampduMUMIMOs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_rxampduMUMIMOs->list[a3];
}

- (void)setRxampduMUMIMOs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)txampduMUMIMOsCount
{
  return self->_txampduMUMIMOs.count;
}

- (unint64_t)txampduMUMIMOs
{
  return self->_txampduMUMIMOs.list;
}

- (void)clearTxampduMUMIMOs
{
  PBRepeatedUInt64Clear();
}

- (void)addTxampduMUMIMO:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)txampduMUMIMOAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_txampduMUMIMOs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_txampduMUMIMOs = &self->_txampduMUMIMOs;
  count = self->_txampduMUMIMOs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_txampduMUMIMOs->list[a3];
}

- (void)setTxampduMUMIMOs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation;
  -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt64NSArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("rxVHTSuccess"));

  PBRepeatedUInt64NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("txVHTSuccess"));

  PBRepeatedUInt64NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("rxMCSSuccess"));

  PBRepeatedUInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("txMCSSuccess"));

  PBRepeatedUInt64NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("ampduAGG"));

  PBRepeatedUInt64NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("rxHESuccess"));

  PBRepeatedUInt64NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("txHESuccess"));

  PBRepeatedUInt64NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("rxampduSU"));

  PBRepeatedUInt64NSArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("txampduSU"));

  PBRepeatedUInt64NSArray();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("rxampduOFDMA"));

  PBRepeatedUInt64NSArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("txampduOFDMA"));

  PBRepeatedUInt64NSArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v14, CFSTR("rxampduMUMIMO"));

  PBRepeatedUInt64NSArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("txampduMUMIMO"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityRateAndAggregationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  $D9041E0417540B7714261C3B5E8BB314 *p_txampduMUMIMOs;
  unint64_t v18;
  id v19;

  v4 = a3;
  v19 = v4;
  if (self->_rxVHTSuccess.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v5;
    }
    while (v5 < self->_rxVHTSuccess.count);
  }
  if (self->_txVHTSuccess.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
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
      v4 = v19;
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
      v4 = v19;
      ++v8;
    }
    while (v8 < self->_txMCSSuccess.count);
  }
  if (self->_ampduAGGs.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v9;
    }
    while (v9 < self->_ampduAGGs.count);
  }
  if (self->_rxHESuccess.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v10;
    }
    while (v10 < self->_rxHESuccess.count);
  }
  if (self->_txHESuccess.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v11;
    }
    while (v11 < self->_txHESuccess.count);
  }
  if (self->_rxampduSUs.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v12;
    }
    while (v12 < self->_rxampduSUs.count);
  }
  if (self->_txampduSUs.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v13;
    }
    while (v13 < self->_txampduSUs.count);
  }
  if (self->_rxampduOFDMAs.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v14;
    }
    while (v14 < self->_rxampduOFDMAs.count);
  }
  if (self->_txampduOFDMAs.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v15;
    }
    while (v15 < self->_txampduOFDMAs.count);
  }
  if (self->_rxampduMUMIMOs.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v16;
    }
    while (v16 < self->_rxampduMUMIMOs.count);
  }
  p_txampduMUMIMOs = &self->_txampduMUMIMOs;
  if (p_txampduMUMIMOs->count)
  {
    v18 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v19;
      ++v18;
    }
    while (v18 < p_txampduMUMIMOs->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  unint64_t v13;
  unint64_t v14;
  uint64_t m;
  unint64_t v16;
  unint64_t v17;
  uint64_t n;
  unint64_t v19;
  unint64_t v20;
  uint64_t ii;
  unint64_t v22;
  unint64_t v23;
  uint64_t jj;
  unint64_t v25;
  unint64_t v26;
  uint64_t kk;
  unint64_t v28;
  unint64_t v29;
  uint64_t mm;
  unint64_t v31;
  unint64_t v32;
  uint64_t nn;
  unint64_t v34;
  unint64_t v35;
  uint64_t i1;
  unint64_t v37;
  unint64_t v38;
  uint64_t i2;
  unint64_t v40;
  unint64_t v41;
  uint64_t i3;
  id v43;

  v43 = a3;
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxVHTSuccessCount](self, "rxVHTSuccessCount"))
  {
    objc_msgSend(v43, "clearRxVHTSuccess");
    v4 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxVHTSuccessCount](self, "rxVHTSuccessCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v43, "addRxVHTSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxVHTSuccessAtIndex:](self, "rxVHTSuccessAtIndex:", i));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txVHTSuccessCount](self, "txVHTSuccessCount"))
  {
    objc_msgSend(v43, "clearTxVHTSuccess");
    v7 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txVHTSuccessCount](self, "txVHTSuccessCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v43, "addTxVHTSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txVHTSuccessAtIndex:](self, "txVHTSuccessAtIndex:", j));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxMCSSuccessCount](self, "rxMCSSuccessCount"))
  {
    objc_msgSend(v43, "clearRxMCSSuccess");
    v10 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxMCSSuccessCount](self, "rxMCSSuccessCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v43, "addRxMCSSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxMCSSuccessAtIndex:](self, "rxMCSSuccessAtIndex:", k));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txMCSSuccessCount](self, "txMCSSuccessCount"))
  {
    objc_msgSend(v43, "clearTxMCSSuccess");
    v13 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txMCSSuccessCount](self, "txMCSSuccessCount");
    if (v13)
    {
      v14 = v13;
      for (m = 0; m != v14; ++m)
        objc_msgSend(v43, "addTxMCSSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txMCSSuccessAtIndex:](self, "txMCSSuccessAtIndex:", m));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation ampduAGGsCount](self, "ampduAGGsCount"))
  {
    objc_msgSend(v43, "clearAmpduAGGs");
    v16 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation ampduAGGsCount](self, "ampduAGGsCount");
    if (v16)
    {
      v17 = v16;
      for (n = 0; n != v17; ++n)
        objc_msgSend(v43, "addAmpduAGG:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation ampduAGGAtIndex:](self, "ampduAGGAtIndex:", n));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxHESuccessCount](self, "rxHESuccessCount"))
  {
    objc_msgSend(v43, "clearRxHESuccess");
    v19 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxHESuccessCount](self, "rxHESuccessCount");
    if (v19)
    {
      v20 = v19;
      for (ii = 0; ii != v20; ++ii)
        objc_msgSend(v43, "addRxHESuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxHESuccessAtIndex:](self, "rxHESuccessAtIndex:", ii));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txHESuccessCount](self, "txHESuccessCount"))
  {
    objc_msgSend(v43, "clearTxHESuccess");
    v22 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txHESuccessCount](self, "txHESuccessCount");
    if (v22)
    {
      v23 = v22;
      for (jj = 0; jj != v23; ++jj)
        objc_msgSend(v43, "addTxHESuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txHESuccessAtIndex:](self, "txHESuccessAtIndex:", jj));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduSUsCount](self, "rxampduSUsCount"))
  {
    objc_msgSend(v43, "clearRxampduSUs");
    v25 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduSUsCount](self, "rxampduSUsCount");
    if (v25)
    {
      v26 = v25;
      for (kk = 0; kk != v26; ++kk)
        objc_msgSend(v43, "addRxampduSU:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduSUAtIndex:](self, "rxampduSUAtIndex:", kk));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduSUsCount](self, "txampduSUsCount"))
  {
    objc_msgSend(v43, "clearTxampduSUs");
    v28 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduSUsCount](self, "txampduSUsCount");
    if (v28)
    {
      v29 = v28;
      for (mm = 0; mm != v29; ++mm)
        objc_msgSend(v43, "addTxampduSU:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduSUAtIndex:](self, "txampduSUAtIndex:", mm));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduOFDMAsCount](self, "rxampduOFDMAsCount"))
  {
    objc_msgSend(v43, "clearRxampduOFDMAs");
    v31 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduOFDMAsCount](self, "rxampduOFDMAsCount");
    if (v31)
    {
      v32 = v31;
      for (nn = 0; nn != v32; ++nn)
        objc_msgSend(v43, "addRxampduOFDMA:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduOFDMAAtIndex:](self, "rxampduOFDMAAtIndex:", nn));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduOFDMAsCount](self, "txampduOFDMAsCount"))
  {
    objc_msgSend(v43, "clearTxampduOFDMAs");
    v34 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduOFDMAsCount](self, "txampduOFDMAsCount");
    if (v34)
    {
      v35 = v34;
      for (i1 = 0; i1 != v35; ++i1)
        objc_msgSend(v43, "addTxampduOFDMA:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduOFDMAAtIndex:](self, "txampduOFDMAAtIndex:", i1));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduMUMIMOsCount](self, "rxampduMUMIMOsCount"))
  {
    objc_msgSend(v43, "clearRxampduMUMIMOs");
    v37 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduMUMIMOsCount](self, "rxampduMUMIMOsCount");
    if (v37)
    {
      v38 = v37;
      for (i2 = 0; i2 != v38; ++i2)
        objc_msgSend(v43, "addRxampduMUMIMO:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduMUMIMOAtIndex:](self, "rxampduMUMIMOAtIndex:", i2));
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduMUMIMOsCount](self, "txampduMUMIMOsCount"))
  {
    objc_msgSend(v43, "clearTxampduMUMIMOs");
    v40 = -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduMUMIMOsCount](self, "txampduMUMIMOsCount");
    if (v40)
    {
      v41 = v40;
      for (i3 = 0; i3 != v41; ++i3)
        objc_msgSend(v43, "addTxampduMUMIMO:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduMUMIMOAtIndex:](self, "txampduMUMIMOAtIndex:", i3));
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
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class())
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual())
  {
    IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = PBRepeatedUInt64Hash();
  v3 = PBRepeatedUInt64Hash() ^ v2;
  v4 = PBRepeatedUInt64Hash();
  v5 = v3 ^ v4 ^ PBRepeatedUInt64Hash();
  v6 = PBRepeatedUInt64Hash();
  v7 = v6 ^ PBRepeatedUInt64Hash();
  v8 = v5 ^ v7 ^ PBRepeatedUInt64Hash();
  v9 = PBRepeatedUInt64Hash();
  v10 = v9 ^ PBRepeatedUInt64Hash();
  v11 = v10 ^ PBRepeatedUInt64Hash();
  v12 = v8 ^ v11 ^ PBRepeatedUInt64Hash();
  v13 = PBRepeatedUInt64Hash();
  return v12 ^ v13 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  uint64_t v13;
  uint64_t v14;
  uint64_t m;
  uint64_t v16;
  uint64_t v17;
  uint64_t n;
  uint64_t v19;
  uint64_t v20;
  uint64_t ii;
  uint64_t v22;
  uint64_t v23;
  uint64_t jj;
  uint64_t v25;
  uint64_t v26;
  uint64_t kk;
  uint64_t v28;
  uint64_t v29;
  uint64_t mm;
  uint64_t v31;
  uint64_t v32;
  uint64_t nn;
  uint64_t v34;
  uint64_t v35;
  uint64_t i1;
  uint64_t v37;
  uint64_t v38;
  uint64_t i2;
  uint64_t v40;
  uint64_t v41;
  uint64_t i3;
  id v43;

  v43 = a3;
  v4 = objc_msgSend(v43, "rxVHTSuccessCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxVHTSuccess:](self, "addRxVHTSuccess:", objc_msgSend(v43, "rxVHTSuccessAtIndex:", i));
  }
  v7 = objc_msgSend(v43, "txVHTSuccessCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxVHTSuccess:](self, "addTxVHTSuccess:", objc_msgSend(v43, "txVHTSuccessAtIndex:", j));
  }
  v10 = objc_msgSend(v43, "rxMCSSuccessCount");
  if (v10)
  {
    v11 = v10;
    for (k = 0; k != v11; ++k)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxMCSSuccess:](self, "addRxMCSSuccess:", objc_msgSend(v43, "rxMCSSuccessAtIndex:", k));
  }
  v13 = objc_msgSend(v43, "txMCSSuccessCount");
  if (v13)
  {
    v14 = v13;
    for (m = 0; m != v14; ++m)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxMCSSuccess:](self, "addTxMCSSuccess:", objc_msgSend(v43, "txMCSSuccessAtIndex:", m));
  }
  v16 = objc_msgSend(v43, "ampduAGGsCount");
  if (v16)
  {
    v17 = v16;
    for (n = 0; n != v17; ++n)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addAmpduAGG:](self, "addAmpduAGG:", objc_msgSend(v43, "ampduAGGAtIndex:", n));
  }
  v19 = objc_msgSend(v43, "rxHESuccessCount");
  if (v19)
  {
    v20 = v19;
    for (ii = 0; ii != v20; ++ii)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxHESuccess:](self, "addRxHESuccess:", objc_msgSend(v43, "rxHESuccessAtIndex:", ii));
  }
  v22 = objc_msgSend(v43, "txHESuccessCount");
  if (v22)
  {
    v23 = v22;
    for (jj = 0; jj != v23; ++jj)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxHESuccess:](self, "addTxHESuccess:", objc_msgSend(v43, "txHESuccessAtIndex:", jj));
  }
  v25 = objc_msgSend(v43, "rxampduSUsCount");
  if (v25)
  {
    v26 = v25;
    for (kk = 0; kk != v26; ++kk)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxampduSU:](self, "addRxampduSU:", objc_msgSend(v43, "rxampduSUAtIndex:", kk));
  }
  v28 = objc_msgSend(v43, "txampduSUsCount");
  if (v28)
  {
    v29 = v28;
    for (mm = 0; mm != v29; ++mm)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxampduSU:](self, "addTxampduSU:", objc_msgSend(v43, "txampduSUAtIndex:", mm));
  }
  v31 = objc_msgSend(v43, "rxampduOFDMAsCount");
  if (v31)
  {
    v32 = v31;
    for (nn = 0; nn != v32; ++nn)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxampduOFDMA:](self, "addRxampduOFDMA:", objc_msgSend(v43, "rxampduOFDMAAtIndex:", nn));
  }
  v34 = objc_msgSend(v43, "txampduOFDMAsCount");
  if (v34)
  {
    v35 = v34;
    for (i1 = 0; i1 != v35; ++i1)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxampduOFDMA:](self, "addTxampduOFDMA:", objc_msgSend(v43, "txampduOFDMAAtIndex:", i1));
  }
  v37 = objc_msgSend(v43, "rxampduMUMIMOsCount");
  if (v37)
  {
    v38 = v37;
    for (i2 = 0; i2 != v38; ++i2)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxampduMUMIMO:](self, "addRxampduMUMIMO:", objc_msgSend(v43, "rxampduMUMIMOAtIndex:", i2));
  }
  v40 = objc_msgSend(v43, "txampduMUMIMOsCount");
  if (v40)
  {
    v41 = v40;
    for (i3 = 0; i3 != v41; ++i3)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxampduMUMIMO:](self, "addTxampduMUMIMO:", objc_msgSend(v43, "txampduMUMIMOAtIndex:", i3));
  }

}

@end
