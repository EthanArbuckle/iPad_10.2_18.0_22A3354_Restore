@implementation WPDataTransfer

- (id)initDataTransferForPeer:(id)a3
{
  id v5;
  WPDataTransfer *v6;
  uint64_t v7;
  NSMutableData *currentReceivedData;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPDataTransfer;
  v6 = -[WPDataTransfer init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v7 = objc_claimAutoreleasedReturnValue();
    currentReceivedData = v6->_currentReceivedData;
    v6->_currentReceivedData = (NSMutableData *)v7;

    v6->_receivedFirstPacket = 0;
    objc_storeStrong((id *)&v6->_peerUUID, a3);
  }

  return v6;
}

- (void)resetTransfer
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDataTransfer setCurrentReceivedData:](self, "setCurrentReceivedData:", v3);

  -[WPDataTransfer setReceivedFirstPacket:](self, "setReceivedFirstPacket:", 0);
}

- (BOOL)addNewData:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v28;
  unsigned __int16 v29;
  uint8_t buf[4];
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[WPDataTransfer receivedFirstPacket](self, "receivedFirstPacket");
    v6 = objc_msgSend(v4, "length");
    if (v5)
    {
      if (v6 > -[WPDataTransfer currentDataSize](self, "currentDataSize"))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_8);
        v7 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDataTransfer addNewData:].cold.2(v7, self);
LABEL_18:
        v11 = 0;
        goto LABEL_35;
      }
      v11 = v4;
    }
    else
    {
      if (v6 <= 1)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_2);
        v10 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDataTransfer addNewData:].cold.3(v10);
        goto LABEL_18;
      }
      v29 = 0;
      objc_msgSend(v4, "getBytes:length:", &v29, 2);
      -[WPDataTransfer setCurrentDataSize:](self, "setCurrentDataSize:", v29);
      objc_msgSend(v4, "subdataWithRange:", 2, objc_msgSend(v4, "length") - 2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[WPDataTransfer currentDataSize](self, "currentDataSize");
      kdebug_trace();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_4);
      v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v13 = v29;
        v14 = v12;
        v15 = objc_msgSend(v11, "length");
        -[WPDataTransfer peerUUID](self, "peerUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = v13;
        *(_WORD *)&v31[4] = 2048;
        *(_QWORD *)&v31[6] = v15;
        *(_WORD *)&v31[14] = 2114;
        *(_QWORD *)&v31[16] = v16;
        _os_log_impl(&dword_209E41000, v14, OS_LOG_TYPE_INFO, "BEGIN receiving data of total length %d, first packet length %ld from peer %{public}@", buf, 0x1Cu);

      }
      v17 = objc_msgSend(v11, "length");
      if (v17 > -[WPDataTransfer currentDataSize](self, "currentDataSize"))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_6);
        v18 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDataTransfer addNewData:].cold.4(&v29, v18);
        goto LABEL_35;
      }
      -[WPDataTransfer setReceivedFirstPacket:](self, "setReceivedFirstPacket:", 1);
    }
    -[WPDataTransfer currentReceivedData](self, "currentReceivedData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendData:", v11);

    -[WPDataTransfer setCurrentDataSize:](self, "setCurrentDataSize:", (unsigned __int16)(-[WPDataTransfer currentDataSize](self, "currentDataSize") - objc_msgSend(v11, "length")));
    -[WPDataTransfer currentReceivedData](self, "currentReceivedData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "length");
    -[WPDataTransfer currentDataSize](self, "currentDataSize");
    kdebug_trace();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_10);
    v21 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      -[WPDataTransfer currentReceivedData](self, "currentReceivedData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");
      -[WPDataTransfer peerUUID](self, "peerUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[WPDataTransfer currentDataSize](self, "currentDataSize");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v31 = v24;
      *(_WORD *)&v31[8] = 2114;
      *(_QWORD *)&v31[10] = v25;
      *(_WORD *)&v31[18] = 1024;
      *(_DWORD *)&v31[20] = v26;
      _os_log_impl(&dword_209E41000, v22, OS_LOG_TYPE_INFO, "Length of data received %ld from peer %{public}@, length of data remaining to receive: %d", buf, 0x1Cu);

    }
    if (!-[WPDataTransfer currentDataSize](self, "currentDataSize"))
    {
      -[WPDataTransfer currentReceivedData](self, "currentReceivedData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v28, "length") != 0;

      goto LABEL_36;
    }
LABEL_35:
    v9 = 0;
LABEL_36:

    goto LABEL_37;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_1);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDataTransfer addNewData:].cold.1(v8);
  v9 = 0;
LABEL_37:

  return v9;
}

- (NSMutableData)currentReceivedData
{
  return self->_currentReceivedData;
}

- (void)setCurrentReceivedData:(id)a3
{
  objc_storeStrong((id *)&self->_currentReceivedData, a3);
}

- (unsigned)currentDataSize
{
  return self->_currentDataSize;
}

- (void)setCurrentDataSize:(unsigned __int16)a3
{
  self->_currentDataSize = a3;
}

- (BOOL)receivedFirstPacket
{
  return self->_receivedFirstPacket;
}

- (void)setReceivedFirstPacket:(BOOL)a3
{
  self->_receivedFirstPacket = a3;
}

- (NSUUID)peerUUID
{
  return self->_peerUUID;
}

- (void)setPeerUUID:(id)a3
{
  objc_storeStrong((id *)&self->_peerUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerUUID, 0);
  objc_storeStrong((id *)&self->_currentReceivedData, 0);
}

- (void)addNewData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "Received a data value of size 0", v1, 2u);
}

- (void)addNewData:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v5[0] = 67109376;
  v5[1] = objc_msgSend(a2, "currentDataSize");
  v6 = 2048;
  v7 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_209E41000, v3, v4, "Data size expected: %d, but received: %lu", (uint8_t *)v5);

  OUTLINED_FUNCTION_0_1();
}

- (void)addNewData:(void *)a1 .cold.3(void *a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = 134217984;
  v3 = OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209E41000, v1, OS_LOG_TYPE_ERROR, "Received data length is too small: %ld, Min length required: 2", (uint8_t *)&v2, 0xCu);

}

- (void)addNewData:(unsigned __int16 *)a1 .cold.4(unsigned __int16 *a1, void *a2)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  v5[0] = 67109376;
  v5[1] = v2;
  v6 = 2048;
  v7 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_209E41000, v3, v4, "FIRST Packet - Data size expected: %d, but received: %lu", (uint8_t *)v5);

  OUTLINED_FUNCTION_0_1();
}

@end
