@implementation REMAppStoreDataViewConfigurationsInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAppStoreDataViewConfigurationsInvocationResult)initWithCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3 numberOfForegroundsThreshold:(unint64_t)a4 timeIntervalOfInterest:(double)a5 timeIntervalSinceInitialForeground:(double)a6 timeIntervalSinceLastPrompt:(double)a7 timeIntervalSinceLastFetch:(double)a8
{
  REMAppStoreDataViewConfigurationsInvocationResult *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)REMAppStoreDataViewConfigurationsInvocationResult;
  result = -[REMStoreInvocationValueStorage init](&v15, sel_init);
  if (result)
  {
    result->_createdOrCompletedRemindersCountThreshold = a3;
    result->_numberOfForegroundsThreshold = a4;
    result->_timeIntervalOfInterest = a5;
    result->_timeIntervalSinceInitialForeground = a6;
    result->_timeIntervalSinceLastPrompt = a7;
    result->_timeIntervalSinceLastFetch = a8;
  }
  return result;
}

- (REMAppStoreDataViewConfigurationsInvocationResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  v5 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("createdOrCompletedRemindersCountThreshold"));
  v6 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("numberOfForegroundsThreshold"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeIntervalOfInterest"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeIntervalSinceInitialForeground"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeIntervalSinceLastPrompt"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeIntervalSinceLastFetch"));
  v14 = v13;

  return -[REMAppStoreDataViewConfigurationsInvocationResult initWithCreatedOrCompletedRemindersCountThreshold:numberOfForegroundsThreshold:timeIntervalOfInterest:timeIntervalSinceInitialForeground:timeIntervalSinceLastPrompt:timeIntervalSinceLastFetch:](self, "initWithCreatedOrCompletedRemindersCountThreshold:numberOfForegroundsThreshold:timeIntervalOfInterest:timeIntervalSinceInitialForeground:timeIntervalSinceLastPrompt:timeIntervalSinceLastFetch:", v5, v6, v8, v10, v12, v14);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAppStoreDataViewConfigurationsInvocationResult createdOrCompletedRemindersCountThreshold](self, "createdOrCompletedRemindersCountThreshold"), CFSTR("createdOrCompletedRemindersCountThreshold"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAppStoreDataViewConfigurationsInvocationResult numberOfForegroundsThreshold](self, "numberOfForegroundsThreshold"), CFSTR("numberOfForegroundsThreshold"));
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalOfInterest](self, "timeIntervalOfInterest");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeIntervalOfInterest"));
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceInitialForeground](self, "timeIntervalSinceInitialForeground");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeIntervalSinceInitialForeground"));
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeIntervalSinceLastPrompt"));
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastFetch](self, "timeIntervalSinceLastFetch");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeIntervalSinceLastFetch"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v18;
  double v19;
  double v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v5 = -[REMAppStoreDataViewConfigurationsInvocationResult createdOrCompletedRemindersCountThreshold](self, "createdOrCompletedRemindersCountThreshold");
  if (v5 != objc_msgSend(v4, "createdOrCompletedRemindersCountThreshold"))
    goto LABEL_7;
  v6 = -[REMAppStoreDataViewConfigurationsInvocationResult numberOfForegroundsThreshold](self, "numberOfForegroundsThreshold");
  if (v6 != objc_msgSend(v4, "numberOfForegroundsThreshold"))
    goto LABEL_7;
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalOfInterest](self, "timeIntervalOfInterest");
  v8 = v7;
  objc_msgSend(v4, "timeIntervalOfInterest");
  if (v8 != v9)
    goto LABEL_7;
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceInitialForeground](self, "timeIntervalSinceInitialForeground");
  v11 = v10;
  objc_msgSend(v4, "timeIntervalSinceInitialForeground");
  if (v11 == v12
    && (-[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt"), v14 = v13, objc_msgSend(v4, "timeIntervalSinceLastPrompt"), v14 == v15))
  {
    -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastFetch](self, "timeIntervalSinceLastFetch");
    v19 = v18;
    objc_msgSend(v4, "timeIntervalSinceLastFetch");
    v16 = v19 == v20;
  }
  else
  {
LABEL_7:
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = -[REMAppStoreDataViewConfigurationsInvocationResult createdOrCompletedRemindersCountThreshold](self, "createdOrCompletedRemindersCountThreshold");
  v4 = (double)(-[REMAppStoreDataViewConfigurationsInvocationResult numberOfForegroundsThreshold](self, "numberOfForegroundsThreshold")+ v3);
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalOfInterest](self, "timeIntervalOfInterest");
  v6 = v5 + v4;
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceInitialForeground](self, "timeIntervalSinceInitialForeground");
  v8 = v7 + v6;
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt");
  v10 = v9 + v8;
  -[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastFetch](self, "timeIntervalSinceLastFetch");
  return (unint64_t)(v11 + v10);
}

- (unint64_t)createdOrCompletedRemindersCountThreshold
{
  return self->_createdOrCompletedRemindersCountThreshold;
}

- (unint64_t)numberOfForegroundsThreshold
{
  return self->_numberOfForegroundsThreshold;
}

- (double)timeIntervalOfInterest
{
  return self->_timeIntervalOfInterest;
}

- (double)timeIntervalSinceInitialForeground
{
  return self->_timeIntervalSinceInitialForeground;
}

- (double)timeIntervalSinceLastPrompt
{
  return self->_timeIntervalSinceLastPrompt;
}

- (double)timeIntervalSinceLastFetch
{
  return self->_timeIntervalSinceLastFetch;
}

@end
