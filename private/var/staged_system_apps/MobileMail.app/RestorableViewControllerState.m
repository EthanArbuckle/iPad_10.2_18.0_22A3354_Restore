@implementation RestorableViewControllerState

- (RestorableViewControllerState)initWithRestorableViewController:(id)a3
{
  id v4;
  RestorableViewControllerState *v5;
  uint64_t v6;
  NSUserActivity *storedUserActivity;
  uint64_t v8;
  uint64_t v9;
  Class storedViewControllerClass;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RestorableViewControllerState;
  v5 = -[RestorableViewControllerState init](&v12, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivityForRestoration"));
    storedUserActivity = v5->_storedUserActivity;
    v5->_storedUserActivity = (NSUserActivity *)v6;

    v8 = objc_opt_class(v4);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    storedViewControllerClass = v5->_storedViewControllerClass;
    v5->_storedViewControllerClass = (Class)v9;

  }
  return v5;
}

- (RestorableViewControllerState)initWithUserActivity:(id)a3 viewControllerClass:(Class)a4
{
  id v7;
  RestorableViewControllerState *v8;
  RestorableViewControllerState *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RestorableViewControllerState;
  v8 = -[RestorableViewControllerState init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storedViewControllerClass, a4);
    objc_storeStrong((id *)&v9->_storedUserActivity, a3);
  }

  return v9;
}

- (id)restoreViewControllerWithScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc(-[RestorableViewControllerState storedViewControllerClass](self, "storedViewControllerClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestorableViewControllerState storedUserActivity](self, "storedUserActivity"));
  v7 = objc_msgSend(v5, "initWithUserActivity:scene:", v6, v4);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RestorableViewControllerState)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSString *v8;
  Class v9;
  RestorableViewControllerState *v10;
  Class v11;
  RestorableViewControllerState *v12;
  NSUserActivity *v13;
  NSUserActivity *storedUserActivity;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("kStoredActivityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("kStoredViewControllerClassName"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSClassFromString(v8);
  v10 = 0;
  if (v6)
  {
    v11 = v9;
    if (v9)
    {
      v20.receiver = self;
      v20.super_class = (Class)RestorableViewControllerState;
      v12 = -[RestorableViewControllerState init](&v20, "init");
      if (v12)
      {
        v13 = (NSUserActivity *)objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", v6);
        storedUserActivity = v12->_storedUserActivity;
        v12->_storedUserActivity = v13;

        v15 = objc_opt_class(NSString);
        v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(NSDictionary), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("kStoredActivityInfo")));
        -[NSUserActivity setUserInfo:](v12->_storedUserActivity, "setUserInfo:", v18);

        objc_storeStrong((id *)&v12->_storedViewControllerClass, v11);
      }
      self = v12;
      v10 = self;
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestorableViewControllerState storedUserActivity](self, "storedUserActivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("kStoredActivityType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestorableViewControllerState storedUserActivity](self, "storedUserActivity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("kStoredActivityInfo"));

  v8 = NSStringFromClass(-[RestorableViewControllerState storedViewControllerClass](self, "storedViewControllerClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("kStoredViewControllerClassName"));

}

- (NSUserActivity)storedUserActivity
{
  return self->_storedUserActivity;
}

- (void)setStoredUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_storedUserActivity, a3);
}

- (Class)storedViewControllerClass
{
  return self->_storedViewControllerClass;
}

- (void)setStoredViewControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_storedViewControllerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedViewControllerClass, 0);
  objc_storeStrong((id *)&self->_storedUserActivity, 0);
}

@end
