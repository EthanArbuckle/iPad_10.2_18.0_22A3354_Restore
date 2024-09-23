@implementation _UIViewControllerKeyboardAnimationStyleInfo

- (void)setPreviousCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIsAnimationCompleting:(BOOL)a3
{
  self->_isAnimationCompleting = a3;
}

- (id)previousCompleteHandler
{
  return self->_previousCompleteHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previousCompleteHandler, 0);
}

- (BOOL)isAnimationCompleting
{
  return self->_isAnimationCompleting;
}

@end
