@implementation WiFiUsageSessionLQM

- (void)setAvgTxFramesPerSecond:(unint64_t)a3
{
  self->_avgTxFramesPerSecond = a3;
}

- (void)setAvgTotalCca:(int64_t)a3
{
  self->_avgTotalCca = a3;
}

- (void)setAvgSelfCca:(int64_t)a3
{
  self->_avgSelfCca = a3;
}

- (void)setAvgRxFramesPerSecond:(unint64_t)a3
{
  self->_avgRxFramesPerSecond = a3;
}

- (void)setAvgRssi:(int64_t)a3
{
  self->_avgRssi = a3;
}

- (void)setAvgOtherCca:(int64_t)a3
{
  self->_avgOtherCca = a3;
}

- (void)setAvgInterference:(int64_t)a3
{
  self->_avgInterference = a3;
}

- (void)setAvgBeaconPer:(int64_t)a3
{
  self->_avgBeaconPer = a3;
}

- (unint64_t)avgTxFramesPerSecond
{
  return self->_avgTxFramesPerSecond;
}

- (int64_t)avgTotalCca
{
  return self->_avgTotalCca;
}

- (int64_t)avgSelfCca
{
  return self->_avgSelfCca;
}

- (unint64_t)avgRxFramesPerSecond
{
  return self->_avgRxFramesPerSecond;
}

- (int64_t)avgRssi
{
  return self->_avgRssi;
}

- (int64_t)avgOtherCca
{
  return self->_avgOtherCca;
}

- (int64_t)avgInterference
{
  return self->_avgInterference;
}

- (int64_t)avgBeaconPer
{
  return self->_avgBeaconPer;
}

- (void)setAvgTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_avgTxRetriesOverTxFrames = a3;
}

- (void)setAvgTxRate:(unint64_t)a3
{
  self->_avgTxRate = a3;
}

- (void)setAvgTxFailsOverTxFrames:(unint64_t)a3
{
  self->_avgTxFailsOverTxFrames = a3;
}

- (void)setAvgTxBytesOverTxFrames:(unint64_t)a3
{
  self->_avgTxBytesOverTxFrames = a3;
}

- (void)setAvgSnr:(int64_t)a3
{
  self->_avgSnr = a3;
}

- (void)setAvgRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_avgRxRetriesOverRxFrames = a3;
}

- (void)setAvgRxRate:(unint64_t)a3
{
  self->_avgRxRate = a3;
}

- (void)setAvgRxBytesOverRxFrames:(unint64_t)a3
{
  self->_avgRxBytesOverRxFrames = a3;
}

- (void)setAvgNoise:(int64_t)a3
{
  self->_avgNoise = a3;
}

- (unint64_t)avgTxRetriesOverTxFrames
{
  return self->_avgTxRetriesOverTxFrames;
}

- (unint64_t)avgTxRate
{
  return self->_avgTxRate;
}

- (unint64_t)avgTxFailsOverTxFrames
{
  return self->_avgTxFailsOverTxFrames;
}

- (unint64_t)avgTxBytesOverTxFrames
{
  return self->_avgTxBytesOverTxFrames;
}

- (int64_t)avgSnr
{
  return self->_avgSnr;
}

- (unint64_t)avgRxRetriesOverRxFrames
{
  return self->_avgRxRetriesOverRxFrames;
}

- (unint64_t)avgRxRate
{
  return self->_avgRxRate;
}

- (unint64_t)avgRxBytesOverRxFrames
{
  return self->_avgRxBytesOverRxFrames;
}

- (int64_t)avgNoise
{
  return self->_avgNoise;
}

- (void)reset
{
  NSDate *lastUpdatedTime;
  NSDate *initializationTime;

  self->_minRssi = 0x7FFFFFFFFFFFFFFFLL;
  *(_OWORD *)&self->_avgRssi = 0u;
  *(_OWORD *)&self->_rssiGt40 = 0u;
  *(_OWORD *)&self->_rssi50to60 = 0u;
  *(_OWORD *)&self->_rssi65to70 = 0u;
  *(_OWORD *)&self->_rssi75to80 = 0u;
  *(_OWORD *)&self->_rssi85to90 = 0u;
  *(_OWORD *)&self->_count_of_LQMsamples = xmmword_1CC50EAE0;
  self->_sum_of_RSSI = 0;
  *(_OWORD *)&self->_sum_of_core0rssiDiff = 0u;
  *(_OWORD *)&self->_maxNoise = xmmword_1CC50EAF0;
  *(_OWORD *)&self->_avgNoise = 0u;
  *(_OWORD *)&self->_minSnr = xmmword_1CC50EB00;
  *(_OWORD *)&self->_maxBeaconPer = xmmword_1CC50EB10;
  *(_OWORD *)&self->_avgBeaconPer = 0u;
  *(_OWORD *)&self->_minTxRate = xmmword_1CC50EB20;
  self->_maxRxRate = 0;
  *(_OWORD *)&self->_minRxRate = xmmword_1CC50EB20;
  *(_OWORD *)&self->_maxSelfCca = xmmword_1CC50EB10;
  *(_OWORD *)&self->_selfCca60to70 = 0u;
  *(_OWORD *)&self->_selfCca75to80 = 0u;
  *(_OWORD *)&self->_avgSelfCca = 0u;
  *(_OWORD *)&self->_selfCca40to50 = 0u;
  *(_OWORD *)&self->_selfCca85to90 = 0u;
  *(_OWORD *)&self->_maxOtherCca = xmmword_1CC50EB10;
  *(_OWORD *)&self->_otherCca60to70 = 0u;
  *(_OWORD *)&self->_otherCca75to80 = 0u;
  *(_OWORD *)&self->_avgOtherCca = 0u;
  *(_OWORD *)&self->_otherCca40to50 = 0u;
  *(_OWORD *)&self->_otherCca85to90 = 0u;
  *(_OWORD *)&self->_maxInterference = xmmword_1CC50EB10;
  *(_OWORD *)&self->_interference60to70 = 0u;
  *(_OWORD *)&self->_interference75to80 = 0u;
  *(_OWORD *)&self->_avgInterference = 0u;
  *(_OWORD *)&self->_interference40to50 = 0u;
  *(_OWORD *)&self->_interference85to90 = 0u;
  *(_OWORD *)&self->_maxTotalCca = xmmword_1CC50EB10;
  *(_OWORD *)&self->_totalCca60to70 = 0u;
  *(_OWORD *)&self->_totalCca75to80 = 0u;
  *(_OWORD *)&self->_avgTotalCca = 0u;
  *(_OWORD *)&self->_totalCca40to50 = 0u;
  *(_OWORD *)&self->_totalCca85to90 = 0u;
  *(_OWORD *)&self->_avgTxBytesOverTxFrames = xmmword_1CC50EB30;
  *(_OWORD *)&self->_maxTxBytesOverTxFrames = 0u;
  *(_OWORD *)&self->_minRxBytesOverRxFrames = xmmword_1CC50EB20;
  *(_OWORD *)&self->_totalTxFrames = 0u;
  *(_OWORD *)&self->_minTxFramesPerSecond = xmmword_1CC50EB20;
  *(_OWORD *)&self->_totalRxFrames = 0u;
  *(_OWORD *)&self->_minRxFramesPerSecond = xmmword_1CC50EB20;
  *(_OWORD *)&self->_avgTxFailsOverTxFrames = xmmword_1CC50EB30;
  *(_OWORD *)&self->_maxTxFailsOverTxFrames = 0u;
  *(_OWORD *)&self->_minTxRetriesOverTxFrames = xmmword_1CC50EB20;
  *(_OWORD *)&self->_avgRxRetriesOverRxFrames = xmmword_1CC50EB30;
  self->_maxRxRetriesOverRxFrames = 0;
  self->_minDecodingAttemptsPerSecond = -1;
  self->_maxDecodingAttemptsPerSecond = 0;
  *(_OWORD *)&self->_totalDecodingAttempts = 0u;
  self->_minRxBadFcsPerSecond = -1;
  self->_maxRxBadFcsPerSecond = 0;
  *(_OWORD *)&self->_totalRxBadFcs = 0u;
  self->_minRxStartPortion = -1;
  self->_maxRxStartPortion = 0;
  *(_OWORD *)&self->_totalRxStartPortion = 0u;
  lastUpdatedTime = self->_lastUpdatedTime;
  self->_lastUpdatedTime = 0;

  initializationTime = self->_initializationTime;
  self->_initializationTime = 0;

}

