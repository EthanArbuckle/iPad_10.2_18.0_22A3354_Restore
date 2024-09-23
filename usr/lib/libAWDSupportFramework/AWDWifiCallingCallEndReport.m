@implementation AWDWifiCallingCallEndReport

- (void)dealloc
{
  objc_super v3;

  -[AWDWifiCallingCallEndReport setCallID:](self, "setCallID:", 0);
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiCallingCallEndReport;
  -[AWDWifiCallingCallEndReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasCallID
{
  return self->_callID != 0;
}

- (unint64_t)rtpPacketLossRateHistogramsCount
{
  return self->_rtpPacketLossRateHistograms.count;
}

- (unsigned)rtpPacketLossRateHistograms
{
  return self->_rtpPacketLossRateHistograms.list;
}

- (void)clearRtpPacketLossRateHistograms
{
  PBRepeatedUInt32Clear();
}

- (void)addRtpPacketLossRateHistogram:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)rtpPacketLossRateHistogramAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rtpPacketLossRateHistograms;
  unint64_t count;

  p_rtpPacketLossRateHistograms = &self->_rtpPacketLossRateHistograms;
  count = self->_rtpPacketLossRateHistograms.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rtpPacketLossRateHistograms->list[a3];
}

- (void)setRtpPacketLossRateHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)jitterBufferUnderflowRateHistogramsCount
{
  return self->_jitterBufferUnderflowRateHistograms.count;
}

- (unsigned)jitterBufferUnderflowRateHistograms
{
  return self->_jitterBufferUnderflowRateHistograms.list;
}

- (void)clearJitterBufferUnderflowRateHistograms
{
  PBRepeatedUInt32Clear();
}

- (void)addJitterBufferUnderflowRateHistogram:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)jitterBufferUnderflowRateHistogramAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_jitterBufferUnderflowRateHistograms;
  unint64_t count;

  p_jitterBufferUnderflowRateHistograms = &self->_jitterBufferUnderflowRateHistograms;
  count = self->_jitterBufferUnderflowRateHistograms.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_jitterBufferUnderflowRateHistograms->list[a3];
}

- (void)setJitterBufferUnderflowRateHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)frameErasureRateHistogramsCount
{
  return self->_frameErasureRateHistograms.count;
}

- (unsigned)frameErasureRateHistograms
{
  return self->_frameErasureRateHistograms.list;
}

- (void)clearFrameErasureRateHistograms
{
  PBRepeatedUInt32Clear();
}

- (void)addFrameErasureRateHistogram:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)frameErasureRateHistogramAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_frameErasureRateHistograms;
  unint64_t count;

  p_frameErasureRateHistograms = &self->_frameErasureRateHistograms;
  count = self->_frameErasureRateHistograms.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_frameErasureRateHistograms->list[a3];
}

- (void)setFrameErasureRateHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)jitterBufferResidencyTimeHistogramsCount
{
  return self->_jitterBufferResidencyTimeHistograms.count;
}

- (unsigned)jitterBufferResidencyTimeHistograms
{
  return self->_jitterBufferResidencyTimeHistograms.list;
}

- (void)clearJitterBufferResidencyTimeHistograms
{
  PBRepeatedUInt32Clear();
}

- (void)addJitterBufferResidencyTimeHistogram:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)jitterBufferResidencyTimeHistogramAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_jitterBufferResidencyTimeHistograms;
  unint64_t count;

  p_jitterBufferResidencyTimeHistograms = &self->_jitterBufferResidencyTimeHistograms;
  count = self->_jitterBufferResidencyTimeHistograms.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_jitterBufferResidencyTimeHistograms->list[a3];
}

- (void)setJitterBufferResidencyTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setRtpPacketLossRateMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rtpPacketLossRateMean = a3;
}

- (void)setHasRtpPacketLossRateMean:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRtpPacketLossRateMean
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setJitterBufferUnderflowRateMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_jitterBufferUnderflowRateMean = a3;
}

