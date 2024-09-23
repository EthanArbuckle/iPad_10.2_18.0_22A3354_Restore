@implementation SBInvalidateItemContainerBackdropEventResponse

- (SBInvalidateItemContainerBackdropEventResponse)initWithUpdateMode:(int64_t)a3
{
  SBInvalidateItemContainerBackdropEventResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBInvalidateItemContainerBackdropEventResponse;
  result = -[SBChainableModifierEventResponse init](&v5, sel_init);
  if (result)
    result->_updateMode = a3;
  return result;
}

- (int64_t)type
{
  return 30;
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

@end
