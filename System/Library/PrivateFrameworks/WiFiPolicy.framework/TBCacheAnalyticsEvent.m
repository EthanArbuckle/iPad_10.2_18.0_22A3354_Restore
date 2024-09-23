@implementation TBCacheAnalyticsEvent

+ (id)cacheAnalyticsEventWithStatus:(unint64_t)a3 staleness:(unint64_t)a4 tileKey:(unint64_t)a5 type:(unint64_t)a6 error:(id)a7
{
  id v11;
  TBCacheAnalyticsEvent *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a7;
  v12 = objc_alloc_init(TBCacheAnalyticsEvent);
  -[TBCacheAnalyticsEvent setEventName:](v12, "setEventName:", CFSTR("com.apple.wifi.3bars.cache_miss"));
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("status"));

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("staleness"));

  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("tileKey"));

  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("error"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("type"));

  -[TBCacheAnalyticsEvent setEventDictionary:](v12, "setEventDictionary:", v13);
  return v12;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (void)setEventDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_eventDictionary, a3);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionary, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (id)cacheEventWithTotalCount:(unint64_t)a3 last24HoursCount:(unint64_t)a4
{
  TBCacheAnalyticsEvent *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init(TBCacheAnalyticsEvent);
  -[TBCacheAnalyticsEvent setEventName:](v6, "setEventName:", CFSTR("com.apple.wifi.3bars.cache"));
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("total"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("recent"));

  -[TBCacheAnalyticsEvent setEventDictionary:](v6, "setEventDictionary:", v7);
  return v6;
}

+ (id)cacheAvailabilityEventWithStatus:(unint64_t)a3
{
  TBCacheAnalyticsEvent *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_alloc_init(TBCacheAnalyticsEvent);
  -[TBCacheAnalyticsEvent setEventName:](v4, "setEventName:", CFSTR("com.apple.wifi.3bars.cache_availability"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("status"));

  v7 = (void *)MEMORY[0x1D17AC818]();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 96, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("hour"));

  objc_autoreleasePoolPop(v7);
  -[TBCacheAnalyticsEvent setEventDictionary:](v4, "setEventDictionary:", v5);

  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSNumber)staleness
{
  return self->_staleness;
}

- (void)setStaleness:(id)a3
{
  self->_staleness = (NSNumber *)a3;
}

- (NSNumber)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(id)a3
{
  self->_tileKey = (NSNumber *)a3;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSNumber *)a3;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  self->_errorCode = (NSNumber *)a3;
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

@end
