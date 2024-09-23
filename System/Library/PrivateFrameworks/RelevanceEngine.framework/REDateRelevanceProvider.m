@implementation REDateRelevanceProvider

- (REDateRelevanceProvider)initWithEventDate:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  REDateRelevanceProvider *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1508];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStartDate:duration:", v5, 0.0);

  v7 = -[REDateRelevanceProvider initWithEventInterval:](self, "initWithEventInterval:", v6);
  return v7;
}

- (REDateRelevanceProvider)initWithEventDate:(id)a3 duration:(double)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  REDateRelevanceProvider *v9;

  v6 = (objc_class *)MEMORY[0x24BDD1508];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithStartDate:duration:", v7, a4);

  v9 = -[REDateRelevanceProvider initWithEventInterval:](self, "initWithEventInterval:", v8);
  return v9;
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3
{
  id v4;
  void *v5;
  REDateRelevanceProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REDateRelevanceProvider initWithEventInterval:becomesIrrelevantDate:](self, "initWithEventInterval:becomesIrrelevantDate:", v4, v5);

  return v6;
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  REDateRelevanceProvider *v12;

  v6 = (void *)MEMORY[0x24BDBCE48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, -1, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[REDateRelevanceProvider initWithEventInterval:becomesIrrelevantDate:firstBecomesRelevantDate:recentDuration:](self, "initWithEventInterval:becomesIrrelevantDate:firstBecomesRelevantDate:recentDuration:", v8, v7, v11, 1800.0);
  return v12;
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 firstBecomesRelevantDate:(id)a5 recentDuration:(double)a6
{
  id v10;
  id v11;
  id v12;
  REDateRelevanceProvider *v13;
  REDateRelevanceProvider *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDateInterval *interval;
  uint64_t v22;
  NSDate *initialRelevanceDate;
  uint64_t v24;
  NSDate *irrelevantDate;
  NSDate *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)REDateRelevanceProvider;
  v13 = -[RERelevanceProvider init](&v33, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_recentDuration = floor(a6);
    v15 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v10, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    REDateByRemovingSubseconds(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    REDateByRemovingSubseconds(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "initWithStartDate:endDate:", v17, v19);
    interval = v14->_interval;
    v14->_interval = (NSDateInterval *)v20;

    REDateByRemovingSubseconds(v12);
    v22 = objc_claimAutoreleasedReturnValue();
    initialRelevanceDate = v14->_initialRelevanceDate;
    v14->_initialRelevanceDate = (NSDate *)v22;

    REDateByRemovingSubseconds(v11);
    v24 = objc_claimAutoreleasedReturnValue();
    irrelevantDate = v14->_irrelevantDate;
    v14->_irrelevantDate = (NSDate *)v24;

    v26 = v14->_initialRelevanceDate;
    -[NSDateInterval startDate](v14->_interval, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[NSDate compare:](v26, "compare:", v27);

    if (v28 == 1)
    {
      v29 = (void *)MEMORY[0x24BDBCE88];
      v30 = *MEMORY[0x24BDBCAB0];
      objc_msgSend(v10, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "raise:format:", v30, CFSTR("Initial Relevance Date (%@) must occur before or be equal the Event Date (%@)"), v12, v31);

    }
    if (!-[NSDateInterval containsDate:](v14->_interval, "containsDate:", v14->_irrelevantDate))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The irrelevant date (%@) must be in specified interval (%@)"), v11, v10);
  }

  return v14;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("date");
}

+ (id)_simulationDateFormatter
{
  if (_simulationDateFormatter_onceToken != -1)
    dispatch_once(&_simulationDateFormatter_onceToken, &__block_literal_global);
  return (id)_simulationDateFormatter_dateFormatter;
}

uint64_t __51__REDateRelevanceProvider__simulationDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_simulationDateFormatter_dateFormatter;
  _simulationDateFormatter_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_simulationDateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

- (REDateRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  REDateRelevanceProvider *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end_date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_simulationDateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    if (v6)
    {
      objc_msgSend(v7, "dateFromString:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v8;
    }
    v11 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irrelevant_date"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_msgSend(v7, "dateFromString:", v12), (v13 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      v13 = v11;
    v26 = v12;
    v14 = v11;
    v28 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recent_duration"), v26);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &unk_24CFC0D90;
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initial_relevance_date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19 || (objc_msgSend(v7, "dateFromString:", v19), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateByAddingUnit:value:toDate:options:", 16, -1, v29, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v29, v14);
    objc_msgSend(v18, "doubleValue");
    v24 = v23;

    self = -[REDateRelevanceProvider initWithEventInterval:becomesIrrelevantDate:firstBecomesRelevantDate:recentDuration:](self, "initWithEventInterval:becomesIrrelevantDate:firstBecomesRelevantDate:recentDuration:", v22, v13, v20, v24);
    v10 = self;
    v6 = v28;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *irrelevantDate;
  void *v10;
  void *v11;
  float recentDuration;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend((id)objc_opt_class(), "_simulationDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_interval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("start_date"));

  -[NSDateInterval endDate](self->_interval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("end_date"));

  irrelevantDate = self->_irrelevantDate;
  -[NSDateInterval endDate](self->_interval, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(irrelevantDate) = -[NSDate isEqual:](irrelevantDate, "isEqual:", v10);

  if ((irrelevantDate & 1) == 0)
  {
    objc_msgSend(v3, "stringFromDate:", self->_irrelevantDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("irrelevant_date"));

  }
  recentDuration = self->_recentDuration;
  if (!RERelevanceEqualToRelevance(recentDuration, 1800.0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recentDuration);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("recent_duration"));

  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_interval, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, -1, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isEqualToDate:", self->_initialRelevanceDate) & 1) == 0)
  {
    objc_msgSend(v3, "stringFromDate:", self->_initialRelevanceDate);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("initial_relevance_date"));

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REDateRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_interval);
  objc_storeStrong(v4 + 5, self->_initialRelevanceDate);
  objc_storeStrong(v4 + 6, self->_irrelevantDate);
  v4[7] = *(id *)&self->_recentDuration;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REDateRelevanceProvider *v4;
  REDateRelevanceProvider *v5;
  NSDateInterval *interval;
  NSDateInterval *v7;
  NSDateInterval *v8;
  NSDateInterval *v9;
  int v10;
  BOOL v11;
  NSDate *initialRelevanceDate;
  NSDate *v13;
  NSDate *v14;
  NSDate *v15;
  int v16;
  NSDate *irrelevantDate;
  NSDate *v18;
  NSDate *v19;
  NSDate *v20;
  int v21;
  float recentDuration;
  float v23;
  objc_super v25;

  v4 = (REDateRelevanceProvider *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)REDateRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v25, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        interval = self->_interval;
        v7 = v5->_interval;
        if (interval == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = interval;
          v10 = -[NSDateInterval isEqual:](v9, "isEqual:", v8);

          if (!v10)
            goto LABEL_16;
        }
        initialRelevanceDate = self->_initialRelevanceDate;
        v13 = v5->_initialRelevanceDate;
        if (initialRelevanceDate == v13)
        {

        }
        else
        {
          v14 = v13;
          v15 = initialRelevanceDate;
          v16 = -[NSDate isEqual:](v15, "isEqual:", v14);

          if (!v16)
            goto LABEL_16;
        }
        irrelevantDate = self->_irrelevantDate;
        v18 = v5->_irrelevantDate;
        if (irrelevantDate == v18)
        {

        }
        else
        {
          v19 = v18;
          v20 = irrelevantDate;
          v21 = -[NSDate isEqual:](v20, "isEqual:", v19);

          if (!v21)
          {
LABEL_16:
            v11 = 0;
LABEL_19:

            goto LABEL_20;
          }
        }
        recentDuration = self->_recentDuration;
        v23 = v5->_recentDuration;
        v11 = vabds_f32(recentDuration, v23) < 0.00000011921;
        goto LABEL_19;
      }
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)_hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSDateInterval hash](self->_interval, "hash");
  v4 = -[NSDate hash](self->_initialRelevanceDate, "hash") ^ v3;
  v5 = v4 ^ -[NSDate hash](self->_irrelevantDate, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recentDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZZZ"));
  v14.receiver = self;
  v14.super_class = (Class)REDateRelevanceProvider;
  -[REDateRelevanceProvider description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_interval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_interval, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_initialRelevanceDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_irrelevantDate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" intervalStartDate=%@, intervalEndDate=%@, initialRelevanceDate=%@, irrelevantDate=%@"), v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSDate)initialRelevanceDate
{
  return self->_initialRelevanceDate;
}

- (NSDate)irrelevantDate
{
  return self->_irrelevantDate;
}

- (double)recentDuration
{
  return self->_recentDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irrelevantDate, 0);
  objc_storeStrong((id *)&self->_initialRelevanceDate, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
