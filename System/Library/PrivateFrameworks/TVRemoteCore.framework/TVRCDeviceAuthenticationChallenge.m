@implementation TVRCDeviceAuthenticationChallenge

- (id)_initWithDeviceIdentifier:(id)a3 challengeType:(int64_t)a4 codeToEnterOnDevice:(id)a5
{
  id v8;
  id v9;
  TVRCDeviceAuthenticationChallenge *v10;
  uint64_t v11;
  NSString *deviceIdentifier;
  uint64_t v13;
  NSString *codeToEnterOnDevice;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TVRCDeviceAuthenticationChallenge;
  v10 = -[TVRCDeviceAuthenticationChallenge init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = (NSString *)v11;

    v10->_challengeType = a4;
    v13 = objc_msgSend(v9, "copy");
    codeToEnterOnDevice = v10->_codeToEnterOnDevice;
    v10->_codeToEnterOnDevice = (NSString *)v13;

  }
  return v10;
}

- (void)userEnteredCodeLocally:(id)a3
{
  id v4;
  id v5;

  if (!self->_challengeType)
  {
    v4 = a3;
    +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fulfillAuthChallengeForDeviceWithIdentifier:withLocallyEnteredCode:", self->_deviceIdentifier, v4);

  }
}

- (void)cancel
{
  id v3;

  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAuthChallengeForDeviceWithIdentifier:", self->_deviceIdentifier);

}

- (int64_t)challengeType
{
  return self->_challengeType;
}

- (int64_t)challengeAttributes
{
  return self->_challengeAttributes;
}

- (void)setChallengeAttributes:(int64_t)a3
{
  self->_challengeAttributes = a3;
}

- (int64_t)throttleSeconds
{
  return self->_throttleSeconds;
}

- (void)setThrottleSeconds:(int64_t)a3
{
  self->_throttleSeconds = a3;
}

- (NSString)codeToEnterOnDevice
{
  return self->_codeToEnterOnDevice;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_codeToEnterOnDevice, 0);
}

@end
