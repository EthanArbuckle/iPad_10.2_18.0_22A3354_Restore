@implementation UIViewController

- (id)tui_effectiveSyncLayoutController
{
  UIViewController *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  UIViewController *v9;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      v3 = TUIProtocolCast(&OBJC_PROTOCOL___TUISyncLayoutControllerHosting, v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncLayoutController"));

      if (v5)
        break;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v2, "parentViewController"));
      v7 = v6;
      if (v6)
        v8 = v6;
      else
        v8 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v2, "presentingViewController"));
      v9 = v8;

      v2 = v9;
      if (!v9)
      {
        v5 = 0;
        v2 = 0;
        break;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
