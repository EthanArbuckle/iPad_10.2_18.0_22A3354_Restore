@implementation APAccumulator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APAccumulator)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  APAccumulator *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("accumulationTime")));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("inactivityTime")));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("itemLimit")));

  v10 = -[APAccumulator initWithAccumulationTime:inactivityTime:itemLimit:](self, "initWithAccumulationTime:inactivityTime:itemLimit:", v6, v8, objc_msgSend(v9, "unsignedIntegerValue"));
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[APAccumulator accumulationTime](self, "accumulationTime")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accumulationTime"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[APAccumulator inactivityTime](self, "inactivityTime")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("inactivityTime"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[APAccumulator itemLimit](self, "itemLimit")));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("itemLimit"));

}

- (APAccumulator)initWithAccumulationTime:(unint64_t)a3 inactivityTime:(unint64_t)a4 itemLimit:(unint64_t)a5
{
  APAccumulator *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSMutableArray *items;
  APUnfairLock *v13;
  APUnfairLock *lock;
  dispatch_queue_t v15;
  OS_dispatch_queue *dispatchQueue;
  objc_super v18;
  uint8_t buf[4];
  APAccumulator *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;

  v18.receiver = self;
  v18.super_class = (Class)APAccumulator;
  v8 = -[APAccumulator init](&v18, "init");
  if (v8)
  {
    v9 = APLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218752;
      v20 = v8;
      v21 = 2048;
      v22 = a3;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%p: creating accumulator with time %lu, inactivity %lu, itemLimit %lu", buf, 0x2Au);
    }

    v8->_accumulationTime = a3;
    v8->_inactivityTime = a4;
    v8->_itemLimit = a5;
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
    items = v8->_items;
    v8->_items = (NSMutableArray *)v11;

    v13 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    lock = v8->_lock;
    v8->_lock = v13;

    v15 = dispatch_queue_create("apaccumulator_queue", 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v15;

  }
  return v8;
}

- (void)accumulate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B3B34;
  v7[3] = &unk_1002141A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)accumulatedItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator lock](self, "lock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator items](self, "items"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator lock](self, "lock"));
  objc_msgSend(v6, "unlock");

  return (NSArray *)v5;
}

+ (id)_accumulationReasonToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Invalid reason");
  else
    return *(&off_1002141C0 + a3 - 1);
}

- (void)_stopAccumulationSource
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_source *dispatchSourceAccumulation;
  int v8;
  APAccumulator *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceAccumulation](self, "dispatchSourceAccumulation"));

  if (v3)
  {
    v4 = APLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%p: stopping accumulation timer.", (uint8_t *)&v8, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceAccumulation](self, "dispatchSourceAccumulation"));
    dispatch_source_cancel(v6);

    dispatchSourceAccumulation = self->_dispatchSourceAccumulation;
    self->_dispatchSourceAccumulation = 0;

  }
}

- (void)_startAccumulationSource
{
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_source_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  APAccumulator *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  dispatch_time_t v17;

  if (-[APAccumulator accumulationTime](self, "accumulationTime"))
  {
    v3 = dispatch_time(0, 1000000 * -[APAccumulator accumulationTime](self, "accumulationTime"));
    v4 = APLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v13 = self;
      v14 = 2048;
      v15 = -[APAccumulator accumulationTime](self, "accumulationTime");
      v16 = 2048;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%p: starting accumulation timer for %lu mS (%llu nS).", buf, 0x20u);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchQueue](self, "dispatchQueue"));
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v6);
    -[APAccumulator setDispatchSourceAccumulation:](self, "setDispatchSourceAccumulation:", v7);

    v8 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceAccumulation](self, "dispatchSourceAccumulation"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000B40CC;
    handler[3] = &unk_100212FE0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    v9 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceAccumulation](self, "dispatchSourceAccumulation"));
    dispatch_source_set_timer(v9, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    v10 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceAccumulation](self, "dispatchSourceAccumulation"));
    dispatch_resume(v10);

    -[APAccumulator setStartTime:](self, "setStartTime:", CFAbsoluteTimeGetCurrent());
  }
}

- (void)_stopInactivitySource
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  APAccumulator *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceInactivity](self, "dispatchSourceInactivity"));

  if (v3)
  {
    v4 = APLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%p: stopping inactivity timer.", (uint8_t *)&v7, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceInactivity](self, "dispatchSourceInactivity"));
    dispatch_source_cancel(v6);

    -[APAccumulator setDispatchSourceInactivity:](self, "setDispatchSourceInactivity:", 0);
  }
}

