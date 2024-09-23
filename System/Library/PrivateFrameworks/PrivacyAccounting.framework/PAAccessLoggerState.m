@implementation PAAccessLoggerState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeAccessCache, 0);
  objc_storeStrong((id *)&self->_slotByAccessForOngoingAccessInterval, 0);
  objc_storeStrong((id *)&self->_ongoingAccessIntervals, 0);
}

- (void)setTopAccessIntervalSlot:(int64_t)a3
{
  self->_topAccessIntervalSlot = a3;
}

- (PAAccessLoggerState)init
{
  PAAccessLoggerState *v2;
  PAAccessLoggerState *v3;
  uint64_t v4;
  NSMutableDictionary *ongoingAccessIntervals;
  uint64_t v6;
  NSMutableDictionary *slotByAccessForOngoingAccessInterval;
  uint64_t v8;
  NSCache *negativeAccessCache;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAAccessLoggerState;
  v2 = -[PAAccessLoggerState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_loggingEnabled = 1;
    v2->_topAccessIntervalSlot = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    ongoingAccessIntervals = v3->_ongoingAccessIntervals;
    v3->_ongoingAccessIntervals = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    slotByAccessForOngoingAccessInterval = v3->_slotByAccessForOngoingAccessInterval;
    v3->_slotByAccessForOngoingAccessInterval = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    negativeAccessCache = v3->_negativeAccessCache;
    v3->_negativeAccessCache = (NSCache *)v8;

    -[NSCache setName:](v3->_negativeAccessCache, "setName:", CFSTR("com.apple.PrivacyAccounting.NegativeAccessCache"));
  }
  return v3;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (NSDictionary)ongoingAccessIntervals
{
  return &self->_ongoingAccessIntervals->super;
}

- (int64_t)topAccessIntervalSlot
{
  return self->_topAccessIntervalSlot;
}

- (id)takeOngoingAccessIntervalStateForAccess:(id)a3
{
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_slotByAccessForOngoingAccessInterval, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PAAccessLoggerState takeOngoingAccessIntervalStateForSlot:](self, "takeOngoingAccessIntervalStateForSlot:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (NSCache)negativeAccessCache
{
  return self->_negativeAccessCache;
}

- (id)lookupCurrentAccessForSlot:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_ongoingAccessIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "access");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setOngoingAccessIntervalState:(id)a3 forSlot:(id)a4
{
  NSMutableDictionary *ongoingAccessIntervals;
  id v7;
  id v8;
  NSMutableDictionary *slotByAccessForOngoingAccessInterval;
  id v10;

  ongoingAccessIntervals = self->_ongoingAccessIntervals;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](ongoingAccessIntervals, "setObject:forKeyedSubscript:", v8, v7);
  slotByAccessForOngoingAccessInterval = self->_slotByAccessForOngoingAccessInterval;
  objc_msgSend(v8, "access");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](slotByAccessForOngoingAccessInterval, "setObject:forKeyedSubscript:", v7, v10);
}

- (id)takeOngoingAccessIntervalStateForSlot:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *slotByAccessForOngoingAccessInterval;
  void *v7;
  id v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ongoingAccessIntervals, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ongoingAccessIntervals, "setObject:forKeyedSubscript:", 0, v4);
    slotByAccessForOngoingAccessInterval = self->_slotByAccessForOngoingAccessInterval;
    objc_msgSend(v5, "access");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](slotByAccessForOngoingAccessInterval, "setObject:forKeyedSubscript:", 0, v7);

    v8 = v5;
  }

  return v5;
}

- (NSDictionary)slotByAccessForOngoingAccessInterval
{
  return &self->_slotByAccessForOngoingAccessInterval->super;
}

@end
