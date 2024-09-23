@implementation CSThresholdedTrigger

- (CSThresholdedTrigger)initWithCountThreshold:(int64_t)a3 timeInterval:(double)a4
{
  CSThresholdedTrigger *v6;
  CSThresholdedTrigger *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *actionCounts;
  NSMutableDictionary *v10;
  NSMutableDictionary *lastActionDates;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSThresholdedTrigger;
  v6 = -[CSThresholdedTrigger init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_countThreshold = a3;
    v6->_timeInterval = a4;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    actionCounts = v7->_actionCounts;
    v7->_actionCounts = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    lastActionDates = v7->_lastActionDates;
    v7->_lastActionDates = v10;

  }
  return v7;
}

- (BOOL)incrementAndCheckPerformActionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_actionCounts, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lastActionDates, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lastActionDates, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastActionDates, "setObject:forKeyedSubscript:", v9, v4);
  if (v7 >= self->_countThreshold
    || v8
    && (objc_msgSend(v9, "timeIntervalSinceDate:", v8),
        v12 = v11,
        -[CSThresholdedTrigger timeInterval](self, "timeInterval"),
        v12 >= v13))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actionCounts, "setObject:forKeyedSubscript:", 0, v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastActionDates, "setObject:forKeyedSubscript:", v9, v4);
    v15 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actionCounts, "setObject:forKeyedSubscript:", v14, v4);

    v15 = 0;
  }

  return v15;
}

- (int64_t)countThreshold
{
  return self->_countThreshold;
}

- (void)setCountThreshold:(int64_t)a3
{
  self->_countThreshold = a3;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (NSMutableDictionary)actionCounts
{
  return self->_actionCounts;
}

- (void)setActionCounts:(id)a3
{
  objc_storeStrong((id *)&self->_actionCounts, a3);
}

- (NSMutableDictionary)lastActionDates
{
  return self->_lastActionDates;
}

- (void)setLastActionDates:(id)a3
{
  objc_storeStrong((id *)&self->_lastActionDates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActionDates, 0);
  objc_storeStrong((id *)&self->_actionCounts, 0);
}

@end
