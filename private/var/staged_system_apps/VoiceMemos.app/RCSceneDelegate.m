@implementation RCSceneDelegate

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a6;
  if ((objc_msgSend(v8, "isInAndromeda") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
    v9 = objc_msgSend(v10, "isInAndromeda");

  }
  if (objc_msgSend(v8, "isInAndromeda"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
    v12 = objc_msgSend(v11, "isInAndromeda") ^ 1;

  }
  else
  {
    v12 = 0;
  }
  if ((v9 | v12) == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate recorderAppDelegate](self, "recorderAppDelegate"));
    objc_msgSend(v13, "reconcileApplicationState");

  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)isInForeground
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = objc_msgSend(v3, "activationState") == 0;

  return v4;
}

- (BOOL)isInAndromeda
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "isInAndromeda");

  return v5;
}

- (id)recorderAppDelegate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v5 = objc_opt_class(RecorderAppDelegate, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
