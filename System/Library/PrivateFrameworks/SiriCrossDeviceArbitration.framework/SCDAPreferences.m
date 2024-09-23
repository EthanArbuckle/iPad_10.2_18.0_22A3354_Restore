@implementation SCDAPreferences

- (SCDAPreferences)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4
{
  id v7;
  id v8;
  SCDAPreferences *v9;
  SCDAPreferences *v10;
  SCDAAssistantPreferences *v11;
  SCDAAssistantPreferences *pref;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCDAPreferences;
  v9 = -[SCDAPreferences init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instanceContext, a3);
    if (v8)
      v11 = (SCDAAssistantPreferences *)v8;
    else
      v11 = -[SCDAAssistantPreferences initWithInstanceContext:]([SCDAAssistantPreferences alloc], "initWithInstanceContext:", v10->_instanceContext);
    pref = v10->_pref;
    v10->_pref = v11;

  }
  return v10;
}

- (void)setDeviceGroup:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4;
  SCDAAssistantPreferences *pref;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  pref = self->_pref;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDAAssistantPreferences setMyriadDeviceGroup:](pref, "setMyriadDeviceGroup:", v7);

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v4);
    v8 = v9;
  }

}

- (unsigned)deviceGroup
{
  void *v2;
  unsigned __int8 v3;

  -[SCDAAssistantPreferences myriadDeviceGroup](self->_pref, "myriadDeviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  -[SCDAAssistantPreferences setMyriadDeviceClass:](self->_pref, "setMyriadDeviceClass:", a3);
}

- (unsigned)deviceClass
{
  return -[SCDAAssistantPreferences myriadDeviceClass](self->_pref, "myriadDeviceClass");
}

- (void)setIgnoreAdjustedBoost:(BOOL)a3
{
  -[SCDAAssistantPreferences setIgnoreMyriadAdjustedBoost:](self->_pref, "setIgnoreMyriadAdjustedBoost:", a3);
}

- (BOOL)ignoreAdjustedBoost
{
  return -[SCDAAssistantPreferences myriadShouldIgnoreAdjustedBoost](self->_pref, "myriadShouldIgnoreAdjustedBoost");
}

- (void)setIgnorePlatformBias:(BOOL)a3
{
  -[SCDAAssistantPreferences setIgnoreMyriadPlatformBias:](self->_pref, "setIgnoreMyriadPlatformBias:", a3);
}

- (BOOL)ignorePlatformBias
{
  return -[SCDAAssistantPreferences ignoreMyriadPlatformBias](self->_pref, "ignoreMyriadPlatformBias");
}

- (void)setConstantGoodnessScore:(int)a3
{
  -[SCDAAssistantPreferences setMyriadConstantGoodness:](self->_pref, "setMyriadConstantGoodness:", *(_QWORD *)&a3);
}

- (int)constantGoodnessScore
{
  return -[SCDAAssistantPreferences myriadConstantGoodness](self->_pref, "myriadConstantGoodness");
}

- (BOOL)myriadServerHasProvisioned
{
  return -[SCDAAssistantPreferences myriadServerHasProvisioned](self->_pref, "myriadServerHasProvisioned");
}

- (void)setDeviceAdjust:(float)a3
{
  -[SCDAAssistantPreferences setMyriadDeviceAdjust:](self->_pref, "setMyriadDeviceAdjust:");
}

- (float)deviceAdjust
{
  float result;

  -[SCDAAssistantPreferences myriadDeviceAdjust](self->_pref, "myriadDeviceAdjust");
  return result;
}

- (void)setDeviceDelay:(double)a3
{
  -[SCDAAssistantPreferences setMyriadDeviceDelay:](self->_pref, "setMyriadDeviceDelay:", a3);
}

- (double)deviceDelay
{
  double result;

  -[SCDAAssistantPreferences myriadDeviceDelay](self->_pref, "myriadDeviceDelay");
  return result;
}

- (void)setTestDeviceDelay:(double)a3
{
  -[SCDAAssistantPreferences setMyriadTestDeviceDelay:](self->_pref, "setMyriadTestDeviceDelay:", a3);
}

- (double)testDeviceDelay
{
  double result;

  -[SCDAAssistantPreferences myriadTestDeviceDelay](self->_pref, "myriadTestDeviceDelay");
  return result;
}

- (void)setDeviceTrumpDelay:(double)a3
{
  -[SCDAAssistantPreferences setMyriadDeviceTrumpDelay:](self->_pref, "setMyriadDeviceTrumpDelay:", a3);
}

- (double)deviceTrumpDelay
{
  double result;

  -[SCDAAssistantPreferences myriadDeviceTrumpDelay](self->_pref, "myriadDeviceTrumpDelay");
  return result;
}

- (void)enableCoordination:(BOOL)a3
{
  -[SCDAAssistantPreferences setMyriadCoordinationEnabled:](self->_pref, "setMyriadCoordinationEnabled:", a3);
}

- (BOOL)coordinationEnabled
{
  return -[SCDAAssistantPreferences myriadCoordinationEnabled](self->_pref, "myriadCoordinationEnabled");
}

- (BOOL)coordinationEnabledForAccessoryLogging
{
  return -[SCDAAssistantPreferences myriadCoordinationEnabledForAccessoryLogging](self->_pref, "myriadCoordinationEnabledForAccessoryLogging");
}

- (BOOL)BLEActivityEnabled
{
  return !-[SCDAAssistantPreferences disableMyriadBLEActivity](self->_pref, "disableMyriadBLEActivity");
}

- (void)setVoiceTriggerEndtimeDelayThreshold:(double)a3
{
  -[SCDAAssistantPreferences setMyriadDeviceVTEndTimeDistanceThreshold:](self->_pref, "setMyriadDeviceVTEndTimeDistanceThreshold:", a3);
}

- (double)voiceTriggerEndtimeDelayThreshold
{
  double result;

  -[SCDAAssistantPreferences myriadDeviceVTEndTimeDistanceThreshold](self->_pref, "myriadDeviceVTEndTimeDistanceThreshold");
  return result;
}

- (void)setDeviceSlowDown:(double)a3
{
  -[SCDAAssistantPreferences setMyriadDeviceSlowdown:](self->_pref, "setMyriadDeviceSlowdown:", a3);
}

- (double)deviceSlowDown
{
  double result;

  -[SCDAAssistantPreferences myriadDeviceDelay](self->_pref, "myriadDeviceDelay");
  return result;
}

- (void)setMaxNoOperationDelay:(double)a3
{
  -[SCDAAssistantPreferences setMyriadMaxNoOperationDelay:](self->_pref, "setMyriadMaxNoOperationDelay:", a3);
}

- (double)maxNoOperationDelay
{
  double result;

  -[SCDAAssistantPreferences myriadMaxNoOperationDelay](self->_pref, "myriadMaxNoOperationDelay");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

@end
