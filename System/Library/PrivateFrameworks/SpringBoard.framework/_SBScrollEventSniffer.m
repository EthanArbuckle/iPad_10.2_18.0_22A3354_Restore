@implementation _SBScrollEventSniffer

- (void)handleEvent:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "type") == 10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventSnifferHandledQualifyingScroll:", self);

  }
}

- (_SBScrollEventSnifferDelegate)delegate
{
  return (_SBScrollEventSnifferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
