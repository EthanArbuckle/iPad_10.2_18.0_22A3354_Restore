@implementation BKDirectTouchStateHitTester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, 0);
}

- (void)invalidate
{
  BKDirectTouchState *state;
  BKHIDDirectTouchEventProcessor *eventProcessor;
  BKDirectTouchPerDisplayInfo *displayInfo;
  BKTouchDeliveryPolicyServer *touchDeliveryPolicyServer;

  state = self->_state;
  if (state)
  {
    self->_state = 0;

    eventProcessor = self->_eventProcessor;
    self->_eventProcessor = 0;

    displayInfo = self->_displayInfo;
    self->_displayInfo = 0;

    touchDeliveryPolicyServer = self->_touchDeliveryPolicyServer;
    self->_touchDeliveryPolicyServer = 0;

  }
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKDirectTouchStateHitTester *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (self->_state)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must invoke -invalidate")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKDirectTouchHitTesting.mm");
      v20 = 1024;
      v21 = 71;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10001A57CLL);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKDirectTouchStateHitTester;
  -[BKDirectTouchStateHitTester dealloc](&v11, "dealloc");
}

@end
