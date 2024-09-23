@implementation SASButtonActvationRequest

- (BOOL)isVoiceRequest
{
  return 0;
}

- (BOOL)isHoldToTalkSource
{
  return 1;
}

- (BOOL)isButtonRequest
{
  return 1;
}

- (BOOL)isDeviceButtonRequest
{
  unint64_t v2;

  v2 = -[SASButtonActvationRequest buttonIdentifier](self, "buttonIdentifier");
  return (v2 < 0xA) & (0x206u >> v2);
}

- (BOOL)isTestingRequest
{
  return 0;
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int64_t)a3
{
  self->_buttonIdentifier = a3;
}

@end
