@implementation JournalPresentationLayer

- (JournalPresentationLayer)init
{
  JournalPresentationLayer *v2;
  uint64_t v3;
  NSMutableArray *pushedViewControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JournalPresentationLayer;
  v2 = -[JournalPresentationLayer init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pushedViewControllers = v2->_pushedViewControllers;
    v2->_pushedViewControllers = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  UIViewController *presentedViewController;
  id WeakRetained;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)JournalPresentationLayer;
  v3 = -[JournalPresentationLayer description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  presentedViewController = self->_presentedViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ presentedViewController = %@ presentingViewController = %@ pushedViewControllers = %@"), v4, presentedViewController, WeakRetained, self->_pushedViewControllers));

  return v7;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (NSMutableArray)pushedViewControllers
{
  return self->_pushedViewControllers;
}

- (void)setPushedViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_pushedViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushedViewControllers, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end
