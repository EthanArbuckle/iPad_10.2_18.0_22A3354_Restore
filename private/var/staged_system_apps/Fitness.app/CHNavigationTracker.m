@implementation CHNavigationTracker

- (CHNavigationTracker)initWithTabBarController:(id)a3 fitnessAppContext:(id)a4
{
  id v7;
  id v8;
  CHNavigationTracker *v9;
  CHNavigationTracker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHNavigationTracker;
  v9 = -[CHNavigationTracker init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabBarController, a3);
    -[UITabBarController setDelegate:](v10->_tabBarController, "setDelegate:", v10);
    v10->_tabIndexBeingDeselected = -1;
    objc_storeStrong((id *)&v10->_fitnessAppContext, a4);
  }

  return v10;
}

- (id)_viewControllerAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (a3 < 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController viewControllers](self->_tabBarController, "viewControllers")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        (unint64_t)v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController viewControllers](self->_tabBarController, "viewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "selectedIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));

  v10 = objc_msgSend(v9, "indexOfObject:", v6);
  if (v8 == v10 && (objc_opt_respondsToSelector(v6, "scrollToTop") & 1) != 0)
    objc_msgSend(v6, "performSelector:", "scrollToTop");
  self->_tabIndexBeingDeselected = (int64_t)v8;

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  int64_t tabIndexBeingDeselected;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v6 = a4;
  tabIndexBeingDeselected = self->_tabIndexBeingDeselected;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewControllers"));
  v9 = objc_msgSend(v8, "indexOfObject:", v6);

  _HKInitializeLogging(v10, v11);
  v12 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CHNav] Tab index selected: %ld", (uint8_t *)&v18, 0xCu);
  }
  if ((id)tabIndexBeingDeselected == v9)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourNavigationController](self->_fitnessAppContext, "seymourNavigationController"));
    if (v13 == v6)
      -[CHFitnessAppContext seymourTabSelectedWithSelection:](self->_fitnessAppContext, "seymourTabSelectedWithSelection:", 2);
  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[CHNavigationTracker _viewControllerAtIndex:](self, "_viewControllerAtIndex:", tabIndexBeingDeselected));
    v14 = objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourNavigationController](self->_fitnessAppContext, "seymourNavigationController"));
    v15 = (void *)v14;
    if ((id)v14 == v6)
    {
      -[CHFitnessAppContext seymourTabSelectedWithSelection:](self->_fitnessAppContext, "seymourTabSelectedWithSelection:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[DiscoverySheetConstants hasVisitedSeymourTabKey](_TtC10FitnessApp23DiscoverySheetConstants, "hasVisitedSeymourTabKey"));
      objc_msgSend(v16, "setBool:forKey:", 1, v17);

    }
    else if ((id)v14 == v13)
    {
      -[CHFitnessAppContext seymourTabDeselected](self->_fitnessAppContext, "seymourTabDeselected");
    }

  }
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
}

@end
