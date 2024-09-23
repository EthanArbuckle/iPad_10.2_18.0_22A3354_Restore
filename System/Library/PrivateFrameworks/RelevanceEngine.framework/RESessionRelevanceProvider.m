@implementation RESessionRelevanceProvider

- (RESessionRelevanceProvider)init
{
  return -[RESessionRelevanceProvider initWithStartDate:endDate:](self, "initWithStartDate:endDate:", 0, 0);
}

- (RESessionRelevanceProvider)initWithStartDate:(id)a3 endDate:(id)a4
{
  return -[RESessionRelevanceProvider initWithStartDate:endDate:historic:](self, "initWithStartDate:endDate:historic:", a3, a4, 0);
}

- (RESessionRelevanceProvider)initWithStartDate:(id)a3 endDate:(id)a4 historic:(BOOL)a5
{
  id v8;
  id v9;
  RESessionRelevanceProvider *v10;
  uint64_t v11;
  NSDate *startDate;
  uint64_t v13;
  NSDate *endDate;
  NSDate *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RESessionRelevanceProvider;
  v10 = -[RERelevanceProvider init](&v17, sel_init);
  if (v10)
  {
    REDateByRemovingSubseconds(v8);
    v11 = objc_claimAutoreleasedReturnValue();
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v11;

    REDateByRemovingSubseconds(v9);
    v13 = objc_claimAutoreleasedReturnValue();
    endDate = v10->_endDate;
    v10->_endDate = (NSDate *)v13;

    v10->_historic = a5;
    v15 = v10->_startDate;
    if (v15)
    {
      if (v10->_endDate && -[NSDate compare:](v15, "compare:") == NSOrderedDescending)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Start Date (%@) must occur before the End Date (%@)"), v10->_startDate, v10->_endDate);
    }
  }

  return v10;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("session");
}

+ (id)_simulationDateFormatter
{
  if (_simulationDateFormatter_onceToken_0 != -1)
    dispatch_once(&_simulationDateFormatter_onceToken_0, &__block_literal_global_45);
  return (id)_simulationDateFormatter_dateFormatter_0;
}

uint64_t __54__RESessionRelevanceProvider__simulationDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_simulationDateFormatter_dateFormatter_0;
  _simulationDateFormatter_dateFormatter_0 = (uint64_t)v0;

  return objc_msgSend((id)_simulationDateFormatter_dateFormatter_0, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

- (RESessionRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  RESessionRelevanceProvider *v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end_date"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_simulationDateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_3:
      objc_msgSend((id)objc_opt_class(), "_simulationDateFormatter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateFromString:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
    if (v6)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historic"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x24BDBD1C0];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  v16 = objc_msgSend(v15, "BOOLValue");
  v17 = -[RESessionRelevanceProvider initWithStartDate:endDate:historic:](self, "initWithStartDate:endDate:historic:", v9, v11, v16);

  return v17;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_historic);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("historic"));

  if (self->_startDate)
  {
    objc_msgSend((id)objc_opt_class(), "_simulationDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", self->_startDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("start_date"));

  }
  if (self->_endDate)
  {
    objc_msgSend((id)objc_opt_class(), "_simulationDateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", self->_endDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("end_date"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RESessionRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 5, self->_startDate);
  objc_storeStrong(v4 + 6, self->_endDate);
  *((_BYTE *)v4 + 32) = self->_historic;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RESessionRelevanceProvider *v4;
  RESessionRelevanceProvider *v5;
  NSDate *startDate;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  int v10;
  BOOL v11;
  NSDate *endDate;
  NSDate *v13;
  NSDate *v14;
  NSDate *v15;
  int v16;
  objc_super v18;

  v4 = (RESessionRelevanceProvider *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)RESessionRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v18, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        startDate = self->_startDate;
        v7 = v5->_startDate;
        if (startDate == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = startDate;
          v10 = -[NSDate isEqual:](v9, "isEqual:", v8);

          if (!v10)
            goto LABEL_12;
        }
        endDate = self->_endDate;
        v13 = v5->_endDate;
        if (endDate == v13)
        {

        }
        else
        {
          v14 = v13;
          v15 = endDate;
          v16 = -[NSDate isEqual:](v15, "isEqual:", v14);

          if (!v16)
          {
LABEL_12:
            v11 = 0;
LABEL_15:

            goto LABEL_16;
          }
        }
        v11 = self->_historic == v5->_historic;
        goto LABEL_15;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)_hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSDate hash](self->_startDate, "hash");
  v4 = -[NSDate hash](self->_endDate, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_historic);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RESessionRelevanceProvider;
  -[RESessionRelevanceProvider description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_historic)
    v5 = CFSTR(", historic");
  else
    v5 = &stru_24CF92178;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" start=%@, end=%@%@"), self->_startDate, self->_endDate, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isHistoric
{
  return self->_historic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
