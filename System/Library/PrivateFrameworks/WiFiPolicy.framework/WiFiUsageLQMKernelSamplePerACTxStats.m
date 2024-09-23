@implementation WiFiUsageLQMKernelSamplePerACTxStats

+ (id)sampleWithTimestamp:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimestamp:", v3);

  return v4;
}

- (WiFiUsageLQMKernelSamplePerACTxStats)initWithTimestamp:(id)a3
{
  NSDate *v4;
  WiFiUsageLQMKernelSamplePerACTxStats *v5;
  NSDate *timestamp;
  objc_super v8;

  v4 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMKernelSamplePerACTxStats;
  v5 = -[WiFiUsageLQMKernelSamplePerACTxStats init](&v8, sel_init);
  timestamp = v5->_timestamp;
  v5->_timestamp = v4;

  return v5;
}

- (void)populateTXStats:(int)a3 With:(unsigned int)a4 ForQueue:(int)a5
{
  uint64_t v6;
  const __CFString *v8;
  int v9;
  __CFString *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v8 = CFSTR("BE");
  v9 = 1;
  switch(a5)
  {
    case 0:
      break;
    case 1:
      v8 = CFSTR("BK");
      break;
    case 2:
      v8 = CFSTR("VI");
      break;
    case 3:
      v8 = CFSTR("VO");
      break;
    case 4:
      v8 = CFSTR("Mcast");
      break;
    default:
      NSLog(CFSTR("%s - Unknown queue tag %u while parsing TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS"), a2, "-[WiFiUsageLQMKernelSamplePerACTxStats populateTXStats:With:ForQueue:]", a5);
      v9 = 0;
      v8 = 0;
      break;
  }
  if (v6 >= 0xB)
  {
    NSLog(CFSTR("%s - Unknown stat tag %u while parsing TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS"), a2, "-[WiFiUsageLQMKernelSamplePerACTxStats populateTXStats:With:ForQueue:]", v6);
  }
  else if (v9)
  {
    v10 = off_1E881DEF8[(int)v6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tx%@%@Perc"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageLQMKernelSamplePerACTxStats setValue:forKey:](self, "setValue:forKey:", v12, v11);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)objc_opt_class(), "allLQMProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@:%@,"), v9, v11, (_QWORD)v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
