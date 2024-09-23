@implementation WiFiUsageRangingSession

- (WiFiUsageRangingSession)init
{
  WiFiUsageRangingSession *v2;
  NSDate *sessionStartTimestamp;
  NSDate *sessionLinkUpTimestamp;
  NSDate *peerDiscoveryTimestamp;
  NSDate *rangingStartedTimestamp;
  NSDate *rangingCompletionTimestamp;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageRangingSession;
  v2 = -[WiFiUsageRangingSession init](&v9, sel_init);
  sessionStartTimestamp = v2->_sessionStartTimestamp;
  v2->_sessionStartTimestamp = 0;

  sessionLinkUpTimestamp = v2->_sessionLinkUpTimestamp;
  v2->_sessionLinkUpTimestamp = 0;

  peerDiscoveryTimestamp = v2->_peerDiscoveryTimestamp;
  v2->_peerDiscoveryTimestamp = 0;

  rangingStartedTimestamp = v2->_rangingStartedTimestamp;
  v2->_rangingStartedTimestamp = 0;

  rangingCompletionTimestamp = v2->_rangingCompletionTimestamp;
  v2->_rangingCompletionTimestamp = 0;

  return v2;
}

- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9
{
  void *v16;
  id v17;
  NSDate *v18;
  NSDate *sessionStartTimestamp;
  NSString *v20;
  NSString *requester;
  NSDate *sessionLinkUpTimestamp;
  NSDate *peerDiscoveryTimestamp;
  NSDate *rangingStartedTimestamp;
  NSDate *rangingCompletionTimestamp;

  v16 = (void *)MEMORY[0x1E0C99D68];
  v17 = a9;
  objc_msgSend(v16, "date");
  v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  sessionStartTimestamp = self->_sessionStartTimestamp;
  self->_sessionStartTimestamp = v18;

  self->_selfPreferredChannel = a3;
  self->_selfMainChannel = a4;
  self->_selfChannelFlags = a5;
  self->_peerPreferredChannel = a6;
  self->_peerMainChannel = a7;
  self->_peerChannelFlags = a8;
  v20 = (NSString *)objc_msgSend(v17, "copy");

  requester = self->_requester;
  self->_requester = v20;

  sessionLinkUpTimestamp = self->_sessionLinkUpTimestamp;
  self->_sessionLinkUpTimestamp = 0;

  peerDiscoveryTimestamp = self->_peerDiscoveryTimestamp;
  self->_peerDiscoveryTimestamp = 0;

  rangingStartedTimestamp = self->_rangingStartedTimestamp;
  self->_rangingStartedTimestamp = 0;

  rangingCompletionTimestamp = self->_rangingCompletionTimestamp;
  self->_rangingCompletionTimestamp = 0;

  *(_OWORD *)&self->_measurementStatus = 0u;
  *(_OWORD *)&self->_linkUpLatency = 0u;
  *(_OWORD *)&self->_numRequestedMeasurements = 0u;
  -[NSMutableArray removeAllObjects](self->_rttSamples, "removeAllObjects");
}

- (void)rangingLinkUp
{
  NSDate *v3;
  NSDate *sessionLinkUpTimestamp;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  sessionLinkUpTimestamp = self->_sessionLinkUpTimestamp;
  self->_sessionLinkUpTimestamp = v3;

}

- (void)rangingStartedWithNumMeasurements:(unint64_t)a3
{
  NSDate *v5;
  NSDate *rangingStartedTimestamp;
  NSDate *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (!self->_sessionLinkUpTimestamp)
    objc_storeStrong((id *)&self->_sessionLinkUpTimestamp, v5);
  if (!self->_peerDiscoveryTimestamp)
    objc_storeStrong((id *)&self->_peerDiscoveryTimestamp, v5);
  rangingStartedTimestamp = self->_rangingStartedTimestamp;
  self->_rangingStartedTimestamp = v5;
  v7 = v5;

  self->_numRequestedMeasurements = a3;
  -[NSMutableArray removeAllObjects](self->_rttSamples, "removeAllObjects");

  self->_numValidMeasurements = 0;
  self->_measurementStatus = 0;
  self->_measurementFlags = 0;
}

- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5
{
  NSDate *v9;
  NSDate *rangingCompletionTimestamp;
  NSDate *peerDiscoveryTimestamp;
  double v12;
  NSDate *v13;
  double v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  rangingCompletionTimestamp = self->_rangingCompletionTimestamp;
  self->_rangingCompletionTimestamp = v9;

  self->_numValidMeasurements = a3;
  self->_measurementStatus = a4;
  self->_measurementFlags = a5;
  if (self->_sessionStartTimestamp)
  {
    peerDiscoveryTimestamp = self->_peerDiscoveryTimestamp;
    if (peerDiscoveryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](peerDiscoveryTimestamp, "timeIntervalSinceDate:");
      self->_linkUpLatency = v12;
    }
  }
  if (self->_rangingStartedTimestamp)
  {
    v13 = self->_rangingCompletionTimestamp;
    if (v13)
    {
      -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:");
      self->_rangingLatency = v14;
    }
  }
}

- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14
{
  NSMutableArray *rttSamples;
  NSMutableArray *v22;
  NSMutableArray *v23;
  WiFiUsageRangingRttSample *v24;

  v24 = objc_alloc_init(WiFiUsageRangingRttSample);
  -[WiFiUsageRangingRttSample setRssi:](v24, "setRssi:", a3);
  -[WiFiUsageRangingRttSample setRtt:](v24, "setRtt:", a4);
  -[WiFiUsageRangingRttSample setFlags:](v24, "setFlags:", a6);
  -[WiFiUsageRangingRttSample setChannel:](v24, "setChannel:", a7);
  -[WiFiUsageRangingRttSample setSelfSnr:](v24, "setSelfSnr:", a5);
  -[WiFiUsageRangingRttSample setSelfCoreId:](v24, "setSelfCoreId:", a8);
  -[WiFiUsageRangingRttSample setSelfBitErrorRate:](v24, "setSelfBitErrorRate:", a9);
  -[WiFiUsageRangingRttSample setSelfPhyError:](v24, "setSelfPhyError:", a10);
  -[WiFiUsageRangingRttSample setPeerSnr:](v24, "setPeerSnr:", a11);
  -[WiFiUsageRangingRttSample setPeerCoreId:](v24, "setPeerCoreId:", a12);
  -[WiFiUsageRangingRttSample setPeerBitErrorRate:](v24, "setPeerBitErrorRate:", a13);
  -[WiFiUsageRangingRttSample setPeerPhyError:](v24, "setPeerPhyError:", a14);
  rttSamples = self->_rttSamples;
  if (!rttSamples)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v23 = self->_rttSamples;
    self->_rttSamples = v22;

    rttSamples = self->_rttSamples;
  }
  -[NSMutableArray addObject:](rttSamples, "addObject:", v24, a12);

}

- (id)metricName
{
  return CFSTR("com.apple.wifi.rangingsession");
}

- (id)sessionSummary:(BOOL)a3
{
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  NSMutableArray *obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Ranging"), CFSTR("SessionName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(self->_linkUpLatency * 1000.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("LinkLatency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(self->_rangingLatency * 1000.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("RangingLatency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numRequestedMeasurements);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("RequestedMeasurements"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numValidMeasurements);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("ValidMeasurements"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_measurementStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("MeasurementStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_measurementFlags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("MeasurementFlags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_selfMainChannel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("SelfMainChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_selfPreferredChannel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("SelfPreferredChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_selfChannelFlags);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("SelfChannelFlags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_peerMainChannel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("PeerMainChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_peerPreferredChannel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("PeerPreferredChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_peerChannelFlags);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("PeerChannelFlags"));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = self->_rttSamples;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 1;
    v48 = *(_QWORD *)v50;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v50 != v48)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v20);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleRSSI%d"), v19 + v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "rssi"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v22);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleRTT%d"), v19 + v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "rtt"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v24);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleFlags%d"), v19 + v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "flags"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v26);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleChannel%d"), v19 + v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "channel"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, v28);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleSelfSNR%d"), v19 + v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "selfSnr"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, v30);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleSelfCoreID%d"), v19 + v20);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "selfCoreId"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, v32);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleSelfBER%d"), v19 + v20);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "selfBitErrorRate"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, v34);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SampleSelfPHYError%d"), v19 + v20);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "selfPhyError"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, v36);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SamplePeerSNR%d"), v19 + v20);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "peerSnr"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, v38);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SamplePeerCoreID%d"), v19 + v20);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "peerCoreId"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, v40);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SamplePeerBER%d"), v19 + v20);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "peerBitErrorRate"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, v42);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SamplePeerPHYError%d"), v19 + v20);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "peerPhyError"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, v44);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      v19 = (v19 + v20);
    }
    while (v18);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_rttSamples, 0);
  objc_storeStrong((id *)&self->_rangingCompletionTimestamp, 0);
  objc_storeStrong((id *)&self->_rangingStartedTimestamp, 0);
  objc_storeStrong((id *)&self->_peerDiscoveryTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionLinkUpTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionStartTimestamp, 0);
}

@end
