@implementation SPUINavigationSwipeRecognizerDelegate

- (SPUINavigationSwipeRecognizerDelegate)initWithNavigationController:(id)a3
{
  id v4;
  SPUINavigationSwipeRecognizerDelegate *v5;
  SPUINavigationSwipeRecognizerDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPUINavigationSwipeRecognizerDelegate;
  v5 = -[SPUINavigationSwipeRecognizerDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SPUINavigationSwipeRecognizerDelegate setNavigationController:](v5, "setNavigationController:", v4);

  return v6;
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SPUINavigationSwipeRecognizerDelegate navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
}

@end
