@implementation PPSPerformanceProfiler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_7);
  return (id)sharedInstance_perfProfiler;
}

void __40__PPSPerformanceProfiler_sharedInstance__block_invoke()
{
  PPSPerformanceProfiler *v0;
  void *v1;

  v0 = objc_alloc_init(PPSPerformanceProfiler);
  v1 = (void *)sharedInstance_perfProfiler;
  sharedInstance_perfProfiler = (uint64_t)v0;

}

- (PPSPerformanceProfiler)init
{
  PPSPerformanceProfiler *v2;
  uint64_t v3;
  NSMutableDictionary *start_times;
  uint64_t v5;
  NSMutableDictionary *profilingStats;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPSPerformanceProfiler;
  v2 = -[PPSPerformanceProfiler init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    start_times = v2->_start_times;
    v2->_start_times = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    profilingStats = v2->_profilingStats;
    v2->_profilingStats = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)startProfilingForPhase:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_start_times, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_start_times, "setObject:forKeyedSubscript:", v7, v8);

  }
}

- (void)endProfilingForPhase:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_start_times, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_start_times, "objectForKeyedSubscript:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v7 - v9;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(v10 * 1000.0) / 1000.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profilingStats, "setObject:forKeyedSubscript:", v11, v12);

  }
}

- (id)getProfilingStatsForQuery
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary copy](self->_profilingStats, "copy");
  NSLog(CFSTR("Performance Profiler Stats %@"), v3);
  -[NSMutableDictionary removeAllObjects](self->_start_times, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_profilingStats, "removeAllObjects");
  return v3;
}

- (NSMutableDictionary)start_times
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStart_times:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)profilingStats
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProfilingStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilingStats, 0);
  objc_storeStrong((id *)&self->_start_times, 0);
}

@end
