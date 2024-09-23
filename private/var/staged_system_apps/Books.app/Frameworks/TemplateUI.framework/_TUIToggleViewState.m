@implementation _TUIToggleViewState

- (_TUIToggleViewState)initWithIsOn:(BOOL)a3
{
  _TUIToggleViewState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TUIToggleViewState;
  result = -[_TUIToggleViewState init](&v5, "init");
  if (result)
    result->_isOn = a3;
  return result;
}

- (BOOL)isOn
{
  return self->_isOn;
}

@end