- (void)_startInactivitySource
{
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_source_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  APAccumulator *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  dispatch_time_t v17;

  if (-[APAccumulator inactivityTime](self, "inactivityTime"))
  {
    v3 = dispatch_time(0, 1000000 * -[APAccumulator inactivityTime](self, "inactivityTime"));
    v4 = APLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v13 = self;
      v14 = 2048;
      v15 = -[APAccumulator inactivityTime](self, "inactivityTime");
      v16 = 2048;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%p: starting inactivity timer for %lu mS (%llu nS).", buf, 0x20u);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchQueue](self, "dispatchQueue"));
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v6);
    -[APAccumulator setDispatchSourceInactivity:](self, "setDispatchSourceInactivity:", v7);

    v8 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceInactivity](self, "dispatchSourceInactivity"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000B4368;
    handler[3] = &unk_100212FE0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    v9 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceInactivity](self, "dispatchSourceInactivity"));
    dispatch_source_set_timer(v9, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    v10 = objc_claimAutoreleasedReturnValue(-[APAccumulator dispatchSourceInactivity](self, "dispatchSourceInactivity"));
    dispatch_resume(v10);

  }
}

- (void)_callAccumulationHandlerWithReason:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  double Current;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  NSObject *v17;
  int v18;
  double v19;
  __int16 v20;
  void *v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator items](self, "items"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator items](self, "items"));
  objc_msgSend(v7, "removeAllObjects");

  v8 = APLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[APAccumulator startTime](self, "startTime");
    v12 = (Current - v11) * 1000.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[APAccumulator _accumulationReasonToString:](APAccumulator, "_accumulationReasonToString:", a3));
    v18 = 134218242;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Calling accumulation handler after %.0f mS with reason \"%{public}@\", (uint8_t *)&v18, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator accumulationHandler](self, "accumulationHandler"));

  if (v14)
  {
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APAccumulator accumulationHandler](self, "accumulationHandler"));
    ((void (**)(_QWORD, id, int64_t))v15)[2](v15, v6, a3);

  }
  -[APAccumulator setStartTime:](self, "setStartTime:", 0.0);
  v16 = APLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = *(double *)&self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%p: emptying accumulated items.", (uint8_t *)&v18, 0xCu);
  }

}

- (void)_inactivityEventHandler
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  APAccumulator *v7;
  __int16 v8;
  id v9;

  v3 = APLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator accumulatedItems](self, "accumulatedItems"));
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%p: Calling inactivity event handler with %ld items.", (uint8_t *)&v6, 0x16u);

  }
  -[APAccumulator _stopAccumulationSource](self, "_stopAccumulationSource");
  -[APAccumulator _callAccumulationHandlerWithReason:](self, "_callAccumulationHandlerWithReason:", 3);
  -[APAccumulator _stopInactivitySource](self, "_stopInactivitySource");
}

- (void)_accumulationEventHandler
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  APAccumulator *v7;
  __int16 v8;
  id v9;

  v3 = APLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAccumulator accumulatedItems](self, "accumulatedItems"));
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%p: Calling accumulation handler with %ld items.", (uint8_t *)&v6, 0x16u);

  }
  -[APAccumulator _stopInactivitySource](self, "_stopInactivitySource");
  -[APAccumulator _callAccumulationHandlerWithReason:](self, "_callAccumulationHandlerWithReason:", 2);
  -[APAccumulator _stopAccumulationSource](self, "_stopAccumulationSource");
}

- (id)accumulationHandler
{
  return self->_accumulationHandler;
}

- (void)setAccumulationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong(&self->_userData, a3);
}

- (unint64_t)accumulationTime
{
  return self->_accumulationTime;
}

- (void)setAccumulationTime:(unint64_t)a3
{
  self->_accumulationTime = a3;
}

- (OS_dispatch_source)dispatchSourceInactivity
{
  return self->_dispatchSourceInactivity;
}

- (void)setDispatchSourceInactivity:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSourceInactivity, a3);
}

- (OS_dispatch_source)dispatchSourceAccumulation
{
  return self->_dispatchSourceAccumulation;
}

- (void)setDispatchSourceAccumulation:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSourceAccumulation, a3);
}

- (unint64_t)inactivityTime
{
  return self->_inactivityTime;
}

- (void)setInactivityTime:(unint64_t)a3
{
  self->_inactivityTime = a3;
}

- (unint64_t)itemLimit
{
  return self->_itemLimit;
}

- (void)setItemLimit:(unint64_t)a3
{
  self->_itemLimit = a3;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dispatchSourceAccumulation, 0);
  objc_storeStrong((id *)&self->_dispatchSourceInactivity, 0);
  objc_storeStrong(&self->_userData, 0);
  objc_storeStrong(&self->_accumulationHandler, 0);
}

@end
