@implementation SCMLPerformance

- (SCMLPerformance)initWithOptions:(id)a3
{
  id v4;
  SCMLPerformance *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSMutableDictionary *results;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCMLPerformance;
  v5 = -[SCMLPerformance init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", SCMLTrackPerformance[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
    v5->_computePerf = v7;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      results = v5->_results;
      v5->_results = (NSMutableDictionary *)v8;

    }
  }

  return v5;
}

- (void)run:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  SCMLPerformanceResult *v13;
  float64x2_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[SCMLPerformance computePerf](self, "computePerf"))
  {
    pc_session_create();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processIdentifier");
    pc_session_set_procpid();

    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_begin();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v7[2](v7);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v9);
    v12 = v11;

    pc_session_end();
    v13 = -[SCMLPerformanceResult initWithName:]([SCMLPerformanceResult alloc], "initWithName:", v6);
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_destroy();
    v14 = (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL);
    *(float64x2_t *)&v13->maxpeak = vmulq_f64(*(float64x2_t *)&v13->maxpeak, v14);
    *(float64x2_t *)&v13->recentpeak = vmulq_f64(*(float64x2_t *)&v13->recentpeak, v14);
    v13->cpuTime = v13->cpuTime / 1000000.0;
    v13->timeInterval = v12;
    -[SCMLPerformance results](self, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCMLPerformance results](self, "results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v6);

    }
    -[SCMLPerformance results](self, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCMLPerformanceResult dict](v13, "dict");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (BOOL)computePerf
{
  return self->_computePerf;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
