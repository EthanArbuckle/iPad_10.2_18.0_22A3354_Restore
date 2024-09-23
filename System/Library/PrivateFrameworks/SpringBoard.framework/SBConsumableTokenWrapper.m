@implementation SBConsumableTokenWrapper

+ (SBConsumableTokenWrapper)consumableTokenWrapperWithToken:(id)a3
{
  SBHardwareButtonLaunchPreludeAnimationToken *v3;
  SBConsumableTokenWrapper *v4;
  SBHardwareButtonLaunchPreludeAnimationToken *token;

  v3 = (SBHardwareButtonLaunchPreludeAnimationToken *)a3;
  v4 = objc_alloc_init(SBConsumableTokenWrapper);
  token = v4->_token;
  v4->_token = v3;

  return v4;
}

- (id)consumeToken
{
  SBHardwareButtonLaunchPreludeAnimationToken *v3;
  SBHardwareButtonLaunchPreludeAnimationToken *token;

  v3 = self->_token;
  token = self->_token;
  self->_token = 0;

  return v3;
}

- (BOOL)isTokenAvailable
{
  return self->_token != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
