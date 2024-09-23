@implementation PackagePowerCC

- (PackagePowerCC)initWithParams:(__CFDictionary *)a3
{
  PackagePowerCC *v4;
  PackagePowerCC *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PackagePowerCC;
  v4 = -[ComponentControl initWithCC::](&v8, "initWithCC::", 13, 0);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d PackagePower "), 13);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    *(&v5->super.currentPower + 1) = objc_msgSend((id)qword_1000A2E38, "requestListID");
    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (LOBYTE(v5->super._minPower))
    {
      objc_msgSend((id)qword_1000A2E38, "setMaxPackagePower:", v5->super._nominalPowerTarget);
      -[ComponentControl setPowerTarget:](v5, "setPowerTarget:", v5->super.releaseRate);
    }
    else
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050B10(v6);
    }
    if (sub_100034168(a3, CFSTR("expectsCPMSSupport"), 0))
    {
      objc_msgSend((id)qword_1000A2E38, "setCPMSMitigationsEnabled:", 1);
      -[ComponentControl setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1);
    }
    objc_msgSend((id)qword_1000A2E38, "setPackagePowerCeiling:fromDecisionSource:", -[ComponentControl powerTarget](v5, "powerTarget"), *(&v5->super.currentPower + 1));
    objc_msgSend((id)qword_1000A2E38, "updatePackage");
  }
  return v5;
}

- (void)defaultAction
{
  -[PackagePowerCC updatePowerTarget](self, "updatePowerTarget");
}

- (void)defaultCPMSAction
{
  -[PackagePowerCC updatePowerTarget](self, "updatePowerTarget");
}

- (void)updatePowerTarget
{
  NSObject *v3;
  _DWORD v4[2];

  -[ComponentControl setPowerTarget:](self, "setPowerTarget:", -[ComponentControl computePowerTarget](self, "computePowerTarget"));
  if (byte_1000A2480)
  {
    v3 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[ComponentControl powerTarget](self, "powerTarget");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> Updating PackagePower target: %u", (uint8_t *)v4, 8u);
    }
  }
  objc_msgSend((id)qword_1000A2E38, "setPackagePowerCeiling:fromDecisionSource:", -[ComponentControl powerTarget](self, "powerTarget"), *(&self->super.currentPower + 1));
  objc_msgSend((id)qword_1000A2E38, "updatePackage");
}

@end
