@implementation PMMContextHelper

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  return (id)sharedInstance__pasExprOnceResult;
}

void __34__PMMContextHelper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A1C610]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (PMMContextHelper)init
{
  PMMContextHelper *v2;
  uint64_t v3;
  _CDLocalContext *context;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMMContextHelper;
  v2 = -[PMMContextHelper init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v3 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v3;

  }
  return v2;
}

- (void)registerForNotifications:(id)a3
{
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", a3);
}

- (id)fetchContextValueForKeyPath:(id)a3
{
  return (id)-[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", a3);
}

- (id)fetchDataDictionaryForKeyPath:(id)a3
{
  void *v3;
  id v4;

  -[PMMContextHelper fetchContextValueForKeyPath:](self, "fetchContextValueForKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