- (void)updateLinkQuality:(id)a3 forSession:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSDate *lastUpdatedTime;
  double v9;
  double v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  id v44;

  v44 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  lastUpdatedTime = self->_lastUpdatedTime;
  if (!lastUpdatedTime)
    lastUpdatedTime = self->_initializationTime;
  objc_msgSend(v6, "timeIntervalSinceDate:", lastUpdatedTime);
  v10 = v9;
  if (!self->_initializationTime)
    -[WiFiUsageSessionLQM setInitializationTime:](self, "setInitializationTime:", v7);
  if (!self->_lastUpdatedTime || v10 >= 1.0)
  {
    -[WiFiUsageSessionLQM setLastUpdatedTime:](self, "setLastUpdatedTime:", v7);
    ++self->_count_of_LQMsamples;
    v11 = objc_msgSend(v44, "rssi");
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      if ((uint64_t)v11 <= -41)
      {
        if (v11 <= 0xFFFFFFFFFFFFFFCDLL)
        {
          if (v11 <= 0xFFFFFFFFFFFFFFC3)
          {
            if (v11 <= 0xFFFFFFFFFFFFFFBELL)
            {
              if (v11 <= 0xFFFFFFFFFFFFFFB9)
              {
                if (v11 <= 0xFFFFFFFFFFFFFFB4)
                {
                  if (v11 <= 0xFFFFFFFFFFFFFFAFLL)
                  {
                    if (v11 <= 0xFFFFFFFFFFFFFFAALL)
                    {
                      v13 = 120;
                      if (v11 > 0xFFFFFFFFFFFFFFA5)
                        v13 = 112;
                    }
                    else
                    {
                      v13 = 104;
                    }
                  }
                  else
                  {
                    v13 = 96;
                  }
                }
                else
                {
                  v13 = 88;
                }
              }
              else
              {
                v13 = 80;
              }
            }
            else
            {
              v13 = 72;
            }
          }
          else
          {
            v13 = 64;
          }
        }
        else
        {
          v13 = 56;
        }
      }
      else
      {
        v13 = 48;
      }
      *(Class *)((char *)&self->super.isa + v13) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v13));
      if ((int64_t)v11 > self->_maxRssi)
        self->_maxRssi = v11;
      if ((int64_t)v11 < self->_minRssi)
        self->_minRssi = v11;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("Rssi"), v11, a4);
      self->_lastRssi = v12;
      self->_sum_of_RSSI += v12;
      if (objc_msgSend(v44, "rssi_core0") != 0x7FFFFFFFFFFFFFFFLL)
      {
        ++self->_count_of_core0Samples;
        self->_sum_of_core0rssiDiff += v12 - objc_msgSend(v44, "rssi_core0");
      }
      if (objc_msgSend(v44, "rssi_core1") != 0x7FFFFFFFFFFFFFFFLL)
      {
        ++self->_count_of_core1Samples;
        self->_sum_of_core1rssiDiff += v12 - objc_msgSend(v44, "rssi_core1");
      }
    }
    v14 = objc_msgSend(v44, "noise");
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v14 > self->_maxNoise)
        self->_maxNoise = v14;
      if (v14 < self->_minNoise)
        self->_minNoise = v14;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("Noise"), v14, a4);
    }
    v15 = objc_msgSend(v44, "snr");
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 > self->_maxSnr)
        self->_maxSnr = v15;
      if (v15 < self->_minSnr)
        self->_minSnr = v15;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("Snr"), v15, a4);
    }
    v16 = objc_msgSend(v44, "beaconPer");
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 > self->_maxBeaconPer)
        self->_maxBeaconPer = v16;
      if (v16 < self->_minBeaconPer)
        self->_minBeaconPer = v16;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("BeaconPer"), v16, a4);
    }
    v17 = objc_msgSend(v44, "selfCca");
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v17 >= 40)
      {
        if (v17 >= 0x32)
        {
          if (v17 >= 0x3C)
          {
            if (v17 >= 0x46)
            {
              if (v17 >= 0x4B)
              {
                if (v17 >= 0x50)
                {
                  if (v17 >= 0x55)
                  {
                    v18 = 376;
                    if (v17 < 0x5A)
                      v18 = 368;
                  }
                  else
                  {
                    v18 = 360;
                  }
                }
                else
                {
                  v18 = 352;
                }
              }
              else
              {
                v18 = 344;
              }
            }
            else
            {
              v18 = 336;
            }
          }
          else
          {
            v18 = 328;
          }
        }
        else
        {
          v18 = 320;
        }
      }
      else
      {
        v18 = 312;
      }
      *(Class *)((char *)&self->super.isa + v18) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v18));
      if ((int64_t)v17 > self->_maxSelfCca)
        self->_maxSelfCca = v17;
      if ((int64_t)v17 < self->_minSelfCca)
        self->_minSelfCca = v17;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("SelfCca"), v17, a4);
    }
    v19 = objc_msgSend(v44, "otherCca");
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v19 >= 40)
      {
        if (v19 >= 0x32)
        {
          if (v19 >= 0x3C)
          {
            if (v19 >= 0x46)
            {
              if (v19 >= 0x4B)
              {
                if (v19 >= 0x50)
                {
                  if (v19 >= 0x55)
                  {
                    v20 = 472;
                    if (v19 < 0x5A)
                      v20 = 464;
                  }
                  else
                  {
                    v20 = 456;
                  }
                }
                else
                {
                  v20 = 448;
                }
              }
              else
              {
                v20 = 440;
              }
            }
            else
            {
              v20 = 432;
            }
          }
          else
          {
            v20 = 424;
          }
        }
        else
        {
          v20 = 416;
        }
      }
      else
      {
        v20 = 408;
      }
      *(Class *)((char *)&self->super.isa + v20) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v20));
      if ((int64_t)v19 > self->_maxOtherCca)
        self->_maxOtherCca = v19;
      if ((int64_t)v19 < self->_minOtherCca)
        self->_minOtherCca = v19;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("OtherCca"), v19, a4);
    }
    v21 = objc_msgSend(v44, "interference");
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v21 >= 40)
      {
        if (v21 >= 0x32)
        {
          if (v21 >= 0x3C)
          {
            if (v21 >= 0x46)
            {
              if (v21 >= 0x4B)
              {
                if (v21 >= 0x50)
                {
                  if (v21 >= 0x55)
                  {
                    v22 = 568;
                    if (v21 < 0x5A)
                      v22 = 560;
                  }
                  else
                  {
                    v22 = 552;
                  }
                }
                else
                {
                  v22 = 544;
                }
              }
              else
              {
                v22 = 536;
              }
            }
            else
            {
              v22 = 528;
            }
          }
          else
          {
            v22 = 520;
          }
        }
        else
        {
          v22 = 512;
        }
      }
      else
      {
        v22 = 504;
      }
      *(Class *)((char *)&self->super.isa + v22) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v22));
      if ((int64_t)v21 > self->_maxInterference)
        self->_maxInterference = v21;
      if ((int64_t)v21 < self->_minInterference)
        self->_minInterference = v21;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("Interference"), v21, a4);
    }
    v23 = objc_msgSend(v44, "totalReportedCca");
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v23 >= 40)
      {
        if (v23 >= 0x32)
        {
          if (v23 >= 0x3C)
          {
            if (v23 >= 0x46)
            {
              if (v23 >= 0x4B)
              {
                if (v23 >= 0x50)
                {
                  if (v23 >= 0x55)
                  {
                    v24 = 664;
                    if (v23 < 0x5A)
                      v24 = 656;
                  }
                  else
                  {
                    v24 = 648;
                  }
                }
                else
                {
                  v24 = 640;
                }
              }
              else
              {
                v24 = 632;
              }
            }
            else
            {
              v24 = 624;
            }
          }
          else
          {
            v24 = 616;
          }
        }
        else
        {
          v24 = 608;
        }
      }
      else
      {
        v24 = 600;
      }
      *(Class *)((char *)&self->super.isa + v24) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v24));
      if ((int64_t)v23 > self->_maxTotalCca)
        self->_maxTotalCca = v23;
      if ((int64_t)v23 < self->_minTotalCca)
        self->_minTotalCca = v23;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("TotalCca"), v23, a4);
    }
    v25 = objc_msgSend(v44, "txBytesOverTxFrames");
    v26 = v25;
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v25 < self->_minTxBytesOverTxFrames)
        self->_minTxBytesOverTxFrames = v25;
      if (v25 > self->_maxTxBytesOverTxFrames)
        self->_maxTxBytesOverTxFrames = v25;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("TxBytesOverTxFrames"), v25, a4);
    }
    v27 = objc_msgSend(v44, "rxBytesOverRxFrames");
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v27 < self->_minRxBytesOverRxFrames)
        self->_minRxBytesOverRxFrames = v27;
      if (v27 > self->_maxRxBytesOverRxFrames)
        self->_maxRxBytesOverRxFrames = v27;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("RxBytesOverRxFrames"), v26, a4);
    }
    v28 = objc_msgSend(v44, "txFrames");
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = v28;
      v30 = (unint64_t)((double)v28 / v10);
      if (self->_minTxFramesPerSecond > v30)
        self->_minTxFramesPerSecond = v30;
      if (self->_maxTxFramesPerSecond < v30)
        self->_maxTxFramesPerSecond = v30;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("TxFramesPerSecond"));
      self->_totalTxFrames += v29;
    }
    v31 = objc_msgSend(v44, "rxFrames");
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v31;
      v33 = (unint64_t)((double)v31 / v10);
      if (self->_minRxFramesPerSecond > v33)
        self->_minRxFramesPerSecond = v33;
      if (self->_maxRxFramesPerSecond < v33)
        self->_maxRxFramesPerSecond = v33;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("RxFramesPerSecond"));
      self->_totalRxFrames += v32;
    }
    v34 = objc_msgSend(v44, "txFailsOverTxFrames");
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v34 < self->_minTxFailsOverTxFrames)
        self->_minTxFailsOverTxFrames = v34;
      if (v34 > self->_maxTxFailsOverTxFrames)
        self->_maxTxFailsOverTxFrames = v34;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("TxFailsOverTxFrames"), v34, a4);
    }
    v35 = objc_msgSend(v44, "txRetriesOverTxFrames");
    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v35 < self->_minTxRetriesOverTxFrames)
        self->_minTxRetriesOverTxFrames = v35;
      if (v35 > self->_maxTxRetriesOverTxFrames)
        self->_maxTxRetriesOverTxFrames = v35;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("TxRetriesOverTxFrames"), v35, a4);
    }
    v36 = objc_msgSend(v44, "rxRetriesOverRxFrames");
    if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v36 < self->_minRxRetriesOverRxFrames)
        self->_minRxRetriesOverRxFrames = v36;
      if (v36 > self->_maxRxRetriesOverRxFrames)
        self->_maxRxRetriesOverRxFrames = v36;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("RxRetriesOverRxFrames"), v36, a4);
    }
    v37 = objc_msgSend(v44, "decodingAttempts");
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = v37;
      v39 = (unint64_t)((double)v37 / v10);
      if (self->_minDecodingAttemptsPerSecond > v39)
        self->_minDecodingAttemptsPerSecond = v39;
      if (self->_maxDecodingAttemptsPerSecond < v39)
        self->_maxDecodingAttemptsPerSecond = v39;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("DecodingAttemptsPerSecond"));
      self->_totalDecodingAttempts += v38;
    }
    v40 = objc_msgSend(v44, "rxStartOverDecodingAttemptsPercentage");
    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = v40;
      if (v40 < self->_minRxStartPortion)
        self->_minRxStartPortion = v40;
      if (v40 > self->_maxRxStartPortion)
        self->_maxRxStartPortion = v40;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("RxStartPortion"), v40, a4);
      self->_totalRxStartPortion += v41;
    }
    v42 = objc_msgSend(v44, "txRate");
    if (v42 && v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v42 > self->_maxTxRate)
        self->_maxTxRate = v42;
      if (v42 < self->_minTxRate)
        self->_minTxRate = v42;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("TxRate"), v42, a4);
    }
    v43 = objc_msgSend(v44, "rxRate");
    if (v43 && v43 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v43 > self->_maxRxRate)
        self->_maxRxRate = v43;
      if (v43 < self->_minRxRate)
        self->_minRxRate = v43;
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", CFSTR("RxRate"), v43, a4);
    }
  }

}

