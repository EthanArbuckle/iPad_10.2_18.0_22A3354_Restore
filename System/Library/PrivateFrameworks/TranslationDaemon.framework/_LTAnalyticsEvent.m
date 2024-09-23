@implementation _LTAnalyticsEvent

- (_LTAnalyticsEvent)initWithName:(id)a3
{
  id v4;
  _LTAnalyticsEvent *v5;
  _LTAnalyticsEvent *v6;
  uint64_t v7;
  NSString *eventName;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableDictionary *fields;
  _LTAnalyticsEvent *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTAnalyticsEvent;
  v5 = -[_LTAnalyticsEvent init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_startTime = xmmword_249338500;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.translation"), v4);
    v7 = objc_claimAutoreleasedReturnValue();
    eventName = v6->_eventName;
    v6->_eventName = (NSString *)v7;

    v9 = dispatch_queue_create("com.apple.translation.analytics-event", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    fields = v6->_fields;
    v6->_fields = (NSMutableDictionary *)v11;

    v13 = v6;
  }

  return v6;
}

+ (id)timedEventWithName:(id)a3
{
  id v3;
  _LTAnalyticsEvent *v4;

  v3 = a3;
  v4 = -[_LTAnalyticsEvent initWithName:]([_LTAnalyticsEvent alloc], "initWithName:", v3);

  -[_LTAnalyticsEvent markStart](v4, "markStart");
  return v4;
}

- (void)markStart
{
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  self->_startTime = v3;

}

- (void)markEnd
{
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  self->_endTime = v3;

}

- (void)timestampWithName:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemUptime");
  v7 = v6;

  v8 = v7 - self->_startTime;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39___LTAnalyticsEvent_timestampWithName___block_invoke;
  v11[3] = &unk_251A10FA8;
  objc_copyWeak(v13, &location);
  v12 = v4;
  v13[1] = *(id *)&v8;
  v10 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)addFieldsFromDictionary:(id)a3
{
  -[_LTAnalyticsEvent addFieldsFromDictionary:internalOnly:](self, "addFieldsFromDictionary:internalOnly:", a3, 0);
}

- (void)addFieldsFromDictionary:(id)a3 internalOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *queue;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a4;
  v6 = a3;
  if (!v4 || _LTIsInternalInstall())
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58___LTAnalyticsEvent_addFieldsFromDictionary_internalOnly___block_invoke;
    block[3] = &unk_251A10FD0;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)addFieldsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("errorDomain");
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("errorDescription");
  objc_msgSend(v4, "localizedDescription");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = &stru_251A15610;
  if (v7)
    v8 = v7;
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTAnalyticsEvent addFieldsFromDictionary:](self, "addFieldsFromDictionary:", v9);

}

- (void)sendLazy
{
  NSObject *queue;
  _QWORD block[5];
  id v5;
  id location;

  if (self->_endTime < 0.0)
    -[_LTAnalyticsEvent markEnd](self, "markEnd");
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29___LTAnalyticsEvent_sendLazy__block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
