@implementation DOCTabItemPlaceholderViewController

- (id)tabBarItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCTabItemPlaceholderViewController actualViewController](self, "actualViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tabBarItem"));

  return v3;
}

- (UIViewController)actualViewController
{
  return self->_actualViewController;
}

- (void)setActualViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actualViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualViewController, 0);
}

@end