- (void)updateAverageOf:(id)a3 with:(int64_t)a4 forSession:(unint64_t)a5
{
  void *v8;
  uint64_t v9;
  int64_t count_of_LQMsamples;
  double v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("avg%@"), a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSessionLQM valueForKey:](self, "valueForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9)
  {
    count_of_LQMsamples = self->_count_of_LQMsamples;
    if (count_of_LQMsamples >= 2)
    {
      if (a5 <= 9)
      {
        if (((1 << a5) & 0x2C2) != 0)
        {
          v11 = ((double)a4 + (double)(count_of_LQMsamples - 1) * (double)v9) / (double)count_of_LQMsamples;
LABEL_8:
          a4 = (uint64_t)v11;
          goto LABEL_9;
        }
        if (((1 << a5) & 0x38) != 0)
        {
          v11 = (double)(v9 + a4) * 0.5;
          goto LABEL_8;
        }
      }
      NSLog(CFSTR("%s - Unexpected: we don't know how to average for sessionType:%lu"), "-[WiFiUsageSessionLQM updateAverageOf:with:forSession:]", a5);
      a4 = 0;
    }
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSessionLQM setValue:forKey:](self, "setValue:forKey:", v12, v13);

}

- (void)setLastUpdatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedTime, a3);
}

- (void)setInitializationTime:(id)a3
{
  objc_storeStrong((id *)&self->_initializationTime, a3);
}

- (WiFiUsageSessionLQM)initWithLQMSample:(id)a3 forInterface:(id)a4
{
  id v6;
  void *v7;
  WiFiUsageSessionLQM *v8;
  objc_super v10;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)WiFiUsageSessionLQM;
    v8 = -[WiFiUsageSessionLQM init](&v10, sel_init);
    -[WiFiUsageSessionLQM reset](v8, "reset");
    -[WiFiUsageSessionLQM setInitializationTime:](v8, "setInitializationTime:", v7);
    -[WiFiUsageSessionLQM updateLinkQuality:forSession:](v8, "updateLinkQuality:forSession:", v6, 1);
    self = v8;

    a4 = self;
  }
  else
  {
    NSLog(CFSTR("%s - Cannot create Session (invalid interfaceName: %@)"), "-[WiFiUsageSessionLQM initWithLQMSample:forInterface:]", 0);
  }

  return (WiFiUsageSessionLQM *)a4;
}

