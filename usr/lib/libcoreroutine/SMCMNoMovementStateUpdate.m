@implementation SMCMNoMovementStateUpdate

- (SMCMNoMovementStateUpdate)initWithState:(int64_t)a3 startTime:(id)a4
{
  id v7;
  SMCMNoMovementStateUpdate *v8;
  SMCMNoMovementStateUpdate *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SMCMNoMovementStateUpdate;
  v8 = -[SMCMNoMovementStateUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_startTime, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMCMNoMovementStateUpdate convertSMCMNoMovementStateToString:](SMCMNoMovementStateUpdate, "convertSMCMNoMovementStateToString:", -[SMCMNoMovementStateUpdate state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCMNoMovementStateUpdate startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, state: %@, startTime: %@>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)convertSMCMNoMovementStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E92A2448[a3];
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
