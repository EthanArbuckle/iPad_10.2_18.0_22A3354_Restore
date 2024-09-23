@implementation BFFNavigationObserver

+ (id)observerWithObserver:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObserver:", v3);

  return v4;
}

- (BFFNavigationControllerDelegate)observer
{
  return (BFFNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