- (void)setHasJitterBufferUnderflowRateMean:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasJitterBufferUnderflowRateMean
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFrameErasureRateMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_frameErasureRateMean = a3;
}

- (void)setHasFrameErasureRateMean:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFrameErasureRateMean
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setJitterBufferResidencyTimeMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_jitterBufferResidencyTimeMean = a3;
}

- (void)setHasJitterBufferResidencyTimeMean:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasJitterBufferResidencyTimeMean
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setJitterBufferResidencyTimeMedian:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_jitterBufferResidencyTimeMedian = a3;
}

- (void)setHasJitterBufferResidencyTimeMedian:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasJitterBufferResidencyTimeMedian
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setJitterBufferResidencyTime95Percentile:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_jitterBufferResidencyTime95Percentile = a3;
}

- (void)setHasJitterBufferResidencyTime95Percentile:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasJitterBufferResidencyTime95Percentile
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRatType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_ratType = a3;
}

- (void)setHasRatType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRatType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setVocoderType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_vocoderType = a3;
}

- (void)setHasVocoderType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVocoderType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setVocoderSampleRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_vocoderSampleRate = a3;
}

- (void)setHasVocoderSampleRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVocoderSampleRate
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setUlVocoderBitRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ulVocoderBitRate = a3;
}

- (void)setHasUlVocoderBitRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUlVocoderBitRate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDlVocoderBitRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dlVocoderBitRate = a3;
}

