@implementation WPDObjectDiscoveryData

+ (id)objectDiscoveryReportFromAdvReport:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  char *v54;
  char v55;
  void *v56;
  id v57;
  _BYTE *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[8];
  _QWORD v89[8];
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  int v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCEC8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceDataSaturated"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = v12 - 4;
  if (v12 == 6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_17);
    v14 = WiProxLog;
    v84 = v4;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = 0;
LABEL_13:
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_98);
    v31 = v13 + ~v22;
    v32 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218752;
      v91 = v13;
      v92 = 1024;
      v93 = 1;
      v94 = 2048;
      v95 = v22;
      v96 = 2048;
      v97 = v13 + ~v22;
      _os_log_debug_impl(&dword_2175D1000, v32, OS_LOG_TYPE_DEBUG, "ObjectDiscovery length payload:%ld state:%d data:%ld optional:%ld", buf, 0x26u);
    }
    objc_msgSend(v11, "subdataWithRange:", 4, v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v11;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_100_1);
    v34 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.3((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);
    v41 = objc_retainAutorelease(v33);
    v42 = (char *)objc_msgSend(v41, "bytes");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", *v42);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 >= 1)
    {
      v44 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v41, "subdataWithRange:", 1, v22);
      v45 = v9;
      v46 = v6;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "dataWithData:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v6 = v46;
      v9 = v45;
      v43 = (void *)v48;
    }
    v49 = v22 | 1;
    v50 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v41, "subdataWithRange:", v49, v31, v82);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dataWithData:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_retainAutorelease(v52);
    v54 = (char *)objc_msgSend(v53, "mutableBytes");
    v55 = *v54;
    *v54 &= 0xFCu;
    v56 = v9;
    v57 = objc_retainAutorelease(v9);
    v58 = (_BYTE *)objc_msgSend(v57, "mutableBytes");
    *v58 = *v58 & 0x3F | (v55 << 6);
    v88[0] = CFSTR("kSPDeviceAddress");
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v59;
    v89[1] = v6;
    v60 = v6;
    v88[1] = CFSTR("kSPScanDate");
    v88[2] = CFSTR("kSPrssi");
    v89[2] = v87;
    v89[3] = v43;
    v88[3] = CFSTR("kSPAdvertisementData");
    v88[4] = CFSTR("kSPStatus");
    v89[4] = v85;
    v88[5] = CFSTR("kSPOptional");
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v53);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v61;
    v63 = &unk_24D7D7F08;
    if (v10)
      v63 = v10;
    v89[5] = v61;
    v89[6] = v63;
    v88[6] = CFSTR("kSPChannel");
    v88[7] = CFSTR("kSPSaturated");
    v64 = v86;
    if (!v86)
      v64 = (void *)MEMORY[0x24BDBD1C0];
    v89[7] = v64;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 8);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_106_1);
    v66 = WiProxLog;
    v6 = v60;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.2((uint64_t)v65, v66, v67, v68, v69, v70, v71, v72);
    v9 = v56;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_108);
    v73 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.1((uint64_t)v3, v73, v74, v75, v76, v77, v78, v79);

    v4 = v84;
    v11 = v83;
    goto LABEL_41;
  }
  if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 0x1C)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_94_0);
    v23 = WiProxLog;
    v84 = v4;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.5(v23, v24, v25, v26, v27, v28, v29, v30);
    v22 = 22;
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_96);
  v80 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.6(v80);
  v65 = 0;
LABEL_41:

  return v65;
}

+ (unsigned)applyMaskToAddress:(id)a3
{
  unsigned __int8 *v3;
  unsigned int v4;
  NSObject *v5;

  v3 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a3), "mutableBytes");
  v4 = *v3;
  *v3 = v4 | 0xC0;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_109_2);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    +[WPDObjectDiscoveryData applyMaskToAddress:].cold.1(v3, v5);
  return v4 >> 6;
}

