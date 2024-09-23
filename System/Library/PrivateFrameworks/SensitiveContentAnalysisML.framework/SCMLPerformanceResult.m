@implementation SCMLPerformanceResult

- (SCMLPerformanceResult)initWithName:(id)a3
{
  id v5;
  SCMLPerformanceResult *v6;
  SCMLPerformanceResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMLPerformanceResult;
  v6 = -[SCMLPerformanceResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCMLPerformanceResult name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: Peak-Delta: %lf, CPU-Time: %lf, Interval: %lf]"), v4, *(_QWORD *)&self->peakdelta, *(_QWORD *)&self->cpuTime, *(_QWORD *)&self->timeInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("maxpeak");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->maxpeak);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("peakdelta");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->peakdelta);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("recentpeak");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->recentpeak);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("current");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->current);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("timeInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->timeInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
