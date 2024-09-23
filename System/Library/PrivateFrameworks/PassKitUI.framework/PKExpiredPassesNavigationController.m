@implementation PKExpiredPassesNavigationController

- (PKExpiredPassesNavigationController)init
{
  return -[PKExpiredPassesNavigationController initWithExistingGroupsController:delegate:](self, "initWithExistingGroupsController:delegate:", 0, 0);
}

- (PKExpiredPassesNavigationController)initWithExistingGroupsController:(id)a3
{
  return -[PKExpiredPassesNavigationController initWithExistingGroupsController:delegate:](self, "initWithExistingGroupsController:delegate:", a3, 0);
}

- (PKExpiredPassesNavigationController)initWithExistingGroupsController:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKExpiredPassesNavigationController *v8;
  PKExpiredPassesViewController *v9;
  PKExpiredPassesViewController *expiredPassesViewController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKExpiredPassesNavigationController;
  v8 = -[PKNavigationController init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PKExpiredPassesViewController initWithExistingGroupsController:delegate:]([PKExpiredPassesViewController alloc], "initWithExistingGroupsController:delegate:", v6, v7);
    expiredPassesViewController = v8->_expiredPassesViewController;
    v8->_expiredPassesViewController = v9;

    -[PKExpiredPassesNavigationController pushViewController:animated:](v8, "pushViewController:animated:", v8->_expiredPassesViewController, 0);
  }

  return v8;
}

- (PKExpiredPassesViewController)expiredPassesViewController
{
  return self->_expiredPassesViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiredPassesViewController, 0);
}

@end
