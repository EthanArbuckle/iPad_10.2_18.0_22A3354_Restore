@implementation SBUpdateContinuousExposeStripsPresentationResponse

- (SBUpdateContinuousExposeStripsPresentationResponse)initWithPresentationOptions:(unint64_t)a3 dismissalOptions:(unint64_t)a4
{
  SBUpdateContinuousExposeStripsPresentationResponse *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUpdateContinuousExposeStripsPresentationResponse;
  result = -[SBChainableModifierEventResponse init](&v7, sel_init);
  if (result)
  {
    result->_presentationOptions = a3;
    result->_dismissalOptions = a4;
  }
  return result;
}

- (int64_t)type
{
  return 33;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (unint64_t)dismissalOptions
{
  return self->_dismissalOptions;
}

@end
