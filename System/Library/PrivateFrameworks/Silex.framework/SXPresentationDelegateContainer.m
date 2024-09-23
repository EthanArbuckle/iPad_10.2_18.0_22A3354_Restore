@implementation SXPresentationDelegateContainer

- (void)registerPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (SXPresentationDelegate)presentationDelegate
{
  return (SXPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