- (void)setHasDlVocoderBitRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDlVocoderBitRate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiCallingCallEndReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiCallingCallEndReport description](&v3, sel_description), -[AWDWifiCallingCallEndReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *callID;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  callID = self->_callID;
  if (callID)
    objc_msgSend(v3, "setObject:forKey:", callID, CFSTR("callID"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("rtpPacketLossRateHistogram"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("jitterBufferUnderflowRateHistogram"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("frameErasureRateHistogram"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("jitterBufferResidencyTimeHistogram"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rtpPacketLossRateMean), CFSTR("rtpPacketLossRateMean"));
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jitterBufferUnderflowRateMean), CFSTR("jitterBufferUnderflowRateMean"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_frameErasureRateMean), CFSTR("frameErasureRateMean"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jitterBufferResidencyTimeMean), CFSTR("jitterBufferResidencyTimeMean"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jitterBufferResidencyTimeMedian), CFSTR("jitterBufferResidencyTimeMedian"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jitterBufferResidencyTime95Percentile), CFSTR("jitterBufferResidencyTime95Percentile"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ratType), CFSTR("ratType"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_vocoderType), CFSTR("vocoderType"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0)
      goto LABEL_15;
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ulVocoderBitRate), CFSTR("ulVocoderBitRate"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_16;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_vocoderSampleRate), CFSTR("vocoderSampleRate"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_27;
LABEL_15:
  if ((has & 2) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dlVocoderBitRate), CFSTR("dlVocoderBitRate"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiCallingCallEndReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int16 has;

  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_callID)
    PBDataWriterWriteStringField();
  if (self->_rtpPacketLossRateHistograms.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_rtpPacketLossRateHistograms.count);
  }
  if (self->_jitterBufferUnderflowRateHistograms.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_jitterBufferUnderflowRateHistograms.count);
  }
  if (self->_frameErasureRateHistograms.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_frameErasureRateHistograms.count);
  }
  if (self->_jitterBufferResidencyTimeHistograms.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_jitterBufferResidencyTimeHistograms.count);
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_19:
      if ((has & 4) == 0)
        goto LABEL_20;
      goto LABEL_31;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_20:
    if ((has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_21:
    if ((has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 8) == 0)
      goto LABEL_23;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_23:
    if ((has & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_24:
    if ((has & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_25:
    if ((has & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_26:
    if ((has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_27:
    if ((has & 2) == 0)
      return;
LABEL_39:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_39;
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
  __int16 has;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 82) |= 1u;
  }
  if (self->_callID)
    objc_msgSend(a3, "setCallID:");
  if (-[AWDWifiCallingCallEndReport rtpPacketLossRateHistogramsCount](self, "rtpPacketLossRateHistogramsCount"))
  {
    objc_msgSend(a3, "clearRtpPacketLossRateHistograms");
    v5 = -[AWDWifiCallingCallEndReport rtpPacketLossRateHistogramsCount](self, "rtpPacketLossRateHistogramsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRtpPacketLossRateHistogram:", -[AWDWifiCallingCallEndReport rtpPacketLossRateHistogramAtIndex:](self, "rtpPacketLossRateHistogramAtIndex:", i));
    }
  }
  if (-[AWDWifiCallingCallEndReport jitterBufferUnderflowRateHistogramsCount](self, "jitterBufferUnderflowRateHistogramsCount"))
  {
    objc_msgSend(a3, "clearJitterBufferUnderflowRateHistograms");
    v8 = -[AWDWifiCallingCallEndReport jitterBufferUnderflowRateHistogramsCount](self, "jitterBufferUnderflowRateHistogramsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addJitterBufferUnderflowRateHistogram:", -[AWDWifiCallingCallEndReport jitterBufferUnderflowRateHistogramAtIndex:](self, "jitterBufferUnderflowRateHistogramAtIndex:", j));
    }
  }
  if (-[AWDWifiCallingCallEndReport frameErasureRateHistogramsCount](self, "frameErasureRateHistogramsCount"))
  {
    objc_msgSend(a3, "clearFrameErasureRateHistograms");
    v11 = -[AWDWifiCallingCallEndReport frameErasureRateHistogramsCount](self, "frameErasureRateHistogramsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addFrameErasureRateHistogram:", -[AWDWifiCallingCallEndReport frameErasureRateHistogramAtIndex:](self, "frameErasureRateHistogramAtIndex:", k));
    }
  }
  if (-[AWDWifiCallingCallEndReport jitterBufferResidencyTimeHistogramsCount](self, "jitterBufferResidencyTimeHistogramsCount"))
  {
    objc_msgSend(a3, "clearJitterBufferResidencyTimeHistograms");
    v14 = -[AWDWifiCallingCallEndReport jitterBufferResidencyTimeHistogramsCount](self, "jitterBufferResidencyTimeHistogramsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addJitterBufferResidencyTimeHistogram:", -[AWDWifiCallingCallEndReport jitterBufferResidencyTimeHistogramAtIndex:](self, "jitterBufferResidencyTimeHistogramAtIndex:", m));
    }
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 37) = self->_rtpPacketLossRateMean;
    *((_WORD *)a3 + 82) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_23:
      if ((has & 4) == 0)
        goto LABEL_24;
      goto LABEL_36;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)a3 + 35) = self->_jitterBufferUnderflowRateMean;
  *((_WORD *)a3 + 82) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_24:
    if ((has & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 31) = self->_frameErasureRateMean;
  *((_WORD *)a3 + 82) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_25:
    if ((has & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 33) = self->_jitterBufferResidencyTimeMean;
  *((_WORD *)a3 + 82) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_26:
    if ((has & 8) == 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 34) = self->_jitterBufferResidencyTimeMedian;
  *((_WORD *)a3 + 82) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 32) = self->_jitterBufferResidencyTime95Percentile;
  *((_WORD *)a3 + 82) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_28:
    if ((has & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 36) = self->_ratType;
  *((_WORD *)a3 + 82) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_29:
    if ((has & 0x400) == 0)
      goto LABEL_30;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 40) = self->_vocoderType;
  *((_WORD *)a3 + 82) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 39) = self->_vocoderSampleRate;
  *((_WORD *)a3 + 82) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 2) == 0)
      return;
    goto LABEL_32;
  }
LABEL_43:
  *((_DWORD *)a3 + 38) = self->_ulVocoderBitRate;
  *((_WORD *)a3 + 82) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return;