- (id)eventDictionary:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    +[WiFiUsagePrivacyFilter localTimestamp:](WiFiUsagePrivacyFilter, "localTimestamp:", self->_initializationTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("LqmSessionStartTime"));

    +[WiFiUsagePrivacyFilter localTimestamp:](WiFiUsagePrivacyFilter, "localTimestamp:", self->_lastUpdatedTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("LqmSessionLastUpdatedTime"));

  }
  -[NSDate timeIntervalSinceDate:](self->_lastUpdatedTime, "timeIntervalSinceDate:", self->_initializationTime);
  v9 = v8;
  NSLog(CFSTR("%s - totalDuration:%.2f"), "-[WiFiUsageSessionLQM eventDictionary:]", *(_QWORD *)&v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxRssi);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LqmRssiMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minRssi);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("LqmRssiMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgRssi);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("LqmRssiAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastRssi);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("LqmRssiLast"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssiGt40, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("LqmRssiGt40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi40to50, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("LqmRssi40to50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi50to60, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("LqmRssi50to60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi60to65, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("LqmRssi60to65Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi65to70, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("LqmRssi65to70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi70to75, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("LqmRssi70to75Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi75to80, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("LqmRssi75to80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi80to85, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("LqmRssi80to85Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssi85to90, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("LqmRssi85to90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_rssiLt90, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("LqmRssiLt90Duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count_of_LQMsamples);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("LqmCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sum_of_RSSI);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("LqmRssi_SumOf"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count_of_core0Samples);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("LqmRssiCore0Count"));

  if (self->_count_of_core0Samples >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sum_of_core0rssiDiff);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("LqmRssiCore0Diff_SumOf"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count_of_core1Samples);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("LqmRssiCore1Count"));

  if (self->_count_of_core1Samples >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sum_of_core1rssiDiff);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("LqmRssiCore1Diff_SumOf"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxNoise);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("LqmNoiseMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minNoise);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("LqmNoiseMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgNoise);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("LqmNoiseAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxSnr);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("LqmSnrMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minSnr);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("LqmSnrMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgSnr);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("LqmSnrAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxSelfCca);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("LqmCcaSelfMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minSelfCca);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("LqmCcaSelfMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgSelfCca);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("LqmCcaSelfAvg"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCcaLt40, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("LqmCcaSelfLt40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca40to50, v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("LqmCcaSelf40to50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca50to60, v9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("LqmCcaSelf50to60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca60to70, v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("LqmCcaSelf60to70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca70to75, v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("LqmCcaSelf70to75Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca75to80, v9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("LqmCcaSelf75to80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca80to85, v9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("LqmCcaSelf80to85Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCca85to90, v9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("LqmCcaSelf85to90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_selfCcaGt90, v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("LqmCcaSelfGt90Duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxOtherCca);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("LqmCcaOtherMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minOtherCca);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("LqmCcaOtherMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgOtherCca);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("LqmCcaOtherAvg"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCcaLt40, v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("LqmCcaOtherLt40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca40to50, v9);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, CFSTR("LqmCcaOther40to50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca50to60, v9);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("LqmCcaOther50to60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca60to70, v9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("LqmCcaOther60to70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca70to75, v9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("LqmCcaOther70to75Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca75to80, v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("LqmCcaOther75to80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca80to85, v9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("LqmCcaOther80to85Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCca85to90, v9);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("LqmCcaOther85to90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_otherCcaGt90, v9);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v59, CFSTR("LqmCcaOtherGt90Duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxInterference);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, CFSTR("LqmInterferenceMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minInterference);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("LqmInterferenceMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgInterference);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v62, CFSTR("LqmInterferenceAvg"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interferenceLt40, v9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("LqmInterferenceLt40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference40to50, v9);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("LqmInterference40to50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference50to60, v9);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("LqmInterference50to60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference60to70, v9);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v66, CFSTR("LqmInterference60to70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference70to75, v9);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("LqmInterference70to75Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference75to80, v9);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v68, CFSTR("LqmInterference75to80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference80to85, v9);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("LqmInterference80to85Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interference85to90, v9);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("LqmInterference85to90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_interferenceGt90, v9);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v71, CFSTR("LqmInterferenceGt90Duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxTotalCca);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v72, CFSTR("LqmCcaTotalMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minTotalCca);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("LqmCcaTotalMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgTotalCca);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v74, CFSTR("LqmCcaTotalAvg"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCcaLt40, v9);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v75, CFSTR("LqmCcaTotalLt40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca40to50, v9);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v76, CFSTR("LqmCcaTotal40to50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca50to60, v9);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v77, CFSTR("LqmCcaTotal50to60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca60to70, v9);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v78, CFSTR("LqmCcaTotal60to70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca70to75, v9);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v79, CFSTR("LqmCcaTotal70to75Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca75to80, v9);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, CFSTR("LqmCcaTotal75to80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca80to85, v9);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v81, CFSTR("LqmCcaTotal80to85Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCca85to90, v9);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("LqmCcaTotal85to90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", (double)self->_totalCcaGt90, v9);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v83, CFSTR("LqmCcaTotalGt90Duration"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_avgTxBytesOverTxFrames);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v84, CFSTR("LqmTxBytesOverTxFramesAvg"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_minTxBytesOverTxFrames);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v85, CFSTR("LqmTxBytesOverTxFramesMin"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_maxTxBytesOverTxFrames);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, CFSTR("LqmTxBytesOverTxFramesMax"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_avgRxBytesOverRxFrames);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v87, CFSTR("LqmRxBytesOverRxFramesAvg"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_minRxBytesOverRxFrames);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, CFSTR("LqmRxBytesOverRxFramesMin"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_maxRxBytesOverRxFrames);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v89, CFSTR("LqmRxBytesOverRxFramesMax"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_totalTxFrames);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v90, CFSTR("LqmTxFramesTotal"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_avgTxFramesPerSecond);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v91, CFSTR("LqmTxFramesPerSecondAvg"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_minTxFramesPerSecond);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v92, CFSTR("LqmTxFramesPerSecondMin"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_maxTxFramesPerSecond);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v93, CFSTR("LqmTxFramesPerSecondMax"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_totalRxFrames);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v94, CFSTR("LqmRxFramesTotal"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_avgRxFramesPerSecond);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v95, CFSTR("LqmRxFramesPerSecondAvg"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_minRxFramesPerSecond);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v96, CFSTR("LqmRxFramesPerSecondMin"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_maxRxFramesPerSecond);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v97, CFSTR("LqmRxFramesPerSecondMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgTxFailsOverTxFrames);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v98, CFSTR("LqmcurrentTxFailsOverTxFramesAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minTxFailsOverTxFrames);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v99, CFSTR("LqmcurrentTxFailsOverTxFramesMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxTxFailsOverTxFrames);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v100, CFSTR("LqmcurrentTxFailsOverTxFramesMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgTxRetriesOverTxFrames);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v101, CFSTR("LqmcurrentTxRetriesOverTxFramesAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minTxRetriesOverTxFrames);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v102, CFSTR("LqmcurrentTxRetriesOverTxFramesMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxTxRetriesOverTxFrames);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v103, CFSTR("LqmcurrentTxRetriesOverTxFramesMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgRxRetriesOverRxFrames);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v104, CFSTR("LqmRxRetriesOverRxFramesAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minRxRetriesOverRxFrames);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v105, CFSTR("LqmRxRetriesOverRxFramesMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxRxRetriesOverRxFrames);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v106, CFSTR("LqmRxRetriesOverRxFramesMax"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_totalDecodingAttempts);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v107, CFSTR("LqmDecodingAttemptsTotal"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_avgDecodingAttemptsPerSecond);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v108, CFSTR("LqmDecodingAttemptsPerSecondAvg"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_minDecodingAttemptsPerSecond);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v109, CFSTR("LqmDecodingAttemptsPerSecondMin"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_maxDecodingAttemptsPerSecond);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v110, CFSTR("LqmDecodingAttemptsPerSecondMax"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_totalRxBadFcs);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v111, CFSTR("LqmRxBadFcsTotal"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_avgRxBadFcsPerSecond);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v112, CFSTR("LqmRxBadFcsPerSecondAvg"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_minRxBadFcsPerSecond);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v113, CFSTR("LqmRxBadFcsPerSecondMin"));

  +[WiFiUsagePrivacyFilter numberWithFrameCount:](WiFiUsagePrivacyFilter, "numberWithFrameCount:", self->_maxRxBadFcsPerSecond);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v114, CFSTR("LqmRxBadFcsPerSecondMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_totalRxStartPortion);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v115, CFSTR("LqmRxStartPortionTotal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgRxStartPortion);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v116, CFSTR("LqmRxStartPortionAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minRxStartPortion);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, CFSTR("LqmRxStartPortionMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxRxStartPortion);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v118, CFSTR("LqmRxStartPortionMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxTxRate);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v119, CFSTR("LqmTxRateMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minTxRate);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v120, CFSTR("LqmTxRateMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgTxRate);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v121, CFSTR("LqmTxRateAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxRxRate);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v122, CFSTR("LqmRxRateMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minRxRate);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v123, CFSTR("LqmRxRateMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgRxRate);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v124, CFSTR("LqmRxRateAvg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxBeaconPer);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v125, CFSTR("LqmBeaconPerMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minBeaconPer);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v126, CFSTR("LqmBeaconPerMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgBeaconPer);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v127, CFSTR("LqmBeaconPerAvg"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setInitializationTime:", self->_initializationTime);
  objc_msgSend(v4, "setLastUpdatedTime:", self->_lastUpdatedTime);
  objc_msgSend(v4, "setMaxRssi:", self->_maxRssi);
  objc_msgSend(v4, "setMinRssi:", self->_minRssi);
  objc_msgSend(v4, "setAvgRssi:", self->_avgRssi);
  objc_msgSend(v4, "setLastRssi:", self->_lastRssi);
  objc_msgSend(v4, "setRssiGt40:", self->_rssiGt40);
  objc_msgSend(v4, "setRssi40to50:", self->_rssi40to50);
  objc_msgSend(v4, "setRssi50to60:", self->_rssi50to60);
  objc_msgSend(v4, "setRssi60to65:", self->_rssi60to65);
  objc_msgSend(v4, "setRssi65to70:", self->_rssi65to70);
  objc_msgSend(v4, "setRssi70to75:", self->_rssi70to75);
  objc_msgSend(v4, "setRssi75to80:", self->_rssi75to80);
  objc_msgSend(v4, "setRssi80to85:", self->_rssi80to85);
  objc_msgSend(v4, "setRssi85to90:", self->_rssi85to90);
  objc_msgSend(v4, "setRssiLt90:", self->_rssiLt90);
  objc_msgSend(v4, "setCount_of_LQMsamples:", self->_count_of_LQMsamples);
  objc_msgSend(v4, "setCount_of_core0Samples:", self->_count_of_core0Samples);
  objc_msgSend(v4, "setCount_of_core1Samples:", self->_count_of_core1Samples);
  objc_msgSend(v4, "setSum_of_RSSI:", self->_sum_of_RSSI);
  objc_msgSend(v4, "setSum_of_core0rssiDiff:", self->_sum_of_core0rssiDiff);
  objc_msgSend(v4, "setSum_of_core1rssiDiff:", self->_sum_of_core1rssiDiff);
  objc_msgSend(v4, "setMaxNoise:", self->_maxNoise);
  objc_msgSend(v4, "setMinNoise:", self->_minNoise);
  objc_msgSend(v4, "setAvgNoise:", self->_avgNoise);
  objc_msgSend(v4, "setMaxSnr:", self->_maxSnr);
  objc_msgSend(v4, "setMinSnr:", self->_minSnr);
  objc_msgSend(v4, "setAvgSnr:", self->_avgSnr);
  objc_msgSend(v4, "setMaxBeaconPer:", self->_maxBeaconPer);
  objc_msgSend(v4, "setMinBeaconPer:", self->_minBeaconPer);
  objc_msgSend(v4, "setAvgBeaconPer:", self->_avgBeaconPer);
  objc_msgSend(v4, "setMaxTxRate:", self->_maxTxRate);
  objc_msgSend(v4, "setMinTxRate:", self->_minTxRate);
  objc_msgSend(v4, "setAvgTxRate:", self->_avgTxRate);
  objc_msgSend(v4, "setMaxRxRate:", self->_maxRxRate);
  objc_msgSend(v4, "setMinRxRate:", self->_minRxRate);
  objc_msgSend(v4, "setAvgRxRate:", self->_avgRxRate);
  objc_msgSend(v4, "setMaxSelfCca:", self->_maxSelfCca);
  objc_msgSend(v4, "setMinSelfCca:", self->_minSelfCca);
  objc_msgSend(v4, "setAvgSelfCca:", self->_avgSelfCca);
  objc_msgSend(v4, "setSelfCcaLt40:", self->_selfCcaLt40);
  objc_msgSend(v4, "setSelfCca40to50:", self->_selfCca40to50);
  objc_msgSend(v4, "setSelfCca50to60:", self->_selfCca50to60);
  objc_msgSend(v4, "setSelfCca60to70:", self->_selfCca60to70);
  objc_msgSend(v4, "setSelfCca70to75:", self->_selfCca70to75);
  objc_msgSend(v4, "setSelfCca75to80:", self->_selfCca75to80);
  objc_msgSend(v4, "setSelfCca80to85:", self->_selfCca80to85);
  objc_msgSend(v4, "setSelfCca85to90:", self->_selfCca85to90);
  objc_msgSend(v4, "setSelfCcaGt90:", self->_selfCcaGt90);
  objc_msgSend(v4, "setMaxOtherCca:", self->_maxOtherCca);
  objc_msgSend(v4, "setMinOtherCca:", self->_minOtherCca);
  objc_msgSend(v4, "setAvgOtherCca:", self->_avgOtherCca);
  objc_msgSend(v4, "setOtherCcaLt40:", self->_otherCcaLt40);
  objc_msgSend(v4, "setOtherCca40to50:", self->_otherCca40to50);
  objc_msgSend(v4, "setOtherCca50to60:", self->_otherCca50to60);
  objc_msgSend(v4, "setOtherCca60to70:", self->_otherCca60to70);
  objc_msgSend(v4, "setOtherCca70to75:", self->_otherCca70to75);
  objc_msgSend(v4, "setOtherCca75to80:", self->_otherCca75to80);
  objc_msgSend(v4, "setOtherCca80to85:", self->_otherCca80to85);
  objc_msgSend(v4, "setOtherCca85to90:", self->_otherCca85to90);
  objc_msgSend(v4, "setOtherCcaGt90:", self->_otherCcaGt90);
  objc_msgSend(v4, "setMaxInterference:", self->_maxInterference);
  objc_msgSend(v4, "setMinInterference:", self->_minInterference);
  objc_msgSend(v4, "setAvgInterference:", self->_avgInterference);
  objc_msgSend(v4, "setInterferenceLt40:", self->_interferenceLt40);
  objc_msgSend(v4, "setInterference40to50:", self->_interference40to50);
  objc_msgSend(v4, "setInterference50to60:", self->_interference50to60);
  objc_msgSend(v4, "setInterference60to70:", self->_interference60to70);
  objc_msgSend(v4, "setInterference70to75:", self->_interference70to75);
  objc_msgSend(v4, "setInterference75to80:", self->_interference75to80);
  objc_msgSend(v4, "setInterference80to85:", self->_interference80to85);
  objc_msgSend(v4, "setInterference85to90:", self->_interference85to90);
  objc_msgSend(v4, "setInterferenceGt90:", self->_interferenceGt90);
  objc_msgSend(v4, "setMaxTotalCca:", self->_maxTotalCca);
  objc_msgSend(v4, "setMinTotalCca:", self->_minTotalCca);
  objc_msgSend(v4, "setAvgTotalCca:", self->_avgTotalCca);
  objc_msgSend(v4, "setTotalCcaLt40:", self->_totalCcaLt40);
  objc_msgSend(v4, "setTotalCca40to50:", self->_totalCca40to50);
  objc_msgSend(v4, "setTotalCca50to60:", self->_totalCca50to60);
  objc_msgSend(v4, "setTotalCca60to70:", self->_totalCca60to70);
  objc_msgSend(v4, "setTotalCca70to75:", self->_totalCca70to75);
  objc_msgSend(v4, "setTotalCca75to80:", self->_totalCca75to80);
  objc_msgSend(v4, "setTotalCca80to85:", self->_totalCca80to85);
  objc_msgSend(v4, "setTotalCca85to90:", self->_totalCca85to90);
  objc_msgSend(v4, "setTotalCcaGt90:", self->_totalCcaGt90);
  objc_msgSend(v4, "setAvgTxBytesOverTxFrames:", self->_avgTxBytesOverTxFrames);
  objc_msgSend(v4, "setMinTxBytesOverTxFrames:", self->_minTxBytesOverTxFrames);
  objc_msgSend(v4, "setMaxTxBytesOverTxFrames:", self->_maxTxBytesOverTxFrames);
  objc_msgSend(v4, "setAvgRxBytesOverRxFrames:", self->_avgRxBytesOverRxFrames);
  objc_msgSend(v4, "setMinRxBytesOverRxFrames:", self->_minRxBytesOverRxFrames);
  objc_msgSend(v4, "setMaxRxBytesOverRxFrames:", self->_maxRxBytesOverRxFrames);
  objc_msgSend(v4, "setTotalTxFrames:", self->_totalTxFrames);
  objc_msgSend(v4, "setAvgTxFramesPerSecond:", self->_avgTxFramesPerSecond);
  objc_msgSend(v4, "setMinTxFramesPerSecond:", self->_minTxFramesPerSecond);
  objc_msgSend(v4, "setMaxTxFramesPerSecond:", self->_maxTxFramesPerSecond);
  objc_msgSend(v4, "setTotalRxFrames:", self->_totalRxFrames);
  objc_msgSend(v4, "setAvgRxFramesPerSecond:", self->_avgRxFramesPerSecond);
  objc_msgSend(v4, "setMinRxFramesPerSecond:", self->_minRxFramesPerSecond);
  objc_msgSend(v4, "setMaxRxFramesPerSecond:", self->_maxRxFramesPerSecond);
  objc_msgSend(v4, "setAvgTxFailsOverTxFrames:", self->_avgTxFailsOverTxFrames);
  objc_msgSend(v4, "setMinTxFailsOverTxFrames:", self->_minTxFailsOverTxFrames);
  objc_msgSend(v4, "setMaxTxFailsOverTxFrames:", self->_maxTxFailsOverTxFrames);
  objc_msgSend(v4, "setAvgTxRetriesOverTxFrames:", self->_avgTxRetriesOverTxFrames);
  objc_msgSend(v4, "setMinTxRetriesOverTxFrames:", self->_minTxRetriesOverTxFrames);
  objc_msgSend(v4, "setMaxTxRetriesOverTxFrames:", self->_maxTxRetriesOverTxFrames);
  objc_msgSend(v4, "setAvgRxRetriesOverRxFrames:", self->_avgRxRetriesOverRxFrames);
  objc_msgSend(v4, "setMinRxRetriesOverRxFrames:", self->_minRxRetriesOverRxFrames);
  objc_msgSend(v4, "setMaxRxRetriesOverRxFrames:", self->_maxRxRetriesOverRxFrames);
  objc_msgSend(v4, "setTotalDecodingAttempts:", self->_totalDecodingAttempts);
  objc_msgSend(v4, "setAvgDecodingAttemptsPerSecond:", self->_avgDecodingAttemptsPerSecond);
  objc_msgSend(v4, "setMinDecodingAttemptsPerSecond:", self->_minDecodingAttemptsPerSecond);
  objc_msgSend(v4, "setMaxDecodingAttemptsPerSecond:", self->_maxDecodingAttemptsPerSecond);
  objc_msgSend(v4, "setTotalRxBadFcs:", self->_totalRxBadFcs);
  objc_msgSend(v4, "setAvgRxBadFcsPerSecond:", self->_avgRxBadFcsPerSecond);
  objc_msgSend(v4, "setMinRxBadFcsPerSecond:", self->_minRxBadFcsPerSecond);
  objc_msgSend(v4, "setMaxRxBadFcsPerSecond:", self->_maxRxBadFcsPerSecond);
  objc_msgSend(v4, "setTotalRxStartPortion:", self->_totalRxStartPortion);
  objc_msgSend(v4, "setAvgRxStartPortion:", self->_avgRxStartPortion);
  objc_msgSend(v4, "setMinRxStartPortion:", self->_minRxStartPortion);
  objc_msgSend(v4, "setMaxRxStartPortion:", self->_maxRxStartPortion);
  return v4;
}

- (int64_t)count_of_LQMsamples
{
  return self->_count_of_LQMsamples;
}

- (void)setCount_of_LQMsamples:(int64_t)a3
{
  self->_count_of_LQMsamples = a3;
}

- (int64_t)maxRssi
{
  return self->_maxRssi;
}

- (void)setMaxRssi:(int64_t)a3
{
  self->_maxRssi = a3;
}

- (int64_t)minRssi
{
  return self->_minRssi;
}

- (void)setMinRssi:(int64_t)a3
{
  self->_minRssi = a3;
}

- (int64_t)lastRssi
{
  return self->_lastRssi;
}

- (void)setLastRssi:(int64_t)a3
{
  self->_lastRssi = a3;
}

- (int64_t)rssiGt40
{
  return self->_rssiGt40;
}

- (void)setRssiGt40:(int64_t)a3
{
  self->_rssiGt40 = a3;
}

- (int64_t)rssi40to50
{
  return self->_rssi40to50;
}

- (void)setRssi40to50:(int64_t)a3
{
  self->_rssi40to50 = a3;
}

- (int64_t)rssi50to60
{
  return self->_rssi50to60;
}

- (void)setRssi50to60:(int64_t)a3
{
  self->_rssi50to60 = a3;
}

- (int64_t)rssi60to65
{
  return self->_rssi60to65;
}

- (void)setRssi60to65:(int64_t)a3
{
  self->_rssi60to65 = a3;
}

- (int64_t)rssi65to70
{
  return self->_rssi65to70;
}

- (void)setRssi65to70:(int64_t)a3
{
  self->_rssi65to70 = a3;
}

- (int64_t)rssi70to75
{
  return self->_rssi70to75;
}

- (void)setRssi70to75:(int64_t)a3
{
  self->_rssi70to75 = a3;
}

- (int64_t)rssi75to80
{
  return self->_rssi75to80;
}

- (void)setRssi75to80:(int64_t)a3
{
  self->_rssi75to80 = a3;
}

- (int64_t)rssi80to85
{
  return self->_rssi80to85;
}

- (void)setRssi80to85:(int64_t)a3
{
  self->_rssi80to85 = a3;
}

- (int64_t)rssi85to90
{
  return self->_rssi85to90;
}

- (void)setRssi85to90:(int64_t)a3
{
  self->_rssi85to90 = a3;
}

- (int64_t)rssiLt90
{
  return self->_rssiLt90;
}

- (void)setRssiLt90:(int64_t)a3
{
  self->_rssiLt90 = a3;
}

- (int64_t)sum_of_RSSI
{
  return self->_sum_of_RSSI;
}

- (void)setSum_of_RSSI:(int64_t)a3
{
  self->_sum_of_RSSI = a3;
}

- (int64_t)count_of_core0Samples
{
  return self->_count_of_core0Samples;
}

- (void)setCount_of_core0Samples:(int64_t)a3
{
  self->_count_of_core0Samples = a3;
}

- (int64_t)count_of_core1Samples
{
  return self->_count_of_core1Samples;
}

- (void)setCount_of_core1Samples:(int64_t)a3
{
  self->_count_of_core1Samples = a3;
}

- (int64_t)sum_of_core0rssiDiff
{
  return self->_sum_of_core0rssiDiff;
}

- (void)setSum_of_core0rssiDiff:(int64_t)a3
{
  self->_sum_of_core0rssiDiff = a3;
}

- (int64_t)sum_of_core1rssiDiff
{
  return self->_sum_of_core1rssiDiff;
}

- (void)setSum_of_core1rssiDiff:(int64_t)a3
{
  self->_sum_of_core1rssiDiff = a3;
}

- (int64_t)maxNoise
{
  return self->_maxNoise;
}

- (void)setMaxNoise:(int64_t)a3
{
  self->_maxNoise = a3;
}

- (int64_t)minNoise
{
  return self->_minNoise;
}

- (void)setMinNoise:(int64_t)a3
{
  self->_minNoise = a3;
}

- (int64_t)maxSnr
{
  return self->_maxSnr;
}

- (void)setMaxSnr:(int64_t)a3
{
  self->_maxSnr = a3;
}

- (int64_t)minSnr
{
  return self->_minSnr;
}

- (void)setMinSnr:(int64_t)a3
{
  self->_minSnr = a3;
}

- (int64_t)maxBeaconPer
{
  return self->_maxBeaconPer;
}

- (void)setMaxBeaconPer:(int64_t)a3
{
  self->_maxBeaconPer = a3;
}

- (int64_t)minBeaconPer
{
  return self->_minBeaconPer;
}

- (void)setMinBeaconPer:(int64_t)a3
{
  self->_minBeaconPer = a3;
}

- (unint64_t)maxTxRate
{
  return self->_maxTxRate;
}

- (void)setMaxTxRate:(unint64_t)a3
{
  self->_maxTxRate = a3;
}

- (unint64_t)minTxRate
{
  return self->_minTxRate;
}

- (void)setMinTxRate:(unint64_t)a3
{
  self->_minTxRate = a3;
}

- (unint64_t)maxRxRate
{
  return self->_maxRxRate;
}

- (void)setMaxRxRate:(unint64_t)a3
{
  self->_maxRxRate = a3;
}

- (unint64_t)minRxRate
{
  return self->_minRxRate;
}

- (void)setMinRxRate:(unint64_t)a3
{
  self->_minRxRate = a3;
}

- (int64_t)maxSelfCca
{
  return self->_maxSelfCca;
}

- (void)setMaxSelfCca:(int64_t)a3
{
  self->_maxSelfCca = a3;
}

- (int64_t)minSelfCca
{
  return self->_minSelfCca;
}

- (void)setMinSelfCca:(int64_t)a3
{
  self->_minSelfCca = a3;
}

- (int64_t)selfCcaLt40
{
  return self->_selfCcaLt40;
}

- (void)setSelfCcaLt40:(int64_t)a3
{
  self->_selfCcaLt40 = a3;
}

- (int64_t)selfCca40to50
{
  return self->_selfCca40to50;
}

- (void)setSelfCca40to50:(int64_t)a3
{
  self->_selfCca40to50 = a3;
}

- (int64_t)selfCca50to60
{
  return self->_selfCca50to60;
}

- (void)setSelfCca50to60:(int64_t)a3
{
  self->_selfCca50to60 = a3;
}

- (int64_t)selfCca60to70
{
  return self->_selfCca60to70;
}

- (void)setSelfCca60to70:(int64_t)a3
{
  self->_selfCca60to70 = a3;
}

- (int64_t)selfCca70to75
{
  return self->_selfCca70to75;
}

- (void)setSelfCca70to75:(int64_t)a3
{
  self->_selfCca70to75 = a3;
}

- (int64_t)selfCca75to80
{
  return self->_selfCca75to80;
}

- (void)setSelfCca75to80:(int64_t)a3
{
  self->_selfCca75to80 = a3;
}

- (int64_t)selfCca80to85
{
  return self->_selfCca80to85;
}

- (void)setSelfCca80to85:(int64_t)a3
{
  self->_selfCca80to85 = a3;
}

- (int64_t)selfCca85to90
{
  return self->_selfCca85to90;
}

- (void)setSelfCca85to90:(int64_t)a3
{
  self->_selfCca85to90 = a3;
}

- (int64_t)selfCcaGt90
{
  return self->_selfCcaGt90;
}

- (void)setSelfCcaGt90:(int64_t)a3
{
  self->_selfCcaGt90 = a3;
}

- (int64_t)maxOtherCca
{
  return self->_maxOtherCca;
}

- (void)setMaxOtherCca:(int64_t)a3
{
  self->_maxOtherCca = a3;
}

- (int64_t)minOtherCca
{
  return self->_minOtherCca;
}

- (void)setMinOtherCca:(int64_t)a3
{
  self->_minOtherCca = a3;
}

- (int64_t)otherCcaLt40
{
  return self->_otherCcaLt40;
}

- (void)setOtherCcaLt40:(int64_t)a3
{
  self->_otherCcaLt40 = a3;
}

- (int64_t)otherCca40to50
{
  return self->_otherCca40to50;
}

- (void)setOtherCca40to50:(int64_t)a3
{
  self->_otherCca40to50 = a3;
}

- (int64_t)otherCca50to60
{
  return self->_otherCca50to60;
}

- (void)setOtherCca50to60:(int64_t)a3
{
  self->_otherCca50to60 = a3;
}

- (int64_t)otherCca60to70
{
  return self->_otherCca60to70;
}

- (void)setOtherCca60to70:(int64_t)a3
{
  self->_otherCca60to70 = a3;
}

- (int64_t)otherCca70to75
{
  return self->_otherCca70to75;
}

- (void)setOtherCca70to75:(int64_t)a3
{
  self->_otherCca70to75 = a3;
}

- (int64_t)otherCca75to80
{
  return self->_otherCca75to80;
}

- (void)setOtherCca75to80:(int64_t)a3
{
  self->_otherCca75to80 = a3;
}

- (int64_t)otherCca80to85
{
  return self->_otherCca80to85;
}

- (void)setOtherCca80to85:(int64_t)a3
{
  self->_otherCca80to85 = a3;
}

- (int64_t)otherCca85to90
{
  return self->_otherCca85to90;
}

- (void)setOtherCca85to90:(int64_t)a3
{
  self->_otherCca85to90 = a3;
}

- (int64_t)otherCcaGt90
{
  return self->_otherCcaGt90;
}

- (void)setOtherCcaGt90:(int64_t)a3
{
  self->_otherCcaGt90 = a3;
}

- (int64_t)maxInterference
{
  return self->_maxInterference;
}

- (void)setMaxInterference:(int64_t)a3
{
  self->_maxInterference = a3;
}

- (int64_t)minInterference
{
  return self->_minInterference;
}

- (void)setMinInterference:(int64_t)a3
{
  self->_minInterference = a3;
}

- (int64_t)interferenceLt40
{
  return self->_interferenceLt40;
}

- (void)setInterferenceLt40:(int64_t)a3
{
  self->_interferenceLt40 = a3;
}

- (int64_t)interference40to50
{
  return self->_interference40to50;
}

- (void)setInterference40to50:(int64_t)a3
{
  self->_interference40to50 = a3;
}

- (int64_t)interference50to60
{
  return self->_interference50to60;
}

- (void)setInterference50to60:(int64_t)a3
{
  self->_interference50to60 = a3;
}

- (int64_t)interference60to70
{
  return self->_interference60to70;
}

- (void)setInterference60to70:(int64_t)a3
{
  self->_interference60to70 = a3;
}

- (int64_t)interference70to75
{
  return self->_interference70to75;
}

- (void)setInterference70to75:(int64_t)a3
{
  self->_interference70to75 = a3;
}

- (int64_t)interference75to80
{
  return self->_interference75to80;
}

- (void)setInterference75to80:(int64_t)a3
{
  self->_interference75to80 = a3;
}

- (int64_t)interference80to85
{
  return self->_interference80to85;
}

- (void)setInterference80to85:(int64_t)a3
{
  self->_interference80to85 = a3;
}

- (int64_t)interference85to90
{
  return self->_interference85to90;
}

- (void)setInterference85to90:(int64_t)a3
{
  self->_interference85to90 = a3;
}

- (int64_t)interferenceGt90
{
  return self->_interferenceGt90;
}

- (void)setInterferenceGt90:(int64_t)a3
{
  self->_interferenceGt90 = a3;
}

- (int64_t)maxTotalCca
{
  return self->_maxTotalCca;
}

- (void)setMaxTotalCca:(int64_t)a3
{
  self->_maxTotalCca = a3;
}

- (int64_t)minTotalCca
{
  return self->_minTotalCca;
}

- (void)setMinTotalCca:(int64_t)a3
{
  self->_minTotalCca = a3;
}

- (int64_t)totalCcaLt40
{
  return self->_totalCcaLt40;
}

- (void)setTotalCcaLt40:(int64_t)a3
{
  self->_totalCcaLt40 = a3;
}

- (int64_t)totalCca40to50
{
  return self->_totalCca40to50;
}

- (void)setTotalCca40to50:(int64_t)a3
{
  self->_totalCca40to50 = a3;
}

- (int64_t)totalCca50to60
{
  return self->_totalCca50to60;
}

- (void)setTotalCca50to60:(int64_t)a3
{
  self->_totalCca50to60 = a3;
}

- (int64_t)totalCca60to70
{
  return self->_totalCca60to70;
}

- (void)setTotalCca60to70:(int64_t)a3
{
  self->_totalCca60to70 = a3;
}

- (int64_t)totalCca70to75
{
  return self->_totalCca70to75;
}

- (void)setTotalCca70to75:(int64_t)a3
{
  self->_totalCca70to75 = a3;
}

- (int64_t)totalCca75to80
{
  return self->_totalCca75to80;
}

- (void)setTotalCca75to80:(int64_t)a3
{
  self->_totalCca75to80 = a3;
}

- (int64_t)totalCca80to85
{
  return self->_totalCca80to85;
}

- (void)setTotalCca80to85:(int64_t)a3
{
  self->_totalCca80to85 = a3;
}

- (int64_t)totalCca85to90
{
  return self->_totalCca85to90;
}

- (void)setTotalCca85to90:(int64_t)a3
{
  self->_totalCca85to90 = a3;
}

- (int64_t)totalCcaGt90
{
  return self->_totalCcaGt90;
}

- (void)setTotalCcaGt90:(int64_t)a3
{
  self->_totalCcaGt90 = a3;
}

- (unint64_t)minTxBytesOverTxFrames
{
  return self->_minTxBytesOverTxFrames;
}

- (void)setMinTxBytesOverTxFrames:(unint64_t)a3
{
  self->_minTxBytesOverTxFrames = a3;
}

- (unint64_t)maxTxBytesOverTxFrames
{
  return self->_maxTxBytesOverTxFrames;
}

- (void)setMaxTxBytesOverTxFrames:(unint64_t)a3
{
  self->_maxTxBytesOverTxFrames = a3;
}

- (unint64_t)minRxBytesOverRxFrames
{
  return self->_minRxBytesOverRxFrames;
}

- (void)setMinRxBytesOverRxFrames:(unint64_t)a3
{
  self->_minRxBytesOverRxFrames = a3;
}

- (unint64_t)maxRxBytesOverRxFrames
{
  return self->_maxRxBytesOverRxFrames;
}

- (void)setMaxRxBytesOverRxFrames:(unint64_t)a3
{
  self->_maxRxBytesOverRxFrames = a3;
}

- (unint64_t)totalTxFrames
{
  return self->_totalTxFrames;
}

- (void)setTotalTxFrames:(unint64_t)a3
{
  self->_totalTxFrames = a3;
}

- (unint64_t)minTxFramesPerSecond
{
  return self->_minTxFramesPerSecond;
}

- (void)setMinTxFramesPerSecond:(unint64_t)a3
{
  self->_minTxFramesPerSecond = a3;
}

- (unint64_t)maxTxFramesPerSecond
{
  return self->_maxTxFramesPerSecond;
}

- (void)setMaxTxFramesPerSecond:(unint64_t)a3
{
  self->_maxTxFramesPerSecond = a3;
}

- (unint64_t)totalRxFrames
{
  return self->_totalRxFrames;
}

- (void)setTotalRxFrames:(unint64_t)a3
{
  self->_totalRxFrames = a3;
}

- (unint64_t)minRxFramesPerSecond
{
  return self->_minRxFramesPerSecond;
}

- (void)setMinRxFramesPerSecond:(unint64_t)a3
{
  self->_minRxFramesPerSecond = a3;
}

- (unint64_t)maxRxFramesPerSecond
{
  return self->_maxRxFramesPerSecond;
}

- (void)setMaxRxFramesPerSecond:(unint64_t)a3
{
  self->_maxRxFramesPerSecond = a3;
}

- (unint64_t)minTxFailsOverTxFrames
{
  return self->_minTxFailsOverTxFrames;
}

- (void)setMinTxFailsOverTxFrames:(unint64_t)a3
{
  self->_minTxFailsOverTxFrames = a3;
}

- (unint64_t)maxTxFailsOverTxFrames
{
  return self->_maxTxFailsOverTxFrames;
}

- (void)setMaxTxFailsOverTxFrames:(unint64_t)a3
{
  self->_maxTxFailsOverTxFrames = a3;
}

- (unint64_t)minTxRetriesOverTxFrames
{
  return self->_minTxRetriesOverTxFrames;
}

- (void)setMinTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_minTxRetriesOverTxFrames = a3;
}

- (unint64_t)maxTxRetriesOverTxFrames
{
  return self->_maxTxRetriesOverTxFrames;
}

- (void)setMaxTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_maxTxRetriesOverTxFrames = a3;
}

- (unint64_t)minRxRetriesOverRxFrames
{
  return self->_minRxRetriesOverRxFrames;
}

- (void)setMinRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_minRxRetriesOverRxFrames = a3;
}

- (unint64_t)maxRxRetriesOverRxFrames
{
  return self->_maxRxRetriesOverRxFrames;
}

- (void)setMaxRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_maxRxRetriesOverRxFrames = a3;
}

- (unint64_t)totalDecodingAttempts
{
  return self->_totalDecodingAttempts;
}

- (void)setTotalDecodingAttempts:(unint64_t)a3
{
  self->_totalDecodingAttempts = a3;
}

- (unint64_t)avgDecodingAttemptsPerSecond
{
  return self->_avgDecodingAttemptsPerSecond;
}

- (void)setAvgDecodingAttemptsPerSecond:(unint64_t)a3
{
  self->_avgDecodingAttemptsPerSecond = a3;
}

- (unint64_t)minDecodingAttemptsPerSecond
{
  return self->_minDecodingAttemptsPerSecond;
}

- (void)setMinDecodingAttemptsPerSecond:(unint64_t)a3
{
  self->_minDecodingAttemptsPerSecond = a3;
}

- (unint64_t)maxDecodingAttemptsPerSecond
{
  return self->_maxDecodingAttemptsPerSecond;
}

- (void)setMaxDecodingAttemptsPerSecond:(unint64_t)a3
{
  self->_maxDecodingAttemptsPerSecond = a3;
}

- (unint64_t)totalRxBadFcs
{
  return self->_totalRxBadFcs;
}

- (void)setTotalRxBadFcs:(unint64_t)a3
{
  self->_totalRxBadFcs = a3;
}

- (unint64_t)avgRxBadFcsPerSecond
{
  return self->_avgRxBadFcsPerSecond;
}

- (void)setAvgRxBadFcsPerSecond:(unint64_t)a3
{
  self->_avgRxBadFcsPerSecond = a3;
}

- (unint64_t)minRxBadFcsPerSecond
{
  return self->_minRxBadFcsPerSecond;
}

- (void)setMinRxBadFcsPerSecond:(unint64_t)a3
{
  self->_minRxBadFcsPerSecond = a3;
}

- (unint64_t)maxRxBadFcsPerSecond
{
  return self->_maxRxBadFcsPerSecond;
}

- (void)setMaxRxBadFcsPerSecond:(unint64_t)a3
{
  self->_maxRxBadFcsPerSecond = a3;
}

- (unint64_t)totalRxStartPortion
{
  return self->_totalRxStartPortion;
}

- (void)setTotalRxStartPortion:(unint64_t)a3
{
  self->_totalRxStartPortion = a3;
}

- (unint64_t)avgRxStartPortion
{
  return self->_avgRxStartPortion;
}

- (void)setAvgRxStartPortion:(unint64_t)a3
{
  self->_avgRxStartPortion = a3;
}

- (unint64_t)minRxStartPortion
{
  return self->_minRxStartPortion;
}

- (void)setMinRxStartPortion:(unint64_t)a3
{
  self->_minRxStartPortion = a3;
}

- (unint64_t)maxRxStartPortion
{
  return self->_maxRxStartPortion;
}

- (void)setMaxRxStartPortion:(unint64_t)a3
{
  self->_maxRxStartPortion = a3;
}

- (NSDate)initializationTime
{
  return self->_initializationTime;
}

- (NSDate)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedTime, 0);
  objc_storeStrong((id *)&self->_initializationTime, 0);
}

@end
