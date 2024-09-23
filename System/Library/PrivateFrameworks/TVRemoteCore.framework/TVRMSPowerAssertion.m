@implementation TVRMSPowerAssertion

- (TVRMSPowerAssertion)initWithName:(id)a3
{
  id v4;
  TVRMSPowerAssertion *v5;
  const __CFDictionary *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMSPowerAssertion;
  v5 = -[TVRMSPowerAssertion init](&v9, sel_init);
  if (v5)
  {
    v12[0] = CFSTR("AssertName");
    v12[1] = CFSTR("TimeoutSeconds");
    v13[0] = v4;
    v13[1] = &unk_24DCF90B0;
    v12[2] = CFSTR("TimeoutAction");
    v12[3] = CFSTR("AssertType");
    v13[2] = CFSTR("TimeoutActionTurnOff");
    v13[3] = CFSTR("PreventUserIdleSystemSleep");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    IOPMAssertionCreateWithProperties(v6, &v5->_assertionID);
    _TVRCRMSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Power assertion created for %@", buf, 0xCu);
    }

  }
  return v5;
}

- (void)refresh
{
  IOPMAssertionSetProperty(self->_assertionID, CFSTR("TimeoutSeconds"), &unk_24DCF90B0);
}

- (void)dealloc
{
  objc_super v3;

  IOPMAssertionRelease(self->_assertionID);
  self->_assertionID = 0;
  v3.receiver = self;
  v3.super_class = (Class)TVRMSPowerAssertion;
  -[TVRMSPowerAssertion dealloc](&v3, sel_dealloc);
}

@end