LABEL_32:
  *((_DWORD *)a3 + 30) = self->_dlVocoderBitRate;
  *((_WORD *)a3 + 82) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_timestamp;
    *(_WORD *)(v5 + 164) |= 1u;
  }

  *(_QWORD *)(v6 + 112) = -[NSString copyWithZone:](self->_callID, "copyWithZone:", a3);
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 148) = self->_rtpPacketLossRateMean;
    *(_WORD *)(v6 + 164) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 140) = self->_jitterBufferUnderflowRateMean;
  *(_WORD *)(v6 + 164) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v6 + 124) = self->_frameErasureRateMean;
  *(_WORD *)(v6 + 164) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 132) = self->_jitterBufferResidencyTimeMean;
  *(_WORD *)(v6 + 164) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 136) = self->_jitterBufferResidencyTimeMedian;
  *(_WORD *)(v6 + 164) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 128) = self->_jitterBufferResidencyTime95Percentile;
  *(_WORD *)(v6 + 164) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 144) = self->_ratType;
  *(_WORD *)(v6 + 164) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v6 + 160) = self->_vocoderType;
  *(_WORD *)(v6 + 164) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
LABEL_25:
    *(_DWORD *)(v6 + 152) = self->_ulVocoderBitRate;
    *(_WORD *)(v6 + 164) |= 0x200u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_14;
  }
