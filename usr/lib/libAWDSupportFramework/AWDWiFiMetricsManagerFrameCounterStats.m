@implementation AWDWiFiMetricsManagerFrameCounterStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerFrameCounterStats setRxControl:](self, "setRxControl:", 0);
  -[AWDWiFiMetricsManagerFrameCounterStats setTxControl:](self, "setTxControl:", 0);
  -[AWDWiFiMetricsManagerFrameCounterStats setRxData:](self, "setRxData:", 0);
  -[AWDWiFiMetricsManagerFrameCounterStats setTxData:](self, "setTxData:", 0);
  -[AWDWiFiMetricsManagerFrameCounterStats setRxManagement:](self, "setRxManagement:", 0);
  -[AWDWiFiMetricsManagerFrameCounterStats setTxManagement:](self, "setTxManagement:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerFrameCounterStats;
  -[AWDWiFiMetricsManagerFrameCounterStats dealloc](&v3, sel_dealloc);
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

- (BOOL)hasRxControl
{
  return self->_rxControl != 0;
}

- (BOOL)hasTxControl
{
  return self->_txControl != 0;
}

- (BOOL)hasRxData
{
  return self->_rxData != 0;
}

- (BOOL)hasTxData
{
  return self->_txData != 0;
}

- (BOOL)hasRxManagement
{
  return self->_rxManagement != 0;
}

- (BOOL)hasTxManagement
{
  return self->_txManagement != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerFrameCounterStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerFrameCounterStats description](&v3, sel_description), -[AWDWiFiMetricsManagerFrameCounterStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDControlFrames *rxControl;
  AWDControlFrames *txControl;
  AWDDataFrames *rxData;
  AWDDataFrames *txData;
  AWDManagementFrames *rxManagement;
  AWDManagementFrames *txManagement;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  rxControl = self->_rxControl;
  if (rxControl)
    objc_msgSend(v3, "setObject:forKey:", -[AWDControlFrames dictionaryRepresentation](rxControl, "dictionaryRepresentation"), CFSTR("rxControl"));
  txControl = self->_txControl;
  if (txControl)
    objc_msgSend(v3, "setObject:forKey:", -[AWDControlFrames dictionaryRepresentation](txControl, "dictionaryRepresentation"), CFSTR("txControl"));
  rxData = self->_rxData;
  if (rxData)
    objc_msgSend(v3, "setObject:forKey:", -[AWDDataFrames dictionaryRepresentation](rxData, "dictionaryRepresentation"), CFSTR("rxData"));
  txData = self->_txData;
  if (txData)
    objc_msgSend(v3, "setObject:forKey:", -[AWDDataFrames dictionaryRepresentation](txData, "dictionaryRepresentation"), CFSTR("txData"));
  rxManagement = self->_rxManagement;
  if (rxManagement)
    objc_msgSend(v3, "setObject:forKey:", -[AWDManagementFrames dictionaryRepresentation](rxManagement, "dictionaryRepresentation"), CFSTR("rxManagement"));
  txManagement = self->_txManagement;
  if (txManagement)
    objc_msgSend(v3, "setObject:forKey:", -[AWDManagementFrames dictionaryRepresentation](txManagement, "dictionaryRepresentation"), CFSTR("txManagement"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerFrameCounterStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_rxControl)
    PBDataWriterWriteSubmessage();
  if (self->_txControl)
    PBDataWriterWriteSubmessage();
  if (self->_rxData)
    PBDataWriterWriteSubmessage();
  if (self->_txData)
    PBDataWriterWriteSubmessage();
  if (self->_rxManagement)
    PBDataWriterWriteSubmessage();
  if (self->_txManagement)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (self->_rxControl)
    objc_msgSend(a3, "setRxControl:");
  if (self->_txControl)
    objc_msgSend(a3, "setTxControl:");
  if (self->_rxData)
    objc_msgSend(a3, "setRxData:");
  if (self->_txData)
    objc_msgSend(a3, "setTxData:");
  if (self->_rxManagement)
    objc_msgSend(a3, "setRxManagement:");
  if (self->_txManagement)
    objc_msgSend(a3, "setTxManagement:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[AWDControlFrames copyWithZone:](self->_rxControl, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[AWDControlFrames copyWithZone:](self->_txControl, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 24) = -[AWDDataFrames copyWithZone:](self->_rxData, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[AWDDataFrames copyWithZone:](self->_txData, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 32) = -[AWDManagementFrames copyWithZone:](self->_rxManagement, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 56) = -[AWDManagementFrames copyWithZone:](self->_txManagement, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDControlFrames *rxControl;
  AWDControlFrames *txControl;
  AWDDataFrames *rxData;
  AWDDataFrames *txData;
  AWDManagementFrames *rxManagement;
  AWDManagementFrames *txManagement;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    rxControl = self->_rxControl;
    if (!((unint64_t)rxControl | *((_QWORD *)a3 + 2))
      || (v5 = -[AWDControlFrames isEqual:](rxControl, "isEqual:")) != 0)
    {
      txControl = self->_txControl;
      if (!((unint64_t)txControl | *((_QWORD *)a3 + 5))
        || (v5 = -[AWDControlFrames isEqual:](txControl, "isEqual:")) != 0)
      {
        rxData = self->_rxData;
        if (!((unint64_t)rxData | *((_QWORD *)a3 + 3))
          || (v5 = -[AWDDataFrames isEqual:](rxData, "isEqual:")) != 0)
        {
          txData = self->_txData;
          if (!((unint64_t)txData | *((_QWORD *)a3 + 6))
            || (v5 = -[AWDDataFrames isEqual:](txData, "isEqual:")) != 0)
          {
            rxManagement = self->_rxManagement;
            if (!((unint64_t)rxManagement | *((_QWORD *)a3 + 4))
              || (v5 = -[AWDManagementFrames isEqual:](rxManagement, "isEqual:")) != 0)
            {
              txManagement = self->_txManagement;
              if ((unint64_t)txManagement | *((_QWORD *)a3 + 7))
                LOBYTE(v5) = -[AWDManagementFrames isEqual:](txManagement, "isEqual:");
              else
                LOBYTE(v5) = 1;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDControlFrames hash](self->_rxControl, "hash") ^ v3;
  v5 = -[AWDControlFrames hash](self->_txControl, "hash");
  v6 = v4 ^ v5 ^ -[AWDDataFrames hash](self->_rxData, "hash");
  v7 = -[AWDDataFrames hash](self->_txData, "hash");
  v8 = v7 ^ -[AWDManagementFrames hash](self->_rxManagement, "hash");
  return v6 ^ v8 ^ -[AWDManagementFrames hash](self->_txManagement, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDControlFrames *rxControl;
  uint64_t v6;
  AWDControlFrames *txControl;
  uint64_t v8;
  AWDDataFrames *rxData;
  uint64_t v10;
  AWDDataFrames *txData;
  uint64_t v12;
  AWDManagementFrames *rxManagement;
  uint64_t v14;
  AWDManagementFrames *txManagement;
  uint64_t v16;

  if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  rxControl = self->_rxControl;
  v6 = *((_QWORD *)a3 + 2);
  if (rxControl)
  {
    if (v6)
      -[AWDControlFrames mergeFrom:](rxControl, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setRxControl:](self, "setRxControl:");
  }
  txControl = self->_txControl;
  v8 = *((_QWORD *)a3 + 5);
  if (txControl)
  {
    if (v8)
      -[AWDControlFrames mergeFrom:](txControl, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setTxControl:](self, "setTxControl:");
  }
  rxData = self->_rxData;
  v10 = *((_QWORD *)a3 + 3);
  if (rxData)
  {
    if (v10)
      -[AWDDataFrames mergeFrom:](rxData, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setRxData:](self, "setRxData:");
  }
  txData = self->_txData;
  v12 = *((_QWORD *)a3 + 6);
  if (txData)
  {
    if (v12)
      -[AWDDataFrames mergeFrom:](txData, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setTxData:](self, "setTxData:");
  }
  rxManagement = self->_rxManagement;
  v14 = *((_QWORD *)a3 + 4);
  if (rxManagement)
  {
    if (v14)
      -[AWDManagementFrames mergeFrom:](rxManagement, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setRxManagement:](self, "setRxManagement:");
  }
  txManagement = self->_txManagement;
  v16 = *((_QWORD *)a3 + 7);
  if (txManagement)
  {
    if (v16)
      -[AWDManagementFrames mergeFrom:](txManagement, "mergeFrom:");
  }
  else if (v16)
  {
    -[AWDWiFiMetricsManagerFrameCounterStats setTxManagement:](self, "setTxManagement:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDControlFrames)rxControl
{
  return self->_rxControl;
}

- (void)setRxControl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AWDControlFrames)txControl
{
  return self->_txControl;
}

- (void)setTxControl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDDataFrames)rxData
{
  return self->_rxData;
}

- (void)setRxData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDDataFrames)txData
{
  return self->_txData;
}

- (void)setTxData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AWDManagementFrames)rxManagement
{
  return self->_rxManagement;
}

- (void)setRxManagement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AWDManagementFrames)txManagement
{
  return self->_txManagement;
}

- (void)setTxManagement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
