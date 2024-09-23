@implementation WPDAdvertisingData

- (WPDAdvertisingData)init
{
  WPDAdvertisingData *v2;
  uint64_t v3;
  NSMutableData *internalData;
  uint64_t v5;
  NSMutableSet *types;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WPDAdvertisingData;
  v2 = -[WPDAdvertisingData init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 28);
    v3 = objc_claimAutoreleasedReturnValue();
    internalData = v2->_internalData;
    v2->_internalData = (NSMutableData *)v3;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    types = v2->_types;
    v2->_types = (NSMutableSet *)v5;

    v2->_advertRate = 0x4000;
    v2->_assertPower = 0;
    *(_WORD *)&v2->_enableEPAForAdvertisement = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  double v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingData internalData](self, "internalData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WPDAdvertisingData advertRate](self, "advertRate");
  v6 = (double)-[WPDAdvertisingData advertRate](self, "advertRate") * 0.625;
  v7 = "no";
  if (-[WPDAdvertisingData isRanging](self, "isRanging"))
    v8 = "yes";
  else
    v8 = "no";
  if (-[WPDAdvertisingData assertPower](self, "assertPower"))
    v7 = "yes";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("data %@ rate %ld (%.2f ms) ranging %s assert power %s EPA:%d"), v4, v5, *(_QWORD *)&v6, v8, v7, -[WPDAdvertisingData isEnableEPAForAdvertisement](self, "isEnableEPAForAdvertisement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addAdvertisingRequest:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int64_t v21;
  _BOOL4 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "clientType");
  v24 = v5;
  objc_msgSend(v4, "advertisingData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "advertisingRate");
  v8 = objc_msgSend(v4, "enableEPAForAdvertising");

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_7);
  v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v26 = v5;
    v27 = 2114;
    v28 = (int64_t)v6;
    v29 = 2048;
    v30 = v7;
    v31 = 1024;
    v32 = v8;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "Adding data of type: %ld, advData: %{public}@ advInterval: %ld EPA:%d", buf, 0x26u);
  }
  v23 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v23 + 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendBytes:length:", &v24, 1);
  objc_msgSend(v10, "appendBytes:length:", &v23, 1);
  objc_msgSend(v10, "appendData:", v6);
  if (v24 < 0xFu)
  {
    v12 = (void *)MEMORY[0x24BDBCE50];
    -[WPDAdvertisingData internalData](self, "internalData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataWithData:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDAdvertisingData internalData](self, "internalData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setData:", v10);

    -[WPDAdvertisingData internalData](self, "internalData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v11);

  }
  else
  {
    -[WPDAdvertisingData internalData](self, "internalData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", v10);
  }

  -[WPDAdvertisingData types](self, "types");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  if (v7 < -[WPDAdvertisingData advertRate](self, "advertRate"))
    -[WPDAdvertisingData setAdvertRate:](self, "setAdvertRate:", v7);
  -[WPDAdvertisingData setEnableEPAForAdvertisement:](self, "setEnableEPAForAdvertisement:", v8 | -[WPDAdvertisingData enableEPAForAdvertisement](self, "enableEPAForAdvertisement"));
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_85_1);
  v18 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    -[WPDAdvertisingData internalData](self, "internalData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WPDAdvertisingData advertRate](self, "advertRate");
    v22 = -[WPDAdvertisingData isEnableEPAForAdvertisement](self, "isEnableEPAForAdvertisement");
    *(_DWORD *)buf = 138543874;
    v26 = (unint64_t)v20;
    v27 = 2048;
    v28 = v21;
    v29 = 1024;
    LODWORD(v30) = v22;
    _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "Current advertisement packet: %{public}@ advertRate: %ld EPA:%d", buf, 0x1Cu);

  }
}

- (NSData)getData
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  -[WPDAdvertisingData internalData](self, "internalData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 >= 0x1D)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Invalid Data Length"), CFSTR("Data length %ld is invalid"), v4);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &advertisingHeader, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:", v6);

  -[WPDAdvertisingData internalData](self, "internalData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v7);

  v8 = objc_msgSend(v5, "length");
  v11 = v8;
  if (v8 < 5)
  {
    v9 = 0;
  }
  else
  {
    v11 = v8 - 1;
    objc_msgSend(v5, "replaceBytesInRange:withBytes:", 0, 1, &v11);
    v9 = v5;
  }

  return (NSData *)v9;
}

- (BOOL)isEqualToData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "internalData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDAdvertisingData internalData](self, "internalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToData:", v6)
    || (v7 = objc_msgSend(v4, "advertRate"), v7 != -[WPDAdvertisingData advertRate](self, "advertRate")))
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "isRanging");
  v9 = -[WPDAdvertisingData isRanging](self, "isRanging");

  if (v8 != v9)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 1;
LABEL_7:

  return v10;
}

- (BOOL)isValidWithAdditionalRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[WPDAdvertisingData internalData](self, "internalData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v4, "advertisingData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6 + objc_msgSend(v7, "length") + 6;
  return v8 < 0x1D;
}

- (BOOL)isEnableEPAForAdvertisement
{
  return self->_enableEPAForAdvertisement;
}

- (int64_t)advertRate
{
  return self->_advertRate;
}

- (void)setAdvertRate:(int64_t)a3
{
  self->_advertRate = a3;
}

- (NSMutableSet)types
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)enableEPAForAdvertisement
{
  return self->_enableEPAForAdvertisement;
}

- (void)setEnableEPAForAdvertisement:(BOOL)a3
{
  self->_enableEPAForAdvertisement = a3;
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (BOOL)assertPower
{
  return self->_assertPower;
}

- (void)setAssertPower:(BOOL)a3
{
  self->_assertPower = a3;
}

- (NSMutableData)internalData
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalData, 0);
  objc_storeStrong((id *)&self->_types, 0);
}

@end
