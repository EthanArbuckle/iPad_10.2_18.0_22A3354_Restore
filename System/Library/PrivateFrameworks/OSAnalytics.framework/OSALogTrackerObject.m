@implementation OSALogTrackerObject

+ (id)sharedTrackers
{
  if (sharedTrackers_onceToken != -1)
    dispatch_once(&sharedTrackers_onceToken, &__block_literal_global_13);
  return (id)sharedTrackers_sharedLogTrackers;
}

- (NSDate)oldestDate
{
  return self->_oldestDate;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (OSALogTrackerObject)init
{
  OSALogTrackerObject *v2;
  OSALogTrackerObject *v3;
  uint64_t v4;
  NSMutableDictionary *signatures;
  uint64_t v6;
  NSDate *oldestDate;
  NSString *oldestLogPath;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OSALogTrackerObject;
  v2 = -[OSALogTrackerObject init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_count = 1;
    v4 = objc_opt_new();
    signatures = v3->_signatures;
    v3->_signatures = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    oldestDate = v3->_oldestDate;
    v3->_oldestDate = (NSDate *)v6;

    oldestLogPath = v3->_oldestLogPath;
    v3->_oldestLogPath = 0;

  }
  return v3;
}

+ (id)tracker
{
  return objc_alloc_init((Class)a1);
}

void __37__OSALogTrackerObject_sharedTrackers__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)sAccountingSemaphore;
  sAccountingSemaphore = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)sharedTrackers_sharedLogTrackers;
  sharedTrackers_sharedLogTrackers = (uint64_t)v2;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_count);
}

- (NSString)oldestLogPath
{
  return self->_oldestLogPath;
}

- (void)setOldestLogPath:(id)a3
{
  objc_storeStrong((id *)&self->_oldestLogPath, a3);
}

- (void)setOldestDate:(id)a3
{
  objc_storeStrong((id *)&self->_oldestDate, a3);
}

- (NSMutableDictionary)signatures
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_oldestDate, 0);
  objc_storeStrong((id *)&self->_oldestLogPath, 0);
}

@end
