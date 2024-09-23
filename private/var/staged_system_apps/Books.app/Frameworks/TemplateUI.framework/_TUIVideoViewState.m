@implementation _TUIVideoViewState

- (_TUIVideoViewState)initWithMuteState:(BOOL)a3
{
  _TUIVideoViewState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TUIVideoViewState;
  result = -[_TUIVideoViewState init](&v5, "init");
  if (result)
    result->_muted = a3;
  return result;
}

- (BOOL)muted
{
  return self->_muted;
}

@end
