@implementation PPSEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSEvent)initWithCoder:(id)a3
{
  id v4;
  PPSEvent *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *metrics;
  uint64_t v15;
  NSString *label;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PPSEvent;
  v5 = -[PPSEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("monotonicTimestamp"));
    v5->_monotonicTimestamp = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeOffset"));
    v5->_timeOffset = v7;
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("metrics"));
    v13 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v13;

    v5->_groupId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("groupId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v15 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("monotonicTimestamp"));
  -[PPSEvent timeOffset](self, "timeOffset");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeOffset"));
  -[PPSEvent metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("metrics"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSEvent groupId](self, "groupId"), CFSTR("groupId"));
  -[PPSEvent label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("label"));

}

+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5
{
  id v7;
  PPSEvent *v8;

  v7 = a5;
  v8 = -[PPSEvent initWithMonotonicTimestamp:timeOffset:dictionary:]([PPSEvent alloc], "initWithMonotonicTimestamp:timeOffset:dictionary:", v7, a3, a4);

  return v8;
}

+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6
{
  id v9;
  PPSEvent *v10;

  v9 = a5;
  v10 = -[PPSEvent initWithMonotonicTimestamp:timeOffset:dictionary:groupId:]([PPSEvent alloc], "initWithMonotonicTimestamp:timeOffset:dictionary:groupId:", v9, a6, a3, a4);

  return v10;
}

+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6 label:(id)a7
{
  id v11;
  id v12;
  PPSEvent *v13;

  v11 = a7;
  v12 = a5;
  v13 = -[PPSEvent initWithMonotonicTimestamp:timeOffset:dictionary:groupId:]([PPSEvent alloc], "initWithMonotonicTimestamp:timeOffset:dictionary:groupId:", v12, a6, a3, a4);

  -[PPSEvent setLabel:](v13, "setLabel:", v11);
  return v13;
}

- (PPSEvent)initWithEvent:(id)a3
{
  id v4;
  PPSEvent *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *metrics;
  uint64_t v11;
  NSString *label;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPSEvent;
  v5 = -[PPSEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "monotonicTimestamp");
    v5->_monotonicTimestamp = v6;
    objc_msgSend(v4, "timeOffset");
    v5->_timeOffset = v7;
    objc_msgSend(v4, "metricKeysAndValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v9;

    v5->_groupId = objc_msgSend(v4, "groupId");
    objc_msgSend(v4, "label");
    v11 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v11;

  }
  return v5;
}

- (PPSEvent)initWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5
{
  return -[PPSEvent initWithMonotonicTimestamp:timeOffset:dictionary:groupId:](self, "initWithMonotonicTimestamp:timeOffset:dictionary:groupId:", a5, -1, a3, a4);
}

- (PPSEvent)initWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6
{
  id v10;
  PPSEvent *v11;
  PPSEvent *v12;
  uint64_t v13;
  NSMutableDictionary *metrics;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PPSEvent;
  v11 = -[PPSEvent init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_monotonicTimestamp = a3;
    v11->_timeOffset = a4;
    v13 = objc_msgSend(v10, "mutableCopy");
    metrics = v12->_metrics;
    v12->_metrics = (NSMutableDictionary *)v13;

    v12->_groupId = a6;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v6 = -[PPSEvent isEqualToEvent:](self, "isEqualToEvent:", v4);
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)PPSEvent;
      v6 = -[PPSEvent isEqual:](&v9, sel_isEqual_, v4);
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToEvent:(id)a3
{
  PPSEvent *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PPSEvent *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
    v6 = v5;
    -[PPSEvent monotonicTimestamp](v4, "monotonicTimestamp");
    if (v6 == v7
      && (-[PPSEvent timeOffset](self, "timeOffset"), v9 = v8, -[PPSEvent timeOffset](v4, "timeOffset"), v9 == v10))
    {
      -[PPSEvent metricKeysAndValues](self, "metricKeysAndValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSEvent metricKeysAndValues](v4, "metricKeysAndValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToDictionary:", v12);

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
  v6 = v5;
  objc_msgSend(v4, "monotonicTimestamp");
  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
    v10 = v9;
    objc_msgSend(v4, "monotonicTimestamp");
    if (v10 > v11)
      v8 = 1;
    else
      v8 = -1;
  }

  return v8;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PPSEvent metrics](self, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSEvent description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDBCED8];
  -[PPSEvent metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCE60];
  -[PPSEvent epochTimestamp](self, "epochTimestamp");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("date"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("monotonicTimestamp"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[PPSEvent timeOffset](self, "timeOffset");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("timeOffset"));

  objc_msgSend(v5, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)logLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCED8];
  -[PPSEvent metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __19__PPSEvent_logLine__block_invoke;
  v13[3] = &unk_25142C800;
  v14 = v3;
  v7 = v3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __19__PPSEvent_logLine__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@;"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (double)epochTimestamp
{
  double v3;
  double v4;
  double v5;

  -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
  v4 = v3;
  -[PPSEvent timeOffset](self, "timeOffset");
  return v4 + v5;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
  v4 = (unint64_t)v3;
  -[PPSEvent timeOffset](self, "timeOffset");
  v6 = (unint64_t)v5;
  -[PPSEvent metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ ((unint64_t)(objc_msgSend(v7, "hash") ^ v6) << 32);

  return v8;
}

- (NSArray)metricKeys
{
  void *v2;
  void *v3;

  -[PPSEvent metrics](self, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)metricValues
{
  void *v2;
  void *v3;

  -[PPSEvent metrics](self, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)metricKeysAndValues
{
  void *v2;
  void *v3;

  -[PPSEvent metrics](self, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  -[PPSEvent metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("monotonicTimestamp"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[PPSEvent epochTimestamp](self, "epochTimestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("epoch"));

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (id)JSONRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[PPSEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    PPSReaderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PPSTimeSeries JSONRepresentation].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (id)metricValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PPSEvent metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)metricValuesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PPSEvent metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsForKeys:notFoundMarker:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (!objc_msgSend(v4, "hasPrefix:", CFSTR("@")))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("monotonicTimestamp")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("timestamp")))
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      -[PPSEvent monotonicTimestamp](self, "monotonicTimestamp");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("epochTimestamp")))
      {
        -[PPSEvent metrics](self, "metrics");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v4);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      v8 = (void *)MEMORY[0x24BDD16E0];
      -[PPSEvent epochTimestamp](self, "epochTimestamp");
    }
    objc_msgSend(v8, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("@"), "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PPSEvent;
  -[PPSEvent valueForKey:](&v10, sel_valueForKey_, v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v7 = (void *)v6;

LABEL_8:
  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (double)monotonicTimestamp
{
  return self->_monotonicTimestamp;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (NSMutableDictionary)metrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
