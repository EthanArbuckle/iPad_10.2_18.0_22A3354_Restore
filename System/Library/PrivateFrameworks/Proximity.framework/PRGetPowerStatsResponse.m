@implementation PRGetPowerStatsResponse

- (PRGetPowerStatsResponse)initWithSleepDuration:(unsigned int)a3 wakeDuration:(unsigned int)a4 singleAntennaSearchDuration:(unsigned int)a5 dualAntennaSearchDuration:(unsigned int)a6 singleChainRxPacketDuration:(unsigned int)a7 dualChainRxPacketDuration:(unsigned int)a8 tripleChainRxPacketDuration:(unsigned int)a9 dspProcessingDuration:(unsigned int)a10 txDuration:(unsigned int)a11 numPacketsReceived:(unsigned __int16)a12 numPacketsTransmitted:(unsigned __int16)a13 sleepCount:(unsigned int)a14 wakeCount:(unsigned int)a15 pmgrSleepCount:(unsigned int)a16 pmgrDeepSleepCount:(unsigned int)a17 deepSleepDuration:(unsigned int)a18
{
  PRGetPowerStatsResponse *result;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PRGetPowerStatsResponse;
  result = -[PRGetPowerStatsResponse init](&v25, sel_init);
  if (result)
  {
    result->_sleepDuration = a3;
    result->_wakeDuration = a4;
    result->_singleAntennaSearchDuration = a5;
    result->_dualAntennaSearchDuration = a6;
    result->_singleChainRxPacketDuration = a7;
    result->_dualChainRxPacketDuration = a8;
    result->_tripleChainRxPacketDuration = a9;
    result->_dspProcessingDuration = a10;
    result->_numPacketsReceived = a12;
    result->_numPacketsTransmitted = a13;
    result->_txDuration = a11;
    result->_sleepCount = a14;
    result->_wakeCount = a15;
    result->_pmgrSleepCount = a16;
    result->_pmgrDeepSleepCount = a17;
    result->_deepSleepDuration = a18;
  }
  return result;
}

