@implementation UINavigationController

- (id)mf_viewControllerBefore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1001E518C;
  v18 = sub_1001E519C;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003A828;
  v10[3] = &unk_100523B50;
  v6 = v4;
  v12 = v5;
  v13 = &v14;
  v11 = v6;
  v7 = v5;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)isPopping
{
  return -[UINavigationController lastOperation](self, "lastOperation") == (id)2;
}

- (void)configureBarsForMessageList
{
  id v3;

  -[UINavigationController setToolbarHidden:](self, "setToolbarHidden:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v3, "setPrefersLargeTitles:", 1);

}

- (BOOL)canResignFocus
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  v3 = objc_msgSend(v2, "canResignFocus");

  return v3;
}

- (void)willBecomeFocused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "willBecomeFocused:", v3);

}

- (void)didBecomeFocused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "didBecomeFocused:", v3);

}

- (void)willResignFocus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "willResignFocus:", v3);

}

- (void)didResignFocus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "didResignFocus:", v3);

}

- (void)willBecomeDimmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "willBecomeDimmed:", v3);

}

- (void)didBecomeDimmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "didBecomeDimmed:", v3);

}

- (void)willResignDimmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "willResignDimmed:", v3);

}

- (void)didResignDimmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "didResignDimmed:", v3);

}

- (BOOL)canDismiss
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  v3 = objc_msgSend(v2, "canDismiss");

  return v3;
}

- (void)willDismiss:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "willDismiss:", v3);

}

- (void)didDismiss:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  objc_msgSend(v4, "didDismiss:", v3);

}

- (BOOL)shouldSnapshot
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController visibleViewController](self, "visibleViewController"));
  v3 = objc_msgSend(v2, "shouldSnapshot");

  return v3;
}

@end
