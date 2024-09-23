@implementation _WBSSafariCyclerConfigurationCommand

- (_WBSSafariCyclerConfigurationCommand)init
{

  return 0;
}

- (_WBSSafariCyclerConfigurationCommand)initWithName:(id)a3 help:(id)a4
{
  id v6;
  id v7;
  _WBSSafariCyclerConfigurationCommand *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *help;
  _WBSSafariCyclerConfigurationCommand *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_WBSSafariCyclerConfigurationCommand;
  v8 = -[_WBSSafariCyclerConfigurationCommand init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    help = v8->_help;
    v8->_help = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)setArgumentCount:(unint64_t)a3
{
  self->_minimumArgumentCount = a3;
  self->_maximumArgumentCount = a3;
}

- (BOOL)invokeWithParameters:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (objc_msgSend(v4, "count") >= self->_minimumArgumentCount
    && objc_msgSend(v4, "count") <= self->_maximumArgumentCount)
  {
    objc_msgSend(WeakRetained, self->_action, v4);
    v8 = 1;
  }
  else
  {
    printf("Invalid arguments to subcommand '%s'", -[NSString UTF8String](self->_name, "UTF8String"));
    if (self->_usage)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("\nUSAGE: %s %s %s\n", (const char *)objc_msgSend(v7, "UTF8String"), -[NSString UTF8String](self->_name, "UTF8String"), -[NSString UTF8String](self->_usage, "UTF8String"));

    }
    v8 = 0;
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)help
{
  return self->_help;
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)minimumArgumentCount
{
  return self->_minimumArgumentCount;
}

- (void)setMinimumArgumentCount:(unint64_t)a3
{
  self->_minimumArgumentCount = a3;
}

- (unint64_t)maximumArgumentCount
{
  return self->_maximumArgumentCount;
}

- (void)setMaximumArgumentCount:(unint64_t)a3
{
  self->_maximumArgumentCount = a3;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_help, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
