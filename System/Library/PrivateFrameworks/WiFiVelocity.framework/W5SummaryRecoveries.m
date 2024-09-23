@implementation W5SummaryRecoveries

- (W5SummaryRecoveries)initWithSummaryRecoveries:(id)a3
{
  id v4;
  W5SummaryRecoveries *v5;
  NSArray *v6;
  NSObject *p_super;
  objc_super v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)W5SummaryRecoveries;
  v5 = -[W5SummaryRecoveries init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSArray *)v4;
    p_super = &v5->_lastHrRecoveries->super;
    v5->_lastHrRecoveries = v6;
  }
  else
  {
    W5GetOSLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = "-[W5SummaryRecoveries initWithSummaryRecoveries:]";
      v12 = 2080;
      v13 = "W5SummaryRecoveries.m";
      v14 = 1024;
      v15 = 31;
      v16 = 2080;
      v17 = "-[W5SummaryRecoveries initWithSummaryRecoveries:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSArray *obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Recoveries in last Hour: %lu\n"), -[NSArray count](self->_lastHrRecoveries, "count"));
  if (-[NSArray count](self->_lastHrRecoveries, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    obj = self->_lastHrRecoveries;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recoveryType"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("Recovery Type: %@\n"), v9);

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recoveryReason"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("\tRecovery Reason: %@\n"), v10);

        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

  }
  return v3;
}

- (BOOL)isEqualToRecoveries:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSArray count](self->_lastHrRecoveries, "count");
  objc_msgSend(v4, "lastHrRecoveries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "lastHrRecoveries");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      v21 = v4;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v13 = self->_lastHrRecoveries;
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (!v14)
          {

LABEL_20:
            v19 = 0;
            v4 = v21;
            goto LABEL_21;
          }
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v13);
              v16 |= objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "isEqualToDictionary:", v12, v21);
            }
            v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v15);

          if ((v16 & 1) == 0)
            goto LABEL_20;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        v19 = 1;
        v4 = v21;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v19 = 1;
    }
LABEL_21:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  W5SummaryRecoveries *v4;
  W5SummaryRecoveries *v5;
  BOOL v6;

  v4 = (W5SummaryRecoveries *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[W5SummaryRecoveries isEqualToRecoveries:](self, "isEqualToRecoveries:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_lastHrRecoveries, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5SummaryRecoveries *v4;

  v4 = -[W5SummaryRecoveries init](+[W5SummaryRecoveries allocWithZone:](W5SummaryRecoveries, "allocWithZone:", a3), "init");
  -[W5SummaryRecoveries setLastHrRecoveries:](v4, "setLastHrRecoveries:", self->_lastHrRecoveries);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastHrRecoveries, CFSTR("_lastHrRecoveries"));
}

- (W5SummaryRecoveries)initWithCoder:(id)a3
{
  id v4;
  W5SummaryRecoveries *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *lastHrRecoveries;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)W5SummaryRecoveries;
  v5 = -[W5SummaryRecoveries init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_lastHrRecoveries"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    lastHrRecoveries = v5->_lastHrRecoveries;
    v5->_lastHrRecoveries = (NSArray *)v13;

  }
  return v5;
}

- (NSArray)lastHrRecoveries
{
  return self->_lastHrRecoveries;
}

- (void)setLastHrRecoveries:(id)a3
{
  objc_storeStrong((id *)&self->_lastHrRecoveries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHrRecoveries, 0);
}

@end
