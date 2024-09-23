@implementation TRIBaseTask

- (NSString)taskName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSArray)tags
{
  return 0;
}

- (NSArray)dependencies
{
  return 0;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  TRIBaseTask *v4;
  TRIBaseTask *v5;
  char isKindOfClass;

  v4 = (TRIBaseTask *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TRIBaseTask taskName](self, "taskName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 629;

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (NSDate)startTime
{
  return self->startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->startTime, a3);
}

- (TRITaskQueueStateProviding)stateProvider
{
  return (TRITaskQueueStateProviding *)objc_loadWeakRetained((id *)&self->_stateProvider);
}

- (void)setStateProvider:(id)a3
{
  objc_storeWeak((id *)&self->_stateProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateProvider);
  objc_storeStrong((id *)&self->startTime, 0);
}

@end
