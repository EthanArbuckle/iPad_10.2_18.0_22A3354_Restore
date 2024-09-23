@implementation PipeDataTransfer

- (id)initPipeDataTransferForPeer:(id)a3
{
  id v5;
  PipeDataTransfer *v6;
  PipeDataTransfer *v7;
  uint64_t v8;
  NSMutableData *rxCurrentReceivedData;
  uint64_t v10;
  NSMutableData *rxTotalDataWithLen;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PipeDataTransfer;
  v6 = -[PipeDataTransfer init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peerUUID, a3);
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v8 = objc_claimAutoreleasedReturnValue();
    rxCurrentReceivedData = v7->_rxCurrentReceivedData;
    v7->_rxCurrentReceivedData = (NSMutableData *)v8;

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v10 = objc_claimAutoreleasedReturnValue();
    rxTotalDataWithLen = v7->_rxTotalDataWithLen;
    v7->_rxTotalDataWithLen = (NSMutableData *)v10;

  }
  return v7;
}

- (void)resetAllTransfer
{
  NSUUID *peerUUID;

  peerUUID = self->_peerUUID;
  self->_peerUUID = 0;

  -[PipeDataTransfer setTxSeqNum:](self, "setTxSeqNum:", 0);
  -[PipeDataTransfer resetRxTransfer](self, "resetRxTransfer");
  -[PipeDataTransfer resetTxTransfer](self, "resetTxTransfer");
}

- (void)resetTxTransfer
{
  -[PipeDataTransfer setTxTotalLenToSend:](self, "setTxTotalLenToSend:", 0);
  -[PipeDataTransfer setTxTotalDataToSend:](self, "setTxTotalDataToSend:", 0);
  -[PipeDataTransfer setTxData:](self, "setTxData:", 0);
  -[PipeDataTransfer setTxDataLeftToSend:](self, "setTxDataLeftToSend:", 0);
}

- (void)resetRxTransfer
{
  void *v3;
  void *v4;

  -[PipeDataTransfer setRxSeqNum:](self, "setRxSeqNum:", 0);
  -[PipeDataTransfer setRxFirstPacket:](self, "setRxFirstPacket:", 0);
  -[PipeDataTransfer setRxTotalLenToReceive:](self, "setRxTotalLenToReceive:", 0);
  -[PipeDataTransfer setRxTotalDataToReceive:](self, "setRxTotalDataToReceive:", 0);
  -[PipeDataTransfer setRxData:](self, "setRxData:", 0);
  -[PipeDataTransfer setRxCurrentDataSize:](self, "setRxCurrentDataSize:", 0);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PipeDataTransfer setRxCurrentReceivedData:](self, "setRxCurrentReceivedData:", v3);

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PipeDataTransfer setRxTotalDataWithLen:](self, "setRxTotalDataWithLen:", v4);

  -[PipeDataTransfer setRxWaitForMoreData:](self, "setRxWaitForMoreData:", 0);
}

- (unsigned)generateSequenceNumber
{
  uint64_t v3;
  PipeDataTransfer *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  if (-[PipeDataTransfer txSeqNum](self, "txSeqNum") == 255)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_16);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "WPPM: Reset sequence number", v8, 2u);
    }
    v4 = self;
    v3 = 1;
  }
  else
  {
    v3 = (-[PipeDataTransfer txSeqNum](self, "txSeqNum") + 1);
    v4 = self;
  }
  -[PipeDataTransfer setTxSeqNum:](v4, "setTxSeqNum:", v3);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_95_0);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[PipeDataTransfer generateSequenceNumber].cold.1(v6);
  return -[PipeDataTransfer txSeqNum](self, "txSeqNum");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PipeDataTransfer: receivedFirstPacket %d, rxTLen %d, rxLen %lu, rxSeq %d txTLen %d txLen %lu txSeq %d peer %@"), self->_rxFirstPacket, self->_rxTotalLenToReceive, -[NSData length](self->_rxTotalDataToReceive, "length"), self->_rxSeqNum, self->_txTotalLenToSend, -[NSData length](self->_txTotalDataToSend, "length"), self->_txSeqNum, self->_peerUUID);
}

- (NSUUID)peerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)txSeqNum
{
  return self->_txSeqNum;
}

- (void)setTxSeqNum:(unsigned __int8)a3
{
  self->_txSeqNum = a3;
}

- (unsigned)txTotalLenToSend
{
  return self->_txTotalLenToSend;
}

- (void)setTxTotalLenToSend:(unsigned __int16)a3
{
  self->_txTotalLenToSend = a3;
}

- (NSData)txTotalDataToSend
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTxTotalDataToSend:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)txData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTxData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)txDataLeftToSend
{
  return self->_txDataLeftToSend;
}

- (void)setTxDataLeftToSend:(unint64_t)a3
{
  self->_txDataLeftToSend = a3;
}

- (unsigned)rxSeqNum
{
  return self->_rxSeqNum;
}

- (void)setRxSeqNum:(unsigned __int8)a3
{
  self->_rxSeqNum = a3;
}

- (BOOL)rxFirstPacket
{
  return self->_rxFirstPacket;
}

- (void)setRxFirstPacket:(BOOL)a3
{
  self->_rxFirstPacket = a3;
}

- (unsigned)rxTotalLenToReceive
{
  return self->_rxTotalLenToReceive;
}

- (void)setRxTotalLenToReceive:(unsigned __int16)a3
{
  self->_rxTotalLenToReceive = a3;
}

- (NSData)rxTotalDataToReceive
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRxTotalDataToReceive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)rxData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRxData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unsigned)rxCurrentDataSize
{
  return self->_rxCurrentDataSize;
}

- (void)setRxCurrentDataSize:(unsigned __int16)a3
{
  self->_rxCurrentDataSize = a3;
}

- (NSMutableData)rxCurrentReceivedData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRxCurrentReceivedData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableData)rxTotalDataWithLen
{
  return (NSMutableData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRxTotalDataWithLen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)rxWaitForMoreData
{
  return self->_rxWaitForMoreData;
}

- (void)setRxWaitForMoreData:(BOOL)a3
{
  self->_rxWaitForMoreData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxTotalDataWithLen, 0);
  objc_storeStrong((id *)&self->_rxCurrentReceivedData, 0);
  objc_storeStrong((id *)&self->_rxData, 0);
  objc_storeStrong((id *)&self->_rxTotalDataToReceive, 0);
  objc_storeStrong((id *)&self->_txData, 0);
  objc_storeStrong((id *)&self->_txTotalDataToSend, 0);
  objc_storeStrong((id *)&self->_peerUUID, 0);
}

- (void)generateSequenceNumber
{
  NSObject *v1;
  id v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3[0] = 67109120;
  v3[1] = objc_msgSend((id)OUTLINED_FUNCTION_21(), "txSeqNum");
  _os_log_debug_impl(&dword_2175D1000, v1, OS_LOG_TYPE_DEBUG, "WPPM: tx Seq num %d", (uint8_t *)v3, 8u);

  OUTLINED_FUNCTION_0();
}

@end
