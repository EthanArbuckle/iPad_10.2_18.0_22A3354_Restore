@implementation PLASMetric

- (id)initMetric:(id)a3 withType:(signed __int16)a4 withProperties:(id)a5 withQuery:(id)a6 andSummarizerBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PLASMetric *v17;
  PLASMetric *v18;
  uint64_t v19;
  id query;
  uint64_t v21;
  id summarizer;
  objc_super v24;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PLASMetric;
  v17 = -[PLASMetric init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_metricKey, a3);
    v18->_metricType = a4;
    objc_storeStrong((id *)&v18->_metricProperties, a5);
    v19 = MEMORY[0x1DF0A4968](v15);
    query = v18->_query;
    v18->_query = (id)v19;

    v21 = MEMORY[0x1DF0A4968](v16);
    summarizer = v18->_summarizer;
    v18->_summarizer = (id)v21;

  }
  return v18;
}

- (NSString)metricKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (signed)metricType
{
  return self->_metricType;
}

- (void)setMetricType:(signed __int16)a3
{
  self->_metricType = a3;
}

- (NSArray)metricProperties
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetricProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)query
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)summarizer
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSummarizer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_summarizer, 0);
  objc_storeStrong(&self->_query, 0);
  objc_storeStrong((id *)&self->_metricProperties, 0);
  objc_storeStrong((id *)&self->_metricKey, 0);
}

@end
