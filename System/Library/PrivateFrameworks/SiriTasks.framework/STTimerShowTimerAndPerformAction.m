@implementation STTimerShowTimerAndPerformAction

- (id)_initWithTimer:(id)a3 action:(unint64_t)a4
{
  id v6;
  STTimerShowTimerAndPerformAction *v7;
  uint64_t v8;
  NSArray *timers;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STTimerShowTimerAndPerformAction;
  v7 = -[AFSiriRequest init](&v11, sel_init);
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      timers = v7->_timers;
      v7->_timers = (NSArray *)v8;

    }
    v7->_action = a4;
  }

  return v7;
}

- (id)_initWithTimers:(id)a3 action:(unint64_t)a4
{
  return -[STTimerShowTimerAndPerformAction _initWithTimers:templateActions:timerAction:](self, "_initWithTimers:templateActions:timerAction:", a3, 0, a4);
}

- (id)_initWithTimers:(id)a3 templateActions:(id)a4 timerAction:(unint64_t)a5
{
  id v8;
  id v9;
  STTimerShowTimerAndPerformAction *v10;
  uint64_t v11;
  NSArray *timers;
  uint64_t v13;
  NSArray *templateActions;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STTimerShowTimerAndPerformAction;
  v10 = -[AFSiriRequest init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    timers = v10->_timers;
    v10->_timers = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    templateActions = v10->_templateActions;
    v10->_templateActions = (NSArray *)v13;

    v10->_action = a5;
  }

  return v10;
}

- (id)timer
{
  return -[NSArray firstObject](self->_timers, "firstObject");
}

- (unint64_t)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STTimerShowTimerAndPerformAction;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_timers, CFSTR("_timers"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_templateActions, CFSTR("_templateActions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_action, CFSTR("_action"));

}

- (STTimerShowTimerAndPerformAction)initWithCoder:(id)a3
{
  id v4;
  STTimerShowTimerAndPerformAction *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *timers;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *templateActions;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STTimerShowTimerAndPerformAction;
  v5 = -[AFSiriRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_timers"));
    v9 = objc_claimAutoreleasedReturnValue();
    timers = v5->_timers;
    v5->_timers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_templateActions"));
    v14 = objc_claimAutoreleasedReturnValue();
    templateActions = v5->_templateActions;
    v5->_templateActions = (NSArray *)v14;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_action"));
  }

  return v5;
}

- (NSArray)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)templateActions
{
  return self->_templateActions;
}

- (void)setTemplateActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateActions, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
