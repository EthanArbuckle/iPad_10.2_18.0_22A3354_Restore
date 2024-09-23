@implementation JSATimer

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_onTimeoutManagedValue, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualMachine"));
  objc_msgSend(v5, "removeManagedReference:withOwner:", self->_onTimeoutManagedValue, self);

  v6.receiver = self;
  v6.super_class = (Class)JSATimer;
  -[JSATimer dealloc](&v6, "dealloc");
}

- (void)schedule
{
  NSObject *v3;
  NSNumber *delay;
  double v5;
  dispatch_time_t v6;
  uint64_t v7;
  _QWORD handler[5];

  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  -[JSATimer setSource:](self, "setSource:", v3);
  delay = self->_delay;
  if (!delay)
  {
    self->_delay = (NSNumber *)&off_A5B90;

    delay = self->_delay;
  }
  -[NSNumber doubleValue](delay, "doubleValue");
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_source_set_timer(v3, v6, v7, 0x5F5E100uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_13200;
  handler[3] = &unk_9DCA8;
  handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(v3);

}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSATimer source](self, "source"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[JSATimer source](self, "source"));
    dispatch_source_cancel(v4);

    -[JSATimer setSource:](self, "setSource:", 0);
  }
}

- (JSValue)onTimeout
{
  return -[JSManagedValue value](self->_onTimeoutManagedValue, "value");
}

- (void)setOnTimeout:(id)a3
{
  JSManagedValue *onTimeoutManagedValue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  JSManagedValue *v9;
  JSManagedValue *v10;

  onTimeoutManagedValue = self->_onTimeoutManagedValue;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](onTimeoutManagedValue, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "virtualMachine"));
  objc_msgSend(v8, "removeManagedReference:withOwner:", self->_onTimeoutManagedValue, self);

  v9 = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:andOwner:](JSManagedValue, "managedValueWithValue:andOwner:", v5, self));
  v10 = self->_onTimeoutManagedValue;
  self->_onTimeoutManagedValue = v9;

}

- (NSNumber)delay
{
  return self->_delay;
}

- (void)setDelay:(id)a3
{
  objc_storeStrong((id *)&self->_delay, a3);
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (JSManagedValue)onTimeoutManagedValue
{
  return self->_onTimeoutManagedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onTimeoutManagedValue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_delay, 0);
}

@end
