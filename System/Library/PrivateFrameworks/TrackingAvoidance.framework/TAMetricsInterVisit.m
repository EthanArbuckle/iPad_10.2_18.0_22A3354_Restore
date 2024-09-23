@implementation TAMetricsInterVisit

- (TAMetricsInterVisit)init
{
  TAMetricsInterVisit *v2;
  TAInterVisitMetricPerDevice *v3;
  TAInterVisitMetricPerDevice *currentInterVisitMetric;
  TAInterVisitMetricPerDevice *v5;
  TAInterVisitMetricPerDevice *totalInterVisitMetric;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TAMetricsInterVisit;
  v2 = -[TAMetricsInterVisit init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TAInterVisitMetricPerDevice);
    currentInterVisitMetric = v2->_currentInterVisitMetric;
    v2->_currentInterVisitMetric = v3;

    v5 = objc_alloc_init(TAInterVisitMetricPerDevice);
    totalInterVisitMetric = v2->_totalInterVisitMetric;
    v2->_totalInterVisitMetric = v5;

  }
  return v2;
}

- (unint64_t)getMetricsCollectionType
{
  return 1;
}

- (TASPAdvertisement)latestAdvertisement
{
  void *currentInterVisitMetric;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;

  currentInterVisitMetric = self->_currentInterVisitMetric;
  if (currentInterVisitMetric)
  {
    if (!self->_totalInterVisitMetric)
    {
LABEL_5:
      objc_msgSend(currentInterVisitMetric, "latestAdvertisement");
      currentInterVisitMetric = (void *)objc_claimAutoreleasedReturnValue();
      return (TASPAdvertisement *)currentInterVisitMetric;
    }
    objc_msgSend(currentInterVisitMetric, "latestAdvertisement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TAInterVisitMetricPerDevice latestAdvertisement](self->_totalInterVisitMetric, "latestAdvertisement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToData:", v7);

    if (v8)
    {
      currentInterVisitMetric = self->_currentInterVisitMetric;
      goto LABEL_5;
    }
    v9 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      -[TAMetricsInterVisit latestAdvertisement].cold.1(v9);
    currentInterVisitMetric = 0;
  }
  return (TASPAdvertisement *)currentInterVisitMetric;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("MetricsType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("CurrentInterVisitMetric");
  -[TAMetricsInterVisit currentInterVisitMetric](self, "currentInterVisitMetric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("TotalInterVisitMetric");
  -[TAMetricsInterVisit totalInterVisitMetric](self, "totalInterVisitMetric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  -[TAMetricsInterVisit descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v2, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAInterVisitMetricPerDevice description].cold.1(v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return (NSString *)v7;
}

- (TAInterVisitMetricPerDevice)currentInterVisitMetric
{
  return self->_currentInterVisitMetric;
}

- (TAInterVisitMetricPerDevice)totalInterVisitMetric
{
  return self->_totalInterVisitMetric;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalInterVisitMetric, 0);
  objc_storeStrong((id *)&self->_currentInterVisitMetric, 0);
}

- (void)latestAdvertisement
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_217877000, log, OS_LOG_TYPE_FAULT, "#TAMetricsInterVisit current and total address in disagreement", v1, 2u);
}

@end
