@implementation SCPowerAssertion

- (SCPowerAssertion)initWithName:(id)a3
{
  __CFString *v5;
  SCPowerAssertion *v6;
  NSObject *v7;
  IOReturn v8;
  int v9;
  NSObject *v10;
  SCPowerAssertion *v11;
  objc_super v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SCPowerAssertion;
  v6 = -[SCPowerAssertion init](&v13, sel_init);
  if (v6)
  {
    sc_get_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_2457F9000, v7, OS_LOG_TYPE_DEFAULT, "creating %{public}@ power assertion", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_name, a3);
    v8 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), v5, CFSTR("keeping AP awake for Scandium"), 0, 0, 300.0, CFSTR("TimeoutActionTurnOff"), &v6->_powerAssertion);
    if (v8)
    {
      v9 = v8;
      sc_get_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[SCPowerAssertion initWithName:].cold.1(v9, v10);

      v11 = 0;
      v6->_powerAssertion = 0;
    }
    else
    {
      v11 = v6;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *name;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_powerAssertion)
  {
    sc_get_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138543362;
      v7 = name;
      _os_log_impl(&dword_2457F9000, v3, OS_LOG_TYPE_DEFAULT, "releasing %{public}@ power assertion", buf, 0xCu);
    }

    IOPMAssertionRelease(self->_powerAssertion);
  }
  v5.receiver = self;
  v5.super_class = (Class)SCPowerAssertion;
  -[SCPowerAssertion dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_2457F9000, a2, OS_LOG_TYPE_FAULT, "failed to create power assertion: 0x%x", (uint8_t *)v2, 8u);
}

@end
