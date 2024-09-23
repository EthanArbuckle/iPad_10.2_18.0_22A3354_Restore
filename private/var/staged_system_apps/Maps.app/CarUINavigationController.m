@implementation CarUINavigationController

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v3 = a3;
  v4 = objc_opt_class(UITapGestureRecognizer);
  v7 = 1;
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allowedPressTypes"));
    v6 = objc_msgSend(v5, "containsObject:", &off_10126F9E8);

    if ((v6 & 1) != 0)
      v7 = 0;
  }

  return v7;
}

- (void)setNeedsFocusUpdate
{
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarUINavigationController;
  -[CarUINavigationController setNeedsFocusUpdate](&v4, "setNeedsFocusUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  objc_msgSend(v3, "setNeedsFocusUpdate");

}

- (id)preferredFocusEnvironments
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarUINavigationController;
  v3 = -[CarUINavigationController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CarUINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011D9658));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

    v4 = (void *)v6;
  }
  return v4;
}

@end
