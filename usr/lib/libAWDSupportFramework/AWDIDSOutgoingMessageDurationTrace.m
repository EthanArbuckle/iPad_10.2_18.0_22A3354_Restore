@implementation AWDIDSOutgoingMessageDurationTrace

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSOutgoingMessageDurationTrace setService:](self, "setService:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSOutgoingMessageDurationTrace;
  -[AWDIDSOutgoingMessageDurationTrace dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSendToDaemonStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_sendToDaemonStart = a3;
}

- (void)setHasSendToDaemonStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSendToDaemonStart
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSendToDaemonDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_sendToDaemonDuration = a3;
}

- (void)setHasSendToDaemonDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSendToDaemonDuration
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setStoreInDatabaseStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_storeInDatabaseStart = a3;
}

- (void)setHasStoreInDatabaseStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasStoreInDatabaseStart
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setStoreInDatabaseDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_storeInDatabaseDuration = a3;
}

- (void)setHasStoreInDatabaseDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasStoreInDatabaseDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCompressPayloadStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_compressPayloadStart = a3;
}

- (void)setHasCompressPayloadStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCompressPayloadStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCompressPayloadDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_compressPayloadDuration = a3;
}

- (void)setHasCompressPayloadDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCompressPayloadDuration
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setUncompressedMessageSize:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_uncompressedMessageSize = a3;
}

- (void)setHasUncompressedMessageSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasUncompressedMessageSize
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCompressedMessageSize:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_compressedMessageSize = a3;
}

- (void)setHasCompressedMessageSize:(BOOL)a3
{
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCompressedMessageSize
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIDQueryStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_iDQueryStart = a3;
}

- (void)setHasIDQueryStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIDQueryStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIDQueryDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_iDQueryDuration = a3;
}

- (void)setHasIDQueryDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIDQueryDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMessageOnQueueStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_messageOnQueueStart = a3;
}

- (void)setHasMessageOnQueueStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMessageOnQueueStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMessageOnQueueDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_messageOnQueueDuration = a3;
}

- (void)setHasMessageOnQueueDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMessageOnQueueDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMessagesOnQueue:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_messagesOnQueue = a3;
}

- (void)setHasMessagesOnQueue:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMessagesOnQueue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEncryptionCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_encryptionCount = a3;
}

- (void)setHasEncryptionCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasEncryptionCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAvgEncryptionDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_avgEncryptionDuration = a3;
}

- (void)setHasAvgEncryptionDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAvgEncryptionDuration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setAggregatedMessageSendCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_aggregatedMessageSendCount = a3;
}

- (void)setHasAggregatedMessageSendCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAggregatedMessageSendCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAvgAggregatedMessageSendDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_avgAggregatedMessageSendDuration = a3;
}

- (void)setHasAvgAggregatedMessageSendDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAvgAggregatedMessageSendDuration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setCommand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCommand
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setPriority:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPriority
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSOutgoingMessageDurationTrace;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSOutgoingMessageDurationTrace description](&v3, sel_description), -[AWDIDSOutgoingMessageDurationTrace dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $7F0D611AE92F61BCAF01D83A32E04512 has;
  NSString *service;
  $7F0D611AE92F61BCAF01D83A32E04512 v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sendToDaemonStart), CFSTR("sendToDaemonStart"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sendToDaemonDuration), CFSTR("sendToDaemonDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_storeInDatabaseStart), CFSTR("storeInDatabaseStart"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_storeInDatabaseDuration), CFSTR("storeInDatabaseDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_compressPayloadStart), CFSTR("compressPayloadStart"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_compressPayloadDuration), CFSTR("compressPayloadDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_uncompressedMessageSize), CFSTR("uncompressedMessageSize"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_compressedMessageSize), CFSTR("compressedMessageSize"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iDQueryStart), CFSTR("IDQueryStart"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iDQueryDuration), CFSTR("IDQueryDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageOnQueueStart), CFSTR("messageOnQueueStart"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageOnQueueDuration), CFSTR("messageOnQueueDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_messagesOnQueue), CFSTR("messagesOnQueue"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_encryptionCount), CFSTR("encryptionCount"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgEncryptionDuration), CFSTR("avgEncryptionDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_aggregatedMessageSendCount), CFSTR("aggregatedMessageSendCount"));
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_19:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgAggregatedMessageSendDuration), CFSTR("avgAggregatedMessageSendDuration"));
LABEL_20:
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKey:", service, CFSTR("service"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_command), CFSTR("command"));
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x8000) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_priority), CFSTR("priority"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSOutgoingMessageDurationTraceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $7F0D611AE92F61BCAF01D83A32E04512 has;
  $7F0D611AE92F61BCAF01D83A32E04512 v5;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_19:
    PBDataWriterWriteUint32Field();
LABEL_20:
  if (self->_service)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x8000) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $7F0D611AE92F61BCAF01D83A32E04512 has;
  $7F0D611AE92F61BCAF01D83A32E04512 v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_DWORD *)a3 + 28) |= 4u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 23) = self->_sendToDaemonStart;
  *((_DWORD *)a3 + 28) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 22) = self->_sendToDaemonDuration;
  *((_DWORD *)a3 + 28) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 27) = self->_storeInDatabaseStart;
  *((_DWORD *)a3 + 28) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 26) = self->_storeInDatabaseDuration;
  *((_DWORD *)a3 + 28) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 15) = self->_compressPayloadStart;
  *((_DWORD *)a3 + 28) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 14) = self->_compressPayloadDuration;
  *((_DWORD *)a3 + 28) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 4) = self->_uncompressedMessageSize;
  *((_DWORD *)a3 + 28) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 1) = self->_compressedMessageSize;
  *((_DWORD *)a3 + 28) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 18) = self->_iDQueryStart;
  *((_DWORD *)a3 + 28) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 17) = self->_iDQueryDuration;
  *((_DWORD *)a3 + 28) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 20) = self->_messageOnQueueStart;
  *((_DWORD *)a3 + 28) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 19) = self->_messageOnQueueDuration;
  *((_DWORD *)a3 + 28) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 2) = self->_messagesOnQueue;
  *((_DWORD *)a3 + 28) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 16) = self->_encryptionCount;
  *((_DWORD *)a3 + 28) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 12) = self->_avgEncryptionDuration;
  *((_DWORD *)a3 + 28) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_43:
  *((_DWORD *)a3 + 10) = self->_aggregatedMessageSendCount;
  *((_DWORD *)a3 + 28) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *((_DWORD *)a3 + 11) = self->_avgAggregatedMessageSendDuration;
    *((_DWORD *)a3 + 28) |= 0x20u;
  }
LABEL_20:
  if (self->_service)
    objc_msgSend(a3, "setService:");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_command;
    *((_DWORD *)a3 + 28) |= 0x80u;
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
    *((_DWORD *)a3 + 21) = self->_priority;
    *((_DWORD *)a3 + 28) |= 0x8000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $7F0D611AE92F61BCAF01D83A32E04512 has;
  $7F0D611AE92F61BCAF01D83A32E04512 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_DWORD *)(v5 + 112) |= 4u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 92) = self->_sendToDaemonStart;
  *(_DWORD *)(v5 + 112) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 88) = self->_sendToDaemonDuration;
  *(_DWORD *)(v5 + 112) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 108) = self->_storeInDatabaseStart;
  *(_DWORD *)(v5 + 112) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 104) = self->_storeInDatabaseDuration;
  *(_DWORD *)(v5 + 112) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 60) = self->_compressPayloadStart;
  *(_DWORD *)(v5 + 112) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 56) = self->_compressPayloadDuration;
  *(_DWORD *)(v5 + 112) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v5 + 32) = self->_uncompressedMessageSize;
  *(_DWORD *)(v5 + 112) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *(_QWORD *)(v5 + 8) = self->_compressedMessageSize;
  *(_DWORD *)(v5 + 112) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 72) = self->_iDQueryStart;
  *(_DWORD *)(v5 + 112) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 68) = self->_iDQueryDuration;
  *(_DWORD *)(v5 + 112) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 80) = self->_messageOnQueueStart;
  *(_DWORD *)(v5 + 112) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 76) = self->_messageOnQueueDuration;
  *(_DWORD *)(v5 + 112) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *(_QWORD *)(v5 + 16) = self->_messagesOnQueue;
  *(_DWORD *)(v5 + 112) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 64) = self->_encryptionCount;
  *(_DWORD *)(v5 + 112) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 48) = self->_avgEncryptionDuration;
  *(_DWORD *)(v5 + 112) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_41:
  *(_DWORD *)(v5 + 40) = self->_aggregatedMessageSendCount;
  *(_DWORD *)(v5 + 112) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 44) = self->_avgAggregatedMessageSendDuration;
    *(_DWORD *)(v5 + 112) |= 0x20u;
  }
