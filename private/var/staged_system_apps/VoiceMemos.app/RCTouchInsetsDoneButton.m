@implementation RCTouchInsetsDoneButton

- (void)_commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCTouchInsetsDoneButton;
  -[RCTouchInsetsButton _commonInit](&v3, "_commonInit");
  self->_enabledState = 0;
}

- (int64_t)enabledState
{
  return self->_enabledState;
}

@end
