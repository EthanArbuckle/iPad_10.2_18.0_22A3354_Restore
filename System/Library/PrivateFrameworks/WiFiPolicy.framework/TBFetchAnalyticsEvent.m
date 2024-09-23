@implementation TBFetchAnalyticsEvent

- (NSDictionary)eventDictionary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent source](self, "source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("source"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent trigger](self, "trigger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("trigger"));

  -[TBFetchAnalyticsEvent duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TBFetchAnalyticsEvent duration](self, "duration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration"));

  }
  -[TBFetchAnalyticsEvent requestCount](self, "requestCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TBFetchAnalyticsEvent requestCount](self, "requestCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("requestCount"));

  }
  -[TBFetchAnalyticsEvent resultCount](self, "resultCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TBFetchAnalyticsEvent resultCount](self, "resultCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("resultCount"));

  }
  -[TBFetchAnalyticsEvent error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[TBFetchAnalyticsEvent error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("errorCode"));

  }
  -[TBFetchAnalyticsEvent date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TBFetchAnalyticsEvent date](self, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "components:fromDate:", 96, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "hour");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("hour"));

  }
  -[TBFetchAnalyticsEvent tileKey](self, "tileKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TBFetchAnalyticsEvent tileKey](self, "tileKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("tileKey"));

  }
  return (NSDictionary *)v3;
}

- (NSNumber)resultCount
{
  return self->_resultCount;
}

- (NSNumber)requestCount
{
  return self->_requestCount;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSString)tileKey
{
  return self->_tileKey;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.3bars.Fetch");
}

+ (id)fetchEventWithSource:(unint64_t)a3 type:(unint64_t)a4 trigger:(unint64_t)a5 duration:(id)a6 requestCount:(id)a7 resultCount:(id)a8 error:(id)a9 tileKey:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TBFetchAnalyticsEvent *v21;
  void *v22;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = objc_alloc_init(TBFetchAnalyticsEvent);
  -[TBFetchAnalyticsEvent setSource:](v21, "setSource:", a3);
  -[TBFetchAnalyticsEvent setType:](v21, "setType:", a4);
  -[TBFetchAnalyticsEvent setTrigger:](v21, "setTrigger:", a5);
  -[TBFetchAnalyticsEvent setDuration:](v21, "setDuration:", v20);

  -[TBFetchAnalyticsEvent setRequestCount:](v21, "setRequestCount:", v19);
  -[TBFetchAnalyticsEvent setResultCount:](v21, "setResultCount:", v18);

  -[TBFetchAnalyticsEvent setError:](v21, "setError:", v17);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBFetchAnalyticsEvent setDate:](v21, "setDate:", v22);

  -[TBFetchAnalyticsEvent setTileKey:](v21, "setTileKey:", v16);
  return v21;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (void)setTileKey:(id)a3
{
  objc_storeStrong((id *)&self->_tileKey, a3);
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void)setResultCount:(id)a3
{
  objc_storeStrong((id *)&self->_resultCount, a3);
}

- (void)setRequestCount:(id)a3
{
  objc_storeStrong((id *)&self->_requestCount, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_tileKey, 0);
  objc_storeStrong((id *)&self->_resultCount, 0);
  objc_storeStrong((id *)&self->_requestCount, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