- (PRGetPowerStatsResponse)initWithGetPowerStatsResponse:(const PowerStatsResponse *)a3
{
  PRGetPowerStatsResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRGetPowerStatsResponse;
  result = -[PRGetPowerStatsResponse init](&v5, sel_init);
  if (result)
  {
    result->_sleepDuration = a3->var0;
    result->_wakeDuration = a3->var1;
    result->_singleAntennaSearchDuration = a3->var2;
    result->_dualAntennaSearchDuration = a3->var3;
    result->_singleChainRxPacketDuration = a3->var4;
    result->_dualChainRxPacketDuration = a3->var5;
    result->_tripleChainRxPacketDuration = a3->var6;
    result->_dspProcessingDuration = a3->var7;
    result->_txDuration = a3->var8;
    result->_numPacketsReceived = a3->var9;
    result->_numPacketsTransmitted = a3->var10;
    result->_sleepCount = a3->var11;
    result->_wakeCount = a3->var12;
    result->_pmgrSleepCount = a3->var13;
    result->_pmgrDeepSleepCount = a3->var14;
    result->_deepSleepDuration = a3->var15;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRGetPowerStatsResponse)initWithCoder:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  __int16 v7;
  __int16 v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  PRGetPowerStatsResponse *v13;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  v3 = a3;
  v22 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("SleepDuration"));
  v21 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("WakeDuration"));
  v20 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("SingleAntennaSearchDuration"));
  v19 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("DualAntennaSearchDuration"));
  v18 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("SingleChainRxPacketDuration"));
  v17 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("DualChainRxPacketDuration"));
  v4 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("TripleChainRxPacketDuration"));
  v5 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("DSPProcessingDuration"));
  v6 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("TxDuration"));
  v7 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("NumPacketsReceived"));
  v8 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("NumPacketsTransmitted"));
  v9 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("SleepCount"));
  v10 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("WakeCount"));
  v11 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("PMGRSleepCount"));
  v12 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("PMGRDeepSleepCount"));
  LODWORD(v16) = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("DeepSleepDuration"));
  HIWORD(v15) = v8;
  WORD2(v15) = v7;
  LODWORD(v15) = v6;
  v13 = -[PRGetPowerStatsResponse initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:](self, "initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:", v22, v21, v20, v19, v18, v17, __PAIR64__(v5, v4), v15, __PAIR64__(v10, v9), __PAIR64__(v12, v11), v16);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_sleepDuration, CFSTR("SleepDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_wakeDuration, CFSTR("WakeDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_singleAntennaSearchDuration, CFSTR("SingleAntennaSearchDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_dualAntennaSearchDuration, CFSTR("DualAntennaSearchDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_singleChainRxPacketDuration, CFSTR("SingleChainRxPacketDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_dualChainRxPacketDuration, CFSTR("DualChainRxPacketDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_tripleChainRxPacketDuration, CFSTR("TripleChainRxPacketDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_dspProcessingDuration, CFSTR("DSPProcessingDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_txDuration, CFSTR("TxDuration"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_numPacketsReceived, CFSTR("NumPacketsReceived"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_numPacketsTransmitted, CFSTR("NumPacketsTransmitted"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_sleepCount, CFSTR("SleepCount"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_wakeCount, CFSTR("WakeCount"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_pmgrSleepCount, CFSTR("PMGRSleepCount"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_pmgrDeepSleepCount, CFSTR("PMGRDeepSleepCount"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_deepSleepDuration, CFSTR("DeepSleepDuration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRGetPowerStatsResponse *v4;
  uint64_t v6;
  uint64_t v7;

  v4 = [PRGetPowerStatsResponse alloc];
  LODWORD(v7) = self->_deepSleepDuration;
  LODWORD(v6) = self->_txDuration;
  HIDWORD(v6) = *(_DWORD *)&self->_numPacketsReceived;
  return -[PRGetPowerStatsResponse initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:](v4, "initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:", self->_sleepDuration, self->_wakeDuration, self->_singleAntennaSearchDuration, self->_dualAntennaSearchDuration, self->_singleChainRxPacketDuration, self->_dualChainRxPacketDuration, *(_QWORD *)&self->_tripleChainRxPacketDuration, v6, *(_QWORD *)&self->_sleepCount, *(_QWORD *)&self->_pmgrSleepCount, v7);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Power Stats: \n Sleep Duration: %d  Wake Duration: %d \n Single Antenna Search Duration: %d Dual Antenna Search Duration: %d \n Single Chain Rx Packet Duration: %d Dual Chain Rx Packet Duration: %d Triple Chain Rx Duration: %d \n DSP Processing Duration: %d Tx Duration: %d \n Number of Packets Received: %d Number of Packets Transmitted: %d \n Sleep Count: %d Wake Count: %d \n PMGR Sleep Count: %d PMGR Deep Sleep Count: %d \n Deep Sleep Duration: %d"), self->_sleepDuration, self->_wakeDuration, self->_singleAntennaSearchDuration, self->_dualAntennaSearchDuration, self->_singleChainRxPacketDuration, self->_dualChainRxPacketDuration, self->_tripleChainRxPacketDuration, self->_dspProcessingDuration, self->_txDuration, self->_numPacketsReceived, self->_numPacketsTransmitted, self->_sleepCount, self->_wakeCount, self->_pmgrSleepCount, self->_pmgrDeepSleepCount, self->_deepSleepDuration);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  BOOL v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "sleepDuration");
    if (v6 != -[PRGetPowerStatsResponse sleepDuration](self, "sleepDuration"))
      goto LABEL_19;
    v7 = objc_msgSend(v5, "wakeDuration");
    if (v7 != -[PRGetPowerStatsResponse wakeDuration](self, "wakeDuration"))
      goto LABEL_19;
    v8 = objc_msgSend(v5, "singleAntennaSearchDuration");
    if (v8 != -[PRGetPowerStatsResponse singleAntennaSearchDuration](self, "singleAntennaSearchDuration"))
      goto LABEL_19;
    v9 = objc_msgSend(v5, "dualAntennaSearchDuration");
    if (v9 != -[PRGetPowerStatsResponse dualAntennaSearchDuration](self, "dualAntennaSearchDuration"))
      goto LABEL_19;
    v10 = objc_msgSend(v5, "singleChainRxPacketDuration");
    if (v10 != -[PRGetPowerStatsResponse singleChainRxPacketDuration](self, "singleChainRxPacketDuration"))
      goto LABEL_19;
    v11 = objc_msgSend(v5, "dualChainRxPacketDuration");
    if (v11 != -[PRGetPowerStatsResponse dualChainRxPacketDuration](self, "dualChainRxPacketDuration"))
      goto LABEL_19;
    v12 = objc_msgSend(v5, "tripleChainRxPacketDuration");
    if (v12 != -[PRGetPowerStatsResponse tripleChainRxPacketDuration](self, "tripleChainRxPacketDuration"))
      goto LABEL_19;
    v13 = objc_msgSend(v5, "dspProcessingDuration");
    if (v13 != -[PRGetPowerStatsResponse dspProcessingDuration](self, "dspProcessingDuration"))
      goto LABEL_19;
    v14 = objc_msgSend(v5, "txDuration");
    if (v14 == -[PRGetPowerStatsResponse txDuration](self, "txDuration")
      && (v15 = objc_msgSend(v5, "numPacketsReceived"),
          v15 == -[PRGetPowerStatsResponse numPacketsReceived](self, "numPacketsReceived"))
      && (v16 = objc_msgSend(v5, "numPacketsTransmitted"),
          v16 == -[PRGetPowerStatsResponse numPacketsTransmitted](self, "numPacketsTransmitted"))
      && (v17 = objc_msgSend(v5, "sleepCount"), v17 == -[PRGetPowerStatsResponse sleepCount](self, "sleepCount"))
      && (v18 = objc_msgSend(v5, "wakeCount"), v18 == -[PRGetPowerStatsResponse wakeCount](self, "wakeCount"))
      && (v19 = objc_msgSend(v5, "pmgrSleepCount"),
          v19 == -[PRGetPowerStatsResponse pmgrSleepCount](self, "pmgrSleepCount"))
      && (v20 = objc_msgSend(v5, "pmgrDeepSleepCount"),
          v20 == -[PRGetPowerStatsResponse pmgrDeepSleepCount](self, "pmgrDeepSleepCount")))
    {
      v21 = objc_msgSend(v5, "deepSleepDuration");
      v22 = v21 == -[PRGetPowerStatsResponse deepSleepDuration](self, "deepSleepDuration");
    }
    else
    {
LABEL_19:
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unsigned)sleepDuration
{
  return self->_sleepDuration;
}

- (unsigned)wakeDuration
{
  return self->_wakeDuration;
}

- (unsigned)singleAntennaSearchDuration
{
  return self->_singleAntennaSearchDuration;
}

- (unsigned)dualAntennaSearchDuration
{
  return self->_dualAntennaSearchDuration;
}

- (unsigned)singleChainRxPacketDuration
{
  return self->_singleChainRxPacketDuration;
}

- (unsigned)dualChainRxPacketDuration
{
  return self->_dualChainRxPacketDuration;
}

- (unsigned)tripleChainRxPacketDuration
{
  return self->_tripleChainRxPacketDuration;
}

- (unsigned)dspProcessingDuration
{
  return self->_dspProcessingDuration;
}

- (unsigned)txDuration
{
  return self->_txDuration;
}

- (unsigned)numPacketsReceived
{
  return self->_numPacketsReceived;
}

- (unsigned)numPacketsTransmitted
{
  return self->_numPacketsTransmitted;
}

- (unsigned)sleepCount
{
  return self->_sleepCount;
}

- (unsigned)wakeCount
{
  return self->_wakeCount;
}

- (unsigned)pmgrSleepCount
{
  return self->_pmgrSleepCount;
}

- (unsigned)pmgrDeepSleepCount
{
  return self->_pmgrDeepSleepCount;
}

- (unsigned)deepSleepDuration
{
  return self->_deepSleepDuration;
}

@end