+ (id)addressFromNearbyToken:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WPDObjectDiscoveryData applyMaskToAddress:](WPDObjectDiscoveryData, "applyMaskToAddress:", v3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)addressesFromNearbyTokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x219A0EE8C]();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__WPDObjectDiscoveryData_addressesFromNearbyTokens___block_invoke;
    v9[3] = &unk_24D7C8F98;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __52__WPDObjectDiscoveryData_addressesFromNearbyTokens___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  +[WPDObjectDiscoveryData addressFromNearbyToken:](WPDObjectDiscoveryData, "addressFromNearbyToken:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

- (WPDObjectDiscoveryData)init
{
  WPDObjectDiscoveryData *v2;
  uint64_t v3;
  NSMutableData *address;
  uint64_t v5;
  NSMutableData *payload;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WPDObjectDiscoveryData;
  v2 = -[WPDObjectDiscoveryData init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 6);
    v3 = objc_claimAutoreleasedReturnValue();
    address = v2->_address;
    v2->_address = (NSMutableData *)v3;

    -[NSMutableData resetBytesInRange:](v2->_address, "resetBytesInRange:", 0, -[NSMutableData length](v2->_address, "length"));
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 25);
    v5 = objc_claimAutoreleasedReturnValue();
    payload = v2->_payload;
    v2->_payload = (NSMutableData *)v5;

    -[NSMutableData resetBytesInRange:](v2->_payload, "resetBytesInRange:", 0, -[NSMutableData length](v2->_payload, "length"));
    v2->_length = 0;
  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("length: %d address: %@ payload: %@ "), self->_length, self->_address, self->_payload);
}

- (void)wipeout
{
  self->_length = 0;
  -[NSMutableData resetBytesInRange:](self->_address, "resetBytesInRange:", 0, -[NSMutableData length](self->_address, "length"));
  -[NSMutableData resetBytesInRange:](self->_payload, "resetBytesInRange:", 0, -[NSMutableData length](self->_payload, "length"));
}

- (id)updateWithKey:(id)a3 Status:(unsigned __int8)a4 Reserved:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  unsigned __int8 *v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "length");
  v11 = v10 - 6;
  if ((unint64_t)(v10 - 6) >= 0x17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bad ObjectDiscovery key of length %lu"), objc_msgSend(v8, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35[0] = v12;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = (void **)v35;
    v16 = &v34;
LABEL_6:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v17 = v10;
  if (v9 && (unint64_t)objc_msgSend(v9, "length") >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bad ObjectDiscovery reserved bytes length %lu"), objc_msgSend(v9, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    v33 = v12;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = &v33;
    v16 = &v32;
    goto LABEL_6;
  }
  -[WPDObjectDiscoveryData address](self, "address");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_retainAutorelease(v8);
  objc_msgSend(v20, "replaceBytesInRange:withBytes:", 0, 6, objc_msgSend(v21, "bytes"));

  -[WPDObjectDiscoveryData address](self, "address");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[WPDObjectDiscoveryData applyMaskToAddress:](WPDObjectDiscoveryData, "applyMaskToAddress:", v22);

  -[WPDObjectDiscoveryData payload](self, "payload");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDObjectDiscoveryData payload](self, "payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resetBytesInRange:", 0, objc_msgSend(v25, "length"));

  if (v11)
  {
    -[WPDObjectDiscoveryData payload](self, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "replaceBytesInRange:withBytes:", 1, v11, objc_msgSend(objc_retainAutorelease(v21), "bytes") + 6);

  }
  -[WPDObjectDiscoveryData payload](self, "payload");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = (unsigned __int8 *)objc_msgSend(v27, "mutableBytes");

  *v28 = a4;
  if (v9 && objc_msgSend(v9, "length"))
  {
    -[WPDObjectDiscoveryData payload](self, "payload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "replaceBytesInRange:withBytes:", v11, objc_msgSend(v9, "length"), objc_msgSend(objc_retainAutorelease(v9), "bytes"));

  }
  v28[v17 - 5] = v28[v17 - 5] & 0xFC | v23;
  if (v11)
    v30 = v17 - 3;
  else
    v30 = 2;
  -[WPDObjectDiscoveryData setLength:](self, "setLength:", v30);
  v19 = 0;
LABEL_16:

  return v19;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (NSMutableData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSMutableData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "ObjectDiscovery report ScanManager source: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "ObjectDiscovery report: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "ObjectDiscovery payload:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, a1, a3, "ObjectDiscovery found NearOwner payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, a1, a3, "ObjectDiscovery found Wild payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)objectDiscoveryReportFromAdvReport:(os_log_t)log .cold.6(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "ObjectDiscovery found unexpected payload", v1, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)applyMaskToAddress:(_BYTE *)a1 .cold.1(_BYTE *a1, NSObject *a2)
{
  _BOOL4 v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = (*a1 & 0xC0) != 128;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "ObjectDiscovery address is valid: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_3();
}

@end