LABEL_20:

  *(_QWORD *)(v6 + 96) = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_command;
    *(_DWORD *)(v6 + 112) |= 0x80u;
    v8 = self->_has;
  }
  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_priority;
    *(_DWORD *)(v6 + 112) |= 0x8000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $7F0D611AE92F61BCAF01D83A32E04512 has;
  int v7;
  NSString *service;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 28);
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_104;
    }
    else if ((v7 & 4) != 0)
    {
LABEL_104:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_sendToDaemonStart != *((_DWORD *)a3 + 23))
        goto LABEL_104;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_sendToDaemonDuration != *((_DWORD *)a3 + 22))
        goto LABEL_104;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_storeInDatabaseStart != *((_DWORD *)a3 + 27))
        goto LABEL_104;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_storeInDatabaseDuration != *((_DWORD *)a3 + 26))
        goto LABEL_104;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_compressPayloadStart != *((_DWORD *)a3 + 15))
        goto LABEL_104;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_compressPayloadDuration != *((_DWORD *)a3 + 14))
        goto LABEL_104;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_uncompressedMessageSize != *((_QWORD *)a3 + 4))
        goto LABEL_104;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_compressedMessageSize != *((_QWORD *)a3 + 1))
        goto LABEL_104;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_iDQueryStart != *((_DWORD *)a3 + 18))
        goto LABEL_104;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_iDQueryDuration != *((_DWORD *)a3 + 17))
        goto LABEL_104;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_messageOnQueueStart != *((_DWORD *)a3 + 20))
        goto LABEL_104;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_messageOnQueueDuration != *((_DWORD *)a3 + 19))
        goto LABEL_104;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_messagesOnQueue != *((_QWORD *)a3 + 2))
        goto LABEL_104;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_encryptionCount != *((_DWORD *)a3 + 16))
        goto LABEL_104;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_avgEncryptionDuration != *((_DWORD *)a3 + 12))
        goto LABEL_104;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_aggregatedMessageSendCount != *((_DWORD *)a3 + 10))
        goto LABEL_104;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_avgAggregatedMessageSendDuration != *((_DWORD *)a3 + 11))
        goto LABEL_104;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_104;
    }
    service = self->_service;
    if ((unint64_t)service | *((_QWORD *)a3 + 12))
    {
      v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 28);
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_command != *((_DWORD *)a3 + 13))
        goto LABEL_104;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_104;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 28) & 0x8000) == 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v9 & 0x8000) == 0 || self->_priority != *((_DWORD *)a3 + 21))
        goto LABEL_104;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $7F0D611AE92F61BCAF01D83A32E04512 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  $7F0D611AE92F61BCAF01D83A32E04512 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    v26 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
LABEL_3:
      v25 = 2654435761 * self->_sendToDaemonStart;
      if ((*(_DWORD *)&has & 0x10000) != 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else
  {
    v26 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_3;
  }
  v25 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_4:
    v24 = 2654435761 * self->_sendToDaemonDuration;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_5:
    v23 = 2654435761 * self->_storeInDatabaseStart;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_6:
    v22 = 2654435761 * self->_storeInDatabaseDuration;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v22 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    v21 = 2654435761 * self->_compressPayloadStart;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v21 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_8:
    v20 = 2654435761 * self->_compressPayloadDuration;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v20 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_9:
    v19 = 2654435761u * self->_uncompressedMessageSize;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v19 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_10:
    v18 = 2654435761u * self->_compressedMessageSize;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v18 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    v17 = 2654435761 * self->_iDQueryStart;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v17 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    v4 = 2654435761 * self->_iDQueryDuration;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v4 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    v5 = 2654435761 * self->_messageOnQueueStart;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v5 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_14:
    v6 = 2654435761 * self->_messageOnQueueDuration;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v6 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_15:
    v7 = 2654435761u * self->_messagesOnQueue;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v7 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_16:
    v8 = 2654435761 * self->_encryptionCount;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_17:
    v9 = 2654435761 * self->_avgEncryptionDuration;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_18;
LABEL_36:
    v10 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_35:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_36;
LABEL_18:
  v10 = 2654435761 * self->_aggregatedMessageSendCount;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_19:
    v11 = 2654435761 * self->_avgAggregatedMessageSendDuration;
    goto LABEL_38;
  }
