@implementation Exchange

+ (id)formattedExchangeNameForName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = formattedExchangeNameForName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&formattedExchangeNameForName__onceToken, &__block_literal_global_10);
  objc_msgSend((id)formattedExchangeNameForName__prettyExchangeMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

void __41__Exchange_formattedExchangeNameForName___block_invoke()
{
  void *v0;

  v0 = (void *)formattedExchangeNameForName__prettyExchangeMap;
  formattedExchangeNameForName__prettyExchangeMap = (uint64_t)&unk_24D7603F0;

}

- (Exchange)initWithName:(id)a3
{
  id v4;
  Exchange *v5;
  Exchange *v6;
  Exchange *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)Exchange;
    v5 = -[Exchange init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[Exchange setName:](v5, "setName:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Exchange)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  Exchange *v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[Exchange initWithName:](self, "initWithName:", v5);

  if (v6)
    -[Exchange _updateWithDictionary:newUpdate:](v6, "_updateWithDictionary:newUpdate:", v4, 0);

  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  -[Exchange _updateWithDictionary:newUpdate:](self, "_updateWithDictionary:newUpdate:", a3, 1);
}

- (void)_updateWithDictionary:(id)a3 newUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *name;
  NSObject *v11;
  NSString *v12;
  void *v13;
  void *v14;
  int64_t status;
  int64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double streamInterval;
  double v22;
  int v23;
  NSString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedExchangeNameForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  name = self->_name;
  if (name)
  {
    if (!-[NSString isEqualToString:](name, "isEqualToString:", v9))
    {
      StocksLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_name;
        v23 = 138412802;
        v24 = v12;
        v25 = 2112;
        v26 = v9;
        v27 = 2112;
        v28 = v6;
        _os_log_error_impl(&dword_21736B000, v11, OS_LOG_TYPE_ERROR, "#Exchange Attempting to update exchange %@ with dictionary containing a different name (%@)! Dictionary: %@", (uint8_t *)&v23, 0x20u);
      }
      goto LABEL_24;
    }
  }
  else
  {
    -[Exchange setName:](self, "setName:", v9);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nextOpenDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[Exchange setNextOpenDate:](self, "setNextOpenDate:", v13);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  status = objc_msgSend(v14, "integerValue");
  if (!status)
    status = self->_status;

  v16 = self->_status;
  if (status != v16)
  {
    if (v4)
    {
      if (v16 <= 2 && status >= 3)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v19 = (void *)v17;
        -[Exchange setLastCloseDate:](self, "setLastCloseDate:", v17);

        goto LABEL_18;
      }
      if (status == 2)
      {
        -[Exchange setLastCloseDate:](self, "setLastCloseDate:", 0);
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastCloseDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastCloseDate"));
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
    }
LABEL_18:
    -[Exchange setStatus:](self, "setStatus:", status);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("streamInterval"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  if (streamInterval == 0.0)
    streamInterval = self->_streamInterval;
  -[Exchange setStreamInterval:](self, "setStreamInterval:", streamInterval);

  if (!v4)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastUpdateTime"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject doubleValue](v11, "doubleValue");
    self->_lastUpdateTime = v22;
LABEL_24:

    goto LABEL_25;
  }
  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
LABEL_25:

}

- (id)archiveDictionary
{
  const __CFString *name;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  name = (const __CFString *)self->_name;
  if (!name)
    name = &stru_24D74CF50;
  v15[0] = name;
  v14[0] = CFSTR("name");
  v14[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("streamInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_streamInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("lastUpdateTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastUpdateTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[Exchange lastCloseDate](self, "lastCloseDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[Exchange lastCloseDate](self, "lastCloseDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("lastCloseDate"));

  }
  -[Exchange nextOpenDate](self, "nextOpenDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[Exchange nextOpenDate](self, "nextOpenDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("nextOpenDate"));

  }
  return v8;
}

- (void)setName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;

  if (self->_name != a3)
  {
    v4 = a3;
    objc_msgSend((id)objc_opt_class(), "formattedExchangeNameForName:", v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

    name = self->_name;
    self->_name = v5;

  }
}

- (BOOL)marketIsAfterHours
{
  return (self->_status & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)marketIsOpen
{
  return self->_status == 2;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    name = self->_name;
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](name, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  NSString *name;
  unint64_t v7;
  const __CFString *v8;
  uint64_t streamInterval;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  if (self->_lastUpdateTime <= 0.0)
  {
    v3 = CFSTR("never");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ds ago"), (int)(CFAbsoluteTimeGetCurrent() - self->_lastUpdateTime));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)Exchange;
  -[Exchange description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v7 = self->_status - 1;
  if (v7 > 5)
    v8 = CFSTR("unknown");
  else
    v8 = off_24D74C480[v7];
  streamInterval = (int)self->_streamInterval;
  -[NSDate description](self->_lastCloseDate, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_nextOpenDate, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ (status: %@, stream interval: %ds, last updated: %@, last close: %@ next open: %@)"), v5, name, v8, streamInterval, v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)lastCloseDate
{
  return self->_lastCloseDate;
}

- (void)setLastCloseDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCloseDate, a3);
}

- (NSDate)nextOpenDate
{
  return self->_nextOpenDate;
}

- (void)setNextOpenDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextOpenDate, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (double)streamInterval
{
  return self->_streamInterval;
}

- (void)setStreamInterval:(double)a3
{
  self->_streamInterval = a3;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextOpenDate, 0);
  objc_storeStrong((id *)&self->_lastCloseDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
