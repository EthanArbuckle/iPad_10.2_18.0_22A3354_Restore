@implementation CLStatusBarAssertion

+ (BOOL)isStatusBarAssertionAvailable
{
  return objc_opt_class(SBSStatusBarStyleOverridesAssertion, a2) != 0;
}

- (CLStatusBarAssertion)initWithPid:(int)a3 name:(id)a4 queue:(id)a5 backgrounded:(BOOL)a6 registration:(int)a7
{
  CLStatusBarAssertion *v13;
  CLStatusBarAssertion *v14;
  objc_super v16;

  if (+[CLStatusBarAssertion isStatusBarAssertionAvailable](CLStatusBarAssertion, "isStatusBarAssertionAvailable"))
  {
    v16.receiver = self;
    v16.super_class = (Class)CLStatusBarAssertion;
    v13 = -[CLStatusBarAssertion init](&v16, "init");
    v14 = v13;
    if (v13)
    {
      v13->_assertion = 0;
      v13->_pid = a3;
      v13->_name = (NSString *)objc_msgSend(a4, "copy");
      v14->_queue = (OS_dispatch_queue *)a5;
      v14->_startedInBackground = a6;
      v14->_everBackgrounded = a6;
      v14->_backgrounded = a6;
      v14->_registration = a7;
    }
  }
  else
  {

    return 0;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_assertion)
    sub_10190E9D0();

  v3.receiver = self;
  v3.super_class = (Class)CLStatusBarAssertion;
  -[CLStatusBarAssertion dealloc](&v3, "dealloc");
}

- (void)invalidate:(int)a3
{
  _QWORD v4[2];
  _QWORD v5[2];

  v4[1] = CFSTR("Pid");
  v5[0] = &__kCFBooleanFalse;
  v4[0] = CFSTR("Status");
  v5[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid);
  sub_10019E128((uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2), (uint64_t)"StatusBarOverride");
  -[SBSStatusBarStyleOverridesAssertion invalidate](self->_assertion, "invalidate");

  self->_assertion = 0;
}

- (void)setDesiredEnablementState:(BOOL)a3
{
  SBSStatusBarStyleOverridesAssertion *assertion;
  SBSStatusBarStyleOverridesAssertion *v5;
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[2];

  assertion = self->_assertion;
  if (a3)
  {
    if (!assertion)
    {
      v5 = (SBSStatusBarStyleOverridesAssertion *)+[SBSStatusBarStyleOverridesAssertion backgroundLocationAssertionForPID:](SBSStatusBarStyleOverridesAssertion, "backgroundLocationAssertionForPID:", self->_pid);
      self->_assertion = v5;
      if (!v5)
        sub_10190EB3C();
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100902DF8;
      v6[3] = &unk_102142CC0;
      v6[4] = self;
      -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:onQueue:](v5, "acquireWithHandler:onQueue:", v6, self->_queue);
    }
  }
  else if (assertion)
  {
    v8[0] = &__kCFBooleanFalse;
    v7[0] = CFSTR("Status");
    v7[1] = CFSTR("Pid");
    v8[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid);
    sub_10019E128((uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2), (uint64_t)"StatusBarOverride");
    -[SBSStatusBarStyleOverridesAssertion invalidate](self->_assertion, "invalidate");

    self->_assertion = 0;
  }
}

- (BOOL)isEnabled
{
  return self->_assertion != 0;
}

- (void)setBackgrounded:(BOOL)a3
{
  if (a3)
    self->_everBackgrounded = 1;
  self->_backgrounded = a3;
}

- (BOOL)isMetricValid
{
  return self->_metricValid;
}

@end
