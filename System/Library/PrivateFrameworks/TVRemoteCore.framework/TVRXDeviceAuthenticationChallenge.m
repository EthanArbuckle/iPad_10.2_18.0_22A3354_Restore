@implementation TVRXDeviceAuthenticationChallenge

+ (id)_challengeWithCodeToEnterOnDevice:(id)a3 cancellationHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = -[TVRXDeviceAuthenticationChallenge _init]([TVRXDeviceAuthenticationChallenge alloc], "_init");
  v7[3] = 1;
  v8 = objc_msgSend(v5, "copy");

  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = objc_msgSend(v6, "copy");
  v11 = (void *)v7[6];
  v7[6] = v10;

  v7[5] = -1;
  return v7;
}

+ (id)_challengeWithCodeToEnterLocally:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = -[TVRXDeviceAuthenticationChallenge _init]([TVRXDeviceAuthenticationChallenge alloc], "_init");
  v4[3] = 0;
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[1];
  v4[1] = v5;

  *((_OWORD *)v4 + 2) = xmmword_21A5D5120;
  return v4;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRXDeviceAuthenticationChallenge;
  return -[TVRXDeviceAuthenticationChallenge init](&v3, sel_init);
}

- (void)userEnteredCodeLocally:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void (**continuation)(id, id, _QWORD);
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_challengeType)
  {
    _TVRCGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ is invalid for this challenge type.", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    continuation = (void (**)(id, id, _QWORD))self->_continuation;
    if (continuation)
      continuation[2](continuation, v5, 0);
  }

}

- (void)cancel
{
  int64_t challengeType;
  void (**continuation)(id, _QWORD, uint64_t);
  void (**cancellationHandler)(void);

  challengeType = self->_challengeType;
  if (challengeType == 1)
  {
    cancellationHandler = (void (**)(void))self->_cancellationHandler;
    if (cancellationHandler)
      cancellationHandler[2]();
  }
  else if (!challengeType)
  {
    continuation = (void (**)(id, _QWORD, uint64_t))self->_continuation;
    if (continuation)
      continuation[2](continuation, 0, 1);
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeToEnterOnDevice, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong(&self->_continuation, 0);
}

@end