LABEL_37:
  v11 = 0;
LABEL_38:
  v12 = -[NSString hash](self->_service, "hash");
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    v14 = 2654435761 * self->_command;
    if ((*(_WORD *)&v13 & 0x8000) != 0)
      goto LABEL_40;
LABEL_42:
    v15 = 0;
    return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
  }
  v14 = 0;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
    goto LABEL_42;
LABEL_40:
  v15 = 2654435761 * self->_priority;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  int v6;

  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    v5 = *((_DWORD *)a3 + 28);
    if ((v5 & 0x20000) == 0)
    {
LABEL_3:
      if ((v5 & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  self->_sendToDaemonStart = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x10000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  self->_sendToDaemonDuration = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  self->_storeInDatabaseStart = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x40000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  self->_storeInDatabaseDuration = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  self->_compressPayloadStart = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  self->_compressPayloadDuration = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  self->_uncompressedMessageSize = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  self->_compressedMessageSize = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  self->_iDQueryStart = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  self->_iDQueryDuration = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  self->_messageOnQueueStart = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  self->_messageOnQueueDuration = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  self->_messagesOnQueue = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x400) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  self->_encryptionCount = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  self->_avgEncryptionDuration = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_43:
  self->_aggregatedMessageSendCount = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)a3 + 28) & 0x20) != 0)
  {
LABEL_19:
    self->_avgAggregatedMessageSendDuration = *((_DWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_20:
  if (*((_QWORD *)a3 + 12))
    -[AWDIDSOutgoingMessageDurationTrace setService:](self, "setService:");
  v6 = *((_DWORD *)a3 + 28);
  if ((v6 & 0x80) != 0)
  {
    self->_command = *((_DWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x80u;
    v6 = *((_DWORD *)a3 + 28);
  }
  if ((v6 & 0x8000) != 0)
  {
    self->_priority = *((_DWORD *)a3 + 21);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)sendToDaemonStart
{
  return self->_sendToDaemonStart;
}

- (unsigned)sendToDaemonDuration
{
  return self->_sendToDaemonDuration;
}

- (unsigned)storeInDatabaseStart
{
  return self->_storeInDatabaseStart;
}

- (unsigned)storeInDatabaseDuration
{
  return self->_storeInDatabaseDuration;
}

- (unsigned)compressPayloadStart
{
  return self->_compressPayloadStart;
}

- (unsigned)compressPayloadDuration
{
  return self->_compressPayloadDuration;
}

- (unint64_t)uncompressedMessageSize
{
  return self->_uncompressedMessageSize;
}

- (unint64_t)compressedMessageSize
{
  return self->_compressedMessageSize;
}

- (unsigned)iDQueryStart
{
  return self->_iDQueryStart;
}

- (unsigned)iDQueryDuration
{
  return self->_iDQueryDuration;
}

- (unsigned)messageOnQueueStart
{
  return self->_messageOnQueueStart;
}

- (unsigned)messageOnQueueDuration
{
  return self->_messageOnQueueDuration;
}

- (unint64_t)messagesOnQueue
{
  return self->_messagesOnQueue;
}

- (unsigned)encryptionCount
{
  return self->_encryptionCount;
}

- (unsigned)avgEncryptionDuration
{
  return self->_avgEncryptionDuration;
}

- (unsigned)aggregatedMessageSendCount
{
  return self->_aggregatedMessageSendCount;
}

- (unsigned)avgAggregatedMessageSendDuration
{
  return self->_avgAggregatedMessageSendDuration;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (unsigned)command
{
  return self->_command;
}

- (unsigned)priority
{
  return self->_priority;
}

@end
