@implementation PFLJetsamInfoInterval

- (PFLJetsamInfoInterval)initWithLabel:(id)a3
{
  id v5;
  PFLJetsamInfoInterval *v6;
  PFLJetsamInfoInterval *v7;
  uint64_t v8;
  PFLJetsamInfoFetcher *fetcher;
  NSObject *v10;
  NSString *label;
  double v12;
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFLJetsamInfoInterval;
  v6 = -[PFLJetsamInfoInterval init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    v8 = objc_opt_new();
    fetcher = v7->_fetcher;
    v7->_fetcher = (PFLJetsamInfoFetcher *)v8;

    if (-[PFLJetsamInfoFetcher getInfo:](v7->_fetcher, "getInfo:", &v7->_startInfo))
    {
      if (-[PFLJetsamInfoFetcher resetInterval](v7->_fetcher, "resetInterval"))
      {
        pfl_jetsam_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          label = v7->_label;
          v12 = (double)v7->_startInfo.currentKB * 0.0009765625;
          *(_DWORD *)buf = 138412546;
          v16 = label;
          v17 = 2048;
          v18 = v12;
          _os_log_impl(&dword_243C29000, v10, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f", buf, 0x16u);
        }

      }
    }
  }

  return v7;
}

- (jetsam_info)currentInfo
{
  retstr->maxLifetimeKB = -1;
  retstr->maxIntervalKB = -1;
  retstr->currentKB = -1;
  return (jetsam_info *)-[PFLJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:");
}

- (void)logCurrentInterval
{
  NSObject *v3;
  NSString *label;
  double v5;
  _QWORD v6[2];
  uint64_t v7;
  uint8_t buf[4];
  NSString *v9;
  __int16 v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v6[1] = 0;
  v7 = 0;
  if (-[PFLJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:", v6))
  {
    pfl_jetsam_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      v5 = (double)self->_startInfo.currentKB * 0.0009765625;
      *(_DWORD *)buf = 138413058;
      v9 = label;
      v10 = 2048;
      v11 = v5;
      v12 = 2048;
      v13 = (double)v7 * 0.0009765625;
      v14 = 2048;
      v15 = (double)v6[0] * 0.0009765625;
      _os_log_impl(&dword_243C29000, v3, OS_LOG_TYPE_DEFAULT, "jetsam interval '%@': start footprint: %.3f, max: %.3f, end: %.3f", buf, 0x2Au);
    }

  }
}

- (void)reset
{
  -[PFLJetsamInfoFetcher getInfo:](self->_fetcher, "getInfo:", &self->_startInfo);
  -[PFLJetsamInfoFetcher resetInterval](self->_fetcher, "resetInterval");
}

- (NSString)label
{
  return self->_label;
}

- (jetsam_info)startInfo
{
  *retstr = self[1];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
