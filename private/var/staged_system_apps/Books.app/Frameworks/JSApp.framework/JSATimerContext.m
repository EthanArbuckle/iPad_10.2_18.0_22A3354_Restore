@implementation JSATimerContext

- (JSATimerContext)initWithCallback:(id)a3 callbackArgs:(id)a4 ownerObject:(id)a5 repeating:(BOOL)a6 interval:(double)a7 timer:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  JSATimerContext *v18;
  JSATimerContext *v19;
  uint64_t v20;
  JSManagedValue *managedCallback;
  JSAManagedArray *v22;
  JSAManagedArray *managedArgs;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)JSATimerContext;
  v18 = -[JSATimerContext init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(&v18->_ownerObject, a5);
    v20 = objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:andOwner:](JSManagedValue, "managedValueWithValue:andOwner:", v14, v16));
    managedCallback = v19->_managedCallback;
    v19->_managedCallback = (JSManagedValue *)v20;

    if (objc_msgSend(v15, "count"))
    {
      v22 = -[JSAManagedArray initWithArray:ownerObject:]([JSAManagedArray alloc], "initWithArray:ownerObject:", v15, v16);
      managedArgs = v19->_managedArgs;
      v19->_managedArgs = v22;
    }
    else
    {
      managedArgs = v19->_managedArgs;
      v19->_managedArgs = 0;
    }

    v19->_interval = a7;
    v19->_isRepeating = a6;
    objc_storeStrong((id *)&v19->_timer, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSATimerContext timer](self, "timer"));
  v4 = -[JSATimerContext isRepeating](self, "isRepeating");
  -[JSATimerContext interval](self, "interval");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<JSATimerContext %p, timer=%p, repeating=%d, interval=%0.3gs>"), self, v3, v4, v5));

  return v6;
}

- (void)removeManagedReferences
{
  void *v3;
  void *v4;
  void *v5;
  JSManagedValue *managedCallback;
  JSAManagedArray *managedArgs;
  NSTimer *timer;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_managedCallback, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualMachine"));
  objc_msgSend(v5, "removeManagedReference:withOwner:", self->_managedCallback, self->_ownerObject);

  managedCallback = self->_managedCallback;
  self->_managedCallback = 0;

  managedArgs = self->_managedArgs;
  self->_managedArgs = 0;

  timer = self->_timer;
  self->_timer = 0;

}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;

  if (self->_managedCallback)
  {
    v3 = JSALog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_71C18(v4);

    -[JSATimerContext removeManagedReferences](self, "removeManagedReferences");
  }
  v5.receiver = self;
  v5.super_class = (Class)JSATimerContext;
  -[JSATimerContext dealloc](&v5, "dealloc");
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (JSManagedValue)managedCallback
{
  return self->_managedCallback;
}

- (JSAManagedArray)managedArgs
{
  return self->_managedArgs;
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArgs, 0);
  objc_storeStrong((id *)&self->_managedCallback, 0);
  objc_storeStrong(&self->_ownerObject, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
