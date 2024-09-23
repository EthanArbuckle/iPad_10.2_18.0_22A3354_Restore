@implementation SVXServiceCommandDelayedAction

- (SVXServiceCommandDelayedAction)initWithCommand:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  SVXServiceCommandDelayedAction *v8;
  uint64_t v9;
  SAUIDelayedActionCommand *command;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXServiceCommandDelayedAction;
  v8 = -[SVXServiceCommandDelayedAction init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    command = v8->_command;
    v8->_command = (SAUIDelayedActionCommand *)v9;

    objc_storeStrong((id *)&v8->_taskTracker, a4);
  }

  return v8;
}

- (SAUIDelayedActionCommand)command
{
  return self->_command;
}

- (SVXTaskTracking)taskTracker
{
  return self->_taskTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