LABEL_24:
  *(_DWORD *)(v6 + 156) = self->_vocoderSampleRate;
  *(_WORD *)(v6 + 164) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_25;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 120) = self->_dlVocoderBitRate;
    *(_WORD *)(v6 + 164) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  __int16 v6;
  NSString *callID;
  __int16 has;
  __int16 v9;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    v6 = *((_WORD *)a3 + 82);
    if ((*(_WORD *)&self->_has & 1) != 0)
    {
      if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 13))
        goto LABEL_67;
    }
    else if ((v6 & 1) != 0)
    {
LABEL_67:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    callID = self->_callID;
    if (!((unint64_t)callID | *((_QWORD *)a3 + 14)) || (IsEqual = -[NSString isEqual:](callID, "isEqual:")) != 0)
    {
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        IsEqual = PBRepeatedUInt32IsEqual();
        if (IsEqual)
        {
          IsEqual = PBRepeatedUInt32IsEqual();
          if (IsEqual)
          {
            IsEqual = PBRepeatedUInt32IsEqual();
            if (IsEqual)
            {
              has = (__int16)self->_has;
              v9 = *((_WORD *)a3 + 82);
              if ((has & 0x100) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x100) == 0 || self->_rtpPacketLossRateMean != *((_DWORD *)a3 + 37))
                  goto LABEL_67;
              }
              else if ((*((_WORD *)a3 + 82) & 0x100) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x40) != 0)
              {
                if ((v9 & 0x40) == 0 || self->_jitterBufferUnderflowRateMean != *((_DWORD *)a3 + 35))
                  goto LABEL_67;
              }
              else if ((v9 & 0x40) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 4) != 0)
              {
                if ((v9 & 4) == 0 || self->_frameErasureRateMean != *((_DWORD *)a3 + 31))
                  goto LABEL_67;
              }
              else if ((v9 & 4) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x10) != 0)
              {
                if ((v9 & 0x10) == 0 || self->_jitterBufferResidencyTimeMean != *((_DWORD *)a3 + 33))
                  goto LABEL_67;
              }
              else if ((v9 & 0x10) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x20) != 0)
              {
                if ((v9 & 0x20) == 0 || self->_jitterBufferResidencyTimeMedian != *((_DWORD *)a3 + 34))
                  goto LABEL_67;
              }
              else if ((v9 & 0x20) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 8) != 0)
              {
                if ((v9 & 8) == 0 || self->_jitterBufferResidencyTime95Percentile != *((_DWORD *)a3 + 32))
                  goto LABEL_67;
              }
              else if ((v9 & 8) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x80) != 0)
              {
                if ((v9 & 0x80) == 0 || self->_ratType != *((_DWORD *)a3 + 36))
                  goto LABEL_67;
              }
              else if ((v9 & 0x80) != 0)
              {
                goto LABEL_67;
              }
              if ((*(_WORD *)&self->_has & 0x800) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x800) == 0 || self->_vocoderType != *((_DWORD *)a3 + 40))
                  goto LABEL_67;
              }
              else if ((*((_WORD *)a3 + 82) & 0x800) != 0)
              {
                goto LABEL_67;
              }
              if ((*(_WORD *)&self->_has & 0x400) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x400) == 0 || self->_vocoderSampleRate != *((_DWORD *)a3 + 39))
                  goto LABEL_67;
              }
              else if ((*((_WORD *)a3 + 82) & 0x400) != 0)
              {
                goto LABEL_67;
              }
              if ((*(_WORD *)&self->_has & 0x200) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x200) == 0 || self->_ulVocoderBitRate != *((_DWORD *)a3 + 38))
                  goto LABEL_67;
              }
              else if ((*((_WORD *)a3 + 82) & 0x200) != 0)
              {
                goto LABEL_67;
              }
              LOBYTE(IsEqual) = (v9 & 2) == 0;
              if ((has & 2) != 0)
              {
                if ((v9 & 2) == 0 || self->_dlVocoderBitRate != *((_DWORD *)a3 + 30))
                  goto LABEL_67;
                LOBYTE(IsEqual) = 1;
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
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 has;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((*(_WORD *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_callID, "hash");
  v5 = PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt32Hash();
  v8 = PBRepeatedUInt32Hash();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v10 = 2654435761 * self->_rtpPacketLossRateMean;
    if ((has & 0x40) != 0)
    {
LABEL_6:
      v11 = 2654435761 * self->_jitterBufferUnderflowRateMean;
      if ((has & 4) != 0)
        goto LABEL_7;
      goto LABEL_18;
    }
  }
  else
  {
    v10 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_6;
  }
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v12 = 2654435761 * self->_frameErasureRateMean;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v13 = 2654435761 * self->_jitterBufferResidencyTimeMean;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v13 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v14 = 2654435761 * self->_jitterBufferResidencyTimeMedian;
    if ((has & 8) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    v15 = 2654435761 * self->_jitterBufferResidencyTime95Percentile;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  v15 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v16 = 2654435761 * self->_ratType;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    v17 = 2654435761 * self->_vocoderType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  v17 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    v18 = 2654435761 * self->_vocoderSampleRate;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
LABEL_25:
    v19 = 0;
    if ((has & 2) != 0)
      goto LABEL_15;
LABEL_26:
    v20 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_24:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_25;
LABEL_14:
  v19 = 2654435761 * self->_ulVocoderBitRate;
  if ((has & 2) == 0)
    goto LABEL_26;
LABEL_15:
  v20 = 2654435761 * self->_dlVocoderBitRate;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
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
  __int16 v17;

  if ((*((_WORD *)a3 + 82) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 14))
    -[AWDWifiCallingCallEndReport setCallID:](self, "setCallID:");
  v5 = objc_msgSend(a3, "rtpPacketLossRateHistogramsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWifiCallingCallEndReport addRtpPacketLossRateHistogram:](self, "addRtpPacketLossRateHistogram:", objc_msgSend(a3, "rtpPacketLossRateHistogramAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "jitterBufferUnderflowRateHistogramsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWifiCallingCallEndReport addJitterBufferUnderflowRateHistogram:](self, "addJitterBufferUnderflowRateHistogram:", objc_msgSend(a3, "jitterBufferUnderflowRateHistogramAtIndex:", j));
  }
  v11 = objc_msgSend(a3, "frameErasureRateHistogramsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[AWDWifiCallingCallEndReport addFrameErasureRateHistogram:](self, "addFrameErasureRateHistogram:", objc_msgSend(a3, "frameErasureRateHistogramAtIndex:", k));
  }
  v14 = objc_msgSend(a3, "jitterBufferResidencyTimeHistogramsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[AWDWifiCallingCallEndReport addJitterBufferResidencyTimeHistogram:](self, "addJitterBufferResidencyTimeHistogram:", objc_msgSend(a3, "jitterBufferResidencyTimeHistogramAtIndex:", m));
  }
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x100) != 0)
  {
    self->_rtpPacketLossRateMean = *((_DWORD *)a3 + 37);
    *(_WORD *)&self->_has |= 0x100u;
    v17 = *((_WORD *)a3 + 82);
    if ((v17 & 0x40) == 0)
    {
LABEL_19:
      if ((v17 & 4) == 0)
        goto LABEL_20;
      goto LABEL_32;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  self->_jitterBufferUnderflowRateMean = *((_DWORD *)a3 + 35);
  *(_WORD *)&self->_has |= 0x40u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 4) == 0)
  {
LABEL_20:
    if ((v17 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_33;
  }
LABEL_32:
  self->_frameErasureRateMean = *((_DWORD *)a3 + 31);
  *(_WORD *)&self->_has |= 4u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x10) == 0)
  {
LABEL_21:
    if ((v17 & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_34;
  }
LABEL_33:
  self->_jitterBufferResidencyTimeMean = *((_DWORD *)a3 + 33);
  *(_WORD *)&self->_has |= 0x10u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x20) == 0)
  {
LABEL_22:
    if ((v17 & 8) == 0)
      goto LABEL_23;
    goto LABEL_35;
  }
LABEL_34:
  self->_jitterBufferResidencyTimeMedian = *((_DWORD *)a3 + 34);
  *(_WORD *)&self->_has |= 0x20u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 8) == 0)
  {
LABEL_23:
    if ((v17 & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_36;
  }
LABEL_35:
  self->_jitterBufferResidencyTime95Percentile = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 8u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x80) == 0)
  {
LABEL_24:
    if ((v17 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  self->_ratType = *((_DWORD *)a3 + 36);
  *(_WORD *)&self->_has |= 0x80u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x800) == 0)
  {
LABEL_25:
    if ((v17 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  self->_vocoderType = *((_DWORD *)a3 + 40);
  *(_WORD *)&self->_has |= 0x800u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x400) == 0)
  {
LABEL_26:
    if ((v17 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  self->_vocoderSampleRate = *((_DWORD *)a3 + 39);
  *(_WORD *)&self->_has |= 0x400u;
  v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x200) == 0)
  {
LABEL_27:
    if ((v17 & 2) == 0)
      return;
    goto LABEL_28;
  }
LABEL_39:
  self->_ulVocoderBitRate = *((_DWORD *)a3 + 38);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 82) & 2) == 0)
    return;
LABEL_28:
  self->_dlVocoderBitRate = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callID
{
  return self->_callID;
}

- (void)setCallID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (unsigned)rtpPacketLossRateMean
{
  return self->_rtpPacketLossRateMean;
}

- (unsigned)jitterBufferUnderflowRateMean
{
  return self->_jitterBufferUnderflowRateMean;
}

- (unsigned)frameErasureRateMean
{
  return self->_frameErasureRateMean;
}

- (unsigned)jitterBufferResidencyTimeMean
{
  return self->_jitterBufferResidencyTimeMean;
}

- (unsigned)jitterBufferResidencyTimeMedian
{
  return self->_jitterBufferResidencyTimeMedian;
}

- (unsigned)jitterBufferResidencyTime95Percentile
{
  return self->_jitterBufferResidencyTime95Percentile;
}

- (unsigned)ratType
{
  return self->_ratType;
}

- (unsigned)vocoderType
{
  return self->_vocoderType;
}

- (unsigned)vocoderSampleRate
{
  return self->_vocoderSampleRate;
}

- (unsigned)ulVocoderBitRate
{
  return self->_ulVocoderBitRate;
}

- (unsigned)dlVocoderBitRate
{
  return self->_dlVocoderBitRate;
}

@end
