@implementation PDScheduledActivityClient

- (PDScheduledActivityClient)initWithClientInstance:(id)a3 activityQueue:(id)a4
{
  id v6;
  id v7;
  PDScheduledActivityClient *v8;
  PDScheduledActivityClient *v9;
  uint64_t v10;
  NSMutableDictionary *activityRegistrations;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDScheduledActivityClient;
  v8 = -[PDScheduledActivityClient init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clientInstance, v6);
    objc_storeStrong((id *)&v9->_activityQueue, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    activityRegistrations = v9->_activityRegistrations;
    v9->_activityRegistrations = (NSMutableDictionary *)v10;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDScheduledActivityClient)initWithCoder:(id)a3
{
  id v4;
  PDScheduledActivityClient *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *activityRegistrations;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDScheduledActivityClient;
  v5 = -[PDScheduledActivityClient init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("activityRegistrations"));
    v10 = objc_claimAutoreleasedReturnValue();
    activityRegistrations = v5->_activityRegistrations;
    v5->_activityRegistrations = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_activityRegistrations, CFSTR("activityRegistrations"));
}

- (BOOL)isValid
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientInstance);
  if (WeakRetained)
    v4 = self->_activityQueue != 0;
  else
    v4 = 0;

  return v4;
}

- (PDScheduledActivityClient)clientInstance
{
  return (PDScheduledActivityClient *)objc_loadWeakRetained((id *)&self->_clientInstance);
}

- (void)setClientInstance:(id)a3
{
  objc_storeWeak((id *)&self->_clientInstance, a3);
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityQueue, a3);
}

- (NSMutableDictionary)activityRegistrations
{
  return self->_activityRegistrations;
}

- (void)setActivityRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_activityRegistrations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityRegistrations, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_destroyWeak((id *)&self->_clientInstance);
}

@end
