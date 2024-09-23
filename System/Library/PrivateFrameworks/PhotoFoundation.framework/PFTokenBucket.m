@implementation PFTokenBucket

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillRate:(int64_t)a5
{
  id v8;
  void *v9;
  PFTokenBucket *v10;

  v8 = a3;
  +[PFTimeService defaultTimeService](PFTimeService, "defaultTimeService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PFTokenBucket initWithName:capacity:refillRate:timeService:](self, "initWithName:capacity:refillRate:timeService:", v8, a4, a5, v9);

  return v10;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillRate:(int64_t)a5 timeService:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  PFTokenBucket *v14;

  v10 = (objc_class *)MEMORY[0x1E0CB3598];
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithMantissa:exponent:isNegative:", a5, 4294967293, 0);
  v14 = -[PFTokenBucket initWithName:capacity:decimalRefillRatePerMsec:timeService:](self, "initWithName:capacity:decimalRefillRatePerMsec:timeService:", v12, a4, v13, v11);

  return v14;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillPeriod:(int64_t)a5
{
  id v8;
  void *v9;
  PFTokenBucket *v10;

  v8 = a3;
  +[PFTimeService defaultTimeService](PFTimeService, "defaultTimeService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PFTokenBucket initWithName:capacity:refillPeriod:timeService:](self, "initWithName:capacity:refillPeriod:timeService:", v8, a4, a5, v9);

  return v10;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 refillPeriod:(int64_t)a5 timeService:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PFTokenBucket *v16;

  v10 = (objc_class *)MEMORY[0x1E0CB3598];
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithMantissa:exponent:isNegative:", a5, 3, 0);
  objc_msgSend(MEMORY[0x1E0CB3598], "one");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "decimalNumberByDividingBy:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PFTokenBucket initWithName:capacity:decimalRefillRatePerMsec:timeService:](self, "initWithName:capacity:decimalRefillRatePerMsec:timeService:", v12, a4, v15, v11);

  return v16;
}

- (PFTokenBucket)initWithName:(id)a3 capacity:(int64_t)a4 decimalRefillRatePerMsec:(id)a5 timeService:(id)a6
{
  id v10;
  id v11;
  id v12;
  PFTokenBucket *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSDecimalNumber *capacity;
  uint64_t v18;
  OS_os_log *log;
  PFStateCaptureHandler *v20;
  PFStateCaptureHandler *stateHandler;
  uint64_t v22;
  NSDecimalNumber *lock_availableTokens;
  PFTokenBucket *v24;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PFTokenBucket;
  v13 = -[PFTokenBucket init](&v26, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithMantissa:exponent:isNegative:", a4, 0, 0);
    capacity = v13->_capacity;
    v13->_capacity = (NSDecimalNumber *)v16;

    objc_storeStrong((id *)&v13->_refillRatePerMsec, a5);
    objc_storeStrong((id *)&v13->_timeService, a6);
    PFBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    log = v13->_log;
    v13->_log = (OS_os_log *)v18;

    v20 = -[PFStateCaptureHandler initWithProvider:]([PFStateCaptureHandler alloc], "initWithProvider:", v13);
    stateHandler = v13->_stateHandler;
    v13->_stateHandler = v20;

    v13->_lock._os_unfair_lock_opaque = 0;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithMantissa:exponent:isNegative:", a4, 0, 0);
    lock_availableTokens = v13->_lock_availableTokens;
    v13->_lock_availableTokens = (NSDecimalNumber *)v22;

    v13->_lock_lastRefillMsecs = -[PFTimeService clock_gettime_nsec_np:](v13->_timeService, "clock_gettime_nsec_np:", 4)/ 0xF4240;
    v24 = v13;
  }

  return v13;
}

- (BOOL)removeToken
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t lock_lastRefillMsecs;
  void *v7;
  void *v8;
  NSDecimalNumber *v9;
  NSDecimalNumber *v10;
  NSDecimalNumber *lock_availableTokens;
  NSDecimalNumber *v12;
  NSComparisonResult v13;
  BOOL v14;
  os_signpost_id_t v15;
  OS_os_log *v16;
  NSObject *v17;
  NSString *name;
  NSDecimalNumber *v19;
  NSDecimalNumber *v20;
  NSDecimalNumber *v21;
  int v23;
  NSString *v24;
  __int16 v25;
  NSDecimalNumber *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3598], "one");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    v4 = (void *)MEMORY[0x1BCCA2610]();
    os_unfair_lock_assert_owner(&self->_lock);
    v5 = -[PFTimeService clock_gettime_nsec_np:](self->_timeService, "clock_gettime_nsec_np:", 4) / 0xF4240;
    lock_lastRefillMsecs = self->_lock_lastRefillMsecs;
    if (v5 > lock_lastRefillMsecs)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithMantissa:exponent:isNegative:", v5 - lock_lastRefillMsecs, 0, 0);
      objc_msgSend(v7, "decimalNumberByMultiplyingBy:", self->_refillRatePerMsec);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDecimalNumber decimalNumberByAdding:](self->_lock_availableTokens, "decimalNumberByAdding:", v8);
      v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      if (-[NSDecimalNumber compare:](v9, "compare:", self->_capacity) == NSOrderedDescending)
      {
        v10 = self->_capacity;

        v9 = v10;
      }
      lock_availableTokens = self->_lock_availableTokens;
      self->_lock_availableTokens = v9;
      v12 = v9;

      self->_lock_lastRefillMsecs = v5;
    }
    v13 = -[NSDecimalNumber compare:](self->_lock_availableTokens, "compare:", v3);
    v14 = v13 != NSOrderedAscending;
    if (v13 != NSOrderedAscending)
    {
      v15 = os_signpost_id_generate((os_log_t)self->_log);
      v16 = self->_log;
      v17 = v16;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
      {
        name = self->_name;
        v19 = self->_lock_availableTokens;
        v23 = 138412546;
        v24 = name;
        v25 = 2112;
        v26 = v19;
        _os_signpost_emit_with_name_impl(&dword_1B70DA000, v17, OS_SIGNPOST_EVENT, v15, "PFTokenBucket consume", "name: %@, availableTokens: %@", (uint8_t *)&v23, 0x16u);
      }

      -[NSDecimalNumber decimalNumberBySubtracting:](self->_lock_availableTokens, "decimalNumberBySubtracting:", v3);
      v20 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      v21 = self->_lock_availableTokens;
      self->_lock_availableTokens = v20;

    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)stateCaptureDictionary
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_lastRefillMsecs;
  NSDecimalNumber *v5;
  unint64_t v6;
  NSDecimalNumber *refillRatePerMsec;
  void *v8;
  void *v9;
  _QWORD v11[5];
  __int128 v12;
  NSDecimalNumber *v13;
  NSDecimalNumber *v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_lastRefillMsecs = self->_lock_lastRefillMsecs;
  v5 = self->_lock_availableTokens;
  os_unfair_lock_unlock(p_lock);
  v6 = -[PFTimeService clock_gettime_nsec_np:](self->_timeService, "clock_gettime_nsec_np:", 4);
  v12 = *(_OWORD *)&self->_name;
  v11[0] = CFSTR("name");
  v11[1] = CFSTR("capacity");
  refillRatePerMsec = self->_refillRatePerMsec;
  v11[2] = CFSTR("refillRatePerMsec");
  v11[3] = CFSTR("available tokens");
  v13 = refillRatePerMsec;
  v14 = v5;
  v11[4] = CFSTR("last refill (ms ago)");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6 / 0xF4240 - lock_lastRefillMsecs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_availableTokens, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_timeService, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_refillRatePerMsec, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
