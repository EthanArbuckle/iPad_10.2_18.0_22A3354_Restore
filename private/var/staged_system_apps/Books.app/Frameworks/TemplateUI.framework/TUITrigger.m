@implementation TUITrigger

- (TUITrigger)initWithName:(id)a3
{
  return -[TUITrigger initWithName:observationMode:](self, "initWithName:observationMode:", a3, 0);
}

- (TUITrigger)initWithName:(id)a3 observationMode:(unint64_t)a4
{
  id v7;
  TUITrigger *v8;
  TUITrigger *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUITrigger;
  v8 = -[TUITrigger init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_observationMode = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_opt_class(TUITrigger);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUITrigger name](self, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = -[TUITrigger observationMode](self, "observationMode");
      v11 = v10 == objc_msgSend(v7, "observationMode");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)observationMode
{
  return self->_observationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end
